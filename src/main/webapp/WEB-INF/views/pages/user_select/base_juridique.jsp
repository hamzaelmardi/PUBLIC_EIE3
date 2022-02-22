<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


    <c:if test="${type=='ZF' || type=='XD'}">
        <li>
            <spring:message code="label.Decretndujanvierrelatifalagestiondesdechetsdangereux"/>
            <a target="_blank" download="Décret.docx" href="${pageContext.request.contextPath}/assets/file/decret.docx">
                <img src="${pageContext.request.contextPath}/assets/images/file_word.png" width="40px">
            </a>
        </li>
    </c:if>



