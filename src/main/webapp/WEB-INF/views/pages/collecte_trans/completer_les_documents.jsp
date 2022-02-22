<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<style>

    * {
        box-sizing: border-box
    }

    .file_existe {
        position: absolute;
        bottom: 16%;
    }

    .tab {
        float: left;
        width: 20%;
    }

    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }

    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current "tab button" class */
    .tab button.active {
        background-color: red;
    }

    /* Style the tab content */
    table.table-bordered.dataTable th, table.table-bordered.dataTable td {
        font-size: 13px;
    }

    .display-grid {
        display: grid;
    }


    .badge-danger {
        color: #fff !important;
        background-color: #dc3545 !important;
    }
    .bg-vert{
        background: #336c4e !important;
        border-color: #336c4e !important;
    }
</style>
<div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="services-section" style="margin-top: 2%">
                <input type="hidden" name="id_collecte" value="${collect.id_collecte}" id="id_collecte">
                <div class="col-12">
                    <c:choose>
                        <c:when test="${type=='IT'}">
                            <spring:message code="label.Installationdetraitementdesdechets" var="p_page"/>
                        </c:when>
                        <c:when test="${type=='CT'}">
                            <spring:message code="label.Collectetransportdesdechetsdangereux" var="p_page"/>
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
                </div>
                    <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
                        <c:choose>
                            <c:when test="${(empty collect) || (typeRenouv=='R')}">
                                <c:set var="disabled" value="disabled"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="disabled" value=""/>
                            </c:otherwise>
                        </c:choose>
                        <div class="row justify-content-center">
                            <div class="col-md-10 justify-content-center col-sm-12 pl-sm-3 pl-0  pr-sm-3 pr-0">
                                <section class="card shadow p-4 mt-2 border vehicule_row">
                                    <div class="row justify-content-center  p-4">
                                            <div class="col-12 " id="my_table" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <h5><u><spring:message code="label.Validationdesvehicules"/> :</u></h5>
                                                <div id="zone_form" class="row col-12 p-0 mt-3">
                                                        <form id="add_vehicules" >
                                                            <div class="row m-0 p-0">
                                                                <div class="col-md-4 col-sm-12">
                                                                    <div class="form-group">
                                                                        <label class="f-14">
                                                                            <spring:message code="label.NMatriculation"/>
                                                                        </label>
                                                                        <div class="row">
                                                                            <div class="col-sm-5 p-0 m-0 mt-3">
                                                                                <input type="text" class="form-control" value="${vehicules.num_mat_enrg_voit}" name="num_mat_enrg_voit">
                                                                            </div>
                                                                            <div class="col-sm-2 p-0 m-1 mt-3">
                                                                                <input type="text" class="form-control keyboardInput" lang="ar" dir="rtl" value="${vehicules.num_mat_enrg_auto}" name="num_mat_enrg_auto" id="num_mat_enrg_auto">
                                                                            </div>
                                                                            <div class="col-sm-4 p-0 m-0 mt-3">
                                                                                <input type="text" class="form-control" value="${vehicules.num_mat_id_prefect}" name="num_mat_id_prefect">
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" class="form-control" id="id_vehicule" value="${vehicules.id_vehicule}" name="id_vehicule">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-12 mt-3">
                                                                    <div class="form-group">
                                                                        <label class="f-14">
                                                                            <spring:message code="label.NChassis"/>
                                                                        </label>
                                                                        <input type="text" class="form-control" id="chassis" value="${vehicules.num_chassis}" name="num_chassis">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-12 mt-3">
                                                                    <div class="form-group">
                                                                        <label class="f-14">
                                                                            <spring:message code="label.Poidstotalencharge"/>
                                                                        </label>
                                                                        <input type="text" class="form-control" id="poidsTotal" value="${vehicules.poit_totale_charge}" name="poit_totale_charge">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-12">
                                                                    <div class="form-group">
                                                                        <label class="f-14">
                                                                            <spring:message code="label.Poidsnetduvehicule"/>
                                                                        </label>
                                                                        <input type="text" class="form-control" id="poidsNet" value="${vehicules.point_net}" name="point_net">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-12">
                                                                    <div class="form-group">
                                                                        <label> <spring:message code="label.TypedevehiculesA"/> </label>
                                                                        <input type="text" class="form-control" name="typeVehicule" value="${vehicules.typeVehicule}">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 col-sm-12">
                                                                    <label> <spring:message code="label.typedeconteneursA"/> </label>
                                                                    <input type="text" class="form-control" name="typeConteneur" value="${vehicules.typeConteneur}">
                                                                </div>
                                                                <input type="hidden" id="securiteEquip">
                                                                <input type="hidden" id="file">
                                                                <!--
                                                            <div class="col-md-4 col-sm-12">
                                                                <div class="form-group">
                                                                    <label class="f-14">
                                                                        <spring:message code="label.Equipementdesecurite"/>
                                                                    </label>
                                                                    <input type="file" id="securiteEquip" class="form-control">
                                                                    <c:if test="${not empty vehicules.equipementSecurite}">
                                                                        <a href="${url_admin}${fn:replace(vehicules.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                                                                            <span class="fa fa-download"></span>
                                                                        </a>
                                                                    </c:if>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-12">
                                                                <div class="form-group">
                                                                    <label class="f-14">
                                                                        <spring:message code="label.Attestationdassurance"/>
                                                                    </label>
                                                                    <input type="file" class="form-control" id="file">
                                                                    <c:if test="${not empty vehicules.doc_assurance}">
                                                                        <a href="${url_admin}${fn:replace(vehicules.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success" target="_blank" download="Equipement de securite">
                                                                            <span class="fa fa-download"></span>
                                                                        </a>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        -->
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="col-lg-4 col-md-5 col-sm-6 m-1">
                                                                    <button onclick="Save_vehicule('file','securiteEquip',this)" class="btn btn-primary btn-block"><spring:message code="button.enregistrerlevehicule"/></button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="col-12 table-responsive">
                                                            <table id="tab2" class="table table-striped hover compact table-bordered text-md-nowrap">
                                                                <thead>
                                                                <tr>
                                                                    <th><spring:message code="label.NMatriculation"/></th>
                                                                    <th><spring:message code="label.NChassis"/></th>
                                                                    <th><spring:message code="label.Poidstotalencharge"/></th>
                                                                    <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                                                    <th><spring:message code="label.Typevehicule"/></th>
                                                                    <th><spring:message code="label.typedeconteneursA"/></th>
                                                                    <th style="min-width: 120px"><spring:message
                                                                            code="label.Action"/></th>
                                                                    <th style="min-width: 120px"><spring:message
                                                                            code="label.Commentaire"/></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:choose>
                                                                    <c:when test="${(not empty collect.vehicules)}">
                                                                        <c:forEach items="${collect.vehicules}" var="v">
                                                                            <c:if test="${v.valid!='oui'}">
                                                                                <tr id="tr${v.id_vehicule}">
                                                                                    <td> ${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto}
                                                                                        - ${v.num_mat_id_prefect}</td>
                                                                                    <td>${v.num_chassis}</td>
                                                                                    <td>${v.poit_totale_charge}</td>
                                                                                    <td>${v.point_net}</td>
                                                                                    <td>${v.typeVehicule}</td>
                                                                                    <td>${v.typeConteneur}</td>
                                                                                    <!--
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${not empty v.equipementSecurite}">
                                                                                    <a href="${url_Admin}${fn:replace(v.equipementSecurite, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                                       class="btn btn-primary rounded-circle">
                                                                                        <span class="fa fa-download"></span>
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    -
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <a href="${url_Admin}${fn:replace(v.doc_assurance, "/assets/myFile/", "/dowload_uploaded/")}"
                                                                               class="btn btn-primary rounded-circle">
                                                                                <span class="fa fa-download"></span>
                                                                            </a>
                                                                        </td>
                                                                        -->
                                                                                    <td class="">
                                                                                        <button class="btn btn-danger rounded-circle"
                                                                                                onclick="deleteVehicule('${v.id_vehicule}')">
                                                                                            <span class="fas fa-trash-alt"></span>
                                                                                        </button>

                                                                                        <button class="btn btn-warning rounded-circle"
                                                                                                onclick="getVehicule('${v.id_vehicule}',this)">
                                                                                            <span class="fas fa-pencil-alt"></span>
                                                                                        </button>
                                                                                    </td>
                                                                                    <td>
                                                                                        <c:if test="${v.commantaire!=null}">
                                                                                            <div class="row mt-2">
                                                                                                <div class="col" >
                                                                                                    <textarea rows="2" disabled class="form-control mb-0">${v.commantaire}</textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:if>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <tr>
                                                                            <td colspan="7" class="bg-primary text-center">
                                                                                <spring:message code="label.Aucunvehiculedanscettedemande"/></td>
                                                                        </tr>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <c:if  test="${not empty collect.codeTmp}">
                                                <div class="col-md-4 p-4 mt-2 text-white">
                                                    <a type="button"
                                                       onclick="showCode()";
                                                       class="btn btn-success btn-block"><spring:message code="button.Suivant"/></a>
                                                </div>
                                        </c:if>
                                        <c:if  test="${not empty doc2 && empty collect.codeTmp}">
                                                <div class="col-md-4 p-4 mt-2 text-white">
                                                    <a type="button"
                                                       onclick="showDocument()";
                                                       class="btn btn-success btn-block"><spring:message code="button.Suivant"/></a>
                                                </div>
                                        </c:if>
                                        <c:if  test="${empty collect.codeTmp && cpt!=0}">
                                                <div class="col-md-4 p-4 mr-5 mt-2 text-white">
                                                    <a type="button"
                                                       onclick="changerStatutCT()";
                                                       class="btn btn-success btn-block">Enregistrer</a>
                                                </div>
                                        </c:if>
                                    </div>
                                </section>
                                <c:if test="${not empty collect.codeTmp}">
                                    <div class="row justify-content-center codes_row card shadow p-4 mt-2 border" style="display: none; text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <div class="col-12">
                                            <h5><u><spring:message code="label.Validationdescodesdesdechets"/> :</u></h5>
                                            <form id="formnotif" name="formnotif">
                                                 <div class="row">
                                                    <div class="col-lg-8 col-md-12" id="zone_tableau">
                                                        <table class="table table-striped" data-page-length="15">
                                                            <thead>
                                                            <tr>

                                                                <th scope="col" style="min-width: 100px"><spring:message
                                                                        code="label.CodeA"/></th>
                                                                <th scope="col"><spring:message code="label.TypeA"/></th>
                                                                <th scope="col"><spring:message code="label.ValiderA"/></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:if test="${collect.statut.id_statut_projet!=42}">
                                                                    <c:forEach items="${code}" var="c">

                                                                        <c:set var="checked" value=""/>
                                                                        <c:forEach items="${collect.code}" var="code_colle">
                                                                            <c:if test="${code_colle.id_code==c.id_code}">
                                                                                <c:set var="checked" value="checked disabled"/>
                                                                            </c:if>
                                                                        </c:forEach>


                                                                        <tr>
                                                                            <td>${c.nom_fr }</td>
                                                                            <td>${c.nom_ar }</td>
                                                                            <td><input ${checked} class="h-15" type="checkbox"
                                                                                                  id="id-${c.id_code }"
                                                                                                  onchange="addCodeCT('id_collecte','${c.id_code}','add')">
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <c:if test="${collect.statut.id_statut_projet==42}">
                                                                    <c:forEach items="${collect.code}" var="c">
                                                                        <c:set var="bg" value=""/>
                                                                        <c:forEach items="${collect.codeTmp}" var="code_colle">
                                                                            <c:if test="${code_colle.id_code==c.id_code}">
                                                                                <c:set var="bg" value="bg-danger"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                            <tr class="${bg}" id="tr-${c.id_code}">
                                                                                <td>${c.nom_fr }</td>
                                                                                <td>${c.nom_ar }</td>
                                                                                <td>
                                                                                    <input checked disabled class="h-15" type="checkbox"
                                                                                           id="id-${c.id_code }">
                                                                                </td>
                                                                            </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12" id="zone_list_tab">
                                                        <div class="d-block h-100 my_rows" id="my_rows">
                                                                <c:forEach items="${collect.codeTmp}" var="code_colle" varStatus="index">
                                                                    <div class="row p-0 m-0 ${index.index%2==0?'bg-light':''} ">
                                                                        <div class="col-8"> ${code_colle.nom_ar} </div>
                                                                        <div class="col-4 p-2 text-center">
                                                                            <button class="btn btn-success rounded-circle"
                                                                                    onclick="addCodeCT_tmp('id_collecte','${code_colle.id_code}','delete')">
                                                                                <span class="fa fa-times"></span></button>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                        </div>
                                                    </div>
                                                 </div>
                                            </form>
                                            <div class="row justify-content-end mt-2">
                                                        <div class="col-md-4 mt-2 text-white">
                                                            <a type="button"
                                                               onclick="showVehicule()";
                                                               class="btn btn-success btn-block"><spring:message code="button.Precedent"/></a>
                                                        </div>
                                                <c:if  test="${not empty doc2}">
                                                        <div class="col-md-4 mt-2 text-white">
                                                            <a type="button"
                                                               onclick="validerCodes()";
                                                               class="btn btn-success btn-block"><spring:message code="button.Suivant"/> </a>
                                                        </div>
                                                </c:if>
                                                <c:if  test="${count==0 && empty doc2}">
                                                    <div class="col-md-4 mr-5 mt-2 text-white">
                                                        <a type="button"
                                                           onclick="changerStatutCT()";
                                                           class="btn btn-success btn-block">Enregistrer</a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty doc2}">
                                    <div class="row justify-content-center documents_row card shadow p-4 mt-2 border" style="display: none; text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <div class="col-md-12 justify-content-center  col-sm-12">
                                            <h5><u><spring:message code="label.Validationdesdocuments"/> :</u></h5>
                                            <div class="col-12 table-responsive pt-4">
                                                <table class="table border table-striped table-hover table-bordered tw_tab">
                                                    <tr class="bg-vert text-white">
                                                        <td > <spring:message code="label.typededechet"/> </td>
                                                        <td style="width: 50%">  <spring:message code="label.Documents"/> </td>
                                                        <td>  <spring:message code="label.Commentaire"/> </td>
                                                    </tr>
                                                    <c:forEach items="${doc2}" var="dc">
                                                        <c:if test="${dc.nom_ar!='oui'}">
                                                                <tr>
                                                                    <td>${dc.docImport.nom_fr }</td>
                                                                    <td class="${dc.nom_ar=='oui'?'hidden':'' } form_docs"><input required
                                                                               onchange="addDocG(${dc.collecte.id_collecte},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport}','CT','')"
                                                                               accept=".pdf" type="file"
                                                                               id="doc${dc.docImport.id_docImport }"
                                                                               class="form-control mydoc">
                                                                    </td>
                                                                    <td>
                                                                        <div class="col">
                                                                            <textarea disabled rows="2" class="form-control mb-0" id="id" >${dc.nom_fr}</textarea>
                                                                         </div>
                                                                    </td>
                                                                </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <input type="hidden" value="${collect.codeTmp.size()}" id="size">
                                            <div class="row justify-content-end mt-2">
                                                <c:if  test="${not empty collect.codeTmp}">
                                                    <div class="col-md-4 mt-2 text-white">
                                                        <a type="button"
                                                           onclick="showCode()";
                                                           class="btn btn-success btn-block"><spring:message code="button.Precedent"/></a>
                                                    </div>
                                                </c:if>
                                                <c:if  test="${empty collect.codeTmp}">
                                                    <div class="col-md-4 mt-2 text-white">
                                                        <a type="button"
                                                           onclick="showVehicule()";
                                                           class="btn btn-success btn-block"><spring:message code="button.Precedent"/></a>
                                                    </div>
                                                </c:if>
                                                <div class="col-md-4 mt-2 text-white">
                                                    <a type="button"
                                                       onclick="changerStatutCT('${collect.codeTmp.size()}')";
                                                       class="btn btn-success btn-block"><spring:message code="label.enregistrer"/></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
            </div>
         </div>
    </div>
