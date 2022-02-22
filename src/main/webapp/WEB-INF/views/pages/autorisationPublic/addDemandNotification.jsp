<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>

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
    .card-body{
    ${pageContext.response.locale!='ar'?'border-left: 8px solid #5d6974;':'border-right: 8px solid #5d6974;'}
    }
    .file_existe {
        position: absolute;
        bottom: 16%;
    }

    .tabcontent col-12 {
        float: left;
        padding: 0px 20px;
        width: 79%;
    }

    .tab {
    / / float: left;
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

    .tab button.active {
        background-color: red;
    }

    .tabsu {
        padding-left: 50px;
        background-color: #5d6974 !important;
    }


    * {
        box-sizing: border-box
    }

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
        top: 214px;
        direction: ltr !important;
    }

    @media (max-width: 768px) {
        .breadcrumb-item a{
            font-size: 7pt !important;
        }
        .mydrop{
        ${pageContext.response.locale=='ar'?'left:23px !important;':'right:25px !important'};
            top: 214px;
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
<div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="main-panel" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

        <%--<a href="/api/ListeAutorisation/${type }/n" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.numero"/></a>


        &lt;%&ndash;<a href="/api/addNumNotification" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>&ndash;%&gt;
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr" style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.Depot"/> </a>
    --%>
        <c:choose>
            <c:when test="${type=='ZF'}">
                <spring:message code="label.Importationdechetszonefranche" var="p_page"/>
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


        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"
             style="width: 100%!important;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/${type}">${p_page}</a></li>
                <div class="mydrop">
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/assets/images/question.png" width="30" class="img-fluid img-circle">
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
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Exportation%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Transit%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </ol>
        </nav>
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


        <%-- <a href="/api/ListeAutorisation/${type }/n" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;color:white"><spring:message code="label.numero"/></a>


            <a href="/api/addNumNotification" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>
            <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr" style="background-color: #336c4e;margin-bottom:12px;color:white;color:white"><spring:message code="label.Depot"/> </a>

         <hr> --%>

        <section class="services-section" style="background-color: white;margin-top: 2%">
            <div class="p-0 grid-margin stretch-card cardstatistic" id="pagereload" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 mb-sm-3 ${pageContext.response.locale=='ar'?'pl-3 pr-3':''}">
                        <c:if test="${type.equals('ZF')}">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} onclick="openCity(this, '0')" id="defaultOpen"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.Numerodenotification"/>
                            </button>
                        </c:if>
                        <c:if test="${type.equals('XD')}">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} onclick="openCity(this, '01')" id="defaultOpen"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.Numerodenotification"/>
                            </button>
                        </c:if>
                        <c:if test="${type.equals('ET') || type.equals('TR') }">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} onclick="openCity(this, '1')" id="defaultOpen"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.ExportateurNotifiant"/>
                            </button>
                        </c:if>
                        <c:if test="${type.equals('XD')}">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} onclick="openCity(this, '66')" id="Btn66"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.ExportateurNotifiant"/>
                            </button>
                        </c:if>
                        <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab}  id="Btn2"
                                onclick="openCity(this, '2')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <c:if test="${!type.equals('ZF')}"><spring:message code="label.ImportateurDestinataire"/> </c:if>
                            <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/> </c:if>
                        </button>
                        <c:if test="${type.equals('XD')}">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab}  id="Btn12"
                                    onclick="openCity(this, '12')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.Autoritedimportation"/>
                            </button>
                        </c:if>
                        <c:if test="${type.equals('TR')}">
                            <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab}  id="Btn12"
                                    onclick="openCity(this, '12')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.Autoritedetransit"/>
                            </button>
                        </c:if>
                        <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab} id="Btn3"
                                onclick="openCity(this, '3')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <spring:message code="label.Documentdenotification"/>
                        </button>
                        <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                            <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn4"
                                    onclick="openCity(this, '4')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.TransporteurNational"/>
                            </button>
                        </c:if>
                        <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET'))}">
                            <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn5"
                                    onclick="openCity(this, '5')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.TransporteurNational"/>
                            </button>
                        </c:if>
                        <c:if test="${(type.equals('ET')|| type.equals( 'XD' ) || type.equals( 'TR'))}">
                            <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn55"
                                    onclick="openCity(this, '55')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.TransporteurInternational"/>
                            </button>
                        </c:if>
                        <c:if test="${!type.equals('ZF')}">
                            <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn56"
                                    onclick="openCity(this, '56')"
                                    style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <spring:message code="label.iteniraire"/>
                            </button>
                        </c:if>
                        <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn6"
                                onclick="openCity(this, '6')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <c:if test="${type.equals('XD')}"><spring:message code="label.producteursdesdechets"/> </c:if>
                            <c:if test="${type.equals('ET')}"><spring:message code="label.producteursdedechet"/> </c:if>
                                <c:if test="${!type.equals('XD') && !type.equals('ET')}"><spring:message code="label.producteur"/></c:if>
                        </button>
                        <button class="tablinks btn-primary btn tabsu my_tab pl-auto" ${disabledBtnTab} id="Btn7"
                                onclick="openCity(this, '7')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'} white-space: normal;">
                            <%--<spring:message code="label.installationdelimination"/>--%>
                            <spring:message code="label.Installationdevalorisationelimination"/>
                        </button>
                        <%--<button style="white-space: normal;" class="tablinks btn-primary btn my_tab" ${disabledBtnTab}
                                id="Btn8" onclick="openCity(this, '8')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            4. <spring:message code="label.Documentdemouvementsdesdechets"/>
                        </button>--%>
                        <button class="tablinks btn-primary btn my_tab" ${disabledBtnTab}  id="Btn9"
                                onclick="openCity(this, '9')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <spring:message code="label.mespieces"/>
                        </button>
                        <button class="tablinks btn-primary btn my_tab montab" ${disabledBtnTab} disabled id="Btn10"
                                onclick="verif_champs_recap('9','${type}','id_notification','10')"
                                style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <spring:message code="label.Recapitulation"/>
                        </button>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 mt-2">
                        <div class="row ">
                            <div id="0" class="tabcontent col-12 pr-2">
                                <c:if test="${type.equals('ZF')}">
                                    <h4 class="titre_abs "><spring:message code="label.Numerodenotification"/></h4>
                                    <div class="row m-0 p-0 mt-5">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Numerodenotification"/></label>
                                                <input class="form-control" value="${notification.num_notification}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Classificationdesdechets"/> </label>
                                                <c:if test="${type.equals('ZF') || type.equals('XD') || type.equals('TR') }">
                                                    <select ${dd} name="classification_id" id="Classification" disabled
                                                            onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                            class="form-control select2" data-width="100%">
                                                        <option value=""><spring:message code="option.Choisir"/></option>
                                                        <c:forEach items="${classification}" var="t">
                                                            <option  <c:if
                                                                    test="${notification.classification.id_classification== t[0]}"> selected </c:if>
                                                                    value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${type.equals('ET') }">
                                                    <select ${dd} name="classification_id" id="Classification"
                                                        ${(not empty notification && notification.statut.id_statut_projet!=48)?'disabled':''}
                                                            onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                            class="form-control select2" data-width="100%">
                                                        <option value="" selected><spring:message code="option.Choisir"/></option>
                                                        <option ${not empty notification?'selected':''} value="2"><spring:message
                                                                code="label.nondangereux"/></option>

                                                    </select>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">

                                                <label><spring:message code="label.code"/></label>
                                                <select ${dd} name="code_id" id="code" disabled
                                                        onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                        class="form-control select2" data-width="100%">
                                                    <c:if test="${notification!= null}">
                                                        <option value="${notification.code.id_code}">${notification.code.nom_fr}</option>
                                                    </c:if>
                                                    <option value=""><spring:message code="option.Choisir"/></option>

                                                </select>
                                            </div>
                                        </div>



                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.typededechet"/></label>
                                                <select ${dd} id="id_type" class="form-control select2" data-width="100%" disabled>
                                                    <c:if test="${notification!= null}">
                                                        <option value="">${notification.code.nom_ar}</option>
                                                    </c:if>
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                </select>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.quantitetotaleprevu"/></label>
                                                <input type="text"
                                                       oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                       name="quantite" id="quantite" onchange="changer_quantite(this)"
                                                       value="${notification.quantite}" disabled
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.unite"/></label>
                                                <select ${dd} name="unite_id" id="unite" class="form-control select2"
                                                              onchange="changer_unite(this)"
                                                              data-width="100%" disabled>
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${unite_id}" var="t">
                                                        <option  <c:if
                                                                test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>


                                        <%--<div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <c:if test="${type.equals('ET')}">
                                                    <label><spring:message code="label.producteursdedechet"/> </label>
                                                </c:if>
                                                <c:if test="${!type.equals('ET')}">
                                                    <label><spring:message code="label.producteur"/> </label>
                                                </c:if>
                                                <input type="text" name="producteur_text" class="form-control"
                                                       value="${notification.producteur_text}"  disabled>
                                            </div>
                                        </div>--%>


                                    </div>
                                    <div class="row m-0 p-0 mt-2">

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>${pageContext.response.locale!='ar'?champ_zf_et:champ_zf_et_ar } </label>
                                                <select ${dd} name="${champ_zf_et=='Zone franche'?'idzonne_franche':'id_pays'}"
                                                              id="Zone_Franche"
                                                              class="form-control select2" disabled
                                                              onchange="changer_zoneFranche(this)"
                                                              data-width="100%">
                                                    <c:if test="${type.equals('TR') || type.equals('ET') }">
                                                        <option value=""><spring:message code="option.Choisir"/></option>
                                                    </c:if>

                                                    <c:forEach items="${zonnefranche}" var="t">
                                                        <option
                                                                <c:if test="${champ_zf_et=='Zone franche'}">
                                                                    <c:if
                                                                            test="${notification.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                                </c:if>
                                                                <c:if test="${champ_zf_et!='Zone franche'}">
                                                                    <c:if
                                                                            test="${notification.pays.paysId== t[0]}"> selected </c:if>
                                                                </c:if>
                                                                value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:if test="${type.equals('ZF')}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                                        onclick="change()"
                                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                        </div>

                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="row ">
                            <div id="01" class="tabcontent col-12 pr-2">
                                <c:if test="${type.equals('XD') }">
                                    <h4 class="titre_abs "><spring:message code="label.Numerodenotification"/></h4>
                                    <div class="row m-0 p-0 mt-5">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Numerodenotification"/></label>
                                                <input class="form-control" value="${notification.num_notification}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Classificationdesdechets"/> </label>
                                                <c:if test="${type.equals('ZF') || type.equals('XD') || type.equals('TR') }">
                                                    <select ${dd} name="classification_id" id="Classification" disabled
                                                            onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                            class="form-control select2" data-width="100%">
                                                        <option value=""><spring:message code="option.Choisir"/></option>
                                                        <c:forEach items="${classification}" var="t">
                                                            <option  <c:if
                                                                    test="${notification.classification.id_classification== t[0]}"> selected </c:if>
                                                                    value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${type.equals('ET') }">
                                                    <select ${dd} name="classification_id" id="Classification"
                                                        ${(not empty notification && notification.statut.id_statut_projet!=48)?'disabled':''}
                                                            onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                            class="form-control select2" data-width="100%">
                                                        <option value="" selected><spring:message code="option.Choisir"/></option>
                                                        <option ${not empty notification?'selected':''} value="2"><spring:message
                                                                code="label.nondangereux"/></option>

                                                    </select>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">

                                                <label><spring:message code="label.code"/></label>
                                                <select ${dd} name="code_id" id="code" disabled
                                                        onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                        class="form-control select2" data-width="100%">
                                                    <c:if test="${notification!= null}">
                                                        <option value="${notification.code.id_code}">${notification.code.nom_fr}</option>
                                                    </c:if>
                                                    <option value=""><spring:message code="option.Choisir"/></option>

                                                </select>
                                            </div>
                                        </div>



                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.typededechet"/></label>
                                                <select ${dd} id="id_type" class="form-control select2" data-width="100%" disabled>
                                                    <c:if test="${notification!= null}">
                                                        <option value="">${notification.code.nom_ar}</option>
                                                    </c:if>
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                </select>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row m-0 p-0 mt-2">

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.quantitetotaleprevu"/></label>
                                                <input type="text"
                                                       oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                       name="quantite" id="quantite" onchange="changer_quantite(this)"
                                                       value="${notification.quantite}"   disabled
                                                       class="form-control">
                                            </div>
                                        </div>

                                        <%--<div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <c:if test="${type.equals('ET')}">
                                                    <label><spring:message code="label.producteursdedechet"/> </label>
                                                </c:if>
                                                <c:if test="${!type.equals('ET')}">
                                                    <label><spring:message code="label.producteur"/> </label>
                                                </c:if>
                                                <input type="text" name="producteur_text" class="form-control"
                                                       value="${notification.producteur_text}"  disabled>
                                            </div>
                                        </div>--%>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.unite"/></label>
                                                <select ${dd} name="unite_id" id="unite" class="form-control select2"
                                                              onchange="changer_unite(this)"
                                                              data-width="100%" disabled>
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${unite_id}" var="t">
                                                        <option  <c:if
                                                                test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>${pageContext.response.locale!='ar'?champ_zf_et:champ_zf_et_ar } </label>
                                                <select ${dd} name="${champ_zf_et=='Zone franche'?'idzonne_franche':'id_pays'}"
                                                              id="Zone_Franche"
                                                              class="form-control select2" disabled
                                                              onchange="changer_zoneFranche(this)"
                                                              data-width="100%">
                                                    <c:if test="${type.equals('TR') || type.equals('ET') }">
                                                        <option value=""><spring:message code="option.Choisir"/></option>
                                                    </c:if>

                                                    <c:forEach items="${zonnefranche}" var="t">
                                                        <option
                                                                <c:if test="${champ_zf_et=='Zone franche'}">
                                                                    <c:if
                                                                            test="${notification.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                                </c:if>
                                                                <c:if test="${champ_zf_et!='Zone franche'}">
                                                                    <c:if
                                                                            test="${notification.pays.paysId== t[0]}"> selected </c:if>
                                                                </c:if>
                                                                value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:if test="${type.equals('XD')}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                                        onclick="changeStatutNum('Btn66','66')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                        </div>

                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="row ">
                            <div id="1" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.ExportateurNotifiant"/></h4>
                                <c:if test="${type!='XD'}">
                                    <form id="formnotif" name="formnotif">

                                        <input type="hidden" value="${type}" name="zf_et">
                                        <input type="hidden" name="compte_id" value="${user.compteId}">
                                        <c:choose>
                                            <c:when test="${id>0}">
                                                <input type="hidden" name="id_notif_original" value="${notification.id_notif_original}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="id_notif_original" value="0">
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${id>0 && notification.statut.id_statut_projet != 29}">
                                                <input type="hidden" name="id_statut" value="${notification.statut.id_statut_projet}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="id_statut" value="48">
                                            </c:otherwise>
                                        </c:choose>



                                        <div class="row m-0 p-0 mt-5">
                                            <c:if test="${!type.equals('ZF')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.NomdelexportateurNotifiant"/></label>
                                                        <input class="form-control" type="text" name="nom" value="${notification.nom}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Telecopie"/></label>
                                                        <input class="form-control" type="text" name="telecopie" value="${notification.telecopie}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.personneacontacter"/></label>
                                                        <input class="form-control" type="text" name="personne" value="${notification.personne}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Tel"/></label>
                                                        <input class="form-control" type="tel" name="tel" value="${notification.tel}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.courrierelectronique"/></label>
                                                        <input class="form-control" type="email" name="courrier" value="${notification.courrier}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.AdresseُET"/></label>
                                                        <textarea class="form-control" type="text" name="adresse">${notification.adresse}</textarea>
                                                    </div>
                                                </div>
                                                <hr class="w-100">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                                        <input class="form-control" type="text" name="code_nationalxd" value="${notification.codeNationalXD}">
                                                    </div>
                                                </div>
                                                <c:if test="${!type.equals('ET')}">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                                            <input class="form-control" type="text" name="code_national_im" value="${notification.codeNationalIm}">
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                                        <input class="form-control" type="text" name="codece" value="${notification.codeCE}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <c:choose>
                                                            <c:when test="${type.equals('XD')}">
                                                                <label><spring:message code="label.Etatdexportationdexpedition"/></label>
                                                            </c:when>
                                                            <c:when test="${type.equals('TR')}">
                                                                <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${type.equals('XD')}">
                                                            <input class="form-control" type="text" name="etat" value="maroc" required>
                                                        </c:if>
                                                        <c:if test="${!type.equals('XD')}">
                                                            <input class="form-control" type="text" name="etat" value="${notification.etat}" required>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Numerodenotification"/></label>
                                                    <c:choose>
                                                        <c:when test="${typeRenouv=='N'}">
                                                            <input class="form-control" name="num_notification" id="num_notifications"
                                                                   value="${notification.num_notification}" ${(type=="XD" || type=="ZF")?"disabled":""}
                                                                   onchange="checkNumNotif('${type }')" ${disabled}>
                                                        </c:when>
                                                        <c:when test="${typeRenouv=='R'}">
                                                            <input class="form-control" name="num_notification" id="num_notifications"
                                                                   value="${notification.num_notification}"
                                                                   onchange="checkNumNotifRenouv('${type }',this)" ${disabled}>
                                                        </c:when>
                                                    </c:choose>

                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Classificationdesdechets"/> </label>
                                                    <c:if test="${type.equals('ZF') || type.equals('XD') || type.equals('TR') }">
                                                        <select ${dd} name="classification_id" id="Classification" ${disabled}
                                                                onchange="getOptionByFilter1(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                                class="form-control select2" data-width="100%">
                                                            <option value="0"><spring:message code="option.Choisir"/></option>
                                                            <c:forEach items="${classification}" var="t">
                                                                <option  <c:if
                                                                        test="${notification.classification.id_classification== t[0]}"> selected </c:if>
                                                                        value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${type.equals('ET') }">
                                                        <select ${dd} name="classification_id" id="Classification"
                                                            ${(not empty notification && notification.statut.id_statut_projet!=48)?'disabled':''}
                                                                onchange="getOptionByFilter1(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                                class="form-control select2" data-width="100%">
                                                            <option value="0" selected><spring:message code="option.Choisir"/></option>
                                                            <option ${not empty notification?'selected':''} value="2"><spring:message
                                                                    code="label.nondangereux"/></option>

                                                        </select>
                                                    </c:if>
                                                </div>

                                            </div>


                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">

                                                    <label><spring:message code="label.Operation"/></label>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                    <div class="form-check">

                                                                        <input checked class="form-check-input" type="radio" ${disabled}
                                                                               id="valorisationRadio" style="margin-top: -1px"
                                                                        <c:if test="${notification.operation== 'valorisation'}">
                                                                               checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'valorisation':'تقييم'}">

                                                                        <label class="form-check-label"
                                                                               style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                            <spring:message code="label.valorisation"/>
                                                                        </label>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" ${disabled}
                                                                               id="traitementRadio" style="margin-top: -1px"
                                                                        <c:if test="${notification.operation== 'traitement'}">
                                                                               checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'traitement':'علاج'}">

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
                                        <div class="row m-0 p-0 mt-2">


                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">

                                                    <label><spring:message code="label.code"/></label>
                                                    <select ${dd} name="code_id" id="code" ${disabled}
                                                            onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                            class="form-control select2" data-width="100%">
                                                        <c:if test="${notification!= null}">
                                                            <option value="${notification.code.id_code}">${notification.code.nom_fr}</option>
                                                        </c:if>
                                                        <option value=""><spring:message code="option.Choisir"/></option>

                                                    </select>
                                                </div>
                                            </div>



                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.typededechet"/></label>
                                                    <select ${dd} id="id_type" class="form-control select2" data-width="100%" ${disabled}>
                                                        <c:if test="${notification!= null}">
                                                            <option value="">${notification.code.nom_ar}</option>
                                                        </c:if>
                                                        <option value="0"><spring:message code="option.Choisir"/></option>
                                                    </select>
                                                </div>

                                            </div>




                                        </div>

                                        <div class="row m-0 p-0 mt-2">
                                                <%--QUANTITE--%>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.quantitetotaleprevu"/></label>
                                                    <input type="text"
                                                           oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                           name="quantite" id="quantite" onchange="changer_quantite(this)"
                                                           value="${notification.quantite}"   ${disabled}
                                                           class="form-control">
                                                </div>
                                            </div>
                                                        <%--UNITE--%>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.unite"/></label>
                                                            <select ${dd} name="unite_id" id="unite" class="form-control select2"
                                                                          onchange="changer_unite(this)"
                                                                          data-width="100%" ${disabled}>
                                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                                <c:forEach items="${unite_id}" var="t">
                                                                    <option  <c:if
                                                                            test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                                            value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>


                                            <%--<div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <c:if test="${type.equals('ET')}">
                                                        <label><spring:message code="label.producteursdedechet"/> </label>
                                                    </c:if>
                                                    <c:if test="${!type.equals('ET')}">
                                                        <label><spring:message code="label.producteur"/> </label>
                                                    </c:if>
                                                    <input type="text" name="producteur_text" class="form-control"
                                                           value="${notification.producteur_text}"  ${disabled}>
                                                </div>
                                            </div>--%>


                                        </div>
                                        <div class="row m-0 p-0 mt-2">
                                                <%--PAYS--%>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>${pageContext.response.locale!='ar'?champ_zf_et:champ_zf_et_ar } </label>
                                                    <select ${dd} name="${champ_zf_et=='Zone franche'?'idzonne_franche':'id_pays'}"
                                                                  id="Zone_Franche"
                                                                  class="form-control select2" ${disabled}
                                                                  onchange="changer_zoneFranche(this)"
                                                                  data-width="100%">
                                                        <c:if test="${type.equals('TR') || type.equals('ET') }">
                                                            <option value=""><spring:message code="option.Choisir"/></option>
                                                        </c:if>

                                                        <c:forEach items="${zonnefranche}" var="t">
                                                            <option
                                                                    <c:if test="${champ_zf_et=='Zone franche'}">
                                                                        <c:if
                                                                                test="${notification.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                                    </c:if>
                                                                    <c:if test="${champ_zf_et!='Zone franche'}">
                                                                        <c:if
                                                                                test="${notification.pays.paysId== t[0]}"> selected </c:if>
                                                                    </c:if>
                                                                    value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="val_ou_trait" id="val_ou_trait">
                                    </form>


                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 col-sm-6">
                                            <c:if test="${id==0}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                                        onclick="addObjectGeneral('formnotif','notification','','id_notification','2')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                            <c:if test="${id>0}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                                        onclick="updateGeneral('formnotif','notification',2,'${id}','id_notification','non')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                        </div>

                                    </div>
                                </c:if>

                            </div>
                        </div>
                            <%--********************Tab2***************************--%>
                        <div class="row ">
                            <div id="2" class="tabcontent col-12 pr-2">
                                <c:if test="${type!='XD'}">
                                    <h4 class="titre_abs">
                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.ImportateurDestinataire"/></c:if>
                                        <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/> </c:if>
                                    </h4>
                                    <form id="formimportateur" name="formimportateur">
                                        <div class="row m-0 p-0 mt-5">
                                            <input type="hidden" id="id_notification" name="notification_id"
                                                   value="${notification.id_notification}">
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group">
                                                    <label> Nom de la société </label>
                                                    <input value="${notification.importateur.nom_fr}"  ${disabled} type="text" required
                                                           name="Nom_fr" id="Nom_fr" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group" style="text-align: right;">
                                                    <label dir="rtl"> إسم الشركة  </label>
                                                    <input dir="rtl" value="${notification.importateur.nom_ar}"  ${disabled} type="text"
                                                           name="Nom_ar" id="Nom_ar" class="form-control">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row m-0 p-0 ">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.personneacontacter"/> </label>
                                                    <input value="${notification.importateur.contact_fr}"  ${disabled} type="text" required
                                                           name="contact_fr" id="represent_entreprise" class="form-control">
                                                </div>
                                            </div>
                                            <c:if test="${type.equals('ZF')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.identifiantfiscal"/> </label>
                                                        <input type="text" value="${notification.importateur.idf}"  ${disabled} name="idf" required
                                                               id="num_patente" class="form-control">
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="row m-0 p-0">

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Adresse"/> </label>
                                                    <textarea  ${disabled} type="text" required
                                                           name="adresse_fr" id="adresse"
                                                              class="form-control">${notification.importateur.adresse_fr}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Telephone"/> </label>
                                                    <input value="${notification.importateur.tel}"  ${disabled} type="tel" name="tel" required
                                                           id="telephone"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${!type.equals('TR')}">
                                            <div class="row m-0 p-0">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Region"/>  <sup class="text-danger">(*)</sup> </label>
                                                        <select ${dd} name="region_id" id="region_id" class="form-control select2" data-width="100%" onchange="updateRegion(this.value)">
                                                            <option value="0"><spring:message code="option.Choisir"/></option>
                                                            <c:forEach items="${region}" var="t">
                                                                <option <c:if
                                                                        test="${notification.region.regionId== t[0]}"> selected </c:if>
                                                                        value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">

                                                        <label> <spring:message code="label.Province"/>  <sup class="text-danger">(*)</sup> </label>
                                                        <select ${dd} name="prefecture_id" id="prefecture_id" class="form-control select2" data-width="100%"   onchange="updatePrefecture(this.value)">
                                                            <option value="0"><spring:message code="option.Choisir"/></option>
                                                            <c:if test="${notification.prefecture!=null }">
                                                                <c:forEach items="${notification.region.prefecture}" var="t">
                                                                    <option <c:if
                                                                            test="${notification.prefecture.id_prefecture== t.id_prefecture}"> selected </c:if> value="${t.id_prefecture }">${pageContext.response.locale!='ar'?t.nom_fr:t.nom_ar }</option>
                                                                </c:forEach>
                                                            </c:if>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>
                                        <div class="row m-0 p-0">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>
                                                        <c:if test="${type.equals('ZF')}"><spring:message code="label.Fax"/></c:if>
                                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.Telecopie"/> </c:if>
                                                    </label>
                                                    <input value="${notification.importateur.fax}"  ${disabled} type="text" name="fax"
                                                           id="fax"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>
                                                        <c:if test="${type.equals('ZF')}"><spring:message code="label.Email"/></c:if>
                                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.courrierelectronique"/> </c:if>
                                                    </label>

                                                    <input value="${notification.importateur.mail}"  ${disabled} type="email" name="mail"
                                                           id="emailentrprs"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:if test="${type=='ET' || type=='TR'}">
                                                    <button type="button"
                                                            onclick="openCity1('defaultOpen','1')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='ZF' || type=='XD'}">
                                                    <button type="button"
                                                            onclick="openCity1('defaultOpen','0')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                            </div>
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:set var="etapexdtr" value="3" ></c:set>
                                                <c:if test="${type.equals('XD') || type.equals('TR')}" >
                                                    <c:set var="etapexdtr" value="12" ></c:set>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${type.equals('XD') ||type.equals('ZF') || (not empty notification && notification.statut.id_statut_projet!=48)}">
                                                        <button type="button"
                                                                onclick="verifier_reg_pref('Btn${etapexdtr}',${etapexdtr},'${lng}')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/>
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" id="Enregistrer"
                                                                onclick="addObject_step('formimportateur','importateurnotifiant',${etapexdtr},'id_notification')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>

                                    </form>
                                </c:if>
                                <c:if test="${type=='XD'}">
                                    <h4 class="titre_abs "> <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/></c:if>
                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.ImportateurDestinataire"/> </c:if>
                                    </h4>

                                    <form id="formnotif" name="formnotif">

                                        <input type="hidden" value="${type}" name="zf_et">
                                        <input type="hidden" name="compte_id" value="${user.compteId}">
                                        <c:choose>
                                            <c:when test="${id>0}">
                                                <input type="hidden" name="id_notif_original" value="${notification.id_notif_original}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="id_notif_original" value="0">
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${id>0 && notification.statut.id_statut_projet != 29}">
                                                <input type="hidden" name="id_statut" value="${notification.statut.id_statut_projet}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="id_statut" value="48">
                                            </c:otherwise>
                                        </c:choose>



                                        <div class="row m-0 p-0 mt-5">
                                            <c:if test="${!type.equals('ZF')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Nomdelimportateurdestinataire"/> </label>
                                                        <input class="form-control" type="text" name="nom" value="${notification.nom}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Telecopie"/></label>
                                                        <input class="form-control" type="text" name="telecopie" value="${notification.telecopie}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.personneacontacter"/></label>
                                                        <input class="form-control" type="text" name="personne" value="${notification.personne}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Tel"/></label>
                                                        <input class="form-control" type="tel" name="tel" value="${notification.tel}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.courrierelectronique"/></label>
                                                        <input class="form-control" type="email" name="courrier" value="${notification.courrier}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Adresse"/></label>
                                                        <textarea class="form-control" type="text" name="adresse" required>${notification.adresse}</textarea>
                                                    </div>
                                                </div>
                                                <hr class="w-100">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                                        <input class="form-control" type="text" name="code_nationalxd" value="${notification.code.nom_fr}">
                                                    </div>
                                                </div>
                                                <c:if test="${!type.equals('ET')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                                        <input class="form-control" type="text" name="code_national_im" value="${notification.codeNationalIm}" required>
                                                    </div>
                                                </div>
                                                </c:if>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                                        <input class="form-control" type="text" name="codece" value="${notification.codeCE}" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <c:choose>
                                                            <c:when test="${type.equals('XD')}">
                                                                <label><spring:message code="label.Etatdexportationdexpedition"/></label>
                                                            </c:when>
                                                            <c:when test="${type.equals('TR')}">
                                                                <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${type.equals('XD')}">
                                                            <input class="form-control" type="text" name="etat" value="maroc" required>
                                                        </c:if>
                                                        <c:if test="${!type.equals('XD')}">
                                                            <input class="form-control" type="text" name="etat" value="${notification.etat}" required>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <c:if test="${!type.equals('XD')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Numerodenotification"/></label>
                                                        <c:choose>
                                                            <c:when test="${typeRenouv=='N'}">
                                                                <input class="form-control" name="num_notification" id="num_notifications" required
                                                                       value="${notification.num_notification}" ${(type=="XD" || type=="ZF")?"disabled":""}
                                                                       onchange="checkNumNotif('${type }')" ${disabled}>
                                                            </c:when>
                                                            <c:when test="${typeRenouv=='R'}">
                                                                <input class="form-control" name="num_notification" id="num_notifications" required
                                                                       value="${notification.num_notification}"
                                                                       onchange="checkNumNotifRenouv('${type }',this)" ${disabled}>
                                                            </c:when>
                                                        </c:choose>

                                                    </div>

                                                    <div class="form-group">
                                                        <label><spring:message code="label.Classificationdesdechets"/> </label>
                                                        <c:if test="${type.equals('ZF') || type.equals('XD') || type.equals('TR') }">
                                                            <select ${dd} name="classification_id" id="Classification" ${disabled}
                                                                    onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                                    class="form-control select2" data-width="100%">
                                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                                <c:forEach items="${classification}" var="t">
                                                                    <option  <c:if
                                                                            test="${notification.classification.id_classification== t[0]}"> selected </c:if>
                                                                            value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${type.equals('ET') }">
                                                            <select ${dd} name="classification_id" id="Classification"
                                                                ${(not empty notification && notification.statut.id_statut_projet!=48)?'disabled':''}
                                                                    onchange="getOptionByFilter(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                                    class="form-control select2" data-width="100%">
                                                                <option value="" selected><spring:message code="option.Choisir"/></option>
                                                                <option ${not empty notification?'selected':''} value="2"><spring:message
                                                                        code="label.nondangereux"/></option>

                                                            </select>
                                                        </c:if>
                                                    </div>

                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">

                                                        <label><spring:message code="label.Operation"/></label>
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                        <div class="form-check">

                                                                            <input checked class="form-check-input" type="radio" ${disabled}
                                                                                   id="valorisationRadio" style="margin-top: -1px"
                                                                            <c:if test="${notification.operation== 'valorisation'}">
                                                                                   checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'valorisation':'تقييم'}">

                                                                            <label class="form-check-label"
                                                                                   style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                                <spring:message code="label.valorisation"/>
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="radio" ${disabled}
                                                                                   id="traitementRadio" style="margin-top: -1px"
                                                                            <c:if test="${notification.operation== 'traitement'}">
                                                                                   checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'traitement':'علاج'}">

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
                                                <div class="row m-0 p-0 mt-2">


                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">

                                                            <label><spring:message code="label.code"/></label>
                                                            <select ${dd} name="code_id" id="code" ${disabled}
                                                                    onchange="getOptionByFilter(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                                    class="form-control select2" data-width="100%">
                                                                <c:if test="${notification!= null}">
                                                                    <option value="${notification.code.id_code}">${notification.code.nom_fr}</option>
                                                                </c:if>
                                                                <option value=""><spring:message code="option.Choisir"/></option>

                                                            </select>
                                                        </div>
                                                    </div>



                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.typededechet"/></label>
                                                            <select ${dd} id="id_type" class="form-control select2" data-width="100%" ${disabled}>
                                                                <c:if test="${notification!= null}">
                                                                    <option value="0">${notification.code.nom_ar}</option>
                                                                </c:if>
                                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                            </select>
                                                        </div>

                                                    </div>




                                                </div>

                                                <div class="row m-0 p-0 mt-2">
                                                    <%--PAYS--%>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label>${champ_zf_et }: </label>
                                                            <select ${dd} name="${champ_zf_et=='Zone franche'?'idzonne_franche':'id_pays'}"
                                                                    id="Zone_Franche"
                                                                    class="form-control select2" ${disabled}
                                                                    onchange="changer_zoneFranche(this)"
                                                                    data-width="100%">
                                                                <c:if test="${type.equals('TR') || type.equals('ET') }">
                                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                                </c:if>

                                                                <c:forEach items="${zonnefranche}" var="t">
                                                                    <option
                                                                            <c:if test="${champ_zf_et=='Zone franche'}">
                                                                                <c:if
                                                                                        test="${notification.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                                            </c:if>
                                                                            <c:if test="${champ_zf_et!='Zone franche'}">
                                                                                <c:if
                                                                                        test="${notification.pays.paysId== t[0]}"> selected </c:if>
                                                                            </c:if>
                                                                            value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <%--<div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <c:if test="${type.equals('ET')}">
                                                                <label><spring:message code="label.producteursdedechet"/> </label>
                                                            </c:if>
                                                            <c:if test="${!type.equals('ET')}">
                                                                <label><spring:message code="label.producteur"/> </label>
                                                            </c:if>
                                                            <input type="text" name="producteur_text" class="form-control" required
                                                                   value="${notification.producteur_text}"  ${disabled}>
                                                        </div>
                                                    </div>--%>

                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.quantitetotaleprevu"/></label>
                                                            <input type="text"
                                                                   oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                                   name="quantite" id="quantite" required onchange="changer_quantite(this)"
                                                                   value="${notification.quantite}"   ${disabled}
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row m-0 p-0 mt-2">


                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.unite"/></label>
                                                            <select ${dd} name="unite_id" id="unite" class="form-control select2"
                                                                    onchange="changer_unite(this)"
                                                                    data-width="100%" ${disabled}>
                                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                                <c:forEach items="${unite_id}" var="t">
                                                                    <option  <c:if
                                                                            test="${notification.unite.unite_id== t[0]}"> selected </c:if>
                                                                            value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="val_ou_trait" id="val_ou_trait">
                                            </c:if>
                                        </div>


                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:if test="${type!='XD'}">
                                                    <button type="button"
                                                            onclick="openCity1('defaultOpen','1')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='XD'}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn66','66')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                            </div>
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:set var="etapexdtr" value="3" ></c:set>
                                                <c:if test="${type.equals('XD') || type.equals('TR')}" >
                                                    <c:set var="etapexdtr" value="12" ></c:set>
                                                </c:if>
                                                <c:if test="${id==0}">
                                                    <button type="button" id="Suivant"
                                                            onclick="addObjectGeneral('formnotif','notification','','id_notification','${etapexdtr}')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${id>0}">
                                                    <button type="button" id="Suivant"
                                                            onclick="updateGeneral('formnotif','notification',${etapexdtr},'${id}','id_notification','non')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:if>
                                            </div>

                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                            <%--********************Tab1***************************--%>
                        <div class="row ">
                            <div id="66" class="tabcontent col-12 pr-2">
                                <c:if test="${type.equals('XD')}">
                                    <h4 class="titre_abs "><spring:message code="label.ExportateurNotifiant"/> </h4>

                                    <form id="formimportateur" name="formimportateur">
                                        <div class="row m-0 p-0 mt-5">
                                            <input type="hidden" id="id_notification" name="notification_id"
                                                   value="${notification.id_notification}">
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.nomdesociete"/> </label>
                                                    <input value="${notification.importateur.nom_fr}" disabled type="text"
                                                           name="Nom_fr"
                                                           id="Nom_fr" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group" style="text-align: right;">
                                                    <label dir="rtl"> إسم الشركة  </label>
                                                    <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text"
                                                           name="Nom_ar"
                                                           id="Nom_ar" class="form-control">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row m-0 p-0 ">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Qualite"/> </label>
                                                    <input name="qualite"  id="qualite" value="${notification.importateur.qualite}" disabled type="text" class="form-control" >
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Genre"/> </label>
                                                    <input value="${notification.importateur.genre}" disabled type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.personneacontacter"/> </label>
                                                    <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                                                </div>
                                            </div>
                                            <c:if test="${type.equals('ZF')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.identifiantfiscal"/> </label>
                                                        <input type="text" value="${notification.importateur.idf}" disabled name="idf"
                                                               id="num_patente" class="form-control">
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="row m-0 p-0">

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Adresse"/> </label>
                                                    <textarea disabled type="text"
                                                           name="adresse_fr" id="adresse"
                                                              class="form-control">${notification.importateur.adresse_fr}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Telephone"/> </label>
                                                    <input value="${notification.importateur.tel}" disabled type="tel" name="tel"
                                                           id="telephone"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 p-0">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Region"/>  <sup class="text-danger">(*)</sup> </label>
                                                    <select ${dd} name="region_id" id="region_id" class="form-control select2" data-width="100%" onchange="updateRegion(this.value)">
                                                        <option value="0"><spring:message code="option.Choisir"/></option>
                                                        <c:forEach items="${region}" var="t">
                                                            <option <c:if
                                                                    test="${notification.region.regionId== t[0]}"> selected </c:if>
                                                                    value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">

                                                    <label> <spring:message code="label.Province"/>  <sup class="text-danger">(*)</sup> </label>
                                                    <select ${dd} name="prefecture_id" id="prefecture_id" class="form-control select2" data-width="100%"   onchange="updatePrefecture(this.value)">
                                                        <option value="0"><spring:message code="option.Choisir"/></option>
                                                        <c:if test="${notification.prefecture!=null }">
                                                            <c:forEach items="${notification.region.prefecture}" var="t">
                                                                <option <c:if
                                                                        test="${notification.prefecture.id_prefecture== t.id_prefecture}"> selected </c:if> value="${t.id_prefecture }">${pageContext.response.locale!='ar'?t.nom_fr:t.nom_ar}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row m-0 p-0">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <c:if test="${type.equals('ZF')}"><spring:message code="label.Fax"/> </c:if>
                                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.Telecopie"/> </c:if></label>
                                                    <input value="${notification.importateur.fax}" disabled type="text" name="fax"
                                                           id="fax"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <c:if test="${type.equals('ZF')}"><spring:message code="label.courrierelectronique"/> </c:if>
                                                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.email"/> </c:if></label>
                                                    <input value="${notification.importateur.mail}" disabled type="text" name="mail"
                                                           id="emailentrprs"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-2 col-sm-6">

                                                <button type="button"
                                                        onclick="openCity1('defaultOpen','01')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="button.Precedent"/>
                                                </button>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <c:choose>
                                                    <c:when test="${type.equals('XD') ||type.equals('ZF') || (not empty notification && notification.statut.id_statut_projet!=48)}">
                                                        <button type="button"
                                                                onclick="verifier_reg_pref('Btn2','2','${lng}')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/>
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" id="Enregistrer"
                                                                onclick="addObject_step('formimportateur','importateurnotifiant','2','id_notification')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                            <%--********************Tab12***************************--%>
                            <c:if test="${type.equals('TR')}">
                                <div class="row ">
                                    <div id="12" class="tabcontent col-12 pr-2">

                                    <h4 class="titre_abs "><spring:message code="label.Autoritedetransit"/> </h4>

                                    <form id="formautorite" name="formautorite">
                                        <div class="row m-0 p-0 ">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                    <p class="m-0">
                                                        <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Genre"/> </label>
                                                    </p>

                                                    <div class="card w-100 mb-0">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                    <div class="form-check">

                                                                        <input checked class="form-check-input" type="radio"
                                                                               id="maleRadio"
                                                                        <c:if test="${notification.autorite.genre_A== 'Monsieur'}">
                                                                               checked  </c:if> name="genre_A" value="Monsieur">

                                                                        <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                            <spring:message code="label.Monsieur"/>
                                                                        </label>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                               id="femaleRadio"
                                                                        <c:if test="${notification.autorite.genre_A== 'Madame'}">
                                                                               checked  </c:if> name="genre_A" value="Madame">

                                                                        <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                            <spring:message code="label.Madame"/>
                                                                        </label>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                    <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Username"/> </label>
                                                    <input type="text" value="${notification.autorite.denomination}" name="denomination" id="denomination" class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 p-0">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Qualite"/> </label>
                                                    <input value="${notification.autorite.poste}" type="text" required
                                                           name="poste"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.email"/> </label>
                                                    <input value="${notification.autorite.email}" type="email"
                                                           name="email" required
                                                           class="form-control">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row m-0 p-0">

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.telephone"/> </label>
                                                    <input value="${notification.autorite.tel}" type="tel" required
                                                           name="tel"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Fax"/> </label>
                                                    <input value="${notification.autorite.fax}" type="text" required
                                                           name="fax"
                                                           class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row m-0 p-0">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Adresse"/> </label>
                                                    <textarea type="text" required
                                                              name="adresse" class="form-control">${notification.autorite.adresse}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.pay"/> </label>
                                                    <select ${dd} id="pays1" name="pays" class="custom-select">
                                                        <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
                                                        <c:forEach items="${pays}" var="t">
                                                            <option <c:if
                                                                    test="${notification.autorite.pays.paysId== t[0]}"> selected </c:if>
                                                                    value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row p-0 m-0">
                                        <div class="col-12 p-0 m-0" id="pays_table">
                                            <div class="table-responsive">
                                                <table class="table table-bordered my_table">
                                                    <thead>
                                                    <tr>
                                                        <th><spring:message code="label.pay"/> </th>
                                                        <th><spring:message code="label.Autorite"/> </th>
                                                        <th><spring:message code="label.Autorisations"/></th>
                                                        <th style="min-width: 120px"><spring:message code="label.Action"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="trAutorite">
                                                    <c:choose>
                                                        <c:when test="${(not empty notification.paysAutorites)}">
                                                            <c:forEach items="${notification.paysAutorites}" var="p">
                                                                <tr id="trr_${p.id_paysautorite}">
                                                                    <td>${pageContext.response.locale!='ar'?p.pays.nom_fr:p.pays.nom_ar}</td>
                                                                    <td> ${p.desc_autorite}</td>
                                                                    <td><a href="/downloadFile/${fn:replace(p.url_autorite,"/assets/myFile/","")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a></td>
                                                                    <td class="">
                                                                        <button class="btn btn-danger rounded-circle" onclick="deletePaysautorite('${p.id_paysautorite}')">
                                                                            <span class="fas fa-trash-alt"></span>
                                                                        </button>

                                                                        <button class="btn btn-warning rounded-circle" onclick="getPaysautorite('${p.id_paysautorite}')">
                                                                            <span class="fas fa-pencil-alt"></span>
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="zone_form" class=" col-12 p-0 m-0">
                                                <div class="card">
                                                    <div class="card-body">
                                                <div class="row m-0 p-0">
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.pay"/>
                                                            </label>
                                                            <select ${dd} id="pays" name="pays" class="custom-select">
                                                                <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
                                                                <c:forEach items="${pays}" var="t">
                                                                    <option value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <input type="hidden" id="id_paysautorite" name="id_paysautorite" value="${autorite.id_paysautorite}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Autorite"/>
                                                            </label>
                                                            <input type="text" class="form-control" id="desc_autorite" name="desc_autorite">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="f-14">
                                                                <spring:message code="label.Autorisations"/>
                                                            </label>
                                                            <input type="file" class="form-control" id="url_autorite" name="url_autorite">
                                                        </div>
                                                    </div>
                                                </div>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-center">
                                                    <div class="col-md-4">
                                                        <button onclick="Save_paysautorite2()" class="btn btn-primary btn-block"><spring:message code="label.enregistrerEutorite"/> </button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                    onclick="openCity1('Btn2','2')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:choose>
                                                <c:when test="${notification.autorite.id_autorite == null}">
                                                    <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                            onclick="validerAutorite('formautorite','autorite','3','id_notification')"
                                                            class="btn btn-success btn-block">
                                                        <spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                            onclick="validerAutorite2('formautorite','autorite','','3',' id_autorite = '+${notification.autorite.id_autorite})"
                                                            class="btn btn-success btn-block">
                                                        <spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>


                                </div>
                                 </div>
                            </c:if>
                            <c:if test="${type.equals('XD')}">
                                <div class="row ">
                                        <div id="12" class="tabcontent col-12 pr-2">

                                            <h4 class="titre_abs "><spring:message code="label.Autoritedimportation"/> </h4>

                                            <form id="formautorite" name="formautorite">
                                                <div class="row m-0 p-0">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                            <p class="m-0">
                                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Genre"/> </label>
                                                            </p>

                                                            <div class="card w-100 mb-0">
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                            <div class="form-check">

                                                                                <input checked class="form-check-input" type="radio"
                                                                                       id="maleRadio"
                                                                                <c:if test="${notification.autorite.genre_A== 'Monsieur'}">
                                                                                       checked  </c:if> name="genre_A" value="Monsieur">

                                                                                <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                                    <spring:message code="label.Monsieur"/>
                                                                                </label>
                                                                            </div>

                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                            <div class="form-check">
                                                                                <input class="form-check-input" type="radio"
                                                                                       id="femaleRadio"
                                                                                <c:if test="${notification.autorite.genre_A== 'Madame'}">
                                                                                       checked  </c:if> name="genre_A" value="Madame">

                                                                                <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                                    <spring:message code="label.Madame"/>
                                                                                </label>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Denominationdelautorite"/> </label>
                                                            <input type="text" value="${notification.autorite.denomination}" name="denomination" id="denomination" class="form-control" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row m-0 p-0">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.email"/></label>
                                                            <input value="${notification.autorite.email}" type="email"
                                                                   name="email" id="email_autorite"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.Adresse"/></label>
                                                            <textarea type="text"
                                                                      id="adresse_autorite" name="adresse" class="form-control">${notification.autorite.adresse}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row m-0 p-0">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.telephone"/> </label>
                                                            <input value="${notification.autorite.tel}" type="tel"
                                                                   id="tel_autorite" name="tel"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.Fax"/> </label>
                                                            <input value="${notification.autorite.fax}" type="text"
                                                                  id="fax_autorite" name="fax" maxlength="10" minlength="10"
                                                                   class="form-control">
                                                        </div>
                                                    </div>


                                                </div>

                                            </form>

                                            <div class="row p-0 m-0">
                                                <div class="col-12 p-0 m-0">
                                                    <form>
                                                        <div class="row m-0 p-0">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="form-group">
                                                                    <label class="f-14">
                                                                        <spring:message code="label.PaysEtranger"/>
                                                                    </label>
                                                                    <select ${dd} disabled id="pays" name="pays" class="form-control">
                                                                        <option value="${notification.pays.paysId}">${pageContext.response.locale!='ar'?notification.pays.nom_fr:notification.pays.nom_ar}</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>

                                            <div class="row justify-content-center mt-3 mb-5">
                                                <div class="col-md-4 mt-1 col-sm-6">
                                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                            onclick="openCity1('Btn2','2')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </div>
                                                <div class="col-md-4 mt-1 col-sm-6">
                                                    <c:choose>
                                                        <c:when test="${notification.autorite.id_autorite == null}">
                                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                    onclick="addObject_step2('formautorite','autorite','3','id_notification')"
                                                                    class="btn btn-success btn-block">
                                                                <spring:message code="button.Suivant"/>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                    onclick="updateObject('formautorite','autorite','','3',' id_autorite = '+${notification.autorite.id_autorite})"
                                                                    class="btn btn-success btn-block">
                                                                <spring:message code="button.Suivant"/>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>

                                        </div>
                                </div>
                            </c:if>
                            <%--********************Tab3***************************--%>
                        <div class="row ">
                            <div id="3" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.Documentdenotification"/></h4>
                                <form id="formnotif3" name="formnotif3">

                                    <input type="hidden" id="id_obj3" value="${notification.id_notification}">
                                    <div class="row m-0 p-0 mt-5">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.quantitetotaleprevu"/> </label>
                                                <div class="input-group mb-3">
                                                    <input type="text"
                                                           oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                           class="form-control quantiteTotalPrevu" name="quantite" disabled
                                                           value="${notification.quantite}"   ${disabled}>
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon6">${notification.unite.nom_fr}</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Nombretotalexpeditionsprevues" var="ex"/>
                                                    <c:if test="${type.equals('ZF')}">${ex}</c:if>
                                                    <c:if test="${!type.equals('ZF')}"><spring:message code="label.NombreTotaldetransfertsprevus"/> </c:if>
                                                </label>
                                                <input type="text"
                                                       oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                       onchange="test(this.value)"
                                                       name="expedition" value="${notification.expedition}" required
                                                       class="form-control">
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">

                                                <label><spring:message code="label.Operation"/></label>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                <div class="form-check">

                                                                    <input checked class="form-check-input" type="radio" disabled
                                                                           style="margin-top: -1px"
                                                                    ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                                                    <c:if test="${notification.operation== 'valorisation'}">
                                                                           checked  </c:if> value="${pageContext.response.locale!='ar'?'valorisation':'تقييم'}">

                                                                    <label class="form-check-label"
                                                                           style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                        <spring:message code="label.valorisation"/>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="radio" disabled
                                                                           style="margin-top: -1px"
                                                                    ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                                                    <c:if test="${notification.operation== 'traitement'}">
                                                                           checked  </c:if> value="${pageContext.response.locale!='ar'?'traitement':'علاج'}">

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

                                            <div class="form-group">

                                                <label><spring:message code="label.notificationconcernant"/> </label>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-12 col-sm-12 border-right">

                                                                <div class="form-check">

                                                                    <input checked class="form-check-input" type="radio"
                                                                           name="uniques" style="margin-top: -1px" id="unique"

                                                                    <c:if test="${notification.uniques == 'Expédition unique'}">
                                                                           checked  </c:if> value="${pageContext.response.locale!='ar'?'Expédition unique':'شحنة واحدة'}">

                                                                    <label class="form-check-label"
                                                                           style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                        <spring:message code="label.Expeditionunique"/>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="radio" name="uniques"
                                                                           style="margin-top: -1px" id="multiple"
                                                                    <c:if test="${notification.uniques== 'Expéditions multiples'}">
                                                                           checked  </c:if> value="${pageContext.response.locale!='ar'?'Expéditions multiples':'شحنات متعددة'}">

                                                                    <label class="form-check-label"
                                                                           style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                        <spring:message code="label.Expeditionsmultiples"/>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <spring:message code="label.Periodeprevuedesexpeditions" var="tttt"/>
                                            <label>
                                                <c:if test="${type.equals('ZF')}">${tttt}</c:if>
                                                <c:if test="${!type.equals('ZF')}"><spring:message code="label.PeriodeprevuePourleTransfert"/> </c:if>
                                            </label>
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Premierdepart"/> </label>
                                                        <input type="date" name="premier" value="${notification.premier}"
                                                               id="premierdepart" required onchange="setDateFin()"
                                                               class="form-control">
                                                    </div>

                                                    <div class="form-group">
                                                        <label><spring:message code="label.Dernierdepart"/></label>
                                                        <input type="date" name="dernier" value="${notification.dernier}" required
                                                               id="dernierdepart"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>
                                                    <c:if test="${type.equals('ZF')}"><spring:message code="label.zoneFranche"/> </c:if>
                                                    <c:if test="${!type.equals('ZF')}"><spring:message code="label.PaysEtranger"/> </c:if>
                                                </label>
                                                <select ${dd} class="form-control select2 changerZonneFranche" disabled
                                                ${( (type=='ET' || type=='TR') && id==0)?"disabled":""}
                                                              data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${zonnefranche}" var="t">
                                                        <option  <c:if
                                                                test="${notification.zonneFranche.id_zonnefranche== t[0] || notification.pays.paysId==t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Nomdeladestinationfinale"/> </label>
                                                <select class="form-control" name="installationautorises" id="installationAutorise">
                                                    <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
                                                    <c:forEach items="${installation}" var="t">
                                                        <option  <c:if
                                                                test="${notification.installationAutorise.id_installation_autorise== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${t[1]}</option>
                                                    </c:forEach>
                                                </select>
                                                <%--<input type="text" name="destination_final"  required
                                                       value="${notification.destination_final}" id="destributionfinal"
                                                       class="form-control">--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Caracteristiquesphysiques"/> </label>
                                                <select ${dd} name="idcaracteristque_physique" id="caracteristiquephysique"
                                                        class="form-control select2"
                                                        data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${caracteristiquephysique}" var="t">
                                                        <option  <c:if
                                                                test="${notification.caracteristquePhysique.id_classification== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Typedeconditionnement"/></label>
                                                <select ${dd} name="idtypeconditionnement" id="conditionement"
                                                              class="form-control select2"
                                                              data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${type_conditionement}" var="t">
                                                        <option  <c:if
                                                                test="${notification.typeconditionnement.typeConditionement_id== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale!='ar'?t[1]:t[2] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12" style="display:${notification.operation== 'traitement'?'block':'none'}">
                                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                    <spring:message code="label.Operationdelimination"/> <sup class="text-danger">*</sup>
                                                </label>
                                                <select ${dd}  name="Operationdelimination" required id="Operationdelimination" class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <option value="D1	Dépôt sur ou dans le sol (par ex., mise en décharge, etc.)">D1	Dépôt sur ou dans le sol (par ex., mise en décharge, etc.)</option>
                                                    <option value="D2	Traitement en milieu terrestre (par ex., biodégradation de déchets liquides ou de boues dans les sols, etc.)">D2	Traitement en milieu terrestre (par ex., biodégradation de déchets liquides ou de boues dans les sols, etc.)</option>
                                                    <option value="D3	Injection en profondeur (par ex., injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.)">D3	Injection en profondeur (par ex., injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.)</option>
                                                    <option value="D4	Lagunage (par ex., déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.)">D4	Lagunage (par ex., déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.)</option>
                                                    <option value="D5	Mise en décharge spécialement aménagée (par ex., placement dans des alvéoles étanches séparées, recouvertes et isolées les unes des autres et de l'environnement, etc.)">D5	Mise en décharge spécialement aménagée (par ex., placement dans des alvéoles étanches séparées, recouvertes et isolées les unes des autres et de l'environnement, etc.)</option>
                                                    <option value="D6	Rejet dans le milieu aquatique excepté les mers ou océans">D6	Rejet dans le milieu aquatique excepté les mers ou océans</option>
                                                    <option value="D7	Rejet dans les mers ou océans, y compris enfouissement dans le sous-sol marin">D7	Rejet dans les mers ou océans, y compris enfouissement dans le sous-sol marin</option>
                                                    <option value="D8	Traitement biologique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l'un des procédés de cette liste">D8	Traitement biologique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l'un des procédés de cette liste</option>
                                                    <option value="D9	Traitement physico-chimique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l'un des procédés de cette liste (par ex., évaporation, séchage, calcination, etc.)">D9	Traitement physico-chimique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l'un des procédés de cette liste (par ex., évaporation, séchage, calcination, etc.)</option>
                                                    <option value="D10	Incinération à terre">D10	Incinération à terre</option>
                                                    <option value="D11	Incinération en mer">D11	Incinération en mer</option>
                                                    <option value="D12	Stockage permanent (par ex., placement de conteneurs dans une mine, etc.)">D12	Stockage permanent (par ex., placement de conteneurs dans une mine, etc.)</option>
                                                    <option value="D13	Mélange ou regroupement préalablement à l'une des opérations de cette liste">D13	Mélange ou regroupement préalablement à l'une des opérations de cette liste</option>
                                                    <option value="D14	Reconditionnement préalablement à l'une des opérations de cette liste">D14	Reconditionnement préalablement à l'une des opérations de cette liste</option>
                                                    <option value="D15	Stockage préalablement à l'une des opérations de cette liste">D15	Stockage préalablement à l'une des opérations de cette liste</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12" style="display:${notification.operation== 'valorisation'?'block':'none'}">
                                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                    <spring:message code="label.Operationdevalorisation"/> <sup class="text-danger">*</sup>
                                                </label>
                                                <select ${dd}  name="Operationdelimination" required id="Operationdevalorisation" class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <option value="R1	Utilisation comme combustible (autrement qu'en incinération directe) ou autre moyen de produire de l'énergie/utilisé principalement comme combustible ou autre moyen de produire de l’énergie">R1	Utilisation comme combustible (autrement qu'en incinération directe) ou autre moyen de produire de l'énergie/utilisé principalement comme combustible ou autre moyen de produire de l’énergie</option>
                                                    <option value="R2	Récupération ou régénération des solvants">R2	Récupération ou régénération des solvants</option>
                                                    <option value="R3   Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants">R3	Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants</option>
                                                    <option value="R4   Recyclage ou récupération des métaux ou des composés métalliques">R4	Recyclage ou récupération des métaux ou des composés métalliques</option>
                                                    <option value="R5	Recyclage ou récupération d'autres matières inorganiques">R5	Recyclage ou récupération d'autres matières inorganiques</option>
                                                    <option value="R6	Régénération des acides ou des bases">R6	Régénération des acides ou des bases</option>
                                                    <option value="R7	Récupération des produits servant à capter les polluants">R7	Récupération des produits servant à capter les polluants</option>
                                                    <option value="R8	Récupération des produits provenant des catalyseurs">R8	Récupération des produits provenant des catalyseurs</option>
                                                    <option value="R9	Régénération ou autres réemplois des huiles usées">R9	Régénération ou autres réemplois des huiles usées</option>
                                                    <option value="R10	Épandage sur le sol au profit de l'agriculture ou de l'écologie">R10	Épandage sur le sol au profit de l'agriculture ou de l'écologie</option>
                                                    <option value="R11	Utilisation de matériaux résiduels obtenus à partir de l'une des opérations numérotées de R1 à R10">R11	Utilisation de matériaux résiduels obtenus à partir de l'une des opérations numérotées de R1 à R10</option>
                                                    <option value="R12	Échange de déchets en vue de les soumettre à l'une quelconque des opérations numérotées de R1 à R1 1">R12	Échange de déchets en vue de les soumettre à l'une quelconque des opérations numérotées de R1 à R1 1</option>
                                                    <option value="R13	Stockage de matériaux en vue de les soumettre à l'une des opérations de cette liste.">R13	Stockage de matériaux en vue de les soumettre à l'une des opérations de cette liste.</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                    CODE H<sup class="text-danger">*</sup>
                                                </label>
                                                <select ${dd}  name="codeH" required id="codeH" class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <option value="Hl	 Matières explosives">Hl	Matières explosives</option>
                                                    <option value="H3	 Matières liquides inflammables ">H3	Matières liquides inflammables</option>
                                                    <option value="H4.1	 Matières solides inflammables ">H4.1	Matières solides inflammables</option>
                                                    <option value="H4.2	 Matières spontanément inflammables ">H4.2	Matières spontanément inflammables</option>
                                                    <option value="H4.3	 Matières qui, au contact de l'eau, émettent des gaz inflammables ">H4.3	Matières qui, au contact de l'eau, émettent des gaz inflammables</option>
                                                    <option value="H5.1	 Matières comburantes ">H5.1	Matières comburantes</option>
                                                    <option value="H5.2	 Peroxydes organiques ">H5.2	Peroxydes organiques</option>
                                                    <option value="H6.1	 Matières toxiques (aiguës) ">H6.1	Matières toxiques (aiguës)</option>
                                                    <option value="H6.2	 Matières infectieuses ">H6.2	Matières infectieuses</option>
                                                    <option value="H8	 Matières corrosives ">H8	Matières corrosives</option>
                                                    <option value="H10	 Matières libérant des gaz toxiques au contact de l'air ou de l'eau ">H10	Matières libérant des gaz toxiques au contact de l'air ou de l'eau</option>
                                                    <option value="H11	 Matières toxiques (effets différés ou chroniques) ">H11	Matières toxiques (effets différés ou chroniques)</option>
                                                    <option value="H12	 Matières écotoxiques ">H12	Matières écotoxiques</option>
                                                    <option value="H13	 Matières susceptibles après élimination de donner lieu, par quelque moyen que ce soit, à une autre substance, par ex. un produit de lixiviation, qui possède l'une des caractéristiques énumérées ci-dessus ">H13	Matières susceptibles après élimination de donner lieu, par quelque moyen que ce soit, à une autre substance, par ex. un produit de lixiviation, qui possède l'une des caractéristiques énumérées ci-dessus</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:if test="${type.equals('TR') || type.equals('XD')}">
                                                <button type="button"
                                                        onclick="openCity1('Btn12','12')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                </button>
                                            </c:if>
                                            <c:if test="${type.equals('ZF') || type.equals('ET')}">
                                                <button type="button"
                                                        onclick="openCity1('Btn2','2')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                </button>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mt-1 col-sm-6">

                                            <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                                                <button type="button" id="Suivante"
                                                        onclick="updateGeneral('formnotif3','notification',4,'${id}','id_notification','non')"
                                                        class="btn btn-success btn-block">
                                                    <spring:message code="button.Suivant"/>
                                                        </button>
                                            </c:if>
                                            <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET'))}">
                                                <button type="button" id="Suivante"
                                                        onclick="updateGeneral('formnotif3','notification',5,'${id}','id_notification','non')"
                                                        class="btn btn-success btn-block">
                                                    <spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                            <c:if test="${(type.equals('TR'))}">
                                                <button type="button" id="Suivante"
                                                        onclick="updateGeneral('formnotif3','notification',55,'${id}','id_notification','non')"
                                                        class="btn btn-success btn-block">
                                                    <spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>



                                        </div>

                                    </div>

                                </form>
                            </div>
                        </div>
                            <%--********************Tab4***************************--%>
                        <div class="row ">
                            <div id="4" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.TransporteurNationalprevu"/> </h4>
                                <div class="row m-0 p-0 mt-3" id="divTableTranport">
                                    <div class="col-12">
                                        <form id="formTransporteur" name="formTransporteur" class="w-100">
                                            <div class="row m-0 p-0">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> </label><input type="hidden" name="id_notification"
                                                                               id="id_notification4"
                                                                               value="${notification.id_notification}">
                                                        <select ${dd} name="id_transporteur" id="id_Transporteur"
                                                                class="form-control select2"
                                                                data-width="100%">
                                                            <option value=""><spring:message code="label.Declarervotretransporteur"/></option>
                                                            <c:forEach items="${Transporteur_liste}" var="t">
                                                                <option value="${t[0] }">${t[1] }</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group mt-4">

                                                        <button type="button"
                                                                onclick="addObject_TR('formTransporteur','notif_tranport','divTableTranport',this)"
                                                                class="btn btn-success">
                                                            <spring:message code="button.ajouter"/>
                                                        </button>

                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="table-responsive">
                                            <table id="tableProfils" class="table my_table table-striped hover compact table-bordered text-md-nowrap transporteur_table">
                                            <thead class="thead-bleu">
                                            <tr>
                                                <th class=""><spring:message code="label.nomdesociete"/></th>


                                                <th class=""><spring:message code="label.identifiantfiscal"/></th>
                                                <%--<th class="">Adresse</th>--%>
                                                <th class=""><spring:message code="label.telephone"/></th>
                                                <th class=""><spring:message code="label.Fax"/></th>
                                                <th class=""><spring:message code="label.Adresse"/></th>

                                                <%--<th class=""><spring:message code="label.Action"/></th>--%>
                                            </tr>
                                            </thead>
                                            <tbody id="tbodyTransporteur">
                                            <c:forEach items="${notification.transporteur}" var="Tr_l">

                                                <tr>
                                                    <td>${Tr_l.nom} </td>


                                                    <td>${Tr_l.identifiant} </td>
                                                        <%--<td>${Tr_l.adresse} </td>--%>
                                                    <td>${Tr_l.tel} </td>
                                                    <td>${Tr_l.fax} </td>
                                                    <td>${Tr_l.adresse} </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 p-0">
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <button type="button"
                                                        onclick="openCity1('Btn3','3')"
                                                        class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                </button>
                                            </div>
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:choose>
                                                    <c:when test="${type.equals('ZF')}">
                                                            <button type="button" id=""
                                                                    onclick="validerTrN('Btn6','6')" class="btn btn-success btn-block">
                                                                <spring:message code="button.Suivant"/>
                                                            </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                            <button type="button" id=""
                                                                    onclick="validerTrN('Btn55','55')" class="btn btn-success btn-block">
                                                                <spring:message code="button.Suivant"/>
                                                            </button>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                            <%--********************Tab4_2***************************--%>
                        <div class="row ">
                            <div id="5" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.TransporteurNational"/></h4>
                                <div id="row_from_groupe" class="mb-5">
                                    <div class="row m-0 p-0">
                                        <div class="col-2 ml-auto pr-0 mb-2">
                                            <button class="btn btn-primary btn-block" onclick="show_form_trans_cls()">
                                                <span class="fa fa-plus"></span> <spring:message code="button.ajouter"/>
                                            </button>
                                        </div>
                                        <div class="col-12 p-0 table-responsive">
                                            <table class="table my_table table-bordered table-striped table-hover" id="trvalid">
                                                <thead>
                                                <tr>
                                                    <th class="text-center"><spring:message code="label.Nomdelasociete"/> </th>
                                                    <th class="text-center"> <spring:message code="label.Matricule"/> </th>
                                                    <th class="text-center"> <spring:message code="label.Typedetransport"/> </th>
                                                    <th class="text-center"><spring:message code="label.Assurance"/>  </th>
                                                    <th class="text-center"><spring:message code="label.Adresse"/>  </th>
                                                    <th class="text-center"> <spring:message code="label.Action"/></th>
                                                </tr>
                                                </thead>
                                                <tbody id="rowTransporteur">
                                                <c:if test="${not empty notification.transporteur_etranger}">
                                                    <c:forEach items="${notification.transporteur_etranger}" var="trans">
                                                        <c:if test="${trans.type=='tn'}">
                                                            <tr id="tr_${trans.id_TransporteurEtranger}">
                                                                <td>${trans.raison_social}</td>
                                                                <td>${trans.num_matricule}</td>
                                                                <td>${trans.typeVehicule}</td>
                                                                <td>
                                                                    <c:if test="${not empty trans.url_assurance}">
                                                                        <a target="_blank" download="assurance"
                                                                           href="/downloadFile/${fn:replace(trans.url_assurance,"/assets/myFile/","")}"
                                                                           class="btn btn-primary btn-sm"> <span class="fa fa-download" style="${pageContext.response.locale=='ar'?'margin-left:10px':'margin-right:10px'}"></span><spring:message code="label.Assurance"/>   </a>
                                                                    </c:if>
                                                                   </td>
                                                                <td>${trans.adresse}</td>
                                                                <td class="text-center">
                                                                    <button onclick="delete_transp_etrang('${trans.id_TransporteurEtranger}','id_notification','nationale','${lng}')"
                                                                            class="btn btn-danger rounded-circle"><span
                                                                            class="fas fa-trash"></span></button>
                                                                    <button onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','nationale')"
                                                                            class="btn btn-warning rounded-circle"><span
                                                                            class="fas fa-edit" style="color: white"></span></button>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card hidden" id="frm_trans_card">
                                        <div class="card-body">
                                            <div class="row mt-3 justify-content-center p-0">
                                                <div class="col-lg-4 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Nomdelasociete"/>  </label>
                                                        <input type="text" id="raison_social_n" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Matricule"/>   </label>
                                                        <input type="text" id="num_matriule_n" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Typedetransport"/> </label>
                                                        <select id="type_vehicule_n" class="form-control">
                                                            <option value="0"><spring:message code="option.Choisir"/> </option>
                                                            <option value="camion"><spring:message code="label.camion"/> </option>
                                                            <option value="avion"><spring:message code="label.avion"/></option>
                                                            <option value="bateau"><spring:message code="label.bateau"/></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3 justify-content-center p-0">
                                                <div class="col-lg-6 col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Assurance"/>  </label>
                                                        <input type="File" id="doc_assurance_n" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Adresse"/>   </label>
                                                        <textarea type="text" id="adresseTr_n" rows="3" class="form-control"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3 justify-content-center p-0">
                                            <div class="col-sm-12 col-lg-4 col-md-8">
                                                <input type="hidden" value="0" id="id_trans_n">
                                                <button class="btn btn-success btn-block mt-5"
                                                        onclick="ajouterTranporteur_EtrangerNational('id_notification',this)"><spring:message code="button.Enregistrer"/>
                                                    <spring:message code="label.transporteur"/>
                                                </button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 p-0">
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 m-1 col-sm-6">
                                                <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==1)}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn3','3')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${((type.equals('ZF' ) || type.equals('XD'))  && notification.classification.id_classification==2) || (type.equals('ET') || (type.equals('TR')) )}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn3','3')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>


                                            </div>
                                            <div class="col-md-4 m-1 col-sm-6">
                                                <c:choose>
                                                    <c:when test="${type.equals('ET') || type.equals('XD') || type.equals('TR')}">
                                                        <button type="button" onclick="validTransporteur('Btn55','55','${type}')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/></button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" onclick="validTransporteur('Btn6','6','${type}')"
                                                                class="btn btn-success btn-block"><spring:message
                                                                code="button.Suivant"/></button>
                                                    </c:otherwise>
                                                </c:choose>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--********************Tab55***************************--%>  <%--********************Tab4_2***************************--%>
                        <div class="row ">
                            <div id="55" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.TransporteurInternational"/></h4>
                                <c:if test="${type=='TR' || type=='XD' || type=='ET'}">
                                <div id="row_from_groupe_port" class="mb-5">
                                    <div class="row m-0 p-0">
                                        <div class="col-2 ml-auto pr-0 mb-2">
                                            <button class="btn btn-primary btn-block" onclick="fun_affiche_from_55()"><spring:message code="button.ajouter"/></button>
                                        </div>

                                        <div class="col-12 p-0 table-responsive">
                                            <table id="trsuivant" class="table my_table table-bordered table-striped table-hover transporteur_table">
                                                <thead>
                                                <tr>
                                                    <th class="text-center"> <spring:message code="label.raisonsocial"/></th>
                                                    <th class="text-center"> <spring:message code="label.Typedetransport"/></th>
                                                    <th class="text-center"> <spring:message code="label.Assurance"/></th>
                                                    <th class="text-center"> <spring:message code="label.Adresse"/></th>
                                                    <th class="text-center"> <spring:message code="label.Action"/></th>
                                                </tr>
                                                </thead>
                                                <tbody id="trI">
                                                <c:if test="${not empty notification.transporteur_etranger}">
                                                    <c:forEach items="${notification.transporteur_etranger}" var="trans">
                                                        <c:if test="${trans.type=='ti'}">
                                                            <tr>
                                                                <td>${trans.raison_social}</td>
                                                                <td>${trans.typeVehicule}</td>
                                                                <td>
                                                                    <c:if test="${not empty trans.url_assurance}">
                                                                        <a target="_blank" download="assurance"
                                                                           href="/downloadFile/${fn:replace(trans.url_assurance,"/assets/myFile/","")}"
                                                                           class="btn btn-primary btn-sm">
                                                                            <span class="fa fa-download" style="${pageContext.response.locale=='ar'?'margin-left:10px':'margin-right:10px'}"></span> <spring:message code="label.Assurance"/>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${empty trans.url_assurance}">
                                                                        <spring:message code="label.aucuneAssurance"/>
                                                                    </c:if>
                                                                    </td>
                                                                <td>${trans.adresse}</td>
                                                                <td class="text-center">
                                                                    <button onclick="delete_transp_etrang2('${trans.id_TransporteurEtranger}','id_notification','etranger')"
                                                                            class="btn btn-danger rounded-circle"><span
                                                                            class="fas fa-trash"></span></button>
                                                                    <button onclick="edit_transp_trang('${trans.id_TransporteurEtranger}','id_notification','etranger')"
                                                                            class="btn btn-warning rounded-circle"><span
                                                                            class="fas fa-edit" style="color: white"></span></button>
                                                                </td>
                                                            </tr>
                                                            <div class="modal fade"
                                                                 id="modal_DetailPort_${trans.id_TransporteurEtranger}"
                                                                 tabindex="-1" role="dialog"
                                                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                                 style="background: none">
                                                                <div class="modal-dialog modal-dialog-centered modal-lg"
                                                                     role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"><spring:message code="label.DetailPort"/></h5>
                                                                            <button onclick="close_modal(this)" type="button"
                                                                                    class="close" data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="row justify-content-center">
                                                                                <div class="col-10">
                                                                                    <div class="row "
                                                                                         style="background: gray;color: white;border-color: #737373;">
                                                                                        <div class="col-md-6 col-sm-12 border p-2 font_bold  btn-gris">
                                                                                            #
                                                                                        </div>
                                                                                        <div class="col-md-6 col-sm-12 border p-2 font_bold  btn-gris">
                                                                                            <spring:message code="label.Port"/>
                                                                                        </div>
                                                                                    </div>

                                                                                    <c:forEach items="${trans.port}" var="xx"
                                                                                               varStatus="loopp">
                                                                                        <div class="row">
                                                                                            <div class="col-md-6 col-sm-12 border p-2">
                                                                                                    ${loopp.index+1}
                                                                                            </div>
                                                                                            <div class="col-md-6 col-sm-12 border p-2">
                                                                                                    ${xx.nom_fr}
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button onclick="close_modal(this)" type="button"
                                                                                    class="btn btn-secondary" data-dismiss="modal">
                                                                                <spring:message code="label.Fermer"/>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card hidden" id="card_55" >
                                        <div class="card-body">
                                            <div class="row mt-3 justify-content-center p-0">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Nomdelasociete"/></label>
                                                            <input type="text" id="raison_social" class="form-control">
                                                        </div>
                                                    </div>
                                                    <c:if test="${type.equals('ET')}">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Typedetransport"/>  </label>
                                                            <select id="type_vehicule" class="form-control">
                                                                <option value="0"><spring:message code="option.Choisir"/> </option>
                                                                <option value="camion"><spring:message code="label.camion"/> </option>
                                                                <option value="avion"><spring:message code="label.avion"/></option>
                                                                <option value="bateau"><spring:message code="label.bateau"/></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                <c:if test="${type.equals('TR')}">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Typedetransport"/>  </label>
                                                            <select id="type_vehicule" class="form-control">
                                                                <option value="0"><spring:message code="option.Choisir"/> </option>
                                                                <option value="camion"><spring:message code="label.camion"/> </option>
                                                                <option value="avion"><spring:message code="label.avion"/></option>
                                                                <option value="bateau"><spring:message code="label.bateau"/></option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                </c:if>
                                                        <c:if test="${type.equals('XD')}">
                                                            <div class="col-lg-6 col-md-6 col-sm-12">
                                                                <div class="form-group">
                                                                    <label><spring:message code="label.Typedetransport"/>  </label>
                                                                    <select id="type_vehicule" class="form-control">
                                                                        <option value="0" selected="selected"><spring:message code="option.Choisir"/> </option>
                                                                        <option value="camion"><spring:message code="label.camion"/> </option>
                                                                        <option value="avion"><spring:message code="label.avion"/></option>
                                                                        <option value="bateau"><spring:message code="label.bateau"/></option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                            </div>
                                            <div class="row mt-3 justify-content-center p-0">
                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Assurance"/> </label>
                                                        <input type="file" class="form-control" id="doc_assurance">
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Adresse"/>  </label>
                                                        <textarea type="text" id="adresseTr" rows="3" class="form-control"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3 justify-content-center p-0">
                                                <div class="clear"></div>
                                                <div class="col-sm-12 col-md-5">
                                                    <input type="hidden" value="0" id="id_trans">
                                                    <button class="btn btn-success btn-block"
                                                            onclick="ajouterTranporteur_Etranger('id_notification',this)"><spring:message code="button.Enregistrer"/>
                                                        <spring:message code="label.transporteur"/>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                <div class="row">
                                    <div class="col-12 p-0">
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:if test="${(type=='ZF' || type=='XD') && notification.classification.id_classification==1}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn4','4')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                                <c:if test="${ type=='XD' && notification.classification.id_classification==2}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn5','5')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='ET'}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn5','5')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='TR'}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn3','3')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                            </div>
                                                <c:if test="${!type.equals('ZF') && !type.equals('XD')}">
                                                <div class="col-md-4 mt-1 col-sm-6">
                                                    <button type="button" onclick="openCity1('Btn56','56')"
                                                            class="btn btn-success btn-block"><spring:message
                                                            code="button.Suivant"/></button>
                                                </div>
                                                </c:if>
                                            <c:if test="${type.equals('XD')}">
                                                <div class="col-md-4 mt-1 col-sm-6">
                                                    <button type="button" onclick="openCity1('Btn56','56')"
                                                            class="btn btn-success btn-block"><spring:message
                                                            code="button.Suivant"/></button>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div id="56" class="tabcontent col-12 pr-2">
                                <h4 class="titre_abs "><spring:message code="label.iteniraire"/></h4>
                                <div id="row_from_port" class="mb-5">
                                    <table class="table my_table table-bordered table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th><spring:message code="label.payedetransit"/> </th>
                                            <th><spring:message code="label.Port"/> </th>
                                            <th><spring:message code="label.Action"/> </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody_it">
                                        <c:forEach items="${notification.ports}" var="p" varStatus="loopp" >
                                            <tr style="background-color:${bg};color: #808080 !important;font-weight:bold" >
                                                <td class="col-4">${pageContext.response.locale=='ar'?p.pays.nom_ar:p.pays.nom_fr}</td>
                                                <td class="col-md-6 col-sm-12">${p.nom_fr}</td>
                                                <td class="col-2 text-center">
                                                    <button class="btn btn-success rounded-circle"
                                                            onclick="delete_port('${p.id_port}','id_notification')">
                                                        <span class="fa fa-times"></span></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row m-0 p-0">
                                                <div class="col-sm-12 col-md-6 nopadding">
                                                    <div class="form-group">

                                                            <select type="text" class="form-control" name="pays_select" id="pays">
                                                                <option value="0"><spring:message code="label.choisirunpays"/> </option>
                                                                <c:forEach items="${pays}" var="t">
                                                                    <option
                                                                            value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                                                                </c:forEach>
                                                            </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6 nopadding">
                                                    <div class="form-group">
                                                            <input type="text" class="form-control" name="nom_fr" id="nom_fr"
                                                                   placeholder="<spring:message code="label.EntrezUnPort"/> ">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3 justify-content-center p-0">
                                                <div class="clear"></div>
                                                <div class="col-sm-12 col-md-5">
                                                    <input type="hidden" value="0" id="id_port">
                                                    <button class="btn btn-success btn-block"
                                                            onclick="ajouterPort('id_notification',this)"><spring:message code="button.Enregistrer"/>
                                                        <spring:message code="label.Port"/>
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 p-0">
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:if test="${type=='ZF'}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn4','4')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                                <c:if test="${ type=='XD' && notification.classification.id_classification==1}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn55','55')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                                <c:if test="${ type=='XD' && notification.classification.id_classification==2}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn55','55')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='ET' || type=='TR'}">
                                                    <button type="button"
                                                            onclick="openCity1('Btn55','55')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                            </div>
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <button type="button" onclick="validerPort('Btn6','6')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="button.Suivant"/></button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--********************Tab55***************************--%>
                        <div class="row ">
                            <div id="6" class="tabcontent col-12 pr-2">
                                <c:if test="${type.equals('XD')}">

                                    <h4 class="titre_abs "><spring:message code="label.producteursdesdechets"/></h4>
                                    <div class="row p-0 m-0">
                                        <div class="col-12 p-0 m-0" id="producteur_table">
                                            <div class="table-responsive">
                                                <table class="table table-bordered my_table">
                                                    <thead style="background-color: #336c4e; color: white">
                                                    <tr>
                                                        <th><spring:message code="label.personneacontacter"/> </th>
                                                        <th><spring:message code="label.Adresse"/></th>
                                                        <th><spring:message code="label.Tel"/></th>
                                                        <th><spring:message code="label.Fax"/></th>
                                                        <th><spring:message code="label.Email"/></th>
                                                        <th style="min-width: 120px"><spring:message code="label.Action"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tPr">
                                                    <c:choose>
                                                        <c:when test="${(not empty notification.producteurs)}">
                                                            <c:forEach items="${notification.producteurs}" var="p">
                                                                <tr id="trr_${p.id_producteur}">
                                                                    <td> ${p.contact_fr}</td>
                                                                    <td> ${p.adresse_fr}</td>
                                                                    <td> ${p.tel}</td>
                                                                    <td> ${p.fax}</td>
                                                                    <td> ${p.mail}</td>

                                                                    <td class="">
                                                                        <button onclick="deleteProducteurNotification('${p.id_producteur}','id_notification')"
                                                                                class="btn btn-danger rounded-circle"><span
                                                                                class="fas fa-trash"></span></button>
                                                                        <button onclick="edit_producteur_notification('${p.id_producteur}','id_notification')"
                                                                                class="btn btn-warning rounded-circle"><span
                                                                                class="fas fa-edit" style="color: white"></span></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <form id="zone_form1" name="zone_form1">
                                                <div id="zone_form" class=" col-12 p-0 m-0">
                                                    <div class="row m-0 p-0">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label> <spring:message code="label.personneacontacter"/> </label>
                                                                <input type="text" id="contact_fr" name="contact_fr" class="form-control" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label> <spring:message code="label.email"/> </label>
                                                                <input type="email" id="mail" name="mail" class="form-control" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0 p-0">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label> <spring:message code="label.telephone"/> </label>
                                                                <input type="tel" id="tel" name="tel"  class="form-control" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label> <spring:message code="label.Fax"/> </label>
                                                                <input type="text" id="fax_p" name="fax" maxlength="10" class="form-control" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row m-0 p-0">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label> <spring:message code="label.Adresse"/> </label>
                                                                <textarea type="text" id="adresse_fr" name="adresse_fr" class="form-control" required></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>

                                            <div class="row justify-content-center">
                                                <div class="col-md-3">
                                                    <input type="hidden" value="0" id="id_prod">
                                                    <button onclick="ajouterProducteur('id_notification',this)" class="btn btn-primary btn-block"><spring:message code="label.Enregistrerleproducteur"/> </button>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                    onclick="openCity1('Btn56','56')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:if test="${notification.producteurs.size()==0}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                        onclick="check_producteur_ok('Btn7','7')"
                                                        class="btn btn-success btn-block">
                                                    <spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                            <c:if test="${notification.producteurs.size()!=0}">
                                                <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                        onclick="openCity1('Btn7','7')"
                                                        class="btn btn-success btn-block">
                                                    <spring:message code="button.Suivant"/>
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>

                                </c:if>
                                <c:if test="${!type.equals('XD')}">
                                    <c:if test="${type.equals('ET')}">
                                        <h4 class="titre_abs "><spring:message code="label.producteursdedechet"/> </h4>
                                    </c:if>
                                    <c:if test="${!type.equals('ET')}">
                                        <h4 class="titre_abs "><spring:message code="label.producteur"/> </h4>
                                    </c:if>


                                    <form id="formproducteur" name="formproducteur">
                                        <div class="card">
                                            <div class="card-body">
                                    <c:if test="${!type.equals('XD')}">
                                                <div class="row m-0 p-0 mt-5">
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.nomdesociete"/> </label>
                                                            <input value="${notification.producteur.nom_fr}" type="text" required
                                                                   name="Nom_fr" id="nom_producteur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.personneacontacter"/> </label>
                                                            <input value="${notification.producteur.contact_fr}" type="text" required
                                                                   name="contact_fr" id="contact_producteur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group" style="text-align: right;">
                                                            <label dir="rtl"> إسم الشركة  </label>
                                                            <input dir="rtl" value="${notification.producteur.nom_ar}"
                                                                   type="text" id="arproducteur"
                                                                   name="Nom_ar" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row m-0 p-0">

                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.identifiantfiscal"/> </label>
                                                            <input type="text" value="${notification.producteur.idf}" id="idf_producteur"
                                                                   name="idf" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.telephone"/> </label>
                                                            <input value="${notification.producteur.tel}" type="tel" id="tel_producteur"
                                                                   name="tel" required
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.Fax"/> </label>
                                                            <input value="${notification.producteur.fax}" type="text" id="fa_producteur"
                                                                   name="fax"
                                                                   class="form-control">
                                                        </div>
                                                    </div>

                                                </div>
                                    </c:if>
                                                <c:if test="${type.equals('XD')}">
                                                    <div class="row m-0 p-0 mt-5">
                                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                                            <div class="form-group select_test">
                                                                <label> <spring:message code="label.personneacontacter"/> </label>
                                                                <input value="${notification.producteur.contact_fr}" type="text" required
                                                                       name="contact_fr" id="contact_producteur" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                                            <div class="form-group select_test">
                                                                <label> <spring:message code="label.telephone"/> </label>
                                                                <input value="${notification.producteur.tel}" type="tel" id="tel_producteur"
                                                                       name="tel" required
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-12">
                                                            <div class="form-group select_test">
                                                                <label> <spring:message code="label.Fax"/> </label>
                                                                <input value="${notification.producteur.fax}" type="text" id="fa_producteur"
                                                                       name="fax" required maxlength="10" minlength="10"
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="row m-0 p-0">

                                                    <div class="col-lg-8 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.Adresse"/> </label>
                                                            <textarea type="text" id="adresse_producteur"
                                                                      name="adresse_fr" required class="form-control">${notification.producteur.adresse_fr}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group select_test">
                                                            <label> <spring:message code="label.email"/> </label>
                                                            <input value="${notification.producteur.mail}" type="email"
                                                                   name="mail" id="mail_producteur" required
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="row justify-content-center mt-3 mb-5">
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:if test="${(type=='ZF') && notification.classification.id_classification==1 }">
                                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                            onclick="openCity1('Btn4','4')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='ZF' && notification.classification.id_classification==2}">
                                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                            onclick="openCity1('Btn5','5')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='ET' || (type=='XD')}">
                                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                            onclick="openCity1('Btn56','56')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>
                                                <c:if test="${type=='TR'}">
                                                    <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                            onclick="openCity1('Btn56','56')"
                                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                                    </button>
                                                </c:if>

                                            </div>
                                            <div class="col-md-4 mt-1 col-sm-6">
                                                <c:choose>
                                                    <c:when test="${notification.producteur.id_producteur == null}">
                                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                onclick="addObject_step('formproducteur','producteur','7','id_notification')"
                                                                class="btn btn-success btn-block">
                                                            <spring:message code="button.Suivant"/>
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                                onclick="updateObject('formproducteur','producteur','','7',' id_producteur = '+${notification.producteur.id_producteur})"
                                                                class="btn btn-success btn-block">
                                                            <spring:message code="button.Suivant"/>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                            <%--********************Tab6***************************--%>
                        <div class="row ">
                            <div id="7" class="tabcontent col-12 pr-2">

                                <h4 class="titre_abs">
                                    <spring:message code="label.Installationdevalorisationelimination"/>
                                </h4>

                                <form id="formeliminateur" name="formeliminateur">
                                    <div class="card">
                                        <div class="card-body">
                                            <c:if test="${!type.equals('XD')}">
                                                <div class="row m-0 p-0 mt-5">
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.nomdesociete"/> </label>
                                                            <input value="${notification.eliminateur.nom_fr}" type="text"
                                                                   name="Nom_fr" id="nom_eliminateur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.personneacontacter"/> </label>
                                                            <input value="${notification.eliminateur.contact_fr}" type="text"
                                                                   name="contact_fr" id="contact_eliminateur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group" style="text-align: right;">
                                                            <div class="form-group" style="text-align: right;">
                                                                <label dir="rtl"> إسم الشركة  </label>
                                                                <input dir="rtl" value="${notification.eliminateur.nom_ar}"
                                                                       type="text" id="ar_eliminateur"
                                                                       name="Nom_ar" class="form-control">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row m-0 p-0 ">
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.identifiantfiscal"/> </label>
                                                            <input type="text" value="${notification.eliminateur.idf}"
                                                                   name="idf" id="idf_eliminateur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.telephone"/> </label>
                                                            <input value="${notification.eliminateur.tel}" type="tel"
                                                                   name="tel" id="tel_eliminateur"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.Fax"/> </label>
                                                            <input value="${notification.eliminateur.fax}" type="text"
                                                                   name="fax" id="fax_eliminateur" minlength="10" maxlength="10"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <c:if test="${type.equals('XD')}">
                                                <div class="row m-0 p-0 mt-3">
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.personneacontacter"/> </label>
                                                            <input value="${notification.eliminateur.contact_fr}" type="text"
                                                                   name="contact_fr" id="contact_eliminateur" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.telephone"/> </label>
                                                            <input value="${notification.eliminateur.tel}" type="tel"
                                                                   name="tel" id="tel_eliminateur"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label> <spring:message code="label.Fax"/> </label>
                                                            <input value="${notification.eliminateur.fax}" type="text"
                                                                   name="fax" id="fax_eliminateur" minlength="10" maxlength="10"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="row m-0 p-0">

                                                <div class="col-lg-8 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Adresse"/> </label>
                                                        <textarea type="text"
                                                                  name="adresse_fr" id="adresse_eliminateur" class="form-control">${notification.eliminateur.adresse_fr}</textarea>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.email"/> </label>
                                                        <input value="${notification.eliminateur.mail}" type="email"
                                                               name="mail" id="mail_eliminateur"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row justify-content-center mt-3 mb-5">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                                    onclick="openCity1('Btn6','6')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <c:choose>
                                                <c:when test="${notification.eliminateur.id_eliminateur == null}">
                                                    <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                            onclick="addObject_step('formeliminateur','eliminateur','9','id_notification')"
                                                            class="btn btn-success btn-block"><spring:message
                                                            code="button.Suivant"/>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                                                            onclick="updateObject('formeliminateur','eliminateur','','9','id_eliminateur = '+${notification.eliminateur.id_eliminateur})"
                                                            class="btn btn-success btn-block">
                                                        <spring:message code="button.Suivant"/>
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                            <%--********************Tab9***************************--%>
                        <div class="row ">
                            <div id="9" class="tabcontent col-12 pr-2">

                                <h4 class="titre_abs "><spring:message code="label.mespieces"/></h4>
                                <form id="document" name="document">
                                    <input type="hidden" name="id_notif" id="id_notifss" value="${id_notif}">
                                    <p class="mt-2" style="font-size: 11px"> <span class=" p-2 ">
                                        <img src="/assets/images/warning.png" style="width: 40px;margin-left: 10px">
                                        <spring:message code="label.Vouspouvezimporterdesdocumentsscannesen"/></span> </p>

                                    <c:forEach items="${doc}" var="dc">
                                        <c:set var="id_doc" value="${dc.id_docImport}"/>
                                        <div class="row justify-content-center">
                                            <div class="col-md-8 col-sm-10 mt-3  ">
                                                <div class="form-group document">
                                                    <div>
                                                        <c:if test="${(type!='ET') && (type!='TR') }">
                                                            <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                            <div class="upload">
                                                                <input required
                                                                       onchange="addDocs(${notification.id_notification},${id_doc},'doc${id_doc}','file-chosen_${id_doc}')"
                                                                       accept=".pdf" type="file"
                                                                       id="doc${id_doc}" class="actual-btn" hidden>
                                                                <label class="uploadButton" for="doc${id_doc}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>
                                                                <span class="fileName" id="file-chosen_${id_doc}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${(type=='ET') ||( type=='TR')}">
                                                            <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                            <div class="upload">
                                                                <input required
                                                                       onchange="addDocs2('id_notification',${id_doc},'doc${id_doc}','file-chosen_${id_doc}')"
                                                                       accept=".pdf" type="file"
                                                                       id="doc${id_doc}" class="actual-btn" hidden>
                                                                <label class="uploadButton" for="doc${id_doc}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>

                                                                <!-- name of file chosen -->
                                                                <span class="fileName" id="file-chosen_${id_doc}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${not empty docExiste}">
                                                <div class="col-md-4 col-sm-2">
                                                    <c:forEach items="${docExiste}" var="d">
                                                        <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                            <a href="/downloadFile/${fn:replace(d.url,"/assets/myFile/","")}"
                                                               class="btn btn-success rounded file_existe"><span
                                                                    class="fa fa-download"></span></a>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>

                                    <div class="row justify-content-center mt-2 mb-4">
                                        <div class="col-md-4 mt-1 col-sm-6">
                                            <button type="button"
                                                    onclick="openCity1('Btn7','7')"
                                                    class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                            </button>
                                        </div>
                                        <div class="col-lg-4 col-md-6 mt-1 col-sm-6">
                                            <button type="button"
                                                    onclick="verif_champs('9','${type}','id_notification','10')"
                                                    class="btn btn-success btn-block"><spring:message code="label.Afficherlerecapitulatif"/>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row ">
                            <div id="10" class="tabcontent col-12 pr-2">

                                <h4 class="titre_abs "><spring:message code="label.Recapitulation"/></h4>
                                <div id="recap"></div>
                                <div class="row justify-content-center mt-2 mb-4">
                                    <div class="col-md-4 mt-1 col-sm-6">
                                        <button type="button"
                                                onclick="openCity1('Btn9','9')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-md-4 mt-1 col-sm-6">

                                        <button type="button" id="EnregistrerZF" disabled
                                                onclick="verif_recap('10','${type}','id_notification')"
                                                class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message
                        code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>

    var actualBtn = $('.actual-btn');

    var fileChosen = $('.file-chosen');

    $(actualBtn).on("change",function (){
        $(fileChosen).text(this.files[0].name);
    })


        function ajouterProducteur(id_name) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var nom_fr = $("#nom_fr_p").val();
        var nom_ar = $("#nom_ar").val();
        var contact_fr = $("#contact_fr").val();
        var idf = $("#idf").val();
        var adresse_fr = $("#adresse_fr").val();
        var tel = $("#tel").val();
        var fax = $("#fax_p").val();
        var mail = $("#mail").val();

        if(contact_fr==null || adresse_fr==null || tel==null || fax==null || mail==null){
            swal("<spring:message code="label.Avertissement"/> !", "<spring:message code="label.lenumerodeEIEnestpasvalide"/>", "error");
            return false;
        }

        var id_prod = $("#id_prod").val();
        var data = new FormData();
        data.append("nom_fr", nom_fr);
        data.append("nom_ar", nom_ar);
        data.append("contact_fr", contact_fr);
        data.append("idf", idf);
        data.append("adresse_fr", adresse_fr);
        data.append("tel", tel);
        data.append("fax", fax);
        data.append("mail", mail);

        if ($("form[name='zone_form1']").valid()) {
            $.ajax({
                url: '/api/addProducteurNotification/' + id + "/" + id_prod,
                type: 'POST',
                processData: false,
                contentType: false,
                cache: false,
                data: data,
            })
                .done(function (data) {
                    $("#producteur_table").html(data);
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                    $("#id_prod").val(0);
                    document.getElementById("nom_fr_p").value = "";
                    document.getElementById("nom_ar").value = "";
                    document.getElementById("contact_fr").value = "";
                    document.getElementById("idf").value = "";
                    document.getElementById("adresse_fr").value = "";
                    document.getElementById("tel").value = "";
                    document.getElementById("fax_p").value = "";
                    document.getElementById("mail").value = "";

                });
        }
    }

    function updateRegion(value) {
        event.preventDefault();
        $('#loader_modal').modal('show');
        if(value!=0){
            $.ajax({
                url: '/api/UpdateRegion',
                type: 'post',
                data: {
                    "id": $("#id_notification").val(),
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
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });
        }

    }
    function ajouterTranporteur_Etranger(id_name,val) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var raison = $("#raison_social").val();
        var matricule = $("#num_matriule").val();
        var type_vehicule = $("#type_vehicule").val();
        var adresse = $("#adresseTr").val();
        var id_trans = $("#id_trans").val();

        if (raison == "" || type_vehicule==0 || adresse=="") {
                swal({
                    title: "<spring:message code="label.Avertissement"/> ",
                    text: "<spring:message code="label.Tousleschampssontobligatoire"/>",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "OK ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
            return false;
        }

        var data = new FormData();
        data.append("raison", raison);
        data.append("matricule", matricule);
        data.append("type_vehicule", type_vehicule);
        data.append("adresse", adresse);

        var ins = document.getElementById("doc_assurance").files.length;
        /*if (ins == 0 && !$("#btn_downolad2").is(":visible")) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Lefichierestobligatoire"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
            return false;
        }*/

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "<spring:message code="label.Typedefichiernonprisencharge"/>", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }

        $(val).prop("disabled", "true");
        $('#loader_modal').modal('show');

        $.ajax({
            url: '/api/addTransporteuretranger/' + id + "/" + id_trans,
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
        })
            .done(function (data) {
                $("#row_from_groupe_port").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');
            });

    }

    function ajouterTranporteur_Etranger_XD(id_name) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var raison = $("#raison_social").val();
        var matricule = $("#num_matriule").val();
        var type_vehicule = $("#type_vehicule").val();
        var adresse = $("#adresseTr").val();

        var port = $('input[name^=port]').map(function (idx, elem) {
            return $(elem).val();
        }).get();


        var id_trans = $("#id_trans_xd").val();
        var data = new FormData();
        data.append("raison", raison);
        data.append("matricule", matricule);
        data.append("type_vehicule", type_vehicule);
        data.append("adresse", adresse);
        data.append("port", port);

        var ins = document.getElementById("doc_assurance").files.length;
        if (ins == 0 && !$("#btn_downolad2").is(":visible")) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Lefichierestobligatoire"/>", 'error');
            return false;
        }

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }


        $.ajax({
            url: '/api/addTransporteuretrangerXD/' + id + "/" + id_trans,
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
        })
            .done(function (data) {
                $("#row_from_groupe_port").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function ajouterPort(id_name,val) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var nom_fr = $("#nom_fr").val();
        var pays = $("select[name=pays_select]").val();

        var id_port = $("#id_port").val();
        var data = new FormData();
        data.append("nom_fr", nom_fr);
        data.append("pays",pays);

        if(nom_fr==null || nom_fr=="" || pays==0){

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Tousleschampssontobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
            return false;
        }else{
            $(val).prop("disabled", "true");
            $('#loader_modal').modal('show');
            $.ajax({
                url: '/api/addPort/' + id + "/" + id_port,
                type: 'POST',
                processData: false,
                contentType: false,
                cache: false,
                data: data,
            })
                .done(function (data) {
                    $("#row_from_port").html(data);
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                    $(val).prop("disabled", "false");
                    $('#loader_modal').modal('hide');
                });
        }
    }

    function updatePrefecture(value) {
        if(event!=null)
            event.preventDefault();

        if(value!="0"){
            $.ajax({
                url: '/api/UpdatePrefecture',
                type: 'post',
                data: {
                    "id": $("#id_notification").val(),
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


    $(document).ready(function(){
        $("#defaultOpen").click();
    });
    function checkNumNotifRenouv(type, val) {
        event.preventDefault();
        $.ajax({
            url: '/api/getOneNotification',
            type: 'post',
            data: {
                "id": $(val).val(),
                "type": type
            },
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addDemandNotification/" + response + "/" + type + "/R";
                } else {
                    swal("<spring:message code="label.Aucunresultat"/> ", "<spring:message code="label.aucunrsultatnecorrespondaucritrederecherche"/> ", "error");
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
        $(evt).addClass("active");
        /*evt.currentTarget.className += " active";*/
    }

    // Get the element with id="defaultOpen" and click on it
    /*document.getElementById("defaultOpen").click();*/

    function schowform(blo_none, cityName) {

        document.getElementById(cityName).style.display = blo_none;
    }


    function check_producteur_ok(idBtn, cityName){
        var tr = $("#tPr tr").length;
        if(tr===0){

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Vousavezajouteraumoinunproducteur"/>",
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: " <spring:message code="label.OK"/> ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
            return false;
        }
        openCity1(idBtn,cityName)
    }

    function check_transporteur_inter_ok(idBtn, cityName){
        openCity1(idBtn,cityName)
    }


    function check_transporteur_ok(idBtn, cityName){
        if($(".transporteur_table").html()){
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Lestransporteursnationauxsontobligatoires"/> ", "error");
            return false;
        }
        openCity1(idBtn,cityName)
    }


    function compareQuantite(val, quantite, id) {
        if (quantite < val) {
            swal({

                title: "Information",
                text: "<spring:message code="label.Laquantitrelledpasselaquantit"/> ",
                type: "warning",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00695c',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Oui, Consulter !',

            }, function (isConfirm) {
                if (isConfirm) {
                    // window.location.href = "/api/addDemandNotification/" + id;
                    openCity1('defaultOpen', '1')
                }
            });
        }
    }

    /* add doument  */

    $(document).ready(function () {
        var validator = $("form").validate({});

        $(".mydoc").rules("add", {
            required: true,
            minlength: 3
        });
    });

    function updatePdf(id, form, table, url2, tap, id_obj) {

        fetch('/api/test/' + id)
            .then(resp => resp.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Notification.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
                updateObject(form, table, url2, tap, id_obj);
            })
            .catch(() => alert(''));

    }

    function verif_champs(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0) {
                $(input).parent().addClass("bg_error");
                test = true
            }
            else{
                $(input).parent().removeClass("bg_error");
            }
        });


        if (test) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Unouplusieurchampssontvides"/> ", "error");
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Unouplusieurchampssontvides"/>",
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
        } else {
            $("#Btn10").removeAttr("disabled");
            searchByDate1(id, type);
            openCity1('Btn'+tap,tap);
        }
    }


    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByDate1(id, type);
        openCity1('Btn'+tap,tap);

    }

    function verif_recap(id_form, type, id_name) {
        //if(event!=null)
        //    event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        verif_champs(id_form, type, id_name, '10')
        changer_Statut(id, 33, type);
    }

    function searchByDate1(id,type) {
        $.ajax({
            url: "/api/getnotifByIdEdit/"+type+"/"+id,
            type: "GET",
            data: {},
            success: function (response) {
                $("#recap").html(response);
                document.getElementById("EnregistrerZF").disabled=false;
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }

    function changer_Statut(id_notif, id_statut, type) {
        Swal.fire({
            title: '<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `<spring:message code="label.enregistrer"/> `,
            denyButtonText: `<spring:message code="label.Annuler"/>`,
        }).then((result) => {
            if (result.value) {
                load_file_recu(id_notif,type);
                changerstatut(id_notif,id_statut,type);
            }else{
                window.location.href="/api/ListeAutorisation/${type}/d";
            }
        })
    }

    function changerstatut(id_notif,id_statut,type){

        $.ajax({
            url: '/api/changerStatus',
            type: 'POST',
            data : {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut), "type": type},
        })
            .done(function(data) {
                window.location="/api/ListeAutorisation/"+type+"/d";
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                //window.location="/api/ListeAutorisation/"+type+"/d";
            });

    }

    function load_file_recu(id_notif){
        url = "/api/downloadRecuDepo/"+id_notif;
        window.location.href = url;
    }


    var room = 1;

    function education_fields() {
        room++;
        var objTo = document.getElementById('education_fields')
        var divtest = document.createElement("div");
        divtest.setAttribute("class", "form-group removeclass" + room);
        var rdiv = 'removeclass' + room;
        divtest.innerHTML = '<div class="row mt-3 p-0"> <div class="col-sm-9 nopadding"><div class="form-group"> <div class="input-group"><input type="text" class="form-control"  name="port[]"  placeholder="Entrez Un Port"> <button class="btn btn-danger" type="button" onclick="remove_education_fields(' + room + ');"> <span class="fa fa-minus" aria-hidden="true"></span> </button></div></div></div></div></div><div class="clear"></div>';

        objTo.appendChild(divtest)
    }

    function remove_education_fields(rid) {
        $('.removeclass' + rid).remove();
    }



    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }

    function getPaysautorite(id_aut) {
        var id_notif = $("#id_notification").val();
        $.ajax({
            url: '/api/getPaysAutoriteById/' + id_aut + '/' + id_notif,
            type: 'POST',
            data: {},
        })
            .done(function (data) {
                $("#pays_table").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function Save_paysautorite() {
        // event.preventDefault();

        var pays = $("#pays").val();

        $.ajax({

            type: "GET",
            url: "/api/savePaysAutorite/"+pays,
            data: {},
            success: function (response) {

            },
            error: function () {

            }
        });
    }

    function validateEmail($email) {
        var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return emailReg.test( $email );
    }

    function validatePhone($tel) {
        var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
        return filter.test( $tel );
    }
    function validateFax($fax) {
        var filter = /^\\+[0-9]{1,3}-[0-9]{3}-[0-9]{7}$/;
        return filter.test( $fax );
    }


    function addObject_step2(from,table,tap,id_notif) {
        if(event!=null)
            event.preventDefault();
        var se = $("#"+from).serializeObject();

        var Notchange = true;
        if(!$.isNumeric(id_notif)){
            id_notif = $("#"+id_notif).val();
            Notchange=false;
        }
        if ($("form[name='"+from+"']").valid()) {
            $.ajax({
                type: "POST",
                url: "/api/add_notification/" + table + "/" + id_notif,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(se),
                success: function (response) {
                    Save_paysautorite();
                    if (Notchange)
                        $("#id_notification").val(response);
                    openCity1('Btn' + tap, tap);
                    $(".my_tab:not(.montab)").removeAttr('disabled');
                },
                error: function (response) {

                }
            });
        }
    }
    function Save_paysautorite2() {
        var id = $("#id_paysautorite").val();
        var data = new FormData();
        var id_notif = $("#id_notification").val();
        var pays = $("#pays").val();
        var desc_autorite = $("#desc_autorite").val();

        if(pays==0 || pays=="" || desc_autorite==""){
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Tousleschampssontobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                html: false
            });
            return false;
        }

        if ($.trim(id) === "" || id == null || !$.isNumeric(id)) {
            id = 0;
        }


        var ins = document.getElementById("url_autorite").files.length;
        if (ins == 0 && !$("#btn_downolad3").is(":visible")) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Lefichierestobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                html: false
            });
            return false;
        }

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("url_autorite").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "<spring:message code="label.Typedefichiernonprisencharge"/>", "error");
                return false;
            }
            data.append("file", file);
        }

        data.append("pays",pays);
        data.append("desc_autorite",desc_autorite);

        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/savePaysAutoriteXD/"+id_notif+"/"+id,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {
                $("#pays_table").html(response);
            },
            error: function () {
            }
        });
    }

    function ajouterTranporteur_EtrangerNational(id_name,val) {


        //event.preventDefault();
        var id = $("#" + id_name).val();
        var raison = $("#raison_social_n").val();
        var matricule = $("#num_matriule_n").val();
        var type_vehicule = $("#type_vehicule_n").val();
        var adresse = $("#adresseTr_n").val();

        if (raison == "" || matricule=="" || type_vehicule=="" || adresse=="") {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.TousLesChampsestobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });


            return false;
        }

        var id_trans = $("#id_trans_n").val();
        if ($.trim(id_trans) === "" || id_trans == null || !$.isNumeric(id_trans)) {
            id_trans = 0;
        }
        var data = new FormData();
        data.append("raison", raison);
        data.append("matricule", matricule);
        data.append("type_vehicule", type_vehicule);
        data.append("adresse", adresse);


        var ins = document.getElementById("doc_assurance_n").files.length;
        if (ins == 0 && !$("#btn_downolad").is(":visible")) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Lefichierestobligatoire"/>", 'error');
            return false;
        }



        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance_n").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "<spring:message code="label.Typedefichiernonprisencharge"/>", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }

        $(val).prop("disabled", "true");
        $('#loader_modal').modal('show');
        $.ajax({
            url: '/api/addTransporteuretrangerNational/' + id + "/" + id_trans,
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
        })
            .done(function (data) {
                $("#row_from_groupe").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');
            });

    }
