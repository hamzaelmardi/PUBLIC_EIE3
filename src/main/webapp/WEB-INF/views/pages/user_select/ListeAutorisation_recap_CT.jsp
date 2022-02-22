<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:if test="${not empty collect}">
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
  <style>
    .scroll-to-target{
      display: none !important;
    }
  </style>
  <div class="row justify-content-center mb-3">
    <div class="col-md-10 col-sm-12">
      <div class="row p-0 m-0">
        <div class="col-2 p-0">
          <a href="/api/checkUserHasCollecte/CT" class="btn btn-block btn-success"> <span class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/> </a>
        </div>
      </div>
    </div>

  </div>
  <div class="row justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div class="jumbotron p-3">
        Statut de l'autorisation : <span class="text-success h4 font-weight-bold">${collect.statut.nom_fr}</span>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-10 col-sm-12">
      <div id="accordion">
        <h2><spring:message code="label.InformationdemandeurA" /></h2>
        <div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.RaisonsocialeA"/>  </label>
                <input type="text" disabled value="${collect.raison}" class="form-control">
              </div>
            </div>
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> IF : </label>
                <input type="text" disabled value="${collect.idfiscale}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.CINA"/> </label>
                <input type="text" disabled value="${collect.cin}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.RepresantantA"/> </label>
                <input type="text" disabled value="${collect.demandeur_Nom}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.AdresseA"/> </label>
                <input type="text" disabled value="${collect.demandeurAdresse}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.TelephoneA"/>  </label>
                <input type="text" disabled value="${collect.demandeurTel}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.FaxA"/>  </label>
                <input type="text" disabled value="${collect.demandeurFax}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.EmailA"/> </label>
                <input type="text" disabled value="${collect.demandeurEmail}" class="form-control">
              </div>
            </div>
          </div>


        </div>
        <h2><spring:message code="label.CatalogueA" /></h2>
        <div>
          <div class="row mb-2">
            <div class="col-12">
              <table class="table table-bordered table-striped table-hover my_table">
                <thead>
                <tr>
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
        <h2><spring:message code="label.DonneesurlesvehiculesA" /></h2>
        <div>
          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.TypedevehiculesA"/></label>
                <input disabled type="text" class="form-control" value="${collect.typevehicule.nom_fr}">
              </div>
            </div>
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.typedeconteneursA"/></label>
                <input disabled type="text" class="form-control" value="${collect.typeConteneurs.nom_fr}">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.NombredeVehiculeA"/></label>
                <input disabled type="text" class="form-control" value="${collect.nombre_vehicule}">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.NombredeconteneursA"/></label>
                <input disabled type="text" class="form-control" value="${collect.nombre_conteneur}">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12 table-responsive">
              <table class="table table-bordered my_table">
                <thead>
                <tr>
                  <th><spring:message code="label.Nimmatriculation"/></th>
                  <th><spring:message code="label.NChassis"/></th>
                  <th><spring:message code="label.Poidstotalencharge"/></th>
                  <th><spring:message code="label.Poidsnetduvehicule"/></th>
                 <!-- <th>Equipement de sécurité</th>
                  <th>Attestation d'assurance</th>-->
                </tr>
                </thead>
                <tbody>
                <c:choose>
                  <c:when test="${(not empty collect.vehicules)}">
                    <c:forEach items="${collect.vehicules}" var="v">
                      <tr id="tr${v.id_vehicule}">
                        <td>${v.num_mat_enrg_auto} - ${v.num_mat_enrg_voit} - ${v.num_mat_id_prefect}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                        <!-- <td>
                          <c:choose>
                            <c:when test="${not empty v.equipementSecurite}">
                              <a href="${url_Admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle">
                                <span class="fa fa-download"></span>
                              </a>
                            </c:when>
                            <c:otherwise>
                              -
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <a href="${url_Admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle">
                            <span class="fa fa-download"></span>
                          </a>
                        </td>-->
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="7" class="bg-primary text-center"><spring:message code="label.Aucunvehicule"/></td>
                    </tr>
                  </c:otherwise>
                </c:choose>
                </tbody>
              </table>
            </div>
          </div>



        </div>
        <h2><spring:message code="label.MespiecesA" /></h2>
        <div>
          <table class="table my_table table-striped table-bordered table-hover">
            <c:if test="${not empty doc}">
              <c:forEach items="${doc}" var="file">
                <tr>
                  <td>${file.docImport.nom_fr}</td>
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
  </div>
  <jsp:include page="../../includes/footer1.jsp"/>
