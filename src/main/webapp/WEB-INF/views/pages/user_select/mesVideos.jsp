<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<div class="row justify-content-center">
    <div class="vertical-tab col-md-10" role="tabpanel">
                <!-- Nav tabs -->
                <div class="row px-4">
                    <ul class="nav col-lg-4 col-md-12 nav-tabs" role="tablist">
                        <c:choose>
                            <c:when test="${type=='ZF'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home4" role="tab" data-toggle="tab">L'ajout de certificat d'élimination</a></li>
                                <li role="presentation"><a href="#Section5" aria-controls="home5" role="tab" data-toggle="tab">Changement de transport</a></li>
                            </c:when>
                            <c:when test="${type=='ET'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                            </c:when>
                            <c:when test="${type=='CT'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home4" role="tab" data-toggle="tab">Validation des déchets et véhicules</a></li>
                            </c:when>
                            <c:when test="${type=='IT'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home4" role="tab" data-toggle="tab">Validation des déchets</a></li>
                            </c:when>
                            <c:when test="${type=='TR'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                            </c:when>
                            <c:when test="${type=='XD'}">
                                <li role="presentation" class="active"><a href="#Section3" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                            </c:when>
                            <c:when test="${type=='EE'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home4" role="tab" data-toggle="tab">Attacher le document définitifs </a></li>
                            </c:when>
                            <c:when test="${type=='NT'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                            </c:when>
                            <c:when test="${type=='AE'}">
                                <li role="presentation" class="active"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                                <li role="presentation"><a href="#Section4" aria-controls="home4" role="tab" data-toggle="tab">Attacher le rapport d'audit</a></li>
                                <li role="presentation"><a href="#Section5" aria-controls="home4" role="tab" data-toggle="tab">Attacher l'audit environnemental</a></li>
                            </c:when>
                            <c:otherwise>
                                <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Demander le numéro d'autorisation</a></li>
                                <li role="presentation"><a href="#Section2" aria-controls="home2" role="tab" data-toggle="tab">Dépot de la  demande</a></li>
                                <li role="presentation"><a href="#Section3" aria-controls="home3" role="tab" data-toggle="tab">Complément des documents</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content col-lg-8 col-md-12 tabs">
                        <c:choose>
                            <c:when test="${type=='ZF'}">
                                <div role="tabpanel" class="tab-pane fade show active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddZF.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompléterDocZF.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CertificatEliminationZF.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section7">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/ChangerTransporteurZF.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='ET'}">
                                <div role="tabpanel" class="tab-pane fade show active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddET.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompleterDocET.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='CT'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/add%20demande%20collect.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/completecollectsous.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/compléter%20les%20documents%20collect%20transporte.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='IT'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/ajouter%20demande%20instalation.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/complete-lesdoc-installe.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/valider%20les%20déchets.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='TR'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddTR.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompléterDocTR.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='XD'}">
                                <div role="tabpanel" class="tab-pane fade show active" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddXD.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/completerExportation.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='EE'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/EIE_Deposer_Demande.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/EIE_completer_document.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Attacher_docs_définitifs.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='NT'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Notice_deposer_demande.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Notice_completer_document.mp4" controls loop  ></video>
                                </div>
                            </c:when>
                            <c:when test="${type=='AE'}">
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section2">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Audit_deposer_demande.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section3">
                                       <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AE_completer_documennt.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section4">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/attacher_rapport_audit.mp4"  controls loop  ></video>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Section5">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Audit_attacher_docs.mp4"  controls loop  ></video>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div role="tabpanel" class="tab-pane fade show in active" id="Section1">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Renseignements.mp4"  controls loop  ></video>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