</script>

<script>
    function deletePaysautorite(id) {
        event.preventDefault();
        var id_notif = $("#id_notification").val();
        $.get("/api/deletePaysautorite/" + id + "/" + id_notif, function (rep) {
            $("#pays_table").html(rep);
        });
    }

    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formnotif3']").validate({




            // Specify validation rules
            rules: {


                destination_final : {
                    required: true,
                },
                premier : {
                    required: true,
                },
                expedition :{
                    required:true,
                },
                dernier:{
                    required:true,
                },

            },


            // Specify validation error messages
            messages: {

                premier:"<spring:message code="label.Silvousplatremplirechamp"/>",
                expedition:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                dernier :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                destination_final: "<spring:message code="label.Silvousplatremplirechamp"/>",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formproducteur']").validate({
            rules: {
                Nom_fr : {
                    required: true,
                },
                contact_fr : {
                    required: true,
                },
                tel:{
                    required: true,
                },
                adresse_fr:{
                    required:true,
                },
                mail:{
                    required: true,
                },




            },


            // Specify validation error messages
            messages: {



                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                Nom_fr:"<spring:message code="label.Silvousplatremplirechamp"/>",
                contact_fr:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplatremplirechamp"/> ",







            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formeliminateur']").validate({




            // Specify validation rules
            rules: {


                Nom_fr : {
                    required: true,
                },
                contact_fr : {
                    required: true,
                },
                idf :{
                    required:true,
                },
                tel:{
                    required: true,
                },
                fax:{
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },
                adresse_fr:{
                    required:true,
                },
                mail:{
                    required: true,
                },




            },


            // Specify validation error messages
            messages: {



                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                Nom_fr:"<spring:message code="label.Silvousplatremplirechamp"/>",
                contact_fr:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                idf :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplatremplirechamp"/> ",







            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formnotif']").validate({




            // Specify validation rules
            rules: {


                nom : {
                    required: true,
                },
                personne : {
                    required: true,
                },
                code_nationalxd :{
                    required:true,
                },
                tel:{
                    required: true,


                },
                adresse:{
                    required:true,
                },
                courrier:{
                    required: true,
                },

                code_national_im :{
                    required: true,
                },
                codece :{
                    required: true,
                },
                etat :{
                    required: true,
                },
                num_notification :{
                    required: true,
                },
                producteur_text :{
                    required: true,
                },
                quantite :{
                    required: true,
                },




            },


            // Specify validation error messages
            messages: {



                courrier: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                nom:"<spring:message code="label.Silvousplatremplirechamp"/>",
                personne:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                code_nationalxd :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                code_national_im :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                codece :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                etat :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                num_notification :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                producteur_text :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                quantite :"<spring:message code="label.Silvousplatremplirechamp"/> ",










            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formimportateur']").validate({




            // Specify validation rules
            rules: {


                Nom_fr : {
                    required: true,
                },
                contact_fr : {
                    required: true,
                },
                idf :{
                    required:true,
                },
                tel:{
                    required: true,
                },
                fax:{
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },
                adresse_fr:{
                    required:true,
                },
                mail:{
                    required: true,
                },
                qualite :{
            required: true,
                  },











            },


            // Specify validation error messages
            messages: {



                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/> ",
                Nom_fr:"<spring:message code="label.Silvousplatremplirechamp"/>",
                contact_fr:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                idf :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                qualite:"<spring:message code="label.Silvousplatremplirechamp"/> ",











            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
    /*$(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formautorite']").validate({




            // Specify validation rules
            rules: {


                tel:{
                    required: true,
                    number : true,
                    minlength:10
                },
                fax:{
                    required: true,
                    number : true,
                    minlength:10
                },
                adresse:{
                    required:true,
                },
                denomination :{
                    required:true,
                },
                email:{
                    required: true,
                },











            },


            // Specify validation error messages
            messages: {



                email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                adresse :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                denomination :"<spring:message code="label.Silvousplatremplirechamp"/> ",











            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });*/

    $(function() {
        $("form[name='formautorite']").validate({
            rules: {
                tel:{
                    required: true,
                },
                fax:{
                    required: true,
                    number : true,
                    minlength:10
                },
                adresse:{
                    required:true,
                },
                denomination :{
                    required:true,
                },
                email:{
                    required: true,
                },
                poste:{
                    required: true,
                },
                pays:{
                    required: true,
                },
            },
            messages: {
                email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                adresse :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                denomination :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                poste :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                pays :"<spring:message code="label.Silvousplatremplirechamp"/> "
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });

    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='zone_form1']").validate({
            rules: {
                nom_fr : {
                    required: true,
                },
                contact_fr : {
                    required: true,
                },
                idf :{
                    required:true,
                },
                tel:{
                    required: true,

                },
                fax:{
                    required: true,

                },
                adresse_fr:{
                    required:true,
                },
                mail:{
                    required: true,
                },
            },
            messages: {
                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/> ",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                nom_fr:"<spring:message code="label.Silvousplatremplirechamp"/>",
                contact_fr:"<spring:message code="label.Silvousplatremplirechamp"/> ",
                idf :"<spring:message code="label.Silvousplatremplirechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplatremplirechamp"/> ",

            },
            submitHandler: function(form) {
                form.submit();
            }


        });



    });

    function getOptionByFilter1(val, table, select_id) {
        alert_error_disabled("Select[name=classification_id]");
        alert_error_disabled("Select[name=code_id]");
        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" dir="ltr" value=""><spring:message code="option.Choisir"/></option>');

            $.each(data, function (i, v) {
                //console.log("data : ", $(data));
                //console.log("v : ", $(v));
                //$("#" + select_id).prepend(new Option(v[1], v[0]));
                $("#" + select_id).append('<option dir="ltr" value="'+v[0]+'">'+v[1]+'</option>');
            })


            if ($(data).length == 1) {
                $.each(data, function (i, v) {
                    $("#" + select_id)
                        .empty()
                        .append('<option  selected="selected" dir="ltr" value="'+v[0]+'">'+v[1]+'</option>');
                })

            }

            $("#" + select_id).trigger("change");
        })
        ;
    }

    function delete_port(id, id_name) {
        var id_notif = $("#" + id_name).val();
        $.ajax({
            url: '/api/deletePortNotif/' + id_notif + '/' + id,
            type: 'POST',
            data: {},
        })
            .done(function (data) {

                    swal({
                        title: "<spring:message code="label.suppression"/>",
                        text: "<spring:message code="label.Leportasupprimavecsuccs"/>",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "<spring:message code="label.OK"/> ",
                        html: false
                    },
                    function () {
                        $("#row_from_port").html(data);
                        $("#trr_"+id).hide();
                    });

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function validTransporteur(btn,id,type){
        if(type==="ZF" || type=="ET" || type==="XD"){
            var tr= $("#rowTransporteur tr").length;
            if (tr===0) {

                swal({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "<spring:message code="label.Vousdevezajouteraumoinuntransporteur"/>",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "<spring:message code="label.OK"/> ",
                    html: false
                });
                return false;
            }
            openCity1(btn,id);
        }
        else{
            openCity1(btn,id);
        }
    }

    /*function validerTr_I(btn,id){

            /!*var tr= $("#trI tr").length;
            if (tr===0) {

                swal({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "<spring:message code="label.Vousdevezajouteraumoinuntransporteur"/>",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "<spring:message code="label.OK"/> ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
                return false;
            }*!/
            openCity1(btn,id);
    }*/

    function validerPort(btn,id){

        var tr= $("#tbody_it tr").length;
        if (tr===0) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Vousdevezajouteraumoinunport"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }
        openCity1(btn,id);
    }
    function validerTrN(btn,id){

        var tr= $("#tbodyTransporteur tr").length;
        if (tr===0) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Vousdevezajouteraumoinuntransporteur"/>",
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }
        openCity1(btn,id);
    }

    function validerAutorite(form,autorite,btn,id){

        var tr= $("#trAutorite tr").length;
        /*if (tr===0) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Vousdevezajouteraumoinunautorite"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
            return false;
        }*/
        addObject_step(form,autorite,btn,id);
    }

    function validerAutorite2(from,table,url,tap,id_obj){

        var tr= $("#trAutorite tr").length;
        /*if (tr===0) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Vousdevezajouteraumoinunautorite"/>", 'error');
            return false;
        }*/
        updateObject(from,table,url,tap,id_obj);
    }
    $(document).ready(function () {
        document.getElementById('premierdepart').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    })
    function setDateFin(){
        var date = $("#premierdepart").val();
        var x = new Date(date);
        document.getElementById('dernierdepart').min = new Date(x.getTime() - x.getTimezoneOffset() * 60000).toISOString().split("T")[0];
    }

    function onchangerAutre(){
        debugger;
        var input = document.getElementById('autre');
        var caracteristiquephysique = document.getElementById('caracteristiquephysique');
        if (caracteristiquephysique.options[caracteristiquephysique.selectedIndex].value == 5) {
            input.style.visibility = 'visible';
        } else {
            input.style.visibility = 'hidden';
        }
    }
    window.onload = function() {
        debugger;
        var input = document.getElementById('autre');
        input.style.visibility = 'hidden';
        var caracteristiquephysique = document.getElementById('caracteristiquephysique');
        if (caracteristiquephysique.options[caracteristiquephysique.selectedIndex].value == 5) {
            input.style.visibility = 'visible';
        } else {
            input.style.visibility = 'hidden';
        }
    }

    function test(val){
        if(parseInt(val)>1){
            $("#unique").prop("disabled","true")
            $("#unique").removeAttr("checked")
            $("#multiple").prop("checked","checked")
        }
        else{
            $("#unique").removeAttr("disabled")
            $("#unique").prop("checked","checked")
            $("#multiple").removeAttr("checked")
        }
    }
</script>


<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
