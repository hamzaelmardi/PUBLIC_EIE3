<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
</style>
<c:if test="${not empty installation}">
  <jsp:include page="../../includes/head.jsp" />
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
 <c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nom_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nom_fr"/>
</c:otherwise>
</c:choose>


  <div class="row-fluid mt-5" style="margin-top: 150px !important;">
    <div class="col-12">


      <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
          <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Installationdetraitementdesdechets"/></li>
        </ol>
      </nav>
    </div>
  </div>
  <div class="row justify-content-center " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-md-10 col-sm-12">
      <div class="jumbotron p-3 mb-2">
       <spring:message code="label.Statutdelademande"/>:
        <c:if test="${installation.statut.id_statut_projet==88 || installation.statut.id_statut_projet==14 || installation.statut.id_statut_projet==18 ||  installation.statut.id_statut_projet==15 || installation.statut.id_statut_projet==57|| installation.statut.id_statut_projet==51 || installation.statut.id_statut_projet==87  }">
          <span class="text-success h4 font-weight-bold">${installation.statut[lng]}</span>
        </c:if>
        <c:if test="${installation.statut.id_statut_projet!=88 && installation.statut.id_statut_projet!=14 && installation.statut.id_statut_projet!=18 &&  installation.statut.id_statut_projet!=15 && installation.statut.id_statut_projet!=57 && installation.statut.id_statut_projet!=51  && installation.statut.id_statut_projet!=87}">
          <span class="text-success h4 font-weight-bold"> ${pageContext.response.locale=='ar'?'في طور المعالجة':'En cours de traitement'}</span>
        </c:if>

      </div>
    </div>
  </div>

  <div class="row justify-content-center mb-2" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
  <div class="col-10" style="margin-right: ${pageContext.response.locale=="ar"?"1px":"-1px"}">
    <div class="row p-0 mt-2"  style="float: ${pageContext.response.locale=="ar"?"right":"left"}">
      <c:if test="${installation.statut.id_statut_projet==87 }">
      <div class="col-md-auto col-sm-6" >
               <a href="/api/addInstallation/${installation.id_installation }/N" class="btn btn-primary rounded"><span class="fas fa-file ml-2"></span>&nbsp; Compléter les documents</a>
            </div>
          </c:if>

          <c:if test="${installation.statut.id_statut_projet==51}">
            <div class="col-md-auto col-sm-6">
              <a href="/api/addInstallation/${installation.id_installation }/N" class="btn btn-primary btn-block"><i class="fa fa-pencil-alt ml-2" title="Modifier" style="margin:0 !important"></i> <spring:message code="label.Editer"/></a>
            </div>
          </c:if>

          <div class="col-md-auto col-sm-6">
            <a href="/api/generate_recap_instalation/${installation.id_installation }" class="btn btn-primary btn-block"><i class="fa fa-print ml-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
          </div>


          <c:if test="${installation.statut.id_statut_projet==15 }">
            <div class="col-md-auto col-sm-6">
                <a href="/api/infoInstallation/${installation.id_installation }" class="btn btn-primary rounded"><span class="fa fa-plus ml-2"></span> <spring:message code="label.Ameliorerlesdocuments"/></a>
            </div>
          </c:if>
      <c:if test="${renouv=='oui'}">
        <div class="col-md-auto col-sm-6">
          <a class="btn btn-success btn-block" href="/api/newInstallRenouv/${installation.num_demande}"><spring:message code="label.Renouvellement"/> </a>
        </div>
      </c:if>
      </div>

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
                    <a class="accordion-toggle btn ${pageContext.response.locale!="ar"?'text-left':'text-right'} " type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <i class="icon fa fa-user ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i>
                      <spring:message code="label.informationssurlepetitionnaire"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseTwo" class="collapse show fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                  <div class="card-body">
                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12 ">
                        <div class="form-group">
                          <label> <spring:message code="label.Raisonsociale"/>  </label>
                          <input type="text" disabled value="${installation.raison}" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.if"/></label>
                          <input type="text" disabled value="${installation.ife}" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Adresse"/> </label>
                          <textarea disabled rows ="2" class="form-control">${installation.adresse} </textarea>
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Tel"/> </label>
                          <input type="tel" disabled value="${installation.tel}" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Fax"/>  </label>
                          <input type="text" disabled value="${installation.fax}" class="form-control">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Email"/> </label>
                          <input type="text" disabled value="${installation.email}" class="form-control">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingOne">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn ${pageContext.response.locale!="ar"?'text-left':'text-right'} collapsed " type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <i class="icon fa fa-briefcase ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i><spring:message code="label.Installationdetraitementdesdechets"/>
                    </a>
                  </h5>
                </div>

                <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                  <div class="card-body">
                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Numerodedemande"/>  </label>
                          <input type="text" disabled value="${installation.num_demande}" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Site"/> <spring:message code="label.delinstallation"/> </label>
                          <input type="text" disabled value="${installation.site}" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Operation"/> </label>
                          <input type="text" disabled value="${installation.operation}" class="form-control">
                        </div>
                      </div>
                    </div>



                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.descriptiondinstallation"/> </label>
                          <input type="text" disabled value="${installation.description}" class="form-control">
                        </div>
                      </div>

                      <%--<div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.structuredinstallation"/>   </label>
                          <input type="text" disabled value="${installation.structure}" class="form-control">
                        </div>
                      </div>--%>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label> <spring:message code="label.Quantite"/>  </label>
                          <input type="text" disabled value="${installation.quantite}" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.TypeAppareil"/>  </label>
                          <input type="text" disabled value="${installation.type_appareil}" class="form-control">
                        </div>
                      </div>
