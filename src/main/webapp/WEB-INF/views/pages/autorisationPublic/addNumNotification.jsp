<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar' }">
        <c:set var="dd" value="data-dir='RTL'"/>
        <style>.select2-results__option{text-align:right} </style>
    </c:when>
    <c:otherwise>
        <c:set var="dd" value="data-dir='LTR'"/>
        <style>.select2-results__option{text-align:left} </style>
    </c:otherwise>
</c:choose>


<style>
    .card-body{
          ${pageContext.response.locale=='ar'?'border-right: 8px solid #5d6974;':'border-left: 8px solid #5d6974;'}
    }
    * {
        box-sizing: border-box
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
        ${pageContext.response.locale=='ar'?'left':'right'}: 23px !important;
        top: 162px;
        direction: ltr !important;
    }

    @media (max-width: 768px) {
        .breadcrumb-item a{
            font-size: 7pt !important;
        }
        .mydrop{
            ${pageContext.response.locale=='ar'?'left:23px !important;':'right:0px !important'};
            top: 200px;
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
<div class="col-12 p-4">
    <section class="services-section mt-5" style="background-color: white;margin-top: 2%; ${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">

        <a href="/api/ListeAutorisation/${type }/n" class="btn btr " style="background-color: #336c4e;margin:12px;color:white"><span class=" fa fa-arrow-down"></span>   <spring:message code="label.numero"/></a>
        <%--<a href="/api/addNumNotification" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>--%>
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn " style="background-color: #336c4e;color:white"><spring:message code="label.Depot"/> </a>

        <hr>

        <div class="grid-margin stretch-card cardstatistic" id="pagereload">
            <c:choose>
                <c:when test="${empty notif}">
                    <c:set var="disabled" value="disabled"/>
                </c:when>
                <c:otherwise>
                    <c:set var="disabled" value=""/>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/ZF')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="استيراد منطقة خالية من النفايات"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Importation des déchets d'une zone franche"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/addNumNotification/XD')}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="تصدير المخلفات الخطرة"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Exportation des déchets dangereux "/>
                        </c:otherwise>
                    </c:choose>
                </c:when>



                <c:otherwise>
                    <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                </c:otherwise>
            </c:choose>
            <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="width: 100%!important;margin-top: 5rem">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/" ><spring:message code="label.Accueil"/> </a></li>
                    <li class="breadcrumb-item active" aria-current="page"> <a href="/api/checkUserHasCollecte/${type}" > ${p_page} </a></li>
                    <div class="mydrop">
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                <img src="${pageContext.request.contextPath}/assets/images/question.png" width="30" class="img-fluid img-circle">
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()" download><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/zone%20franche/${pageContext.response.locale=='ar'?'رقم%20الإخطار%20.pdf':'numéro%20de%20notification.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
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
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 mb-sm-3 ${pageContext.response.locale=='ar'?'pl-3 pr-3':''}">
                    <button class="tablinks btn-primary btn" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" onclick="openCity(event, '1')" id="defaultOpen">1. <spring:message code="label.Demandedenumerodenotification"/> </button>
                    <button class="tablinks btn-primary btn my_tab " style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" ${disabled} id="Btn2" onclick="openCity(event, '2')">2.
                        <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/> </c:if>
                        <c:if test="${!type.equals('ZF')}"><spring:message code="label.ExportateurNotifiant"/> </c:if>
                    </button>
                    <button disabled class="tablinks btn-primary btn my_tab " style="background-color: #BA9F33 !important; text-align: ${pageContext.response.locale=='ar'?'right':'left'}" ${disabled} id="Btn3" onclick="openCity(event, '3')">3. <spring:message code="label.Recapitulation"/> </button>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 mt-2">
                    <div class="row pb-2">
                        <div id="1" class="tabcontent col-12 pr-2 mt-1">
                            <h4 class="titre_abs "><spring:message code="label.Demandedenumerodenotification"/> </h4>
                            <input type="hidden" id="id_notification" name="id_notification" value="${notif.id_notification}">
                            <form id="formnotif" name="formnotif">

                                <input type="hidden" name="compte_id" value="${user.compteId}">

                                <c:choose>
                                    <c:when test="${id>0}">
                                        <input type="hidden" name="id_notif_original" value="${notification.id_notif_original}">
                                        <input type="hidden" name="id_statut" value="${notification.statut.id_statut_projet}">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="hidden" name="id_notif_original" value="0">
                                        <input type="hidden" name="id_statut" value="91">
                                    </c:otherwise>
                                </c:choose>

                                <div class="row m-0 p-0 mt-5">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Classificationdesdechet"/> <sup class="text-danger">*</sup> </label>
                                            <select name="classification_id" id="Classification" required ${dd}
                                                    onchange="getOptionByFilter1(' id_Classification = '+this.value,' id_code,nom_fr,nom_ar  from code ','code')"
                                                    class="form-control select2 bg_error" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${classification}" var="t">
                                                    <option <c:if test="${notif.classification.id_classification== t[0]}"> selected </c:if>
                                                            value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <p class="m-0">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Operation"/> </label>
                                            </p>

                                            <div class="card w-100 mb-0">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-12 col-sm-12 border-right">
                                                            <div class="form-check">
                                                                <input checked class="form-check-input" type="radio"
                                                                       id="valorisationRadio" style="margin-top: -1px"
                                                                <c:if test="${notif.operation== 'valorisation'}">
                                                                       checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'valorisation':'تقييم'}">


                                                                <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                    <spring:message code="label.valorisation"/>
                                                                </label>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-6 col-md-12 col-sm-12 border-left">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                       id="traitementRadio" style="margin-top: -1px"
                                                                <c:if test="${notif.operation== 'traitement'}">
                                                                       checked  </c:if> name="Operation" value="${pageContext.response.locale!='ar'?'traitement':'علاج'}">

                                                                <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
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
                                        <div class="form-group select_test">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.code"/> <sup class="text-danger">*</sup> </label>
                                            <select name="code_id" id="code" required ${dd}
                                                    onchange="getOptionByFilter1(' id_Code = '+this.value,' id_Code,nom_ar  from Code ','id_type')"
                                                    class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:if test="${notif!=null}">
                                                    <option dir="ltr" value="${notif.code.id_code }" selected>${notif.code.nom_fr}</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.typededechet"/> <sup class="text-danger">*</sup> </label>
                                            <select ${dd} onchange="alert_error_disabled('#id_type');" id="id_type" required class="form-control select2" data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>
                                                <c:if test="${notif!=null }">
                                                    <option value="${notif.code.id_code }" selected>${notif.code.nom_ar}</option>
                                                </c:if>
                                            </select>
                                        </div>

                                    </div>
                                </div>

                                <div class="row m-0 p-0 mt-2">

                                    <%--QUANTITE--%>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Quantite"/> <sup class="text-danger">*</sup>  </label>
                                            <input min="0" type="text"
                                                   oninput="this.value = this.value.replace(/[^0-9\.]/g, '').split(/\./).slice(0, 2).join('.')"
                                                   required name="quantite" value="${notif.quantite}" id="quantite"
                                                   class="form-control">
                                            <input value="${type}" type="hidden"  name="zf_et" class="form-control">
                                        </div>
                                    </div>

                                        <%--UNITE--%>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.unite"/> <sup class="text-danger">*</sup> </label>
                                                <select ${dd} onchange="alert_error_disabled('#unite');" name="unite_id" required id="unite" class="form-control select2" data-width="100%">
                                                    <option value=""><spring:message code="option.Choisir"/></option>
                                                    <c:forEach items="${unite_id}" var="t">
                                                        <option  <c:if test="${notif.unite.unite_id== t[0]}"> selected </c:if>
                                                                value="${t[0] }">${pageContext.response.locale=='ar'?t[2]:t[1]}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                </div>
                                <div class="row m-0 p-0 mt-2">
                                    <%--ZONE FRAN--%>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group select_test" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <c:choose>
                                                    <c:when test="${type=='ZF'}">
                                                        <spring:message code="label.Zonnefranche"/> <sup class="text-danger">*</sup>
                                                    </c:when>
                                                    <c:when test="${type=='XD'}">
                                                        <spring:message code="label.PaysEtranger"/> <sup class="text-danger">*</sup>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <spring:message code="label.pays"/>
                                                    </c:otherwise>
                                                </c:choose>


                                            </label>

                                            <select ${dd} onchange="alert_error_disabled('#Zone_Franche');" name="${type=='ZF'?'idzonne_franche':'id_pays' }" required id="Zone_Franche" class="form-control select2"
                                                          data-width="100%">
                                                <option value=""><spring:message code="option.Choisir"/></option>

                                                <c:if test="${type=='ZF'}">
                                                    <c:forEach items="${zonnefranche}" var="t">
                                                        <option  <c:if test="${notif.zonneFranche.id_zonnefranche== t[0]}"> selected </c:if>
                                                                value="${t[0]}">${pageContext.response.locale=='ar'?t[2]:t[1]}</option>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${type!='ZF'}">
                                                    <c:forEach items="${zonnefranche}" var="t">
                                                        <option  <c:if test="${notif.pays.paysId== t[0]}"> selected </c:if>
                                                                value="${t[0]}">${pageContext.response.locale=='ar'?t[2]:t[1]}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0 p-0 mt-2">

                                    <div class="col-md-6 col-sm-12">

                                    </div>
                                </div>
                                <input type="hidden" name="val_ou_trait" id="val_ou_trait">
                                <div class="row justify-content-center m-0 p-0 mt-2">

                                    <div class="col-md-4 col-sm-6" style="text-align: center">
                                        <c:if test="${id==0}">
                                            <button type="button" id="Suivant"
                                                <%--onclick="addObject_step('formnotif','notification','2','0')"--%>
                                                    onclick="verifier_champ_vide('formnotif','notification','','id_notification','2')"
                                                    class="btn btn-success btn-block mt-2 mb-4"><spring:message code="button.Suivant"/>
                                            </button>
                                        </c:if>
                                        <c:if test="${id>0}">
                                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivant"
                                                    onclick="verifier_champ_vide('formnotif','notification','','id_notification','2')" class="btn btn-success btn-block mt-2 mb-4"><spring:message code="button.Suivant"/>
                                            </button>

                                        </c:if>
                                    </div>


                                </div>
                            </form>


                        </div>
                    </div>
                    <div class="row pb-2">
                        <div id="2" class="tabcontent col-12 pr-2">

                            <h4 class="titre_abs ">
                                <c:if test="${type.equals('ZF')}"><spring:message code="label.ImportateurN"/> </c:if><c:if test="${!type.equals('ZF')}"><spring:message code="label.ExportateurNotifiant"/> </c:if>
                            </h4>
                            <form id="formimportateur" name="formimportateur">
                                <div class="row m-0 p-0 mt-5">

                                    <input type="hidden" id="notification_id" name="notification_id" value="${notif.importateur.notification_id}">
                                    <div class="col-md-6 col-sm-12 ">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> Nom de la société </label>
                                            <input type="text" name="Nom_fr" value="${notif.importateur.nom_fr}" id="Nom_fr" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 ">
                                        <div class="form-group" style="text-align: right;">
                                            <label dir="rtl">إسم الشركة </label>
                                            <input type="text" name="Nom_ar" id="Nom_ar" value="${notif.importateur.nom_ar}" class="form-control" dir="rtl" >
                                        </div>
                                    </div>

                                </div>

                                <c:if test="${type=='XD'}">
                                    <div class="row m-0 p-0 ">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <p class="m-0">
                                                    <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.personneacontacter"/> </label>
                                                </p>

                                                <div class="card w-100 mb-0">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 border-right">
                                                                <div class="form-check">
                                                                    <input checked class="form-check-input" type="radio"
                                                                           id="maleRadio"
                                                                    <c:if test="${notif.importateur.genre== 'Monsieur'}">
                                                                           checked  </c:if> name="genre" value="Monsieur">

                                                                    <label class="form-check-label" style="padding-right: ${pageContext.response.locale=='ar'?'20px':''}">
                                                                        <spring:message code="label.Monsieur"/>
                                                                    </label>
                                                                </div>

                                                            </div>


                                                            <div class="col-md-6 col-sm-12 border-right">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="radio"
                                                                           id="femaleRadio"
                                                                    <c:if test="${notif.importateur.genre== 'Madame'}">
                                                                           checked  </c:if> name="genre" value="Madame">

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
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Qualite"/> </label>
                                                <input type="text" name="qualite" value="${notif.importateur.qualite}" id="qualite" class="form-control" required>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 ">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.NometPrenom"/> </label>
                                                <input type="text" required
                                                       name="contact_fr" id="represent_entreprise" value="${notif.importateur.contact_fr}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="row m-0 p-0 ">
                                    <c:if test="${type!='XD'}">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.personneacontacter"/></label>
                                                <input type="text" required
                                                       name="contact_fr" id="represent_entreprise" value="${notif.importateur.contact_fr}" class="form-control">
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.identifiantfiscal"/> </label>
                                            <input type="text" name="idf" id="num_patente" value="${notif.importateur.idf}" class="form-control" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row m-0 p-0">

                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Adresse"/> </label>
                                            <textarea type="text" name="adresse_fr" id="adresse" required
                                                      class="form-control">${notif.importateur.adresse_fr}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Telephone"/></label>
                                            <input type="text" name="tel" id="telephone" value="${notif.importateur.tel}" required
                                                   class="form-control">
                                        </div>
                                    </div>


                                </div>


                                <div class="row m-0 p-0">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Fax"/> </label>
                                            <input type="text" name="fax" id="fax" value="${notif.importateur.fax}" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"> <spring:message code="label.Email"/> </label>
                                            <input type="email" name="mail" id="emailentrprs" value="${notif.importateur.mail}" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center mt-2 mb-4">
                                    <div class="col-md-4 mt-1 col-sm-6">
                                        <button type="button"
                                                onclick="openCity2('#defaultOpen', '1')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-lg-4 col-md-6 mt-1 col-sm-6">
                                        <button type="button"
                                                onclick="addObject2('formimportateur','importateurnotifiant','${type}','3')"
                                                class="btn btn-success btn-block"><spring:message code="label.Afficherlerecapitulatif"/>
                                        </button>
                                    </div>
                                </div>


                                <div class="d-flex justify-content-center mb-4">

                                </div>
                            </form>

                        </div>
                    </div>

                    <div class="row pb-2">
                        <div id="3" class="tabcontent col-12 pr-2 mt-1">
                            <h4 class="titre_abs "><spring:message code="label.Recapitulation"/> </h4>
                            <div id="recapNum"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-4 mt-1 col-sm-6">
                                    <button type="button"
                                            onclick="openCity2('#Btn2','2')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-4 mt-1 col-sm-6">

                                    <button type="button"
                                            onclick="verif_champs('${type}','id_notification')"
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


<script>
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
    document.getElementById("defaultOpen").click();


    function getOptionByFilter(val, table, select_id) {

        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" value=""><spring:message code="option.Choisir"/> </option>');
            $.each(data, function (i, v) {
                $("#" + select_id).prepend(new Option(v[1], v[0]));
            })
            if($(data).length==1){
                $("#"+select_id +" option").eq(0).prop("selected",true);
            }
        })
        ;
    }
    // validation email

    function isEmail() {
        alert("hh");
        var email="h";
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
        alert(regex.test(email));

    }
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formimportateur']").validate({




            // Specify validation rules
            rules: {
                mail: {
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
                Nom_fr : {
                    required: true,
                },
                contact_fr :{
                    required:true,
                },
                idf:{
                    required:true,
                },
                adresse_fr :{
                    required:true,
                },
                qualite :{
                    required: true,
                },



            },


            // Specify validation error messages
            messages: {
                mail: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/> ",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",
                Nom_fr:"<spring:message code="label.Silvousplaitremplirlechamp"/> ",
                contact_fr:"<spring:message code="label.Silvousplaitremplirlechamp"/> ",
                idf :"<spring:message code="label.Silvousplaitremplirlechamp"/> ",
                adresse_fr :"<spring:message code="label.Silvousplaitremplirlechamp"/> ",
                qualite:"<spring:message code="label.Silvousplatremplirechamp"/> ",





            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
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
                .append('<option selected="selected" dir="ltr" value=""><spring:message code="option.Choisir"/> </option>');

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
    function verifier_champ_vide(form,table,url,nameId,btn){
        alert_error("Select[name=classification_id]");
        alert_error("Select[name=code_id]");
        alert_error("#Zone_Franche");
        alert_error("#id_type");
        alert_error("#unite");
        alert_error("#unite");

        var code=$("#code").val();

        var find = false;
        $(".select_test").each(function(indx,elem){
            if($(elem).hasClass("bg_errorSlecte") && !find){
                find=true;
            }
        })

        var qte = $("#quantite").val();
        if($.trim(qte)===""|| !$.isNumeric(qte) || qte==null || qte<=0){

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Laquantitestincorrecte"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>",
                html: false
            });
            return false
        }

        if (find){

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Unouplusieurchampssontvides"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>",
                html: false
            });
            return false;
        }
        var code=$("#code").val();
        var Classification = $("#Classification").val();
        $.ajax({
            type: "GET",
            url: "/api/getTabtransporteur/" + code,
            data: {},
            success: function (response) {
                if(Classification==1){
                    if(response==="1"){
                        addObjectGeneral(form,table,url,nameId,btn);
                        return true;
                    }else{

                        swal({
                            title: "<spring:message code="label.Avertissement"/>",
                            text: "<spring:message code="label.aucuntransporteurnetraitedanscetypedesdechets"/>",
                            type: "error",
                            showCancelButton: false,
                            confirmButtonColor: "#256144",
                            confirmButtonText: "<spring:message code="label.OK"/>",
                            html: false
                        });
                        return false;
                    }
                }else{
                    addObjectGeneral(form,table,url,nameId,btn);
                    return true;
                }

            },
            error: function () {

            }
        });
    }


    function addObject2(from,table,url,tap) {
        var id =  $("#id_notification").val();
        id = id==""?"0":id;
        var se = $("#"+from).serializeObject();
        if ($("form[name='"+from+"']").valid()) {
            $.ajax({
                type: "POST",
                url: "/api/add_notification/" + table + "/" + id,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(se),
                success: function (response) {
                    searchByDate1(id, url);
                    openCity('Btn' + tap, tap);
                },
                error: function (response) {

                    alert('Erreur ajout non effectue');

                }
            });
        }

    }

    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formnotif']").validate({




            // Specify validation rules
            rules: {
                producteur_text: {
                    required: true
                },

            },


            // Specify validation error messages
            messages: {
                producteur_text: "<spring:message code="label.Silvousplaitremplirleproducteur"/>",


            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });

    });

    function verif_champs(type, id_name) {
        if(event!=null)
            event.preventDefault();

        var id = $("#"+id_name).val();
        $.ajax({
            type: "POST",
            url: "/api/changerStatusNumNotification/"+id,
            contentType: 'application/json; charset=utf-8',
            data:  {},
            success: function (response) {
                load_file_recu(id);
                swal({
                    title: "<spring:message code="label.VotreNumerodenotificationestgenere"/> ",
                    text: "<spring:message code="label.Voulezvouscontinuer"/> ",
                    type: "success",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00695c',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '<spring:message code="label.continuer"/>',
                    cancelButtonText: '<spring:message code="label.quitter"/> ',

                }, function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "/api/addDemandNotification/" + id + "/" + type + "/N"
                    } else {
                        window.location.href = "/api/checkUserHasCollecte/" + type;
                    }
                });
            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });
        }

    function load_file_recu(id_notif){
        url = "/api/generate_recap_Num/"+id_notif;
        window.location.href = url;
    }

    function searchByDate1(id,type) {
        $.ajax({
            url: "/api/getnotifByIdNum/"+type+"/"+id,
            type: "GET",
            data: {},
            success: function (response) {
                $("#recapNum").html(response);
                //document.getElementById("EnregistrerZF").disabled=false;
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }


</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
