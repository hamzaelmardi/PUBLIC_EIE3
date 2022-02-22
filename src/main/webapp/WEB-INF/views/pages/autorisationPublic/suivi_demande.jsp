<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<jsp:include page="card.jsp" />



<section class="suivi-section container" style="background-color: white;margin-top: 2%">

    <div class="hp-box">
        <div class="ow-vl-inner">
            <div class="ow-html">
                <div class="container">
                    <i class="fa fa-folder-open"></i><spring:message code="label.Rechercherunenotification" />
                    <hr>
                    <input type="search" class="form-control" name="searchDossier">
                    <button class="btn btn-primary mt-2 text-center" onclick="searchNotificationSuivi()"><i class="fa fa-search"></i><spring:message code="label.Search" />  </button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
    <div id="searchResult"></div>
    </div>
</section>

