<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<jsp:include page="../../includes/head.jsp"/>

<div class="auto-container">
    <div class="auto-container">
        <div class="row clearfix" style="    justify-content: center;">

            <div class="right-col col-lg-6 col-md-12 col-sm-12">
                <div class="inner"  style="text-align: center;padding:  15% !important;">


                    <h2> <i style="color:${color}" class="fa fa-${icon}" aria-hidden="true"></i> ${verif}</h2>
                    <a href="/index" class="btn btn-success"><spring:message code="label.Accueil"/></a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../includes/footer1.jsp"/>
