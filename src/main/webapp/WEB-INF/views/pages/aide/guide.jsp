<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<jsp:include page="../../includes/head.jsp"/>
<style>
    .contenedor {
        height: 100%;
        padding: 5% 0;
    }

    h1 {
        color: #FCFBFA;
    }

    .container_foto {
        padding: 0;
        overflow: hidden;
        max-width: 350px;
        margin: 5px;
    }
    .container_foto:hover {
        transform: translateY(-5px);
    }

    .container_foto:before {
        pointer-events: none;
        position: absolute;
        z-index: -1;
        content: '';
        top: 100%;
        left: 5%;
        height: 10px;
        width: 90%;
        opacity: 0;
        background: -webkit-radial-gradient(center, ellipse, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
        background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
        -webkit-transition-duration: 0.3s;
        transition-duration: 0.3s;
        -webkit-transition-property: transform, opacity;
        transition-property: transform, opacity;
    }



    .contguide {
        max-width: 500px !important;
    }

    .container_foto article {
        padding: 10%;
        position: absolute;
        bottom: 0;
        z-index: 1;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        -ms-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    .contguide article {
        bottom: -20px !important;
        left: -20px !important;
    }

    .container_foto h2 {
        color: #fff;
        font-weight: 800;
        font-size: 25px;
        border-bottom: #fff solid 1px;
    }

    .container_foto h4 {
        font-weight: 300;
        color: #fff;
        font-size: 16px;
    }

    .container_foto img {
        width: 100%;
        opacity: 0.7;
        -webkit-transition: all 4s ease;
        -moz-transition: all 4s ease;
        -o-transition: all 4s ease;
        -ms-transition: all 4s ease;
        transition: all 4s ease;
    }

    .ver_mas {
        background-color: #206c45;
        position: absolute;
        width: 100%;
        height: 70px;
        bottom: 0;
        z-index: 1;
        opacity: 0;
        transform: translate(0px, 70px);
        -webkit-transform: translate(0px, 70px);
        -moz-transform: translate(0px, 70px);
        -o-transform: translate(0px, 70px);
        -ms-transform: translate(0px, 70px);
        -webkit-transition: all 0.2s ease-in-out;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -ms-transition: all 0.2s ease-in-out;
        transition: all 0.2s ease-in-out;
        right:0px;
    }

    .ver_mas span {
        font-size: 20px;
        color: #fff;
        position: relative;
        margin: 0 auto;
        width: 100%;
        top: 20px;
    }

    .btn-circle{
        border-radius: 50% !important;
        color: #fff !important;
    }


    /*hovers*/

    .container_foto:hover {
        cursor: pointer;
    }

    .container_foto:hover img {
        opacity: 0.1;
        transform: scale(1.5);
    }

    .container_foto .imgx {
        width:250px !important;
        opacity: 0.9 !important;
    }

    .container_foto:hover .imgx {
        opacity: 0.3 !important;
        transform: scale(1.5);
    }

    .container_foto:hover article {
        transform: translate(2px, -69px);
        -webkit-transform: translate(2px, -69px);
        -moz-transform: translate(2px, -69px);
        -o-transform: translate(2px, -69px);
        -ms-transform: translate(2px, -69px);
    }

    .container_foto:hover .ver_mas {
        transform: translate(0px, 0px);
        -webkit-transform: translate(0px, 0px);
        -moz-transform: translate(0px, 0px);
        -o-transform: translate(0px, 0px);
        -ms-transform: translate(0px, 0px);
        opacity: 1;
    }
    .box {
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px
    }

    .our-services {
        margin-top: 75px;
        padding-bottom: 30px;
        padding: 0 60px;
        min-height: 198px;
        text-align: center;
        border-radius: 10px;
        background-color: #fff;
        transition: all .4s ease-in-out;
        box-shadow: 0 0 25px 0 rgba(20, 27, 202, .17)
    }

    .our-services .icon {
        margin-bottom: -21px;
        transform: translateY(-50%);
        text-align: center
    }

    .our-services:hover h4,
    .our-services:hover p {
        color: #fff
    }

    .speedup:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #fb0054 0%, #f55b2a 100%)
    }

    .settings:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #34b5bf 0%, #210c59 100%)
    }

    .privacy:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #3615e7 0%, #44a2f6 100%)
    }

    .backups:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #fc6a0e 0%, #fdb642 100%)
    }

    .ssl:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #8d40fb 0%, #5a57fb 100%)
    }

    .database:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #27b88d 0%, #22dd73 100%)
    }

    .btn-video{
        background-color: #22dd73;
    }

    .btn-video .fa{
        font-size: 14px !important;
    }

    .btn-pdf{
        background-color: #f55b2a;
        animation: animate2 2s linear infinite;

    }

    a:hover,a:focus{
        text-decoration: none;
        outline: none;
    }
    #accordion .panel{
        border: none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 30px 5px;
        position: relative;
    }
    #accordion .panel:before,
    #accordion .panel:after{
        content: "";
        border-left: 25px solid #fff;
        border-top: 25px solid transparent;
        border-bottom: 25px solid transparent;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;
    }
    #accordion .panel:after{
        border-left: none;
        border-right: 25px solid #fff;
        left: auto;
        right: 0;
    }
    #accordion .panel-heading{
        padding: 0;
        position: relative;
    }
    #accordion .panel-title a{
        display: block;
        padding: 15px 60px 15px 40px;
        background: #206c45;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
        color: #fff;
        position: relative;
    }
    #accordion .panel-title a:before,
    #accordion .panel-title a.collapsed:before{
        content: "\f107";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        font-size: 20px;
        color: #fff;
        position: absolute;
        top: 15px;
        right: 40px;
        transition: all 0.3s ease 0s;
    }
    #accordion .panel-title a.collapsed:before{
        content: "\f106";
        top: 12px;
    }
    #accordion .panel-body{
        padding: 10px 30px 0;
        border-top: none;
        font-size: 15px;
        color: #5c4f4f;
        line-height: 28px;
        letter-spacing: 0.5px;
    }
    .modal-dialog {
        max-width: 800px;
        margin: 30px auto;
    }



    .modal-body {
        position:relative;
        padding:0px;
    }
    .close {
        position:absolute;
        right:-30px;
        top:0;
        z-index:999;
        font-size:2rem;
        font-weight: normal;
        color:#fff;
        opacity:1;
    }
    .serviceBox{
        background: #fff;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
        padding: 0px 25px 40px;
        margin: 20px 0 0;
        border-radius: 20px;
        border: 1px double #206c45;
        position: relative;
        transition: all 0.3s ease;
    }
    .serviceBox:hover{ box-shadow: 0 10px 10px rgba(0,0,0,0.2); }
    .serviceBox:before,
    .serviceBox:after{
        content: "";
        background: linear-gradient(to top,#336c4e,#4a8062);
        width: 10px;
        border-radius: 0 100px 100px 0;
        position: absolute;
        top: 110px;
        bottom: 35px;
        left: 0;
    }
    .serviceBox:after{
        border-radius: 100px 0 0 100px;
        left: auto;
        right: 0;
    }
    .serviceBox .service-icon{
        color: #fff;
        background: linear-gradient(-45deg,#336c4e 49%, #4a8062 50%);
        font-size: 45px;
        line-height: 92px;
        width: 120px;
        height: 120px;
        margin: 0 auto;
        border-radius: 100px;
        border: 15px solid #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        transform: translateY(-20px);
        transition: all 0.3s ease;
    }
    .serviceBox:hover .service-icon i{
        transform: rotateX(360deg);
        transition: all 0.3s;
    }
    .serviceBox .title{
        color: #336c4e;
        font-size: 14px;
        font-weight: 600;
        margin: 0 0 10px;
    }
    .serviceBox .description{
        color: #444;
        font-size: 12px;
        line-height: 24px;
        margin: 0;
    }
    @media only screen and (max-width:990px){
        .serviceBox{ margin: 20px 0 50px; }
    }

    #evaluation .box i,#autorisation .box i, #evaluation2 .box i,#autorisation2 .box i {
        width:93px;
        color: white;
        height: 85px;
    }
    .btn-video,.btn-pdf{
        color: #fff;
        background: #336c4e;
        font-family: 'Nunito Sans', sans-serif;
        font-size: 18px;
        font-weight: 600;
        text-transform: capitalize;
        border-radius: 0;
        border: none;
        overflow: hidden;
        position: relative;
        z-index: 1;
        transition: all 0.3s ease 0s;
    }
    .btn-video:focus,.btn-pdf:focus{ color: #fff; }
    .btn-video:hover,.btn-pdf:hover{
        color: #fff;
        background: #336c4e;
        border: none;
        box-shadow: 0 0 5px #6fd39e;
    }
    .btn-video i,.btn-pdf i{
        margin-left: 5px;
        transition: all 1s ease 0s;
    }
    .btn-video:hover i,.btn-pdf:hover i{ transform: rotate(360deg); }
    .btn-video:before,.btn-pdf:before{
        content: '';
        background: linear-gradient(to right, transparent, #336c4e);
        height: 100%;
        width: 20%;
        position: absolute;
        right: 0;
        top: 0;
        z-index: -1;
        transition: all 0.3s ease 0s;
    }
    .btn-video:hover:before,.btn-pdf:hover:before{ width: 100%; }
    @media only screen and (max-width: 767px){
        .btn-video,.btn-pdf{ margin-bottom: 20px; }
    }
    .box{
        border: 5px solid #f5f5f5;
        background: #f5f5f5;
        font-family: 'Raleway', sans-serif;
        text-align: center;
        box-shadow: 0 0 15px 5px rgba(0,0,0,.07);
        overflow: hidden;
        position: relative;
        height:350px
    }
    .box:before{
        content: "";
        width: 50%;
        height: 75%;
        border-top: 208px solid rgba(30, 232, 12, 0.3);
        border-left: 140px solid #336c4e;
        border-bottom: 188px solid transparent;
        border-right: 160px solid transparent;
        position: absolute;
        top: 0;
        left: -230px;
        z-index: 1;
        transition: all .4s ease-in-out;
    }
    .box:hover:before{
        border-top: 325px solid #336c4e;
        border-left: 422px solid #336c4e;
        border-bottom: 218px solid transparent;
        border-right: 160px solid transparent;
        transform: rotate3d(0,0,1,52deg) scale3d(1,1,1);
        top: 103px;
        left: -350px;
    }
    .box img{
        width: 100%;
        transform: scale(1,1);
        transition: all .3s ease-in-out;
        height: 300px;
        margin: auto;
        padding: 50px;
    }
    .box:hover img{
        opacity: .7;
        transform: scale(1.1,1.1);
    }
    .box .box-content{
        color: #fff;
        background-color: #336c4e;
        width: 60%;
        padding: 10px 10px;
        transform: scale(0);
        position: absolute;
        top: 15px;
        right: 15px;
        transition: all .5s ease-in-out;
    }
    .box:hover .box-content{ transform: scale(1); }
    .box .title{
        font-size: 16px;
        font-weight: 700;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        margin: 0;
    }
    .box .post{
        font-size: 15px;
        font-weight: 500;
        font-style: italic;
        text-transform: capitalize;
        display: block;
    }
    .box .icon{
        padding: 0;
        margin: 0;
        list-style: none;
        position: absolute;
        left: 10px;
        bottom: 10px;
        z-index: 1;
        transition: all .5s ease-in-out;
    }
    .box .icon li{
        margin: 0 3px 0 0;
        display: inline-block;
        opacity: 0;
        transition: all 0.5s ease-in-out;
    }
    .box .icon i{
        position: absolute;
        right: 0px;
    }
    .box:hover .icon li{ opacity: 1; }
    .box:hover .icon li:nth-child(1){ transition-delay: .2s; }
    .box:hover .icon li:nth-child(2){ transition-delay: .3s; }
    .box .icon li a{
        color: #336c4e;
        background-color: #fff;
        font-size: 16px;
        line-height: 28px;
        height: 30px;
        width: 30px;
        border: 2px dotted transparent;
        border-radius: 50%;
        display: block;
        transform: rotate(0);
        transition: all 0.3s;
    }
    .box .icon li a:hover{
        color: #336c4e;
        background:#fff;
        border-color: #336c4e;
        transform: rotate(360deg);
    }
    @media only screen and (max-width:990px){
        .box{ margin: 0 0 30px; }
    }
</style>
<style>
     a:hover,a:focus{
        text-decoration: none;
        outline: none;
    }
    .vertical-tab{ display: block; }
    .vertical-tab .nav-tabs{
        display: block;
        border-bottom: none;
    }
    .vertical-tab .nav-tabs li{
        float: none;
        vertical-align: top;
    }
    .vertical-tab .nav-tabs li a{
        display: block;
        padding: 16px;
        margin: 0 10px 5px 0;
        font-size: 16px;
        font-weight: 600;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        background: #206c45;
        border-radius: 0;
        border: none;
        border-top: 3px solid #206c45;
        border-bottom: 3px solid #206c45;
        overflow: hidden;
        position: relative;
        transition: all 0.3s ease 0s;
    }
    .vertical-tab .nav-tabs li a:hover,
    .vertical-tab .nav-tabs li.active a{
        color: #206c45;
        background: #fff;
        border: none;
        border-top: 3px solid #206c45;
        border-bottom: 3px solid #206c45;
    }
    .vertical-tab .nav-tabs li a:before,
    .vertical-tab .nav-tabs li a:after{
        content: "";
        width: 20px;
        height: 20px;
        background: linear-gradient(135deg,#206c45 49%, transparent 50%);
        position: absolute;
        top: -20px;
        left: -20px;
        transition:all 0.3s ease 0s;
    }
    .vertical-tab .nav-tabs li a:after{
        background: linear-gradient(315deg,#206c45 49%, transparent 50%);
        top: auto;
        left: auto;
        bottom: -20px;
        right: -20px;
    }
    .vertical-tab .nav-tabs li a:hover:before,
    .vertical-tab .nav-tabs li.active a:before{
        top: 0;
        left: 0;
    }
    .vertical-tab .nav-tabs li a:hover:after,
    .vertical-tab .nav-tabs li.active a:after{
        bottom: 0;
        right: 0;
    }
    .vertical-tab .tab-content{
        display: block;
        padding: 10px 20px;
        font-size: 15px;
        color: #206c45;
        letter-spacing: 1px;
        line-height: 24px;
        text-align: justify;
        vertical-align: top;
        border-top: 3px solid #206c45;
        border-bottom: 3px solid #206c45;
        position: relative;
    }
    .vertical-tab .tab-content:before,
    .vertical-tab .tab-content:after{
        content: "";
        width: 20px;
        height: 20px;
        background: linear-gradient(135deg,#206c45 49%, transparent 50%);
        position: absolute;
        top: 0;
        left: 0;
    }
    .vertical-tab .tab-content:after{
        background: linear-gradient(315deg,#206c45 49%, transparent 50%);
        top: auto;
        left: auto;
        bottom: 0;
        right: 0;
    }
    .vertical-tab .tab-content h3{
        font-size: 24px;
        color: #206c45;
        margin: 0 0 5px 0;
    }
</style>
<script type="text/javascript">
    $(function(){
        $('#accordion a').eq(0).trigger('click');
    });
</script>

<div class="container-fluid contenedor text-center" style="margin-top: 10rem" id="guideProc">
    <h1 class="text-center"></h1>
    <div class="row text-center p-5 justify-content-center">
        <div class="col-md-6 col-sm-12 col-xs-12 p-4 contguide ">
            <div class="box">
                <img src="/assets/images/guide2.png">
                <div class="box-content">
                    <h3 class="title"><spring:message code="label.guide"/></h3>
                </div>
                <ul class="icon col-4">
                    <li><a href="#" class="btn" onclick="OpenAuto('guideProc','lescard')"> <i class="fa fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 p-4 contguide">
            <div class="box">
                <img src="/assets/images/procedure2.png">
                <div class="box-content">
                    <h3 class="title"><spring:message code="label.procedure"/></h3>
                </div>
                <ul class="icon col-4">
                    <li><a href="#" class="btn" onclick="OpenAuto('guideProc','lescard2')"> <i class="fa fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid contenedor text-center" style="margin-top: 10rem;display:none" id="lescard">
    <div class="row justify-content-center mt-5  border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('lescard','guideProc')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.guide"/></h1>
        </div>
    </div>
    <div class="row text-center mt-5 justify-content-center">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto ">
                <div class="box">
                    <img src="/assets/images/economie-circulaire.png">
                    <div class="box-content">
                        <h3 class="title"><spring:message code="label.Autorisationdesdechets"/></h3>
                    </div>
                    <ul class="icon col-4">
                        <li><a href="#" class="btn" onclick="OpenAuto('lescard','autorisation')"> <i class="fa fa-arrow-right"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                <div class="box">
                    <img src="/assets/images/protect-the-planet.png">
                    <div class="box-content">
                        <h3 class="title"><spring:message code="label.Evaluationenvironnementale"/></h3>
                    </div>
                    <ul class="icon col-4">
                        <li><a href="#" class="btn" onclick="OpenAuto('lescard','evaluation')"> <i class="fa fa-arrow-right"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                <div class="box">
                    <img src="/assets/images/laptop.png">
                    <div class="box-content">
                        <h3 class="title"><spring:message code="label.generalite"/></h3>
                    </div>
                    <ul class="icon col-4">
                        <li><a href="#" class="btn" onclick="OpenAuto('lescard','generalite')"> <i class="fa fa-arrow-right"></i></a></li>
                    </ul>
                </div>
            </div>
    </div>
</div>
<div class="container-fluid contenedor text-center" style="margin-top: 6rem;display:none" id="lescard2">
    <div class="row justify-content-center mt-5  border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('lescard2','guideProc')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.procedure"/></h1>
        </div>
    </div>
    <div class="row text-center mt-5 justify-content-center">
        <div class="col-md-6 col-sm-12 col-xs-12 container_foto ">
            <div class="box">
                <img src="/assets/images/economie-circulaire.png">
                <div class="box-content">
                    <h3 class="title"><spring:message code="label.Autorisationdesdechets"/></h3>
                </div>
                <ul class="icon col-4">
                    <li><a href="#" class="btn" onclick="OpenAuto('lescard2','autorisation2')"> <i class="fa fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 container_foto">
            <div class="box">
                <img src="/assets/images/protect-the-planet.png">
                <div class="box-content">
                    <h3 class="title"><spring:message code="label.Evaluationenvironnementale"/></h3>
                </div>
                <ul class="icon col-4">
                    <li><a href="#" class="btn" onclick="OpenAuto('lescard2','evaluation2')"> <i class="fa fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid px-5 mb-5" style="display: none;margin-top:14rem" id="autorisation">
    <div class="row justify-content-center mt-5  border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('autorisation','lescard')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.Autorisationdesdechets"/></h1>
        </div>
    </div>
    <div class="row justify-content-center mt-5">
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Importationdesdechetsdunezonefranche"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','ZF')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/zone%20franche/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                            download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','ET')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Importation%20des%20déchets%20non%20dangereux%20d_un%20pays%20étranger/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Exportationdesdechetsdangereux"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','XD')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Exportation%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Transitdesdechets"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','TR')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Transit%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-trash-restore"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Installationdetraitementdesdechets"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','IT')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Installation%20de%20traitement%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-truck"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Collectetransportdesdechetsdangereux"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('autorisation','CT')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Collecte-Transport%20des%20dechets%20dangereux/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid px-5 mb-5" style="display: none;margin-top: 14rem" id="evaluation2">
    <div class="row justify-content-center mt-5 border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('evaluation2','lescard2')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.Evaluationenvironnementale"/></h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('evaluation2','EE')">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.EtudedimpactEnvironnementale"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('evaluation2','NT')">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Noticedimpactsurlenvironnement"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('evaluation2','AE')">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Auditenvironnementale"/></h3>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid px-5 mb-5" style="display: none;margin-top: 14rem" id="autorisation2">
    <div class="row justify-content-center mt-5  border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('autorisation2','lescard2')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.Autorisationdesdechets"/></h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','ZF')">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Importationdesdechetsdunezonefranche"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','ET')">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','XD')">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Exportationdesdechetsdangereux"/></h3>
            </div>
        </div>
        <br>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','TR')">
                <div class="service-icon">
                    <span><i class="fa fa-recycle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Transitdesdechets"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','IT')">
                <div class="service-icon">
                    <span><i class="fa fa-trash-restore"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Installationdetraitementdesdechets"/></h3>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox" type="button" onclick="OpenRetour2('autorisation2','CT')">
                <div class="service-icon">
                    <span><i class="fa fa-truck"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Collectetransportdesdechetsdangereux"/></h3>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid px-5 mb-5" style="display: none;margin-top: 14rem" id="evaluation">
    <div class="row justify-content-center mt-5 border-bottom mx-1">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('evaluation','lescard')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
        <div class="col-md-8 text-right">
            <h1 class="text-dark"><spring:message code="label.Evaluationenvironnementale"/></h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.EtudedimpactEnvironnementale"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('evaluation','EE')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Etude%20d_impact%20sur%20l_environnement/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Noticedimpactsurlenvironnement"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('evaluation','NT')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Notice%20d_impact%20sur%20l_environnement/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-12">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-tree"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Auditenvironnementale"/></h3>
                <div class="row justify-content-center mt-5">
                    <div class="col-sm-3">
                        <a href="#" class="btn btn-lg btn-video" onclick="OpenRetour('evaluation','AE')">
                            <span>Video <i class="fa fa-video"></i></span>
                        </a>
                    </div>
                    <div class="col-sm-3">
                        <a href="${pageContext.request.contextPath}/assets/pdf/Audit%20environnemental/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}"
                           download="" type="button" class="btn btn-lg btn-pdf" >
                            <span>PDF <i class="fa fa-file-pdf"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container mb-5" style="display: none;margin-top: 16rem" id="generalite">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('generalite','lescard')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-user-plus"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.creationcompte"/></h3>
                <p class="description"> <spring:message code="label.pourdeposervosdemande"/> </p>
                <button type="button" data-toggle="modal" data-src="/assets/video/inscription.mp4" data-target="#videoModal" class=" btn btn-info video-btn mt-2"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox darkgreen" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-user-edit"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.modifiercompte"/></h3>
                <p class="description"><spring:message code="label.vouspouvezmodifiervotreprofil"/></p>
                <button type="button" data-toggle="modal" data-src="/assets/video/modiferProfil.mp4" data-target="#videoModal" class=" btn btn-info video-btn " style="margin-top:2rem"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox blue" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-phone"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.contacteradmin"/></h3>
                <p class="description"><spring:message code="label.vouspouvezcontacteradministrateur"/></p>
                <button type="button" data-toggle="modal" data-src="/assets/video/Contact.mp4" data-target="#videoModal" class=" btn btn-info video-btn" style="margin-top:2rem"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox green" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-key"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.changerpassword"/></h3>
                <p class="description"><spring:message code="label.vouspouvezchangervotremotdepasse"/></p>
                <button type="button" data-toggle="modal" data-src="/assets/video/ResetPassword.mp4" data-target="#videoModal" class=" btn btn-info video-btn" style="margin-top:2rem"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-question-circle"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.faqTitre"/></h3>
                <p class="description"> <spring:message code="label.vouspouvezconsulterquestion"/> </p>
                <button type="button" data-toggle="modal" data-src="/assets/video/Faq.mp4" data-target="#videoModal" class=" btn btn-info video-btn" style="margin-top:2rem"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox darkgreen" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-trash"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Cataloguedesdechets"/></h3>
                <p class="description"><spring:message code="label.vouspouvezconsultercatalogue"/></p>
                <button type="button" data-toggle="modal" data-src="/assets/video/cataloguedesdechets.mp4" data-target="#videoModal" class=" btn btn-info video-btn " style="margin-top:1rem"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox blue" style="height:300px">
                <div class="service-icon">
                    <span><i class="fa fa-video"></i></span>
                </div>
                <h3 class="title"><spring:message code="label.Videos"/></h3>
                <p class="description"><spring:message code="label.vouspouvezconsultervideo"/></p>
                <button type="button" data-toggle="modal" data-src="/assets/video/videos.mp4" data-target="#videoModal" class=" btn btn-info video-btn"><spring:message code="label.Afficher"/><i class="far fa-arrow-alt-circle-right ml-2"></i></button>            </div>
        </div>
    </div>

</div>
<div class="container-fluid mb-5" style="display: none;margin-top: 14rem" id="auto">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-3 m-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('auto','lescard')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
    </div>
    <div id="listVideo">

    </div>
</div>
<div class="container-fluid mb-5" style="display: none;margin-top: 14rem" id="auto2">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-3 m-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('auto2','lescard2')"><i class="fa fa-arrow-left"></i> <spring:message code="label.Retour"/></button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <spring:message code="label.Piecesafournir" />
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body" id="document">

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <spring:message code="label.Etape" />
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body" id="Etapes">

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <spring:message code="label.BaseJuridique" />
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body" id="baseJuridique">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- 16:9 aspect ratio -->
                <div class="embed-responsive embed-responsive-16by9">
                    <video autoplay loop class="embed-responsive-item" src="" id="video">
                        <source src="" type="video">
                    </video>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../includes/footer1.jsp"/>
<script>
    function OpenRetour(card1,card2){
        $("#auto").removeClass().addClass("container-fluid mb-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getVideo(card2);
    }
    function OpenRetour2(card1,card2){
        $("#auto2").removeClass().addClass("container-fluid mb-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getDocument(card2);
        getBaseJuridique(card2);
        getImage(card2);
    }
    function OpenAuto(card1,card2){
        $("#"+card1).hide();
        $("#"+card2).show();
    }
    function getDocument(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionDocument/" + type,
            data: {},
            success: function (response) {
                $("#document").html(response);
            },
            error: function () {

            }
        });
    }
    function getBaseJuridique(type){
        $.ajax({
            type: "GET",
            enctype: 'multipart/form-data',
            url: "getBaseJuridique/" + type,
            data: {},
            success: function (response) {
                $("#baseJuridique").html(response);
            },
            error: function (){

            }
        })
    }
    function getImage(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionImage/" + type,
            data: {},
            success: function (response) {
                $("#Etapes").html(response);
            },
            error: function () {

            }
        });
    }
    function getVideo(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionVideo/" + type,
            data: {},
            success: function (response) {
                $("#listVideo").html(response);
            },
            error: function () {

            }
        });
    }
</script>