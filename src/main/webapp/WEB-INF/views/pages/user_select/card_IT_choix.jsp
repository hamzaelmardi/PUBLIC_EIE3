<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<style>
    .card-body {
        text-align: center !important;
    }

    .dropdown-menu {
        min-width: 7rem !important;
        font-size: 14px !important;
        margin: 0.125rem -70px 0px !important;
    }
    .btn:focus, .btn.focus {
        outline: none !important;
        box-shadow: none !important;
    }

    .mydrop{
        direction: ltr !important;
    }

    .mydrop ul li a:hover{
        background-color:#0aa68d;
        color: white;
    }

    .mydrop ul li a{
        text-decoration: none !important;
        margin-bottom:1rem;
        list-style: none !important;
        padding:20px
    }

    @media (max-width: 768px) {
        h1{
            font-size: 1.5rem !important;
        }
    }
</style>

<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="/api/checkUserHasCollecte/IT"><spring:message
                                code="label.Installationdetraitementdesdechets"/></a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-md-10 col-sm-12">
                <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="col-md-12">
                        <div class="card w-100">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-10">
                                        <h1><spring:message code="label.Installationdetraitementdesdechets"/></h1>
                                    </div>
                                    <div class="col-md-2 mydrop">
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                                <img src="${pageContext.request.contextPath}/assets/images/question.png" width="40" class="img-fluid img-circle">
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()"><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Installation%20de%20traitement%20des%20dechets/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="light">
                        <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
                        <video id="VisaChipCardVideo" width="600" controls>
                            <source src="${pageContext.request.contextPath}/assets/video/ajouter%20demande%20instalation.mp4" type="video/mp4">
                            <!--Browser does not support <video> tag -->
                        </video>
                    </div>

                    <div id="fade" onClick="lightbox_close();"></div>
                    <div class="col-md-6 col-sm-12 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">
                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <p class="text-success font_bold  pl-2"><spring:message
                                                code="label.Deposerundossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message code="label.cliquezsurleboutonconcerne"/></p>
                                    </div>
                                    <div class="col-12">
                                                <a href="/api/addInstallation/0/N"
                                                   class="btn btn-sm btn-success"><spring:message
                                                        code="label.Commencerlademarche"/>
                                                <c:if test="${pageContext.response.locale!='ar'}">
                                                    <span class="fa fa-angle-double-right"></span>
                                                </c:if>
                                                    <c:if test="${pageContext.response.locale=='ar'}">
                                                        <span class="fa fa-angle-double-left"></span>
                                                    </c:if>
                                                    </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-lg-6" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="card w-100" style="min-height: 210px">
                            <div class="card-body">

                                <div class="row">
                                    <div class=" col-md-3 col-sm-12  rounded pl-0 pr-0">
                                        <div class="rounded-circle my_bg p-3 m-3">
                                            <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12 pr-0 pl-0" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <p class="text-success font_bold  pl-2"><spring:message
                                                code="label.Suivremondossier"/></p>
                                        <hr>
                                        <p class="pl-2 text-justify"><spring:message
                                                code="label.Poursuivreletatdavancementdundossierdejadepose"/></p>
                                    </div>
                                    <div class="col-12">

                                            <button onclick="affiche_nume_zone('zone_tab1')"
                                            <c:if test="${empty install}">disabled</c:if>
                                                    class="btn btn-sm mt-1 btn-success">
                                                <spring:message code="label.Parnumerodedossier"/>
                             <c:if test="${pageContext.response.locale!='ar'}">
                                                <span class="fa fa-angle-double-right"></span>
                             </c:if>
                                                <c:if test="${pageContext.response.locale=='ar'}">
                                                    <span class="fa fa-angle-double-left"></span>
                                                </c:if>
                                 </button>


                                            <button onclick="go_to('/api/ListInstallation')"
                                            <c:if test="${empty install}"></c:if>
                                               class="btn btn-sm mt-1 btn-success">
                                                <spring:message code="label.Affichermesdossiers"/>
                                       <c:if test="${pageContext.response.locale!='ar'}">
                                                <span class="fa fa-angle-double-right"></span>
                                       </c:if>
                                                <c:if test="${pageContext.response.locale=='ar'}">
                                                    <span class="fa fa-angle-double-left"></span>
                                                </c:if>
                                           </button>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center zone_tab collapse" id="zone_tab">
            <div class="col-md-10 table-responsive col-sm-12">
                <a class="btn btn-primary mb-2"><spring:message code="label.Mesnumerosdenotification"/> </a>
                <table class="my_table table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><spring:message code="label.Numerodenotification"/></th>
                        <th scope="col"><spring:message code="label.datededemandedenumerodenotification"/></th>
                        <th scope="col"><spring:message code="label.code"/></th>
                        <th scope="col"><spring:message code="label.Typededechets"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${notif}" var="n" varStatus="loop">

                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_notification}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td scope="col">${n.code.nom_fr}</td>
                            <td scope="col">${n.code.nom_ar}</td>
                            <td scope="col"><a href="/api/addDemandNotification/${n.id_notification}/${type}/N"
                                               class="btn btn-success"><spring:message code="label.Deposerlademande"/></a></td>
                        </tr>


                    </c:forEach>
                </table>
                <c:if test="${empty notif}">
                    <spring:message code="label.AucunnumerodeNotificationenregistrer"/>.
                </c:if>
            </div>
        </div>
        <div class="row justify-content-center zone_tab collapse" id="zone_tab1" >
            <div class="col-md-10 table-responsive col-sm-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >

                <a class="btn btn-primary mb-2" style="${pageContext.response.locale=='ar'?'float:right;':'text-align:left;'}"> <spring:message code="label.Mesnumerosdedossier"/></a>


                <table class="my_table table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Numero D'installation</th>
                        <th scope="col"><spring:message code="label.dateDedepot"/></th>
                        <th scope="col"><spring:message code="label.Detail"/></th>
                        <th scope="col"><spring:message code="label.Action"/></th>
                    </tr>
                    <c:forEach items="${install}" var="n" varStatus="loop">
                        <tr>
                            <td scope="col">${loop.index +1}</td>
                            <td scope="col"> ${n.num_demande}</td>
                            <td scope="col"><fmt:formatDate value="${n.dateDepot}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <c:if test="${not empty n.code}">
                                    <button class="btn btn-success btn-circle"
                                            onclick="show_code('${n.id_installation}')">
                                        <span class="fa fa-dumpster"></span>
                                    </button>
                                </c:if>
                                <c:if test="${empty n.code}">
								<span class="f-12">
									<spring:message code="label.Pasdecode"/>
								</span>
                                </c:if>

                            </td>
                            <td><a href="/api/recapIT/${n.id_installation}"
                                   class="btn btn-success"><spring:message code="label.Recapitulation"/></a></td>
                        </tr>

                    </c:forEach>
                </table>
                <c:if test="${empty notifall}">
                    <spring:message code="label.AucunnumerodeDossierenregistrer"/>.
                </c:if>
            </div>
        </div>

        <div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabele" aria-hidden="true" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="modal-dialog modal-lg modal-dialog-centered" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabele"><spring:message code="label.listdescodes" /></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                onclick="hide_code()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 table-responsive">
                                <h4 class="text-left" id="myH"></h4>
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

    </div>
</div>


<script>
    function fun_recher() {
        var id = $('#recap').val();
        $.ajax({
            url: '/api/checknotif/' + id + '/${type}',
            type: 'GET',
            dataType: 'html',
            data: {},
        })
            .done(function (data) {
                if (data == 0) {
                    swal("<spring:message code="label.Aucunresultat"/> ", "<spring:message code="label.mercidevrifierlenumerosaisie"/> ", "error");
                } else {
                    window.location.href = "/api/getnotifById1/${type}/" + data;
                }

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

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
                        $("#myH").text("<spring:message code="label.Lescodesnontraiter"/>");
                    }
                    else if(response.typeIT=="2"){
                        $("#myH").text("<spring:message code="label.Lescodesnontraiter"/>");
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
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>


<jsp:include page="../../includes/footer1.jsp"/>
