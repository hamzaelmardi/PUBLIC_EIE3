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
                        <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Ajouterlesertificatdelimination"/>  </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-12">
                <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block active pl-5 cls_step" id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')">1. <spring:message code="label.Certificatdelimination"/> </button>

            </div>
            <div class="col-lg-6 col-sm-8 col-md-9 mx-4" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                <div class="row pb-2 mt-1">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center"><spring:message code="label.Certificatdelimination"/></h4>
                    </div>

                    <div id="step1" class="col-12 z_collecteur"  >
                        <form class="mt-3"  id="formAvisProjet" name="formAvisProjet" >
                            <input type="hidden" value="${notification.id_notification}" name="id_notification" id="id_notification">
                            <div class="row">
                                <c:if test="${empty notification.url_certicat_elimination}">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.Certificatdelimination"/></label>
                                            <input type="file" class="form-control" onchange="updateFile('${notification.id_notification}',this,1)">
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty notification.url_certicat_elimination}">
                                    <div class="col-md-11 col-sm-11">
                                        <div class="form-group">
                                            <label><spring:message code="label.Certificatdelimination"/></label>
                                            <input type="file" class="form-control" onchange="updateFile('${notification.id_notification}',this,1)">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group mt-4">
                                           <a href="/downloadFile/${fn:replace(notification.url_certicat_elimination,"/assets/myFile/","")}" class="btn btn-primary mt-2"><span class="fa fa-download"></span></a>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label><spring:message code="label.Nombredecolis"/></label>
                                        <input id="nbr_colis" type="text" class="form-control" value="${notification.nbr_colis}" onchange="setnbrColis(this,'${notification.id_notification}')">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label><spring:message code="label.Quantiteprevue"/></label>
                                        <input type="text" class="form-control" disabled value="${notification.quantite}" id="qte_prevue">
                                    </div>
                                </div>
                            </div>

                            <div class="row m-0 p-0" id="detail_mouvement">

                                <table class="table-striped table-bordered table my_table">
                                    <thead>
                                        <tr>
                                            <th><spring:message code="label.Quantite"/></th>
                                            <th><spring:message code="label.Fichier"/></th>
                                            <th><spring:message code="label.Action"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="qteTotal" value="0"/>
                                    <c:if test="${empty notification.docMouvement}">
                                        <tr class="text-center">
                                            <td colspan="3"><spring:message code="label.AucuneQuantite"/></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty notification.docMouvement}">
                                        <c:forEach items="${notification.docMouvement}" var="m">
                                            <c:set var="qteTotal" value="${qteTotal+m.quantite}"/>
                                            <tr>
                                                <td>${m.quantite}</td>
                                                <td>
                                                    <a target="_blank" download href="/downloadFile/${fn:replace(m.url,"/assets/myFile/","")}"
                                                       class="btn btn-primary">
                                                        <span class="fa fa-download"></span>
                                                    </a>
                                                </td>
                                                <td>
                                                    <button onclick="delete_docMouv('${m.id_doc_mouvement}','${notification.id_notification}')" class="btn btn-danger rounded-circle">
                                                        <span class="fa fa-trash"></span>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                    </tbody>
                                </table>
                                <input type="hidden" value="0" id="id_detail_unit">
                               <div class="col-md-6">
                                   <label><spring:message code="label.Quantite"/></label>
                                   <input type="text" value="" class="form-control" id="qte_unit">
                               </div>
                                <div class="col-md-6">
                                    <label><spring:message code="label.Documentdemouvement"/></label>
                                    <input type="file" value="" class="form-control" id="file_unit">
                                </div>
                                <div class="col-12 mt-2">
                                    <div class="row justify-content-end">
                                        <div class="col-auto">
                                            <button id="btn_add_detail" onclick="add_detail_mouvement('${notification.id_notification}',this)" class="btn btn-primary"> <span class="fa fa-plus"></span> <spring:message code="label.Ajouter"/></button>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="${qteTotal}" class="form-control" id="qteTotale">
                                <c:if test="${!(notification.quantite==qteTotal)}">
                                    <c:if test="${empty notification.url_quantite_justificatif}">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Justificatif"/> </label>
                                                <input type="file" class="form-control"  onchange="updateFile('${notification.id_notification}',this,2)">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty notification.url_quantite_justificatif}">
                                        <div class="col-11">
                                            <div class="form-group">
                                                <label><spring:message code="label.Justificatif"/> </label>
                                                <input type="file" class="form-control" onchange="updateFile('${notification.id_notification}',this,2)">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <div class="form-group mt-4">
                                                <a download target="_blank" class="btn btn-primary mt-2" href="/downloadFile/${fn:replace(notification.url_quantite_justificatif,"/assets/myFile/","")}")}">
                                                    <span class="fa fa-download"></span>
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>

                                </c:if>

                                <c:if test="${notification.statut.id_statut_projet==65}">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.Commentaire"/>) </label>
                                            <textarea disabled class="form-control" rows="3">${notification.commentaire}</textarea>
                                        </div>
                                    </div>
                                </c:if>

                            </div>



                            <div class="row justify-content-center">
                                <div class="col-auto">
                                    <button class="btn btn-primary btn-block" onclick="changer_Statut_zf_auth_test('${notification.id_notification}', 63, '${notification.zf_et}',this);">
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

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
