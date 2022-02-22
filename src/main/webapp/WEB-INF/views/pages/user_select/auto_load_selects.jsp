<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right} </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left} </style>
</c:if>
<c:choose>
    <c:when test="${not empty prefecture}">
    <c:forEach items="${prefecture}" var="p">
      <option
              <c:forEach items="${demande.detailRegion.prefectures}" var="pp">
                ${pp.id_prefecture==p.id_prefecture?"selected":""}
              </c:forEach>
              value="${p.id_prefecture}" >${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
    </c:forEach>
  </c:when>
    <c:when test="${not empty commune}">
    <c:forEach items="${commune}" var="c">
      <option
              <c:forEach items="${demande.detailRegion.communes}" var="cc">
                ${cc.id_commune==c.id_commune?"selected":""}
              </c:forEach>
              value="${c.id_commune}" >${pageContext.response.locale=='ar'?c.nom_ar:c.nom_fr}</option>
    </c:forEach>
  </c:when>
    <c:when test="${not empty selectTrans}">
        <c:choose>
            <c:when test="${not empty transporteur}">
                <c:if test="${notification.statut.id_statut_projet==68}">
                    <textarea class="form-control" disabled rows="2">${declaration.commentaire}</textarea>
                </c:if>
                <label><spring:message code="label.DeclarerlenouveauTransporteur"/></label>
                <select ${dd} class="form-control select2" id="id_transp">
                    <option value=""><spring:message code="option.Choisir"/> </option>
                    <c:forEach items="${transporteur}" var="t">
                        <option
                                <c:forEach items="${notification.transporteur}" var="tt">
                                    ${tt.id_transporteurParam==t.id_transporteurParam?"disabled":""}
                                </c:forEach>

                            ${declaration.transporteurParam.id_transporteurParam==t.id_transporteurParam?'selected':""}
                                value="${t.id_transporteurParam}">${t.nom}</option>
                    </c:forEach>
                </select>
                <input class="from-control" type="hidden" value="${declaration.declarationId}" id="id_declaration">
                <input class="from-control" type="hidden" value="${notification.id_notification}" id="id_notif">
                <div class="mt-3">
                    <label><spring:message code="label.Assurance"/></label>
                    <input type="file" class="form-control" id="file_declaration">
                </div>
            </c:when>
            <c:otherwise>
                <p><spring:message code="label.AucunTransporteurnestcompatibleavecletypededechetsdevotreautorisation"/>  </p>
            </c:otherwise>
        </c:choose>

    </c:when>


</c:choose>

