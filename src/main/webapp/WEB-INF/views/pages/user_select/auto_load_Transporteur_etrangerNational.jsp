<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<div class="row m-0 p-0">
  <div class="col-2 ml-auto pr-0 mb-2">
    <button class="btn btn-primary btn-block" onclick="show_form_trans_cls()">
      <span class="fa fa-plus"></span> <spring:message code="button.ajouter"/>
    </button>
  </div>
  <div class="col-12 p-0 table-responsive">
    <table class="table my_table table-bordered table-striped table-hover">
      <thead>
      <tr>
        <th class="text-center"><spring:message code="label.Raisonsocial"/>   </th>
        <th class="text-center"> <spring:message code="label.Matricule"/> </th>
        <th class="text-center"> <spring:message code="label.Typedetransport"/> </th>
        <th class="text-center"> <spring:message code="label.Assurance"/> </th>
        <th class="text-center"> <spring:message code="label.Adresse"/> </th>
        <th class="text-center"> <spring:message code="label.Action"/> </th>
      </tr>
      </thead>
      <tbody id="rowTransporteur">
      <c:if test="${not empty transporteur_etranger}">
        <c:forEach items="${transporteur_etranger}" var="trans">
          <c:if test="${trans.type=='tn'}">
          <tr id="tr_${trans.id_TransporteurEtranger}">
            <td>${trans.raison_social}</td>
            <td>${trans.num_matricule}</td>
            <td>${trans.typeVehicule}</td>
            <td>
              <c:if test="${not empty trans.url_assurance}">
                <a target="_blank" download="assurance"
                   href="/downloadFile/${fn:replace(trans.url_assurance,"/assets/myFile/","")}"
                   class="btn btn-primary btn-sm"> <span class="fa fa-download" style="${pageContext.response.locale=='ar'?'margin-left:10px':'margin-right:10px'}"></span><spring:message code="label.Assurance"/></a>
              </c:if>
            </td>
            <td>${trans.adresse}</td>
            <td class="text-center">
              <button onclick="delete_transp_etrang('${trans.id_TransporteurEtranger}','id_notification','nationale','${lng}')" class="btn btn-danger rounded-circle"><span class="fas fa-trash"></span></button>
              <button onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','nationale')" class="btn btn-warning rounded-circle"><span class="fas fa-edit" style="color: white"></span></button>
            </td>
          </tr>
          </c:if>
        </c:forEach>
      </c:if>
      </tbody>
    </table>
  </div>
</div>
<div class="card hidden" id="frm_trans_card">
  <div class="card-body">
<div class="row mt-3 justify-content-center p-0">
  <div class="col-md-4 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Raisonsocial"/> </label>
      <input type="hidden" id="id_TransporteurEtranger" class="form-control" value="${one.id_TransporteurEtranger}">
      <input type="text" id="raison_social_n" class="form-control" value="${one.raison_social}">
    </div>
  </div>
  <div class="col-lg-4 col-md-6 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Matricule"/> </label>
      <input type="text" id="num_matriule_n" class="form-control" value="${one.num_matricule}">
    </div>
  </div>
  <div class="col-lg-4 col-md-6 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Typedetransport"/> </label>
<%--      <input class="form-control" type="text" value="${one.typeVehicule}" id="type_vehicule_n">--%>
      <select id="type_vehicule_n" class="form-control">
        <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
        <option ${one.typeVehicule=='camion'?'selected':''} value="camion"><spring:message code="label.camion"/> </option>
        <option ${one.typeVehicule=='avion'?'selected':''} value="avion"><spring:message code="label.avion"/> </option>
        <option ${one.typeVehicule=='bateau'?'selected':''} value="bateau"><spring:message code="label.bateau"/> </option>
      </select>
    </div>
  </div>
