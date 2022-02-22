<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty demande}">
  <jsp:include page="../../includes/head.jsp" />
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
  <style>
    .accordion-toggle {
      background-color: #336c4e;
      display: block;
    //padding: 10px;
      margin: -11px -20px;
      border-top-left-radius: 4px;
      border-top-right-radius: 4px;
    }

    .accordion-toggle.collapsed {
      background-color: #f6f6f6;
      border-top-color: #c5c5c5;
      font-weight: normal;
      color: #454545 !important;
    }
    label {
      float: ${pageContext.response.locale=='ar'?'right':'left'};
    }
    .active{
      font-size: 10pt !important;
    }
  </style>
<%--<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nom_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nom_fr"/>
</c:otherwise>
</c:choose>--%>
  <div class="row-fluid mt-5" style="margin-top: 210px !important;">
    <c:choose>
      <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/ListeEie')}">
        <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
      </c:when>
      <c:otherwise>
        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
      </c:otherwise>
    </c:choose>
    <div class="col-12">
      <div class="row">
        <div class="col-12">
          <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
           <c:if test="${type=='EE'}">
             <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.EtudedimpactEnvironnementale"/></a></li>
           </c:if>
              <c:if test="${type=='RS'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Renseignementprealable"/></a></li>
              </c:if>
              <c:if test="${type=='NT'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Noticedimpact"/></a></li>
              </c:if>
              <c:if test="${type=='AE'}">
                <li class="breadcrumb-item"><a href="/api/ListeEie/${type}"><spring:message code="label.Auditenvironnementale"/></a></li>
              </c:if>
              <c:if test="${type!='NT'}">
                <li class="breadcrumb-item active mt-1" aria-current="page"><spring:message code="label.Recap"/> ${pageContext.response.locale=='ar'?titre_ar:titre_dyn}</li>
              </c:if>
              <c:if test="${type=='NT'}">
                <li class="breadcrumb-item active mt-1" aria-current="page"><spring:message code="label.RecapN"/> ${pageContext.response.locale=='ar'?titre_ar:titre_dyn}</li>
              </c:if>
    </ol>
          </nav>
        </div>
      </div>

      <div class="row justify-content-center" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
        <div class="col-md-10 col-sm-12">
          <div class="jumbotron p-3">
            <spring:message code="label.StatutdelademandeAE"/>: <span class="text-success h4 font-weight-bold">${pageContext.response.locale=='ar'?demande.statut.nom_ar:demande.statut.nom_fr}</span>
          </div>
        </div>
      </div>
      <div class="row mb-5 justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="col-md-10 col-sm-12">
          <div class="row p-0">
  <c:if test="${type!='AE'}">
            <c:if test="${demande.statut.id_statut_projet==59  }">
              <div class="col-md-auto col-sm-6">
                <a href="/api/validateDocEIE/${demande.id_demande_information}/${type}"  class="btn btn-primary btn-block"><spring:message code="label.Completerlesdocuments"/></a>
              </div>
            </c:if>

            </c:if>
            <c:if test="${type=='AE'}">
            <c:if test="${demande.statut.id_statut_projet==59}">
              <div class="col-md-auto col-sm-6">
                <a   href="/api/getListdocument/${demande.id_demande_information}"  class="btn btn-primary btn-block"><spring:message code="label.Completerlesdocuments"/></a>
              </div>
            </c:if>
            </c:if>

            <c:if test="${demande.statut.id_statut_projet==14 || demande.statut.id_statut_projet==51}">
              <div class="col-md-auto col-sm-6">
                <a href="/api/addInstallation/${demande.id_demande_information }/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt ml-2" title="Modifier" style="margin:0 !important"></i> <spring:message code="label.Editer"/></a>
              </div>
            </c:if>
            <div class="col-md-auto col-sm-6">
              <a href="/api/generate_recap_Eie/${demande.id_demande_information }" class="btn btn-primary btn-block"><i class="fa fa-print  ml-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
            </div>
            <c:if test="${demande.statut.id_statut_projet==15 }">
              <div class="col-md-auto col-sm-6">
                <a href="/api/infoInstallation/${demande.id_demande_information }" class="btn btn-primary rounded"><span class="fa fa-plus "></span> <spring:message code="label.Ameliorerlesdocuments"/></a>
              </div>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==71 && demande.type=='AE' }">
              <button onclick="ajouter_rapport_ae2('${demande.id_demande_information}')" class="btn btn-primary"><span class="fa fa-plus "></span> <spring:message code="label.Ajouterlerapportdaudit"/></button>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==73 && type=='AE'}">
              <a href="/api/AttacherListDocAE/${demande.id_demande_information}" class="btn btn-primary" title="Attacher les documents">
                <i class="fa fa-check ml-2"></i>
                <spring:message code="label.Attacherlesdocuments"/>
              </a>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==12 && type=='RS'}">
              <a href="/api/demandeinformation/${demande.id_demande_information}/EE" class="btn btn-primary" title="<spring:message code="label.EtudedimpactEnvironnementale"/>">
                <i class="fa fa-file ml-2"></i>
                <spring:message code="label.EtudedimpactEnvironnementale"/>
              </a>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==17 }">
              <div class="col-md-auto col-sm-6">
                <a href="/api/generateDocInstallFavorable/${demande.id_demande_information}" class="btn btn-primary rounded"><span class="fa fa-file-download"></span></a>
              </div>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==17 }">
              <div class="col-md-auto col-sm-6">
                <a href="/api/generateDocInstallFavorable/${demande.id_demande_information}" class="btn btn-primary rounded"><span class="fa fa-file-download"></span></a>
              </div>
            </c:if>
            <c:if test="${demande.statut.id_statut_projet==7 || demande.statut.id_statut_projet==10 }">
              <div class="col-md-auto col-sm-6">
                <a type="button" class="btn btn-primary rounded" href="/api/piecejointdemande/${demande.id_demande_information}/${demande.type}" ><span class="fa fa-check"></span> <spring:message code="label.Attacherlesdocumentsdefinitifs"/></a>
              </div>
            </c:if>


            <%--<c:if test="${demande.statut.id_statut_projet==6}">
              <div class="col-md-3 col-sm-6">
                <a href="/downloadFile/${fn:replace(demande.url_document_signee,"/assets/myFile/","")}" class="btn btn-primary"><i class="fa fa-download"></i> Télécharger l'autorisation </a>
              </div>
            </c:if>--%>

          </div>
          <c:if test="${renouv=='oui'}">
            <div class="row-fluid mt-2 mb-3">
              <div class="col-md-auto col-sm-6">
                <a class="btn btn-success btn-block" href="/api/newInstallRenouv/${demande.num_demande}"><spring:message code="label.Renouvellement"/> </a>
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
                    <div class="card-header panel-heading" id="headingOne1">
                      <h5 class="mb-0 panel-title">
                        <a class="accordion-toggle btn ${pageContext.response.locale!="ar"?'text-left':'text-right'} text-white" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                          <i class="icon fa fa-user-friends ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i>
                          <c:if test="${demande.type.equals('AE')}">
                            <spring:message code="label.informationssurlepetitionnaireAE"/>
                          </c:if>
                          <c:if test="${!demande.type.equals('AE')}">
                            <spring:message code="label.informationssurlepetitionnaire"/>
                          </c:if>
                        </a>
                      </h5>
                    </div>
                    <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Numerodedemande"/>  </label>
                              <input type="text" disabled value="${demande.num_demande}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Representant"/>  </label>
                              <input type="text" disabled value="${demande.represantant}" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.raisonsocial"/>  </label>
                              <input type="text" disabled value="${demande.raison_social}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Adresse"/> </label>
                              <input type="text" disabled value="${demande.adresse}" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Tel"/></label>
                              <input type="tel" disabled value="${demande.tel}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Fax"/>  </label>
                              <input type="text" disabled value="${demande.fax}" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Email"/> </label>
                              <input type="text" disabled value="${demande.email}" class="form-control">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="panel">
                    <div class="card-header panel-heading" id="headingOne">
                      <h5 class="mb-0 panel-title">
                        <a class="accordion-toggle btn ${pageContext.response.locale!="ar"?'text-left':'text-right'} text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          <i class="icon fa fa-file ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i>
                          <c:if test="${type=='AE'}">
                          <spring:message code="label.informationProjetAE"/>
                        </c:if>
                          <c:if test="${type!='AE'}">
                            <spring:message code="label.informationProjet"/>
                          </c:if>
                        </a>
                      </h5>
                    </div>
                    <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                        <c:if test="${type=='EE' || type=='RS'}">
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.intitule"/> </label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.montantIves"/> </label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Tronsfrontalier"/> </label>
                                <input disabled type="text" class="form-control" value="${demande.tronsfrontalier}">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.interregion"/> </label>
                                <input disabled type="text" class="form-control" value="${demande.interregion}">
                              </div>
                            </div>
                          </div>
                        </c:if>
                        <c:if test="${type=='AE'}">
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Intituledeprojet"/> </label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.montantIves"/></label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Naturedactivite"/> </label>
                                <textarea disabled type="text" class="form-control" rows="3">${demande.nature_projet}</textarea>
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="input-group" style="margin-top: 32px">
                                <input type="text" class="form-control" disabled value="<spring:message code="label.Consistancedelactivite"/>" aria-label="Username" aria-describedby="basic-addon1">
                                <span id="basic-addon1"><a target="_blank" class="btn btn-success btn-rounded" href="/downloadFile/${fn:replace(fn:replace(demande.url_file_AE,"/assets/myFile/",""),"/dowload_uploaded/","")}"> <span class="fa fa-download"></span></a></span>
                              </div>
                            </div>
                          </div>
                        </c:if>
                        <c:if test="${type=='NT'}">
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.intitule"/></label>
                                <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.montantIves"/></label>
                                <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.NatureduProjet"/> </label>
                                <textarea disabled type="text" class="form-control">${demande.nature_projet}</textarea>
                              </div>
                            </div>
                          </div>
                        </c:if>
                      </div>
                    </div>
                  </div>

                  <div class="panel">
                    <div class="card-header panel-heading" id="headingTwo">
                      <h5 class="mb-0 panel-title">
                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          <i class="icon fa fa-search-location ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i>
                          <c:if test="${type=='AE'}">
                            <spring:message code="label.localisationduprojet"/>
                          </c:if>
                          <c:if test="${type!='AE'}">
                            <spring:message code="label.localisationProjet"/>
                          </c:if>
                        </a>
                      </h5>
                    </div>
                    <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-sm-12 table-responsive" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div class="row justify-content-center">
                              <div class="col-10">
                                <div class="row "
                                     style="background: gray;color: white;border-color: #737373;">
                                  <div class="col-4 border p-2 font_bold  btn-gris">
                                    <spring:message code="label.Regions"/>
                                  </div>
                                  <div class="col-4 border p-2 font_bold  btn-gris">
                                    <spring:message code="label.prefecturesp"/>
                                  </div>
                                  <div class="col-4 border p-2 font_bold  btn-gris">
                                    <spring:message code="label.communes"/>
                                  </div>
                                </div>

                                <div class="row">
                                  <div class="col-4 border p-2">
                                    <c:if test="${not empty demande.detailRegion.region}">
                                      <ul>
                                        <c:forEach items="${demande.detailRegion.region}" var="det">
                                          <li> - ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                        </c:forEach>
                                      </ul>
                                    </c:if>
                                    <c:if test="${empty demande.detailRegion.region}">
                                      -
                                    </c:if>
                                  </div>
                                  <div class="col-4 border p-2">
                                    <c:if test="${not empty demande.detailRegion.prefectures}">
                                      <ul>
                                        <c:forEach items="${demande.detailRegion.prefectures}" var="det">
                                          <li> - ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                        </c:forEach>
                                      </ul>
                                    </c:if>
                                    <c:if test="${empty demande.detailRegion.prefectures}">
                                      -
                                    </c:if>
                                  </div>
                                  <div class="col-4 border p-2">
                                    <c:if test="${not empty demande.detailRegion.communes}">
                                      <ul>
                                        <c:forEach items="${demande.detailRegion.communes}" var="det">
                                          <li> - ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                        </c:forEach>
                                      </ul>
                                    </c:if>
                                    <c:if test="${empty demande.detailRegion.communes}">
                                      -
                                    </c:if>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>


                  <div class="panel">
                    <div class="card-header panel-heading" id="headingeight">
                      <h5 class="mb-0 panel-title">
                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
                          <i class="icon fa fa-file-pdf ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i><spring:message code="label.Piecesaccompagnelademande"/>
                        </a>
                      </h5>
                    </div>
                    <div id="collapseeight" class="collapse fade" aria-labelledby="headingeight" data-parent="#accordionExample">
                      <div class="card-body">
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                          <c:if test="${not empty doc}">
                            <c:forEach items="${doc}" var="file">
                              <tr>
                                <td>${pageContext.response.locale!='ar'?file.docImport.nom_fr:file.docImport.nom_ar}</td>
                                <td>
                                  <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(file.url,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                </td>
                              </tr>
                            </c:forEach>
                          </c:if>

                          <c:if test="${empty doc}">
                            <tr>
                              <td colspan="2"><spring:message code="label.AucunFichier"/> </td>
                            </tr>
                          </c:if>

                        </table>
                      </div>
                    </div>
                  </div>


                  <div class="panel">
                    <div class="card-header panel-heading" id="headingeight3">
                      <h5 class="mb-0 panel-title">
                        <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight3" aria-expanded="false" aria-controls="collapseeight3">
                          <i class="icon fa fa-file-download ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i><spring:message code="label.ListedesTelechargements"/>
                        </a>
                      </h5>
                    </div>
                    <div id="collapseeight3" class="collapse fade" aria-labelledby="headingeight3" data-parent="#accordionExample">
                      <div class="card-body">
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'} ">
                          <tbody>

                          <c:forEach items="${demande.regiondoc}" var="reg">
                            <c:if test="${not empty reg.doc}">
                              <tr>
                                <td><spring:message code="label.Lerapportdelenquetepubliquede"/> <b>${pageContext.response.locale!="ar"?reg.region.nom_fr:reg.region.nom_ar}</b></td>
                                <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(reg.doc,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                              </tr>
                            </c:if>
                          </c:forEach>
                          <c:if test="${not empty demande.reunions[demande.reunions.size()-1].url_pv && not empty demande.reunions[demande.reunions.size()-1].url_presence}">
                            <tr>
                              <td><spring:message code="label.PVdereunion"/> </td>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.reunions[demande.reunions.size()-1].url_pv,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                            </tr>
                            <tr>
                              <td><spring:message code="label.Listedepresence"/> </td>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.reunions[demande.reunions.size()-1].url_presence,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                            </tr>
                          </c:if>
                          <c:if test="${not empty demande.url_enquette_defenitive}">
                            <tr>
                              <td><spring:message code="label.EtudedImpactsurlEnvironnementdefinitive"/> </td>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.url_enquette_defenitive,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                            </tr>
                          </c:if>
                          <c:if test="${not empty demande.url_cachier_defenitive}">
                            <tr>
                              <td><spring:message code="label.Cahierdeschargesdefinitif"/></td>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.url_cachier_defenitive,"/assets/myFile/","")}" > <span class="fa fa-download"></span> </a></td>
                            </tr>
                          </c:if>
                          <c:if test="${not empty demande.url_document_signee}">
                            <tr>
                              <c:if test="${type=='EE'}">
                                <td><spring:message code="label.Ladecisiondelacceptabilitenvironnementalesigne"/> </td>
                              </c:if>
                              <c:if test="${type=='NT'}">
                                <td><spring:message code="label.Lecertificatdeconformitenvironnementalesigne"/> </td>
                              </c:if>
                              <c:if test="${type=='AE'}">
                                <td> <spring:message code="label.Ladecisiondelacceptabilitenvironnementalesigne"/></td>
                              </c:if>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.url_document_signee,"/assets/myFile/","")}"><span class="fa fa-download"></span></a></td>
                            </tr>
                          </c:if>
                          <c:if test="${not empty demande.url_decision}">
                            <tr>
                              <td><spring:message code="label.Ladecisiondeconformitenvironnementalesigne"/> </td>
                              <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(demande.url_decision,"/assets/myFile/","")}"><span class="fa fa-download"></span></a></td>
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
          </div>
        </div>
      </div>

    </div>


  </div>

  <!-- Modal -->
  <div class="modal fade" id="modal_AE" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitleAE"><spring:message code="label.Envoyerlerapportdaudit"/> </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="zone_AE_fichier">

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="button.Enregistrer"/></button>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="modal_fichiers" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Piecesaccompagnelademande"/> </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="zone_tab_fichier">

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.fermer"/></button>
        </div>
      </div>
    </div>
  </div>
