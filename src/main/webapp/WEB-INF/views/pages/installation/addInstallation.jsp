<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <c:set var="lng" value="ar"/>
    <style>.select2-results__option{text-align:right} </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <c:set var="lng" value="fr"/>
    <style>.select2-results__option{text-align:left} </style>
</c:if>

<style>

    * {
        box-sizing: border-box
    }

    .file_existe {
        position: absolute;
        bottom: 16%;
    }

    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
    }

    .tab {
        float: left;
        width: 20%;
    }

    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }

    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current "tab button" class */
    .tab button.active {
        background-color: red;
    }



    .myLabel label{
        line-height: 33px;
    }
    /* Style the tab content */
    .dropdown-menu {
        min-width: ${pageContext.response.locale=='ar'?'9rem':'7rem'} !important;
        font-size: 14px !important;
        margin: 0.125rem ${pageContext.response.locale=='ar'?'40px':'-70px'} 0px;
    }

    .btn:focus, .btn.focus {
        outline: none !important;
        box-shadow: none !important;
    }

    .mydrop{
        position: absolute;
    ${pageContext.response.locale=='ar'?'left':'right'}: 35px !important;
        top: 0px;
        direction: ltr !important;
    }

    @media (max-width: 768px) {
        .breadcrumb-item a{
            font-size: 7pt !important;
        }
        .mydrop{
        ${pageContext.response.locale=='ar'?'left:23px !important;':'right:25px !important'};
            top: 0px;
        }
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


</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>




<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section">
                <div class="col-12 mb-4">

                    <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                            <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/IT"><spring:message code="label.Installationdetraitementdesdechets"/></a></li>
                            <div class="mydrop">
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                        <img src="${pageContext.request.contextPath}/assets/images/question.png" width="30" class="img-fluid img-circle">
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()"><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Installation%20de%20traitement%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </ol>
                    </nav>
                    <div id="light">
                        <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
                        <video id="VisaChipCardVideo" width="600" controls>
                            <source src="${pageContext.request.contextPath}/assets/video/ajouter%20demande%20instalation.mp4" type="video/mp4">
                            <!--Browser does not support <video> tag -->
                        </video>
                    </div>

                    <div id="fade" onClick="lightbox_close();"></div>
                </div>
                <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <c:choose>
                        <c:when test="${empty notif}">
                            <c:set var="disabled" value="disabled"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="disabled" value=""/>
                        </c:otherwise>
                        </c:choose>

                        <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                            <div class="col-lg-4 col-md-4 col-sm-12 mb-sm-3">
                                    <input type="hidden" name="id_installation" value="${notif.id_installation}" id="id_installation">
                                    <c:if test="${notif.statut.id_statut_projet!=87}">
                                        <button class="tablinks btn-info btn" onclick="openCity(event, '1')" id="defaultOpen"
                                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd">
                                            1.<%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                            <spring:message code="label.informationssurlepetitionnaire"/>
                                        </button>
                                    </c:if>
                                    <c:if test="${notif.statut.id_statut_projet==87 && not empty notif.codeTmp}">
                                        <button class="tablinks  btn-info btn ${notif.statut.id_statut_projet==87?'':'my_tab'} " ${disabled}
                                                onclick="openCity(event, '2')"
                                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left; background-color: #7dc7bd;'} white-space: normal;" id="${notif.statut.id_statut_projet==87 ?'defaultOpen':'Btn2'}">
                                            2. <spring:message code="label.Installationdetraitementdesdechets"/></button>
                                        </button>
                                    </c:if>
                                    <c:if test="${notif.statut.id_statut_projet!=87}">
                                        <button class="tablinks btn-info btn my_tab2" ${disabled} id="Btn2"
                                                onclick="openCity(event, '2')"
                                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left; background-color: #7dc7bd;'} white-space: normal;">
                                            2. <spring:message code="label.Installationdetraitementdesdechets"/></button>
                                        </button>
                                    </c:if>
                                    <c:if test="${notif.statut.id_statut_projet!=87}">
                                        <button class="tablinks  btn-info btn my_tab3" ${disabled} id="Btn3"
                                                onclick="openCity(event, '3')"
                                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" >
                                            3. <spring:message code="button.equipedetravail"/></button>
                                        </button>
                                    </c:if>
                                    <c:if test="${notif.statut.id_statut_projet!=87}">
                                        <button class="tablinks  btn-info btn my_tab4" ${disabled} id="Btn4"
                                                onclick="openCity(event, '4')"
                                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" id="${notif.statut.id_statut_projet==87 && empty notif.codeTmp ?'defaultOpen':'Btn4'}">
                                            4. <spring:message code="button.mespieces"/></button>
                                        </button>
                                    </c:if>
                                    <c:if test="${notif.statut.id_statut_projet!=87}">
                                        <button class="tablinks btn-primary btn my_tab5" ${disabled} id="Btn5"
                                                onclick="verif_champs_recap('4','IT','id_installation','5')" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}; background-color: #7dc7bd" >
                                            5. <spring:message code="label.Recapitulation"/>
                                        </button>
                                    </c:if>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12 mt-2">
                                <c:if test="${notif.statut.id_statut_projet!=87}">
                                    <div class="row pb-2 mt-3">
                                        <div id="1" class="tabcontent col-12" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <h4 class="titre_abs col-12">
                                                <%--<spring:message code="label.InformationdepEtitionnaire"/>--%>
                                                    <spring:message code="label.informationssurlepetitionnaire"/>
                                            </h4>
                                            <input type="hidden" name="id_installation" value="${notif.id_installation}" id="id_installation">
                                            <form id="formnotif" name="formnotif">
                                                <div class="row mt-5 p-0">

                                                    <c:choose>
                                                        <c:when test="${id!=0}">
                                                            <input type="hidden" name="id_install_originale"
                                                                   value="${notif.id_installOriginale}">
                                                            <input type="hidden" name="id_statut"
                                                                   value="${notif.statut.id_statut_projet}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="hidden" name="id_install_originale" value="0">
                                                            <input type="hidden" name="id_statut" value="51">
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${typeRenv=='N'}">
                                                            <input type="hidden" name="id_type_renouvellement" value="1">
                                                        </c:when>
                                                        <c:when test="${typeRenv=='R'}">
                                                            <input type="hidden" name="id_type_renouvellement" value="2">
                                                        </c:when>
                                                    </c:choose>

                                                    <input type="hidden" name="id_compte" value="${user.compteId}">

                                                    <c:if test="${typeRenv=='R'}">
                                                        <div class="col-12 p-0 m-0">
                                                            <div class="row m-0 p-0">
                                                                <div class="col-md-6 col-sm-12 ">
                                                                    <div class="form-group"
                                                                         style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                                        <label><spring:message code="label.NumeroDemande"/></label>
                                                                        <input value="${notif.num_demande}" type="text" disabled
                                                                               required class="form-control"
                                                                               onchange="getInstallRenouveller(this)">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>

                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label><spring:message code="label.nomdesociete"/></label>
                                                            <input value="${notif.raison}" type="text" name="raison"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label><spring:message code="label.if"/></label>
                                                            <input value="${notif.ife}" type="text" name="ife" id="telephone"
                                                                   class="form-control">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row m-8 p-0">

                                                    <div class="col-md-6 col-sm-12 ">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label> <spring:message code="label.Adresse"/></label>
                                                            <textarea type="text" name="adresse" id="adresse"
                                                                      class="form-control">${notif.adresse}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label> <spring:message code="label.Tel"/></label>
                                                            <input value="${notif.tel}" type="text" name="tel" id="telephone"
                                                                   class="form-control">
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row m-8 p-0">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label> <spring:message code="label.Fax"/></label>
                                                            <input value="${notif.fax}" type="text" name="fax" id="fax"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label> <spring:message code="label.Email"/></label>
                                                            <input value="${notif.email}" type="email" name="email" id="emailentrprs"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row m-0 p-0">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.Region"/>  <sup class="text-danger">(*)</sup> </label>
                                                            <select ${dd} name="region_id" id="region_id" class="form-control select2" data-width="100%" onchange="updateRegionCT(this.value)">
                                                                <option value="0"><spring:message code="option.Choisir"/></option>
                                                                <c:forEach items="${region}" var="t">
                                                                    <option <c:if
                                                                            test="${notif.region.regionId== t[0]}"> selected </c:if>
                                                                            value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">

                                                            <label> <spring:message code="label.Province"/>  <sup class="text-danger">(*)</sup> </label>
                                                            <select ${dd} name="prefecture_id" id="prefecture_id" class="form-control select2" data-width="100%"   onchange="updatePrefectureCT(this.value)">
                                                                <option value="0"><spring:message code="option.Choisir"/></option>
                                                                <c:if test="${notif.prefecture!=null }">
                                                                    <c:forEach items="${notif.region.prefecture}" var="t">
                                                                        <option <c:if
                                                                                test="${notif.prefecture.id_prefecture== t.id_prefecture}"> selected </c:if> value="${t.id_prefecture }">${pageContext.response.locale!='ar'?t.nom_fr:t.nom_ar }</option>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>


                                                <div class="row justify-content-center m-0 p-0 mt-2">

                                                    <div class="col-lg-4 col-md-4 col-sm-6" style="text-align: center">
                                                        <c:if test="${id==0 }">
                                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                    id="Suivant"
                                                                    onclick="addObjectGeneral('formnotif','installation','','id_installation','2')"
                                                                    class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${id!=0 }">
                                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                    id="Suivant"
                                                                    onclick="updateGeneral('formnotif','installation','2',${id},'id_installation','non')"
                                                                    class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                                            </button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${notif.statut.id_statut_projet!=87}">
                                    <div class="row pb-2 mt-3">
                                        <div id="2" class="tabcontent col-12">

                                    <h4 class="titre_abs"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <spring:message code="label.Installationdetraitementdesdechets"/></h4>
                                    <form id="formimportateur1" name="formimportateur">
                                        <div class="row m-0 p-0 mt-5">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.Sitedelinstallation"/></label>
                                                    <input value="${notif.site}" type="text" required name="site"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.Operation"/></label>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class=" col-lg-6 col-md-12 col-sm-12 border-right">

                                                                    <div class="form-check">

                                                                        <input checked class="form-check-input" type="radio"
                                                                               id="valorisationRadio"
                                                                        <c:if test="${notif.operation== 'valorisation'}">
                                                                               checked  </c:if> name="Operation"
                                                                               value="valorisation">

                                                                        <label class="form-check-label"
                                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                            <spring:message code="label.valorisation"/>

                                                                        </label>
                                                                    </div>

                                                                </div>
                                                                <div class=" col-lg-6 col-md-12 col-sm-12 border-left">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                               id="traitementRadio"
                                                                        <c:if test="${notif.operation== 'traitement'}">
                                                                               checked  </c:if> name="Operation"
                                                                               value="traitement">

                                                                        <label class="form-check-label"
                                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                            <spring:message code="label.traitement"/>
                                                                        </label>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- add type -->
                                        <div class="row m-0 p-0 mt-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.descriptiondinstallation"/></label>
                                                    <input type="text" required name="description" value="${notif.description}"
                                                           class="form-control">
                                                </div>
                                            </div>

