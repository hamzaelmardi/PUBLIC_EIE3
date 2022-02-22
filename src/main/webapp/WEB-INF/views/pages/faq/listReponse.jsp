<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>

<style>
    .bg_reponse{
        background: #5cffa499;
    }
    .plr_10{
        padding-left: 10px;
        padding-right: 10px;
        font-size: 14px;
    }
    .mt_cont{
        margin-top: 140px;
    }
    @media screen and (max-width: 992px) {
        .mt_cont{
            margin-top: 190px;
        }
    }
    @media screen and (max-width: 650px) {
        .mt_cont{
            margin-top: 250px;
        }
    }
</style>
<div class="container-fluid mt_cont">
    <div class="card">
        <div class="row justify-content-center">
            <div class="col-md-10 col-sm-10 text-center">
                <h1 class="text-success mt-4 mb-4"><spring:message code="label.Questionsfrequentes"/></h1>
            </div>
        </div>


        <div id="zone_Question">
            <div class="row justify-content-center mt-4 mb-4">
                <div class="col-10">
                    <div class="row mb-4">
                        <div class="col-auto">
                            <a class="btn btn-success" href="/faq"><spring:message code="label.Retourauxquestions"/></a>
                            <button class="btn btn-success" onclick="scroll_form()"><spring:message code="label.Ajouterunereponse"/></button>
                        </div>
                    </div>
                    <div class="row p-0 m-0 bg-light rounded">
                        <div class="col-sm-12">
                            <h2 class="text-underline">${q.titre}</h2>
                            <p>${q.description}</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div id="zone_Reponse">
            <div class="row justify-content-center">
                <c:forEach items="${reponse}" var="rep">
                    <div class="col-10 mt-3 ">
                        <div class="row p-0 m-0 justify-content-end ">
                            <div class="col-11 bg_reponse rounded p-3">
                                <div class="row p-0 m-0">
                                    <div class="col-sm-6 col-md-6 text-left m-0 p-0">
                                        <h6><i><spring:message code="label.Date"/> : ${rep.date_pub}</i></h6>
                                        <h6><i><spring:message code="label.Heure"/> : ${rep.heur_pub}</i></h6>
                                    </div>
                                    <div class="col-sm-6 col-md-6 text-right p-0 m-0">
                                        <%--<c:if test="${q.compte.compteId==user.compteId}">
                                            <button onclick="edit_reponse(${rep.id_reponse})" class="btn btn-primary plr_10"><span class="fa fa-pen"></span></button>
                                            <a class="btn btn-danger" href="/deletereponse/${q.id_question}/${rep.id_reponse}" ><span class="fa fa-times"></span></a>
                                        </c:if>--%>
                                    </div>
                                </div>

                                <p class="text-justify">
                                    ${rep.description}
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
           <%-- <div class="row justify-content-center">
                <div class="col-10 mt-5 ">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>--%>
        </div>

        <div id="form_add">
            <div class="row justify-content-center">
                <div class="col-10 mb-5">
                    <div class="row justify-content-end">
                        <div class="col-11">
                            <div class="form-group">
                                <label for="reponse"><spring:message code="label.Reponse"/> </label>
                                <input type="hidden" id="id_question" value="${q.id_question}">
                                <input type="hidden" id="id_rep" value="">
                                <textarea name="reponse" id="reponse" rows="4" class="form-control"></textarea>
                            </div>
                            <div class="text-right">
                                <button class="btn btn-success" onclick="ajouter_reponse()"><spring:message code="label.Ajouter"/></button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

</div>


<script>
function scroll_form(){
    $([document.documentElement, document.body]).animate({
        scrollTop: $("#form_add").offset().top
    }, 1000);
}
function ajouter_reponse(){
    var id=$("#id_question").val();
    var id_rep = $("#id_rep").val();
    var desc = $("#reponse").val();

    id_rep=id_rep==""?"0":id_rep;
    if(id==""){
        return false;
    }

    var r = {
        "id_reponse" : id_rep,
        "description" : desc,
    }

    $.ajax({
        url: '/AjouterRponse/'+id,
        type: 'POST',
        contentType : 'application/json; charset=utf-8',
        data : JSON.stringify(r),
    })
        .done(function(data) {
            if(data=="ok"){
                window.location.href="/getListReponse/"+id;
            }
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });
}

function edit_reponse(val){
    $.get('/getReponseById/'+val, function(data) {
        $("#reponse").val(data.reponse.description);
        $("#id_rep").val(val);
    });



    scroll_form();
}
</script>

<jsp:include page="../../includes/footer1.jsp"/>
