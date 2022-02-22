<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

  <p><spring:message code="label.PourrenouvelleruneautorisationveuillezcliquersurleboutonRenouveller"/></p>
  <table class="table table-hover table-striped table-bordered my_table">
    <tbody>
    <c:choose>
      <c:when test="${type=='CT'}">
        <c:forEach items="${collects}" var="coll">
          <tr>
            <td> ${coll.num_demande} </td>
            <td class="text-center"> <a href="/api/newCollecteRenouv/${coll.id_collecte}" class="btn btn-success"><spring:message code="label.Renouveler"/></a> </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:when test="${type=='IT'}">
        <c:forEach items="${installation}" var="inst">
          <tr>
            <td> ${inst.num_demande} </td>
            <td class="text-center"> <a href="/api/newInstallRenouv/${inst.id_collecte}" class="btn btn-success"><spring:message code="label.Renouveler"/></a> </td>
          </tr>
        </c:forEach>
      </c:when>
    </c:choose>
    <c:forEach items="${collects}" var="coll">
      <tr>
        <td> ${coll.num_demande} </td>
        <td class="text-center"> <a href="/api/newCollecteRenouv/${coll.num_demande}" class="btn btn-success"><spring:message code="label.Renouveler"/></a> </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <jsp:include page="../../includes/footer1.jsp"/>