</c:if>
<c:if test="${not empty installation}">
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
  <style>
    .scroll-to-target{
      display: none !important;
    }
  </style>
  <div class="row">
    <div class="col-12">
      <div class="jumbotron p-3">
        <spring:message code="label.Statutdelautorisation"/>  : <span class="text-success h4 font-weight-bold">${installation.statut.nom_fr}</span>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <div id="accordion">
        <h2><spring:message code="button.informationdinstallation"/></h2>
        <div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Site"/>  </label>
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
                <label> <spring:message code="label.code"/> </label>
                <input type="text" disabled value="${installation.code.nom_fr}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.typededechet"/> </label>
                <input type="text" disabled value="${installation.code.nom_ar}" class="form-control">
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

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.structuredinstallation"/>   </label>
                <input type="text" disabled value="${installation.structure}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Naturedactivite"/>  </label>
                <input type="text" disabled value="${installation.nature.nom_fr}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Typedappareil"/> </label>
                <input type="text" disabled value="${installation.type_appareil}" class="form-control">
              </div>
            </div>
          </div>


          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Quantite"/>  </label>
                <input type="text" disabled value="${installation.quantite}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Unite"/> </label>
                <input type="text" disabled value="${installation.unite}" class="form-control">
              </div>
            </div>
          </div>


        </div>
        <h2><spring:message code="button.informationdemandeur"/></h2>
        <div>
          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.raisonsocial"/>  </label>
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
                <input type="text" disabled value="${installation.adresse}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Tel"/> </label>
                <input type="text" disabled value="${installation.tel}" class="form-control">
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
        <h2><spring:message code="button.equipedetravail"/></h2>
        <div>
          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.nbequipe"/></label>
                <input disabled type="text" class="form-control" value="${installation.nbr_equipe_travail}">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Horairedebutdexploitation"/></label>
                <input disabled type="text" class="form-control" value="${installation.horaire_exploitation}">
              </div>
            </div>
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Horairefindexploitation"/></label>
                <input disabled type="text" class="form-control" value="${installation.horaire_exploitation_fin}">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.qualification"/></label>
                <textarea rows="3" class="form-control" disabled>${installation.qualification}</textarea>
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.formation"/></label>
                <textarea rows="3" class="form-control" disabled>${installation.formation}</textarea>
              </div>
            </div>
          </div>

        </div>
        <h2><spring:message code="button.mespieces"/></h2>
        <div>
          <table class="table my_table table-striped table-bordered table-hover">
            <c:if test="${not empty doc}">
              <c:forEach items="${doc}" var="file">
                <tr>
                  <td>${file.docImport.nom_fr}</td>
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
  </div>
  <jsp:include page="../../includes/footer1.jsp"/>
