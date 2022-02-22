<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<table class="table table-striped table-bordered">
    <thead class="bg_stat_01">
    <tr>
        <th><spring:message code="label.nom"/></th>
        <th><spring:message code="label.Adresse"/></th>
        <th><spring:message code="label.telephone"/></th>
        <th><spring:message code="label.Fax"/></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty trans}">
        <c:forEach items="${trans}" var="t">
            <tr>
                <td>${t.nom}</td>
                <td>${t.adresse}</td>
                <td>${t.tel}</td>
                <td>${t.fax}</td>
            </tr>
        </c:forEach>
    </c:if>
   <c:if test="${empty trans}">
       <tr class="text-center">
           <td colspan="4"><spring:message code="label.Aucuntransporteur"/></td>
       </tr>
   </c:if>

    </tbody>
</table>




