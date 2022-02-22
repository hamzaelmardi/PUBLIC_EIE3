<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../../includes/head.jsp"/>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">

<section class="services-section" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
            <c:choose>
                <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListInstallation'}">
                    <c:choose>
                        <c:when test="${pageContext.response.locale=='ar'}">
                            <c:set var="p_page" value="منشأة معالجة النفايات"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="p_page" value="Instalation De traitement des déchets"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                </c:otherwise>
            </c:choose>

            <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                    <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                </ol>
            </nav>

            <%--<a href="/api/ListInstallation" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;"><spring:message code="label.Listedesdemandes"/></a>


            <a href="/api/addInstallation/0/N" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;"><spring:message code="label.Nouvelledemande"/></a>

            <a href="/api/addInstallation/0/R" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;"><spring:message code="label.DemandedeRenouvellement"/></a>
          --%>
            <div class="row p-0 m-0">
                <div class="col-lg-2 col-md-3 col-sm-3">
                    <a class="btn btn-success btn-block" href="/api/checkUserDispatch/IT"><span class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></a>
                </div>
            </div>

            <div class="row p-0 m-0">
                <div class="col-12 table-responsive">
                    <table id="tab2" class="table table-striped hover compact table-bordered text-md-nowrap">
                        <thead class="thead-bleu">
                        <tr>
                            <th class="" rowspan="2"><spring:message code="label.Numerodedemande"/> </th>
                            <th class="" rowspan="2"><spring:message code="label.datedepot"/></th>
                            <th class="" rowspan="2"><spring:message code="label.code"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Site"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Statut"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Typededemande"/></th>



                            <th class="" rowspan="2"><spring:message code="label.Quantite"/></th>

                            <th class="text-center" colspan="5"><spring:message code="label.societe"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Operation"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Nombredequipe"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Nbrdeffectif"/></th>
                            <th class="" rowspan="2"><spring:message code="label.descriptiondinstallation"/></th>
