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
        display: none;
        background-color: #000000;
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
                    <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px; text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                        <div class="row p-0 m-0 justify-content-center">
                            <div class="col-md-8 col-sm-12 grid-margin stretch-card " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="photo  hvr-buzz-out">
                                    <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                                </div>
                                    <div class="card" style="padding-bottom: 15px;">
                                        <div class="row justify-content-center">


                                            <div class="col-12 mt-4">

                                                <%--<h5 style="float:right;color:black">Validation du documents</h5>--%>

                                                <h4><spring:message code="label.Completerlesdocuments"/></h4>
                                                <div class="row p-0 m-0 mt-5">


                                                </div>
                                                    <div class="table-responsive col-12">
                                                        <table class="table my_table table-striped table-hover table-bordered ">
                                                    <thead>
                                                    <tr>
                                                        <th><spring:message code="label.Piecesafournir"/></th>
                                                        <th><spring:message code="label.Commentaire"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${doc}" var="dc">
                                                        <c:if test="${dc.nom_ar!='oui'}">
                                                            <tr>
                                                                <td class="${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}" style="width: 70% !important;">
                                                                    <div class="form-group">
                                                                        <label class=""> ${pageContext.response.locale=='ar'?dc.docImport.nom_ar:dc.docImport.nom_fr } </label>
                                                                        <a download href="/downloadFile/${fn:replace(dc.url,"/assets/myFile/","")}"><i class="fa fa-upload " title="Télécharger le document" style="margin:0 !important; color: green"></i> </a>
                                                                        <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                                            <div class="upload">
                                                                                <div class="field">
                                                                                <input required
                                                                                       onchange="addDocs(${dc.notif.id_notification},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport}','file-chosen_${dc.docImport.id_docImport}')"
                                                                                       accept=".pdf" type="file" name="doc1"
                                                                                       id="doc${dc.docImport.id_docImport}" class="actual-btn" hidden>
                                                                                </div>
                                                                                    <label class="uploadButton" for="doc${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>
                                                                                <span class="fileName" id="file-chosen_${dc.docImport.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td><label disabled id="id${dc.id_listDocNotif }" > ${dc.nom_fr } </label></td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                    </div>
                                                    <div class="row justify-content-center">
                                                        <div class="actions col-md-4 col-sm-6">
                                                            <input type="button" id="ret"
                                                                    class="btn btn-success btn-block mt-2 mb-4" value="<spring:message code="label.Valider"/>"
                                                                    onclick="changeEtat('${id}')"/>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>

                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>
<script>

    function changeEtat(id) {
        var empty = false;
        $('.field input').each(function() {
            if ($(this).val().length === 0) {
                empty = true;
            }
        });
        if (empty) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.unouplusieurschampssontvides"/>", "error");
        }else{
            $.ajax({
                type: "POST",
                url: "/api/changeEtat/" + id,

                data: {
                },

                success: function (response) {
                    window.location.href="/api/getnotifById2/${type}/${id}";
                },
                error: function (response) {
                    alert('Erreur ajout non effectué');
                }
            });
        }
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
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();


    function getOptionByFilter(val, table, select_id) {

        $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

            $("#" + select_id)
                .empty()
                .append('<option selected="selected" value=""><spring:message code="option.Choisir"/> </option>');
            $.each(data, function (i, v) {
                $("#" + select_id).prepend(new Option(v[1], v[0]));
            })
            if($(data).length==1){
                $("#"+select_id +" option").eq(0).prop("selected",true);
            }
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
