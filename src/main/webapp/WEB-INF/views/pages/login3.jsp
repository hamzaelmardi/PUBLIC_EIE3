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
                            <div class="col-md-12 col-sm-12 pl-2 pr-2 mb-2" id="zone_rech">
                                <div class="border  rounded" style="height: 100%">
                                    <div class="row p-0 m-0 mt-5">
                                        <div class="col-2 ">
                                            <button id="btnprcd" style="background-color: #336c4e;color: white" class="btn disp_none" onclick="retsecmain()"><spring:message code="button.Precedent"/></button>
                                        </div>
                                        <div class="col-2"></div>

                                    </div>
                                    <div class="row m-0 p-0 text-center mt-5 mb-5" id="sectmain">
                                        <div class="col-6 d-block block_vert hvr-float-shadow" onclick="sectautoris()" >
                                            <div class="div_shadow rounded" style="border-top-right-radius: 100px !important; border-bottom-left-radius: 100px !important; box-shadow: inset 0 0 10px #000000;">
                                                <i class="fa fa-recycle"></i>
                                                <h6>
                                                    <spring:message code="label.AutorisationsdesDechets"/>
                                                    <%--<spring:message code="label.aut" />--%>
                                                </h6>
                                            </div>

                                        </div>
                                        <div class="col-6 d-block block_vert hvr-float-shadow">
                                            <div class="div_shadow rounded" onclick="sectevaluation()" style="border-bottom-right-radius: 100px !important;border-top-left-radius: 100px !important; box-shadow: inset 0 0 10px #000000;">
                                                <i  class="fa fa-tree" ></i>
                                                <h6><spring:message code="label.EvaluationEnvironnementale"/></h6>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row justify-content-center mt-4" id="zone_select">
                                        <div class="col-md-8 col-sm-12 mt-4">
                                            <div id="slct1" class="text-center disp_none mb-4">
                                                <h4><i class="fa fa-check-circle"></i> <spring:message code="label.Autorisations"/></h4>
                                                <select onchange="getDocs()" id="slct1change" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;" ${dd}>
                                                    <option><spring:message code="option.Choisir"/></option>
                                                    <option value="ZF"><spring:message code="option.Importationdechetszonefranche"/></option>
                                                    <option value="CT"><spring:message code="option.Collectetransportdesdechetsdangereux"/></option>
                                                    <option value="ET"><spring:message code="option.Importationdesdechetsnondangereuxdunpaysetranger"/></option>
                                                    <option value="IE"><spring:message code="option.Importationdesdechetsnondangereudunezonefranche"/></option>
                                                    <option value="IT"><spring:message code="option.Installationdetraitementdesdechets"/></option>
                                                    <option value="XD"><spring:message code="option.Exportationdesdechetsedangereux"/> </option>
                                                    <option value="TR"><spring:message code="option.TransitdesDechets"/> </option>
                                                    <option value="DL"><spring:message code="option.Demandedelicencedimportationdesdechetsnonferreux"/> </option>
                                                </select>
                                            </div>

                                            <div id="slct2" class="text-center disp_none mt-4" style="border-bottom-left-radius: 50px">
                                                <h4> <spring:message code="label.EvaluationEnvironnementale"/></h4>
                                                <select onchange="slct2()" id="slct2change" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;" ${dd}>
                                                    <option><spring:message code="option.Choisir"/></option>
                                                    <option value="1"><spring:message code="option.Auditenvironnementale"/></option>
                                                    <option value="2"><spring:message code="option.Noticedimpact"/></option>
                                                    <option value="3"><spring:message code="option.Etudedimpactenvironnementale"/></option>
                                                </select>
                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--
            <div class="row">
                <div class="col-12 col-md-1"></div>

                <c:if test="${user.email!=null}">
                    <div class="col-12 col-md-3">
                        <section style="border-style: groove;text-align: center;margin: 5%;width: 100%;">
                            <i class="hp-box-icon fas fa-user" style="font-size: 5vw !important;margin-top: 3%"></i>
                            <h3>Espace demandeur</h3>


                                <div  style="margin-top: 5%;">
                                    <label>Nom : </label><span class="txt">${user.email==null?"se connecter":user.email}</span>

                                </div>
                                <div  style="margin-top: 5%;">
                                    <a href="/logout"  class="btn btn-success"> <i class="fa fa-user-plus" ></i> se deconnecter</a>
                                </div>



                            <div  style="margin-top: 3%;">

                            </div>
                            <br/>


                        </section>

                        <section style="border-style: groove;text-align: center;margin: 5%;width: 100%;">

                            <div style="background-color: aliceblue">
                                <div style="display: flex;margin-left: 32%;">
                                    <i class="fa fa-folder-open"  style="padding-left: 5px;font-size: 35px;color: #336c4e;"></i> <h5 style="padding-top: 3%;padding-left: 5px;">  Etat Dossier</h5>
                                </div>
                                <div>

                                    <input style="width: 75%;margin-left: 12%;" type="text" placeholder="Votre Réferences dossier" class="form-control etatmain" >

                                    <button style="margin-top: 1%"  class="btn btn-success etatmain" onclick="verifetat()" ><i class="fa fa-check-circle"></i> Vérifier Dossier</button>


                                    <div style="width: 90%;margin-left: 5%;display: none" id="retsecmainetat">
                                        <div style="width: 100%" id="alertetat" class="alert alert-danger" role="alert">
                                            Résultat introuvable
                                        </div>
                                        <button onclick="retsecmainetat()" style="background-color: #336c4e;color: white" class="btn" >Précédent</button>
                                    </div>
                                </div>

                                <br/>
                            </div>
                        </section>

                    </div>
                </c:if>
                <c:if test="${user.email==null}">
                    <div class="col-12 col-md-3">

                        <section style="border-style: groove;text-align: center;margin: 5%;width: 100%;">
                            <i class="hp-box-icon fas fa-user" style="font-size: 5vw !important;margin-top: 3%"></i>
                            <h3>Espace demandeur</h3>

                            <form action="/login" method="get">
                                <div  style="margin-top: 5%;">
                                    <input name="j_name" style="width: 95%;margin-left: 3%;" class="form-control" type="text" placeholder="Email">
                                    <input name="j_pass"  style="margin-top: 2%;width: 95%;margin-left: 3%;" class="form-control" type="password" placeholder="Password">
                                </div>
                                <div  style="margin-top: 5%;">

                                    <button type="submit"  class="btn btn-success "> <i class="fa fa-unlock" ></i> Se connecter</button>
                                    <a href="/demandez_compte"  class="btn btn-success"> <i class="fa fa-user-plus" ></i> S'enregistrer</a>
                                </div>
                            </form>


                            <div  style="margin-top: 3%;">
                                <a  href="#" style="color: #336c4e"> <i class="fas fa-user-times"></i><span> Mot de passe oublié ?</span> </a>
                            </div>
                            <br/>


                        </section>

                        <section style="border-style: groove;text-align: center;margin: 5%;width: 100%;">

                            <div style="background-color: aliceblue">
                                <div style="display: flex;margin-left: 32%;">
                                    <i class="fa fa-folder-open"  style="padding-left: 5px;font-size: 35px;color: #336c4e;"></i> <h5 style="padding-top: 3%;padding-left: 5px;">  Etat Dossier</h5>
                                </div>
                                <div>

                                    <input style="width: 75%;margin-left: 12%;" type="text" placeholder="Votre Réferences dossier" class="form-control etatmain" >

                                    <button style="margin-top: 1%"  class="btn btn-success etatmain" onclick="verifetat()" ><i class="fa fa-check-circle"></i> Vérifier Dossier</button>


                                    <div style="width: 90%;margin-left: 5%;display: none" id="retsecmainetat">
                                        <div style="width: 100%" id="alertetat" class="alert alert-danger" role="alert">
                                            Résultat introuvable
                                        </div>
                                        <button onclick="retsecmainetat()" style="background-color: #336c4e;color: white" class="btn" >Précédent</button>
                                    </div>
                                </div>

                                <br/>
                            </div>
                        </section>

                    </div>
                </c:if>


                <div class="col-12 col-md-7">


                    <section id="sectmain"  style="height: 497px;border-style: groove;text-align: center;margin-top: 2.3%;">

                        <h3 style="margin-top: 10%;text-decoration: underline;"> Préparer votre démarche </h3>

                        <div style="margin-top: 5%;">
                            <button onclick="sectautoris()" style="width: 45%;font-size: 25px;padding-bottom: 10%;padding-top: 15px;background-color: #edf4e4;color:#336c4e"  class="btn"> <br/><i style="font-size: 40px" class="fa fa-check-circle" ></i><br/> Autorisations</button>
                            <button onclick="sectevaluation()" style="width: 45%;font-size: 25px;padding-bottom: 10%;padding-top: 15px;background-color: #edf4e4;color: #336c4e"  class="btn"> <br/><i style="font-size: 40px"  class="fa fa-user-plus" ></i><br/> Evaluation environnementale</button>

                        </div>



                        <div style="margin-top: 3.5%"></div>

                    </section>

                    <section id="sectautoris" style="height: 497px;border-style: groove;text-align: center;margin-top: 2.3%;display: none">



               <div id="slct1" style="margin-top: 18%;margin-bottom: 5%;">
                            <h4><i class="fa fa-check-circle"></i> Autorisations</h4>
                            <select onchange="slct1()" id="slct1change" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;">
                                <option>Choisir...</option>
                                <option value="0">Importation dechets (zone franche)</option>
                                <option value="1">Collecte/transport</option>
                                <option value="2">Elimination</option>
                                <option value="3">Valorisation</option>
                            </select>
                        </div>


                        <div id="slct2"  style="margin-top: 18%;margin-bottom: 5%;">
                            <h4><i class="fa fa-user-plus"></i> Evaluation environnementale</h4>
                            <select onchange="slct2()" id="slct2change" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;">
                                <option>Choisir...</option>
                                <option value="0">Étude environnementale stratégique (EES)</option>
                                <option value="1">Audit environnementale</option>
                                <option value="2">Notice d’impact</option>
                                <option value="3">Etude d’impact environnementale</option>
                            </select>
                        </div>






                        <div>
                            <button  id="btnprcd" style="margin-top: 1%;background-color: #336c4e;color: white" class="btn" onclick="retsecmain()">Précédent</button>
                        </div>
                        <div style="margin-top: 5%">
                        </div>

                    </section>

                </div>



                <%-- Statistique --%>

                <hr>
