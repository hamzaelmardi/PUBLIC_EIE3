<%@ page pageEncoding="UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>


<jsp:include page="../../includes/head.jsp"/>


<jsp:include page="card.jsp"/>
<section class="services-section container-fluid" style="background-color: white;">
    <c:choose>
        <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeEieRe'}">
            <spring:message code="label.dmdRensPre" var="p_page"/>
        </c:when>
        <c:otherwise>
            <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        </c:otherwise>
    </c:choose>

    <div class="row">
        <div class="col-12">
            <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
                    <li class="breadcrumb-item"><a href="/api/checkEIESelect/${type}"><spring:message
                            code="label.etudeimpactenvironnemental"/></a></li>
                    <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                </ol>
            </nav>
        </div>
    </div>


    <div class="row">
        <div class="col-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <table style="width:100% !important; " id="tableProfils"
                   class="table table-striped hover compact table-bordered text-md-nowrap">
                <thead class="">
                <tr>
                    <th rowspan="2"><spring:message code="label.NDemande"/></th>
                    <th rowspan="2"><spring:message code="label.datedepot"/></th>
                    <th rowspan="2"><spring:message code="label.Statut"/></th>
                    <th rowspan="2"><spring:message code="label.Intituledeprojet"/></th>
                    <th colspan="5" style="text-align: center;background-color: #f6f6f6"><spring:message code="label.petitionnaire"/></th>
                    <th rowspan="2"><spring:message code="label.Region"/></th>
                    <th rowspan="2"><spring:message code="label.Categorie"/></th>
                    <th rowspan="2"><spring:message code="label.Caracteretransfrontalier"/></th>
                    <th rowspan="2"><spring:message code="label.piecefournie"/></th>
                    <%--<th rowspan="2"><spring:message code="label.Etudedimpact"/></th>
                    <th rowspan="2"><spring:message code="label.Enquettepublic"/></th>--%>
                    <th rowspan="2"><spring:message code="label.CahierdechargeDefinitive"/></th>
                    <th rowspan="2"><spring:message code="label.Avisdeprojet"/></th>
                    <%--<th rowspan="2"><spring:message code="label.Informationcomplementaire"/></th>--%>
                    <th rowspan="2"><spring:message code="label.Action"/></th>
                </tr>
                <tr>
                    <th><spring:message code="label.Raisonsocial"/></th>
                    <th><spring:message code="label.Representant"/></th>
                    <th><spring:message code="label.Tel"/></th>
                    <th><spring:message code="label.Fax"/></th>
                    <th><spring:message code="label.Email"/></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${notif}" var="nt">
                    <tr>
                        <td class="font-weight-semibold">${nt.num_demande}</td>

                        <td>
                            <fmt:formatDate dateStyle="long" value="${nt.dateDepot }"/>
                        </td>

                        <td>
                            <span class="badge badge-info"> ${nt.statut.nom_fr}</span>
                        </td>

                        <td> ${nt.intitule_projet} </td>
                        <td>${nt.raison_social}</td>
                        <td>${nt.contact}</td>
                        <td>${nt.tel}</td>
                        <td>${nt.fax}</td>
                        <td>${nt.email}</td>

                        <td>
                            <c:if test="${not empty nt.detailRegion}">
                                <button onclick="fun_affiche_modal('#modal_DetailRegion','${nt.id_demande_information}')"
                                        class="btn btn-success btn-sm"><spring:message code="label.DetailRegion"/>
                                </button>
                            </c:if>
                            <c:if test="${empty nt.detailRegion}">
                                -
                            </c:if>
                        </td>

                        <td>
                            <c:if test="${not empty nt.categories}">
                                <button class="btn btn-success btn-sm"
                                        onclick="fun_affiche_modal('#modal_categorie','${nt.id_demande_information}')">
                                    <spring:message code="label.Categories"/>
                                </button>
                            </c:if>
                            <c:if test="${empty nt.categories}">
                                -
                            </c:if>
                        </td>

                        <td> ${nt.tronsfrontalier } </td>

                        <td class="text-center">
                            <button class="btn btn-success rounded" onclick="affiche_files('${nt.id_demande_information}')">
                                <span class="fa fa-archive"></span>
                            </button>
                        </td>


                        <td>
                            <c:if test="${not empty nt.url_cachier_defenitive}">
                                <a class="removeStyle" download
                                   href="${fn:replace(nt.url_cachier_defenitive, "/assets/myFile/", "/dowload_uploaded/")}">
                                    <span class="fa fa-eye" style="font-size:21px;color: #33994c;"></span>
                                </a>
                            </c:if>
                        </td>

                        <td>
                            <c:if test="${not empty nt.url_enquette_defenitive }">
                                <a class="removeStyle" download
                                   href="${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}">
                                    <span class="fa fa-eye" style="font-size:12px;color: #33994c;"></span>
                                </a>
                            </c:if>
                        </td>

                        <%--<td> ${nt.information_projet} Information complémentaire</td>--%>

                        <td>
                            <c:if test="${nt.statut.id_statut_projet==13 }">
                                <a href="/api/demandeinformation/${nt.id_demande_information}/RS"
                                   class="btn btn-primary" title="Attacher Avis de projet"><i
                                        class="fa fa-check"></i><spring:message code="label.AttacherAvisdeprojet"/> </a>

                            </c:if>

                            <c:if test="${nt.statut.id_statut_projet==47}">
                                <a href="/api/demandeinformation/${nt.id_demande_information}/RS"
                                   class="btn btn-primary" title="Attacher les documents définitive"><i
                                        class="fa fa-pencil-alt"></i></a>
                            </c:if>

                            <c:if test="${nt.statut.id_statut_projet==12}">
                                <a href="/api/demandeinformation/${nt.id_demande_information}/EE"
                                   class="btn btn-primary" title="Attacher les documents définitive"><i
                                        class="fa fa-pencil"></i><spring:message code="label.Deposerlademande"/>  </a>
                            </c:if>

                        </td>
                    </tr>
                    <!-- Modal -->
                    <div class="modal fade" id="modal_categorie_${nt.id_demande_information}" tabindex="-1"
                         role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog " role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"><spring:message code="label.Categories"/></h5>
                                    <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row justify-content-center">
                                        <div class="col-10">
                                            <div class="row "
                                                 style="background: gray;color: white;border-color: #737373;">
                                                <div class="col-2 border p-2 font_bold  btn-gris">
                                                    #
                                                </div>
                                                <div class="col-10 border p-2 font_bold  btn-gris">
                                                    <spring:message code="label.nom"/>
                                                </div>
                                            </div>
                                            <c:forEach items="${nt.categories}" var="cat" varStatus="loopp">
                                                <div class="row">
                                                    <div class="col-2 border p-2">
                                                            ${loopp.index+1}
                                                    </div>
                                                    <div class="col-10 border p-2">
                                                            ${cat.nom_fr}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button onclick="close_modal(this)" type="button" class="btn btn-secondary"
                                            data-dismiss="modal"><spring:message code="button.fermer"/></button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Modal -->
                    <div class="modal fade" id="modal_DetailRegion_${nt.id_demande_information}" tabindex="-1"
                         role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id=""><spring:message code="label.DetailRegion"/></h5>
                                    <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row justify-content-center">
                                        <div class="col-10">
                                            <div class="row "
                                                 style="background: gray;color: white;border-color: #737373;">
                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                    <spring:message code="label.Region"/>
                                                </div>
                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                    <spring:message code="label.prefecture"/>
                                                </div>
                                                <div class="col-4 border p-2 font_bold  btn-gris">
                                                    <spring:message code="label.commune"/>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-4 border p-2">
                                                    <c:if test="${not empty nt.detailRegion.region}">
                                                        <ul>
                                                            <c:forEach items="${nt.detailRegion.region}" var="det">
                                                                <li> - ${det.nom_fr}</li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:if>
                                                    <c:if test="${empty nt.detailRegion.region}">
                                                        -
                                                    </c:if>
                                                </div>
                                                <div class="col-4 border p-2">
                                                    <c:if test="${not empty nt.detailRegion.prefectures}">
                                                        <ul>
                                                            <c:forEach items="${nt.detailRegion.prefectures}" var="det">
                                                                <li> - ${det.nom_fr}</li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:if>
                                                    <c:if test="${empty nt.detailRegion.prefectures}">
                                                        -
                                                    </c:if>
                                                </div>
                                                <div class="col-4 border p-2">
                                                    <c:if test="${not empty nt.detailRegion.communes}">
                                                        <ul>
                                                            <c:forEach items="${nt.detailRegion.communes}" var="det">
                                                                <li> - ${det.nom_fr}</li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:if>
                                                    <c:if test="${empty nt.detailRegion.communes}">
                                                        -
                                                    </c:if>
                                                </div>


                                            </div>

                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button onclick="close_modal(this)" type="button" class="btn btn-secondary"
                                            data-dismiss="modal"><spring:message code="button.fermer"/></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>


<!-- Modal -->
<div class="modal fade" id="modal_fichiers" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.piecefournie"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="zone_tab_fichier">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.fermer"/></button>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../../includes/footer1.jsp"/>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
    function close_modal(val) {
        $(val).closest(".modal").modal('hide');
    }
    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }

    //-->
</script>
