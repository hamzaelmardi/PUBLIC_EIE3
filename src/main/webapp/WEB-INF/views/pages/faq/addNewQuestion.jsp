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
                <h1 class="text-success mt-4 mb-4"><spring:message code="label.AjouteruneQuestion"/></h1>
            </div>
        </div>




            <div class="row justify-content-center mt-4 mb-4">
                <div class="col-6">
                   <div class="form-group">
                       <label>
                           <spring:message code="label.TitredelaQuestion"/>
                       </label>
                       <input type="hidden" class="form-control" name="id_question" id="id_question" value="${question.id_question}">
                       <input type="text" class="form-control" name="titre" id="titre" value="${question.titre}">
                   </div>

                    <div class="form-group">
                        <label>
                            <spring:message code="label.Descriptiondelaquestion"/>
                        </label>
                        <textarea rows="4" class="form-control" id="desc" name="desc">${question.description}</textarea>
                    </div>
                </div>
            </div>
        <div class="row justify-content-center mb-5">
            <div class="col-sm-6 text-right">
                <a href="/faq" class="btn btn-danger"><spring:message code="label.Annuler"/></a>
                <button class="btn btn-success" onclick="add_faq()"><spring:message code="label.Sauvegarder"/></button>
            </div>
        </div>







    </div>

</div>

<script>
    function add_faq(){
        var id = $("#id_question").val();
        var titre =  $("#titre").val();
        var desc =  $("#desc").val();
        id=id==""?0:id;
        var question = {
            "id_question":id,
            "titre":titre,
            "description":desc,
        }

        $.ajax({
            url: '/savenewquestions',
            type: 'POST',
            contentType : 'application/json; charset=utf-8',
            data : JSON.stringify(question),
        })
            .done(function(data) {
                window.location.href="/faq";
            })
            .fail(function() {
               alert("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
</script>

<jsp:include page="../../includes/footer1.jsp"/>
