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

<section class="services-section" style="background-color: white;margin-top: 2%">
    <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
        <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-md-4 col-sm-12 grid-margin stretch-card ">
                    <div class="photo  hvr-buzz-out">
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <form name="doc" id="doc">
                        <div class="card" style="padding-bottom: 15px;">
                            <div class="row justify-content-center">


                                <div class="col-10 mt-4">

                                    <%--<h5 style="float:right;color:black">Validation du documents</h5>--%>

                                    <h4><spring:message code="label.Ameliorerlesdocuments"/></h4>
                                    <div class="row p-0 m-0 mt-5">


                                    </div>
                                    <c:forEach items="${doc}" var="dc">
                                        <div class="row">

                                            <div class="col-12  ${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}">
                                                <div class="form-group">


                                                    <label class=""> ${dc.docImport.nom_fr } : </label>
                                                    <a download
                                                       href="/downloadFile/${fn:replace(dc.url,"/assets/myFile/","")}">
                                                        <i class="fa fa-upload " title="Télécharger le document"
                                                           style="margin:0 !important"></i> </a>
                                                    <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                        <label disabled id="id${dc.id_listDocNotif }"
                                                               style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr } </label>
                                                        <div class="upload">
                                                            <input required
                                                                   onchange="addDocG(${dc.collecte.id_collecte},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport }','CT','','file-chosen_${dc.docImport.id_docImport}')"
                                                                   accept=".pdf" type="file"
                                                                   id="doc${dc.docImport.id_docImport}" class="actual-btn" hidden>
                                                            <label class="uploadButton" for="doc${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>
                                                            <span class="fileName" id="file-chosen_${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>
                                        </div>
                                    </c:forEach>

<a href="/api/getListCollectTrans" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;margin-top: 12px;"><spring:message code="button.Enregistrer"/></a>

                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
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

</script>


<jsp:include page="../../includes/footer1.jsp"/>

<script type="text/javascript">
    function showComment(id) {
        $("#id" + id).removeClass("hidden");
        $("#id" + id).prop('disabled', false);
        $("#ids" + id).removeClass("hidden");
        $("#idd" + id).addClass("hidden");
    }

    function addComment(id) {

        var comment = $("#id" + id).val();

        $.ajax({
            type: "POST",
            url: "/api/addComment/" + id,

            data: {
                "comment": comment

            },

            success: function (response) {
                $("#id" + id).prop('disabled', true);
                $("#ids" + id).addClass("hidden");
                $("#idd" + id).removeClass("hidden");
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });

    }

    $("input:checkbox").change(function () {
        var etat;
        var id = $(this).data("choose");

        var ischecked = $(this).is(':checked');
        if (!ischecked) {
            etat = "non";
        } else {
            etat = "oui";
        }

        $.ajax({
            type: "POST",
            url: "/api/validate/" + id,

            data: {
                "etat": etat

            },

            success: function (response) {

            },
            error: function (response) {
                alert(' ajout non effectué');
            }
        });
    });


    function addEtat(id, etat) {


        $.ajax({
            type: "POST",
            url: "/api/addEtat/" + id,

            data: {
                "etat": etat

            },

            success: function (response) {
                window.location = "/api/getListeAutorisation";
            },
            error: function (response) {
                alert(' ajout non effectué');
            }
        });

    }
</script>
