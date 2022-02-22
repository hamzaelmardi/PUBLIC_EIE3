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
    .main-panel{
        margin-top:150px !important;
    }
</style>

<div class="main-panel">
    <section class="mt-2 bg-white container-fluid" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row">
            <div class="col-12">
                <c:choose>
                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.Importationdechetszonefranche" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
                    </c:when>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb" style="margin-top: 47px">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                        <li class="breadcrumb-item"><a href="/api/checkEIESelect">${p_page} </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Ajouterledocumentdemouvement"/>  </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-12">
                <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block active pl-5 cls_step" id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')">1. <spring:message code="label.documentdemouvement"/> </button>

            </div>
            <div class="col-lg-6 col-sm-8 col-md-9 mx-4" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                <div class="row pb-2 mt-1">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center"><spring:message code="label.documentdemouvement"/></h4>
                    </div>

                    <div id="step1" class="col-12 z_collecteur"  >
                        <form class="mt-3"  id="formAvisProjet" name="formAvisProjet" >
                            <input type="hidden" value="${notification.id_notification}" name="id_notification" id="id_notification">
                            <div class="row">
                                <c:if test="${empty notification.url_document_mouvement}">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.documentdemouvement"/></label>
                                            <input type="file" class="form-control" id="url_document_mouvement" name="doc" required>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty notification.url_document_mouvement}">
                                    <div class="col-md-11 col-sm-11">
                                        <div class="form-group">
                                            <label><spring:message code="label.documentdemouvement"/></label>
                                            <input type="file" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group mt-4">
                                            <a href="/downloadFile/${fn:replace(notification.url_document_mouvement,"/assets/myFile/","")}" class="btn btn-primary mt-2"><span class="fa fa-download"></span></a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-auto">
                                    <button class="btn btn-primary btn-block" onclick="changer_Statut_zf_auth_non_dangereux_test('${notification.id_notification}', 95, '${notification.zf_et}')">
                                        <spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>

<script>
    function changer_Statut_zf_auth_non_dangereux_test(id_notif, id_statut, type){
        if(event!=null)
            event.preventDefault();
        var data = new FormData();
        var ins = document.getElementById("url_document_mouvement").files.length;
        if (ins == 0) {
            swal({
                title: "<spring:message code="label.Avertissement"/> ",
                text: "<spring:message code="label.Lefichierestobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK  ",
                html: false
            });
            return false;
        }

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("url_document_mouvement").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de fichier non pris en charge", "error");
                return false;
            }
            data.append("file", file);
        }

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/setDocumentDocMouvementNonDangereux/" + id_notif,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {
                changer_Statut_zf_auth_non_dangereux(id_notif, id_statut, type);
            },
            error: function () {

            }
        });
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
