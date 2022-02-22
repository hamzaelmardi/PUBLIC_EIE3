<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<input type="hidden" id="cpt" value="${inst.codeTmp.size()}">
<input type="hidden" id="typeIT" value="${inst.type}">
<div class="col-sm-10 listCode" style="margin-top: 4rem">
    <table class="table table-striped">
        <tr>
            <th>Type de déchet</th>
            <th>Action</th>
        </tr>
        <tbody id="tbody_it">
        <c:forEach items="${inst.codeTmp}" var="code_colle" varStatus="loopp" >
            <c:choose>
                <c:when test="${loopp.index%2==0&& inst.type.equals('2')}">
                    <c:set var="bg" value="#FA8072"/>
                </c:when>
                <c:when test="${loopp.index%2!=0 && inst.type.equals('2')}">
                    <c:set var="bg" value="#F08080"/>
                </c:when>
                <c:when test="${loopp.index%2==0 && !inst.type.equals('2')}">
                    <c:set var="bg" value="#ABEBC6"/>
                </c:when>
                <c:when test="${loopp.index%2!=0 && !inst.type.equals('2')}">
                    <c:set var="bg" value="#82E0AA"/>
                </c:when>
                <c:otherwise>
                    <c:set var="bg" value=""/>
                </c:otherwise>
            </c:choose>
            <tr style="background-color:${bg};color: white !important;font-weight:bold" >
                <td class="col-8">${code_colle.nom_ar}</td>
                <td class="col-4 p-2 text-center">
                    <button class="btn btn-info rounded-circle"
                            onclick="addCodeIT_tmp('${code_colle.id_code}','delete')">
                        <span class="${inst.type.equals('2')?'fa fa-times':'fa fa-plus'}"></span></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

