<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    table.table-bordered.dataTable th, table.table-bordered.dataTable td {
        font-size: 13px;
    }

    .display-grid {
        display: grid;
    }


    .badge-danger {
        color: #fff !important;
        background-color: #dc3545 !important;
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
<div class="container-fluid page-body-wrapper" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section"
                     style="margin-top: 2%">
                <div class="col-12 mb-4">
                    <c:choose>
                        <c:when test="${type=='IT'}">
                            <spring:message code="label.Installationdetraitementdesdechets" var="p_page"/>
                        </c:when>
                        <c:when test="${type=='CT'}">
                            <spring:message code="label.Collectetransportdesdechetsdangereux" var="p_page"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                        </c:otherwise>
                    </c:choose>

                    <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                            <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                            <div class="mydrop">
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                        <img src="${pageContext.request.contextPath}/assets/images/question.png" width="30" class="img-fluid img-circle">
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()"><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Collecte-Transport%20des%20dechets%20dangereux/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </ol>
                    </nav>
                    <div id="light">
                        <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
                        <video id="VisaChipCardVideo" width="600" controls>
                            <source src="${pageContext.request.contextPath}/assets/video/add%20demande%20collect.mp4" type="video/mp4">
                            <!--Browser does not support <video> tag -->
                        </video>
                    </div>

                    <div id="fade" onClick="lightbox_close();"></div>
                </div>
                <div class="col-lg-12 grid-margin stretch-card cardstatistic"
                     id="pagereload">
                    <c:choose>
                        <c:when test="${(empty collect) || (typeRenouv=='R')}">
                            <c:set var="disabled" value="disabled"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="disabled" value=""/>
                        </c:otherwise>
                    </c:choose>

                    <div class="row p-0 m-0" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="col-md-4 col-sm-12">
                            <div class="">
                                <button class="tablinks  btn-primary btn"
                                        onclick="openCity(event, '1')" id="defaultOpen" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">1. <spring:message code="label.Informationdudemandeur"/> </button>
                                <button class="tablinks btn-primary btn my_tab2" id="Btn2'"  <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '2')"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">2. <spring:message code="label.DonneesurlesvehiculesA"/></button>
                                <button class="tablinks btn-primary btn my_tab3"  id="Btn3" <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '3')"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">3. <spring:message
                                        code="label.CatalogueA"/></button>
                                <button class="tablinks btn-primary btn my_tab4" id="Btn4" <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="openCity(event, '4')"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">4. <spring:message
                                        code="label.MespiecesA"/></button>
                                <button class="tablinks btn-primary btn my_tab5 montab" id="Btn5" <c:if test="${id==0}"> ${disabled}</c:if>
                                        onclick="verif_champs_recap('4','CT','id_collecte','5')" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">5. <spring:message code="label.Recapitulation"/></button>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-12 mt-2">
                            <div id="1" class="tabcontent mt-1">
                                <h4 class="titre_abs "><spring:message code="label.Informationdudemandeur"/> </h4>
                                <input type="hidden" name="id_collecte" value="${collect.id_collecte}" id="id_collecte">

                                <form id="formdemandeur" name="formdemandeur">
                                    <input type="hidden" name="id_compte" value="${user.compteId}">
                                    <c:choose>
                                        <c:when test="${(not empty collect) && collect.id_collecte!=0}">
                                            <input type="hidden" name="id_statut"
                                                   value="${(collect.statut.id_statut_projet==25 && typeRenouv=='N')?'19':collect.statut.id_statut_projet}">
                                            <input type="hidden" name="id_collecte_originale"
                                                   value="${collect.id_collecteOriginale}">
                                        </c:when>
                                        <c:otherwise>
                                            <%-- 1 == etat encours --%>
                                            <input type="hidden" name="id_statut" value="50">
                                            <input type="hidden" name="id_collecte_originale" value="0">
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>

                                        <c:when test="${typeRenouv=='R'}">
                                            <input type="hidden" name="type_renouvellement" value="2">
                                            <input type="hidden" name="delete_date_time" value="">
                                        </c:when>
                                        <c:when test="${typeRenouv=='AV'}">
                                            <input type="hidden" name="type_renouvellement" value="3">
                                            <input type="hidden" name="delete_date_time" value="">
                                        </c:when>
                                        <c:when test="${typeRenouv=='N'}">
                                            <c:choose>
                                                <c:when test="${(not empty collect) && collect.id_collecte!=0}">
                                                    <input type="hidden" name="type_renouvellement" value="${collect.typeRenouvellement.id_type_renouvellement}">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="hidden" name="type_renouvellement" value="1">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>
                                    <div class="row m-0 p-0 mt-3 " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >
                                        <c:if test="${typeRenouv=='R'}">
                                            <div class="col-md-12 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-6 col-sm-12 p-0 m-0">
                                                        <div class="form-group">
                                                            <label><spring:message
                                                                    code="label.NumdelaDemanderenouvellerA"/> </label>
                                                            <input value="${collect.id_collecte}" ${(not empty collect)?"disabled":""}
                                                                   class="form-control" type="text"
                                                                   onchange="getCollectRenouveller(this)">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.RaisonsocialeA"/> </label>
                                                <input
                                                        value="${collect.raison}" type="text"
                                                ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                        name="raison" id="raison" class="form-control">
                                            </div>
                                        </div>


                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.identifiantfiscal"/> </label> <input value="${collect.idfiscale}"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                                                                                        type="text" name="idfiscale" id="idfiscale"
                                                                                                                        class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row m-0 p-0 " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.CINA"/> </label> <input
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.cin}" type="text"
                                                    name="cin" id="cin"
                                                    class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.RepresantantA"/> </label> <input
                                                    type="text"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.demandeur_Nom}" name="demandeur_Nom"
                                                    id="demandeur_Nom" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.AdresseA"/></label> <textarea type="text"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                                                                                  name="demandeur_adresse" id="demandeur_adresse"
                                                                                                                  class="form-control">${collect.demandeurAdresse}</textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.TelephoneA"/> </label> <input
                                                    type="tel"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    value="${collect.demandeurTel}" name="demandeur_tel"
                                                    id="demandeur_tel" class="form-control">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row m-0 p-0" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label><spring:message code="label.FaxA"/> </label> <input
                                                    value="${collect.demandeurFax}"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    type="text" name="demandeur_fax" id="demandeur_fax"
                                                    class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 pr-sm-3 pr-0 pl-sm-3 pl-0">
                                            <div class="form-group">
                                                <label> <spring:message code="label.EmailA"/> </label> <input
                                                    value="${collect.demandeurEmail}"
                                            ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                    type="email" name="demandeur_email" id="demandeurEmail"
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
                                                                test="${collect.region.regionId== t[0]}"> selected </c:if>
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
                                                    <c:if test="${collect.prefecture!=null }">
                                                        <c:forEach items="${collect.region.prefecture}" var="t">
                                                            <option <c:if
                                                                    test="${collect.prefecture.id_prefecture== t.id_prefecture}"> selected </c:if> value="${t.id_prefecture }">${pageContext.response.locale!='ar'?t.nom_fr:t.nom_ar }</option>
                                                        </c:forEach>
                                                    </c:if>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row justify-content-center mb-4">
                                        <div class="col-sm-3">
                                            <c:choose>
                                                <c:when test="${typeRenouv=='R'}">
                                                    <button type="button" id="Suivant"
                                                            onclick="updateGeneral('formdemandeur','collectetransporteur','2',${id},'id_collecte','non')"
                                                            class="btn btn-success mt-2 mb-4 btn-block">
                                                        <spring:message code="label.SuivantA"/> </label>
                                                            <%-- onclick="addObjectGeneral('formnotif','installation','','id_installation','2')" class="btn btn-success">Suivant --%>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${id==0}">
                                                        <button type="button" id="Suivant"
                                                                onclick="addObjectGeneral('formdemandeur','collectetransporteur','','id_collecte','2')"
                                                                class="btn btn-success mt-2 mb-4 btn-block">
                                                            <spring:message code="label.SuivantA"/>
                                                                <%-- onclick="addObjectGeneral('formnotif','installation','','id_installation','2')" class="btn btn-success">Suivant --%>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${id!=0}">
                                                        <button type="button" id="Suivant"
                                                                onclick="updateGeneral('formdemandeur','collectetransporteur','2',${id},'id_collecte','non')"
                                                                class="btn btn-success  mt-2 mb-4 btn-block">
                                                            <spring:message code="label.SuivantA"/></button>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>

                                    </div>
                                </form>

                            </div>
                            <div id="2" class="tabcontent mt-1">
                                <h4 class="titre_abs "><spring:message code="label.DonneeA"/></h4>
                                <form id="formvehicule" name="formvehicule">
                                    <div class="row m-0 p-0 mt-3">
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.NombredeconteneursA"/> </label>
                                                    <input
                                                            class="form-control" lang="en" type="number" onkeyup="setMinValue('nombre_conteneur',this.value)"
                                                            name="nombre_conteneur" id="nombre_conteneur"
                                                            value="${( (not empty collect.nombre_conteneur) && collect.nombre_conteneur!=0)?collect.nombre_conteneur:0 }">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                                <div class="row p-0 m-0" >
                                    <div class="col-12 p-0 m-0" id="my_table" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">


                                       <jsp:include page="tableandFormVehicule.jsp"/>

                                    </div>

                                </div>



                                <div class="row justify-content-center  mb-5 mt-3">
                                    <div class="col-md-4 mt-1 col-sm-4">
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button"
                                                    onclick="openCity2('#defaultOpen', '1')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                    </div>

                                    <div class="col-md-4 mt-1 col-sm-4">
                                        <c:if  test="${collect.statut.id_statut_projet==42 && empty collect.codeTmp && cpt!=0}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','4',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet==42 && empty collect.codeTmp && cpt==0}">
                                            <a type="button"
                                               onclick="changerStatutCT()";
                                               class="btn btn-success btn-block">Enregistrer</a>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet==42 && not empty collect.codeTmp && cpt!=0}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','3',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                        <c:if  test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button"
                                                    onclick="check_vehicule_ok('formvehicule','collectetransporteur','3',${id},'id_collecte','non')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="label.SuivantA"/></button>
                                        </c:if>
                                    </div>



                                </div>

                            </div>
                            <div id="3" class="tabcontent mt-1">
                                <h4 class="titre_abs "><spring:message code="label.CatalogueA"/></h4>
                                <form id="formnotif" name="formnotif">
                                    <div class="row p-0">
                                        <div class="col-sm-8" id="zone_tableau" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <table class="table table-striped" data-page-length="8">
                                                <thead>
                                                <tr>
                                                    <th scope="col" style="min-width: 100px"><spring:message code="label.CodeA"/></th>
                                                    <th scope="col"><spring:message code="label.TypeA"/></th>
                                                    <th scope="col"><spring:message code="label.ValiderA"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${collect.statut.id_statut_projet!=42}">
                                                    <c:forEach items="${code}" var="c">

                                                        <c:set var="checked" value=""/>
                                                        <c:forEach items="${collect.code}" var="code_colle">
                                                            <c:if test="${code_colle.id_code==c.id_code}">
                                                                <c:set var="checked" value="checked disabled"/>
                                                            </c:if>
                                                        </c:forEach>


                                                        <tr>
                                                            <td>${c.nom_fr }</td>
                                                            <td>${c.nom_ar }</td>
                                                            <td><input ${checked} class="h-15" type="checkbox"
                                                                                  id="id-${c.id_code }"
                                                                                  onchange="addCodeCT('id_collecte','${c.id_code}','add')">
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${collect.statut.id_statut_projet==42}">
                                                    <c:forEach items="${collect.code}" var="c">
                                                        <c:set var="bg" value=""/>
                                                        <c:forEach items="${collect.codeTmp}" var="code_colle">
                                                            <c:if test="${code_colle.id_code==c.id_code}">
                                                                <c:set var="bg" value="bg-danger"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <tr class="${bg}" id="tr-${c.id_code}">
                                                            <td>${c.nom_fr }</td>
                                                            <td>${c.nom_ar }</td>
                                                            <td>
                                                                <input checked disabled class="h-15" type="checkbox"
                                                                       id="id-${c.id_code }">
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-sm-4" id="zone_list_tab">
                                            <div class="d-block h-100 my_rows" id="my_rows">
                                                <c:forEach items="${collect.code}" var="code_colle" varStatus="index">
                                                    <div class="row p-0 m-0" style="background-color: ${index.index%2==0?'lightgrey':''}">
                                                        <div class="col-8"> ${code_colle.nom_ar} </div>
                                                        <div class="col-4 p-2 text-center">
                                                            <button class="btn btn-success rounded-circle"
                                                                    onclick="addCodeCT('id_collecte','${code_colle.id_code}','delete')">
                                                                <span class="fa fa-times"></span></button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row justify-content-center  mb-5 mt-3">
                                        <div class="col-md-3 mt-1 col-sm-4">

                                            <c:if test="${collect.statut.id_statut_projet!=42}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="openCity2('#Btn2', '2')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="button.Precedent"/></button>
                                            </c:if>
                                            <c:if test="${collect.statut.id_statut_projet==42 && count!=0}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="openCity2('#defaultOpen', '2')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="button.Precedent"/></button>
                                            </c:if>

                                        </div>
                                        <div class="col-md-3 mt-1 col-sm-4">

                                            <c:if test="${collect.statut.id_statut_projet==42 && cpt!=0}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="openCity2('#Btn4', '4')"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="label.SuivantA"/></button>
                                            </c:if>
                                            <c:if test="${collect.statut.id_statut_projet!=42}">
                                                <button style="margin-top: 10px; margin-bottom: 10px;"
                                                        type="button"
                                                        onclick="check_Code_Valide()"
                                                        class="btn btn-success btn-block"><spring:message
                                                        code="label.SuivantA"/></button>
                                            </c:if>
                                            <c:if test="${collect.statut.id_statut_projet==42 && cpt==0}">
                                                <a style="margin-top: 10px; margin-bottom: 10px;"
                                                   type="button"
                                                   onclick="changerStatutCT()";
                                                   class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/> </a>
                                            </c:if>
                                        </div>


                                    </div>
                                </form>
                            </div>
                            <div id="4" class="tabcontent mt-1">
                                <h4 class="titre_abs "><spring:message code="label.mespieces"/></h4>
                                <p style="font-size: 11px; ${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <%--                            cette modification demande par Mr mhamdi le 25/06--%>
                                    <img src="/assets/images/warning.png" style="width: 40px;margin-left: 10px">
                                    <spring:message code="label.Vouspouvezimporterdesdocumentsscannesen"/>
                                </p>

                                <c:if test="${collect.statut.id_statut_projet==42}">
                                    <c:forEach items="${doc2}" var="dc">
                                        <c:if test="${dc.nom_ar!='oui'}">
                                            <div class="row justify-content-center">
                                                <div class="col-6 ml-3 mt-3  ">
                                                    <div class="${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}">
                                                        <div class="form-group">
                                                            <label class=""> ${pageContext.response.locale=='ar'?dc.docImport.nom_ar:dc.docImport.nom_fr } : </label>
                                                            <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                                <div class="upload">
                                                                    <input required
                                                                           onchange="addDocG(${dc.collecte.id_collecte},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport }','CT','','file-chosen_${dc.docImport.id_docImport}')"
                                                                           accept=".pdf" type="file"
                                                                           id="doc${dc.docImport.id_docImport}" class="actual-btn" hidden>
                                                                    <label class="uploadButton" for="doc${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>
                                                                    <span class="fileName" id="file-chosen_${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <a class="btn btn-success rounded file_existe" download href="/downloadFile/${fn:replace(dc.url,"/assets/myFile/","")}">
                                                        <i class="fa fa-upload " title="Télécharger le document"
                                                           style="margin:0 !important"></i> </a>
                                                </div>
                                                <div class="col-4" style="margin-top: 4.5rem !important;">
                                                    <span class="bg-danger" id="id${dc.id_listDocNotif }"> ${dc.nom_fr } </span>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${collect.statut.id_statut_projet!=42}">
                                    <c:forEach items="${doc}" var="dc">
                                        <div class="row justify-content-center">
                                            <div class="col-6 mt-3  ">
                                                <div class="form-group">
                                                    <div>
                                                        <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr} </label>
                                                        <div class="upload">
                                                            <input
                                                                ${((collect.statut.id_statut_projet==25) && (typeRenouv=='N'))?"disabled":""}
                                                                    required
                                                                    onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','CT','id_collecte','file-chosen_${dc.id_docImport}')"
                                                                    accept=".pdf" type="file"
                                                                    id="doc${dc.id_docImport}" class="actual-btn" hidden>
                                                            <label class="uploadButton" for="doc${dc.id_docImport}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>
                                                            <span class="fileName" id="file-chosen_${dc.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${not empty docNotify}">
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
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <div class="row justify-content-center mb-5 mt-3">
                                    <div class="col-md-3 mt-1 col-sm-4">
                                        <c:if test="${collect.statut.id_statut_projet==42 && not empty collect.codeTmp}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#Btn3', '3')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                        <c:if test="${collect.statut.id_statut_projet==42 &&empty collect.codeTmp && count!=0}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#defaultOpen', '2')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <button type="button" id=""
                                                    onclick="openCity2('#Btn3', '3')"
                                                    class="btn btn-success btn-block"><spring:message
                                                    code="button.Precedent"/></button>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 mt-1 col-sm-4">
                                        <c:if test="${collect.statut.id_statut_projet!=42}">
                                            <input type="hidden" value="${url_Admin}/generate_pdf_collecte/"
                                                   id="url_file_pdf">
                                            <button class="btn btn-success btn-block "
                                                    onclick="verif_champs_ct('4','CT','id_collecte','5')"><spring:message code="label.Afficherlerecapitulatif"/>
                                            </button>
                                        </c:if>
                                        <c:if test="${collect.statut.id_statut_projet==42}">
                                            <input type="hidden" value="${url_Admin}/generate_pdf_collecte/"
                                                   id="url_file_pdf">
                                            <a class="btn btn-success btn-block "
                                               href="/api/checkUserHasCollecte/CT"><spring:message code="button.Enregistrer"/>
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div id="5" class="tabcontent" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <h4 class="titre_abs "><spring:message code="label.Recapitulation"/></h4>
                                <div id="recap_ct" >

                                </div>
                                <div class="row justify-content-center mt-2 mb-4">
                                    <div class="col-md-3 mt-1 col-sm-6">
                                        <button type="button"
                                                onclick="openCity2('btn4','4')"
                                                class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                        </button>
                                    </div>
                                    <div class="col-md-3 mt-1 col-sm-6">
                                        <button type="button"
                                                onclick="verif_recap_ct('5','CT','id_collecte')" disabled id="EnregistrerCollecte"
                                                class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message
                        code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>


    function check_vehicule_ok(from,table,tap,id_notif,nameId,returns){
        nbr_vehicule = $("input[name=nombre_vehicule]").val();
        if(nbr_vehicule==0 || $.trim(nbr_vehicule)=="" || nbr_vehicule==null){

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.mercidesaisiraumoinsunseulvhicule"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                html: false
            });
            return false;
        }
        updateGeneral(from,table,tap,id_notif,nameId,returns)
    }
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_collecte").val();
        var link = url + id;
        window.location = link;
    }
    function fun_affiche_modal_recap() {
        event.preventDefault();
        Swal.close();
        var id = $("#id_collecte").val();
        /*  if ($.trim(id) == "") {
             swal('Champs vide', "merci d'enristrer la demande", "warning");
             return false;
         } */

        $.ajax({
            url: '/api/getCollectById1/' + id + '/CT',
            type: 'POST',
            dataType: 'html',
            data: {},
        })
            .done(function (response) {
                console.log(response);
                if (response == "" || $.trim(response) == "Aucun résultat") {
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
    function getCollectRenouveller(val) {
        event.preventDefault();
        $.ajax({
            url: '/api/getOneCollecte',
            type: 'post',
            data: {"id": $(val).val()},
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addCollectTrans/" + response + "/R";
                } else {
                    swal("<spring:message code="label.Aucunresultat"/> ", "<spring:message code="label.Aucunresultatnecorresponevoscriteresderecherche"/> ", "error");
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

        if($("#zone_tableau").is(":visible") && $("#zone_list_tab").is(":visible") ){
            var h = $("#zone_tableau").innerHeight();
            console.log("height : ",h);
            $("#my_rows").attr("style",'height : '+h+'px !important');
        }

    }

    function check_Code_Valide(){
        var $isChecked = $ ('#my_rows button').length;
        if ($isChecked == 0) {

            swal({
                title: "<spring:message code="label.champsObligatoire"/>",
                text: "<spring:message code="label.vousselectionnezaumoinuncodededechet"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                html: false
            });
            return false;
        }
        else{
            $(".my_tab4").removeAttr("disabled");
            openCity2('#Btn4', '4');
        }
    }
    function openCity2(id_active, cityName) {
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
        $(id_active).addClass("active");
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

    //show form_vehicule
    function getVehicule(id) {
        $("#add_new").prop("disabled", true);
        var id_coll = $("#id_collecte").val();
        if (id_coll == "") {
            swal("<spring:message code="label.Avertissement"/> ", "<spring:message code="label.Mercidesaisirlesinformationsdudemandeur"/> ", "error");
            return false;
        }
        event.preventDefault();
        $.get('/api/getVehiculeById/' + id + "/" + id_coll, function (data) {
            $("#my_table").html(data);
            $("#add_new").prop("disabled",true);
        });

    }

    // save vehicule Collecte/transport :
    function Save_vehicule(idInput, idequipement,val) {
        event.preventDefault();

        var form = $("#add_vehicules input[type=text]");

        for(var i=0;i<form.length;i++){
            if($(form[i]).val() == ''){

                swal({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "<spring:message code="label.Tousleschampsobligatoire"/>",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "<spring:message code="label.OK"/>  ",
                    html: false
                });
                return false;
            }
        }

        var matricule1 = $("input[name=num_mat_enrg_voit]").val();
        var matricule2 = $("input[name=num_mat_enrg_auto]").val();
        var matricule3 = $("input[name=num_mat_id_prefect]").val();
        if( ($.trim(matricule1)==="" || matricule1==null) || ($.trim(matricule2)==="" || matricule2==null) || ($.trim(matricule3)==="" || matricule3==null) ){
            swal("<spring:message code="label.Avertissement"/> ", "<spring:message code="label.Lenumerodelaplaquedimmatriculationduvehiculeestobligatoire"/> ", "error");
            return false;
        }

        var data = new FormData();
        var id_collect = $("#id_collecte").val();
        var form = $("#add_vehicules").serializeObject();


        data.append("id_collect", parseInt(id_collect));
        data.append("v", JSON.stringify(form));
        $(val).prop("disabled", "true");
        $('#loader_modal').modal('show');
        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/saveVehicule",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');

                swal({
                        title: "<spring:message code="label.Vehiculeenregistreravecsuccess"/> ",
                        text: "<spring:message code="label.VoulezvousAjouterunnouveauvehicule"/> ",
                        type: "success",
                        showCancelButton: true,
                        confirmButtonClass: "btn-success",
                        confirmButtonText: "<spring:message code="label.OuiAjouterunvehicule"/> ",
                        cancelButtonText: "<spring:message code="label.non"/> ",
                        closeOnConfirm: true,
                        closeOnCancel: true
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                            getVehicule('0');
                        } else {
                            getVehicule('0');
                            updateGeneral('formvehicule','collectetransporteur','3',0,'id_collecte','non');
                        }
                    });
                /*$("#add_new").removeAttr("disabled");*/

            },
            error: function () {
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');
            }
        });
    }

    function deleteVehicule(id) {
        event.preventDefault();
        var id_coll = $("#id_collecte").val();
        $.get("/api/deleteVehicule/" + id + "/" + id_coll, function (rep) {
            $("#my_table").html(rep);
        });
    }

    function verif_champs(id_form) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");

        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });

        if (test) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
        } else {
            changer_status_collecte('id_collecte',19);

        }
    }

    function verif_recap_ct(id_form, type, id_name) {
        if(event!=null)
            event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        changer_status_collecte('id_collecte',19);


    }

    function verif_champs_ct(id_form, type, id_name, tap) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
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
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
        } else {
            $("#Btn5").removeAttr("disabled");
            searchByRecapCT(type);
            openCity2('Btn'+tap,tap);
        }

    }

    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByRecapCT(type);
        openCity2('Btn'+tap,tap);

    }

    function changer_status_collecte(id_name,id_statut){
        var id_col = $("#"+id_name).val();
        var type="CT";
        Swal.fire({
            title: '<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `<spring:message code="label.enregistrer"/> `,
            denyButtonText: `<spring:message code="label.Annuler"/>`,
        }).then((result) => {
            if (result.value) {
                changerStatutCollete_perso(id_col,id_statut,type);
            }
        })
    }

    function changerStatutCollete_perso(id_col,id_statut,type){
        $.ajax({
            url: '/api/changerStatus',
            type: 'POST',
            data: {
                "id_notif": parseInt(id_col),
                "id_statut":parseInt(id_statut),
                "type":type
            },
        })
            .done(function() {
                console.log("kouidi_CT");
                var link_recap = "/api/checkUserHasCollecte/CT";
                window.location.href=link_recap;
            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    function addCodeCT(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcode/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "lightgrey";
                    }
                    var row = '<div class="row p-0 m-0" style="background-color: '+cls+'"> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);


                });

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

    function addCodeCT_tmp(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/deleteCodeTmp/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT_tmp(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);
                });

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    $("#tr-"+id_code).hide();

                }
                console.log("complete");
            });

    }
    function changerStatutCT(){
        var id = $("#id_collecte").val();
        $.ajax({

            type: "GET",
            url : "/api/ChangerStatutCT/"+id,
            data: {},
            success : function(response) {
                window.location.href="/api/checkUserHasCollecte/CT";
            },
            error : function() {

            }
        });
    }


    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formdemandeur']").validate({




            // Specify validation rules
            rules: {
                raison: {
                    required: true
                },
                demandeur_email: {
                    required: true
                },
                demandeur_tel : {
                    required: true,
                },
                demandeur_fax : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },

            },


            // Specify validation error messages
            messages: {
                raison: "<spring:message code="label.Silvousplaitremplirlenomdelasociete"/>",
                demandeur_email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                demandeur_tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                demandeur_fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });

    });

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
</script>


<jsp:include page="../../includes/footer1.jsp"/>

