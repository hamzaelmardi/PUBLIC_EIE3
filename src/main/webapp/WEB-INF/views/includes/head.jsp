<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<!DOCTYPE html>


<html lang="fr">
<head>
    <style>
        /*table{
            text-align: center!important;
        }*/
        .close1{
            margin-right: 70%!important;
            font-size: 1.5rem;
            font-weight: 700;
            line-height: 1;
            background: #ce2828 !important;
            opacity:1 !important;
            color:white !important;
            border-bottom-right-radius: 47px;
        }

        .modal-header .close1 {
            padding: 1rem;
            margin: -1rem -1rem -1rem -1rem;
        }
        .close{
            background: #ce2828 !important;
            opacity:1 !important;
            color:white !important;
            border-bottom-left-radius: 47px;
        }
        div.upload {
            background-color:#fff;
            border: 1px solid #ddd;
            border-radius:5px;
            display:inline-block;
            padding:6px 0px 0px 3px;
            position:relative;
            width: 100%;
        }

        div.upload:hover {
            opacity:0.95;
        }

        div.upload input[type="file"] {
            display: input-block;
            width: 100%;
            height: 30px;
            opacity: 0;
            cursor:pointer;
            position:absolute;
            left:0;
        }
        .uploadButton {
            background-color: white;
            border: black 1px solid;
            border-radius: 3px;
            color: black;
            cursor:pointer;
            display: inline-block;
            //height: 30px;
            margin-right:15px;
            width: auto;
            padding:2px 5px;
           // box-sizing: content-box;
            font-weight: bold;
            font-size: 14px;
        }

        .fileName {
            font-family: Arial;
            margin-right:20px;
        }

        .upload + .uploadButton {
            height:38px;
        }
        .at{
            color:white !important;
        }

        #fade {
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        #light {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            max-width: 600px;
            max-height: 360px;
            margin-left: -300px;
            margin-top: -180px;
            border: 2px solid #FFF;
            background: #FFF;
            z-index: 1002;
            overflow: visible;
        }

        #boxclose {
            float: right;
            cursor: pointer;
            color: #fff;
            border: 1px solid #AEAEAE;
            border-radius: 3px;
            background: #222222;
            font-size: 31px;
            font-weight: bold;
            display: inline-block;
            line-height: 0px;
            padding: 11px 3px;
            position: absolute;
            right: 2px;
            top: 2px;
            z-index: 1002;
            opacity: 0.9;
        }

        .boxclose:before {
            content: "x";
        }

        #fade:hover ~ #boxclose {
            display:none;
        }

        .test:hover ~ .test2 {
            display: none;
        }
    </style>

    <meta charset="utf-8">
    <title>DE</title>
    <!-- Stylesheets -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom_blue.css" id="color_switcher">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/styleguru.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/icofont.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/themify-icons.css" >
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous"/>
    <!-- Responsive File -->
    <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/register/css/monStyle.css" rel="stylesheet">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_1.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo_1.png" type="image/x-icon">

    <!-- Responsive File -->
    <link href="${pageContext.request.contextPath}/assets/css/captcha.css" rel="stylesheet">


    <!-- sweetalert -->
    <link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css" rel="stylesheet">


    <!-- validate form -->
    <link href="${pageContext.request.contextPath}/assets/css/validationcss.css" rel="stylesheet">


    <!-- validate blue -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/custom_blue.css" id="color_switcher_log">

    <!--views jsp-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/stockage.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/stockage_affich.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/custom.css" >



    <!-- select 2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/jsp/css/custom.css" >



    <!-- Responsive Settings -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!--[if lt IE 9]><script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script><![endif]-->
    <!--[if lt IE 9]><script src="${pageContext.request.contextPath}/assets/js/respond.js"></script><![endif]-->

    <link href="https://fonts.cdnfonts.com/css/arvo" rel="stylesheet">


    <!--   //datatable-->
    <link href="${pageContext.request.contextPath}/assets/css/datatable/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/responsive.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bs-stepper.min.css">


    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-stepper.min.js"></script>
<%--  fffff  --%>
    <link href="${pageContext.request.contextPath}/assets/css/datatable/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/responsive.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/datatable/fixedColumns.dataTables.min.css" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/toolbar/jquery.toolbar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/toolbar/custom-toolbar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/keyboard.css">
    <%--  fffff  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/intl-tel-input-master/build/css/intlTelInput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/intl-tel-input-master/build/css/demo.css">
    <script>
        $(document).ready(function(){
            $("input[type=number]").attr("min",0);
        })
    </script>
