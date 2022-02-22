<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

<h2 style="text-align: center; margin-top: 10px"><spring:message code="label.Lesdocumentsaccompagnantlademande"/></h2>
<div class="row justify-content-center">
    <div class="col-8 justify-content-center">
    <table class="table my_table table-striped table-bordered table-hover">
        <tr>
            <td><spring:message code="label.Lettredavisdepaysdedestinationsignee"/></td>
            <td><a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(notif.url_lettre,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a></td>
        </tr>
        <c:if test="${not empty doc}">
            <c:forEach items="${doc}" var="file">
                <tr>
                    <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                    <td>
                        <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(file.url,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>

        <c:if test="${empty doc}">
            <tr>
                <td colspan="2"> <spring:message code="label.AucunFichier"/>   </td>
            </tr>
        </c:if>

    </table>
</div>
</div>
