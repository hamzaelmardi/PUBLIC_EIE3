<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="table-responsive">
    <table class="table table-bordered my_table">
        <thead style="background-color: #336c4e; color: white">
        <tr>
            <th><spring:message code="label.personneacontacter"/> </th>
            <th><spring:message code="label.Adresse"/></th>
            <th><spring:message code="label.telephone"/></th>
            <th><spring:message code="label.Fax"/></th>
            <th><spring:message code="label.email"/></th>
            <th style="min-width: 120px"><spring:message code="label.Action"/></th>
        </tr>
        </thead>
        <tbody id="tPr">
        <c:choose>
            <c:when test="${(not empty notification)}">
                <c:forEach items="${notification}" var="p">
                    <tr id="trr_${p.id_producteur}">
                        <td> ${p.contact_fr}</td>
                        <td> ${p.adresse_fr}</td>
                        <td> ${p.tel}</td>
                        <td> ${p.fax}</td>
                        <td> ${p.mail}</td>

                        <td class="">
                            <button onclick="deleteProducteurNotification('${p.id_producteur}','id_notification')"
                                    class="btn btn-danger rounded-circle"><span
                                    class="fa fa-trash"></span></button>
                            <button onclick="edit_producteur_notification('${p.id_producteur}','id_notification')"
                                    class="btn btn-warning rounded-circle"><span
                                    class="fas fa-edit" style="color: white"></span></button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>
</div>
<form id="zone_form1" name="zone_form1">
<div id="zone_form" class=" col-12 p-0 m-0">

    <div class="row m-0 p-0">
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.personneacontacter"/></label>
                <input type="text" value="${one.contact_fr}" id="contact_fr" name="contact_fr" class="form-control">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.email"/></label>
                <input type="text" value="${one.mail}" id="mail" name="mail" class="form-control">
                <small style="color: red;font-style: italic" id="spemail"></small>
            </div>
        </div>
    </div>
    <div class="row m-0 p-0">
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.telephone"/></label>
                <input type="tel" value="${one.tel}" id="tel" name="tel" class="form-control">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.Fax"/> </label>
                <input type="text" value="${one.fax}" id="fax_p" name="fax" class="form-control">
            </div>
        </div>
    </div>
    <div class="row m-0 p-0">
        <div class="col-6">
            <div class="form-group">
                <label> <spring:message code="label.Adresse"/></label>
                <textarea type="text" id="adresse_fr" name="adresse_fr" class="form-control">${one.adresse_fr}</textarea>
            </div>
        </div>
    </div>
</div>
</form>
    <div class="row justify-content-center">
        <div class="col-md-3">
            <input type="hidden" value="${(not empty one)?one.id_producteur:'0'}" id="id_prod">
            <button onclick="ajouterProducteur('id_notification',this)" class="btn btn-primary btn-block"><spring:message code="label.Enregistrerleproducteur"/> </button>
        </div>
    </div>

<script>
    function ajouterProducteur(id_name,val) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var nom_fr = $("#nom_fr_p").val();
        var nom_ar = $("#nom_ar").val();
        var contact_fr = $("#contact_fr").val();
        var idf = $("#idf").val();
        var adresse_fr = $("#adresse_fr").val();
        var tel = $("#tel").val();
        var fax = $("#fax_p").val();
        var mail = $("#mail").val();

        var id_prod = $("#id_prod").val();
        var data = new FormData();
        data.append("nom_fr", nom_fr);
        data.append("nom_ar", nom_ar);
        data.append("contact_fr", contact_fr);
        data.append("idf", idf);
        data.append("adresse_fr", adresse_fr);
        data.append("tel", tel);
        data.append("fax", fax);
        data.append("mail", mail);

        if ($("form[name='zone_form1']").valid()) {
            $(val).prop("disabled", "true");
            $('#loader_modal').modal('show');
            $.ajax({
                url: '/api/addProducteurNotification/' + id + "/" + id_prod,
                type: 'POST',
                processData: false,
                contentType: false,
                cache: false,
                data: data,
            })
                .done(function (data) {
                    $("#producteur_table").html(data);
                    $('#loader_modal').modal('hide');
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                    $("#id_prod").val(0);
                    document.getElementById("nom_fr_p").value = "";
                    document.getElementById("nom_ar").value = "";
                    document.getElementById("contact_fr").value = "";
                    document.getElementById("idf").value = "";
                    document.getElementById("adresse_fr").value = "";
                    document.getElementById("tel").value = "";
                    document.getElementById("fax_p").value = "";
                    document.getElementById("mail").value = "";
                    $(val).prop("disabled", "false");
                    $('#loader_modal').modal('hide');
                });
        }
    }

    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='zone_form1']").validate({
            rules: {
                contact_fr : {
                    required: true,
                },
                tel:{
                    required: true,
                },
                fax:{
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },
                adresse_fr:{
                    required:true,
                },
                mail:{
                    required: true,
                },
            },
            messages: {
                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/> ",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                contact_fr:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplatremplirechamp"/> ",
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>