<%--                                            <div class="col-md-6 col-sm-12">--%>
<%--                                                <div class="form-group"--%>
<%--                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">--%>
<%--                                                    <label> <spring:message code="label.structuredinstallation"/></label>--%>
<%--                                                    <input type="text" required name="structure" value="${notif.structure}"--%>
<%--                                                           class="form-control">--%>
<%--                                                </div>--%>

<%--                                            </div>--%>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label> <spring:message code="label.QuantiteestimeDesDechets"/></label>
                                                    <input type="text" required name="quantite" value="${notif.quantite}" onkeyup="setMinValue('quantite',this.value)"
                                                           id="quantite"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- fin -->
                                        <div class="row m-0 p-0 mt-2">

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label> <spring:message code="label.Typedappareil"/></label>
<%--                                                    <input type="text" required name="type_appareil"--%>
<%--                                                           value="${notif.type_appareil}" class="form-control">--%>
                                                    <textarea type="text" required name="type_appareil" id="type_appareil"
                                                              class="form-control">${notif.type_appareil}</textarea>
                                                </div>
                                            </div>

<%--                                            <div class="col-md-6 col-sm-12">--%>
<%--                                                <div class="form-group"--%>
<%--                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">--%>
<%--                                                    <label> <spring:message code="label.QuantiteestimeDesDechets"/></label>--%>
<%--                                                    <input type="number" required name="quantite" value="${notif.quantite}" onkeyup="setMinValue('quantite',this.value)"--%>
<%--                                                           id="quantite"--%>
<%--                                                           class="form-control">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label> <spring:message code="label.Unite"/></label>
                                                    <select name="id_unite" required id="id_unite" class="form-control select2" ${dd}
                                                            data-width="100%" >
                                                        <option value=""><spring:message code="option.Choisir"/></option>
                                                        <c:forEach items="${unite_id}" var="t">
                                                            <option  <c:if
                                                                    test="${notif.unite.unite_id== t[0]}"> selected </c:if>
                                                                    value="${t[0] }">${pageContext.response.locale=='ar'?t[2]:t[1] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row m-0 p-0 mt-2">

<%--                                            <div class="col-md-6 col-sm-12">--%>
<%--                                                <div class="form-group"--%>
<%--                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">--%>
<%--                                                    <label> <spring:message code="label.Unite"/></label>--%>
<%--                                                    <select name="id_unite" required id="id_unite" class="form-control select2" ${dd}--%>
<%--                                                            data-width="100%" >--%>
<%--                                                        <option value=""><spring:message code="option.Choisir"/></option>--%>
<%--                                                        <c:forEach items="${unite_id}" var="t">--%>
<%--                                                            <option  <c:if--%>
<%--                                                                    test="${notif.unite.unite_id== t[0]}"> selected </c:if>--%>
<%--                                                                    value="${t[0] }">${pageContext.response.locale=='ar'?t[2]:t[1] }</option>--%>
<%--                                                        </c:forEach>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>
                                        <div class="row justify-content-center p-0 mt-2">
                                                <!--Radio buttons-->
                                                <div class="btn-group row justify-content-center border p-3 col-12  p-0 mt-2 myLabel" data-toggle="buttons">
<%--                                                            <label class="btn btn-warning active form-check-label text-white col-lg-5 p-2 col-md-10 col-sm-12 m-2">--%>
<%--                                                                <input class="form-check-input" type="radio" id="saufque" ${notif.type== '3'?'checked':''} name="type" value="3" onchange="my_function('3','id_installation')"  autocomplete="off"><span style="margin-right: ${pageContext.response.locale=='ar'?'20px':''}"><spring:message code="label.jeveuxtraitertouslesdechets"/></span>--%>
<%--                                                            </label>--%>
                                                            <label class="btn btn-primary form-check-label col-lg-6 col-md-10 pl-4  p-2 col-sm-12 text-white m-2">
                                                                <input class="form-check-input" type="radio" autocomplete="off" id="tous" ${notif.type== '2'?'checked':''} name="type" value="2" onchange="my_function('2','id_installation')"> <span style="margin-right: ${pageContext.response.locale=='ar'?'20px':''}"><spring:message code="label.jeveuxtraiterlesdechetsdelalistesousdessous"/></span>
                                                            </label>
                                                            <label class="btn btn-danger form-check-label text-white col-lg-5 p-2 col-md-10 col-sm-12 m-2">
                                                                <input class="form-check-input" type="radio" autocomplete="off"  id="parType" ${notif.type== '1'?'checked':'checked'}  name="type" value="1" onchange="my_function('1','id_installation')"><span style="margin-right: ${pageContext.response.locale=='ar'?'20px':''}"><spring:message code="label.jeveuxtraitertouslesdechetssauf"/></span>
                                                            </label>
                                                 </div>
                                         </div>
                                        <!--Radio buttons-->

                                        <div class="row m-0 p-0 mt-4">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-sm-8" style="display: none;" id="msg" >
                                                        <h4 style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Vousavezchoisitouslescodes"/></h4>
                                                    </div>
                                                    <div class="col-lg-8 col-md-12 col-sm-12 listCode" >
                                                        <div class="table-responsive">
                                                             <table class="table MonTable table-striped" data-page-length="15" id="myCheck">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col" style="min-width: 100px;${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" ><spring:message
                                                                        code="label.CodeA"/></th>
                                                                <th scope="col" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.TypeA"/></th>
                                                                <th scope="col" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Selectionner"/></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <c:forEach items="${code}" var="c">
                                                                <c:set var="checked" value=""/>
                                                                <c:forEach items="${notif.code}" var="code_colle">
                                                                    <c:if test="${code_colle.id_code==c.id_code}">
                                                                        <c:set var="checked" value="checked disabled"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <tr>
                                                                    <td>${c.nom_fr }</td>
                                                                    <td>${c.nom_ar }</td>
                                                                    <td>
                                                                        <input ${checked} class="h-15" type="checkbox"
                                                                                          id="id-${c.id_code }" name="chk"
                                                                                          onchange="addCodeIT('id_installation','${c.id_code}','add')">
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>


                                                            </tbody>
                                                        </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12 col-sm-12 listCode" style="margin-top:3rem">
                                                        <div class="row pb-2 m-0" id="monT">
                                                            <table class="table table-striped">
                                                                <tr>
                                                                    <th style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Typededechet"/></th>
                                                                    <th style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><spring:message code="label.Action"/></th>
                                                                </tr>
                                                                <tbody>
                                                                <c:forEach items="${notif.code}" var="code_colle" varStatus="loopp" >
                                                                    <tr>
                                                                        <td class="col-8">${code_colle.nom_ar}</td>
                                                                        <td class="col-4 p-2 text-center">
                                                                            <button class="btn btn-success rounded-circle"
                                                                                    onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                                                                                <span class="fa fa-times"></span></button>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-center mb-4">
                                            <div class="col-md-4 col-sm-6">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="prec1"
                                                        onclick="openCity2('#defaultOpen', '1')"
                                                        class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                                </button>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Enregistrere"
                                                        onclick="updateGeneral_installation('formimportateur1','installation','3',${id},'id_installation','non')" class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                                    </div>
                                </c:if>

                                <c:if test="${notif.statut.id_statut_projet==87 && not empty notif.codeTmp}">
                                    <div class="row pb-2 mt-3">
                                        <div id="2" class="tabcontent col-12">

                                        <h4 class="titre_abs"
                                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <spring:message code="label.Installationdetraitementdesdechets"/></h4>
                                        <form id="formimportateur1" name="formimportateur" class="">
                                            <div class="row m-0 p-0 ">
                                                <div class="col-12">
                                                    <h4>${notif.type.equals('2') && not empty notif.codeTmp?'Suite à l\'étude de votre demande d\'installation de traitement des déchets  dangereux , est apres la visite de controle de conformite de votre installattion,  veuillez supprimer les déchets suivant: :':'Suite à l\'étude de votre demande d\'installation et traitement des déchets la commission a décidé d\'ajouter à la liste des déchets ci-dessous  , pour suivre le traitement de votre demande  veuillez d\'ajouter  les déchets suivants :'}</h4>
                                                    <div class="row justify-content-center" id="my_rows">
                                                        <input type="hidden" id="cpt" value="${notif.codeTmp.size()}">
                                                        <input type="hidden" id="typeIT" value="${notif.type}">
                                                        <div class="col-sm-10 listCode" style="margin-top: 4rem">
                                                                <table class="table table-striped">
                                                                    <tr>
                                                                        <th><spring:message code="label.typededechet"/> </th>
                                                                        <th><spring:message code="label.Action"/></th>
                                                                    </tr>
                                                                    <tbody id="tbody_it">
                                                                    <c:forEach items="${notif.codeTmp}" var="code_colle" varStatus="loopp" >
                                                                        <c:choose>
                                                                            <c:when test="${loopp.index%2==0}">
                                                                                <c:set var="bg" value="#FA8072"/>
                                                                            </c:when>
                                                                            <c:when test="${loopp.index%2!=0}">
                                                                                <c:set var="bg" value="#F08080"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:set var="bg" value=""/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <tr style="background-color:${bg};color: white !important;font-weight:bold" >
                                                                            <td class="col-8">${code_colle.nom_ar}</td>
                                                                            <td class="col-4 p-2 text-center" id="myBtn${code_colle.id_code}">
                                                                                <button class="btn btn-info rounded-circle"
                                                                                        onclick="addCodeIT_tmp('${code_colle.id_code}','delete')">
                                                                                    <span class="${notif.type.equals('2')?'fa fa-times':'fa fa-plus'}"></span></button>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row justify-content-center">
                                                <div class="col-10 mt-3  ">
                                                    <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                        <div>
                                                            <label style="width: 100%;"> ${pageContext.response.locale=='ar'?doc[14].nom_ar:doc[14].nom_fr} </label>
                                                            <input
                                                                 required
                                                                 onchange="addDocG('0',${doc[14].id_docImport},'doc${doc[14].id_docImport }','IT','id_installation')"
                                                                 accept=".pdf" type="file" id="doc${doc[14].id_docImport }"
                                                                 class="form-control mydoc">
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row justify-content-center mb-4">
                                                    <div class="col-md-2 col-sm-6">
                                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="MyBtn"
                                                                onclick="changerEtat_IT()" disabled  class="btn btn-info btn-block">Enregistrer
                                                        </button>
                                                    </div>
                                            </div>
                                        </form>
                                    </div>
                                    </div>
                                </c:if>

                                <c:if test="${notif.statut.id_statut_projet!=87}">
                                    <div class="row pb-2">
                                        <div id="3" class="tabcontent col-12">

                                    <h4 class="titre_abs"
                                        style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <spring:message code="label.equipedetravail"/></h4>
                                    <form id="formimportateur" name="formimportateur">
                                        <div class="row m-0 p-0 mt-5">
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.nbequipe"/></label>
                                                    <input value="${notif.nbr_equipe_travail}" type="number" name="nbr_equipe_travail" id="Nom_fr"  class="form-control" onkeyup="setMinValue('Nom_fr',this.value)">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group"
                                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.Horairedexploitation"/></label>
                                                    <input value="${notif.horaire_exploitation}" type="text"
                                                           name="horaire_exploitation" id="Nom_ar" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 p-0 ">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.Nbrdeffectif"/></label>
                                                    <input type="number" class="form-control" name="formation" id="formation" value="${notif.formation}" onkeyup="setMinValue('formation',this.value)">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row justify-content-center mb-4">
                                            <div class="col-md-4 col-sm-6">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="prec2"
                                                        onclick="openCity2('#btn2', '2')"
                                                        class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                                </button>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Enregistrer"
                                                        onclick="updateGeneral('formimportateur','installation','4',${id},'id_installation','non')"
                                                        class="btn btn-info btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                                    </div>
                                </c:if>

                                <!-- tab3 -->
                                <c:if test="${notif.statut.id_statut_projet!=87}">
                                    <div class="row pb-2">
                                        <div id="4" class="tabcontent col-12">

                                        <h4 class="titre_abs "
                                            style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <spring:message code="label.mespieces"/></h4>
                                    <p style="font-size: 11px; ${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >
                                        <%--                            cette modification demande par Mr mhamdi le 25/06--%>
                                        <img src="/assets/images/warning.png" style="width: 40px;margin-left: 10px">
                                        <spring:message code="label.Vouspouvezimporterdesdocumentsscannesen"/>
                                    </p>
                                        <c:forEach items="${doc}" var="dc">
                                            <div class="row justify-content-center">
                                                    <div class="col-md-6 col-sm-12 ">
                                                        <div class="form-group"
                                                             style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <div>
                                                                <c:if test="${dc.id_docImport!=1581}">
                                                                <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                                    <div class="upload">
                                                                        <input required
                                                                               onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','IT','id_installation','file-chosen_${dc.id_docImport}')"
                                                                               accept=".pdf" type="file"
                                                                               id="doc${dc.id_docImport }" class="actual-btn" hidden>
                                                                        <label class="uploadButton" for="doc${dc.id_docImport }">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>

                                                                        <!-- name of file chosen -->
                                                                        <span class="fileName" id="file-chosen_${dc.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <c:if test="${not empty docNotify}">
                                                <c:if test="${dc.id_docImport!=1581}">
                                                    <div class="col-2">
                                                        <c:forEach items="${docNotify}" var="d">
                                                            <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                                <a href="/downloadFile/${fn:replace(d.url,"/assets/myFile/","")}"
                                                                   class="btn btn-success rounded file_existe"><span
                                                                        class="fa fa-download"></span></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                            <div class="row justify-content-center mb-5">
                                                <div class="col-md-4 col-sm-6 mt-sm-1">
                                                    <button  type="button" id="prec2"
                                                             onclick="openCity2('#btn3', '3')"
                                                             class="btn btn-info btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </div>
                                                <div class="col-md-6 col-sm-6 mt-sm-1">
                                                    <a class="btn btn-success btn-block "
                                                       onclick="verif_champs_it('4','IT','id_installation','5')"><spring:message code="label.Afficherlerecapitulatif"/></a>
                                                </div>
                                        </div>
                                    </div>
                                    </div>
                                </c:if>

                                <c:if test="${notif.statut.id_statut_projet!=87}">
                                     <div class="row pb-2">
                                        <div id="5" class="tabcontent col-12" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

                                    <h4 class="titre_abs "><spring:message code="label.Recapitulation"/></h4>
                                    <div id="recap_install"></div>
                                    <div class="row justify-content-center mt-2 mb-4">
                                        <div class="col-md-4 col-sm-6 mt-1">
                                            <button type="button"
                                                    onclick="openCity2('btn4','4')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-md-4 col-sm-6 mt-1">

                                            <button type="button" id="EnregistrerInstallation" disabled
                                                    onclick="verif_recap_it('5','IT','id_installation')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                                     </div>
                                </c:if>
                            </div>
                            <!-- TAB 3 FINs -->
                         </div>
            </section>
        </div>


    </div>
</div>

<div class="modal fade" id="modalRecap" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="recapLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="recapLabel"><spring:message code="label.Recap"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="recap_tab">
                <%--Remplissage dynamique--%>
            </div>
            <div class="modal-footer">
                <input type="hidden" value="/api/generate_pdf_installation/"
                                             id="url_file_pdf">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message
                        code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>

    function updateRegionCT(value) {
        event.preventDefault();
        // $('#loader_modal').modal('show');
        if(value!==0){
            $.ajax({
                url: '/api/UpdateRegionCT',
                type: 'post',
                data: {
                    "regionId": value
                },
            })
                .done(function (response) {
                    $('#loader_modal').modal('hide');
                    $("#prefecture_id").empty();
                    $("#prefecture_id").html(response);
                    $("#prefecture_id").trigger("change");
                })
                .fail(function () {
                    alert("error");
                })
                .always(function () {
                    console.log("complete");
                });
        }

    }

    function updatePrefectureCT(value) {
        if(event!=null)
            event.preventDefault();

        if(value!="0"){
            $.ajax({
                url: '/api/UpdatePrefectureCT',
                type: 'post',
                data: {
                    "id": $("#id_collecte").val(),
                    "prefectureId": value
                },
            })
                .done(function (response) {
                    console.log(response);
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });
        }
    }

    var xx = 0;
    function changerEtat_IT() {

        var doc = $(".mydoc")[0].files.length;
        if(doc===0){
            swal("<spring:message code="label.Avertissement"/> ! ", "<spring:message code="label.Lefichierestobligatoire"/>", 'error');
            return false;
        }
        var id_ins = $("#id_installation").val ();

        $.ajax ({
            type: "GET",
            url: "/api/ChangerTypeIT/" + id_ins,
            contentType: 'application/json; charset=utf-8',
            data: {},
            success: function (response) {
               window.location.href="/api/ListInstallation";
            },
            error: function (response) {
            }
        });


    }

    function searchByRecap(type) {

        $.ajax({
            url: "/api/checkUserHasRecap/"+type,
            type: "GET",
            data: {},
            success: function (response) {
                $("#recap_install").html(response);
                document.getElementById("EnregistrerInstallation").disabled=false;
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }

    function addCodeIT_tmp(id_code, type) {
        event.preventDefault();

        var id_ins = $("#id_installation").val();
        var cpt = $("#cpt").val();
        var typeIT = $("#typeIT").val();
        var rowCount = $("#tbody_it tr").length;
        console.log(cpt);
        console.log(xx);

        if (id_ins == "") {
            return false;
        }
        $.ajax({
            url: '/api/deleteCodeTmp_inst/' + id_ins + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data){
                if(typeIT ==="2"){
                    $("#my_rows").html(data);
                }
                else{
                    $("#myBtn"+id_code).html('<button class="btn btn-info rounded-circle" disabled style="cursor: not-allowed" onclick="addCodeIT_tmp(\'' + id_code + '\',\'delete\')"> <span class="fa fa-check"></span></button>')
                    xx++;
                }

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {

                if(rowCount === 1 && typeIT === "2"){
                    $("#MyBtn").removeAttr("disabled");
                    $("#Btn4").removeAttr("disabled");
                }
                if(xx === rowCount  && typeIT !== "2"){
                    $("#MyBtn").removeAttr("disabled");
                    $("#Btn4").removeAttr("disabled");
                }
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete" && typeIT =="1") {
                    $("#tr-"+id_code).hide();
                }
                console.log("complete");
            });

    }

    /*function ChangerEtat() {

        var id_ins = $ ("#id_installation").val ();

            $.ajax ({
                type: "POST",
                url: "/api/ChangerEtat/" + id_ins + "/" + categories,
                contentType: 'application/json; charset=utf-8',
                data: {},
                success: function (response) {
                    window.location.href = "/api/getListeInstallation/0/6/0";
                },
                error: function (response) {
                }
            });
    }*/
    function my_function(val,id_installation){

        var id_ins = $("#id_installation").val();

            $.ajax({
                url: '/api/deleteAllByCode/' + id_ins,
                type: 'GET',
                data: {},
            })
                .done(function (data) {
                    $("#monT").html(data);
                    if(val==='3'){
                        $("#msg").show()
                        $(".listCode").hide()
                    }
                    else{
                        var table1 = $(".MonTable").dataTable();
                        var checkbox = table1.$("input[type=checkbox]");
                        $(checkbox).removeAttr("disabled");
                        $(checkbox).prop("checked", false);
                        $("#msg").hide()
                        $(".listCode").show();
                    }

                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });
    }
    function addCodeIT(id_installation, id_code, type) {
        event.preventDefault();
        var id_ins = $("#" + id_installation).val();
        if (id_ins == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcodeInstall/' + id_ins + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                $("#monT").html(data);
                if(type==="delete"){
                    $("#id-" + id_code).removeAttr("disabled");
                    $("#id-" + id_code).removeAttr("checked");
                }


            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    var table1 = $("#DataTables_Table_0").dataTable();
                    var checkbox = table1.$("input[type=checkbox]#id-" + id_code);
                    $(checkbox).removeAttr("disabled");
                    $(checkbox).prop("checked", false);
                }
                console.log("complete");
            });

    }
    function fun_affiche_modal_recap() {
        event.preventDefault();
        Swal.close();
        var id = $("#id_installation").val();
        if ($.trim(id) == "") {
            swal("<spring:message code="label.champsObligatoire"/> ", "<spring:message code="label.mercidenristrerlademande"/> ", "warning");
            return false;
        }

        $.ajax({
            url: '/api/getCollectById1/' + id + "/IT",
            type: 'POST',
            dataType: 'html',
            data: {},
        })
            .done(function (response) {
                console.log(response);
                if (response == "" || $.trim(response) == "aucun resultat") {
                    swal("<spring:message code="label.Aucunresultat"/> ", "<spring:message code="label.Mercidesaisirunnumerovalide"/> ", "info");
                    return false;
                } else {
                    $("#recap_tab ").html("");
                    $("#recap_tab").html(response);
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#modalRecap").modal("toggle");
                }


            })
            .fail(function () {
                alert("erreur")
            })
            .always(function () {
                console.log("complete");
            });
    }
    function getInstallRenouveller(val) {
        event.preventDefault();
        var num = $(val).val();
        $.ajax({
            url: '/api/getOneInstall',
            type: 'post',
            data: {"id": $(val).val()},
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addInstallation/" + response + "/R";
                } else {
                    swal("<spring:message code="label.Aucunresultat"/>", "<spring:message code="label.Aucunresultatnecorresponevoscriteresderecherche"/>", "error");
                }
                console.log(response);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();

    function getOptionByFilter(val, table, select_id) {
        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" value=""><spring:message code="option.Choisir"/></option>');
            $.each(data, function (i, v) {
                $("#" + select_id).prepend(new Option(v[1], v[0]));
            })
        })
        ;
    }
    function verif_champs_it(id_form, type, id_name, tap) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0) {
                $(input).parent().addClass("bg_error");
                test = true;
            }else{
                $(input).parent().removeClass("bg_error");
            }
        });

        if (test) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Unouplusieurchampssontvides"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>",
                html: false
            });
        } else {
            searchByRecap(type);
            $(".my_tab"+tap).removeAttr("disabled");
            openCity2('Btn'+tap,tap);
        }
    }
    function verif_recap_it(id_form, type, id_name) {
        if(event!=null)
            event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        changer_statut_install('id_installation',14);

    }
    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByRecap(type);
        openCity2('Btn'+tap,tap);

    }
    function changer_statut_install(id_name,id_statut){

        var id_install = $("#"+id_name).val();
        var type="IT";
        Swal.fire({
            title: '<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `<spring:message code="button.Enregistrer"/>`,
            denyButtonText: `<spring:message code="label.Annuler"/>`,
        }).then((result) => {
            //down_load_recu();
            if (result.value) {
                down_load_recu();
                $.ajax({
                    url: '/api/changerStatus',
                    type: 'POST',
                    data: {"id_notif":parseInt(id_install),"id_statut":parseInt(id_statut),"type":type},
                    success: function (response) {
                        window.location="/api/ListInstallation";
                    },
                })
            }else{
                window.location="/api/ListInstallation";
            }
        })
    }
