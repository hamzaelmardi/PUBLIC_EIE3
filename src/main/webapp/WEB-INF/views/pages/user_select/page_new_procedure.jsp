<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<jsp:include page="../../includes/head.jsp" />


<section class="services-section mt-5" style="background-color: white">
    <div class="container-fluid pt-5">
        <div class="row mt-5">
            <div class="col-lg-12 grid-margin stretch-card cardstatistic "
                 id="pagereload">
                <c:choose>
                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.Importationdechetszonefranche" var="d_code"/>
                    </c:when>
                    <c:when test="${type=='ET'}">
                        <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="d_code"/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <spring:message code="label.Exportationdesdechetsdangereux" var="d_code"/>
                    </c:when>
                    <c:when test="${type=='TR'}">
                        <spring:message code="label.Transitdesdechets" var="d_code"/>
                    </c:when>
                    <c:when test="${type=='CT'}">
                        <spring:message code="label.Collectetransportdesdechetsdangereux" var="d_code"/>
                    </c:when>
                    <c:when test="${type=='IT'}">
                        <spring:message code="label.Installationdetraitementdesdechets" var="d_code"/>
                    </c:when>
                </c:choose>
                <c:set var="p_page" value="Nouvelle procédure"/>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Acceuil</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${d_code}</li>
                    </ol>
                </nav>

                <%--<a href="/api/addDemandNotification/0" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;">Nouvelle  demande </a>--%>


                <div class="row mt-5 justify-content-center">
                    <div class="col-md-10 col-sm-12 mb-5">
                        <p>il a eux un changement au niveaux des demande <b>${d_code}</b></p>
                        <p>
                            Dans le cadre de la nouvelle Organisation du département traitement des autorisation dès le 1er avril 2022,

                            et pour une bonne gestion des ressources et du patrimoine écologique<br><br>

                            Le nouveau cahier des charges pour l'obtention d'une demande <b>${d_code}</b> va contenir une nouvelle clause qui mettra le point sur : <br>
                            <ul class="pl-5">
                        <li style="list-style-type: square">
                            le respect des projets de la charte environnemental
                        </li>
                    </ul>

                           </p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../../includes/footer1.jsp" />
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
