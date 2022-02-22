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

<style>
    .plr_10{
        padding-left: 10px;
        padding-right: 10px;
        font-size: 14px;
    }
    .mt_cont{
        margin-top: 225px;
    }
    @media screen and (max-width: 992px) {
        .mt_cont{
            margin-top: 190px;
        }
    }
    @media screen and (max-width: 650px) {
        .mt_cont{
            margin-top: 250px;
        }
    }
    .pagination-outer{ text-align: center; }
    .pagination{
        font-family: 'Kodchasan', sans-serif;
        padding: 3px 10px;
        border: 2px solid #336c4e;
        border-radius: 30px;
        display: inline-flex;
        position: relative;
    }
    .pagination li a.page-link{
        color: #336c4e;
        background-color: transparent;
        font-size: 22px;
        font-weight: 600;
        line-height: 40px;
        height: 40px;
        width: 40px;
        padding: 0;
        margin: 0 6px;
        border: none;
        border-radius: 0;
        position: relative;
        overflow: hidden;
        transition: all 0.3s;
    }
    .pagination li.active a.page-link,
    .pagination li a.page-link:hover,
    .pagination li.active a.page-link:hover{
        color: #fff;
        background-color: transparent;
    }
    .pagination li:first-child a.page-link,
    .pagination li:last-child a.page-link{
        line-height: 35px;
        height: 42px;
        width: 42px;
        margin: 0;
        border-radius: 50%;
        border: 2px solid #336c4e;
        position: absolute;
        left: -50px;
    }
    .pagination li:last-child a.page-link{
        right: -50px;
        left: auto;
    }
    .pagination li:first-child a.page-link:hover,
    .pagination li:last-child a.page-link:hover{
        background-color: #336c4e;
    }
    .pagination li a.page-link:before,
    .pagination li a.page-link:after{
        content: '';
        background-color: #336c4e;
        height: 101%;
        width: 100%;
        position: absolute;
        left: 0;
        top: -50%;
        z-index: -1;
        transition: all 0.3s;
        -webkit-clip-path: polygon(50% 0%, 83% 12%, 100% 43%, 100% 50%, 65% 50%, 29% 50%, 0 50%, 0% 43%, 17% 12%);
        clip-path: polygon(50% 0%, 83% 12%, 100% 43%, 100% 50%, 65% 50%, 29% 50%, 0 50%, 0% 43%, 17% 12%);
    }
    .pagination li a.page-link:after{
        top: 100%;
        transition:all 0.3s;
        -webkit-clip-path: polygon(53% 50%, 100% 50%, 100% 50%, 94% 78%, 68% 100%, 32% 100%, 6% 78%, 0 50%, 17% 50%);
        clip-path: polygon(53% 50%, 100% 50%, 100% 50%, 94% 78%, 68% 100%, 32% 100%, 6% 78%, 0 50%, 17% 50%);
    }
    .pagination li:first-child a.page-link:before,
    .pagination li:first-child a.page-link:after,
    .pagination li:last-child a.page-link:before,
    .pagination li:last-child a.page-link:after{
        display: none;
    }
    .pagination li.active a.page-link:before,
    .pagination li a.page-link:hover:before,
    .pagination li.active a.page-link:after,
    .pagination li a.page-link:hover:after{
        top: 0;
    }
    @media only screen and (max-width: 480px){
        .pagination{
            display: block;
            margin: 0;
        }
        .pagination li{
            margin: 5px 0;
            display: inline-block;
        }
        .pagination li:first-child a.page-link{
            position: relative;
            left: auto;
        }
        .pagination li:last-child a.page-link{
            position: relative;
            right: auto;
        }
    }
    @media only screen and (max-width: 768px){
        .pagination li {
            padding: 0 !important;
            width: 30px !important;
        }
        .pagination{
            width: 365px !important;
            padding: 0 !important;
        }
        .pagination-outer{
            width: 390px !important;
        }
    }
    .box{
        font-family: 'Raleway', sans-serif;
        text-align: center;
        overflow: hidden;
        position: relative;
        transition: all 0.3s ease-in-out;
    }
    .box video{
        width: 100%;
        height: auto;
        transition: all 0.4s ease 0s;
    }
    .box .box-content{
        color: #fff;
        background: linear-gradient(#4db689,#336c4e);
        width: 100%;
        padding: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.5);
        transform: rotate(5deg);
        position: absolute;
        top: -92px;
        left: 0;
        z-index: 1;
        transition: top 0.3s ease 0s,transform 0.3s ease 0.15s;
    }
    .box:hover .box-content{
        opacity: 1;
        transform: rotate(0);
        top: 0;
    }
    .box .title{
        font-size: 20px;
        font-weight: 700;
        text-transform: capitalize;
        letter-spacing: 1px;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        margin: 0 0 3px;
    }
    .box .post{
        font-size: 12px;
        font-weight: 500;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        letter-spacing: 1px;
        display: block;
    }
    .box .icon{
        width: 100%;
        padding: 0;
        margin: 0;
        list-style: none;
        transform: rotate(-8deg);
        position: absolute;
        top: -40px;
        left: 0;
        transition: top 0.3s ease 0s,transform 0.3s ease 0.15s;
    }
    .box:hover .icon{
        transform: rotate(0);
        top: 10px;
    }
    .box .icon li{
        display: inline-block;
        margin: 0 5px;
    }
    .box .icon li a{
        color: #fff;
        background: linear-gradient(#3aa17e,#00537e);
        font-size: 15px;
        line-height: 30px;
        width: 30px;
        height: 30px;
        display: block;
        transition: all .35s;
    }
    .box .icon li a:hover{
        color: #fff;
        box-shadow: 3px 3px rgba(0, 0, 0, 0.5   );
    }
    @media only screen and (max-width:990px){
        .box{ margin: 0 0 30px; }
    }
</style>
<div class="container-fluid mt_cont">
    <div class="card">
        <div class="row justify-content-center">
            <div class="col-md-10 col-sm-10 text-center">
                <h1 class="text-success mt-5 mb-4"><spring:message code="label.Videos"/></h1>
            </div>
        </div>
        <div class="row justify-content-center p-4">
            <div class="col-md-10 col-sm-12">
                <div class="row justify-content-center p1">
                    <div class="col-lg-4 col-md-12">
                        <div class="box">
                            <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddZF.mp4"  controls loop  ></video>
                            <div class="box-content">
                                <h3 class="title">Zone Franche<br></h3>
                                <span class="post">Déposer la demande</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="box">
                            <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompléterDocZF.mp4"  controls loop  ></video>
                            <div class="box-content">
                                <h3 class="title">Zone Franche<br></h3>
                                <span class="post">Compléter documents</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="box">
                            <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CertificatEliminationZF.mp4"  controls loop  ></video>
                            <div class="box-content">
                                <h3 class="title">Zone Franche<br></h3>
                                <span class="post">Ajouter certificat d'élimination</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center p2 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/ChangerTransporteurZF.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Zone Franche<br></h3>
                                        <span class="post">Changer Transporteur</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddET.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Pays etranger<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompleterDocET.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">pays etranger<br></h3>
                                        <span class="post">Compléter documents</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p3 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/add%20demande%20collect.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Collecte et transport<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/completecollectsous.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Collecte et transport<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/compléter%20les%20documents%20collect%20transporte.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Collecte et trasnport<br></h3>
                                        <span class="post">Validation des déchets</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p4 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/ajouter%20demande%20instalation.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Installation<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/complete-lesdoc-installe.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Installation<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/valider%20les%20déchets.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Installation<br></h3>
                                        <span class="post">Validation des déchets</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p5 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddTR.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Transit<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/CompléterDocTR.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Transit<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AddXD.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Exportation<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p6 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/completerExportation.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Exportation<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/EIE_Deposer_Demande.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Etude d'impact<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/EIE_completer_document.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Etude d'impact<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p7 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Attacher_docs_définitifs.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Etude d'impact<br></h3>
                                        <span class="post">Attacher les documents définitifs</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Notice_deposer_demande.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Notice d'impact<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Notice_completer_document.mp4" controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Notice d'impact<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p8 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Audit_deposer_demande.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Audit Environnemental<br></h3>
                                        <span class="post">Déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/AE_completer_documennt.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Audit Environnemental<br></h3>
                                        <span class="post">Compléter les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/attacher_rapport_audit.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Audit Environnemental<br></h3>
                                        <span class="post">Attacher rapport d'audit</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row justify-content-center p9 hidden">
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Audit_attacher_docs.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Audit Environnemental<br></h3>
                                        <span class="post">Attacher les documents</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="box">
                                    <video class="col-12" src="${pageContext.request.contextPath}/assets/video/Renseignements.mp4"  controls loop  ></video>
                                    <div class="box-content">
                                        <h3 class="title">Renseignements<br></h3>
                                        <span class="post">déposer la demande</span>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
        <div class="row justify-content-center mt-5">
            <div class="demo">
                <nav class="pagination-outer" aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item">
                            <a onclick="openVideo('.p1',this)" class="page-link" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                        <li class="page-item first active"><a class="page-link" onclick="openVideo('.p1',this)">1</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p2',this)">2</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p3',this)">3</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p4',this)">4</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p5',this)">5</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p6',this)">6</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p7',this)">7</a></li>
                        <li class="page-item"><a class="page-link" onclick="openVideo('.p8',this)">8</a></li>
                        <li class="page-item last"><a class="page-link" onclick="openVideo('.p9',this)">9</a></li>
                        <li class="page-item">
                            <a onclick="openVideo('.p9',this)" class="page-link" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../includes/footer1.jsp"/>
<script>
    function rech(){
        window.location.href="/api/rechercherQuestion/"+$("#rech").val();
    }
    function openVideo(val,btn){
        for (let i=1;i<=9;i++){
            $(".p"+i).addClass("hidden");
        }
        $(val).removeClass("hidden");
        $(".page-item").removeClass("active")
        if(val === ".p1"){
            $(".first").addClass("active")
        }
        if(val === ".p9"){
            $(".last").addClass("active")
        }
        $(btn).parent().addClass("active")
    }
</script>