<%--                            <th class="" rowspan="2"><spring:message code="label.structuredinstallation"/></th>--%>
                            <th class="" rowspan="2"><spring:message code="label.DatedeVisite"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Horairedexploitation"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Recepisse"/></th>
                            <th class="" rowspan="2"><spring:message code="label.Rapportdeconformite"/></th>
                            <th  class="all" rowspan="2"><spring:message code="label.Action"/></th>
                        </tr>

                        <tr>
                            <th class=""><spring:message code="label.Raisonsocial"/></th>
                            <th class=""><spring:message code="label.identifiantfiscal"/> </th>
                            <th class=""><spring:message code="label.Email"/></th>
                            <th class=""><spring:message code="label.Fax"/> </th>
                            <th class=""><spring:message code="label.telephone"/></th>
                        </tr>



                        </thead>
                        <tbody>
                        <c:forEach items="${notif}" var="nt" varStatus="loopp">
                            <tr>
                                <td class="font-weight-semibold">${nt.num_demande }</td>

                                <td>
                                    <fmt:formatDate   dateStyle="long" value="${nt.dateDepot }" />

                                </td>
                                <td>
                                    <c:if test="${not empty nt.code}">
                                        <button style=" color: #fff;background-color: #5d6974;" class="btn  btn-circle"
                                                onclick="show_code('${nt.id_installation}')">
                                            <span  class="fa fa-dumpster" ></span>
                                        </button>
                                    </c:if>
                                    <c:if test="${empty nt.code && nt.type!='3'}">
								<span class="f-12">
									<spring:message code="label.Pasdecode"/>
								</span>
                                    </c:if>
                                    <c:if test="${empty nt.code && nt.type=='3'}">
                                        <span class="f-12">
                                            vous avez choisi tous les codes
                                        </span>
                                    </c:if>

                                </td>
                                <td> ${nt.site } </td>

                                <td>
                                    <c:if test="${nt.statut.id_statut_projet==88 || nt.statut.id_statut_projet==14 || nt.statut.id_statut_projet==18 ||  nt.statut.id_statut_projet==15 || nt.statut.id_statut_projet==57|| nt.statut.id_statut_projet==51 || nt.statut.id_statut_projet==87 }">
                                    <span class="badge badge-success"> ${nt.statut.nom_fr }</span>
                                    </c:if>
                                    <c:if test="${nt.statut.id_statut_projet!=88 && nt.statut.id_statut_projet!=14 && nt.statut.id_statut_projet!=18 &&  nt.statut.id_statut_projet!=15 && nt.statut.id_statut_projet!=57 && nt.statut.id_statut_projet!=51 && nt.statut.id_statut_projet!=87  }">
                                        <span class="badge badge-success"> en cours de traitement</span>
                                    </c:if>
                                </td>
                                </td>
                                <td> <span class="badge badge-success"> ${nt.typeRenouvellement.nom_fr }</span>  </td>


                                <td> ${nt.quantite } ${nt.unite.nom_fr } </td>

                                <td> ${nt.raison }</td>
                                <td>  ${nt.ife } </td>
                                <td> ${nt.email }  </td>
                                <td> ${nt.fax }</td>
                                <td> ${nt.tel }  </td>

                                <td>  ${nt.operation }  </td>
                                <td>  ${nt.nbr_equipe_travail }  </td>
                                <td>  ${nt.formation }  </td>


                                <td>${nt.description } </td>
                              <%--  <td>${nt.structure } </td>--%>
                                <jsp:useBean id="now" class="java.util.Date" />
                                <fmt:parseDate pattern="dd/MM/yyyy" value="${nt.visite.date_visite_S}" var="dateVisite" />
                                <fmt:parseNumber value="${(dateVisite.time - now.time) / (1000*60*60*24) }"
                                        integerOnly="true" var="nbJour" parseLocale="fr"/>
                                <td>
                                    <c:if test="${not empty nt.visite and nbJour>0}">
                                        après ${nbJour} Jours
                                    </c:if>
                                    <c:if test="${not empty nt.visite and nbJour<0}">
                                        avant ${-nbJour} Jours
                                    </c:if>
                                    <c:if test="${not empty nt.visite and nbJour==0}">
                                        Aujourd'hui
                                    </c:if>
                                </td>
                                <td>${nt.horaire_exploitation }  - ${nt.horaire_exploitation_fin} </td>
                                <td> <c:if test="${nt.statut.id_statut_projet != 51}">
                                    <a class="removeStyle" download
                                       href="/api/generate_pdf_installation/${nt.id_installation }">
                                        <spring:message code="button.Telecharger"/> </a> </c:if></td>
                                <td>
                                    <c:if test="${not empty nt.document_attache}">
                                        <a class="removeStyle" download
                                            href="/downloadFile/${fn:replace(nt.document_attache,"/assets/myFile/","")}">
                                            <span class="fa fa-upload"></span>
                                        </a>
                                     </c:if>
                                </td>
                                <td>
                                    <div id="toolbar-options${loopp.index+1}" class="hidden">
                                        <a type="button" style="background-color: #0db8db" onclick="goToLien6('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapitulatif"/>"><i class="fa fa-print"></i></a>
                                        <c:if test="${nt.statut.id_statut_projet==51}">
                                            <a type="button" style="background-color: #0db8db" onclick="goToLien2('${nt.id_installation}/N')" data-popover="true" data-html=true data-content="<spring:message code="label.Modifier"/>"><i class="fa fa-pencil-alt"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==15 }">
                                            <a type="button" style="background-color: #0db8db" onclick="goToLien3('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Ameliorerlesdocuments"/>"><i class="fa fa-plus"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==87 }">
                                            <a type="button" style="background-color: #0db8db" onclick="goToLien5('${nt.id_installation}/N')" data-popover="true" data-html=true data-content="<spring:message code="label.Completerlesdocuments"/>"><i class="fa fa-file"></i></a>
                                        </c:if>
                                    </div>
                                    <div class="tool-box">
                                        <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #5d6974, #5d6974) !important;"><i class="fa fa-cog"></i></div>
                                        <div class="clear"></div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>



        </div>
    </div>
