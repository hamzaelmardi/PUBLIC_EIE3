<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:if test="${not empty prefectures}">
    <option value="" selected><spring:message code="option.Choisir"/></option>
    <c:forEach items="${prefectures}" var="p">
        <option
                value="${p.id_prefecture}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
    </c:forEach>
</c:if>

