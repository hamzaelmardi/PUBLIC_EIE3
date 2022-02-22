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

<section class="services-section mt-5 bg-white mt-5 pt-5">
    <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload">
        <div class="col-12 from_add" id="frm_etatDoss pt-5" style="margin-top: 80px; text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="row p-0 m-0 justify-content-center pt-4">
                <div class="col-md-8 col-sm-12 grid-margin stretch-card " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="photo  hvr-buzz-out">
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <form name="doc" id="doc">
                        <div class="card" style="padding-bottom: 15px;">
                            <div class="row justify-content-center">
                                <div class="col-12 mt-4">
                                    <h4><spring:message code="label.Completerlesdocuments"/></h4>
                                    <div class="row p-0 m-0 mt-5">
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
                                                <td class="${dc.nom_ar=='oui'?'Doc_ok':'Doc_Not_ok'}" style="width: 70% !important;">

                                                    <div class="form-group">
                                                        <label class=""> ${pageContext.response.locale!='ar'?dc.docImport.nom_fr:dc.docImport.nom_ar } </label>
                                                    <a type="button" class="btn btn-primary btn-sm text-center" download href="/downloadFile/${fn:replace(dc.url,"/assets/myFile/","")}" style="border-radius: 50%">
                                                        <i class="fa fa-upload m-0 auto" title="Télécharger le document"></i> </a>
                                                    <div class="${dc.nom_ar=='oui'?'hidden':'' }">
                                                        <input required
                                                               onchange="addDocG(${dc.collecte.id_collecte},${dc.docImport.id_docImport},'doc${dc.docImport.id_docImport}','CT','')"
                                                               accept=".pdf" type="file"
                                                               id="doc${dc.docImport.id_docImport }"
                                                               class="form-control mydoc">
                                                    </div>


                                                </div>
                                                </td>

                                                <td><label disabled id="id${dc.id_listDocNotif }"> ${dc.nom_fr } </label></td>
                                            </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <a href="/api/checkUserHasCollecte/CT" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;margin-top: 12px;"><spring:message code="label.Valider"/></a>
                                    </div>
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
                .append('<option selected="selected" value=""<spring:message code="option.Choisir"/></option>');
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