</section>


            <div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabele" aria-hidden="true" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="modal-dialog modal-lg modal-dialog-centered" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-left"  id="myH"></h5>
                            <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                    onclick="hide_code()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-hover table-striped table-bordered tab_vehicule" id="tab_code">
                                        <thead>
                                        <tr>
                                            <th> <spring:message code="label.code" /> </th>
                                            <th> <spring:message code="label.Typededechet" /></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <td><spring:message code="label.Erreur" /></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="hide_code()" data-dismiss="modal"><spring:message code="button.fermer" /></button>

                        </div>
                    </div>
                </div>
            </div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="width: 900px !important;max-width:900px !important ;margin-left: -20%; !important;">

            <div class="modal-body">

                <div id="dossierbd" class="row m-0 p-0">
                    <div id="blockOne" class="col-6"></div>
                    <div id="blocktwo" class="col-6"></div>
                </div>
<%--                <table id="dossiertable" class="table table-striped table-bordered dt-responsive nowrap">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>

<%--                        <th>DOC Notification </th>--%>
<%--                        <th>DOC Mouvement </th>--%>
<%--                        <th>Garantie Financière </th>--%>
<%--                        <th>Contrat</th>--%>
<%--                        <th>Analyses/Fiche d’identification DD</th>--%>
<%--                        <th>CAP</th>--%>
<%--                        <th>Autorisation d’exploitation de l’installation</th>--%>
<%--                        <th>Autorisation de l’installation</th>--%>
<%--                        <th>Assurance de la Responsabilité Civile de l’installation</th>--%>
<%--                        <th>Autorisation de Collecte et transport </th>--%>
<%--                        <th>Déclaration sur l’honneur sur l’exactitude des informations présentées </th>--%>
<%--                        <th> Cahier de charge </th>--%>


<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                   --%>
<%--                </table>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal"><spring:message code="label.Fermer"/> </button>
            </div>
        </div>

    </div>
</div>
      </div>
        </div>

    </div>
<jsp:include page="../../includes/footer1.jsp"/>
<script>

    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});


    function goToLien(val){
        window.location.href='/api/addInstallation/'+val;
    }
    function goToLien1(val){
        window.location.href='/api/infoInstallation/'+val;
    }
    function goToLien2(val){
        window.location.href='/api/addInstallation/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/infoInstallation/'+val;
    }
   /* function goToLien4(val){
        window.location.href='/api/generateDocInstallFavorable/'+val;
    }*/
    function goToLien5(val){
        window.location.href='/api/addInstallation/'+val;
    }
    function goToLien6(val){
        window.location.href='/api/recapIT/'+val;
    }
    function show_code(id) {
        event.preventDefault();
        $("#staticBackdrop1").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getcode",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    if(response.typeIT=="1"){
                        $("#myH").text("<spring:message code="label.Lescodesnontraiter" />");
                    }
                    else if(response.typeIT=="2"){
                        $("#myH").text("Les codes traiter");
                    }
                    else{
                        $("#myH").text("vous choisissez tous les codes");
                    }
                    if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/index";
                    }
                    $("#tab_code tbody").html("");
                    if ($(response.codes).length > 0)

                        $(response.codes)
                            .each(
                                function(idx, el) {
                                    var btn_url = "";

                                    var tr = "<tr> <td>"
                                        + el.nom_fr
                                        + "</td> <td>"
                                        + el.nom_ar
                                        + "</td> </tr>";

                                    $(".tab_vehicule tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }
    $(document).ready(function() {


    } );


</script>





