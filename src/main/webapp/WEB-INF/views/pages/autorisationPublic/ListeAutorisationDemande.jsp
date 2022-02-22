<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<jsp:include page="../../includes/head.jsp"/>

<jsp:include page="card.jsp" />


<section class="services-section" style="background-color: white" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-lg-12 grid-margin stretch-card cardstatistic" id="pagereload" >
        <c:choose>
            <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeAutorisationDemande/ZF/d'}">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="p_page" value="استيراد منطقة خالية من النفايات"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="Importation des déchets d'une zone franche"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeAutorisationDemande/ET/d'}">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="p_page" value="استيراد مخلفات غير خطرة من دولة أجنبية"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="Importation des déchets non dangereux d’un pays étranger"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeAutorisationDemande/XD/d'}">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="p_page" value="تصدير المخلفات الخطرة"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="Exportation des déchets dangereux "/>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeAutorisationDemande/TR/d'}">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="p_page" value="عبور النفايات"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="Transit des déchets"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/ListeAutorisationDemande/TR/d'}">
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="p_page" value="عبور النفايات"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="Transit des déchets"/>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:otherwise>
                <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
        </c:choose>

        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style=" width: 100%!important;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/" ><spring:message code="label.Accueil"/> </a></li>
                <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
            </ol>
        </nav>


     <%-- <a href="/api/ListeAutorisation/${type }/n" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white; ${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}"><span class=" fa fa-arrow-down"></span>  <spring:message code="label.numero"/></a>
       
       
        &lt;%&ndash;<a href="/api/addNumNotification" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>&ndash;%&gt;
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr " style="background-color: #336c4e;margin-bottom:12px;color: white"><spring:message code="label.Depot"/> </a>
    
     <hr>
       
        <a href="/api/ListeAutorisationDemande/${type}/d" class="btn btr" style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.ListeNotif"/></a>
       
       
        &lt;%&ndash;<a href="/api/addNumNotification" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.Demandedenumerodenotification"/></a>&ndash;%&gt;
        <a href="/api/addDemandNotification/0/${type}/N" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.Nouvelledemande"/> </a>

        <a href="/api/addDemandNotification/0/${type}/R" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white"><spring:message code="label.DemandedeRenouvellement"/> </a>--%>

        <%--         <a href="/api/addDemandNotification/0/${type}/R" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white">Demande de Renouvellement </a>
 --%>
    </div>

    <div class="row-fluid mb-3">
        <div class="col-2">
            <a href="/api/checkUserHasCollecte/${type}" class="btn btn-success btn-block">
                <span class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/>
            </a>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-12 table-responsive">
            <table id="tab2" class="table my_table table-striped hover compact table-bordered text-md-nowrap">
                <thead class="thead-bleu">
                <tr>
                    <th class=""><spring:message code="label.Numerodenotification"/> </th>
                    <th class=""><spring:message code="label.datedepot"/> </th>
                    <th class=""><spring:message code="label.code"/></th>
                    <th class=""><spring:message code="label.typededechet"/></th>
                    <c:choose>
                        <c:when test="${type=='ZF'}">
                            <th class=""><spring:message code="label.Zonnefranche"/></th>
                        </c:when>
                        <c:otherwise>
                            <th><spring:message code="label.pays"/></th>
                        </c:otherwise>
                    </c:choose>

                    <th class=""><spring:message code="label.Statut"/></th>
                    <th class=""><spring:message code="label.Operation"/></th>
                    <th class=""><spring:message code="label.Quantite"/></th>

                    <th class=""><spring:message code="label.societe"/></th>
                    <th class=""><spring:message code="label.Informationcomplementaire"/></th>
                    <th class=""><spring:message code="label.Action"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notif}" var="nt">
                    <tr>
                        <td class="font-weight-semibold">${nt.num_notification }</td>

                        <td>
                            <fmt:formatDate   dateStyle="long" value="${nt.dateDepot }" />

                        </td>
                        <td> ${nt.code.nom_fr }  </td>
                        <td> ${nt.code.nom_ar }  </td>
                        <td> ${nt.zonneFranche.nom_fr } </td>
                        <td> <span class="badge badge-info"> ${nt.statut.nom_fr }</span>  </td>
                        <td>  ${nt.operation }  </td>
                        <td> ${nt.quantite } ${nt.unite.nom_fr } </td>

                        <td>   </td>
                        <td> </td>

                        <td class="">


                            <c:if test="${nt.statut.id_statut_projet==37 }">
                                <a href="/api/validateDoc/${nt.id_notification }/${type}" class="btn btn-primary"><i class="fa fa-upload " title="Améliorer les documents" style="margin:0 !important"></i></a>

                            </c:if>
                                <%--<c:if test="${ }">--%>

                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id="Suivante"
                                    onclick="updatePdf(${nt.id_notification })"
                                    class="btn btn-success"><spring:message code="label.Imprimer"/>
                            </button>

                                <%--</c:if>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>



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
                <button type="button" class="btn btn-success" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
            </div>
        </div>

    </div>
</div>

<script>


    $(document).ready(function() {


    } );

    function updatePdf(id) {

        fetch('/api/test/'+id)
            .then(resp => resp.blob())
    .then(blob => {
            const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.style.display = 'none';
        a.href = url;
        // the filename you want
        a.download = 'Notification.pdf';
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);

    })
    .catch(() => alert(''));


    }
</script>




<jsp:include page="../../includes/footer1.jsp"/>