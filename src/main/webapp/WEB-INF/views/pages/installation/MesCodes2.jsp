<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table class="table table-striped">
    <tr>
        <th style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Typededechet"/></th>
        <th style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Action"/></th>
    </tr>
    <c:forEach items="${inst.code}" var="code_colle" varStatus="loopp" >
        <tr>
            <td class="col-8">${code_colle.nom_ar}</td>
            <td class="col-4 p-2 text-center">
                <button class="btn btn-success rounded-circle"
                        onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                    <span class="fa fa-times"></span></button>
            </td>
        </tr>
    </c:forEach>
</table>
