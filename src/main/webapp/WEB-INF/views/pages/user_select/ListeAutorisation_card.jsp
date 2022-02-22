<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:if test="${pageContext.response.locale=='ar' }">
    <style>
       .select2-results__option  {
            direction:rtl;
			text-align:right !important;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .select2-results__option {
            direction:ltr;
            text-align:left !important;
        }
    </style>
</c:if>
<style>
<!--

-->
.card-body{
text-align:center !important;}
.modal{
  overflow: auto !important;
}

</style>

<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">

      <div class="row">
        <div class="col-12">
          <c:choose>
            <c:when test="${type=='IT'}">
              <spring:message code="label.Installationdetraitementdesdechets" var="p_page"/>
            </c:when>
            <c:when test="${type=='CT'}">
              <spring:message code="label.Collectetransportdesdechetsdangereux" var="p_page"/>
            </c:when>
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
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
              <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
            </ol>
          </nav>
        </div>
      </div>

      <div class="row">
        <div class="col-12 text-center">
          <h1><spring:message code="label.espaceprive"/></h1>
        </div>
        <div class="col-12 text-center">
          <p><spring:message code="label.msgMerci"/></p>
          <div class="row m-0 p-0 justify-content-center">
            <div class="col-md-4 col-sm-12">
              <div class="form-group">
                <input type="hidden" value="${type}" id="type">
                <select onchange="changer_select()" class="form-control select2" id="choix" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                  <option value=""><spring:message code="option.Choisir"/></option>
                  <c:choose>
                    <c:when test="${type=='CT' || type=='IT'}">
                        <option value="1"><spring:message code="label.newdmd"/></option>
                        <c:if test="${renouv=='oui'}">
                          <option value="2"><spring:message code="label.renouv"/></option>
                        </c:if>
                        <option value="3"><spring:message code="label.suivredmd"/></option>
                        <option value="4"><spring:message code="label.affichedmd"/></option>
                    </c:when>
                    <c:otherwise>
                      <option value="/api/addNumNotification/${type}/0"><spring:message code="label.dmdNumNotif"/></option>
                      <option value="/api/ListeAutorisation/${type}/n"><spring:message code="label.affNumNotif"/></option>
                      <option value="/api/addDemandNotification/0/${type}/N"><spring:message code="label.dmdDepos"/></option>
                      <option value="/api/ListeAutorisationDemande/${type}/d"><spring:message code="label.listdepos"/></option>
                      <option value="5"><spring:message code="label.suivredmd"/></option>
                    </c:otherwise>
                  </c:choose>

                </select>
              </div>
            </div>
          </div>

          


        </div>
      </div>
    </div>
</div>



<!-- Modal information-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.suivredmd"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row justify-content-center">
          <div class="col-10">
            <p>
              <spring:message code="label.msgSaisirNum"/><sup style="font-size: 10px" id="img_info" onclick="show_image()">
              <span class="fa fa-question-circle"></span>
                <img src="${pageContext.request.contextPath}/assets/images/numeros_de_demande.png" class="collapse" id="img_info_info">
              </sup>
            </p>

          </div>
          <div class="col-10">
            <input type="text" class="form-control mb-2" id="num_demande">
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
        <button class="btn btn-success" onclick="fun_affiche_modal_recap()"><spring:message code="label.rech"/></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalRenouv" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="renouvLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="renouvLabel"><spring:message code="label.autrenouv"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="renouv_tab">
        <%--Remplissage dynamique--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalRecap" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="recapLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content ">
      <div class="modal-header">
        <h5 class="modal-title" id="recapLabel"><spring:message code="label.Recap"/></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="recap_tab">
        <%--Remplissage dynamique--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
      </div>
    </div>
  </div>
</div>



<script>

  function show_image(){
    if( $("#img_info_info").is(":visible") ){
      $("#img_info_info").slideUp("slow");
    }else{
      $("#img_info_info").slideDown("slow");
    }
  }

  function fun_affiche_modal_recap(){
    var id = $("#num_demande").val();
    if($.trim(id)==""){
      swal('<spring:message code="label.Champsvide"/>',"<spring:message code="label.mercidesaisirunnumerodautorisationvalide"/>","warning");
      return false;
    }

    var type=$("#type").val();

    $.ajax({
      url: '/api/getCollectById/'+id+"/"+type,
      type: 'POST',
      dataType:'html',
      data: {},
    })
            .done(function(response) {

              if(response=="" || $.trim(response)=="Aucun résultat"){
                swal("<spring:message code="label.Aucunresultat"/>","<spring:message code="label.mercidesaisirunnumerodautorisationvalide"/>","info");
                return false;
              }else{
                $("#recap_tab ").html("");
                $("#staticBackdrop").modal("toggle");
                $("#recap_tab ").append(response);
                $( "#accordion" ).accordion({
                  collapsible: true,
                  heightStyle: "content",
                });
                $("#modalRecap").modal("toggle");
              }


            })
            .fail(function() {
              alert("erreur")
            })
            .always(function() {
              console.log("complete");
            });
  }

  function fun_affiche_modal_renew(){
    $("#modalRenouv").modal("toggle");
    var type = $("#type").val();
    $.ajax({
      url: '/api/ListToChoixRenouv/'+type,
      type: 'POST',
      dataType:'html',
      data: {},
    })
            .done(function(response) {
                $("#renouv_tab").html("");
                $("#renouv_tab").append(response);
            })
            .fail(function() {
              alert("erreur")
            })
            .always(function() {
              console.log("complete");
            });

  }


  function changer_select(){
    var id = $("#choix").val();
    if($.trim(id)===""){
      return false;
    }
    var type = $("#type").val();
    if(type=='CT' || type=='IT'){
      if(id==1){
        if(type=="CT")
          window.location.href = "/api/addCollectTrans/0/N";
        if(type=='IT')
          window.location.href = "/api/addInstallation/0/N";
      }else if(id==2){
        fun_affiche_modal_renew();
      }else if(id==3){
        $("#staticBackdrop").modal("toggle");
      }else if(id==4){
        if(type=="CT")
          window.location.href = "/api/getListCollectTrans";
        if(type=="IT")
          window.location.href = "/api/ListInstallation";
      }
    }else if(type == "ZF" || type == 'ET' || type == 'XD' || type == 'TR'){
      if(id==5){
        $("#staticBackdrop").modal("toggle");
      }else{
        var link = id;
        window.location.href=link;
      }
    }
  }
</script>





<jsp:include page="../../includes/footer1.jsp"/>