</c:if>
<c:if test="${not empty notification}">
  <script>
    $( function() {
      $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
      });
    } );
  </script>
  <style>
    .scroll-to-target{
      display: none !important;
    }
  </style>
  <div class="row">
    <div class="col-12">
      <div class="jumbotron p-3">
        <spring:message code="label.Statutdelautorisation"/> : <span class="text-success h4 font-weight-bold">${notification.statut.nom_fr}</span>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <div id="accordion">
        <h2><spring:message code="label.Numerodenotification"/></h2>
        <div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Numerodenotification"/> </label>
                <input type="text" disabled value="${notification.num_notification}" class="form-control">
              </div>
            </div>
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Classificationdesdechets"/>  </label>
                <input type="text" disabled value="${notification.classification.nom_fr}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Operation"/> </label>
                <input type="text" disabled value="${notification.operation}" class="form-control">
              </div>
            </div>
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.code"/> </label>
                <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.typededechet"/> </label>
                <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label>
                  <c:choose>
                    <c:when test="${type=='ZF'}">
                      <spring:message code="label.ZoneFranche"/>
                    </c:when>
                    <c:otherwise>
                      <spring:message code="label.pays"/>
                    </c:otherwise>
                </c:choose>
                </label>
                <input type="text" disabled value="${notification.zonneFranche.nom_fr}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.producteur"/>  </label>
                <input type="text" disabled value="${notification.producteur_text}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.quantitetotaleprevu"/> </label>
                <input type="text" disabled value="${notification.quantite}" class="form-control">
              </div>
            </div>
          </div>


          <div class="row mb-2">
            <div class="col-md-12 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.unite"/>  </label>
                <input type="text" disabled value="${notification.unite.nom_fr}" class="form-control">
              </div>
            </div>
          </div>

        </div>
        <h2><spring:message code="label.ImportateurNotifiant"/></h2>
        <div>
          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group" ${pageContext.response.locale=='ar'?'rtl':'ltr'}>
                <label> <spring:message code="label.nom"/>  </label>
                <c:choose>
                  <c:when test="${pageContext.response.locale=='ar'}">
                    <input value="${notif.importateur.nom_ar}" type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
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
                <input type="text" disabled value="${notification.importateur.adresse_fr}" class="form-control">
              </div>
            </div>
          </div>

          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.identifiantfiscal"/> </label>
                <input type="text" disabled value="${notification.importateur.idf}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Telephone"/>  </label>
                <input type="text" disabled value="${notification.importateur.tel}" class="form-control">
              </div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Fax"/> </label>
                <input type="text" disabled value="${notification.importateur.fax}" class="form-control">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label> <spring:message code="label.Email"/> </label>
                <input type="text" disabled value="${notification.importateur.mail}" class="form-control">
              </div>
            </div>
          </div>

        </div>
        <h2><spring:message code="label.Documentdenotification"/></h2>
        <div>
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
                <label><spring:message code="label.Typedeconditionnement"/></label>
                <input disabled class="form-control" value="${notification.typeconditionnement.nom_fr}" type="text">
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
                <label><spring:message code="label.Nomdeladestinationfinale"/></label>
                <input disabled class="form-control" value="${notification.destination_final}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Caracteristiquesphysiques"/></label>
                <input disabled class="form-control" value="${notification.caracteristquePhysique.nom_fr}" type="text">
              </div>
            </div>
          </div>

        </div>
        <h2><spring:message code="label.transporteurprevu"/></h2>
        <div>
          <table class="table my_table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th> <spring:message code="label.nom"/> </th>
                <th> <spring:message code="label.identifiantfiscal"/> </th>
                <th> <spring:message code="label.telephone"/> </th>
                <th> <spring:message code="label.Fax"/> </th>
                <th> <spring:message code="label.email"/> </th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${not empty notification.transporteur}">
              <c:forEach items="${notification.transporteur}" var="tr">
                <tr>
                  <td>${tr.nom}</td>
                  <td>${tr.identifiant}</td>
                  <td>${tr.tel}</td>
                  <td>${tr.fax}</td>
                  <td>${tr.adresse}</td>
                </tr>
              </c:forEach>
            </c:if>
              <c:if test="${empty notification.transporteur}">
                <tr>
                  <td class="text-center" colspan="5"><spring:message code="label.AucunTransporteur"/>  </td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
        <h2><spring:message code="label.producteursdesdechets"/></h2>
        <div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label><spring:message code="label.nom"/></label>
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
                <label><spring:message code="label.identifiantfiscal"/></label>
                <input disabled class="form-control" value="${notification.producteur.idf}" type="text">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Adresse"/></label>
                <input disabled class="form-control" value="${notification.producteur.adresse_fr}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.telephone"/></label>
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
                <label><spring:message code="label.email"/></label>
                <input disabled class="form-control" value="${notification.producteur.mail}" type="text">
              </div>
            </div>
          </div>

        </div>
        <h2><spring:message code="label.installationdelimination"/></h2>
        <div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label><spring:message code="label.nom"/></label>
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
                <label><spring:message code="label.identifiantfiscal"/></label>
                <input disabled class="form-control" value="${notification.eliminateur.idf}" type="text">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Adresse"/></label>
                <input disabled class="form-control" value="${notification.eliminateur.adresse_fr}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.telephone"/></label>
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
                <label><spring:message code="label.email"/></label>
                <input disabled class="form-control" value="${notification.eliminateur.mail}" type="text">
              </div>
            </div>
          </div>
        </div>
        <h2><spring:message code="label.Documentdemouvementsdesdechets"/></h2>
        <div>
          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Quantitereelle"/></label>
                <input disabled class="form-control" value="${notification.quantite_reel}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.unite"/></label>
                <input disabled class="form-control" value="${notification.unite.nom_fr}" type="text">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Quantitereelle"/></label>
                <input disabled class="form-control" value="${notification.quantite_reel}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.unite"/></label>
                <input disabled class="form-control" value="${notification.unite.nom_fr}" type="text">
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Datereelledelexpedition"/></label>
                <input disabled class="form-control" value="${notification.date_reel}" type="text">
              </div>
            </div>

            <div class="col-md-6 col-sm-12">
              <div class="form-group">
                <label><spring:message code="label.Nombredecolis"/></label>
                <input disabled class="form-control" value="${notification.nbr_colis}" type="text">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label><spring:message code="label.Lieueffectifdeleliminationvalorisation"/></label>
                <input disabled class="form-control" value="${notification.lieu}" type="text">
              </div>
            </div>
          </div>


        </div>
        <h2><spring:message code="label.mespieces"/></h2>
        <div>
          <table class="table my_table table-striped table-bordered table-hover">
            <c:if test="${not empty doc}">
              <c:forEach items="${doc}" var="file">
                <tr>
                  <td>${file.docImport.nom_fr}</td>
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
  </div>
  <jsp:include page="../../includes/footer1.jsp"/>
</c:if>
<c:if test="${(empty collect ) && (empty installation) && (empty notification)}"><spring:message code="label.Aucunresultat"/></c:if>
