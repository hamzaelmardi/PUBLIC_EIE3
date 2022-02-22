<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../includes/head.jsp"/>
<head>
    <title> EIE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Dentaire,dent Landing,Bootstrap,App,Template,Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css" />
    <link href="${pageContext.request.contextPath}/assets/css/style.bundle15aa.css" rel="stylesheet" type="text/css" />
    <style>
        .myButton:hover{
            background-color: white;
            color:#16B5D7 ;
            border-color:#16B5D7 ;
        }
        .myButton{
            background-color: #16B5D7;
            color: white
        }
        .myButton .fa-arrow-left{
            color: white;
        }
        .myButton:hover .fa-arrow-left{
            color: #16B5D7;
        }
        #notfound {
            position: relative;
            height: 100vh;
        }

        #notfound .notfound {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .notfound {
            //max-width: 410px;
            width: 100%;
            text-align: center;
        }

        .notfound .notfound-404 {
            height: 250px;
            position: relative;
            z-index: -1;
        }

        .notfound .notfound-404 h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 170px;
            margin: 0px;
            font-weight: 900;
            position: absolute;
            left: 50%;
            -webkit-transform: translateX(-50%);
            -ms-transform: translateX(-50%);
            transform: translateX(-50%);
            background: url(${pageContext.request.contextPath}/assets/images/bg.jpg) no-repeat;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-size: cover;
            background-position: center;
        }


        .notfound h2 {
            font-family: 'Montserrat', sans-serif;
            color: #000;
            font-size: 24px;
            font-weight: 700;
            text-transform: uppercase;
            margin-top: 0;
        }

        .notfound p {
            font-family: 'Montserrat', sans-serif;
            color: #000;
            font-size: 14px;
            font-weight: 400;
            margin-bottom: 20px;
            margin-top: 0px;
        }

        .notfound a {
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
            text-decoration: none;
            text-transform: uppercase;
            background: #0046d5;
            display: inline-block;
            padding: 15px 30px;
            border-radius: 40px;
            color: #fff;
            font-weight: 700;
            -webkit-box-shadow: 0px 4px 15px -5px #0046d5;
            box-shadow: 0px 4px 15px -5px #0046d5;
        }


        @media only screen and (max-width: 767px) {
            .notfound .notfound-404 {
                height: 142px;
            }
            .notfound .notfound-404 h1 {
                font-size: 112px;
            }
        }

    </style>
</head>

<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
<div class="d-flex flex-column flex-root" style="margin-top:14rem">
    <!--begin::Error-->
    <%--    <div class="error error-5 d-flex flex-row-fluid bgi-size-cover bgi-position-center" style="background-image: url(${pageContext.request.contextPath}/assets/images/error.png);">--%>
    <div class="error error-5 d-flex flex-row-fluid bgi-size-cover bgi-position-center">
        <!--begin::Content-->
        <div class="container d-flex flex-row-fluid flex-column justify-content-md-center p-4 col-9 " >
            <div class="notfound m-auto">
                <div class="notfound-404">
                    <h1 class="font-weight-boldest display-4 f-16  mt-10 mt-md-0 mb-12 m-auto " style="font-size: 25pt;color: #e22a7ff2">Désolé, quelque chose s'est mal passé</h1>
                </div>
            </div>
            <br>
            <h1 class="font-weight-boldest display-4 f-16  mt-10 mt-md-0 mb-12 m-auto " style="font-size: 25pt;color: #336c4e">Veuillez réessayer plus tard</h1>
            <br>
            <br>
            <p class="m-auto font-size-h3">nous y travaillons et nous le réparerons dès que possible.</p>
            <br>
            <input type="hidden" name="error" id="error" value="${pageContext.exception.toString()}" />
            <input type="hidden" name="errorurl" id="errorurl" value="${pageContext.errorData.requestURI}" />
            <input type="hidden" name="errorStatutCode" id="errorStatutCode" value="${pageContext.errorData.statusCode}" />
           <%-- <div class="m-auto">
                <a type="button" class="btn btn-danger" onclick="SendMessageError()">Envoyer l'erreur a les spécialistes</a>
            </div>--%>
        </div>
    </div>

</div>
<script>
    $(document).ready(function(){
        var errorMessage = $("#error").val();
        var errorUrl = $("#errorurl").val();
        var errorStatutCode = $("#errorStatutCode").val();
        $.ajax({
            type: "POST",
            url: "/sendError",
            data: {
                "errorMessage":errorMessage,
                "errorUrl":errorUrl,
                "errorStatutCode":errorStatutCode,
            },
            success: function (response) {
                console.log("Error a sent by email seccesfully :)");
            },
            error: function (response) {
            }
        });
    });
</script>

</body>
<jsp:include page="../includes/footer1.jsp"/>
