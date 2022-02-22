<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:forEach items="${doc}" var="d" varStatus="loopp">
    <li class="m-1"><i class="btn btn-sm bg-info" style="border-radius: 50%">${loopp.index+1}</i>&nbsp; ${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</li>
</c:forEach>



