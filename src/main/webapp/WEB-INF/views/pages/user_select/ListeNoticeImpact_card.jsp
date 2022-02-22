<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<style>
    <!--

    -->
    .card-body{
        text-align:center !important;}
    .modal{
        overflow: auto !important;
    }

    .margin10{
        margin: 10px !important;
    }
</style>
<style>
    <c:if test="${pageContext.response.locale=='ar'}">
    .select2-results__option{
        direction:rtl;
        text-align:right !important;


    }
    </c:if>
</style>
<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="row mt-3">
            <div class="col-12 text-center">
                <%--<h1><spring:message code="option.Etudedimpactenvironnementale"/></h1>--%>
            </div>
            <div class="col-12 text-center">
                <%--<p><spring:message code="label.msgMerci"/></p>--%>
                <%--<div class="row m-0 p-0 justify-content-center">--%>
                <%--<div class="col-md-4 col-sm-12">--%>
                <%--<div class="form-group">--%>
                <%--<input type="hidden" value="${type}" id="type">--%>
                <%--<select onchange="changer_select()" class="form-control select2" id="choix" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">--%>
                <%--<option value=""><spring:message code="option.ChoisirA"/></option>--%>
                <%--<option value="1"><spring:message code="label.Nouvelledemande"/></option>--%>
                <%--<option value="2"><spring:message code="label.SuivremademandeEIE"/></option>--%>
                <%--<option value="3"><spring:message code="label.dmdRensPre"/></option>--%>
                <%--<option value="4"><spring:message code="label.AfficherlesdemandeEIE"/></option>--%>
                <%--</select>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="row justify-content-center mt-5">
                    <div class="col-md-10 col-sm-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card w-100">
                                    <div class="card-body" >
                                        <h1><spring:message code="option.Noticedimpact"/></h1>
                                        <%--<p class="text-left font_bold"><spring:message code="label.msgMerci"/>.</p>--%>
                                        <%--<p class="text-left"><spring:message code="label.Vouspouvez"/>.</p>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-lg-6">
                                <div class="card w-100" style="min-height: 210px">
                                    <div class="card-body"  id="Row_Nouvelle_EIE_1" style="min-height: 295px;">
                                        <div class="row">
                                            <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                                <div class="rounded-circle my_bg p-3 m-3">
                                                    <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                                </div>
                                            </div>
                                            <div class="col-md-9 col-sm-12 pr-0 pl-0">
                                                <p class="text-success font_bold text-left pl-2"></p>
                                                <hr>
                                                <p class="pl-2 text-justify margin10" >
                                                    <spring:message code="label.PourdeposerledossierdunenouvelledemandedeNT"/>   <b><spring:message code="label.cliquezsur"/><spring:message code="label.Noticedimpact"/> :</b><br>
                                                </p>
                                                <div class="text-left">
                                                    <button onclick="go_to_l('/api/demandeinformation/0/NT')" class="btn btn-sm btn-success margin10" ><spring:message code="label.Noticedimpactsurlenvironnement"/> <span class="fa fa-angle-double-right"></span></button>
                                                </div>

                                                <p class="pl-2 text-justify margin10" ><spring:message code="label.Pourtoutesautresinformations"/><spring:message code="label.cliquezsur"/> <b><spring:message code="label.Renseignementsprealables"/>  :</b></p>
                                                <div class="text-left">
                                                    <button onclick="go_to_l('/api/demandeinformation/0/RS')" class="btn btn-sm btn-success margin10" > <spring:message code="label.Renseignementsprealables"/><span class="fa fa-angle-double-right"></span></button>
                                                </div>

                                            </div>
                                            <div class="col-12">


                                            </div>
                                        </div>
                                    </div>
                                    <%-- <div class="card-body"  id="Row_Nouvelle_EIE_2" style="min-height: 295px;display: none">
                                       <div class="row">
                                         <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                           <div class="rounded-circle my_bg p-3 m-3">
                                             <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                           </div>
                                         </div>
                                         <div class="col-md-9 col-sm-12 pr-0 pl-0">
                                           <p class="text-success font_bold text-left pl-2"><spring:message
                                                   code="label.Deposerundossier"/></p>
                                           <hr>
                                           <p class="pl-2 text-justify margin10" >
                                             Pour remplir l'ÉIE sans Renseignement préalable, cliquez sur le bouton   <b>Sans Renseignement préalable</b>,  Si non vous cliquez sur le bouton <b> Avec Renseignement préalable </b>
                                           </p>
                                         </div>
                                         <div class="col-12" >
                                           <button onclick="go_to_l('/api/demandeinformation/0/EE')" class="btn btn-sm btn-success margin10" >Sans Renseignement préalable <span class="fa fa-angle-double-right"></span></button>
                                           <button onclick=" $('#staticBackdrop').modal('toggle');"  class="btn btn-sm btn-success margin10" >Avec Renseignement préalable <span class="fa fa-angle-double-right"></span></button>

                                         </div>
                                     </div>
                                     </div>--%>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-lg-6">
                                <div class="card w-100" style="min-height: 210px">
                                    <div class="card-body" style="min-height: 295px;">

                                        <div class="row">
                                            <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                                <div class="rounded-circle my_bg p-3 m-3">
                                                    <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                                </div>
                                            </div>
                                            <div class="col-md-9 col-sm-12 pr-0 pl-0" >
                                                <p class="text-success font_bold text-left pl-2"><spring:message
                                                        code="label.Suivremondossier"/></p>
                                                <hr>
                                                <p class="pl-2 text-justify margin10" >
                                                   <spring:message code="label.Vouspouvezsuivreletatdevosdossiers"/> <b><spring:message code="label.Affichermesdossiers"/> </b></p>
                                            </div>
                                            <div class="col-12">
                                                <input placeholder="Entrer N° de la demande" type="text" class="form-control mb-2 margin10" id="num_demande23" style=" width: 201px; display: inline;height: 32px;">

                                                <button ${RS==0?'disabled':''} onclick="fun_affiche_modal_recap()" class="btn btn-sm btn-success" style="margin: 10px 10px 17px -10px;">  <span class="fa fa-search"></span></button>


                                                <button ${EE==0?'disabled':''} onclick="go_to_l('/api/ListeEie')" class="btn btn-sm btn-success" style="margin: 10px 0px 17px 10px;">
                                                    <spring:message code="label.Affichermesdossiers"/> <span
                                                        class="fa fa-angle-double-right"></span></button>
                                                <%-- <button ${RS==0?'disabled':''} onclick="go_to_l('/api/ListeEieRe')" class="btn btn-sm btn-success" style="margin: 10px 0px 17px 10px;">Afficher les Renseignements préalables <span class="fa fa-angle-double-right"></span></button>--%>


                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>