<%--                      <div class="col-md-4 col-sm-12">--%>
<%--                        <div class="form-group">--%>
<%--                          <label> <spring:message code="label.Quantite"/>  </label>--%>
<%--                          <input type="text" disabled value="${installation.quantite}" class="form-control">--%>
<%--                        </div>--%>
<%--                      </div>--%>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Unite"/>  </label>
                          <input type="text" disabled value="${installation.unite.nom_fr}" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row mb-2">
                      <div class="col-12">
                        <c:if test="${installation.type=='2'}">
                          <section class="border p-2"><h5 class="text-center"><spring:message code="label.Vousavezselectionnélesdechetssuivant"/> </h5></section>
                          <div class="panel-body table-responsive">
                            <table class="table table-hover">
                              <thead>
                              <tr class="active">
                                <th><spring:message code="label.code"/></th>
                                <th><spring:message code="label.type"/></th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${installation.code}" var="code">
                                <tr>
                                  <td>${code.nom_fr}</td>
                                  <td>${code.nom_ar}</td>
                                </tr>
                              </c:forEach>
                              <c:if test="${empty installation.code}">
                                <tr>
                                  <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                </tr>
                              </c:if>

                              </tbody>
                            </table>
                          </div>
                        </c:if>
                        <c:if test="${installation.type=='1'}">
                          <section class="border p-2"><h5 class="text-center"><spring:message code="label.Vousavezselectionnetouslescodesalexceptiondelalistecidessous"/></h5></section>
                          <div class="panel-body table-responsive">
                            <table class="table table-hover my_table">
                              <thead>
                              <tr class="active">
                                <th><spring:message code="label.code"/></th>
                                <th><spring:message code="label.type"/></th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${installation.code}" var="code">
                                <tr>
                                  <td>${code.nom_fr}</td>
                                  <td>${code.nom_ar}</td>
                                </tr>
                              </c:forEach>
                              <c:if test="${empty installation.code && installation.type!='3'}">
                                <tr>
                                  <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                </tr>
                              </c:if>

                              </tbody>
                            </table>
                          </div>
                        </c:if>
                        <c:if test="${installation.type=='3'}">
                          <section>
                            <h5 class="text-center"><spring:message code="label.Vousavezselectionnetouslescodes"/> </h5>
                          </section>
                        </c:if>
                        <c:if test="${installation.type=='0'}">
                          <h3 class="text-center"><spring:message code="label.Vousavezdroitalescategoriessuivant"/> </h3>
                          <c:forEach items="${installation.categorie}" var="c">
                            <p>- ${c.nom_fr}</p>
                          </c:forEach>
                        </c:if>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingThree">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} " type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <i class="icon fa fa-user-clock ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i>
                      <spring:message code="label.Equipedetravail"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Nombredequipe"/></label>
                          <input disabled type="text" class="form-control" value="${installation.nbr_equipe_travail}">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Horairedexploitation"/></label>
                          <input disabled type="text" class="form-control" value="${installation.horaire_exploitation}">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Nbrdeffectif"/></label>
                          <input type="text" class="form-control" disabled value="${installation.formation}">
                        </div>
                      </div>
                      <!--<div class="col-md-6 col-sm-12">
              <div class="form-group">
                <a href="/downloadFile/${fn:replace(installation.qualification,"/assets/myFile/","")}"" download target="_blank" class="btn btn-success btn-block">Télécharger fichier Qualification</a>
              </div>
            </div>-->

                    </div>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingFour">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} " type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      <i class="icon fa fa-file-pdf ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i><spring:message code="label.Piecesaccompagnelademande"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseFour" class="collapse fade" aria-labelledby="headingFour" data-parent="#accordionExample">
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
                          <td colspan="2"><spring:message code="label.AucunFichier"/>  </td>
                        </tr>
                      </c:if>

                    </table>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingFive">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale!="ar"?'text-left':'text-right'} " type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                      <i class="icon fa fa-file-download ${pageContext.response.locale!="ar"?'mr-3':'ml-3'}"></i><spring:message code="label.ListedesTelechargements"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseFive" class="collapse fade" aria-labelledby="headingFive" data-parent="#accordionExample">
                  <div class="card-body">
                    <table class="table my_table table-striped table-bordered table-hover">
                      <tr>
                        <c:if test="${not empty installation.document_attache }">
                        <td style="width: 93%">
                          <spring:message code="label.Rapportdeconformite"/>
                        </td>
                        <td class="text-center">

                            <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(installation.document_attache,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>

                        </td>
                        </c:if>
                      </tr>
                      <tr>
                        <c:if test="${not empty installation.url_doc_signer }">
                        <td style="width: 93%">
                          <spring:message code="label.Lautorisationsignee"/>
                        </td>
                        <td class="text-center">
                          <a  class="btn btn-success" href="/downloadFile/${fn:replace(installation.url_doc_signer,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                        </td>
                        </c:if>
                      </tr>
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


</c:if>
<c:if test="${(empty installation ) }"><spring:message code="label.Aucunresultat"/> </c:if>
<jsp:include page="../../includes/footer1.jsp" />
