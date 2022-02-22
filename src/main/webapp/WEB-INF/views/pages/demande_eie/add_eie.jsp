<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<jsp:include page="../../includes/head.jsp"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css" integrity="sha512-kq3FES+RuuGoBW3a9R2ELYKRywUEQv0wvPTItv3DSGqjpbNtGWVdvT8qwdKkqvPzT93jp8tSF4+oN4IeTEIlQA==" crossorigin="anonymous" />
<style>
.select2-container--default .select2-selection--multiple {
    padding: 0px;
}
</style>
<div class="main-panel">
<section class="mt-2 " style="background-color:white;margin-top:2%" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <c:set var="lng" value="nom_${pageContext.response.locale}"/>
    <div class="col-lg-12 grid-margin stretch-card cardstatistic" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
        <c:choose>
            <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/demandeinformation/')}">
                <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
            </c:when>
            <c:otherwise>
              <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
          </c:choose>

          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                <li class="breadcrumb-item"><a href="/api/checkEIESelect">${p_page} </a></li>
                <li class="breadcrumb-item active" aria-current="page"> <spring:message code="label.Nouvelledemande"/> </li>

            </ol>
          </nav>
    </div>
    <div class="row justify-content-center" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">

        <div class="col-lg-6 col-sm-8 col-md-8 mx-4">
            <div class="row pb-2 mt-3">
                <div class="col-12 z_collecteur" style="border: #336c4e solid 1px;border-radius: 6px;">
                    <h4 class="titre_abs " style="text-align:center"> ${type}</h4>

                    <form class="mt-6 pt-5"  id="formAvisProjet" name="formAvisProjet" >

                      <div class="row">

                          <c:choose>
                              <c:when test="${not empty demande}">
                                  <div class=" col-lg-4 col-sm-4 form-group">
                                      <label ><spring:message code="label.NumeroDemande"/></label>
                                      <input onchange="checkUpdate(this.value)" ${disabled} value="${demande.num_demande }" type="text" name="num_demande" class="form-control">
                                  </div>
                                  <div class=" col-lg-4 col-sm-4 form-group">
                                      <label ><spring:message code="label.IntituleDeProjet"/></label>
                                      <input ${disabled} value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                  </div>
                                  <div class=" col-lg-4 col-sm-4 form-group">
                                      <label><spring:message code="label.Categories"/></label>
                                      <select  ${disabled}  name="id_categorie" multiple id="id_categorie" required class="form-control select2 p-0" data-width="100%" >
                                          <option value="" selected disabled><spring:message code="option.Choisir"/></option>
                                          <c:forEach items="${categories}"  var="cat">
                                              <option value="${cat.id_categorie}" >${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr} </option>
                                          </c:forEach>
                                      </select>
                                  </div>
                              </c:when>
                              <c:otherwise>
                                  <div class=" col-md-6 col-sm-12 form-group">
                                      <label ><spring:message code="label.IntituleDeProjet"/></label>
                                      <input ${disabled} value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                  </div>
                                  <div class=" col-md-6 col-sm-12 form-group">
                                      <label><spring:message code="label.Categories"/></label>
                                      <select  ${disabled}  name="id_categorie" multiple id="id_categorie" required class="form-control select2 p-0" data-width="100%" >
                                          <option value="" selected><spring:message code="option.Choisir"/></option>
                                          <c:forEach items="${categories}"  var="cat">
                                              <option value="${cat.id_categorie}">${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr}</option>
                                          </c:forEach>
                                      </select>
                                  </div>
                              </c:otherwise>
                          </c:choose>


                        </div>

                      <hr>
                           <div class="row">


                                 <div class="col form-group">
                                <label> <spring:message code="label.Tronsfrontalier"/>  </label>
                                <select ${disabled }  onchange="disabledRegion(this.value)"  name="tronsfrontalier" id="tron" required class="form-control select2" data-width="100%" >
                                    <option ${demande.tronsfrontalier.equals('non')?"selected":"" }  value="non"><spring:message code="label.non"/></option>
                                    <option value="oui" ${demande.tronsfrontalier.equals('oui')?"selected":"" } ><spring:message code="label.oui"/></option>
                                </select>

                              </div>
                                 <div class="col form-group">
                                <label> <spring:message code="label.Regions"/> </label>
                                <select  ${disabled } name="" id="id_region" required class="form-control select2" data-width="100%" multiple>
                                    <option value=""><spring:message code="option.Choisir"/></option>
                                   <c:forEach items="${regions}"  var="region">
                                        <option  value="${region.regionId}" > ${pageContext.response.locale=='ar'? region.nom_ar:region.nom_fr}</option>
                                    </c:forEach>
                                </select>

                              </div>
                           </div>
                      <hr>

                        <div class="row">


                                 <%-- <div class="col form-group">
                                <label> <spring:message code="label.NombreEmploi"/>   </label>
                                <input ${disabled } value="${demande.nbr_emploi }"  type="text"  name="nbr_emploi" class="form-control" >


                              </div> --%>
                                 </div>


                               <div class="row">

                              <%-- <div class="col form-group">

                         		<label ><spring:message code="label.Avisdeprojet"/>   </label>
                                <input onchange="addDoc(${demande.id_demande_information },'66','doc66')" multiple  ${demande.statut.id_statut_projet==13?"disabled":""}   accept=".doc,.docx,.pdf"  type="file"  id="doc66" class="form-control" >
                             </div> --%>
                             <div class=" col form-group">
                                <label ><spring:message code="label.Informationsurleprojet"/> </label>
                                <textarea ${disabled } class="form-control" name="information_projet" style="height 193px;resize none;" >${demande.information_projet }</textarea>
                            </div>


                            </div>
                            <hr>
                           <%--  <div class="row"><h3 class="btn btn-primary" style="margin-left:12px;"> <spring:message code="button.petitionaire"/> </H3></div> --%>
                       <div class="row">

                        <div class=" col form-group">
                                    <label ><spring:message code="label.Raisonsocial"/>   </label>
                                    <input  value="${demande.raison_social}" ${disabled} type="text" name="raison_social" class="form-control">
                                </div>

                            <div class="col form-group">
                                <label ><spring:message code="label.Email"/>

                                </label>
                                <input value="${demande.email }" ${disabled} type="text" name="email" class="form-control" >
                            </div>
                             <div class=" col form-group">
                             <label><spring:message code="label.Representant"/> </label>

                            <input type="text"  value="${demande.contact }" ${disabled} name="contact" class="form-control" >

                              </div>

                        </div>

                        <div class="row">

                        <div class=" col form-group">
                                    <label ><spring:message code="label.tel"/> </label>
                                    <input value="${demande.tel }" type="tel" ${disabled} name="tel" class="form-control">
                                </div>

                            <div class="col form-group">
                                <label ><spring:message code="label.Fax"/>

                                </label>
                                <input ${disabled} value="${demande.fax }" type="text" name="fax" class="form-control" >
                            </div>


                        </div>

                            <hr>
                            <%-- <div class="row"><h3 class="btn btn-primary" style="margin-left:12px;"><spring:message code="button.Document"/>  </H3></div> --%>

                            <div class="  d-flex justify-content-center" style="margin-bottom:12px;">
                            <button onclick="step2('formAvisProjet')"  class="col-3 btn btn-success">  <spring:message code="button.Enregistrers"/> </button>
                        </div>
                    </form>


                        </div>








    <br><br>
                </div>
            </div>
        </div>
    </div>
</section>
</div>

<script type="text/javascript">
function step2(form){
    event.preventDefault();
    var se = $("#"+form).serializeObject();
    var region=$("#id_region").val();
    var prefecture=$("#id_prefecture").val();
    var commune=$("#id_commune").val();
    var categorie=$("#id_categorie").val();
    var tran=$("#tron").val();

    if(tran=="oui"){
        region=0;
    }

    $.ajax({
        type: "POST",
        url: "/api/addDemandeInformation/"+region+"/"+categorie,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            window.location="/api/demandeinformation/"+response+"/EE";
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });
}

function disabledRegion(id){

	if(id=="oui"){

		$("#id_region").attr('disabled', 'disabled');
	}
	else{
		$("#id_region").attr('disabled', false);
	}

}
function checkUpdate(val){

	 $.ajax({
	        type: "GET",
	        url: "/api/checkUpdate/"+val ,


	        success: function (response) {
	        	if(response=="0"){

	        	}
	        	else{
	        		window.location="/api/demandeinformation/"+response+"/EE";
	        	}




	        },
	        error: function (response) {

	            alert('Erreur ajout non effectue');

	        }
	    });

}

</script>

<jsp:include page="../../includes/footer1.jsp"/>
