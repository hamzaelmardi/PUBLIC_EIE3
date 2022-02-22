<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<style>
    .main-panel {
        margin-top: 150px !important;
    }

    .card-body {
        text-align: center !important;
    }
    .dropdown-menu {
        min-width: 7rem !important;
        font-size: 14px !important;
        margin: 0.125rem -70px 0px !important;
    }
    .btn:focus, .btn.focus {
        outline: none !important;
        box-shadow: none !important;
    }

    .mydrop{
        direction: ltr !important;
    }

    .mydrop ul li a:hover{
        background-color:#0aa68d;
        color: white;
    }

    .mydrop ul li a{
        text-decoration: none !important;
        margin-bottom:1rem;
        list-style: none !important;
        padding:20px
    }

    @media (max-width: 768px) {
        h1{
            font-size: 1.5rem !important;
        }
    }

</style>

<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="row">
            <div class="col-12">
                <c:choose>

                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.Importationdesdechetsdunezonefranche" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='ET'}">
                        <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='XD'}">
                        <spring:message code="label.Exportationdesdechetsdangereux" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='TR'}">
                        <spring:message code="label.Transitdesdechets" var="p_page"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>

                <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                        <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-md-10 col-sm-12">
                <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="col-12">
                        <div class="card w-100">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-10">
                                        <c:if test="${type=='ZF'}">
                                            <h1><spring:message code="label.Importationdesdechetsdunezonefranche"/></h1>
                                        </c:if>
                                        <c:if test="${type=='ET'}">
                                            <h1><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h1>
                                        </c:if>
                                        <c:if test="${type=='XD'}">
                                            <h1> <spring:message code="label.Exportationdesdechetsdangereux"/></h1>
                                        </c:if>
                                        <c:if test="${type=='TR'}">
                                            <h1>  <spring:message code="label.Transitdesdechets"/></h1>
                                        </c:if>
                                    </div>
                                    <div class="col-md-2 mydrop">
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                                <img src="${pageContext.request.contextPath}/assets/images/question.png" width="40" class="img-fluid img-circle">
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()"><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                                <c:choose>
                                                    <c:when test="${type=='ZF'}">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/zone%20franche/${pageContext.response.locale=='ar'?'التسجيل.pdf':'inscription.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                                    </c:when>
                                                    <c:when test="${type=='ET'}">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Importation%20des%20déchets%20non%20dangereux%20d_un%20pays%20étranger/${pageContext.response.locale=='ar'?'التسجيل.pdf':'inscription.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                                    </c:when>
                                                    <c:when test="${type=='XD'}">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Exportation%20des%20dechets/${pageContext.response.locale=='ar'?'التسجيل.pdf':'inscription.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Transit%20des%20dechets/${pageContext.response.locale=='ar'?'التسجيل.pdf':'inscription.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="light">
                        <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
                        <video id="VisaChipCardVideo" width="600" controls>
                            <c:choose>
                                <c:when test="${type=='ZF'}">
                                    <source src="${pageContext.request.contextPath}/assets/video/AddZF.mp4" type="video/mp4">
                                </c:when>
                                <c:when test="${type=='ET'}">
                                    <source src="${pageContext.request.contextPath}/assets/video/AddET.mp4" type="video/mp4">
                                </c:when>
                                <c:when test="${type=='XD'}">
                                    <source src="${pageContext.request.contextPath}/assets/video/AddXD.mp4" type="video/mp4">
                                </c:when>
                                <c:otherwise>
                                    <source src="${pageContext.request.contextPath}/assets/video/AddTR.mp4" type="video/mp4">
                                </c:otherwise>
                            </c:choose>
                            <!--Browser does not support <video> tag -->
                        </video>
                    </div>

                    <div id="fade" onClick="lightbox_close();"></div>
                    <div class="col-md-6 col-sm-12 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">
                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <p class="text-success font_bold  pl-2"><spring:message
                                                code="label.Deposerundossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message code="label.cliquezsurleboutonconcerne"/></p>
                                    </div>
                                    <div class="col-12">
                                        <c:choose>
                                            <c:when test="${type=='ZF' || type=='XD'}">
                                                <a href="/api/addNumNotification/${type}/0"
                                                   class="btn btn-sm mt-1 btn-success"><spring:message
                                                        code="label.Demandedenumerosdenotification"/>
                                                    <c:if test="${pageContext.response.locale!='ar'}">
                                                    <span class="fa fa-angle-double-right"></span>
                                                    </c:if><c:if test="${pageContext.response.locale=='ar'}"><span class="fa fa-angle-double-left"></span></c:if>


                                                </a>

                                                <button onclick="affiche_nume_zone('zone_tab')"
                                                        <c:if test="${ empty notif}"> disabled </c:if>
                                                        class="btn btn-sm mt-1 btn-success"><spring:message
                                                        code="label.Deposerundossier"/> <c:if test="${pageContext.response.locale!='ar'}">
                                                    <span class="fa fa-angle-double-right"></span>
                                                </c:if><c:if test="${pageContext.response.locale=='ar'}"><span class="fa fa-angle-double-left"></span></c:if></button>
                                                <%--<a href="/api/verifQuestion/${type}/listNum" class="btn btn-sm btn-success mb-2">Déposer le Dossier <span class="fa fa-angle-double-right"></span></a>--%>

                                            </c:when>
                                            <c:otherwise>
                                                <a href="/api/addDemandNotification/0/${type}/N"
                                                   class="btn btn-sm mt-1 btn-success"><spring:message
                                                        code="label.Commencerlademarche"/> <c:if test="${pageContext.response.locale!='ar'}">
                                                    <span class="fa fa-angle-double-right"></span>
                                                </c:if>
                                                    <c:if test="${pageContext.response.locale=='ar'}"><span class="fa fa-angle-double-left"></span></c:if>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">

                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <p class="text-success font_bold  pl-2"><spring:message
                                                code="label.Suivremondossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message
                                                code="label.Poursuivreletatdavancementdundossierdejadepose"/></p>
                                    </div>
                                    <div class="col-12">

                                            <button onclick="affiche_nume_zone('zone_tab1')"
                                            <c:if test="${empty notifall}">disabled</c:if>
                                                    class="btn btn-sm mt-1 btn-success">
                                                <spring:message code="label.Parnumerodenotification"/>
                                                <c:if test="${pageContext.response.locale!='ar'}">
                                                <span class="fa fa-angle-double-right"></span>
                                                </c:if>
                                                <c:if test="${pageContext.response.locale=='ar'}">
                                                    <span class="fa fa-angle-double-left"></span>
                                                </c:if>
                                         </button>


                                            <button onclick="go_to('/api/ListeAutorisation/${type}/d')"
                                            <c:if test="${empty notifall}">disabled</c:if>
                                               class="btn btn-sm mt-1 btn-success">
                                                <spring:message code="label.Affichermesdossiers"/>
                                              <c:if test="${pageContext.response.locale!='ar'}">
                                                <span class="fa fa-angle-double-right"></span></button>
                                              </c:if>
                                              <c:if test="${pageContext.response.locale=='ar'}">
                                                 <span class="fa fa-angle-double-left"></span>
                                              </c:if>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center zone_tab collapse" id="zone_tab" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="col-md-10 col-sm-12">
                <a class="btn btn-primary mb-2"><spring:message code="label.Mesnumerosdenotification"/> </a>
                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><spring:message code="label.Numerodenotification"/></th>
                        <th scope="col"><spring:message code="label.datededemandedenumerodenotification"/></th>
                        <th scope="col"><spring:message code="label.code"/></th>
                        <th scope="col"><spring:message code="label.Typededechets"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${notif}" var="n" varStatus="loop">
                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_notification}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td scope="col">${n.code.nom_fr}</td>
                            <td scope="col">${n.code.nom_ar}</td>
                            <td scope="col"><a href="/api/addDemandNotification/${n.id_notification}/${type}/N"
                                               class="btn btn-success"><spring:message code="label.Deposerlademande"/></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                </div>
                <c:if test="${empty notif}">
                    <spring:message code="label.AucunnumerodeNotificationenregistrer"/>.
                </c:if>
            </div>
        </div>
        <div class="row justify-content-center zone_tab collapse" id="zone_tab1" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-10 col-sm-12">
                <a class="btn btn-primary mb-2"> <spring:message code="label.Mesnumerosdedossier"/></a>

                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><spring:message code="label.Numerodenotification"/></th>
                        <th scope="col"><spring:message code="label.dateDedepot"/></th>
                        <th scope="col"><spring:message code="label.code"/></th>
                        <th scope="col"><spring:message code="label.Typededechets"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${notifall}" var="n" varStatus="loop">

                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_notification}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td scope="col">${n.code.nom_fr}</td>
                            <td scope="col">${n.code.nom_ar}</td>
                            <td><a href="/api/getnotifById1/${type}/${n.id_notification}"
                                   class="btn btn-success"><spring:message code="label.Recapitulation"/></a></td>
                        </tr>


                    </c:forEach>
                </table>
                </div>
                <c:if test="${empty notifall}">
                    <spring:message code="label.AucunnumerodeDossierenregistrer"/>.
                </c:if>
            </div>
        </div>


    </div>
</div>


<script>
    function fun_recher() {
        var id = $('#recap').val();
        $.ajax({
            url: '/api/checknotif/' + id + '/${type}',
            type: 'GET',
            dataType: 'html',
            data: {},
        })
            .done(function (data) {
                if (data == 0) {
                    swal("<spring:message code="label.Aucunresultat"/> ", "<spring:message code="label.mercidevrifierlenumerosaisie"/> ", "error");
                } else {
                    window.location.href = "/api/getnotifById1/${type}/" + data;
                }

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>


<jsp:include page="../../includes/footer1.jsp"/>
