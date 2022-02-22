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
      <button class="btn btn-primary btn-block" onclick="fun_affiche_from_55()"><spring:message code="button.ajouter"/></button>
    </div>
    <div class="col-12 p-0 table-responsive">
      <table class="table my_table table-bordered table-striped table-hover">
        <thead>
        <tr>
          <th class="text-center"> <spring:message code="label.Raisonsocial"/>  </th>
          <th class="text-center"> <spring:message code="label.Typedetransport"/> </th>
          <th class="text-center"> <spring:message code="label.Assurance"/> </th>
          <th class="text-center">  <spring:message code="label.Adresse"/> </th>
          <th class="text-center">  <spring:message code="label.Action"/>  </th>
        </tr>
        </thead>
        <tbody id="trI">
        <c:if test="${not empty transporteur_etranger}">
          <c:forEach items="${transporteur_etranger}" var="trans">
            <c:if test="${trans.type=='ti'}">
              <tr id="trr_${trans.id_TransporteurEtranger}">
                <td>${trans.raison_social}</td>
                <td>${trans.typeVehicule}</td>
                <td>
                  <c:if test="${not empty trans.url_assurance}">
                    <a target="_blank" download="assurance" href="/downloadFile/${fn:replace(trans.url_assurance,"/assets/myFile/","")}" class="btn btn-primary btn-sm"> <span class=""></span> <span
                            class="fa fa-download" style="${pageContext.response.locale=='ar'?'margin-left:10px':'margin-right:10px'}"></span><spring:message code="label.Assurance"/>
                    </a>
                  </c:if>
                  <c:if test="${empty trans.url_assurance}">
                    <spring:message code="label.aucuneAssurance"/>
                  </c:if>
                </td>
                <td>${trans.adresse}</td>
                <td class="text-center">
                  <button  onclick="delete_transp_etrang2('${trans.id_TransporteurEtranger}','id_notification','etranger')" class="btn btn-danger rounded-circle"><span class="fas fa-trash"></span></button>
                  <button  onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','etranger')" class="btn btn-warning rounded-circle"><span class="fas fa-edit" style="color: white"></span></button>
                </td>
              </tr>
            </c:if>
          </c:forEach>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>
  <div class="card hidden" id="card_55">
    <div class="card-body">
      <div class="row mt-3 justify-content-center p-0">
        <div class="col-md-6 col-sm-12">
          <div class="form-group">
            <label> <spring:message code="label.Raisonsocial"/> </label>
            <input type="text" id="raison_social" class="form-control" value="${one.raison_social}">
          </div>
        </div>
  <c:if test="${!notif.zf_et.equals('XD')}">
        <div class="col-md-6 col-sm-12">
          <div class="form-group">
            <label><spring:message code="label.Typedetransport"/> </label>
<%--            <input class="form-control" type="text" value="${one.typeVehicule}" id="type_vehicule">--%>
            <select id="type_vehicule" class="form-control">
              <option value="0"><spring:message code="option.Choisir"/> </option>
              <option value="camion" ${one.typeVehicule=="camion"?"selected":"" }><spring:message code="label.camion"/> </option>
              <option value="avion" ${one.typeVehicule=="avion"?"selected":"" }><spring:message code="label.avion"/></option>
              <option value="bateau" ${one.typeVehicule=="bateau"?"selected":"" }><spring:message code="label.bateau"/></option>
            </select>
          </div>
        </div>
  </c:if>
  <c:if test="${notif.zf_et.equals('XD')}">
    <div class="col-lg-6 col-md-6 col-sm-12">
      <div class="form-group">
        <label><spring:message code="label.Typedetransport"/>  </label>
        <select id="type_vehicule" class="form-control">
          <option value="0"><spring:message code="option.Choisir"/> </option>
          <option value="camion" ${one.typeVehicule=="camion"?"selected":"" }><spring:message code="label.camion"/></option>
          <option value="avion" ${one.typeVehicule=="avion"?"selected":"" }><spring:message code="label.avion"/></option>
          <option value="bateau" ${one.typeVehicule=="bateau"?"selected":"" }><spring:message code="label.bateau"/></option>
        </select>
      </div>
    </div>
  </c:if>
      </div>
      <div class="row mt-3 justify-content-center p-0">
        <div class="col-md-6 col-sm-12">
          <div class="form-group">
            <label> <spring:message code="label.Assurance"/> </label>
            <c:if test="${empty one.url_assurance}">
              <input type="File" id="doc_assurance" class="form-control">
            </c:if>
            <c:if test="${not empty one.url_assurance}">
              <div class="row p-0">
                <div class="col-10">
                  <input type="File" id="doc_assurance" class="form-control">
                </div>
                <div class="col-2" style="margin-left: -31px">
                  <a id="btn_downolad2" href="/downloadFile/${fn:replace(one.url_assurance,"/assets/myFile/","")}" class="btn btn-primary rounded "><span class="fa fa-download ml-2"></span></a>
                </div>
              </div>
            </c:if>

          </div>
        </div>
        <div class="col-md-6 col-sm-12">
          <div class="form-group">
            <label> <spring:message code="label.Adresse"/> </label>
            <textarea type="text" id="adresseTr" rows="3" class="form-control">${one.adresse}</textarea>
          </div>
        </div>
      </div>
      <div class="row mt-3 justify-content-center p-0">
        <div class="clear"></div>
        <div class="col-sm-12 col-md-3">
          <c:if test="${empty one}">
            <input type="hidden" value="0" id="id_trans">
          </c:if>
          <c:if test="${not empty one}">
            <input type="hidden" value="${one.id_TransporteurEtranger}" id="id_trans">
          </c:if>
          <button class="btn btn-success btn-block"
                  onclick="ajouterTranporteur_Etranger('id_notification',this)"><spring:message code="button.Enregistrer"/>
            <spring:message code="label.transporteur"/>
          </button>
        </div>
      </div>
    </div>
  </div>
<div class="row justify-content-center">

</div>

