<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .accordion-toggle {
        background-color: #336c4e;
        display: block;
    //padding: 10px;
        margin: -11px -20px;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
    }

    .accordion-toggle.collapsed {
        background-color: #f6f6f6;
        border-top-color: #c5c5c5;
        font-weight: normal;
        color: #454545 !important;
    }
</style>

<div class="bg-white" id="accordion-style-1" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">
                        <div class="">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} ml-2"></i><spring:message code="label.InformationdemandeurA" />
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Numerodedemande"/>  </label>
                                                <input type="text" disabled value="${collect.num_demande}" class="form-control">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.RaisonsocialeA"/>  </label>
                                                <input type="text" disabled value="${collect.raison}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.identifiantfiscal"/></label>
                                                <input type="text" disabled value="${collect.idfiscale}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.CINA"/> </label>
                                                <input type="text" disabled value="${collect.cin}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.RepresantantA"/> </label>
                                                <input type="text" disabled value="${collect.demandeur_Nom}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.AdresseA"/> </label>
                                                <textarea disabled class="form-control" rows="2">${collect.demandeurAdresse}</textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.TelephoneA"/> </label>
                                                <input type="tel" disabled value="${collect.demandeurTel}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.FaxA"/>  </label>
                                                <input type="text" disabled value="${collect.demandeurFax}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.EmailA"/> </label>
                                                <input type="text" disabled value="${collect.demandeurEmail}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} ml-2"></i>
                                        <spring:message code="label.listdesdechetchoisi" />
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <table class="table table-bordered table-striped table-hover my_table">
                                                <thead>
                                                <tr>
                                                    <th><spring:message code="label.code"/></th>
                                                    <th><spring:message code="label.type"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${collect.code}" var="code">
                                                    <tr>
                                                        <td>${code.nom_fr}</td>
                                                        <td>${code.nom_ar}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty collect.code}">
                                                    <tr>
                                                        <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                                    </tr>
                                                </c:if>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} ml-2"></i>
                                        <spring:message code="label.DonneesurlesvehiculesA" />
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.NombredeVehiculeA"/></label>
                                                <input disabled type="text" class="form-control" value="${collect.nombre_vehicule}">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.NombredeconteneursA"/></label>
                                                <input disabled type="text" class="form-control" value="${collect.nombre_conteneur}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <table class="table table-bordered my_table">
                                                <thead>
                                                <tr>
                                                    <th><spring:message code="label.NMatriculation"/></th>
                                                    <th><spring:message code="label.NChassis"/></th>
                                                    <th><spring:message code="label.Poidstotalencharge"/></th>
                                                    <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                                    <th><spring:message code="label.TypedevehiculesA"/></th>
                                                    <th><spring:message code="label.typedeconteneursA"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:choose>
                                                    <c:when test="${(not empty collect.vehicules)}">
                                                        <c:forEach items="${collect.vehicules}" var="v">
                                                            <tr id="tr${v.id_vehicule}">
                                                                <td>${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto} - ${v.num_mat_id_prefect}</td>
                                                                <td>${v.num_chassis}</td>
                                                                <td>${v.poit_totale_charge}</td>
                                                                <td>${v.point_net}</td>
                                                                <td>${v.typeVehicule}</td>
                                                                <td>${v.typeConteneur}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                            <td colspan="7" class="bg-primary text-center"><spring:message code="label.Aucunvehicule"/></td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingFour">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} ml-2"></i><spring:message code="label.Piecesaccompagnelademande"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse fade" aria-labelledby="headingFour" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table my_table table-striped table-bordered table-hover">
                                        <c:if test="${not empty doc}">
                                            <c:forEach items="${doc}" var="file">
                                                <tr>
                                                    <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                                                    <td>
                                                        <a target="_blank" class="btn btn-success" href="/downloadFile/${fn:replace(file.url,"/assets/myFile/","")}"> <span class="fa fa-download"></span></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${empty doc}">
                                            <tr>
                                                <td colspan="2"> <spring:message code="label.AucunFichier"/> </td>
                                            </tr>
                                        </c:if>

                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
</div>


<c:if test="${(empty collect ) && (empty installation) && (empty notification)}"><spring:message code="label.Aucunresultat"/></c:if>
<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
