<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>


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

<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-12 col-md-1"></div>
                <div class="col-12 col-md-3">

                    <section style="border-style: groove;text-align: center;margin: 5%;width: 100%;">
                        <i class="hp-box-icon fas fa-user" style="font-size: 5vw !important;margin-top: 3%"></i>
                        <h3>Espace demandeur</h3>
                        <div  style="margin-top: 5%;">
                            <input style="width: 95%;margin-left: 3%;" class="form-control" type="text" placeholder="Email">
                            <input  style="margin-top: 2%;width: 95%;margin-left: 3%;" class="form-control" type="password" placeholder="Password">
                        </div>
                        <div  style="margin-top: 5%;">
                            <button  class="btn btn-success search-toggler"> <i class="fa fa-unlock" ></i> Se connecter</button>
                            <a href="/demandez_compte"  class="btn btn-success"> <i class="fa fa-user-plus" ></i> S'enregistrer</a>
                        </div>



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
                            <select onchange="slct1()" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;">
                                <option>Choisir...</option>
                                <option value="0">Importation dechets (zone franche)</option>
                                <option value="1">Collecte/transport des déchets dangereux</option>
                                <option value="2">Elimination</option>
                                <option value="3">Valorisation</option>
                            </select>
                        </div>


                        <div id="slct2" style="margin-top: 18%;margin-bottom: 5%;">
                            <h4><i class="fa fa-user-plus"></i> Evaluation environnementale</h4>
                            <select onchange="slct2()" class="form-control select2" style="margin-top: 5%;width: 90%;margin-left: 5%;">
                                <option>Choisir...</option>
                                <option value="0">Évaluation environnementale stratégique (EES)</option>
                                <option value="1">Audit environnementale</option>
                                <option value="2">Notice d’impact</option>
                                <option value="3">Etude d’impact environnementale</option>
                            </select>
                        </div>

                        <div id="navss" style="display: none">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Document Requis</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Etape</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Base Juridique</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" style="text-align: left;padding-left: 3%">

                                    <div style="padding-top: 3%;"></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Demande de certificat de réception provisoire ou définitive </a></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Attestation de conformité en matière de télécommunication </a></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Attestation de conformité délivrée par l'architecte </a></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Plans de conception des infrastructures, voirie et réseaux divers </a></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Certificat de propriété de moins de 3 mois </a></div>
                                    <div style="float: left;width: 100%;padding-bottom: 1%;"><a href="#" style="font-size: 20px;color:black"> <i style="color: red" class="fa fa-file-pdf"></i> Plan cadastral </a></div>
                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">



                                    <div class="w-100 pl-12 pr-12 mr-3 ">
                                        <div class="w-100 pl-12 pr-12 mr-3 " style="margin-top:3%;text-align:center">
                                        </div>
                                        <div class="w-100 pl-12 pr-12 mr-3 ">
                                            <div  id="etprow">
                                                <!--first section-->
                                                <div class="row align-items-center how-it-works d-flex">
                                                    <div class="col-2 text-center bottom d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">1</div>
                                                    </div>
                                                    <div class="col-6">
                                                        <h6 style="text-align: left">Saisie de la demande</h6>
                                                    </div>
                                                </div>
                                                <!--path between 1-2-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner top-right"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner left-bottom"></div>
                                                    </div>
                                                </div>
                                                <!--second section-->
                                                <div class="row align-items-center justify-content-end how-it-works d-flex">
                                                    <div class="col-6 text-right">
                                                        <h6>Attachement des documents requis</h6>
                                                    </div>
                                                    <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">2</div>
                                                    </div>
                                                </div>
                                                <!--path between 2-3-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner right-bottom"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner top-left"></div>
                                                    </div>
                                                </div>
                                                <!--third section-->
                                                <div class="row align-items-center how-it-works d-flex">
                                                    <div class="col-2 text-center top d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">3</div>
                                                    </div>
                                                    <div class="col-6">
                                                        <h6 style="text-align: left">Vérification du dossier numérique</h6>
                                                    </div>
                                                </div>
                                                <!--path between 3-4-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner top-right"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner left-bottom"></div>
                                                    </div>
                                                </div>
                                                <!-- section 4-->
                                                <div class="row align-items-center justify-content-end how-it-works d-flex">
                                                    <div class="col-6 text-right">
                                                        <h6>Instruction du dossier par les membres de commission</h6>
                                                    </div>
                                                    <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">4</div>
                                                    </div>
                                                </div>
                                                <!--path between 4-5-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner right-bottom"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner top-left"></div>
                                                    </div>
                                                </div>
                                                <!--section 5-->
                                                <div class="row align-items-center how-it-works d-flex">
                                                    <div class="col-2 text-center top d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">5</div>
                                                    </div>
                                                    <div class="col-6">
                                                        <h6 style="text-align: left">Tenue commission</h6>
                                                    </div>
                                                </div>
                                                <!--path between 5-6-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner top-right"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner left-bottom"></div>
                                                    </div>
                                                </div>
                                                <!-- section 6-->
                                                <div class="row align-items-center justify-content-end how-it-works d-flex">
                                                    <div class="col-6 text-right">
                                                        <h6>Paiement des taxes</h6>
                                                    </div>
                                                    <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">6</div>
                                                    </div>
                                                </div>
                                                <!--path between 6-7-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner right-bottom"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner top-left"></div>
                                                    </div>
                                                </div>
                                                <!--section 7-->
                                                <div class="row align-items-center how-it-works d-flex">
                                                    <div class="col-2 text-center top d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">7</div>
                                                    </div>
                                                    <div class="col-6">
                                                        <h6 style="text-align: left">Contrôle des documents avant e-signature</h6>
                                                    </div>
                                                </div>
                                                <!--path between 7-8-->
                                                <div class="row timeline">
                                                    <div class="col-2">
                                                        <div class="corner top-right"></div>
                                                    </div>
                                                    <div class="col-8">
                                                        <hr/>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="corner left-bottom"></div>
                                                    </div>
                                                </div>
                                                <!-- section 8-->
                                                <div class="row align-items-center justify-content-end how-it-works d-flex">
                                                    <div class="col-6 text-right">
                                                        <h6>E-Signature des documents à délivrer</h6>
                                                    </div>
                                                    <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                                        <div class="circle font-weight-bold">8</div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <div style="margin-top: 3%;" ></div>
                                </div>
                            </div>
                        </div>




                        <div>
                            <button id="btnprcd" style="background-color: #336c4e;color: white" class="btn" onclick="retsecmain()">Précédent</button>
                        </div>
                        <div style="margin-top: 5%">
                        </div>

                    </section>

                </div>



                <%-- Fac --%>

                <hr>


                <!--  debut  -->

                <div class="w-100 pl-12 pr-12 mr-3 " style="background-color: #fafafa;">
                    <div class="w-100 pl-12 pr-12 mr-3 " style="margin-top:3%;text-align:center">
                        <label style="border-bottom: 5px solid #336c4e8c;font-weight: bold;">Comment ça marche??</label>
                    </div>
                    <div class="w-100 pl-12 pr-12 mr-3 ">
                        <div class="container">
                            <!--first section-->
                            <div class="row align-items-center how-it-works d-flex">
                                <div class="col-2 text-center bottom d-inline-flex justify-content-center align-items-center">
                                    <div class="circle font-weight-bold">1</div>
                                </div>
                                <div class="col-6">
                                    <h5>Créer Votre espace privé</h5>
                                </div>
                            </div>
                            <!--path between 1-2-->
                            <div class="row timeline">
                                <div class="col-2">
                                    <div class="corner top-right"></div>
                                </div>
                                <div class="col-8">
                                    <hr/>
                                </div>
                                <div class="col-2">
                                    <div class="corner left-bottom"></div>
                                </div>
                            </div>
                            <!--second section-->
                            <div class="row align-items-center justify-content-end how-it-works d-flex">
                                <div class="col-6 text-right">
                                    <h5>Saisissez votre demande</h5>
                                </div>
                                <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                    <div class="circle font-weight-bold">2</div>
                                </div>
                            </div>
                            <!--path between 2-3-->
                            <div class="row timeline">
                                <div class="col-2">
                                    <div class="corner right-bottom"></div>
                                </div>
                                <div class="col-8">
                                    <hr/>
                                </div>
                                <div class="col-2">
                                    <div class="corner top-left"></div>
                                </div>
                            </div>
                            <!--third section-->
                            <div class="row align-items-center how-it-works d-flex">
                                <div class="col-2 text-center top d-inline-flex justify-content-center align-items-center">
                                    <div class="circle font-weight-bold">3</div>
                                </div>
                                <div class="col-6">
                                    <h5>Attachez vous fichier</h5>
                                </div>
                            </div>
                            <!--path between 3-4-->
                            <div class="row timeline">
                                <div class="col-2">
                                    <div class="corner top-right"></div>
                                </div>
                                <div class="col-8">
                                    <hr/>
                                </div>
                                <div class="col-2">
                                    <div class="corner left-bottom"></div>
                                </div>
                            </div>
                            <!-- section 4-->
                            <div class="row align-items-center justify-content-end how-it-works d-flex">
                                <div class="col-6 text-right">
                                    <h5>Suivi votre demande</h5>
                                </div>
                                <div class="col-2 text-center full d-inline-flex justify-content-center align-items-center">
                                    <div class="circle font-weight-bold">4</div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <br/><br/>
                </div>

                <hr>

                <div class="w-100 pl-12 pr-12 mr-3 " style="text-align:center">
                    <label style="border-bottom: 5px solid #336c4e8c;font-weight: bold;">Resources</label>

                </div>

                <div class="w-100 pl-12 pr-12 mr-3 " style="display:flex;">
                    <div class="col-md-6 col-xl-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">


                                <div style="text-align:center;">
                                <span class="fa fa-clone"
                                      style="font-size:63px;color:#336c4e !important">

                                </span>
                                </div>

                                <div style="margin-top:13px;text-align: center;">
                                                            <span class=" m-t-10 text-muted">

                                                                Guides et procédures
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">


                                <div style="text-align:center;">
                                                            <span class="fa fa-play-circle"
                                                                  style="font-size:63px;color:#336c4e !important">

                                                            </span>
                                </div>
                                <div style="margin-top:13px;text-align: center;">
                                                            <span class=" m-t-10 text-muted">
                                                                    Vidéos
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xl-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">

                                <div style="text-align:center;">
                                                            <span class="fa fa-upload"
                                                                  style="font-size:63px;color:#336c4e !important">

                                                            </span>
                                </div>

                                <div style="margin-top:13px;text-align: center;">
                                                            <span class=" m-t-10 text-muted">
                                                                Téléchargements
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 hvr-float-shadow">
                        <div class="card widget-card-1">
                            <div class="card-block-small">

                                <div style="text-align:center;">
                                                            <span class="fa fa-question-circle"
                                                                  style="font-size:63px;color:#336c4e !important">

                                                            </span>
                                </div>
                                <div style="margin-top:13px;text-align: center;">
                                                            <span class=" m-t-10 text-muted">
                                                                Questions fréquentes
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr>
                <!--  finnnn-->
                <div class="w-100 pl-12 pr-12 mr-3 " style="display:flex;">
                    <div class="col-md-3 col-sm-3" onclick="showRegion()">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <i class="fa fa-home bg-c-blue card1-icon"></i>
                                <span class="text-c-blue f-w-600">Nombre de visite</span>

                                <div style="margin-top:13px;">
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-blue f-16 fa fa-primary-circle  m-r-10"></i>900 visites
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <i class="fa fa-globe  bg-c-pink card1-icon"></i>
                                <span class="text-c-pink f-w-600">Etude d'impcat EIE</span>

                                <div style="margin-top:13px;">
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-pink f-16 fa fa-primary-circle  m-r-10"></i>90 accepté
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <i class="fa fa-check bg-c-green card1-icon"></i>
                                <span class="text-c-green f-w-600">Nombre d'autorisation </span>

                                <div style="margin-top:13px;">
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-green f-16 fa fa-primary-circle  m-r-10"></i>20 accepté
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                                <i class="fa fa-times bg-c-yellow  card1-icon"></i>
                                <span class="text-c-yellow  f-w-600">Nombre d'autorisation</span>

                                <div style="margin-top:13px;">
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-yellow  f-16 fa fa-primary-circle  m-r-10"></i>10 réfusé
                                                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ici -->
                <div class="w-100 pl-12 pr-12 mr-3 " style="display:none;" id="idNp">
                    <div class="col-md-6 col-xl-6">
                        <div class="card project-task">
                            <div class="card-header">
                                <div class="card-header-left ">
                                    <h5>Nombre d'autorisation par Région</h5>
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
                                            <th>Région</th>
                                            <th>Nombre</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div class="task-contain">
                                                    <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                    <p class="d-inline-block m-l-20">Fes/Meknes</p>
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
                                                    <p class="d-inline-block m-l-20">Tanger-Tétouan-Al Hoceïma</p>
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
                                                    <p class="d-inline-block m-l-20">Rabat-Salé-Kénitra</p>
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
                                                    <p class="d-inline-block m-l-20">Béni Mellal-Khénifra</p>
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
                                                    <p class="d-inline-block m-l-20">Casablanca-Settat</p>
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
                                                    <p class="d-inline-block m-l-20">Marrakech-Safi</p>
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
                                                    <p class="d-inline-block m-l-20">Drâa-Tafilalet</p>
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
                                                    <p class="d-inline-block m-l-20">Souss-Massa</p>
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
                                                    <p class="d-inline-block m-l-20">Guelmim-Oued Noun</p>
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
                                                    <p class="d-inline-block m-l-20">Laâyoune-Sakia El Hamra</p>
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
                                                    <p class="d-inline-block m-l-20">Dakhla-Oued Ed-Dahab</p>
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
                                    <h5>Nombre d'EIE par Région</h5>
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
                                            <th>Région</th>
                                            <th>Nombre</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div class="task-contain">
                                                    <h6 class="bg-c-blue d-inline-block text-center">F</h6>
                                                    <p class="d-inline-block m-l-20">Fes/Meknes</p>
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
                                                    <p class="d-inline-block m-l-20">Tanger-Tétouan-Al Hoceïma</p>
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
                                                    <p class="d-inline-block m-l-20">Rabat-Salé-Kénitra</p>
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
                                                    <p class="d-inline-block m-l-20">Béni Mellal-Khénifra</p>
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
                                                    <p class="d-inline-block m-l-20">Casablanca-Settat</p>
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
                                                    <p class="d-inline-block m-l-20">Marrakech-Safi</p>
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
                                                    <p class="d-inline-block m-l-20">Drâa-Tafilalet</p>
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
                                                    <p class="d-inline-block m-l-20">Souss-Massa</p>
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
                                                    <p class="d-inline-block m-l-20">Guelmim-Oued Noun</p>
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
                                                    <p class="d-inline-block m-l-20">Laâyoune-Sakia El Hamra</p>
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
                                                    <p class="d-inline-block m-l-20">Dakhla-Oued Ed-Dahab</p>
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

                </section>

            </div>
        </div>
    </div>
</div>


<script>
    function retsecmain(){
        $("#sectmain").show();
        $("#sectautoris").hide();
    }
    function retsecmainetat(){
        $(".etatmain").show();
        $("#retsecmainetat").hide();
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
    }
    function sectevaluation(){
        $("#sectmain").hide();
        $("#sectautoris").show();
        $("#slct2").show();
        $("#slct1").hide();
        $("#navss").hide();
    }
    function slct1(){
        $("#slct1").hide();
        $("#navss").show();

    }
    function slct2(){
        $("#slct2").hide();
        $("#navss").show();

    }
</script>

