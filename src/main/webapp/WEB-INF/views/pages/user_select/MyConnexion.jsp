<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head_temp.jsp"/>
<%--
<style>

    .f_20{
        font-size: 20px;
    }
    .f_28{
        font-size: 28px;
    }

    .ligne_white{
        height: 1px;
        background: white;
        width: 100%;
        margin-bottom: 5px;
    }

    .bg_stat_01{
        background: linear-gradient(to right, #01a9ac, #01dbdf);
        color: white;
        padding: 0;
    }

    .bg_stat_02{
        background: linear-gradient(to right, #0ac282, #0df3a3);
        color: white;
        padding: 0;
    }

    .paral {
        height: 500px;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
    .paral p {
        font-size: 25px;
        color: white;
        text-align: center;
        margin-top: -20px;
        font-weight: bold;

    }

    .paral h1 {
        color: rgba(255, 255, 255, 0.8);
        font-size: 60px;
        text-align: center;
    //padding-top: -20px;
        line-height: 100px;
    }
    .parallax {
        background-image: url("../../assets/images/parallax.png");
    }
    .frm_cal{
        background: aliceblue;
        border-radius: 3px;
        width: 100px;
        font-size: 14px;
        padding: 0px 5px;
    }

    .step:hover{
        width: auto;
        opacity: unset;
        cursor: unset;
    }
    .disp_none{
        display: none;
    }

    .timeline hr, .timeline .corner, .col-2::after{
        border-top: 3px solid green !important;
        border-right-color: green !important;
        border-bottom-color: green !important;
        border-left-color: green !important;
    }
    .circle{
        background-color: green !important;
    }

    .div_shadow{
        background: #336c4e;
        cursor: pointer;
        padding: 40px 0;
        border-radius:24px;
        min-height: 200px;
    }
    .block_vert{
        color:white;
        font-size: 40px;
        padding: 15px;
    }
    .alice_blue{
        background: aliceblue;
    }

    .folder_icon{
        color: #336c4e;
        font-size: 27px;
    }
    img {
        max-width: 100%;
    }
    img:hover {
        opacity: 0.5;
        cursor: pointer;
    }

    /* CSS Grid*/
    .img-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 5px;
    }

    /* Media Query for changing grid on bigger screens*/

    /* Bigger than Phones(tablet) */
    @media only screen and (min-width: 750px) {
        .img-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    /* Bigger than Phones(laptop / desktop) */
    @media only screen and (min-width: 970px) {
        .img-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }




    .close {
        float: none;
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1;
        color: white;
        text-shadow: 0 1px 0 #fff;
        opacity: 0.8;
        margin-left: 10%;
    }

    .tree .container-fluid {
        padding-top: 15%;
        font-size: 13px;
        text-align: center;
    }
    /*#region Organizational Chart*/
    .tree * {
        margin: 0; padding: 0;
    }
    .tree ul {
        padding-top: 20px; position: relative;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    .tree li {
        float: left; text-align: center;
        list-style-type: none;
        position: relative;
        padding: 20px 5px 0 5px;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*We will use ::before and ::after to draw the connectors*/
    .tree li::before, .tree li::after{
        content: '';
        position: absolute; top: 0; right: 50%;
        border-top: 2px solid #696969;
        width: 50%; height: 20px;
    }
    .tree li::after{
        right: auto; left: 50%;
        border-left: 2px solid #696969;
    }
    /*We need to remove left-right connectors from elements without
    any siblings*/
    .tree li:only-child::after, .tree li:only-child::before {
        display: none;
    }
    /*Remove space from the top of single children*/
    .tree li:only-child{ padding-top: 0;}
    /*Remove left connector from first child and
    right connector from last child*/
    .tree li:first-child::before, .tree li:last-child::after{
        border: 0 none;
    }
    /*Adding back the vertical connector to the last nodes*/
    .tree li:last-child::before{
        border-right: 2px solid #696969;
        border-radius: 0 5px 0 0;
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
    }
    .tree li:first-child::after{
        border-radius: 5px 0 0 0;
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
    }
    /*Time to add downward connectors from parents*/
    .tree ul ul::before{
        content: '';
        position: absolute; top: 0; left: 50%;
        border-left: 2px solid #696969;
        width: 0; height: 20px;
    }

    .tree li i {
        color: white !important;
    }
    .tree li .row {
        color: white !important;
    }
    .tree li a{
        border-radius: 50% !important;
        background-color: #336c4e !important;
        color: white;
        height: 100px;
        width: 200px;
        padding: 5px 10px;
        text-decoration: none;
        background-color: white;
        color: #8b8b8b;
        font-family: arial, verdana, tahoma;
        font-size: 11px;
        display: inline-block;
        box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*Time for some hover effects*/
    /*We will apply the hover effect the the lineage of the element also*/
    .tree li a:hover, .tree li a:hover+ul li a {
        background: #cbcbcb; color: #000;
    }
    /*Connector styles on hover*/
    .tree li a:hover+ul li::after,
    .tree li a:hover+ul li::before,
    .tree li a:hover+ul::before,
    .tree li a:hover+ul ul::before{
        border-color:  #94a0b4;
    }
    /*#endregion*/
</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>

<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .tab-pane  {
            text-align: right;
            padding-right:10px ;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .tab-pane {
            text-align: left;
            padding-left:10px ;
        }
    </style>
</c:if>

<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>


<style type="text/css" media="screen">
    .badge {
        display: inline-block;
        background-color: #ff5c5c;
        border-radius: 50%;
        color: #fff;
        padding: 0.5em 0.75em;
        position: relative;
    }
    .centerr{
        margin-left: auto;
        margin-right: auto;
        text-align: center;

        display: inherit;
        margin-top: -22px;
        font-size: 29px;}
    .btt{
        background: unset !important;
        color: #050050;
        border: unset;
        margin-left:16px;
        border-top-color: unset;
        border-right-color: unset;
        border-bottom-color: unset;
        border-left-color: unset;
        font-weight: 300;}

    .pulsate::before {
        content: '';
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        animation: pulse 1s ease infinite;
        border-radius: 50%;
        border: 4px double #ff5c5c;
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
            opacity: 1;
        }
        60% {
            transform: scale(1.3);
            opacity: 0.4;
        }
        100% {
            transform: scale(1.35);
            opacity: 0;
        }
    }
</style>

<style>
    .stCaroussel{
        color: white;
        BACKGROUND: #336c4e;
        padding: 12px;
    }

    .f_20{
        font-size: 20px;
    }

    .bcc{
        background: white !important;
        color: #336c4e !important;
        padding: 8px;
    }
    .f_28{
        font-size: 28px;
    }

    .ligne_white{
        height: 1px;
        background: white;
        width: 100%;
        margin-bottom: 5px;
    }

    .bg_stat_01{
        background: linear-gradient(to right, #01a9ac, #01dbdf);
        color: white;
        padding: 0;
    }

    .bg_stat_02{
        background: linear-gradient(to right, #0ac282, #0df3a3);
        color: white;
        padding: 0;
    }

    .paral {
        height: 500px;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
    .paral p {
        font-size: 25px;
        color: white;
        text-align: center;
        margin-top: -20px;
        font-weight: bold;

    }

    .paral h1 {
        color: rgba(255, 255, 255, 0.8);
        font-size: 60px;
        text-align: center;
    //padding-top: -20px;
        line-height: 100px;
    }
    .parallax {
        background-image: url("../../assets/images/parallax.png");
    }
    .frm_cal{
        background: aliceblue;
        border-radius: 3px;
        width: 100px;
        font-size: 14px;
        padding: 0px 5px;
    }

    .step:hover{
        width: auto;
        opacity: unset;
        cursor: unset;
    }
    .disp_none{
        display: none;
    }

    .timeline hr, .timeline .corner, .col-2::after{
        border-top: 3px solid green !important;
        border-right-color: green !important;
        border-bottom-color: green !important;
        border-left-color: green !important;
    }
    .circle{
        background-color: green !important;
    }

    .div_shadow{
        background: #336c4e;
        cursor: pointer;
        padding: 40px 0;
        border-radius:24px;
        min-height: 200px;
    }
    .block_vert{
        color:white;
        font-size: 40px;
        padding: 15px;
    }
    .alice_blue{
        background: aliceblue;
    }

    .folder_icon{
        color: #336c4e;
        font-size: 27px;
    }
    img {
        max-width: 100%;
    }
    img:hover {
        opacity: 0.5;
        cursor: pointer;
    }

    /* CSS Grid*/
    .img-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 5px;
    }

    /* Media Query for changing grid on bigger screens*/

    /* Bigger than Phones(tablet) */
    @media only screen and (min-width: 750px) {
        .img-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    /* Bigger than Phones(laptop / desktop) */
    @media only screen and (min-width: 970px) {
        .img-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }




    .close {
        float: none;
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1;
        color: white;
        text-shadow: 0 1px 0 #fff;
        opacity: 0.8;
        margin-left: 10%;
    }

    .tree .container-fluid {
        padding-top: 15%;
        font-size: 13px;
        text-align: center;
    }
    /*#region Organizational Chart*/
    .tree * {
        margin: 0; padding: 0;
    }
    .tree ul {
        padding-top: 20px; position: relative;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    .tree li {
        float: left; text-align: center;
        list-style-type: none;
        position: relative;
        padding: 20px 5px 0 5px;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*We will use ::before and ::after to draw the connectors*/
    .tree li::before, .tree li::after{
        content: '';
        position: absolute; top: 0; right: 50%;
        border-top: 2px solid #696969;
        width: 50%; height: 20px;
    }
    .tree li::after{
        right: auto; left: 50%;
        border-left: 2px solid #696969;
    }
    /*We need to remove left-right connectors from elements without
    any siblings*/
    .tree li:only-child::after, .tree li:only-child::before {
        display: none;
    }
    /*Remove space from the top of single children*/
    .tree li:only-child{ padding-top: 0;}
    /*Remove left connector from first child and
    right connector from last child*/
    .tree li:first-child::before, .tree li:last-child::after{
        border: 0 none;
    }
    /*Adding back the vertical connector to the last nodes*/
    .tree li:last-child::before{
        border-right: 2px solid #696969;
        border-radius: 0 5px 0 0;
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
    }
    .tree li:first-child::after{
        border-radius: 5px 0 0 0;
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
    }
    /*Time to add downward connectors from parents*/
    .tree ul ul::before{
        content: '';
        position: absolute; top: 0; left: 50%;
        border-left: 2px solid #696969;
        width: 0; height: 20px;
    }

    .tree li i {
        color: white !important;
    }
    .tree li .row {
        color: white !important;
    }
    .tree li a{
        border-radius: 50% !important;
        background-color: #336c4e !important;
        color: white;
        height: 100px;
        width: 200px;
        padding: 5px 10px;
        text-decoration: none;
        background-color: white;
        color: #8b8b8b;
        font-family: arial, verdana, tahoma;
        font-size: 11px;
        display: inline-block;
        box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*Time for some hover effects*/
    /*We will apply the hover effect the the lineage of the element also*/
    .tree li a:hover, .tree li a:hover+ul li a {
        background: #cbcbcb; color: #000;
    }
    /*Connector styles on hover*/
    .tree li a:hover+ul li::after,
    .tree li a:hover+ul li::before,
    .tree li a:hover+ul::before,
    .tree li a:hover+ul ul::before{
        border-color:  #94a0b4;
    }
    /*#endregion*/
</style>
<style>
    #etprow .timeline{
        height: 25px;
        margin-top: -1%;
    }
    .circle {
        padding: 0px 10px;
        border-radius: 50%;
        background-color: #ED8D8D;
        color: #fff;
        max-height: 30px;
        z-index: 2;
    }

    .how-it-works.row .col-2 {
        align-self: stretch;
    }
    .how-it-works.row .col-2::after {
        content: "";
        position: absolute;
        border-left: 3px solid #ED8D8D;
        z-index: 1;
    }
    .how-it-works.row .col-2.bottom::after {
        height: 50%;
        left: 50%;
        top: 50%;
    }
    .how-it-works.row .col-2.full::after {
        height: 100%;
        left: calc(50% - 3px);
    }
    .how-it-works.row .col-2.top::after {
        height: 50%;
        left: 50%;
        top: 0;
    }


    .timeline div {
        padding: 0;
        height: 40px;
    }
    .timeline hr {
        border-top: 3px solid #ED8D8D;
        margin: 0;
        top: 17px;
        position: relative;
    }
    .timeline .col-2 {
        display: flex;
        overflow: hidden;
    }
    .timeline .corner {
        border: 3px solid #ED8D8D;
        width: 100%;
        position: relative;
        border-radius: 15px;
    }
    .timeline .top-right {
        left: 50%;
        top: -50%;
    }
    .timeline .left-bottom {
        left: -50%;
        top: calc(50% - 3px);
    }
    .timeline .top-left {
        left: -50%;
        top: -50%;
    }
    .timeline .right-bottom {
        left: 50%;
        top: calc(50% - 3px);
    }


    span.icon-number {
        border: 2px solid;
        width: 30px !important;
        height: 30px !important;
        background: red;
        color: #fff;
        border-radius: 50%;
        line-height: 18px;
        font-family: 'Open Sans', sans-serif;
        padding-top: 5px;
        position: absolute;
        padding-left: 8px;
    }

    ul#myTab a {
        color: black;
    }
    .btn-success {
        background-color: #336c4e;
        border-color: #336c4e;
    }
</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>


<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .tab-pane  {
            text-align: right;
            padding-right:10px ;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .tab-pane {
            text-align: left;
            padding-left:10px ;
        }
    </style>
</c:if>--%>

<style type="text/css" media="screen">
    .badge {
        display: inline-block;
        background-color: #ff5c5c;
        border-radius: 50%;
        color: #fff;
        padding: 0.5em 0.75em;
        position: relative;
    }
    .centerr{
        margin-left: auto;
        margin-right: auto;
        text-align: center;

        display: inherit;
        margin-top: -22px;
        font-size: 29px;}
    .btt{
        background: unset !important;
        color: #050050;
        border: unset;
        margin-left:16px;
        border-top-color: unset;
        border-right-color: unset;
        border-bottom-color: unset;
        border-left-color: unset;
        font-weight: 300;}

    .pulsate::before {
        content: '';
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        animation: pulse 1s ease infinite;
        border-radius: 50%;
        border: 4px double #ff5c5c;
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
            opacity: 1;
        }
        60% {
            transform: scale(1.3);
            opacity: 0.4;
        }
        100% {
            transform: scale(1.35);
            opacity: 0;
        }
    }
</style>

<style>
    .stCaroussel{
        color: white;
        BACKGROUND: #336c4e;
        padding: 12px;
    }

    .f_20{
        font-size: 20px;
    }

    .bcc{
        background: white !important;
        color: #336c4e !important;
        padding: 8px;
    }
    .f_28{
        font-size: 28px;
    }

    .ligne_white{
        height: 1px;
        background: white;
        width: 100%;
        margin-bottom: 5px;
    }

    .bg_stat_01{
        background: linear-gradient(to right, #01a9ac, #01dbdf);
        color: white;
        padding: 0;
    }

    .bg_stat_02{
        background: linear-gradient(to right, #0ac282, #0df3a3);
        color: white;
        padding: 0;
    }

    .paral {
        height: 500px;
        background-attachment: fixed;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
    .paral p {
        font-size: 25px;
        color: white;
        text-align: center;
        margin-top: -20px;
        font-weight: bold;

    }

    .paral h1 {
        color: rgba(255, 255, 255, 0.8);
        font-size: 60px;
        text-align: center;
    //padding-top: -20px;
        line-height: 100px;
    }
    .parallax {
        background-image: url("../../assets/images/parallax.png");
    }
    .frm_cal{
        background: aliceblue;
        border-radius: 3px;
        width: 100px;
        font-size: 14px;
        padding: 0px 5px;
    }

    .step:hover{
        width: auto;
        opacity: unset;
        cursor: unset;
    }
    .disp_none{
        display: none;
    }

    .timeline hr, .timeline .corner, .col-2::after{
        border-top: 3px solid green !important;
        border-right-color: green !important;
        border-bottom-color: green !important;
        border-left-color: green !important;
    }
    .circle{
        background-color: green !important;
    }

    .div_shadow{
        background: #336c4e;
        cursor: pointer;
        padding: 40px 0;
        border-radius:24px;
        min-height: 200px;
    }
    .block_vert{
        color:white;
        font-size: 40px;
        padding: 15px;
    }
    .alice_blue{
        background: aliceblue;
    }

    .folder_icon{
        color: #336c4e;
        font-size: 27px;
    }
    img {
        max-width: 100%;
    }
    img:hover {
        opacity: 0.5;
        cursor: pointer;
    }

    /* CSS Grid*/
    .img-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 5px;
    }

    /* Media Query for changing grid on bigger screens*/

    /* Bigger than Phones(tablet) */
    @media only screen and (min-width: 750px) {
        .img-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    /* Bigger than Phones(laptop / desktop) */
    @media only screen and (min-width: 970px) {
        .img-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }




    .close {
        float: none;
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1;
        color: white;
        text-shadow: 0 1px 0 #fff;
        opacity: 0.8;
        margin-left: 10%;
    }

    .tree .container-fluid {
        padding-top: 15%;
        font-size: 13px;
        text-align: center;
    }
    /*#region Organizational Chart*/
    .tree * {
        margin: 0; padding: 0;
    }
    .tree ul {
        padding-top: 20px; position: relative;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    .tree li {
        float: left; text-align: center;
        list-style-type: none;
        position: relative;
        padding: 20px 5px 0 5px;
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*We will use ::before and ::after to draw the connectors*/
    .tree li::before, .tree li::after{
        content: '';
        position: absolute; top: 0; right: 50%;
        border-top: 2px solid #696969;
        width: 50%; height: 20px;
    }
    .tree li::after{
        right: auto; left: 50%;
        border-left: 2px solid #696969;
    }
    /*We need to remove left-right connectors from elements without
    any siblings*/
    .tree li:only-child::after, .tree li:only-child::before {
        display: none;
    }
    /*Remove space from the top of single children*/
    .tree li:only-child{ padding-top: 0;}
    /*Remove left connector from first child and
    right connector from last child*/
    .tree li:first-child::before, .tree li:last-child::after{
        border: 0 none;
    }
    /*Adding back the vertical connector to the last nodes*/
    .tree li:last-child::before{
        border-right: 2px solid #696969;
        border-radius: 0 5px 0 0;
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
    }
    .tree li:first-child::after{
        border-radius: 5px 0 0 0;
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
    }
    /*Time to add downward connectors from parents*/
    .tree ul ul::before{
        content: '';
        position: absolute; top: 0; left: 50%;
        border-left: 2px solid #696969;
        width: 0; height: 20px;
    }

    .tree li i {
        color: white !important;
    }
    .tree li .row {
        color: white !important;
    }
    .tree li a{
        border-radius: 50% !important;
        background-color: #336c4e !important;
        color: white;
        height: 100px;
        width: 200px;
        padding: 5px 10px;
        text-decoration: none;
        background-color: white;
        color: #8b8b8b;
        font-family: arial, verdana, tahoma;
        font-size: 11px;
        display: inline-block;
        box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        -transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    /*Time for some hover effects*/
    /*We will apply the hover effect the the lineage of the element also*/
    .tree li a:hover, .tree li a:hover+ul li a {
        background: #cbcbcb; color: #000;
    }
    /*Connector styles on hover*/
    .tree li a:hover+ul li::after,
    .tree li a:hover+ul li::before,
    .tree li a:hover+ul::before,
    .tree li a:hover+ul ul::before{
        border-color:  #94a0b4;
    }
    /*#endregion*/
</style>
<style>
    #etprow .timeline{
        height: 25px;
        margin-top: -1%;
    }
    .circle {
        padding: 0px 10px;
        border-radius: 50%;
        background-color: #ED8D8D;
        color: #fff;
        max-height: 30px;
        z-index: 2;
    }

    .how-it-works.row .col-2 {
        align-self: stretch;
    }
    .how-it-works.row .col-2::after {
        content: "";
        position: absolute;
        border-left: 3px solid #ED8D8D;
        z-index: 1;
    }
    .how-it-works.row .col-2.bottom::after {
        height: 50%;
        left: 50%;
        top: 50%;
    }
    .how-it-works.row .col-2.full::after {
        height: 100%;
        left: calc(50% - 3px);
    }
    .how-it-works.row .col-2.top::after {
        height: 50%;
        left: 50%;
        top: 0;
    }


    .timeline div {
        padding: 0;
        height: 40px;
    }
    .timeline hr {
        border-top: 3px solid #ED8D8D;
        margin: 0;
        top: 17px;
        position: relative;
    }
    .timeline .col-2 {
        display: flex;
        overflow: hidden;
    }
    .timeline .corner {
        border: 3px solid #ED8D8D;
        width: 100%;
        position: relative;
        border-radius: 15px;
    }
    .timeline .top-right {
        left: 50%;
        top: -50%;
    }
    .timeline .left-bottom {
        left: -50%;
        top: calc(50% - 3px);
    }
    .timeline .top-left {
        left: -50%;
        top: -50%;
    }
    .timeline .right-bottom {
        left: 50%;
        top: calc(50% - 3px);
    }


    span.icon-number {
        border: 2px solid;
        width: 30px !important;
        height: 30px !important;
        background: red;
        color: #fff;
        border-radius: 50%;
        line-height: 18px;
        font-family: 'Open Sans', sans-serif;
        padding-top: 5px;
        position: absolute;
        padding-left: 8px;
    }

    ul#myTab a {
        color: black;
    }
    .btn-success {
        background-color: #336c4e;
        border-color: #336c4e;
    }
</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>


<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .tab-pane  {
            text-align: right;
            padding-right:10px ;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .tab-pane {
            text-align: left;
            padding-left:10px ;
        }
    </style>
</c:if>


<div style="height: 240px"></div>
<div class="row div_2">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="row pr-2 justify-content-center">
            <div class="pl-2 pr-2 col-md-6 text-center mb-2">
                    <div class="border rounded p-2">
                            <%--<i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>--%>
                        <img src="/assets/images/cadnat.png" style=" width: 85px;">
                        <h3>
						<spring:message code="label.Authentification" />
					</h3>
                        <form id="formlogin" name="formlogin" action="/myLogin" method="post">
                            <div style="margin-top: 5%;">
                                <c:choose>
                                    <c:when test="${pageContext.response.locale=='ar'}">
                                        <input name="j_name" dir='rtl' onchange="affiche_captcha('captcha_test','j_name','j_pass')"
                                               style="width: 95%;margin-left: 3%;" class="form-control inputlog"
                                               type="text" required
                                               placeholder="Enntrez Votre Email">
                                        <input name="j_pass" dir='rtl' onchange="affiche_captcha('captcha_test','j_name','j_pass')"
                                               style="margin-top: 2%;width: 95%;margin-left: 3%;"
                                               class="form-control inputlog" type="password" required
                                               placeholder=" <spring:message code="label.Password"/>"><br>
                                        <div id="captcha_test" dir="rtl" class="capbox collapse">

                                            <div id="CaptchaDiv" id="CaptchaDiv"></div>

                                            <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <spring:message code="label.Tapezlenumero"/><br>


                                                    <%--<input type="hidden" name="societesId" value="10">--%>

                                                <input type="hidden" id="txtCaptcha">
                                                <input type="text" name="captcha" id="Captchay" size="15"><br>

                                            </div>
                                        </div><br><br>
                                    </c:when>
                                    <c:otherwise>
                                        <input name="j_name" style="width: 95%;margin-left: 3%;" onchange="affiche_captcha('captcha_test','j_name','j_pass')"
                                               class="form-control inputlog" type="text" required
                                               placeholder="<spring:message code="label.email"/>">
                                        <input name="j_pass"
                                               style="margin-top: 2%;width: 95%;margin-left: 3%;" onchange="affiche_captcha('captcha_test','j_name','j_pass')"
                                               class="form-control inputlog" type="password" required
                                               placeholder=" <spring:message code="label.Password"/>"><br>
                                        <div id="captcha_test" dir="ltr" class="capbox collapse">

                                            <div id="CaptchaDiv" name="CaptchaDiv"></div>

                                            <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <spring:message code="label.Tapezlenumero"/><br>


                                                    <%--<input type="hidden" name="societesId" value="10">--%>

                                                <input type="hidden" id="txtCaptcha">
                                                <input type="text" name="captcha" id="Captchay" size="15"><br>

                                            </div>
                                        </div><br><br>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div style="margin-top: 5%;">
                                <button type="submit" class="btn btn-success mb-2"><i
                                        class="fa fa-unlock"></i> <spring:message
                                        code="button.Seconnecter"/></button>
                            </div>
                        </form>
                    </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>




<%--<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="pl-2 pr-2 col-md-2 text-center mb-2"></div>
                            <div class="pl-2 pr-2 col-md-8 text-center mb-2"style=" max-width: 521px; margin: auto;">
                                <c:if test="${user.email!=null}">
                                    <div class="border rounded p-2">
                                            &lt;%&ndash;<i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>&ndash;%&gt;
                                        <img src="/assets/images/cadnat.png" style=" width: 85px;">
                                        <h3>${ user.email}</h3>
                                        <form action="/login" method="get">
                                            <div  style="margin-top: 5%;">

                                            </div>
                                            <div style="margin-top: 5%;">

                                                <a href="/logout"  class="btn btn-success"> <i class="fa fa-user-plus" ></i> <spring:message code="label.sedeconnecter"/></a>
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
                                <c:if test="${user.email==null}">
                                    <div class="border rounded p-2">
                                            &lt;%&ndash;<i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>&ndash;%&gt;
                                        <img src="/assets/images/cadnat.png" style=" width: 85px;">
                                        <h3><spring:message code="label.espacedemandeur"/></h3>
                                        <form name="formconexion" id="formconexion" action="/login" method="get">
                                            <div  style="margin-top: 5%;">
                                                <c:choose>
                                                    <c:when test="${pageContext.response.locale=='ar'}">
                                                        <input name="j_name"  dir='rtl' style="width: 95%;margin-left: 3%;" class="form-control" type="text"  required placeholder="<spring:message code="label.iden"/>">
                                                        <input name="j_pass" dir='rtl' style="margin-top: 2%;width: 95%;margin-left: 3%;" class="form-control" type="password" required placeholder=" <spring:message code="label.Password"/>"><br>
                                                        <div dir="rtl" class="capbox text-left">

                                                            <div id="CaptchaDiv" id="CaptchaDiv"></div>

                                                            <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                                <spring:message code="label.Tapezlenumero"/><br>


                                                                    &lt;%&ndash;<input type="hidden" name="societesId" value="10">&ndash;%&gt;

                                                                <input type="hidden" id="txtCaptcha">
                                                                <input type="text" name="captcha" id="Captchay" size="15"><br>

                                                            </div>
                                                        </div><br><br>
                                                        <a href="/forget" dir='rtl' style="color:#1d1761 ;font-size: 13px; ">avez-vous oublié votre mot de passe ?</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="j_name" style="width: 95%;margin-left: 3%;" class="form-control" type="text" required placeholder="<spring:message code="label.iden"/>">
                                                        <input name="j_pass"  style="margin-top: 2%;width: 95%;margin-left: 3%;" class="form-control" type="password" required placeholder=" <spring:message code="label.Password"/>"><br>
                                                        <div dir="ltr" class="capbox text-left">

                                                            <div id="CaptchaDiv" id="CaptchaDiv"></div>

                                                            <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                                <spring:message code="label.Tapezlenumero"/><br>


                                                                    &lt;%&ndash;<input type="hidden" name="societesId" value="10">&ndash;%&gt;

                                                                <input type="hidden" id="txtCaptcha">
                                                                <input type="text" name="captcha" id="Captchay" size="15"><br>

                                                            </div>
                                                        </div><br><br>
                                                        <a href="/forget" dir='ltr' style="color:#1d1761 ;font-size: 13px;"> avez-vous oublié votre mot de passe ?</a>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <div  style="margin-top: 5%;">

                                                <button type="submit"  class="btn btn-success mb-2 mr-3"> <i class="fa fa-unlock" ></i> <spring:message code="button.Seconnecter"/></button>
                                                <a href="/demandez_compte"  class="btt mb-2" style="color: black !important;"> <i style="margin-right: 5px;color: black !important;" class="fa fa-user-plus" ></i><spring:message code="label.Senregistrer"/></a>
                                            </div>
                                        </form>
                                    </div>


                                </c:if>




                                &lt;%&ndash;<div class="border  rounded p-2 mt-4 alice_blue">
                                    <div class="row p-0 m-0 mb-2 justify-content-center">
                            <div class="col-8 m-0 p-0 text-center">
                                <h5 class="mt-3 pl-1">
                                    <div class="position-relative">
                                        <i class="fa fa-folder-open d-inline-block folder_icon"></i>
                                        <span><spring:message code="label.StatutduDossier"/></span>
                                    </div>
                                </h5>
                            </div>
                        </div>

                            <div class="row m-0 p-0">
                            <div class="col-12">
                            <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="text" placeholder="<spring:message code="label.VotreReferencesdossier"/>" class="form-control etatmain"
                            name="num_notification" id="num_notifications">
                            <span id="notifSt"></span>
                            <button  class="btn btn-success etatmain mt-2" onclick="checknotifStatut()" ><i class="fa fa-check-circle"></i> <spring:message code="button.VerifierVotreDossier"/></button>

                            <div style="width: 90%;margin-left: 5%;display: none" id="retsecmainetat">
                            <div style="width: 100%" id="alertetat" class="alert alert-danger" role="alert">
                            <spring:message code="label.Resultatintrouvable"/>
                            </div>
                            <button onclick="retsecmainetat()" style="background-color: #336c4e;color: white" class="btn" ><spring:message code="button.Precedent"/></button>
                            </div>
                            </div>
                            </div>


                        </div>
                                &ndash;%&gt;
                            </div>
                            <div class="pl-2 pr-2 col-md-2 text-center mb-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>

<jsp:include page="../../includes/footer1_temp.jsp"/>
<script>
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formconexion']").validate({




            // Specify validation rules
            rules: {
                j_name: {
                    required: true
                },
                j_pass: {
                    required: true
                },
                captcha : {
                    required: true,
                    number : true,
                    minlength: 5,
                    maxlength: 5,
                    equalTo : '#txtCaptcha'
                },




            },


            // Specify validation error messages
            messages: {
                j_name: "Veuillez saisir votre identifiant valide",
                j_pass: "Veuillez saisir votre mot de passe",
                captcha: "S'il vous plaît, mettez un nombre valide",


            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });
</script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
