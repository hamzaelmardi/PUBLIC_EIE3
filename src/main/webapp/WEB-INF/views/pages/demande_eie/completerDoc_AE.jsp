<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<style>
    .select2-container--default .select2-selection--multiple {
        padding: 0px;
    }
    
</style>

<div class="main-panel">
    <section class="mt-2 bg-white container-fluid" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row">
            <div class="col-12">

                <c:choose>
                    <c:when test="${type=='AE'}">
                        <spring:message code="option.Auditenvironnementale" var="p_page" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                        <li class="breadcrumb-item"><a href="/api/checkEIESelect/${type=="RS"?"EE":type}">${p_page} </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.CompleterleDossier"/>  </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-3 col-sm-12">
                <c:choose>
                    <c:when test="${type=='AE'}">
                        <button class="btn btn-success btn-block active text-left pl-5 cls_step" id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')">1.<spring:message code="label.CompleterleDossier"/>   </button>
                    </c:when>
                </c:choose>

            </div>
            <div class="col-lg-6 col-sm-8 col-md-8 mx-4">
                <div class="row pb-2 mt-3">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center"><spring:message code="label.CompleterleDossier"/> </h4>
                    </div>
                    <div id="step1" class="col-12 z_collecteur"  >
                        <c:choose>
                            <c:when test="${type=='AE'}">
                                <div class="row">
                                    <c:forEach items="${demande.documents_AE}" var="doc">

                                            <div class="col-12">
                                                <div class="form-group mt-3">
                                                    <label> ${doc.nom_fr} </label>
                                                    <c:choose>
                                                        <c:when test="${empty doc.url_file}">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <input type="file" class="form-control" onchange="set_doc_AE('${demande.id_demande_information}','${doc.id_documents_ae}',this)">
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="row">
                                                                <div class="col-11">
                                                                    <input type="file" class="form-control" onchange="set_doc_AE('${demande.id_demande_information}','${doc.id_documents_ae}',this)">
                                                                </div>
                                                                <div class="col-1">
                                                                    <a class="btn btn-primary" target="_blank" download href="${Admin_url}${doc.url_file}">
                                                                        <span class="fa fa-download">
                                                                        </span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                            </div>

                                    </c:forEach>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="col-12">
                        <div class="row justify-content-end">
                            <div class="col-md-4 col-sm-12">
                                <input type="hidden" id="id_demande" value="${demande.id_demande_information}">
                                <button class="btn btn-primary btn-block" onclick="changer_statut1_AE('id_demande','89','Bien Enregistrée','AE')" >
                                    <spring:message code="button.Enregistrer"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12"></div>
        </div>
    </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>

<script>

    function updateDemandeInfomrationAE(form, id_name, step, id_btn_step) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        if ($.trim(id) === "" || id == null) {
            return false;
        }
        var montant = $("input[name=montant_investissement]").val();
        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
            swal("<spring:message code="label.Avertissement"/> ", '<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/>', 'error');
            return false;
        }
        var se = $("#"+form).serialize();

        $empty = $('#'+form).find("input").filter(function() {
            return this.value === "";
        });
        if($empty.length) {
            swal("<spring:message code="label.Avertissement"/> ! ", '<spring:message code="label.TousLesChampsestobligatoire"/>', 'error');
            return false;
        } else{
            $.ajax({
                type: "GET",
                url: "/api/updateDemandeInfomrationAE/" + id,
                contentType: 'application/json; charset=utf-8',
                data: se,
                success: function (response) {
                    console.log("success : " + response);
                    affiche_eie_zone(step, id_btn_step);
                },
                error: function (response) {

                    alert('Erreur ajout non effectue');

                }
            });
        }
    }
    function changer_statut2(type,id_name, code_statut, msg_alert) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id+"/"+type;
        var test = false;
        var tr = $("#formdoc").find("input[type=file]").closest(".row.justify-content-center");
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("<spring:message code="label.Avertissement"/> ", "<spring:message code="label.lenumerodeEIEnestpasvalide"/> ", "error");
            return false;
        }
        if (test) {
            swal("<spring:message code="label.Avertissement"/>!", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
        } else {
            $.ajax({
                url: "/api/changerStatuts2/" + id + "/" + code_statut,
                type: 'GET',
                data: {},
            })
                .done(function (data) {
                    Swal.fire({
                        title: '<strong>' + msg_alert + '</strong>',
                        icon: 'success',
                        html: '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                        showCloseButton: false,
                        showCancelButton: false,
                        showConfirmButton: false,
                        focusConfirm: false,
                    })
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });
        }
    }
    function changer_statut1(id_name, code_statut, msg_alert,type) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id+"/"+type;
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("<spring:message code="label.Avertissement"/> ", "<spring:message code="label.lenumerodeEIEnestpasvalide"/> ", "error");
            return false;
        }

        $.ajax({
            url: "/api/changerStatuts/" + id + "/" + code_statut,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                Swal.fire({
                    title: '<strong>' + msg_alert + '</strong>',
                    icon: 'success',
                    html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });
    }

</script>