</c:if>
<c:if test="${(empty demande)}"><spring:message code="label.Aucunresultat"/></c:if>
<jsp:include page="../../includes/footer1.jsp" />

<script>
  function ajouter_rapport_ae2(id){
    if(event!=null)
      event.preventDefault();
    $("#modal_AE").modal("show");
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "/api/affiche_FRM_Add_rapport_ae/" + id,
      data:{},
      success: function (response) {
        $("#zone_AE_fichier").html(response);
      },
      error: function () {

      }
    });
  }
  function setfileRapport_AE(id,val,id_rapport){
    if(event!=null)
      event.preventDefault();
    var data = new FormData();
    var files = $(val)[0].files.length;
    if(files==0){
      swal("<spring:message code="label.Avertissement"/> !","<spring:message code="label.Lefichierestobligatoire"/>","error");
      return false;
    }

    data.append("file",$(val)[0].files[0]);

    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "/api/setRapport_ae/"+id+"/"+id_rapport,
      data: data,
      processData: false,
      contentType: false,
      cache: false,
      success: function (response) {

      },
      error: function () {

      }
    });
  }
</script>

<script src="${pageContext.request.contextPath}/assets/intl-tel-input-master/build/js/intlTelInput.js"></script>
<script>
  var input_all = $("input[type=tel]");
  for (var x = 0;x<input_all.length;x++){
    window.intlTelInput(input_all[x], {
      // allowDropdown: false,
      // autoHideDialCode: false,
      //autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
      // formatOnDisplay: false,
      // geoIpLookup: function(callback) {
      //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
      //     var countryCode = (resp && resp.country) ? resp.country : "";
      //     callback(countryCode);
      //   });
      // },
      // hiddenInput: "full_number",
      // initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      nationalMode: false,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      // separateDialCode: true,
      utilsScript: "${pageContext.request.contextPath}/assets/intl-tel-input-master/build/js/utils.js",
    });
  }

</script>