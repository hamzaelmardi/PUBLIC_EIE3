<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../includes/head.jsp"/>

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

<div class="row">
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
                                            <%--<i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>--%>
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
                                            <%--<i class="hp-box-icon fas fa-user pt-2" style="font-size: 5vw !important;"></i>--%>
                                        <img src="/assets/images/cadnat.png" style=" width: 85px;">
                                        <h3><spring:message code="label.Retrouvezvotrecompte"/></h3>
                                        <hr>
                                        <h6><spring:message code="label.veuillezentrervotreidentifiantpourrecherchevotrecompte"/></h6>




                                        <div>
                                            <div  style="margin-top: 5%;">
                                                <c:choose>
                                                    <c:when test="${pageContext.response.locale=='ar'}">
                                                        <input id="emaily"  dir='rtl' style="width: 95%;margin-left: 3%;" class="form-control" type="text" placeholder="<spring:message code="label.iden"/>"><p id="in_email"></p>
                                                        <label id="chekmail" style=" color: red;"></label>
                                                        <label id="chekmail1" style=" color: greenyellow;"></label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input id="emaily" style="width: 95%;margin-left: 3%;" class="form-control" type="text" placeholder="<spring:message code="label.iden"/>"><p id="in_email"></p>
                                                        <label id="chekmail" style=" color: red;"></label>
                                                        <label id="chekmail1" style=" color: greenyellow;"></label>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <div  style="margin-top: 5%;">

                                                <button type="button" onclick="checkmail1()" id=""  class="btn btn-success mb-2"> <i class="fa fa-unlock" ></i><spring:message code="label.reinitialiservotremotdepasse"/> </button>
                                            </div>
                                        </div>
                                    </div>


                                </c:if>




                                <%--<div class="border  rounded p-2 mt-4 alice_blue">
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
                                --%>
                            </div>
                            <div class="pl-2 pr-2 col-md-2 text-center mb-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer1.jsp"/>
<script>
    function checkmail1(mail){
        var mail = $("#emaily").val();

        var getUrl = window.location;
        //var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
        var baseUrl = getUrl .protocol + "//" + getUrl.host;


        $.get( baseUrl+"/chackmail_reset1/"+mail , function(rep) {
            if(rep == 0){
                $("#emaily").val(mail);
                $("#chekmail").text("merci de saisir un email valide ");
            }

            else if(rep ==1){
                $("#emaily").val("");
                $("#chekmail").hide();
                swal({
                    title: "Message",
                    text: "pour changer votre mot de passe merci de verifier votre boite email",
                    type: "success"
                })
            }

            else {
                window.location.href="/method_pass/"+rep;
            }

        })

    }
</script>
