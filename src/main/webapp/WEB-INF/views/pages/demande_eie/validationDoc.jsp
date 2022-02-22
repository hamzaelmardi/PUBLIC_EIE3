<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>

<style>
    * {
        box-sizing: border-box
    }

    .hidden {
        display: none !important;
    }

    .Doc_ok {
        background-color: #00ff1f12;
        padding: 4px;
    }

    .Doc_Not_ok {
        background-color: #ff000024;
        padding: 4px;
    }

    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
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

</style>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="content-wrapper">
            <section class="services-section" style="background-color: white;margin-top: 2%">
                <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
                    <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
                        <div class="row p-0 m-0 justify-content-center">
                            <div class="col-md-6 col-sm-12 grid-margin stretch-card ">
                                <div class="photo  hvr-buzz-out">
                                    <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                                </div>
                                <form name="doc" id="doc">
                                    <div class="card" style="padding-bottom: 15px;">
                                        <div class="row justify-content-center">


                                            <div class="col-10 mt-4">

                                                <%--<h5 style="float:right;color:black">Validation du documents</h5>--%>

                                                <h4><spring:message code="label.Completerlesdocuments"/></h4>
                                                <div class="row p-0 m-0 mt-5">


                                                </div>

                                                <table class="table table-bordered my_table">
                                                    <thead>
                                                    <tr>

                                                        <th scope="col"><spring:message code="label.Piecesafournir"/></th>
                                                        <th scope="col"><spring:message code="label.Commentaire"/></th>

                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${doc}" var="dc">
                                                        <c:if test="${dc.nom_ar!='oui'}">
                                                            <tr>

                                                                <td class="${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}">


                                                                    <div class="form-group">


                                                                        <label class=""> ${pageContext.response.locale=='ar'?dc.docImport.nom_ar:dc.docImport.nom_fr }
                                                                            : </label>
                                                                        <a download
                                                                           href="/downloadFile/${fn:replace(dc.url,"/assets/myFile/","")}"><i
                                                                                class="fa fa-upload "
                                                                                title="Télécharger le document"
                                                                                style="margin:0 !important"></i>
                                                                        </a>
                                                                        <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                                            <div class="field">
                                                                            <input required
                                                                                   onchange="addDocG(${dc.demandeEIE.id_demande_information},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport}','${type }','')"
                                                                                   accept=".pdf" type="file"
                                                                                   id="doc${dc.docImport.id_docImport }"
                                                                                   class="form-control mydoc">
                                                                            </div>
                                                                        </div>


                                                                    </div>

                                                                </td>
                                                                <td><label disabled
                                                                           id="id${dc.id_listDocNotif }"
                                                                           style="width: 100%;"> ${dc.nom_fr } </label>
                                                                </td>

                                                            </tr>
                                                        </c:if>

                                                    </c:forEach>
                                                    </tbody>
                                                </table>

                                                    <c:if test="${type!='AE'}">
                                                        <div class="actions col-md-4 col-sm-6">
                                                            <button type="button" id="ret"
                                                                   class="btn btn-success btn-block mt-2 mb-4"
                                                                    onclick="myFunction()"><spring:message code="label.Valider"/></button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${type=='AE'}">
                                                        <input type="hidden" value="${id}" class="form-control" id="id_name_id">
                                                        <button class="btn btn-primary" onclick="changer_statut1_AE('id_name_id','72','Bien enregistrer','${type}')">
                                                            <spring:message code="button.Enregistrer"/>
                                                        </button>
                                                    </c:if>

                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<script>
    function myFunction() {

        var empty = false;
        $('.field input').each(function() {
            if ($(this).val().length === 0) {
                empty = true;
            }
        });

        if (empty) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
        } else {
            window.location.href="/api/recapEie/${id}/${type}";
        }
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>

