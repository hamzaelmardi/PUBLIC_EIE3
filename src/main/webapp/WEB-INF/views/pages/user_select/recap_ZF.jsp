<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../../includes/head.jsp" />
<style>
  .modal_lang_ArFr{
    direction: ${pageContext.response.locale=='ar'?'rtl':'ltr'};
  }
  .modal_close_lang{
    margin: ${pageContext.response.locale=='ar'?'-1rem auto -1rem -1rem':'-1rem -1rem -1rem auto'};;
  }
  .modal_body_lang{
    text-align: ${pageContext.response.locale=='ar'?'right':'left'} !important;
  }

  /*.fad{
    //float: ${pageContext.response.locale=="ar"?"right":""};
    position: relative;
   // left: ${pageContext.response.locale=="ar"?"8px":""};
    top: ${pageContext.response.locale=="ar"?"2px":""};
  }*/
</style>
<c:if test="${not empty notification}">
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );

    function updatePdf(id) {

      fetch('/api/test/'+id)
              .then(resp => resp.blob())
              .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Notification.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
              });

    }
    function updatePdfmouvement(id) {

      fetch('/api/okPDF/'+id)
              .then(resp => resp.blob())
              .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Mouvement.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
              });

    }
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
  </style>
  <div class="row-fluid mt-5" style="margin-top: 220px !important;">
    <div class="col-12">
      <c:choose>


        <c:when test="${type=='ZF'}">
          <spring:message code="label.Importationdechetszonefranche" var="p_page"/>
        </c:when>
        <c:when test="${type=='ET'}">
          <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="p_page"/>
        </c:when>
        <c:when test="${type=='XD'}">
          <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
        </c:when>
        <c:when test="${type=='TR'}">
          <spring:message code="label.Transitdesdechets" var="p_page"/>
        </c:when>
        <c:otherwise>
          <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        </c:otherwise>
      </c:choose>

      <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
        <ol class="breadcrumb" style="margin-top: 10%">
          <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
          <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/${type}" >${p_page}</a></li>
        </ol>
      </nav>
    </div>
  </div>

  <div class="row justify-content-center pl-3 pr-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-12">
      <div class="jumbotron p-3" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
      <spring:message code="label.Statutdelademande"/>   :
        <span class="text-success h4 font-weight-bold">
<%--           statut  66= a changé à la demande de chef Amal--%>
<%--  <c:if test="${(notification.statut.id_statut_projet==84 || notification.statut.id_statut_projet==37 ||notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==63 ||notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65 ||notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68 ||notification.statut.id_statut_projet==40|| notification.statut.id_statut_projet==86 || notification.statut.id_statut_projet==85)}">--%>
          <c:if test="${(notification.statut.id_statut_projet==92 || notification.statut.id_statut_projet==94 || notification.statut.id_statut_projet==93 || notification.statut.id_statut_projet==84 || notification.statut.id_statut_projet==37 ||notification.statut.id_statut_projet==54  ||notification.statut.id_statut_projet==64 ||notification.statut.id_statut_projet==96 ||notification.statut.id_statut_projet==97 || notification.statut.id_statut_projet==65 ||notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68 ||notification.statut.id_statut_projet==40|| notification.statut.id_statut_projet==86 || notification.statut.id_statut_projet==85 || notification.statut.id_statut_projet==52 || notification.statut.id_statut_projet==48)}">${pageContext.response.locale=='ar'?notification.statut.nom_ar:notification.statut.nom_fr}</c:if>
