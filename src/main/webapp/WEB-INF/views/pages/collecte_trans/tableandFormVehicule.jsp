<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>


<c:if test="${collect.statut.id_statut_projet==42}">
<h5><u><spring:message code="label.Validationdesvehicules"/> :</u></h5>
</c:if>
<div id="zone_form" class=" col-12 p-0 m-0">
    <form id="add_vehicules" >
        <div class="row m-0 p-0">
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.NMatriculation"/>
                    </label>
                    <div class="row m-0 p-0">
                        <div class="col-sm-5 p-0 m-0 mt-3">
                            <input type="text" class="form-control" value="${vehicules.num_mat_enrg_voit}" name="num_mat_enrg_voit">
                        </div>
                        <div class="col-sm-2 p-0 m-1 mt-3">
                            <input type="text" class="form-control keyboardInput" lang="ar" dir="rtl" value="${vehicules.num_mat_enrg_auto}" name="num_mat_enrg_auto" id="num_mat_enrg_auto">
                        </div>
                        <div class="col-sm-4 p-0 m-0 mt-3">
                            <input type="text" class="form-control" value="${vehicules.num_mat_id_prefect}" name="num_mat_id_prefect">
                        </div>
                    </div>
                    <input type="hidden" class="form-control" id="id_vehicule" value="${vehicules.id_vehicule}" name="id_vehicule">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 mt-3">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.NChassis"/>
                    </label>
                    <input type="text" class="form-control" id="chassis" value="${vehicules.num_chassis}" name="num_chassis">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 mt-3">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Poidstotalencharge"/>
                    </label>
                    <input type="text" class="form-control" id="poidsTotal" value="${vehicules.poit_totale_charge}" name="poit_totale_charge">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Poidsnetduvehicule"/>
                    </label>
                    <input type="text" class="form-control" id="poidsNet" value="${vehicules.point_net}" name="point_net">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label> <spring:message code="label.TypedevehiculesA"/> </label>
                    <input type="text" class="form-control" name="typeVehicule" value="${vehicules.typeVehicule}">
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <label> <spring:message code="label.typedeconteneursA"/> </label>
                <input type="text" class="form-control" name="typeConteneur" value="${vehicules.typeConteneur}">
            </div>
             <input type="hidden" id="securiteEquip">
             <input type="hidden" id="file">
            <!-- 
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Equipementdesecurite"/>
                    </label>
                   <input type="file" id="securiteEquip" class="form-control">
                    <c:if test="${not empty vehicules.equipementSecurite}">
                        <a href="${url_admin}${fn:replace(vehicules.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                          <span class="fa fa-download"></span>
                        </a>
                    </c:if>

                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="form-group">
                    <label class="f-14">
                        <spring:message code="label.Attestationdassurance"/>
                    </label>
                    <input type="file" class="form-control" id="file">
                    <c:if test="${not empty vehicules.doc_assurance}">
                        <a href="${url_admin}${fn:replace(vehicules.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                            <span class="fa fa-download"></span>
                        </a>
                    </c:if>
                </div>
            </div>
        -->
        </div>
        <div class="row justify-content-center">
            <div class="col-md-3 mt-2">
                <button onclick="Save_vehicule('file','securiteEquip',this)" class="btn btn-primary btn-block"><spring:message code="button.enregistrerlevehicule"/></button>
            </div>
        </div>
    </form>
</div>

<c:if test="${collect.statut.id_statut_projet!=42}">
    <div class="row m-0 p-0 mt-2">
        <div class="col-3">
            <div class="form-group">

                <label><spring:message code="label.NombredeVehiculeA"/> </label>
                <input class="form-control" type="text" readonly name="nombre_vehicule"
                       value="${collect.vehicules.size()}">
            </div>
        </div>
    </div>
</c:if>
<div class="col-12 table-responsive mt-4">
<c:if test="${not empty collect.vehicules}">
    <table id="tab2" class="table table-striped hover responsive compact table-bordered text-md-nowrap">
        <thead>
        <tr>
            <th> <spring:message code="label.NMatriculation"/> </th>
            <th> <spring:message code="label.NChassis"/> </th>
            <th> <spring:message code="label.Poidstotalencharge"/> </th>
            <th> <spring:message code="label.Poidsnetduvehicule"/> </th>
            <th> <spring:message code="label.Typevehicule"/> </th>
            <th> <spring:message code="label.typedeconteneursA"/></th>
            <th style="min-width: 120px"> <spring:message code="label.Action"/> </th>
            <c:if test="${collect.statut.id_statut_projet==42}">
                <th> <spring:message code="label.Commentaire"/></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty collect.vehicules && collect.statut.id_statut_projet==42}">
                <c:forEach items="${collect.vehicules}" var="v">
                    <c:if test="${v.valid!='oui'}">
                        <tr id="tr${v.id_vehicule}">
                            <td> ${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto}
                                - ${v.num_mat_id_prefect}</td>
                            <td>${v.num_chassis}</td>
                            <td>${v.poit_totale_charge}</td>
                            <td>${v.point_net}</td>
                            <td>${v.typeVehicule}</td>
                            <td>${v.typeConteneur}</td>
                            <!--
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty v.equipementSecurite}">
                                                                                <a href="${url_Admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                                   class="btn btn-primary rounded-circle">
                                                                                    <span class="fa fa-download"></span>
                                                                                </a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                -
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <a href="${url_Admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                           class="btn btn-primary rounded-circle">
                                                                            <span class="fa fa-download"></span>
                                                                        </a>
                                                                    </td>
                                                                    -->
                            <td class="">
                                <button class="btn btn-danger rounded-circle"
                                        onclick="deleteVehicule('${v.id_vehicule}')">
                                    <span class="fas fa-trash-alt"></span>
                                </button>

                                <button class="btn btn-warning rounded-circle"
                                        onclick="getVehicule('${v.id_vehicule}',this)">
                                    <span class="fas fa-pencil-alt"></span>
                                </button>
                            </td>
                            <td>
                                <c:if test="${v.commantaire!=null}">
                                    <div class="row mt-2">
                                        <div class="col" >
                                            <textarea rows="2" disabled class="form-control mb-0">${v.commantaire}</textarea>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:when test="${not empty collect.vehicules && collect.statut.id_statut_projet!=42}">
                <c:forEach items="${collect.vehicules}" var="v">
                    <tr id="tr${v.id_vehicule}">
                        <td>${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto} - ${v.num_mat_id_prefect}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                        <td>${v.typeVehicule}</td>
                        <td>${v.typeConteneur}</td>
                        <!--  <td>
                            <c:if test="${not empty v.equipementSecurite}">
                                <a href="${url_admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle secur"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>
                        <td class="text-center">
                            <c:if test="${not empty v.doc_assurance}">
                                <a href="${url_admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>-->
                        <td class="">
                            <button class="btn btn-danger rounded-circle" onclick="deleteVehicule('${v.id_vehicule}')">
                                <span class="fas fa-trash-alt"></span>
                            </button>
                            <button class="btn btn-warning rounded-circle" onclick="getVehicule('${v.id_vehicule}',this)">
                                <span class="fas fa-pencil-alt"></span>
                            </button>
                            <c:if test="${v.commantaire!=null}">
                                <div class="row mt-2">
                                    <div class="col" >
                                        <textarea rows="2" disabled class="form-control mb-0">${v.commantaire}</textarea>
                                    </div>
                                </div>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" class="bg-primary text-center"><spring:message code="label.Aucunvehiculedanscettedemande"/></td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table></c:if>
</div>