</div>
<div class="row mt-3 justify-content-center p-0">
  <div class="col-lg-6 col-md-6 col-sm-12">
    <div class="form-group">
      <label> <spring:message code="label.Assurance"/> </label>
      <c:if test="${empty one.url_assurance}">
        <input type="File" id="doc_assurance_n" class="form-control">
      </c:if>
      <c:if test="${not empty one.url_assurance}">
        <div class="row p-0">
          <div class="col-10">
            <input type="File" id="doc_assurance_n" class="form-control">
          </div>
          <div class="col-2">
              <a id="btn_downolad" href="/downloadFile/${fn:replace(one.url_assurance,"/assets/myFile/","")}" class="btn btn-primary rounded "><span class="fa fa-download ml-2"></span></a>
          </div>
        </div>
      </c:if>
    </div>
  </div>
  <div class="col-lg-6 col-md-12 col-sm-12">
    <div class="form-group">
      <label>  <spring:message code="label.Adresse"/> </label>
      <textarea type="text" id="adresseTr_n" class="form-control" rows="3">${one.adresse}</textarea>
    </div>
  </div>
</div>
    <div class="row mt-3 justify-content-center p-0">
  <div class="col-sm-12 col-lg-3 col-md-6 mt-5">
    <input type="hidden" value="${(not empty one)?one.id_TransporteurEtranger:'0'}" id="id_trans_n">
    <button class="btn btn-success btn-block" onclick="ajouterTranporteur_EtrangerNational('id_notification',this)"><spring:message code="label.Enregistrertransporteur"/></button>
  </div>
    </div>
</div>
  </div>
</div>


<script>
  function ajouterTranporteur_EtrangerNational(id_name,val) {


   // event.preventDefault();
    var id = $("#" + id_name).val();
    var raison = $("#raison_social_n").val();
    var matricule = $("#num_matriule_n").val();
    var type_vehicule = $("#type_vehicule_n").val();
    var adresse = $("#adresseTr_n").val();

    if (raison == "" || matricule=="" || type_vehicule=="" || adresse=="") {
      swal({
        title: "<spring:message code="label.Avertissement"/>",
        text: "<spring:message code="label.TousLesChampsestobligatoire"/>",
        type: "error",
        showCancelButton: false,
        confirmButtonColor: "#256144",
        confirmButtonText: "<spring:message code="label.OK"/> ",
        html: false
      });
      return false;
    }

    var id_trans = $("#id_trans_n").val();
    if ($.trim(id_trans) === "" || id_trans == null || !$.isNumeric(id_trans)) {
      id_trans = 0;
    }
    var data = new FormData();
    data.append("raison", raison);
    data.append("matricule", matricule);
    data.append("type_vehicule", type_vehicule);
    data.append("adresse", adresse);

    var ins = document.getElementById("doc_assurance_n").files.length;
    if (ins == 0 && !$("#btn_downolad").is(":visible")) {
      swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Lefichierestobligatoire"/>", 'error');
      return false;
    }

    /*if (ins == 0 && !$("#btn_downolad").is(":visible")) {
      swal({
        title: "<spring:message code="label.Avertissement"/>",
        text: "<spring:message code="label.Lefichierestobligatoire"/>",
        type: "error",
        showCancelButton: false,
        confirmButtonColor: "#256144",
        confirmButtonText: "<spring:message code="label.OK"/> ",
        //closeOnConfirm: true,
        //showLoaderOnConfirm: true,
        html: false
      });
      return false;
    }*/

    if(ins!=0){
      for (var x = 0; x < ins; x++) {
        var file = document.getElementById("doc_assurance_n").files[x];
        if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
          swal("Alert", "<spring:message code="label.Typedefichiernonprisencharge"/>", "error");
          return false;
        }
        data.append("fileToUpload", file);
      }
    }else{
      data.append("fileToUpload", null);
    }



    $(val).prop("disabled", "true");
    $('#loader_modal').modal('show');
    $.ajax({
      url: '/api/addTransporteuretrangerNational/' + id + "/" + id_trans,
      type: 'POST',
      processData: false,
      contentType: false,
      cache: false,
      data: data,
    })
            .done(function (data) {
              $("#row_from_groupe").html(data);
            })
            .fail(function () {
              console.log("error");
            })
            .always(function () {
              console.log("complete");
              $(val).prop("disabled", "false");
              $('#loader_modal').modal('hide');
            });

  }
</script>

