<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

    <table class="table-striped table-bordered table my_table">
        <thead>
        <tr>
            <th><spring:message code="label.Quantite"/></th>
            <th><spring:message code="label.Fichier"/></th>
            <th><spring:message code="label.Action"/></th>
        </tr>
        </thead>
        <tbody>
        <c:set var="qteTotal" value="0"/>
        <c:if test="${empty notification.docMouvement}">
            <tr class="text-center">
                <td colspan="3"><spring:message code="label.AucuneQuantite"/></td>
            </tr>
        </c:if>
        <c:if test="${not empty notification.docMouvement}">
            <c:forEach items="${notification.docMouvement}" var="m">
                <c:set var="qteTotal" value="${qteTotal+m.quantite}"/>
                <tr>
                    <td>${m.quantite}</td>
                    <td>
                        <a href="/downloadFile/${fn:replace(m.url,"/assets/myFile/","")}"
                           class="btn btn-primary">
                            <span class="fa fa-download"></span>
                        </a>
                    </td>
                    <td>
                        <button onclick="delete_docMouv('${m.id_doc_mouvement}','${notification.id_notification}')" class="btn btn-danger rounded-circle">
                            <span class="fa fa-trash"></span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <input type="hidden" value="0" id="id_detail_unit">
    <div class="col-md-6">
        <label><spring:message code="label.Quantite"/></label>
        <input type="text" value="" class="form-control" id="qte_unit">
    </div>
    <div class="col-md-6">
        <label><spring:message code="label.Documentdemouvement"/></label>
        <input type="file" value="" class="form-control" id="file_unit">
    </div>
    <div class="col-12 mt-2">
        <div class="row justify-content-end">
            <div class="col-auto">
                <button id="btn_add_detail" onclick="add_detail_mouvement('${notification.id_notification}',this)" class="btn btn-primary"> <span class="fa fa-plus"></span><spring:message code="label.Ajouter"/> </button>
            </div>
        </div>
    </div>

<input type="hidden" value="${qteTotal}" class="form-control" id="qteTotale">
<c:if test="${!(notification.quantite==qteTotal)}">
    <c:if test="${empty notification.url_quantite_justificatif}">
        <div class="col-12">
            <div class="form-group">
                <label><spring:message code="label.Justificatif"/> </label>
                <input type="file" class="form-control" onchange="updateFile('${notification.id_notification}',this,2)">
            </div>
        </div>
    </c:if>
    <c:if test="${not empty notification.url_quantite_justificatif}">
        <div class="col-11">
            <div class="form-group">
                <label><spring:message code="label.Justificatif"/></label>
                <input type="file" class="form-control" onchange="updateFile('${notification.id_notification}',this,2)">
            </div>
        </div>
        <div class="col-1">
            <div class="form-group mt-4">
                <a download target="_blank" class="btn btn-primary mt-2" href="/downloadFile/${fn:replace(notification.url_quantite_justificatif,"/assets/myFile/","")}">
                    <span class="fa fa-download"></span>
                </a>
            </div>
        </div>
    </c:if>

</c:if>

