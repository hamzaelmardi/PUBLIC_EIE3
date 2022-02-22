<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<!--   //datatable-->
<link href="${pageContext.request.contextPath}/assets/css/datatable/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/datatable/responsive.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bs-stepper.min.css">

<table class="table mytable table-striped table-hover table-bordered" id="example">
    <thead>
    <tr>
        <th class="text-center"><spring:message code="label.typededechet"/></th>
        <th class="text-center"><spring:message code="label.code"/></th>
        <th class="text-center"><spring:message code="label.transporteur"/></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty listF}">
        <c:forEach items="${listF}" var="f">
            <tr>
                <td><c:forEach items="${f.code}" var="p">
                    - ${p.nom_ar}<br/>
                </c:forEach>
                </td>
                <td style="width:20%"><c:forEach items="${f.code}" var="p">
                    - ${p.nom_fr}<br/>
                </c:forEach>
                </td>
                <td>${f.nom}</td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty listF}">
        <tr class="text-center">
            <td colspan="3"><spring:message code="label.Aucunresultat"/></td>
        </tr>
    </c:if>
    </tbody>
</table>

<jsp:include page="../../includes/footer1.jsp"/>


