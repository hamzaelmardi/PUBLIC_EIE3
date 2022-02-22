<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>

<style>
<c:if test="${pageContext.response.locale=='ar'}">
.select2-results__option{
direction:rtl;
text-align:right !important;


}
</c:if>
    .my_style{
        font-size: 12px;
        background: aqua;
        padding: 6px 14px;
        line-height: 32px;
        border-radius: 15px;
    }
    .mt_cont{
        margin-top: 140px;
    }
    .e_a{
        cursor: unset;
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
<div class="container-fluid mt_cont mt-2 row" style="margin-top:13rem !important">
<div class="col-md-2 col-sm-2 col-lg-2">
 </div>
 <div class="col-md-8 col-sm-8 col-lg-8 ">
    <div class="card">
        <div class="row justify-content-center">
            <div class="col-md-10 col-sm-10 text-center">
                <h1 class="text-success mt-4 mb-4"><spring:message code="label.Contact"/></h1>
            </div>
        </div>
        <form id="formContact" name="formContact">
            <div id="zone_message">
                <div class="row justify-content-center mb-4 p-4">
                    <div class="col-sm-12 col-md-5 pl-4 pr-4 pt-0">
                        <div class="row p-0 m-0">
                            <div class="col-sm-12 col-md-6 pl-0 pr-1">
                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <label for="type" ><spring:message code="label.nom"/></label>
                                    <input type="text" id="nom_contact" name="nom_contact" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 pl-1 pr-0">
                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <label for="type"><spring:message code="label.prenom"/></label>
                                    <input type="text" id="prenom_contact" name="prenom_contact" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <label for="object"><spring:message code="label.tel"/></label>
                            <input type="tel" id="telephone_contact" name="telephone_contact" class="form-control">
                            <div id="telephone"></div>
                        </div>
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <label for="object"><spring:message code="label.email"/></label>
                            <input type="email" id="email_contact" name="email_contact" class="form-control">
                            <div id="mail"></div>
                        </div>
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <label for="object"><spring:message code="label.objet"/></label>
                            <input type="text" id="object" name="object" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-5 pl-4 pr-4 pt-0">
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <label for="type"><spring:message code="label.Typededemande"/></label>
                            <select  class="form-control select2" id="type" name="type" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                                <option dir="rtl" value=""><spring:message code="option.Selectionner"/></option>
                                <option value="1" ><spring:message code="option.Autorisationdesdechets"/></option>
                                <option value="2"><spring:message code="option.EvaluationEnvironnementale"/></option>
                            </select>
                        </div>
                        <div class="form-group"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <label for="message"><spring:message code="label.Message"/></label>
                            <textarea rows="8" class="form-control" id="message" ></textarea>
                        </div>
                        <div class="col-sm-12 col-md-12 text-right pr-0">
                            <a class="btn btn-success" onclick="send_message(this)"><spring:message code="button.Envoyer"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
 </div>
    <div class="col-md-2 col-sm-2 col-lg-2">
 </div>

</div>


<script>
    function rech(){
        window.location.href="/api/rechercherQuestion/"+$("#rech").val();
    }


    function go_link(url){
        window.location.href=url;
    }

    function send_message(val){
        var mesg = $("#message").val();
        var obj = $("#object").val();
        var type = $("#type").val();
        var nom = $("#nom_contact").val();
        var pren = $("#prenom_contact").val();
        var email = $("#email_contact").val();
        var tel = $("#telephone_contact").val();

        var msg = {
            "typemsg":type,
            "sujet":obj,
            "message":mesg,
            "email":email,
            "numtel":tel,
            "nom":nom,
            "prenom":pren
        }
        if($("form[name='formContact']").valid()) {
            $(val).prop("disabled", "true");
            $('#loader_modal').modal('show');
            $.ajax({
                url: '/addnewmessagecontact',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(msg),
            })
                .done(function () {
                    $(val).prop("disabled", "false");
                    $('#loader_modal').modal('hide');
                    swal({
                        title:"<spring:message code="label.Confirmation"/>",
                        text:"<spring:message code="label.Confirmerlenvoiducontact"/>",
                        type:"info",
                        icon: 'info',
                        showCancelButton: false,
                        confirmButtonColor: '#336c4e',
                        confirmButtonText: '<spring:message code="label.OK"/>',
                    }, function (isConfirm) {
                        if (isConfirm) {
                            window.location.href = "/contact/0"
                        }
                    });

                })
                .fail(function () {
                    $(val).prop("disabled", "false");
                    $('#loader_modal').modal('hide');
                    alert("erreur")
                })
                .always(function () {
                    console.log("complete");
                });
        }else{
            return false;
        }
    }

    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formContact']").validate({
            rules: {
                telephone_contact:{
                    required: true,
                },
                email_contact:{
                    required: true,
                }
            },
            messages: {
                telephone_contact: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                email_contact: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>"
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>

<jsp:include page="../../includes/footer1.jsp"/>