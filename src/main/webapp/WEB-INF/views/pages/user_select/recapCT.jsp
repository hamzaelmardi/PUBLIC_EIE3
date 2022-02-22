<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>
<c:if test="${not empty collect}">
    <div class="row justify-content-center mt-5"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
        <div class="col-md-10 col-sm-12">
            <div class="jumbotron p-3 mb-2">
                <spring:message code="label.Statutdelademande"/> : <span class="text-success h4 font-weight-bold">${collect.statut[lng]}</span>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-10 col-sm-12">
            <div class="row p-0 mb-2">
                <c:choose>
                    <c:when test="${collect.statut.id_statut_projet==20 || collect.statut.id_statut_projet==41}">
                        <div class="col-auto">
                            <a href="/api/validateDocCt/${collect.id_collecte }"
                               class="btn btn-primary"><i class="fa fa-upload "
                                                          title="Améliorer les documents" style="margin: 0 !important"></i><spring:message code="label.Ameliorerlesdocuments"/></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${collect.statut.id_statut_projet==22}">
                                <div class="col-auto">
                                    <a class="btn btn-warning rounded"
                                       href="${url_admin}/generate_pdf_collecte/${collect.id_collecte}">
                                        <span class="fa fa-download"></span>
                                    </a>
                                </div>
                            </c:when>
                            <c:when test="${collect.statut.id_statut_projet==25}">
                                <div class="col-auto">
                                    <a class="btn btn-warning rounded"
                                       href="${url_admin}/generate_word_collecte/${collect.id_collecte}">
                                        <span class="fa fa-download"><spring:message code="label.Telechargerlarrete"/> </span>
                                    </a>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <c:if test="${(collect.statut.id_statut_projet==56 && collect.typeRenouvellement.id_type_renouvellement!=3 && listStatut.size()==0) || (etat.equals('non') && collect.typeRenouvellement.id_type_renouvellement!=3)}">
                    <div class="col-md-3 col-sm-6">
                        <a class="btn btn-success btn-block" href="/api/newCollecteAvenant/${collect.id_collecte}"> <span class="fa fa-plus mr-2"></span><spring:message code="label.AjouterAvenant" />
                        </a>
                    </div>
                </c:if>
                <c:if test="${collect.statut.id_statut_projet==50 && collect.typeRenouvellement.id_type_renouvellement!=3}">
                    <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                        <a href="/api/addCollectTrans/${collect.id_collecte}/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt mr-2"></i><spring:message code="label.deposerDossier"/></a>
                    </div>
                </c:if>
                <c:if test="${collect.statut.id_statut_projet==50 && collect.typeRenouvellement.id_type_renouvellement==3}">
                    <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                        <a href="/api/addCollectTrans/${collect.id_collecte}/AV" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt mr-2"></i><spring:message code="label.deposerDossier"/></a>
                    </div>
                </c:if>
              <%--  <c:if test="${(collect.statut.id_statut_projet==19 || collect.statut.id_statut_projet==23) && collect.typeRenouvellement.id_type_renouvellement!=3}">
                    <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                        <a href="/api/addCollectTrans/${collect.id_collecte}/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt mr-2"></i><spring:message code="label.Editer"/></a>
                    </div>
                </c:if>
                <c:if test="${(collect.statut.id_statut_projet==19 || collect.statut.id_statut_projet==23) && collect.typeRenouvellement.id_type_renouvellement==3}">
                    <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                        <a href="/api/addCollectTrans/${collect.id_collecte}/AV" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt mr-2"></i><spring:message code="label.Editer"/></a>
                    </div>
                </c:if>--%>
                <c:if test="${collect.statut.id_statut_projet==42}">
                    <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                        <a href="/api/completerDocument/${collect.id_collecte}" class="btn btn-primary btn-block"><i class="fa fa-pencil mr-2"></i><spring:message code="label.Completerlesdocuments"/></a>
                    </div>
                </c:if>
                <div class="col-md-6 col-lg-4 col-sm-6 mx-2">
                    <a href="/api/generate_recap_collecte/${collect.id_collecte}" class="btn btn-primary btn-block"><i class="fa fa-print mr-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
                </div>
            </div>
            <c:if test="${renouv=='oui' and collect.typeRenouvellement.id_type_renouvellement!=3}">
                <div class="row mt-2 mb-3">
                    <div class="col-2">
                        <a class="btn btn-success btn-block" href="/api/newCollecteRenouv/${collect.id_collecte}"> <spring:message code="label.Renouvellement"/></a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <div class="row justify-content-center mt-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="col-md-10 col-sm-12">
            <div class="bg-white" id="accordion-style-1">
                <div class="row">
                    <div class="col-12">
                        <div class="accordion" id="accordionExample">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingTwo">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn ${pageContext.response.locale=="ar"?'text-right':'text-left'} " type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <i class="icon fa fa-user ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                                            <spring:message code="label.informationdemandeur"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse show fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Numerodedemande"/>  </label>
                                                    <input type="text" disabled value="${collect.num_demande}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12 ${collect.typeRenouvellement.id_type_renouvellement==3?'d-block':'d-none'}">
                                                <div class="form-group">
                                                    <label> Date de demande d'avenant </label>
                                                    <fmt:formatDate value="${collect.dateAvenant}" pattern="dd-MM-yyyy" var="dateAvenant"/>
                                                    <input type="text" disabled value="${dateAvenant}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Raisonsociale"/>  </label>
                                                    <input type="text" disabled value="${collect.raison}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.identifiantfiscal"/> </label>
                                                    <input type="text" disabled value="${collect.idfiscale}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.CIN"/> </label>
                                                    <input type="text" disabled value="${collect.cin}" class="form-control">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Representant"/> </label>
                                                    <input type="text" disabled value="${collect.demandeur_Nom}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Fax"/>  </label>
                                                    <input type="text" disabled value="${collect.demandeurFax}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Email"/> </label>
                                                    <input type="text" disabled value="${collect.demandeurEmail}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Adresse"/> </label>
                                                    <textarea disabled class="form-control" rows="2">${collect.demandeurAdresse}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Telephone"/> </label>
                                                    <input type="text" disabled value="${collect.demandeurTel}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Region"/> </label>
                                                    <input type="text" disabled class="form-control" value="${collect.region.nom_fr}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.prefecture"/>  </label>
                                                    <input type="text" disabled value="${collect.prefecture.nom_fr}" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingOne">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn ${pageContext.response.locale=="ar"?'text-right':'text-left'} collapsed " type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <i class="icon fa fa-trash-restore ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.listdesdechetchoisi"/>
                                        </a>
                                    </h5>
                                </div>

                                <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="panel-body table-responsive">
                                                    <table class="table table-hover my_table" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}">
                                                        <thead>
                                                        <tr class="active">
                                                            <th><spring:message code="label.code"/></th>
                                                            <th><spring:message code="label.type"/></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${collect.code}" var="code">
                                                            <tr>
                                                                <td>${code.nom_fr}</td>
                                                                <td>${code.nom_ar}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:if test="${empty collect.code}">
                                                            <tr>
                                                                <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                                            </tr>
                                                        </c:if>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingThree">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} " type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <i class="icon fa fa-car ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                                            <spring:message code="label.Donneesurlesvehicules"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.NombredeVehicule"/></label>
                                                    <input disabled type="text" class="form-control" value="${collect.nombre_vehicule}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Nombredeconteneurs"/></label>
                                                    <input disabled type="text" class="form-control" value="${collect.nombre_conteneur}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 panel-body table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <table class="table table-hover my_table" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}">
                                                    <thead>
                                                    <tr class="active">
                                                        <th><spring:message code="label.NMatriculation"/></th>
                                                        <th><spring:message code="label.NChassis"/></th>
                                                        <th><spring:message code="label.Poidstotalencharge"/></th>
                                                        <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                                        <th><spring:message code="label.Typevehicule"/></th>
                                                        <th><spring:message code="label.typedeconteneursA"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:choose>
                                                        <c:when test="${(not empty collect.vehicules)}">
                                                            <c:forEach items="${collect.vehicules}" var="v">
                                                                <tr id="tr${v.id_vehicule}">
                                                                    <td>${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto} - ${v.num_mat_id_prefect}</td>
                                                                    <td>${v.num_chassis}</td>
                                                                    <td>${v.poit_totale_charge}</td>
                                                                    <td>${v.point_net}</td>
                                                                    <td>${v.typeVehicule}</td>
                                                                    <td>${v.typeConteneur}</td>
                                                                    <!-- <td>
                          <c:choose>
                            <c:when test="${not empty v.equipementSecurite}">
                              <a href="/downloadFile/${fn:replace(v.equipementSecurite,"/assets/myFile/","")}" class="btn btn-primary rounded-circle">
                                <span class="fa fa-download"></span>
                              </a>
                            </c:when>
                            <c:otherwise>
                              -
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <a href="/downloadFile/${fn:replace(v.doc_assurance,"/assets/myFile/","")}" class="btn btn-primary rounded-circle">
                            <span class="fa fa-download"></span>
                          </a>
                        </td>-->
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <td colspan="7" class="bg-primary text-center">Aucun Véhicule</td>
                                                            </tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingFour">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} " type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            <i class="icon fa fa-file-pdf ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Piecesaccompagnelademande"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseFour" class="collapse fade" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}" aria-labelledby="headingFour" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <table class="table my_table table-striped table-bordered table-hover">
                                            <c:if test="${not empty doc}">
                                                <c:forEach items="${doc}" var="file">
                                                    <tr>
                                                        <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                                                        <td>
                                                            <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(file.url,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty doc}">
                                                <tr>
                                                    <td colspan="2"> <spring:message code="label.AucunFichier"/> </td>
                                                </tr>
                                            </c:if>

                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingFive">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} " type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                            <i class="icon fa fa-file-download ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.ListedesTelechargements"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseFive" class="collapse fade" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}" aria-labelledby="headingFive" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <table class="table my_table table-striped table-bordered table-hover">
                                            <tr>
                                                <c:if test="${not empty collect.document_attache }">
                                                    <td style="width: 93%">
                                                        <spring:message code="label.Rapportdeconformite"/>
                                                    </td>
                                                    <td class="text-center">

                                                        <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(collect.document_attache,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>

                                                    </td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <c:if test="${not empty collect.url_pv_commission }">
                                                    <td style="width: 93%">
                                                        <spring:message code="label.pvdelacommission"/>
                                                    </td>
                                                    <td class="text-center">

                                                        <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(collect.url_pv_commission,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>

                                                    </td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <c:if test="${not empty collect.url_doc_signer }">
                                                    <td style="width: 93%">
                                                        <spring:message code="label.Lautorisationsignee"/>
                                                    </td>
                                                    <td class="text-center">
                                                        <a  class="btn btn-success" href="/downloadFile/${fn:replace(collect.url_doc_signer,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${collect.typeRenouvellement.id_type_renouvellement!=3}">
                                <div class="panel">
                                    <div class="card-header panel-heading" id="headingSix">
                                        <h5 class="mb-0 panel-title">
                                            <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} " type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                                <i class="icon fa fa-file-download ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>List des collectes anciennes
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapseSix" class="collapse fade" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}" aria-labelledby="headingSix" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <table class="table my_table table-striped text-center table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th class="">#</th>
                                                    <th class=""><spring:message code="label.Numerodedemande"/></th>
                                                    <th class="">Date de demande d'avenant</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listCollecte}" var="n" varStatus="loopp">
                                                    <tr>
                                                        <td>${loopp.index+1}</td>
                                                        <td>${n.num_demande}</td>
                                                        <fmt:formatDate var="date_avenant" pattern="dd-MM-yyyy" value="${n.dateAvenant}"/>
                                                        <td>${date_avenant}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>