-->

                    <!--  debut  -->

                    <div class="row">
                        <div class="w-100 pl-12 pr-12 mr-3 mt-4 mb-2 " style="text-align:center">
                            <label style="border-bottom: 5px solid #336c4e8c;font-weight: bold;"><spring:message code="label.Commentcamarche"/></label>

                        </div>
                        <div class="col-md-12 col-sm-12 text-center">


                            <div class="row ">
                                <div class="col-lg-12 text-center mb-2 mt-2" >
                                    <c:choose>
                                        <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe_banner.gif">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/103.gif" class="step" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                        </div>

                        <div id="ressources" class="w-100 pl-12 pr-12 mr-3 mt-4 " style="text-align:center">
                            <label style="border-bottom: 5px solid #336c4e8c;font-weight: bold;"><spring:message code="label.Resources"/></label>

                        </div>

                        <div class=" row p-0 m-0 justify-content-center">

                            <div class="col-md-3 col-sm-3 hvr-float-shadow">
                                <div class="card widget-card-1">
                                    <div class="card-block-small">
                                        <a href="/guide">
                                            <c:choose>
                                                <c:when test="${pageContext.response.locale=='ar'}">
                                                    <img src="${pageContext.request.contextPath}/assets/images/Arabe توجيه وإجراءات.gif">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/assets/images/Guide et procedure.gif" class="step" />
                                                </c:otherwise>
                                            </c:choose>

                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 hvr-float-shadow">
                                <div class="card widget-card-1">
                                    <div class="card-block-small">
                                        <a href="/videoList">
                                            <c:choose>
                                            <c:when test="${pageContext.response.locale=='ar'}">
                                            <img src="${pageContext.request.contextPath}/assets/images/Arabe Video.png">
                                            </c:when>
                                            <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/images/video.png" />
                                            </c:otherwise>
                                            </c:choose>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-3 hvr-float-shadow">
                                <div class="card widget-card-1">
                                    <div class="card-block-small">
                                        <a href="/faq">
                                            <c:choose>
                                                <c:when test="${pageContext.response.locale=='ar'}">
                                                    <img src="${pageContext.request.contextPath}/assets/images/Arabe reponse.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/assets/images/question.png" />
                                                </c:otherwise>
                                            </c:choose>

                                        </a>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-3 hvr-float-shadow">
                                <div class="card widget-card-1">
                                    <div class="card-block-small">
                                        <a href="/contact/0">
                                            <c:choose>
                                                <c:when test="${pageContext.response.locale=='ar'}">
                                                    <img src="${pageContext.request.contextPath}/assets/images/Arabe Contactez-nous.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/assets/images/contact.png" />
                                                </c:otherwise>
                                            </c:choose>

                                        </a>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--  statistique -->
                        <div class="container" style="margin-top: 20px">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 text-center">
                                    <label style="border-bottom: 5px solid #336c4e8c;font-weight: bold;"><spring:message code="label.Statistique"/></label>
                                </div>
                            </div>
                            <div class="mt-5 row justify-content-center border-bottom " id="counter">
                                <div class="col-md-4 col-sm-4 text-center border-right">
                                    <p><span class="fas fa-user-check" style="font-size: 22px;color:#00e300"></span></p>
                                    <div class="counter-value" data-count="2000">900</div>
                                    <p><spring:message code="label.Nombredevisite"/></p>
                                </div>
                                <div class="col-md-4 col-sm-4 text-center border-right">
                                    <p><span class="fas fa-wifi" style="font-size: 22px;color:#00e300" ></span></p>
                                    <div class="counter-value" data-count="2000">4000</div>
                                    <p><spring:message code="label.Nombredesutilisateursconnectees"/></p>
                                </div>
                                <div class="col-md-4 col-sm-4 text-center">
                                    <p><span class="fas fa-user-shield" style="font-size: 22px;color:#00e300" ></span></p>
                                    <div class="counter-value" data-count="2000">2000</div>
                                    <p><spring:message code="label.Nombredesutilisateursinscrits"/></p>
                                </div>
                            </div>
                            <div class="row mt-2 justify-content-center" >
                                <div class="col-md-4 col-sm-6 text-center rounded bg_stat_01 m-2">
                                    <div class="row mr-3 ml-3 mt-2">
                                        <div class="col-md-6 col-sm-6 text-left p-2">
                                            <div class="counter-value f_20" data-count="2000">12000</div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 text-right p-2">
                                            <span class="fas fa-user-check f_28"></span>
                                        </div>
                                    </div>
                                    <hr class="ligne_white">
                                    <p><spring:message code="label.Nombredautorisationdelivreeans"/></p>
                                </div>
                                <div class="col-md-4 col-sm-4 text-center rounded bg_stat_02 m-2 ">
                                    <div class="row mr-3 ml-3 mt-2">
                                        <div class="col-md-6 col-sm-6 text-left p-2">
                                            <div class="counter-value f_20" data-count="2000">16000</div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 text-right p-2">
                                            <span class="fas fa-wifi f_28"></span>
                                        </div>
                                    </div>
                                    <hr class="ligne_white">
                                    <p><spring:message code="label.NombreEIEdelivreeans"/></p>
                                </div>

                            </div>
                        </div>


                    </div>


                    <!-- Fin statistique -->


                    <div class="w-100 pl-12 pr-12 mr-3 " style="display:none;" id="idNp">
                        <div class="col-md-6 col-xl-6">
                            <div class="card project-task">
                                <div class="card-header">
                                    <div class="card-header-left ">
                                        <h5><spring:message code="label.NombredautorisationparRegion"/></h5>
                                    </div>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="fa fa-map-marker  "></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block p-b-10">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="label.Region"/></th>
                                                <th><spring:message code="label.Nombre"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.FesMeknes"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:80%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">T</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.TangerTtouanAlHoceima"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">20</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:60%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-yellow d-inline-block text-center">R</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.RabatSaleKenitra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">80</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.BeniMellalKhenifra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">80</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">C</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.CasablancaSettat"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">100</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.MarrakechSafi"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.DraaTafilalet"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">90</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.SoussMassa"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">G</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.GuelmimOuedNoun"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">40</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">L</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.LaayouneSakiaElHamra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">D</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.DakhlaOuedEdDahab"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-6">
                            <div class="card project-task">
                                <div class="card-header">
                                    <div class="card-header-left ">
                                        <h5><spring:message code="label.NombredEIEparRegion"/></h5>
                                    </div>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="fa fa-map-marker  "></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block p-b-10">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="label.Region"/></th>
                                                <th><spring:message code="label.Nombre"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.FesMeknes"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">70</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:80%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">T</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.TangerTtouanAlHoceima"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">80</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:60%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-yellow d-inline-block text-center">R</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.RabatSaleKenitra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.BeniMellalKhenifra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">80</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">C</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.CasablancaSettat"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">100</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.MarrakechSafi"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.DraaTafilalet"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">90</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-green d-inline-block text-center">B</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.SoussMassa"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">G</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.GuelmimOuedNoun"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">40</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-pink d-inline-block text-center">L</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.LaayouneSakiaElHamra"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="task-contain">
                                                        <h6 class="bg-c-blue d-inline-block text-center">D</h6>
                                                        <p class="d-inline-block m-l-20"><spring:message code="label.DakhlaOuedEdDahab"/></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="d-inline-block m-r-20">30</p>
                                                    <div class="progress d-inline-block">
                                                        <div class="progress-bar bg-c-green" role="progressbar" aria-valuemin="0"
                                                             aria-valuemax="100" style="width:50%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>








                <!-- ici -->


                </section>

            </div>
        </div>
    </div>