<%--  <c:if test="${(notification.statut.id_statut_projet!=84 && notification.statut.id_statut_projet!=37 &&notification.statut.id_statut_projet!=54 && notification.statut.id_statut_projet!=63 &&notification.statut.id_statut_projet!=64 && notification.statut.id_statut_projet!=65 &&notification.statut.id_statut_projet!=67 && notification.statut.id_statut_projet!=68 &&notification.statut.id_statut_projet!=40&& notification.statut.id_statut_projet!=86 && notification.statut.id_statut_projet!=85)}">--%>
          <c:if test="${(notification.statut.id_statut_projet!=92 && notification.statut.id_statut_projet!=94 && notification.statut.id_statut_projet!=93 && notification.statut.id_statut_projet!=84 && notification.statut.id_statut_projet!=37 &&notification.statut.id_statut_projet!=54  &&notification.statut.id_statut_projet!=64 &&notification.statut.id_statut_projet!=96 &&notification.statut.id_statut_projet!=97 && notification.statut.id_statut_projet!=65 &&notification.statut.id_statut_projet!=67 && notification.statut.id_statut_projet!=68 &&notification.statut.id_statut_projet!=40&& notification.statut.id_statut_projet!=86 && notification.statut.id_statut_projet!=85 && notification.statut.id_statut_projet!=52 && notification.statut.id_statut_projet!=48)}">${pageContext.response.locale=='ar'?'في طور المعالجة':'En cours de traitement'}</c:if>
        </span>
        <span>
          <c:if test="${notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==55 || notification.statut.id_statut_projet==56 || notification.statut.id_statut_projet==57 }"> <i class="fa fa-info-circle ml-3" style="color: #f1c40f; font-size: 20px"></i><spring:message code="label.deplacezpourlobtentiondevotreautorisation"/> </c:if>
          <c:if test="${notification.statut.id_statut_projet==84}"> <i class="fa fa-info-circle ml-3" style="color: #f1c40f; font-size: 20px"></i><spring:message code="label.deplacezpourlobtentiondevotrelettreoriginale"/> </c:if>
          <c:if test="${notification.statut.id_statut_projet==64}"> <i class="fa fa-info-circle ml-3" style="color: #f1c40f; font-size: 20px"></i><spring:message code="label.Vouspouvezvousdplacezpourlobtenionvotregarantiefinancire"/> </c:if>
        </span>
      </div>
    </div>
  </div>

  <div class="row justify-content-center mb-2" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-10" style="margin-right: ${pageContext.response.locale=="ar"?"13px":"-13px"}">
      <div class="row p-0 mt-2"  style="float: ${pageContext.response.locale=="ar"?"right":"left"}">
        <div class="col-md-auto col-sm-6 col-mt-4" >
          <a href="/api/generate_recap_imp/${notification.id_notification }" class="mt-1 mb-1 btn btn-primary btn-block"><i class="fa fa-print ml-2" title="Améliorer les documents"></i><spring:message code="label.printRecap"/></a>
        </div>
        <c:if test="${notification.statut.id_statut_projet==29 }">
          <a href="/api/addNumNotification/${type }/${notification.id_notification }" class="btn btn-warning"><i class="fa fa-edit " title="Modifier" style="margin:0 !important"></i></a>

        </c:if>
        <c:if test="${notification.statut.id_statut_projet==48 }">
          <div class="col-md-auto col-sm-6">
            <a href="/api/addDemandNotification/${notification.id_notification}/${type}/N" class="mt-1 mb-1 btn btn-primary btn-block"><i class="fa fa-pen ml-2" title="Améliorer les documents" ></i><spring:message code="label.modifier"/></a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==84}">
          <div class="col-md-auto col-sm-6">
            <a href="/downloadFile/${fn:replace(notification.url_lettre_conforme,"/assets/myFile/","")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2" ></i><spring:message code="label.Telechargerlalettredeconsentement"/> </a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==40 }">
          <div class="col-md-auto col-sm-6">
            <a type="button" style="background-color: #0db8db" href="/api/downloadDocNonFavZF/${notification.id_notification }" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2"></i><spring:message code="label.Telechargerlautorisationsignee"/></a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF') && notification.classification.id_classification==1 && (notification.statut.id_statut_projet==92 || notification.statut.id_statut_projet==63 || notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65 || notification.statut.id_statut_projet==66 || notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68 || notification.statut.id_statut_projet==93)}">
          <div class="col-md-auto col-sm-6">
            <a href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2" ></i><spring:message code="label.Telechargerlautorisationsignee"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF') && notification.classification.id_classification==2 && (notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==95 || notification.statut.id_statut_projet==96 || notification.statut.id_statut_projet==97)}">
          <div class="col-md-auto col-sm-6">
            <a href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2" ></i><spring:message code="label.Telechargerlautorisationsignee"/> </a>
          </div>
        </c:if>
        <c:if test="${notification.statut.id_statut_projet==37 }">
           <div class="col-md-auto col-sm-6">
          <a href="/api/validateDoc/${notification.id_notification }/${type}" class="btn btn-primary btn-block"><i class="fa fa-pencil-ruler ml-2" title="Améliorer les documents" style="font-size: 12px"></i><spring:message code="label.Ameliorerlesdocuments"/></a>
          </div>
        </c:if>
        <c:if test="${(type=='TR') && (notification.statut.id_statut_projet==54)}">
          <div class="col-md-auto col-sm-6">
            <a href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2" ></i><spring:message code="label.Telechargerlalettresigne"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ET') && (notification.statut.id_statut_projet==54)}">
          <div class="col-md-auto col-sm-6">
            <a href="/downloadFile/${fn:replace(notification.url_doc_signer, "/assets/myFile/","")}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-upload ml-2" ></i><spring:message code="label.Telechargerlautorisationsignee"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==92) }">
          <div class="col-md-auto col-sm-6">
            <a href="/api/addDocmouvement/${notification.id_notification}" class="btn btn-primary btn-block mb-1 mt-1"><i class="fa fa-plus ml-2" ></i><spring:message code="label.lecertificatdelimination"/> </a>
          </div>
        </c:if>
        <c:if test="${(type=='ZF' || type=='XD') && (notification.statut.id_statut_projet==92|| notification.statut.id_statut_projet==68 ) && notification.classification.id_classification==1 }">
          <div class="col-md-auto col-sm-6">
            <button onclick="load_modal_transporteur('${notification.id_notification}')" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-truck ml-2" ></i><spring:message code="label.Declarerunnouveautransporteur"/>  </button>
          </div>
        </c:if>
        <c:if test="${(type=='ZF') && (notification.statut.id_statut_projet==66 || notification.statut.id_statut_projet==68  || notification.statut.id_statut_projet==67) && notification.classification.id_classification==1 }">
          <div class="col-md-auto col-sm-6">
            <a href="/api/addDocmouvement/${notification.id_notification}" class="btn btn-primary btn-block mt-1 mb-1"><i class="fa fa-plus ml-2" ></i><spring:message code="label.Declarationdunecertificatdelimination"/> </a>
          </div>
        </c:if>


      </div>

    </div>
  </div>

  <div class="row justify-content-center pl-2 pr-2" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-10">
      <div class="bg-white" id="accordion-style-1">
        <div class="row">
          <div class="col-12">
            <div class="accordion" id="accordionExample">
              <c:if test="${type=='XD' || type=='ZF'}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingOne1">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                        <i class="icon fa fa-sort ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Numerodenotification"/>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
                    <div class="card-body">
                      <div class="row m-0 p-0 mt-2">
                        <div class="col-6">
                          <div class="form-group">
                            <label><spring:message code="label.Numerodenotification"/></label>
                            <input class="form-control" value="${notification.num_notification}" disabled>
                          </div>
                        </div>

                        <div class="col-6">
                          <div class="form-group">
                            <label><spring:message code="label.classification"/> </label>
                            <input class="form-control" value="${pageContext.response.locale=="ar"?notification.classification.nom_ar:notification.classification.nom_fr}" disabled>
                          </div>
                        </div>
                      </div>
                      <div class="row m-0 p-0 mt-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.code"/> </label>
                            <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.typededechet"/> </label>
                            <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="row m-0 p-0 mt-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label>
                              <c:choose>
                                <c:when test="${type=='ZF'}">
                                  <spring:message code="label.ZoneFranche"/>
                                </c:when>
                                <c:when test="${type=='ET'}">
                                  <spring:message code="label.pays"/>
                                </c:when>
                                <c:otherwise>
                                  <spring:message code="label.PaysEtranger"/>
                                </c:otherwise>
                              </c:choose>
                            </label>
                            <input type="text" disabled value="${pageContext.response.locale!='ar'?notification.zonneFranche.nom_fr:notification.zonneFranche.nom_ar} ${pageContext.response.locale!='ar'?notification.pays.nom_fr:notification.pays.nom_ar}" class="form-control">
                          </div>
                        </div>


                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.quantitetotaleprevu"/></label>
                            <input type="text" disabled value="${notification.quantite}" class="form-control">
                          </div>
                        </div>
                      </div>

                      <div class="row m-0 p-0 mt-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Unite"/>  </label>
                            <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.unite.nom_ar:notification.unite.nom_fr}" class="form-control">
                          </div>
                        </div>

                      </div>

                    </div>
                  </div>
                </div>
              </c:if>
              <c:if test="${notification.zf_et!='ZF'}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingOne">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <i class="icon fa fa-user-circle ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.ExportateurNotifiant"/>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseOne" class="collapse ${notification.zf_et=='XD'?'':'show'} fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <c:if test="${notification.zf_et!='TR' && notification.zf_et != 'XD'}">
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.NomdelexportateurNotifiant"/> </label>
                              <input type="text" disabled value="${notification.nom}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Operation"/> </label>
                              <input type="text" disabled value="${notification.operation}" class="form-control">
                            </div>
                          </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.code"/> </label>
                              <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.typededechet"/> </label>
                              <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                            </div>
                          </div>
                        </div>

                          <div class="row mb-2">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                              </div>
                            </div>
                            <c:if test="${!notification.zf_et.equals('ET')}">
                              <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                  <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                  <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                                </div>
                              </div>
                            </c:if>
                          </div>

                          <div class="row mb-2">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                <input class="form-control" type="text" disabled value="${notification.codeCE}">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12 ">
                              <div class="form-group">
                                <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                <input class="form-control" type="text" disabled value="${notification.etat}">
                              </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Quantiteestime"/></label>
                              <input type="text" disabled value="${notification.quantite}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Unite"/>  </label>
                              <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.unite.nom_ar:notification.unite.nom_fr}" class="form-control">
                            </div>
                          </div>
                        </div>
                      </c:if>
                      <c:if test="${notification.zf_et=='XD'}">
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> Nom de la société </label>
                              <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label dir="rtl"> اسم الشركة </label>
                              <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text" class="form-control">
                            </div>
                          </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.personneacontacter"/> </label>
                              <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                            </div>
                          </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Adresse"/> </label>
                              <textarea disabled rows ="2" class="form-control">${notification.importateur.adresse_fr} </textarea>
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Telephone"/> </label>
                              <input value="${notification.importateur.tel}" disabled type="text" class="form-control">
                            </div>
                          </div>
                        </div>


                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Region"/>  </label>
                              <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.region.nom_ar:notification.region.nom_fr}" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.Province"/>  </label>
                              <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.prefecture.nom_ar:notification.prefecture.nom_fr}" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.Telecopie"/>  </label>
                              <input value="${notification.importateur.fax}" disabled type="text" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label> <spring:message code="label.courrierelectronique"/> </label>
                              <input value="${notification.importateur.mail}" disabled type="text" class="form-control">
                            </div>
                          </div>
                        </div>
                      </c:if>
                      <c:if test="${notification.zf_et=='TR'}">
                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.NomdelexportateurNotifiant"/></label>
                              <input class="form-control" type="text" disabled value="${notification.nom}">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.Telecopie"/></label>
                              <input class="form-control" type="text" disabled value="${notification.telecopie}">
                            </div>
                          </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.personneacontacter"/></label>
                              <input class="form-control" type="text" disabled value="${notification.personne}">
                            </div>
                          </div>

                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.Tel"/></label>
                              <input class="form-control" type="text" disabled value="${notification.tel}">
                            </div>
                          </div>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.courrierelectronique"/></label>
                              <input class="form-control" type="text" disabled value="${notification.courrier}">
                            </div>
                          </div>

                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.Adresse"/></label>
                              <textarea disabled rows ="2" class="form-control">${notification.adresse} </textarea>
                            </div>
                          </div>
                        </div>


                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                              <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                            </div>
                          </div>
                          <c:if test="${!notification.zf_et.equals('ET')}">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                              </div>
                            </div>
                          </c:if>
                        </div>

                        <div class="row mb-2">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                              <input class="form-control" type="text" disabled value="${notification.codeCE}">
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-12 ">
                            <div class="form-group">
                              <c:choose>
                                <c:when test="${notification.zf_et.equals('XD')}">
                                  <label><spring:message code="label.Etatdexportationdexpedition"/></label>
                                </c:when>
                                <c:when test="${notification.zf_et.equals('TR')}">
                                  <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                                </c:when>
                                <c:otherwise>
                                  <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                </c:otherwise>
                              </c:choose>
                              <input class="form-control" type="text" disabled value="${notification.etat}">
                            </div>
                          </div>
                        </div>

                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>
              <div class="panel">
                <div class="card-header panel-heading" id="headingTwo">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <i class="icon fa fa-user-friends"></i>
                      <c:if test="${!type.equals('ZF')}"><spring:message code="label.ImportateurDestinataire"/> </c:if>
                      <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/> </c:if>
                    </a>
                  </h5>
                </div>
                <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                  <div class="card-body">
                    <c:if test="${notification.zf_et=='XD'}">
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Nomdelimportateurdestinataire"/></label>
                            <input class="form-control" type="text" disabled value="${notification.nom}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Telecopie"/></label>
                            <input class="form-control" type="text" disabled value="${notification.telecopie}">
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.personneacontacter"/></label>
                            <input class="form-control" type="text" disabled value="${notification.personne}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Tel"/></label>
                            <input class="form-control" type="text" disabled value="${notification.tel}">
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.courrierelectronique"/> </label>
                            <input class="form-control" type="text" disabled value="${notification.courrier}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <textarea disabled rows ="2" class="form-control">${notification.adresse} </textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                            <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                          </div>
                        </div>
                        <c:if test="${!notification.zf_et.equals('ET')}">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                              <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                            </div>
                          </div>
                        </c:if>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                            <input class="form-control" type="text" disabled value="${notification.codeCE}">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12 ">
                          <div class="form-group">
                            <c:choose>
                              <c:when test="${notification.zf_et.equals('XD')}">
                                <label><spring:message code="label.Etatdexportationdexpedition"/></label>
                              </c:when>
                              <c:when test="${notification.zf_et.equals('TR')}">
                                <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                              </c:when>
                              <c:otherwise>
                                <label><spring:message code="label.Etatdimportationdedestination"/></label>
                              </c:otherwise>
                            </c:choose>
                            <input class="form-control" type="text" disabled value="${notification.etat}">
                          </div>
                        </div>
                      </div>
                    </c:if>
                    <c:if test="${notification.zf_et!='XD'}">
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group" ${pageContext.response.locale=='ar'?'rtl':'ltr'}>
                            <label> <spring:message code="label.nomdesociete"/>  </label>
                            <c:choose>
                              <c:when test="${pageContext.response.locale=='ar'}">
                                <input value="${notification.importateur.nom_ar}" type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
                              </c:when>
                              <c:otherwise>
                                <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                              </c:otherwise>
                            </c:choose>
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.personneacontacter"/></label>
                            <input type="text" disabled value="${notification.importateur.contact_fr}" class="form-control">
                          </div>
                        </div>
                      </div>

                      <div class="row mb-2">
                        <div class="col-md-12 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Adresse"/> </label>
                            <textarea disabled rows ="2" class="form-control">${notification.importateur.adresse_fr} </textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Telephone"/>  </label>
                            <input type="text" disabled value="${notification.importateur.tel}" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <c:if test="${notification.zf_et.equals('ET')}">
                              <label> <spring:message code="label.Telecopie"/> </label>
                            </c:if>
                            <c:if test="${!notification.zf_et.equals('ET')}">
                              <label> <spring:message code="label.Fax"/> </label>
                            </c:if>
                            <input type="text" disabled value="${notification.importateur.fax}" class="form-control">
                          </div>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <c:if test="${notification.zf_et.equals('ET')}">
                              <label><spring:message code="label.courrierelectronique"/> </label>
                            </c:if>
                            <c:if test="${!notification.zf_et.equals('ET')}">
                              <label><spring:message code="label.Email"/> </label>
                            </c:if>
                            <input type="text" disabled value="${notification.importateur.mail}" class="form-control">
                          </div>
                        </div>
                        <c:if test="${type.equals('ZF')}">
                          <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                              <label><spring:message code="label.Identifiantfiscale"/> </label>
                              <input type="text" disabled value="${notification.importateur.idf}" class="form-control">
                            </div>
                          </div>
                        </c:if>
                      </div>

                      <c:if test="${!type.equals('TR')}">
                      <div class="row mb-2">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Region"/> </label>
                            <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.region.nom_ar:notification.region.nom_fr}" class="form-control">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label> <spring:message code="label.Province"/>  </label>
                            <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.prefecture.nom_ar:notification.prefecture.nom_fr}" class="form-control">
                          </div>
                        </div>
                      </div>
                      </c:if>
                    </c:if>
                  </div>

                </div>
              </div>
              <c:if test="${notification.zf_et=='XD' || notification.zf_et=='TR'}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingThree">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        <i class="icon fa fa-user-circle ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                        <c:if test="${notification.zf_et=='XD'}">
                          <spring:message code="label.Autoritedimportation"/>
                        </c:if>
                        <c:if test="${notification.zf_et=='TR'}">
                          <spring:message code="label.Autoritedetransit"/>
                        </c:if>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                      <c:if test="${notification.zf_et=='XD'}">
                        <div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Denominationdelautorite"/> </label>
                                <input disabled class="form-control" value="${notification.autorite.denomination}" type="text">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Email"/></label>
                                <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Adresse"/></label>
                                <textarea disabled rows ="2" class="form-control">${notification.autorite.adresse} </textarea>
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Genre"/> </label>
                                <input disabled class="form-control" value="${notification.autorite.genre_A}" type="text">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Tel"/></label>
                                <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Fax"/></label>
                                <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label>
                                  <spring:message code="label.PaysEtranger"/>
                                </label>
                                <input disabled class="form-control" value="${notification.pays.nom_fr}" type="text">
                              </div>
                            </div>
                          </div>
                        </div>
                      </c:if>


                      <c:if test="${notification.zf_et=='TR'}">
                        <div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Genre"/> </label>
                                <input disabled class="form-control" value="${notification.autorite.genre_A}" type="text">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Username"/> </label>
                                <input disabled class="form-control" value="${notification.autorite.denomination}" type="text">
                              </div>
                            </div>

                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Qualite"/> </label>
                                <input disabled class="form-control" value="${notification.autorite.poste}" type="text">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Email"/></label>
                                <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Tel"/></label>
                                <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Fax"/></label>
                                <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.Adresse"/></label>
                                <textarea disabled rows ="2" class="form-control">${notification.autorite.adresse} </textarea>
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <label><spring:message code="label.pay"/> </label>
                                <input disabled class="form-control" value="${pageContext.response.locale=='ar'?notification.autorite.pays.nom_ar:notification.autorite.pays.nom_fr}" type="text">
                              </div>
                            </div>
                          </div>
                          <table class="table my_table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                              <th><spring:message code="label.pay"/></th>
                              <th><spring:message code="label.Autorite"/></th>
                              <th> <spring:message code="label.Autorisationdesdechets"/> </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty notification.paysAutorites}">
                              <c:forEach items="${notification.paysAutorites}" var="tr">
                                <tr>
                                  <td>${pageContext.response.locale=='ar'?tr.pays.nom_ar:tr.pays.nom_fr}</td>
                                  <td>${tr.desc_autorite}</td>
                                  <td><a href="/downloadFile/${fn:replace(tr.url_autorite,"/assets/myFile/","")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a></td>
                                </tr>
                              </c:forEach>
                            </c:if>
                            <c:if test="${empty notification.paysAutorites}">
                              <tr>
                                <td class="text-center" colspan="5"><spring:message code="label.Aucuneautorite"/>   </td>
                              </tr>
                            </c:if>
                            </tbody>
                          </table>

                        </div>
                      </c:if>


                    </div>

                  </div>
                </div>
              </c:if>
              <div class="panel">
                <div class="card-header panel-heading" id="headingFor">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseFor" aria-expanded="false" aria-controls="collapseFor">
                      <i class="icon fa fa-file-download ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                      <div class="row justify-content-end">
                        <span class="col-lg-10 col-md-7 col-sm12"><spring:message code="label.Documentdenotification"/></span>
                        <button style="font-size: 12px !important; background-color: #ffc107;" type="button"  id="Suivante" onclick="updatePdf(${notification.id_notification })" class="btn btn-sm col-lg-2 col-md-5 col-sm-12  text-white">
                          <spring:message code="label.Documentdenotification"/>
                        </button>
                      </div>
                    </a>
                  </h5>
                </div>
                <div id="collapseFor" class="collapse fade" aria-labelledby="headingFor" data-parent="#accordionExample">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.quantitetotaleprevu"/></label>
                          <input disabled type="text" class="form-control" value="${notification.quantite}">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Nombretotalexpeditionsprevues"/></label>
                          <input disabled type="text" class="form-control" value="${notification.expedition}">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Operation"/></label>
                          <input disabled type="text" class="form-control" value="${notification.operation}">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.notificationconcernant"/></label>
                          <input disabled type="text" class="form-control" value="${notification.uniques}">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Premierdepart"/></label>
                          <input disabled class="form-control" value="${notification.premier}" type="text">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Dernierdepart"/></label>
                          <input disabled class="form-control" value="${notification.dernier}" type="text">
                        </div>
                      </div>
                    </div>

                    <div class="row">

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Nomdeladestinationfinale"/></label>
                          <input disabled class="form-control" value="${notification.installationAutorise.raison}" type="text">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Prescriptionsspecialesdemanutention"/></label>
                          <input disabled class="form-control" value="${notification.manutention}" type="text">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Caracteristiquesphysiques"/></label>
                          <c:if test="${notification.caracteristquePhysique.id_classification!=5}">
                            <input disabled class="form-control" value="${pageContext.response.locale!='ar'?notification.caracteristquePhysique.nom_fr:notification.caracteristquePhysique.nom_ar}" type="text">
                          </c:if>
                          <c:if test="${notification.caracteristquePhysique.id_classification==5}">
                            <input disabled class="form-control" value="${notification.autre}" type="text">
                          </c:if>
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Typedeconditionnement"/></label>
                          <input disabled class="form-control" value="${pageContext.response.locale!='ar'?notification.typeconditionnement.nom_fr:notification.typeconditionnement.nom_ar}" type="text">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <c:if test="${notification.operation=='traitement'}">
                            <label><spring:message code="label.Operationdelimination"/></label>
                          </c:if>
                          <c:if test="${notification.operation=='valorisation'}">
                            <label><spring:message code="label.Operationdevalorisation"/></label>
                          </c:if>
                          <input disabled class="form-control" value="${notification.operationdelimination}" type="text">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label>Code H</label>
                          <input disabled class="form-control" value="${notification.codeH}" type="text">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingFive">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                      <i class="icon fa fa-file-contract ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                      <div class="row justify-content-end">
                        <span class="col-lg-10 col-md-7 col-sm12"><spring:message code="label.documentdemouvement"/></span>
                        <button style="font-size: 12px !important; background-color: #ffc107;" type="button"  onclick="updatePdfmouvement('${notification.id_notification}')" class="btn btn-sm col-lg-2 col-md-5 col-sm-12 text-white">
                          <spring:message code="label.documentdemouvement"/>
                        </button>
                      </div>
                    </a>
                  </h5>
                </div>
                <div id="collapseFive" class="collapse fade" aria-labelledby="headingFive" data-parent="#accordionExample">
                  <div class="card-body">

                  </div>
                </div>
              </div>
              <c:if test="${notification.zf_et=='ET' ||notification.zf_et=='XD' || notification.zf_et=='ZF'}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingZero">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseZero" aria-expanded="false" aria-controls="collapseZero">
                        <i class="icon fa fa-truck-pickup ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.transporteurprevu"/>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseZero" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="collapse fade" aria-labelledby="headingZero" data-parent="#accordionExample">
                    <div class="card-body">
                      <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==1}">
                        <div class="table-responsive">
                          <table id="tableProfils"
                                 class="table my_table table-striped hover compact table-bordered text-md-nowrap">
                            <thead class="thead-bleu">
                            <tr>
                              <th class=""><spring:message code="label.nomdesociete"/></th>
                              <th class=""><spring:message code="label.Identifiantfiscale"/></th>
                              <th class=""><spring:message code="label.Tel"/></th>
                              <th class=""><spring:message code="label.Fax"/></th>
                              <th class=""><spring:message code="label.Adresse"/></th>
                            </tr>
                            </thead>
                            <tbody id="tbodyTransporteur">
                            <c:forEach items="${notification.transporteur}" var="Tr_l">
                              <tr>
                                <td>${Tr_l.nom} </td>
                                <td>${Tr_l.identifiant} </td>
                                <td>${Tr_l.tel} </td>
                                <td>${Tr_l.fax} </td>
                                <td>${Tr_l.adresse} </td>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </c:if>
                      <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==2}">
                      <div class="table-responsive">
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" >
                          <thead>
                          <tr>
                            <th> <spring:message code="label.nomdesociete"/> </th>
                            <th> <spring:message code="label.NMatriculation"/> </th>
                            <th> <spring:message code="label.Typedetransport"/> </th>
                            <th> <spring:message code="label.Assurance"/> </th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:if test="${not empty notification.transporteur_etranger}">
                            <c:forEach items="${notification.transporteur_etranger}" var="tr">
                              <tr>
                                <c:if test="${tr.type=='tn'}">
                                  <td>${tr.raison_social}</td>
                                  <td>${tr.num_matricule}</td>
                                  <td>${tr.typeVehicule}</td>
                                  <td class="text-center"><a download="assurance" target="_blank" href="/downloadFile/${fn:replace(tr.url_assurance,"/assets/myFile/","")}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                                </c:if>
                              </tr>
                            </c:forEach>
                          </c:if>
                          <c:if test="${not empty declaration}">
                            <tr class="bg-primary">
                              <td>${declaration.transporteurParam.nom}</td>
                              <td>${declaration.transporteurParam.identifiant}</td>
                              <td>${declaration.transporteurParam.tel}</td>
                              <td>${declaration.transporteurParam.fax}</td>
                              <td>${declaration.transporteurParam.adresse}</td>
                            </tr>
                          </c:if>
                          <c:if test="${(empty notification.transporteur_etranger && empty declaration)}">
                            <tr>
                              <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/> </td>
                            </tr>
                          </c:if>
                          </tbody>
                        </table>
                      </div>
                      </c:if>
                      <c:if test="${notification.zf_et !='ZF' && notification.zf_et!='XD'}">
                      <div class="table-responsive">
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" >
                          <thead>
                          <tr>
                            <th> <spring:message code="label.nomdesociete"/> </th>
                            <th> <spring:message code="label.NMatriculation"/> </th>
                            <th> <spring:message code="label.Typedetransport"/> </th>
                            <th> <spring:message code="label.Assurance"/> </th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:if test="${not empty notification.transporteur_etranger}">
                            <c:forEach items="${notification.transporteur_etranger}" var="tr">
                              <tr>
                                <c:if test="${tr.type=='tn'}">
                                  <td>${tr.raison_social}</td>
                                  <td>${tr.num_matricule}</td>
                                  <td>${tr.typeVehicule}</td>
                                  <td class="text-center"><a download="assurance" target="_blank" href="/downloadFile/${fn:replace(tr.url_assurance,"/assets/myFile/","")}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                                </c:if>
                              </tr>
                            </c:forEach>
                          </c:if>
                          <c:if test="${not empty declaration}">
                            <tr class="bg-primary">
                              <td>${declaration.transporteurParam.nom}</td>
                              <td>${declaration.transporteurParam.identifiant}</td>
                              <td>${declaration.transporteurParam.tel}</td>
                              <td>${declaration.transporteurParam.fax}</td>
                              <td>${declaration.transporteurParam.adresse}</td>
                            </tr>
                          </c:if>
                          <c:if test="${(empty notification.transporteur_etranger && empty declaration)}">
                            <tr>
                              <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/> </td>
                            </tr>
                          </c:if>
                          </tbody>
                        </table>
                      </div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>
              <c:if test="${notification.zf_et=='XD' || notification.zf_et=='ET' ||notification.zf_et=='TR'}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingZero1">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseZero1" aria-expanded="false" aria-controls="collapseZero1">
                        <i class="icon fa fa-truck ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.TransporteurInternational"/>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseZero1" class="collapse fade" aria-labelledby="headingZero1" data-parent="#accordionExample">
                    <div class="card-body table-responsive">
                      <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                        <thead>
                        <tr>
                          <th> <spring:message code="label.nomdesociete"/> </th>
                          <th> <spring:message code="label.Typedetransport"/> </th>
                          <th> <spring:message code="label.Assurance"/> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty notification.transporteur_etranger}">
                          <c:forEach items="${notification.transporteur_etranger}" var="tr">
                            <tr>
                              <c:if test="${tr.type=='ti'}">
                                <td>${tr.raison_social}</td>
                                <td>${tr.typeVehicule}</td>
                                <td class="text-center">
                                  <c:if test="${not empty tr.url_assurance}">
                                  <a download="assurance" target="_blank" href="/downloadFile/${fn:replace(tr.url_assurance,"/assets/myFile/","")}" class="btn btn-success rounded">
                                    <span class="fa fa-download"></span>
                                  </a>
                                  </c:if>
                                  <c:if test="${empty tr.url_assurance}">
                                    <spring:message code="label.aucuneAssurance"/>
                                  </c:if>
                                </td>
                              </c:if>
                            </tr>
                          </c:forEach>
                        </c:if>
                        <c:if test="${empty notification.transporteur_etranger}">
                          <tr>
                            <td class="text-center" colspan="5"><spring:message code="label.AucunTransporteur"/></td>
                          </tr>
                        </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </c:if>
              <div class="panel">
                <div class="card-header panel-heading" id="headingSix">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                      <i class="icon fa fa-box-open ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i>
                      <c:if test="${notification.zf_et=='XD'}"><spring:message code="label.producteursdesdechets"/></c:if>
                      <c:if test="${notification.zf_et.equals('ET')}"><spring:message code="label.producteursdedechet"/></c:if>
                      <c:if test="${notification.zf_et!='XD' && !notification.zf_et.equals('ET')}"><spring:message code="label.producteur"/> </c:if>
                    </a>
                  </h5>
                </div>
                <div id="collapseSix" class="collapse fade" aria-labelledby="headingSix" data-parent="#accordionExample">
                  <div class="card-body table-responsive">
                    <c:if test="${notification.zf_et=='XD'}">
                      <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                        <thead>
                        <tr>
                          <th> <spring:message code="label.personneacontacter"/> </th>
                          <th> <spring:message code="label.Adresse"/> </th>
                          <th> <spring:message code="label.Tel"/> </th>
                          <th> <spring:message code="label.Fax"/> </th>
                          <th> <spring:message code="label.Email"/> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty notification.producteurs}">
                          <c:forEach items="${notification.producteurs}" var="tr">
                            <tr>
                              <td>${tr.contact_fr}</td>
                              <td>${tr.adresse_fr}</td>
                              <td>${tr.tel}</td>
                              <td>${tr.fax}</td>
                              <td>${tr.mail}</td>
                            </tr>
                          </c:forEach>
                        </c:if>

                        <c:if test="${empty notification.producteurs}">
                          <tr>
                            <td class="text-center" colspan="7"><spring:message code="label.AucunTransporteur"/>   </td>
                          </tr>
                        </c:if>
                        </tbody>
                      </table>
                    </c:if>
                    <c:if test="${notification.zf_et!='XD'}">
                        <div class="row">
                          <div class="col-12">
                            <div class="form-group">
                              <label><spring:message code="label.nomdesociete"/></label>
                              <c:choose>
                                <c:when test="">
                                  <input disabled class="form-control" value="${notification.producteur.nom_ar}" type="text">
                                </c:when>
                                <c:otherwise>
                                  <input disabled class="form-control" value="${notification.producteur.nom_fr}" type="text">
                                </c:otherwise>
                              </c:choose>
                            </div>
                          </div>
                        </div>
                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.personneacontacter"/></label>
                            <input disabled class="form-control" value="${notification.producteur.contact_fr}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Identifiantfiscale"/></label>
                            <input disabled class="form-control" value="${notification.producteur.idf}" type="text">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Adresse"/></label>
                            <textarea disabled rows ="2" class="form-control">${notification.producteur.adresse_fr} </textarea>

                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Tel"/></label>
                            <input disabled class="form-control" value="${notification.producteur.tel}" type="text">
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Fax"/></label>
                            <input disabled class="form-control" value="${notification.producteur.fax}" type="text">
                          </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                          <div class="form-group">
                            <label><spring:message code="label.Email"/></label>
                            <input disabled class="form-control" value="${notification.producteur.mail}" type="text">
                          </div>
                        </div>
                      </div>
                    </c:if>

                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingSeven">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
                      <i class="icon fa fa-home ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Installationdevalorisationelimination"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseseven" class="collapse fade" aria-labelledby="headingseven" data-parent="#accordionExample">
                  <div class="card-body">
                    <c:if test="${!notification.zf_et.equals('XD')}">
                      <div class="row">
                        <div class="col-12">
                          <div class="form-group">
                            <label><spring:message code="label.nomdesociete"/></label>
                            <c:choose>
                              <c:when test="">
                                <input disabled class="form-control" value="${notification.eliminateur.nom_ar}" type="text">
                              </c:when>
                              <c:otherwise>
                                <input disabled class="form-control" value="${notification.eliminateur.nom_fr}" type="text">
                              </c:otherwise>
                            </c:choose>
                          </div>
                        </div>
                      </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.personneacontacter"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.contact_fr}" type="text">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Identifiantfiscale"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.idf}" type="text">
                        </div>
                      </div>
                    </div>
                    </c:if>
                    <c:if test="${notification.zf_et.equals('XD')}">
                    <div class="row">
                      <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.personneacontacter"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.contact_fr}" type="text">
                        </div>
                      </div>
                    </div>
                    </c:if>
                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Adresse"/></label>
                          <textarea disabled rows ="2" class="form-control">${notification.eliminateur.adresse_fr} </textarea>
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Tel"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.tel}" type="text">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Fax"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.fax}" type="text">
                        </div>
                      </div>

                      <div class="col-md-6 col-sm-12">
                        <div class="form-group">
                          <label><spring:message code="label.Email"/></label>
                          <input disabled class="form-control" value="${notification.eliminateur.mail}" type="text">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel">
                <div class="card-header panel-heading" id="headingeight">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=="ar"?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
                      <i class="icon fa fa-file-pdf ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Piecesaccompagnelademande"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseeight" class="collapse fade" aria-labelledby="headingeight" data-parent="#accordionExample">
                  <div class="card-body">
                    <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                      <c:if test="${not empty doc}">
                        <c:forEach items="${doc}" var="file">
                          <tr>
                            <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                            <td style="width: 10px;">
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
              <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification==1}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingeight1">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight1" aria-expanded="false" aria-controls="collapseeight1">
                        <i class="icon fa fa-file-signature ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Certificatdelimination"/>
                        <c:if test="${notification.statut.id_statut_projet==63}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==64}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==65}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseeight1" class="collapse fade" aria-labelledby="headingeight1" data-parent="#accordionExample">
                    <div class="card-body" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">

                      <c:if test="${not empty notification.url_certicat_elimination}">
                        <div class="row">
                          <div class="col-md-4 col-sm-12">
                            <label><spring:message code="label.Nombredecolis"/></label>
                            <div class="form-group">
                              <input type="text" class="form-control" disabled value="${notification.nbr_colis}">
                            </div>
                          </div>
                          <div class="col-md-4 col-sm-12">
                            <label><spring:message code="label.Quantiteprevue"/></label>
                            <div class="form-group">
                              <input type="text" class="form-control" disabled value="${notification.quantite}">
                            </div>
                          </div>
                          <div class="col-md-4 col-sm-12">
                            <label><spring:message code="label.Datedevalidationducertificat"/> </label>
                            <div class="form-group">
                              <fmt:formatDate var="date_dp" pattern="dd-MM-yyyy" value="${notification.dateValidation}"/>
                              <input type="text" class="form-control" disabled value="${date_dp}">
                            </div>
                          </div>
                        </div>
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">

                          <div class="row">
                            <div class="col-md-6 col-sm-12">
                              <div class="form-group">
                                <div class="input-group">
                                  <input type="text" class="form-control" value="<spring:message code="label.Certificatdelimination"/> " disabled>
                                  <div class="input-group-append">
                                    <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_certicat_elimination,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <c:if test="${notification.url_quantite_justificatif!=null}">
                              <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                  <div class="input-group">
                                    <input type="text" class="form-control" value="Justificatif" disabled>
                                    <div class="input-group-append">
                                      <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_quantite_justificatif,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </c:if>

                          </div>
                        </table>
                        <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                          <thead>
                          <tr>
                            <th style="width: 50%"> <spring:message code="label.Quantite"/> </th>
                            <th style="width: 50%"> <spring:message code="label.documentdemouvement"/> </th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:if test="${not empty notification.docMouvement}">
                            <c:forEach items="${notification.docMouvement}" var="tr">
                              <tr>
                                <td>${tr.quantite}</td>
                                <td><a class="btn btn-success" href="/downloadFile/${fn:replace(tr.url,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                              </tr>
                            </c:forEach>
                          </c:if>

                          <c:if test="${empty notification.docMouvement}">
                            <tr>
                              <td class="text-center" colspan="5"><spring:message code="label.AucuneQuantite"/>  </td>
                            </tr>
                          </c:if>
                          </tbody>
                        </table>
                      </c:if>
                      <c:if test="${empty notification.url_certicat_elimination}">
                        <p><spring:message code="label.Aucunecertificatdelimination"/> </p>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>
              <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification==2}">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingeight10">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight10" aria-expanded="false" aria-controls="collapseeight10">
                        <i class="icon fa fa-file-signature ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Documentdemouvementapresleliminationdesdechets"/>
                        <c:if test="${notification.statut.id_statut_projet==95}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==96}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==97}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                      </a>
                    </h5>
                  </div>
                  <div id="collapseeight10" class="collapse fade" aria-labelledby="headingeight10" data-parent="#accordionExample">
                    <div class="card-body" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">

                      <c:if test="${not empty notification.url_document_mouvement}">
                        <div class="row">
                          <div class="col-md-6 col-sm-12" style="margin-top: 31px">
                            <div class="form-group">
                              <div class="input-group">
                                <input type="text" class="form-control" value="<spring:message code="label.Documentdemouvementapresleliminationdesdechets"/> " disabled>
                                <div class="input-group-append">
                                  <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_document_mouvement,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-4 col-sm-12">
                            <label><spring:message code="label.Datedevalidationdudocument"/> </label>
                            <div class="form-group">
                              <fmt:formatDate var="date_dp" pattern="dd-MM-yyyy" value="${notification.dateValidation}"/>
                              <input type="text" class="form-control" disabled value="${date_dp}">
                            </div>
                          </div>
                        </div>
                      </c:if>
                      <c:if test="${empty notification.url_document_mouvement}">
                        <p><spring:message code="label.Aucundocumentdemouvement"/> </p>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>
              <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification ==1 }">
                <div class="panel">
                  <div class="card-header panel-heading" id="headingeight2">
                    <h5 class="mb-0 panel-title">
                      <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight2" aria-expanded="false" aria-controls="collapseeight2">
                        <i class="icon fa fa-truck ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.Changementdutransporteur"/>
                        <c:if test="${notification.statut.id_statut_projet==63 || notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65}">
                          <c:if test="${declaration.etat==0}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.Attentedevalidationdutransporteur"/> </span></c:if>
                          <c:if test="${declaration.etat==1}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.Transporteurvalide"/> </span></c:if>
                          <c:if test="${declaration.etat==2}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.Transporteurinvalide"/> </span></c:if>
                        </c:if>

                        <c:if test="${notification.statut.id_statut_projet==66}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==67}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                        <c:if test="${notification.statut.id_statut_projet==68}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>

                      </a>
                    </h5>
                  </div>
                  <div id="collapseeight2" class="collapse fade" aria-labelledby="headingeight2" data-parent="#accordionExample">
                    <div class="card-body" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">

                      <c:if test="${declaration.etat != null}">
                        <table class="table my_table table-striped table-bordered table-hover">
                          <thead>
                          <tr>
                            <th> <spring:message code="label.nomdesociete"/> </th>
                            <th> <spring:message code="label.telephone"/> </th>
                            <th> <spring:message code="label.Adresse"/> </th>
                            <th> <spring:message code="label.Assurance"/> </th>
                          </tr>
                          </thead>
                          <tbody>
                          <tr>
                            <td>${declaration.transporteurParam.nom}</td>
                            <td>${declaration.transporteurParam.tel}</td>
                            <td>${declaration.transporteurParam.adresse}</td>
                            <td><a type="button" target="_blank" class="btn btn-success" onclick="goToDoc('/downloadFile${fn:replace(declaration.url_file,"/dowload_uploaded","")}')"> <span class="fa fa-download"></span></a></td>
                            </tr>

                          </tbody>
                        </table>
                      </c:if>
                      <c:if test="${declaration.etat == null}">
                        <p><spring:message code="label.AucunTransporteur"/></p>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>
              <div class="panel">
                <div class="card-header panel-heading" id="headingeight3">
                  <h5 class="mb-0 panel-title">
                    <a class="accordion-toggle btn collapsed ${pageContext.response.locale=="ar"?'text-right':'text-left'} text-white" type="button" data-toggle="collapse" data-target="#collapseeight3" aria-expanded="false" aria-controls="collapseeight3">
                      <i class="icon fa fa-download ${pageContext.response.locale=="ar"?'ml-3':'mr-3'}"></i><spring:message code="label.ListedesTelechargements"/>
                    </a>
                  </h5>
                </div>
                <div id="collapseeight3" class="collapse fade" aria-labelledby="headingeight3" data-parent="#accordionExample">
                  <div class="card-body">

                    <table class="table my_table table-striped table-bordered table-hover" style="text-align: ${pageContext.response.locale!="ar"?'left':'right'}">
                      <tbody>
                      <tr>
                        <td> <spring:message code="label.recudedepot"/> </td>
                        <td style="width: 10px"><a target="_blank" class="btn btn-success" href="/api/downloadRecuDepo/${notification.id_notification}"> <span class="fa fa-download"></span></a></td>
                      </tr>
                      <%--<tr>
                        <c:if test="${not empty notification.url_doc_signer && notification.zf_et!='TR' && notification.zf_et!='XD'}">
                          <td style="width: 93%!important;"><spring:message code="label.Lautorisationsignee"/> </td>
                          <td><a type="button" target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                        </c:if>
                      </tr>--%>
                      <tr>
                        <c:if test="${not empty notification.url_doc_signer && notification.zf_et=='TR'}">
                          <td style="width: 93%!important;"><spring:message code="label.Lalettre"/> </td>
                          <td><a type="button" target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                        </c:if>
                      </tr>
                      <c:if test="${notification.zf_et=='XD'}">
                        <tr>
                          <c:if test="${not empty notification.url_lettre}">
                            <td style="width: 93%"><spring:message code="label.Lalettredavisdepaysdedestination"/> </td>
                            <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_lettre,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                          </c:if>
                        </tr>
                        <tr>
                          <c:if test="${not empty notification.url_lettre_conforme}">
                            <td style="width: 93%"><spring:message code="label.Lalettredeconsentement"/></td>
                            <td><a type="button" target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_lettre_conforme,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                          </c:if>
                        </tr>
                        </tr>
                        <tr>
                          <c:if test="${not empty notification.url_lettre_nonconforme}">
                            <td style="width: 93%"><spring:message code="label.Lalettredenonconforme"/> </td>
                            <td><a type="button" target="_blank" class="btn btn-success" href=/downloadFile/${fn:replace(notification.url_lettre_nonconforme,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                          </c:if>
                        </tr>
                        <tr>
                          <c:if test="${not empty notification.url_doc_signer}">
                            <td style="width: 93%"><spring:message code="label.Lalettresigne"/> </td>
                            <td><a type="button" target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notification.url_doc_signer,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
                          </c:if>
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

  <!-- Modal -->
  <div class="modal fade modal_lang_ArFr" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">

          <c:if test="${pageContext.response.locale!='ar'}">
            <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Declarationdutransporteur"/></h5>
            <button type="button" class="close modal_close_lang" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </c:if>
          <c:if test="${pageContext.response.locale=='ar'}">
            <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Declarationdutransporteur"/></h5>
            <button type="button" class="close1 modal_close_lang" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>

          </c:if>
        </div>
        <div class="modal-body modal_body_lang">
          <div class="row">
            <div class="col-12" id="groupe_select" >
              <spring:message code="label.AucunTransporteurnestcompatibleavecletypedesdechetsdevotreautorisation"/>
            </div>

          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary ml-1 mr-1" data-dismiss="modal"><spring:message code="label.Annuler"/></button>
          <button id="btn_valide_trans" type="button" class="btn btn-primary ml-1 mr-1" onclick="saveDeclarationTransporteur()"><spring:message code="button.Enregistrer"/></button>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

</c:if>
<c:if test="${(empty notification ) }"><spring:message code="label.Aucunresultat"/></c:if>
<script>
  function goToDoc(val){
    window.location.href=val;
  }
</script>
<jsp:include page="../../includes/footer1.jsp" />