</div>


<script>

    function showCode(){
        $(".vehicule_row").hide();
        $(".documents_row").hide();
        $(".codes_row").show();
    }

    function showDocument(){
        $(".vehicule_row").hide();
        $(".documents_row").show();
        $(".codes_row").hide();
    }

    function showVehicule(){
        $(".vehicule_row").show();
        $(".documents_row").hide();
        $(".codes_row").hide();
    }

    function validerCodes(){
        var size = $("#size").val();
        console.log(size);
        var test = false;

        if (test || size!="0") {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.supprimerCode"/>", "error");
            return false;
        }
        else{
            showDocument();
        }
    }

    function check_vehicule_ok(from,table,tap,id_notif,nameId,returns){
        nbr_vehicule = $("input[name=nombre_vehicule]").val();
        if(nbr_vehicule==0 || $.trim(nbr_vehicule)=="" || nbr_vehicule==null){
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.vsmsmsv"/>", "error");
            return false;
        }
       updateGeneral(from,table,tap,id_notif,nameId,returns)
    }
    function down_load_recu() {
        var url = $("#url_file_pdf").val();
        var id = $("#id_collecte").val();
        var link = url + id;
        window.location = link;
    }

    function fun_affiche_modal_recap() {
        event.preventDefault();
        Swal.close();
        var id = $("#id_collecte").val();
       /*  if ($.trim(id) == "") {
            swal('Champs vide', "merci d'enristrer la demande", "warning");
            return false;
        } */

        $.ajax({
            url: '/api/getCollectById1/' + id + '/CT',
            type: 'POST',
            dataType: 'html',
            data: {},
        })
            .done(function (response) {
                console.log(response);
                if (response == "" || $.trim(response) == "Aucun résultat") {
                    swal("<spring:message code="label.Aucunresultat"/>", "<spring:message code="label.Mercidesaisirunnumerovalide"/>", "info");
                    return false;
                } else {
                    $("#recap_tab ").html("");
                    $("#recap_tab").html(response);
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#modalRecap").modal("toggle");
                }


            })
            .fail(function () {
                alert("erreur")
            })
            .always(function () {
                console.log("complete");
            });
    }

    function getCollectRenouveller(val) {
        event.preventDefault();
        $.ajax({
            url: '/api/getOneCollecte',
            type: 'post',
            data: {"id": $(val).val()},
        })
            .done(function (response) {

                if (response != "not existe") {
                    window.location.href = "/api/addCollectTrans/" + response + "/R";
                } else {
                    swal("Aucun Résultat", "Aucun résultat ne correspond à vos critères de recherche", "error");
                }
                console.log(response);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function openCity(evt, cityName) {

        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";

        if($("#zone_tableau").is(":visible") && $("#zone_list_tab").is(":visible") ){
            var h = $("#zone_tableau").innerHeight();
            console.log("height : ",h);
            $("#my_rows").attr("style",'height : '+h+'px !important');
        }

    }

    function openCity2(id_active, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        $(id_active).addClass("active");
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();


    function getOptionByFilter(val, table, select_id) {
        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" value=""><spring:message code="option.Choisir"/></option>');
            $.each(data, function (i, v) {
                $("#" + select_id).prepend(new Option(v[1], v[0]));
            })
        })
        ;
    }

    //show form_vehicule
    function getVehicule(id) {
        $("#add_new").prop("disabled", true);
        var id_coll = $("#id_collecte").val();
        if (id_coll == "") {
            swal("Avertissement!", "Merci de saisir les informations du demandeur", "error");
            return false;
        }
        event.preventDefault();
        $.get('/api/getVehiculeById/' + id + "/" + id_coll, function (data) {
            $("#my_table").html(data);
            $("#add_new").prop("disabled",true);
        });

    }

    // save vehicule Collecte/transport :
    function Save_vehicule(idInput, idequipement,val) {
        event.preventDefault();
        var matricule1 = $("input[name=num_mat_enrg_voit]").val();
        var matricule2 = $("input[name=num_mat_enrg_auto]").val();
        var matricule3 = $("input[name=num_mat_id_prefect]").val();
        if( ($.trim(matricule1)==="" || matricule1==null) || ($.trim(matricule2)==="" || matricule2==null) || ($.trim(matricule3)==="" || matricule3==null) ){
            swal("Avertissement!", "Le numero de la  plaque d'immatriculation du véhicule est obligatoire", "error");
            return false;
        }

        var data = new FormData();
        var id_collect = $("#id_collecte").val();
        var form = $("#add_vehicules").serializeObject();
        //var ins = document.getElementById(idInput).files.length;
        /*for (var x = 0; x < ins; x++) {
            var file = document.getElementById(idInput).files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de Fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }
        var ins1 = document.getElementById(idequipement).files.length;
        for (var x1 = 0; x1 < ins1; x1++) {
            var file1 = document.getElementById(idequipement).files[x1];
            if (file1.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de Fichier non pris en charge", "error");
                return false;
            }
            data.append("equipementsecurite", file1);
        }
        */

        data.append("id_collect", parseInt(id_collect));
        data.append("v", JSON.stringify(form));
        $('#loader_modal').modal('show');
        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/saveVehicule",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {
                $('#loader_modal').modal('hide');
                swal({
                        title: "Véhicule enregistrer avec success",
                        text: "Voulez-vous Ajouter un nouveau véhicule?",
                        type: "success",
                        showCancelButton: true,
                        confirmButtonClass: "btn-success",
                        confirmButtonText: "Oui, Ajouter un véhicule",
                        cancelButtonText: "Non",
                        closeOnConfirm: true,
                        closeOnCancel: true
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                            getVehicule('0');
                        } else {
                            getVehicule('0');
                            //updateGeneral('formvehicule','collectetransporteur','2',parseInt(id_collect),'id_collecte','non');
                            <c:if test="${not empty collect.codeTmp}">
                                showCode();
                            </c:if>
                            <c:if test="${empty collect.codeTmp}">
                                showDocument();
                            </c:if>
                        }
                    });
                /*$("#add_new").removeAttr("disabled");*/

            },
            error: function () {
                $('#loader_modal').modal('hide');
            }
        });
    }

    function deleteVehicule(id) {
        event.preventDefault();
        var id_coll = $("#id_collecte").val();
        $.get("/api/deleteVehicule/" + id + "/" + id_coll, function (rep) {
            $("#my_table").html(rep);
        });
    }

    function verif_champs(id_form) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");

        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });

        if (test) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
        } else {
            changer_status_collecte('id_collecte',19);

        }
    }

    function verif_recap_ct(id_form, type, id_name) {
        if(event!=null)
            event.preventDefault();
        // var tr = $("#" + id_form).find(".document").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        changer_status_collecte('id_collecte',19);

    }

    function verif_champs_ct(id_form, type, id_name, tap) {
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true;
            }
        });

        if (test) {
            if (${pageContext.response.locale!='ar'}) {
                swal("Avertisement!", "un ou plusieur champs sont vides", "error");
            } else if (${pageContext.response.locale=='ar'}) {
                swal("تحذير!", "مجال واحد أو أكثر فارغ", "error");
            }
        } else {
            $("#Btn5").removeAttr("disabled");
            searchByRecapCT(type);
            openCity2('Btn'+tap,tap);
        }
    }

    function verif_champs_recap(id_form, type, id_name, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();

        searchByRecapCT(type);
        openCity2('Btn'+tap,tap);

    }

    function changer_status_collecte(id_name,id_statut){
        var id_col = $("#"+id_name).val();
        var type="CT";
        Swal.fire({
            title: '<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `Enregistrer`,
            denyButtonText: `Annuler`,
        }).then((result) => {
            if (result.value) {
                changerStatutCollete_perso(id_col,id_statut,type);
            }
        })
    }

    function changerStatutCollete_perso(id_col,id_statut,type){

        $.ajax({
            url: '/api/changerStatus',
            type: 'POST',
            data: {
                "id_notif": parseInt(id_col),
                "id_statut":parseInt(id_statut),
                "type":type
            },
        })
            .done(function() {
                console.log("kouidi_CT");
                var link_recap = "/api/checkUserHasCollecte/CT";
                window.location.href=link_recap;
            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    function addCodeCT(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcode/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);


                });

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    var table1 = $("#DataTables_Table_0").dataTable();
                    var checkbox = table1.$("input[type=checkbox]#id-" + id_code);
                    $(checkbox).removeAttr("disabled");
                    $(checkbox).prop("checked", false);

                }
                console.log("complete");
            });

    }

    function addCodeCT_tmp(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll == "") {
            return false;
        }
        $.ajax({
            url: '/api/deleteCodeTmp/' + id_coll + '/' + id_code + '/' + type,
            type: 'GET',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                if(data.codes.length==0){
                    $(".codes_row").hide();
                    $(".documents_row").show();
                }
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT_tmp(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);
                });
                $("#size").val(data.codes.length);

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    $("#tr-"+id_code).hide();

                }
                console.log("complete");
            });

    }

    function verification_champs(){

    }

    function changerStatutCT(){
        if(event!=null)
            event.preventDefault();

        var id = $("#id_collecte").val();
        var size = $("#size").val();
        console.log(size);
        var test = false;


            $('input[type=file]').each(function() {
                if($(this).val()===''){
                    $(this).addClass("bg_error");
                    test = true
                }
            });

        if (test || size!="0") {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
            return false;
        } else {
                $.ajax({

                    type: "GET",
                    url : "/api/ChangerStatutCT/"+id,
                    data: {},
                    success : function(response) {
                        window.location.href="/api/checkUserHasCollecte/CT";
                    },
                    error : function() {

                    }
                });
        }
    }


    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formdemandeur']").validate({




            // Specify validation rules
            rules: {
                demandeur_email: {
                    required: true
                },
                demandeur_tel : {
                    required: true,
                },
                demandeur_fax : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },



            },


            // Specify validation error messages
            messages: {
                demandeur_email: "S'il vous plaît, mettez une adresse email valide",
                demandeur_tel: "S'il vous plaît, mettez un telephone valide",
                demandeur_fax: "S'il vous plaît, mettez un fax valide",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });

</script>


<jsp:include page="../../includes/footer1.jsp"/>

