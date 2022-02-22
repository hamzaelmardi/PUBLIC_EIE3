<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<div class="table-responsive">
    <table class="table table-bordered " >
        <thead>
        <tr>
            <th> <spring:message code="label.Nmatriculation"/></th>
            <th> <spring:message code="label.NChassis"/> </th>
            <th> <spring:message code="label.Poidstotalencharge"/> </th>
            <th> <spring:message code="label.Poidsnetduvehicule"/> </th>
            <th> <spring:message code="label.Equipementdesecurite"/></th>
            <th> <spring:message code="label.Attestationdassurance"/></th>
            <th> <spring:message code="label.Action"/> </th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty collect.vehicules}">
                <c:forEach items="${collect.vehicules}" var="v">
                    <tr id="tr${v.id_vehicule}">
                        <td>${v.num_matricule}</td>
                        <td>${v.num_chassis}</td>
                        <td>${v.poit_totale_charge}</td>
                        <td>${v.point_net}</td>
                        <td>${(not empty v.equipementSecurite)?v.equipementSecurite.nom_fr:"-"}</td>
                        <td class="text-center">
                            <c:if test="${not empty v.doc_assurance}">
                                <a href="/downloadFile/${fn:replace(v.doc_assurance,"/assets/myFile/","")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>

                            </c:if>
                        </td>
                        <td class="">
                            <button class="btn btn-danger rounded-circle" onclick="deleteVehicule('${v.id_vehicule}')">
                                <span class="fas fa-trash-alt"></span>
                            </button>
                            <button class="btn btn-warning rounded-circle" onclick="getVehicule('${v.id_vehicule}',this)">
                                <span class="fas fa-pencil-alt"></span>
                            </button>


                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" class="bg-primary text-center"> <spring:message code="label.Aucunvehiculedanscettedemande"/></td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