<!-- Modal information-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Information"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <p>
                            <spring:message code="label.msgSaisirNum"/>
                        </p>

                    </div>
                    <div class="col-10">
                        <input type="text" class="form-control mb-2" id="num_demande2">
                        <%--<p class="text-small" style="font-size: 11px"><spring:message code="label.Sivousnavezpaslenumerosdelademandevouspouvezgenererunnouveaunumerosencliquant"/> <a href="/api/demandeinformation/0/RS"><spring:message code="label.ici"/></a></p>--%>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-success" onclick="fun_affiche_modal_recap()"><spring:message code="label.rech"/></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalRenouv" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="renouvLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="renouvLabel"><spring:message code="label.suivredmd"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="renouv_tab">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <p> <spring:message code="label.msgSaisirNum"/> </p>
                    </div>
                    <div class="col-10">
                        <input type="text" class="form-control mb-2" id="num_demande1">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" onclick="fun_affiche_modal_recap()"><spring:message code="label.rech"/></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalRecap" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="recapLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>



<script>
    function schow_Row_Nouvelle_EIE_2(){
        $("#Row_Nouvelle_EIE_2").show();
        $("#Row_Nouvelle_EIE_1").hide();
    }
    function fun_affiche_modal_recap(){
        var id = $("#num_demande1").val();
        if($.trim(id)==""){
            id = $("#num_demande2").val();
        }
        if($.trim(id)==""){
            id = $("#num_demande23").val();
        }



        if($.trim(id)==""){
            swal('<spring:message code="label.Champsvide"/>',"<spring:message code="label.mercidesaisirunnumerodautorisationvalide"/>","warning");
            return false;
        }

        $.ajax({
            url: '/api/CheckEIE/'+id,
            type: 'POST',
            dataType:'html',
            data: {},
        })
            .done(function(response) {
                console.log(response);
                if(response=="" || $.trim(response)=="Aucun résultat"){
                    $("#num_demande1").val("");
                    $("#num_demande2").val("");
                    $("#num_demande23").val("");
                    //$("#staticBackdrop").modal("toggle");
                    swal("<spring:message code="label.Aucunresultat"/>","<spring:message code="label.mercidesaisirunnumerodautorisationvalide"/>","info");
                    return false;
                }else{
                    window.location.href="/api/demandeinformation/"+response+"/EE";
                }


            })
            .fail(function() {
                alert("erreur")
            })
            .always(function() {
                console.log("complete");
            });
    }



    function afficher_choix(){
        swal({
            title:"Confirmation",
            text:"<spring:message code="label.VoulezvousremplirlEtudedimpacteenvironnementalesansRenseignementprealable"/>",
            type:"info",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#336c4e',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oui',
            cancelButtonText: 'Non',
        }, function (isConfirm) {
            if (isConfirm) {
                window.location.href="/api/demandeinformation/0/EE";
            }else{
                $("#staticBackdrop").modal("toggle");
            }
        });
    }

    function changer_select(){
        var id = $("#choix").val();
        if($.trim(id)===""){
            return false;
        }
        var type = $("#type").val();

        if(id==1){
            afficher_choix();
        }else if(id==2){
            $("#modalRenouv").modal("toggle");
        }else if(id==3){
            window.location.href="/api/ListeEieRe";
        }else if(id==4){
            window.location.href="/api/ListeEie";
        }

    }
    function go_to_l(url){
        window.location.href=url;
    }
</script>





<jsp:include page="../../includes/footer1.jsp"/>