</div>
</div>
<div class="col-md-2">
</div>

<div class="row p-0 m-0 bg-dark bg_footer_1"  >
    <div class="col-12 p-0 m-0 text-center pt-2 pb-2">
        <footer>Twins &copy; Copyright 2021 Systeme de dématérialisation des autorisations délivrées par le ministère de l'energie,
            des mines et de l'environement Département de l'environnement </footer>
    </div>
</div>

</div>


<!-- The Modal -->
<div id="myModal" style="overflow-y: scroll;" class="modal">
    <span class="close">&times;</span>
    <img class="modal-content" id="img01">
    <div id="caption"></div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById("myImg");
    var img2 = document.getElementById("myImg2");
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
    img2.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
</script>
<script>

    function checknotifStatut() {
        var numnotif = $("#num_notifications").val();

        if (numnotif == "") {
            return false;
        }
        $.ajax({
            type: "GET",

            url :"/checknotif_statu/" + numnotif,
            contentType : 'application/json; charset=utf-8',

            data : JSON.stringify(numnotif),

            success : function(response) {
                console.log(response);
                <c:if test="${pageContext.response.locale!='ar'}">
                if(response == "Aucune")
                    response="Aucune Résultat";
                $("#notifSt").html("<div style='width: 100%' id='alertetat' class='alert alert-danger' role='alert'>"+response+"</div>");
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                if(response == "Aucune")
                    response="لا توجد نتيجة";
                $("#notifSt").html("<div style='width: 100%' id='alertetat' class='alert alert-danger' role='alert'>"+response+"</div>");
                </c:if>
            },
            error : function(response) {

                alert('Erreur ajout non effectué');

            }
        });
    }

    function retsecmain(){
        $("#sectmain").show();
        $("#sectautoris").hide();
        $("#btnprcd").hide();

        $(".disp_none").hide();

    }
    function retsecmainetat(){
        $(".etatmain").show();
        $("#retsecmainetat").hide();
    }
    function retsecmain2(){
        $("#section_01").hide();
        $("#section_02").hide();
        $("#zone_rech").show();
        retsecmain();
    }

    function verifetat(){
        $(".etatmain").hide();
        $("#retsecmainetat").show();
    }
    function sectautoris(){

        $("#sectmain").hide();
        $("#sectautoris").show();
        $("#slct1").show();
        $("#slct2").hide();
        $("#navss").hide();
        $("#navss3").hide();
        $("#navss4").hide();
        $("#navss5").hide();
        $("#navss6").hide();
        $("#navss7").hide();
        $("#navss8").hide();
        $("#navss9").hide();
        $("#navss2").hide();
        $("#btnprcd").show();
    }


    function sectevaluation(){
        $("#sectmain").hide();
        $("#sectautoris").show();
        $("#slct2").show();
        $("#slct1").hide();
        $("#navss").hide();
        $("#navss2").hide();
        $("#navss3").hide();
        $("#navss4").hide();
        $("#navss5").hide();
        $("#navss6").hide();
        $("#navss7").hide();
        $("#navss8").hide();
        $("#navss9").hide();
        $("#btnprcd").show();
    }




    function getDocs(){
        var selected = $("#slct1change").val();
                if(selected=="ZF"){
                    window.location.href="/api/ListeAutorisationDemande/ZF/d"
                }
                if(selected=="CT"){
                    window.location.href="/api/getListCollectTrans"
                }
                if(selected=="ET"){
                    window.location.href="/api/ListeAutorisationDemande/ET/d"

                }
                if(selected=="IE"){
                    window.location.href="/api/ListeAutorisationDemande/IE/d"
                }
                if(selected=="IT"){
                    window.location.href="/api/ListeAutorisationDemande/ZF/d"

                } if(selected=="XD"){
            window.location.href="/api/ListeAutorisationDemande/XD/d"

                } if(selected=="TR"){
            window.location.href="/api/ListeAutorisationDemande/TR/d"

                } if(selected=="DL"){
            window.location.href="/api/ListeAutorisationDemande/DL/d"
                }

    }
    function slct2(){



        var selected = $("#slct2change").val();
        if(selected==3){
            window.location.href="/api/checkEIESelect";
            return false;
        }
        if(selected==3){
            $("#slct2").hide();
            $("#navss2").show();
            $("#section_02").show();
            $("#zone_rech").hide();
        }


    }

    function calculer(){
        var ct = $("#inp_ct").val();
        var ctr = $("#inp_ctr").val();
        var cs = $("#inp_cs").val();
        var q = $("#inp_q").val();

        if((!ct && ct==="") || (!ctr && ctr==="") || (!cs && cs==="") || (!q && q==="")){
            swal("un ou plusieurs champs sont vides");
            return false;
        }
        var total = 0;

        var sum = parseFloat(ct)  + parseFloat(ctr)  + parseFloat(cs);
        total =parseFloat(sum)  * parseFloat(q) * 1.2;

        $("#resultat_calcul").removeClass("disp_none");
        $("#res.res").html("").append(total.toFixed(2));

    }


    function calculer2(){
        var cu = $("#inp_cu").val();
        var d = $("#inp_d").val();
        var q = $("#inp_q2").val();

        if((!cu && cu==="") || (!d && d ==="") || (!q && q==="")){
            swal("un ou plusieurs champs sont vides");
            return false;
        }
        var total = 0;

        total =parseFloat(cu)  * parseFloat(q) *  parseFloat(d);

        $("#resultat_calcul2").removeClass("disp_none");
        $("#res2.res2").html("").append(total.toFixed(2));

    }





    // counter
    function lancer_counter(){
        $('.counter-value').each(function () {
            $(this).prop('Counter',0).animate({
                Counter: $(this).text()
            }, {
                duration: 4000,
                easing: 'swing',
                step: function (now) {
                    $(this).text(Math.ceil(now).toLocaleString('en'));
                }
            });
        });
    }




    //test position pour lancer counter
    lancer_counter();


    function DownloadFile(fileName) {
        //Set the File URL.
        var url = "../../assets/pdf/" + fileName;

        //Create XMLHTTP Request.
        var req = new XMLHttpRequest();
        req.open("GET", url, true);
        req.responseType = "blob";
        req.onload = function () {
            //Convert the Byte Data to BLOB object.
            var blob = new Blob([req.response], { type: "application/octetstream" });

            //Check the Browser type and download the File.
            var isIE = false || !!document.documentMode;
            if (isIE) {
                window.navigator.msSaveBlob(blob, fileName);
            } else {
                var url = window.URL || window.webkitURL;
                link = url.createObjectURL(blob);
                var a = document.createElement("a");
                a.setAttribute("download", fileName);
                a.setAttribute("href", link);
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
            }
        };
        req.send();
    };

</script>


<jsp:include page="../includes/footer1.jsp"/>