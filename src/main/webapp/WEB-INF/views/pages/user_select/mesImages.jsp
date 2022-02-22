<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:choose>

    <c:when test="${type=='ZF'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_zf.PNG">
    </c:when>
    <c:when test="${type=='ET'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_ET.PNG">
    </c:when>
    <c:when test="${type=='RS'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_zf">
    </c:when>
    <c:when test="${type=='XD'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_xd.PNG">
    </c:when>
    <c:when test="${type=='TR'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/transit.PNG">
    </c:when>
    <c:when test="${type=='EE'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/${pageContext.response.locale!='ar'?'EIE_organigrame.png':'EIE_organigrame_ar.png'}">
    </c:when>
    <c:when test="${type=='NT'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_NT.PNG">
    </c:when>
    <c:when test="${type=='AE'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/audit_organigrame.png">
    </c:when>
    <c:when test="${type=='CT'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_collecte.PNG">
    </c:when>
    <c:when test="${type=='IT'}">
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_it.PNG">
    </c:when>
    <c:otherwise>
        <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_zf.PNG">
    </c:otherwise>
</c:choose>