</head>

<body style="overflow-x:hidden;">

<style>
    .iti__country-list{
        left: 50%;
        text-align: left;
        direction: ltr;
    }
</style>
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">

<style>
    .card-body{
    ${pageContext.response.locale!='ar'?'border-left: 8px solid #5d6974;':'border-right: 8px solid #5d6974;'}
    }
    .header-style-one .other-links .language .lang-dropdown{
        left: 0 !important;
    }
    .inner-container.clearfix .nav-outer{
        float: right;
    }

    .inner-container.clearfix .other-links{
        float: left;
    }

    .main-menu .navigation > li{
        float: right;

    }
    .main-menu .navigation > li:last-child{
        margin-right: 30px !important;
    }

</style>

</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
<style>
    .accordion .panel{
        border: none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 0 10px;
        overflow: hidden;
        position: relative;
    }
    .accordion .panel-heading{
        padding: 0;
        border: none;
        border-radius: 0;
        margin-bottom: 10px;
        z-index: 1;
        position: relative;
    }
    .accordion .panel-heading:before,
    .accordion .panel-heading:after{
        content: "";
        width: 50%;
        height: 20%;
        box-shadow: 0 15px 5px rgba(0, 0, 0, 0.4);
        position: absolute;
        bottom: 15px;
        left: 10px;
        transform: rotate(-1deg);
        z-index: -1;
    }
    .accordion .panel-heading:after{
        left: auto;
        right: 10px;
        transform: rotate(1deg);
    }
    .accordion .panel-title a{
        display: block;
        padding: 15px 70px 15px 70px;
        margin: 0;
        background: #206c45;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
        color: #fff !important;
        border-radius: 0;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        position: relative;
    }
    .accordion .panel-title a:before,
    .accordion .panel-title a.collapsed:before{
        content: "\f106";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        width: 55px;
        height: 100%;
        text-align: center;
        line-height: 50px;
        border-right: 5px solid #fff;
        position: absolute;
        top: 0;
        ${pageContext.response.locale=="ar"?'left':'right'}: 0;
    }
    .accordion .panel-title a.collapsed:before{ content: "\f107"; }
    .accordion .panel-title a .icon{
        display: inline-block;
        width: 55px;
        height: 100%;
        ${pageContext.response.locale=="ar"?'border-left':'border-right'}: 5px solid #fff;
        font-size: 20px;
        color: #fff;
        line-height: 50px;
        text-align: center;
        position: absolute;
        top: 0;
        ${pageContext.response.locale=="ar"?'right':'left'}: 0;
    }
    .panel-body .table{
        margin: 0;
        border: 1px solid #e7e7e7;
    }
    .panel-body .table tr td{ border-color: #e7e7e7; }
    .panel-body .table thead tr.active th{
        color: #fff;
        background-color: #6D7AE0;
        font-size: 16px;
        font-weight: 500;
        padding: 12px;
        border: 1px solid #6D7AE0;
    }
    .panel-body .table tbody tr:hover{ background-color: rgba(109, 122, 224, 0.1); }
    .panel-body .table tbody tr td{
        color: #555;
        padding: 8px 12px;
        vertical-align: middle;
    }
    .panel-body .table tbody .btn{
        border-radius: 0;
        transition: all 0.3s ease;
    }
    .panel-body .table tbody .btn:hover{ box-shadow: 0 0 0 2px #333; }
    .panel-footer{
        background-color: #fff;
        padding: 0 15px 5px;
        border: none;
    }

    @media (max-width:576px){
        .d-xs-none{
            display:none !important;
        }
    }
    @media (min-width:577px){
        .d-xs-block{
            display:block !important;
        }
    }
    @media (max-width:576px) {
        .col-xs-6 {
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%
        }
    }

</style>
<div class="page-wrapper">
<input type="hidden" id="local" value="${pageContext.response.locale}">
    <!-- Preloader -->
    <div class="preloader"><div class="icon"></div></div>
    <!-- Main Header -->
    <header class="main-header header-style-one">
        <!-- Header Top -->
        <div class="header-top header-top-one" style="background: #f8f9fa;" >
            <%--<div class="auto-container">--%>
            <%--<img alt="" src="${pageContext.request.contextPath}/assets/images/logopublic.png" style="max-height: 100px;--%>
            <%--width: 100%;">--%>
            <%--</div>--%>
            <div class="row" style="color: black ;text-align: center;height: 58px; max-height: 58px; !important;">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
                            <img alt="" src="/assets/images/logo4.png" style="height: 111px; margin-top: -8px"  id="arlogo" >
                        </div>
                        <div class="col-lg-8 d-lg-block d-md-none d-sm-none d-xs-none titreAr_app" >

                           <span id="TitrFr" style="font-size:22px">
                                نظام رقمنة الوثائق الإدارية المسلمة من طرف قطاع التنمية المستدامة
                            </span>
                           <%-- <span style="display: none;font-family: initial;font-size: x-large;" id="TitrAr">

                            </span>--%>
                        </div>
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 pt-3">
                            <a href="/">
                                <img src="/assets/images/img_logo_ar.png" width="280px">
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 pt-4 pl-2">
                           <%-- <img alt="" src="${pageContext.request.contextPath}/assets/images/logo4.png" style="height: 111px;
                        margin-top: -8px;" id="frlogo">--%>
                            <a href="/">
                                <img src="/assets/images/img_logo_fr.png" width="280px">
                            </a>
                        </div>
                        <div class="col-lg-8 d-lg-block d-md-none d-sm-none d-xs-none titre_app">
                            <span id="TitrFr">
                                Système de dématérialisation des actes administratifs délivrés par le<br>
                                Département du Développement Durable
                            </span>
                            <%--<span style="display: none;font-family: initial;font-size: x-large;" id="TitrAr">نظام رقمنة المساطر المسلمة من طرف قطاع االتنمية المستدامة</span>--%>

                        </div>
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
                            <img alt="" src="${pageContext.request.contextPath}/assets/images/logo4.png" style="height: 111px;
                        margin-top: -8px;" id="frlogo">
                        </div>
                    </c:otherwise>
                </c:choose>


            </div>

        </div>
        <!-- Header Upper -->
        <div class="header-upper" style="background: #336c4e;">
            <div class="auto-container" style="height:61px;">
                <div class="inner-container clearfix" >
                    <!--Logo-->
                    <!--Nav-->
                    <div class="nav-outer clearfix"  >
                        <!--Mobile Navigation Toggler-->
                        <div class="mobile-nav-toggler"><span class="icon flaticon-menu-1"></span></div>

                        <!-- Main Menu -->
                        <nav class="main-menu navbar-expand-md navbar-light"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'} !important;">
                            <div class="collapse navbar-collapse show clearfix" id="navbarSupportedContent">
                                <ul class="navigation clearfix">
                                    <li class="current"><a href="/index" class="at"><spring:message code="label.Accueil"/></a>

                                    </li>
                                    <c:if test="${user.compteId != null}">
                                        <c:if test="${!user.st.etat.equals('2')   }">
                                            <li  class="dropdown"><a href="/api/ListeEIE_card" class="at"><spring:message code="label.Evaluationenvironnementale"/></a>
                                                <ul>
                                                    <li><a onclick="checkAut('${user.st.EIE}','/api/checkEIESelect/EE')"><spring:message code="label.Etudedimpactenvironnementale"/></a></li>
                                                     <li><a onclick="checkAut('${user.st.NT}','/api/checkEIESelect/NT')"><spring:message code="label.Noticedimpact"/></a></li>
                                                <li><a onclick="checkAut('${user.st.EA}','/api/checkEIESelect/AE')"><spring:message code="label.Auditenvironnementale"/></a></li>

                                                </ul>
                                            </li>
                                        </c:if>
                                        <c:if test="${!user.st.etat.equals('1')  }">

                                            <li  class="dropdown"><a href="/api/ListeAutorisation_card/ZF/d" class="at"><spring:message code="label.Autorisationdesdechets"/></a>
                                                <ul>
                                                    <li><a onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/ZF')"><spring:message code="label.Importationdechetszonefranche"/></a></li>
                                                    <li><a onclick="checkAut('${user.st.ET}','/api/checkUserDispatch/ET')"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></li>
                                                        <%--<li><a href="/api/getListCollectTrans"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>--%>
                                                    <li><a onclick="checkAut('${user.st.CT}','/api/checkUserDispatch/CT')"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>

                                                    <li><a onclick="checkAut('${user.st.IT}','/api/checkUserDispatch/IT')"><spring:message code="label.Installationdetraitementdesdechets"/></a></li>
                                                    <li><a onclick="checkAut('${user.st.XD}','/api/checkUserDispatch/XD')"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></li>
                                                    <li><a onclick="checkAut('${user.st.TR}','/api/checkUserDispatch/TR')"><spring:message code="label.Transitdesdechets"/></a></li>
                                                        <%-- <li><a href=""><spring:message code="label.Importationdesdechetsnonferreux"/></a></li> --%>
                                                </ul>
                                            </li>

                                        </c:if>
                                    </c:if>
                                    <c:if test="${user.compteId == null}">
                                        <li  class="dropdown"><a href="/connexion" class="at"><spring:message code="label.Evaluationenvironnementale"/></a>
                                            <ul>
                                                <li><a href="/connexion"><spring:message code="label.Etudedimpactenvironnementale"/></a></li>
                                                 <li><a href="/connexion"><spring:message code="label.Noticedimpact"/></a></li>
                                           <li><a href="/connexion"><spring:message code="label.Auditenvironnementale"/></a></li>

                                            </ul>
                                        </li>

                                        <li  class="dropdown"><a href="/connexion" class="at"><spring:message code="label.Autorisationdesdechets"/></a>
                                            <ul>
                                                <li><a href="/connexion"><spring:message code="label.Importationdechetszonefranche"/></a></li>
                                                <li><a href="/connexion"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></a></li>
                                                    <%--<li><a href="/api/getListCollectTrans"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>--%>
                                                <li><a href="/connexion"><spring:message code="label.Collectetransportdesdechetsdangereux"/></a></li>

                                                <li><a href="/connexion"><spring:message code="label.Installationdetraitementdesdechets"/></a></li>
                                                <li><a href="/connexion"><spring:message code="label.Exportationdesdechetsdangereux"/> </a></li>
                                                <li><a href="/connexion"><spring:message code="label.Transitdesdechets"/></a></li>
                                                    <%-- <li><a href=""><spring:message code="label.Importationdesdechetsnonferreux"/></a></li> --%>
                                            </ul>
                                        </li>
                                    </c:if>

                                    <li  class="dropdown"><a href="/index"  class="at"><spring:message code="label.Ressources"/></a>
                                        <ul>
                                            <li>
                                                <a href="/Preparezvotredemarche"><spring:message code="label.Preparezvotredemarche"/></a>
                                            </li>
                                            <li><a href="/guide" ><spring:message code="label.GuideetProcedure"/></a></li>
                                            <li><a href="/videoList" ><spring:message code="label.Videos"/></a></li>
                                            <li><a href="/faq" ><spring:message code="label.FA"/></a></li>
                                            <li><a href="/CatalogueDesDechet1" ><spring:message code="label.Cataloguedesdechets"/></a></li>
                                            <li><a href="/Actualite" ><spring:message code="label.Acualite"/></a></li>
                                        </ul>
                                    </li>
                                    <li class=""><a href="/contact/0" class="at"><spring:message code="label.contact"/></a>



                                </ul>
                            </div>
                        </nav>
                    </div>
                    <!--Other Links-->
                    <div class="other-links clearfix" >
                        <!--Language-->
                        <div class="language">

                            <div class="lang-btn">
                                <span class="icon flaticon-worldwide-1"></span>
                                <c:if test="${pageContext.response.locale!='ar'}">
                                    <span class="txt" id="curntlng"><spring:message code="label.Francais"/></span>
                                </c:if>
                                <c:if test="${pageContext.response.locale=='ar'}">
                                    <span class="txt" id="curntlng"><spring:message code="label.Arabic"/></span>
                                </c:if>
                                <span class="arrow fa fa-angle-down"></span>
                            </div>

                            <div class="lang-dropdown" >
                                <ul>
                                    <li><a href="?lang=ar" id="choslng"><spring:message code="label.Arabic"/></a></li>
                                    <li><a href="?lang=fr" id="choslng"><spring:message code="label.Francais"/></a></li>

                                </ul>
                            </div>
                        </div>

                        <%--<div class="language" style="padding-left:30px">--%>
                        <%--<div class="lang-btn">--%>
                        <%--<span class="fa fa-cog"></span>--%>
                        <%--<span class="arrow fa fa-angle-down"></span>--%>
                        <%--</div>--%>
                        <%--<div class="lang-dropdown">--%>
                        <%--<ul>--%>
                        <%--<li>--%>
                        <%--<div class="flex_color">--%>
                        <%--<a href="javascript:void(0)" data-size="plus"  data-fontSize="13" id="changePlus" class="size_cog">A+</a>--%>
                        <%--<a href="javascript:void(0)" data-size="moins" data-fontSize="12" id="changeMoins" class="size_cog">A-</a>--%>
                        <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<div class="flex_color" id="changeColor" style="margin: 6px 0">--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_blue" style="background:#2196f3"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_red"  style="background:#ED4C67"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_vert" style="background:#00d2d3"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_jaune"  style="background:#ff9f43"></a>--%>
                        <%--<a href="javascript:void(0)" class="colorPalette" data-color="_violet" style="background:#5f27cd"></a>--%>
                        <%--</div>--%>
                        <%--</li>--%>


                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <!--Social Links-->
                        <%--<div class="social-links-one">--%>
                        <%--<ul class="clearfix">--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-facebook-f"></span><div class="c-tooltip"><div class="tooltip-inner">Facebook</div></div></a></li>--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-twitter"></span><div class="c-tooltip"><div class="tooltip-inner">Twitter</div></div></a></li>--%>
                        <%--<li><a href="#" class="has-tooltip"><span class="fab fa-linkedin-in"></span><div class="c-tooltip"><div class="tooltip-inner">Linkedin</div></div></a></li>--%>
                        <%--</ul>--%>
                        <%--</div>--%>

                        <div class="language">
                            <c:if test="${(not empty user)}">
                                <div class="lang-btn">
                                    <span class="icon flaticon-user-2"></span>
                                    <span class="txt">${user.email==null?"":user.email}</span>
                                    <span class="arrow fa fa-angle-down"></span>
                                </div>
                                <c:if test="${user.email!=null}">
                                    <div class="lang-dropdown">
                                        <ul>
                                            <li><a href="/Mon_profil"><spring:message code="label.Monprofil"/> </a></li>
                                            <li><a href="/logout"><spring:message code="label.sedeconnecter"/></a></li>

                                        </ul>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--End Header Upper-->
        <%--<div class="row myTextrow d-lg-none d-md-block d-sm-block d-xs-block p-3 m-0">
            <div class="col-sm-12" style="text-align: center;color: black">Système de dématérialisation des actes administratifs délivrées par le Département de l’Environnement</div>
        </div>--%>
        <!-- Sticky Header  -->
        <div class="sticky-header">
            <div class="auto-container clearfix">
                <!--Logo-->
                <div class="logo pull-left">
                    <a href="${pageContext.request.contextPath}/espace_client" title=""><img src="${pageContext.request.contextPath}/assets/images/sticky-logo.png" alt="" title=""></a>
                </div>
                <!--Right Col-->
                <div class="pull-right">
                    <!-- Main Menu -->
                    <nav class="main-menu clearfix">
                        <!--Keep This Empty / Menu will come through Javascript-->
                    </nav><!-- Main Menu End-->
                </div>
            </div>
        </div><!-- End Sticky Menu -->

        <!-- Mobile Menu  -->
        <div class="mobile-menu">
            <div class="menu-backdrop"></div>
            <div class="close-btn"><span class="icon flaticon-targeting-cross"></span></div>

            <nav class="menu-box">
                <div class="nav-logo"><a href="${pageContext.request.contextPath}/espace_client"><img src="${pageContext.request.contextPath}/assets/images/nav-logo.png" alt="" title=""></a></div>
                <div class="menu-outer"><!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header--></div>
                <!--Social Links-->
                <!-- <div class="social-links">
                    <ul class="clearfix">
                        <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                        <li><a href="#"><span class="fab fa-facebook-square"></span></a></li>
                        <li><a href="#"><span class="fab fa-pinterest-p"></span></a></li>
                        <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                        <li><a href="#"><span class="fab fa-youtube"></span></a></li>
                    </ul>
                </div> -->

                <div class="languageD ml-4" >
                    <hr style="background-color:white">
                    <div class="language">
                        <%-- <div class="lang-btn">
                            <span class="icon flaticon-worldwide-1"></span>
                          <c:if test="${pageContext.response.locale=='ar'}">
                          <span class="txt" id="curntlng"><spring:message code="label.Francais"/></span>
                          </c:if>
                           <c:if test="${pageContext.response.locale!='ar'}">
                          <span class="txt" id="curntlng"><spring:message code="label.Arabic"/></span>
                          </c:if>



                            <span class="arrow fa fa-angle-down"></span>
                        </div> --%>
                        <div class="lang-dropdown" >

                            <ul>

                                <li><a  style="color:white"href="?lang=ar" id="choslng"><spring:message code="label.Arabic"/></a></li>

                                <li><a   style="color:white"href="?lang=fr" id="choslng"><spring:message code="label.Francais"/></a></li>

                            </ul>
                        </div>
                    </div>
                    <hr style="background-color:white">
                    <div class="language">
                        <div class="lang-btn">
                            <!-- <span class="icon flaticon-user-2"></span> -->
                            <span class="txt">${user.email==null?"":user.email}</span>
                            <!--  <span class="arrow fa fa-angle-down"></span> -->
                        </div>
                        <c:if test="${user.email!=null}">
                            <div class="lang-dropdown">
                                <ul>
                                    <li><a  style="color:#FF3390;" href="/logout"><spring:message code="label.sedeconnecter"/></a></li>

                                </ul>
                            </div>
                        </c:if>

                    </div>
                </div>
            </nav>
        </div><!-- End Mobile Menu -->
    </header>
    <!-- End Main Header -->
    <!--Search Popup-->
    <div id="search-popup" class="search-popup">
        <div class="close-search theme-btn"><span class="flaticon-targeting-cross"></span></div>
        <div class="popup-inner">
            <div class="overlay-layer"></div>
            <div class="search-form">

                <div class="form-group">
                    <form action="/login" method="get">
                        <div style="color: white; text-align: -webkit-center;">


                            <label >Email  </label>
                            <input type="text" name="j_name" id="emailval" placeholder="Email" class="form-control" style="    width: 500px;">
                            <label >Mot de passe  </label>
                            <input type="password" name="j_pass" id="passwordval" placeholder="Mot de passe" class="form-control" style="    width: 500px;">
                            <button style="margin-top: 10px;" type="submit" class="btn btn-danger" ><spring:message code="button.Seconnecter"/></button>


                        </div>
                    </form>
                </div>



                <br>
                <br>
                <ul class="recent-searches">
                    <li><a href="#"><spring:message code="label.Motdepasseoublie"/></a></li>
                    <li><a href="/demandez_compte"><spring:message code="label.Demandezuncompte"/></a></li>

                </ul>

            </div>

        </div>
    </div>

    <div id="myModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body justify-content-center">
                    <h4 class="text-center"><spring:message code="label.Voulezvousajoutercettedemandeavotreprofil"/></h4>
                    <i class="fa fa-info-circle" style="font-size: 80px; justify-content: center; display: flex; color: #f1c40f"></i>
                </div>
                <div class="modal-footer justify-content-center">
                    <div class="btn-group">
                        <button class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span><spring:message code="label.non"/> </button>
                        <a class="btn btn-primary at" href="/Mon_profil#comptes"> <spring:message code="label.oui"/> <span class="fa fa-check"></span></a>
                    </div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dalog -->
    </div>

    <script>

        function checkAut(checked, lien) {
            if (checked == 'on') {
                window.location = lien;
            } else {
                $("#myModal").modal('show');
            }
        }

        function changlogo()
        {

            $("#choslng").attr("onclick","changlogo2()");

            $("#arlogo").show();
            $("#frlogo").hide();
            $("#TitrAr").show();
            $("#TitrFr").hide();
            $("#curntlng").text("Arabic");
            $("#choslng").text("Français");


        }

        function changlogo2()
        {

            $("#choslng").attr("onclick","changlogo()");

            $("#arlogo").hide();
            $("#frlogo").show();
            $("#TitrAr").hide();
            $("#TitrFr").show();
            $("#curntlng").text("Français");
            $("#choslng").text("Arabic");

        }

        $(document).ready(function() {
            if(location.hash == "#comptes"){

                $([document.documentElement, document.body]).animate({
                    scrollTop: $("#comptes").offset().top
                }, 2000);
            }
        });
    </script></div>
    <style>
        body { font-family: 'Arvo', sans-serif !important; }

    </style>
</body>
</html>