// EDH 18/04/2021
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_installation").val();
        var link = url + id;
        window.location = link;
    }

    function  goToRecap(){
        window.location.href="/api/checkUserHasCollecte/IT";
    }
// fin de modification
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
     $("form[name='formnotif']").validate({

            // Specify validation rules
            rules: {
                email: {
                    required: true,
                },
                raison: {
                    required: true
                },
                tel : {
                    required: true,
                },
                fax : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },



            },


            // Specify validation error messages
            messages: {
                raison: "<spring:message code="label.Silvousplaitremplirlenomdelasociete"/>",
                email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });

    });

    function updateGeneral_installation(from,table,tap,id_notif,nameId,returns) {
        var se = $("#"+from).serializeObject();

        var type=$("input[name='type']:checked").val();
        // var se = $("#formnotif").serialize();
        if(id_notif==0){
            id_notif=$('#'+nameId).val();
        }
        if(from=="formimportateur1") {
            var $isChecked = $ ('#monT tr').length;
            var type=$("input[name='type']:checked").val();
            var uniteId=$("#id_unite").val();

            if (uniteId==="") {
                swal ("<spring:message code="label.champsObligatoire"/>", "<spring:message code="label.Selectionneruneunite"/>", "error");
                return false;
            }

            if ($isChecked == 1 && type!="3") {
                swal ("<spring:message code="label.champsObligatoire"/>", "<spring:message code="label.vousselectionnezaumoinuncodededechet"/>", "error");
                return false;
            }
        }
        $.ajax({
            type: "POST",
            url: "/api/updateInstal/"+table+"/"+ id_notif+"/"+ nameId,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(se),
            success: function (response) {
                $("#"+nameId).val(response);
                if(returns=="non"){
                    $(".my_tab"+tap).removeAttr("disabled");
                    openCity1('Btn'+tap,tap)
                }
                else{

                    window.location=returns;
                }

            },
            error: function (response) {

            }
        });
    }
    function updateGeneral(from,table,tap,id_notif,nameId,returns) {

        var se = $("#"+from).serializeObject();
        // var se = $("#formnotif").serialize();
        if(id_notif==0){
            id_notif=$('#'+nameId).val();
        }
        if(from=="formimportateur") {
            var formation = $ ('#formation').val();
            var nbrHoraire = $ ('#Nom_ar').val();
            var nbrEqupe = $ ('#Nom_fr').val();

            if (formation==="" || nbrEqupe==="" || nbrHoraire==="") {
                swal ("<spring:message code="label.champsObligatoire"/>", "<spring:message code="label.Tousleschampsobligatoire"/>", "error");
                return false;
            }
            if (parseInt(nbrEqupe) >= parseInt(formation)) {
                swal ("<spring:message code="label.Verifier"/>", "<spring:message code="label.Nombredeffectifdoittresuprieurnombredquipes"/> ", "error");
                return false;
            }
        }
        if ($("form[name='"+from+"']").valid()) {
            $.ajax ({
                type: "POST",
                url: "/api/updateInstal/" + table + "/" + id_notif + "/" + nameId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify (se),
                success: function (response) {
                    $ ("#" + nameId).val (response);
                    if (returns == "non") {
                        $ (".my_tab" + tap).removeAttr ("disabled");
                        openCity1 ('Btn' + tap, tap)
                    } else {

                        window.location = returns;
                    }

                },
                error: function (response) {

                }
            });
        }
        else {
            return  false;
        }
    }
</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
