<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

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

      <div class="row mt-4 mb-5 zone_affiche z_1 justify-content-center">
        <c:if test="${renouv=='oui'}">
        <div class="col-sm-6">
          <img src="${pageContext.request.contextPath}/assets/images/depos.png" class="w-100">
          <div class="row justify-content-center mt-3">
            <div class="col-auto">
              <a href="/api/newCollecteRenouv/${collecte.id_collecte}" class="btn btn-success btn-block text-white" ><spring:message code="label.Renouvellerlademande"/></a>
            </div>
          </div>
        </div>
        </c:if>
        <div class="col-sm-6">
          <img src="${pageContext.request.contextPath}/assets/images/view.png" class="w-100">
          <div class="row justify-content-center mt-3">
            <div class="col-auto">
              <a class="btn btn-success btn-block text-white" onclick="fun_affiche_modal_recap('${collecte.id_collecte}')"><spring:message code="label.Recapitulation"/></a>
            </div>
          </div>
        </div>

      </div>
      <div class="mt-4 mb-5 zone_affiche recap collapse">



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

  function fun_affiche_modal_recap(id){

    if($.trim(id)==""){
      swal('<spring:message code="label.Champsvide"/>',"<spring:message code="label.mercidesaisirunnumerodautorisationvalide"/>","warning");
      return false;
    }

    var type=$("#type").val();

    $.ajax({
      url: '/api/getCollectById_collecte',
      type: 'POST',
      dataType:'html',
      data: {},
    })
            .done(function(response) {

              if(response=="" || $.trim(response)=="Aucun résultat"){
                swal("<spring:message code="label.Aucunresultat"/>","<spring:message code="label.pageencoursdedeveloppement"/>","info");
                return false;
              }else{
                $(".zone_affiche.recap").html("");
                $(".zone_affiche.recap").append(response);
                $(".zone_affiche.z_1").slideUp();
                $(".zone_affiche.recap").slideDown();
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
