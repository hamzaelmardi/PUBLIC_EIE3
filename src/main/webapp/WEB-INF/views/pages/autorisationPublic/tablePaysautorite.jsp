<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="table-responsive" id="pays_table">
    <table class="table table-bordered pays_table">
        <thead>
        <tr>
            <th> <spring:message code="label.pay"/> </th>
            <th> <spring:message code="label.Autorite"/> </th>
            <th> <spring:message code="label.Autorisations"/> </th>
            <th style="min-width: 120px"> <spring:message code="label.Action"/> </th>
        </tr>
        </thead>
        <tbody id="trAutorite">
        <c:choose>
            <c:when test="${not empty notif.paysAutorites}">
                <c:forEach items="${notif.paysAutorites}" var="p">
                    <tr id="tr${p.id_paysautorite}">
                        <td>${pageContext.response.locale!='ar'?p.pays.nom_fr:p.pays.nom_ar}</td>
                        <td>${p.desc_autorite}</td>
                        <td class="">
                            <c:if test="${not empty p.url_autorite}">
                                <a href="/downloadFile/${fn:replace(p.url_autorite,"/assets/myFile/","")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a>
                            </c:if>
                        </td>
                        <td class="">
                            <button class="btn btn-danger rounded-circle" onclick="deletePaysautorite('${p.id_paysautorite}')">
                                <span class="fas fa-trash-alt"></span>
                            </button>
                            <button class="btn btn-warning rounded-circle" onclick="getPaysautorite('${p.id_paysautorite}')">
                                <span class="fas fa-pencil-alt"></span>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        </tbody>
    </table>
</div>
<div id="zone_form" class=" col-12 p-0 m-0">
    <div class="card">
        <div class="card-body">
            <div class="row m-0 p-0">
                <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                        <label class="f-14">
                            <spring:message code="label.Autorite"/>
                        </label>
                        <input type="hidden" name="id_paysautorite" id="id_paysautorite" value="${paysautorite.id_paysautorite}">
                        <select id="pays" name="pays" class="custom-select">
                            <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
                            <c:forEach items="${pays1}" var="t">
                                <option
                                        <c:if test="${paysautorite.pays.paysId== t[0]}"> selected </c:if>
                                        value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                        <label class="f-14">
                            <spring:message code="label.Autorite"/>
                        </label>
                        <input type="text" value="${paysautorite.desc_autorite}" class="form-control" id="desc_autorite" name="desc_autorite">
                    </div>
                </div>

                <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                        <label class="f-14"> <spring:message code="label.Autorisations"/> </label>
                        <c:if test="${empty paysautorite.url_autorite}">
                            <input type="file" id="url_autorite" name="url_autorite" class="form-control">
                        </c:if>
                        <c:if test="${not empty paysautorite.url_autorite}">
                            <div class="row">
                                <div class="col-10 pl-1">
                                    <input type="file" id="url_autorite" class="form-control">
                                </div>
                                <div class="col-2 pr-1">
                                    <a id="btn_downolad3" href="/downloadFile/${fn:replace(paysautorite.url_autorite,"/assets/myFile/","")}" class="btn btn-primary rounded "><span class="fa fa-download ml-2"></span></a>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-3">

                <button onclick="Save_paysautorite2()" class="btn btn-primary btn-block"><spring:message code="label.enregistrerEutorite"/> </button>

             </div>
    </div>
</div>

