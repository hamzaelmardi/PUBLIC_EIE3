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

<div class="bg-white" id="accordion-style-1" >
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">

                        <div class="">
                            <div class="card-header" id="headingTwo" >
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn  text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                  <c:if test="${pageContext.response.locale=='ar'}">
                      <i class="fa fa-angle-double-left mr-3"></i>
                  </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>



                                        <spring:message code="label.informationssurlepetitionnaire"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse show fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.raisonsocial"/>  </label>
                                                <input type="text" disabled value="${installation.raison}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.if"/></label>
                                                <input type="text" disabled value="${installation.ife}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Adresse"/> </label>
                                                <textarea disabled rows ="2" class="form-control">${installation.adresse} </textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Tel"/> </label>
                                                <input type="tel" disabled value="${installation.tel}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Fax"/>  </label>
                                                <input type="text" disabled value="${installation.fax}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Email"/> </label>
                                                <input type="text" disabled value="${installation.email}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Region"/>  </label>
                                                <input type="text" disabled value="${pageContext.response.locale=='ar'?installation.region.nom_ar:installation.region.nom_fr}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.prefecture"/> </label>
                                                <input type="text" disabled value="${pageContext.response.locale=='ar'?installation.prefecture.nom_ar:installation.prefecture.nom_fr}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn  collapsed text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-left mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if><spring:message code="label.Installationdetraitementdesdechets"/>
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Numerodedemande"/>  </label>
                                                <input type="text" disabled value="${installation.num_demande}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Sitedelinstallation"/>   </label>
                                                <input type="text" disabled value="${installation.site}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Operation"/> </label>
                                                <input type="text" disabled value="${installation.operation}" class="form-control">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.descriptiondinstallation"/> </label>
                                                <input type="text" disabled value="${installation.description}" class="form-control">
                                            </div>
                                        </div>

<%--                                        <div class="col-md-6 col-sm-12">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label> <spring:message code="label.structuredinstallation"/>   </label>--%>
<%--                                                <input type="text" disabled value="${installation.structure}" class="form-control">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Quantite"/>  </label>
                                                <input type="text" disabled value="${installation.quantite}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Typedappareil"/> </label>
                                                <input type="text" disabled value="${installation.type_appareil}" class="form-control">
                                            </div>
                                        </div>
<%--                                        <div class="col-md-4 col-sm-12">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label> <spring:message code="label.Quantite"/>  </label>--%>
<%--                                                <input type="text" disabled value="${installation.quantite}" class="form-control">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Unite"/> </label>
                                                <input type="text" disabled value="${installation.unite.nom_fr}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-12" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                            <c:if test="${installation.type=='2'}">
                                                <h5 class=""><spring:message code="label.lescodesatraiter"/> </h5>
                                                <table class="table table-bordered table-striped table-hover my_table">
                                                    <thead>
                                                    <tr>
                                                        <th><spring:message code="label.code"/></th>
                                                        <th><spring:message code="label.type"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${installation.code}" var="code">
                                                        <tr>
                                                            <td>${code.nom_fr}</td>
                                                            <td>${code.nom_ar}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty installation.code}">
                                                        <tr>
                                                            <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                                        </tr>
                                                    </c:if>

                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${installation.type=='1'}">
                                                <h5 style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" class=""><spring:message code="label.Vousavezselectionneztouslescodesalexceptiondelalistecidessous"/></h5>
                                                <table class="table table-bordered table-striped table-hover my_table">
                                                    <thead>
                                                    <tr>
                                                        <th><spring:message code="label.code"/></th>
                                                        <th><spring:message code="label.type"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${installation.code}" var="code">
                                                        <tr>
                                                            <td>${code.nom_fr}</td>
                                                            <td>${code.nom_ar}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty installation.code && installation.type!='3'}">
                                                        <tr>
                                                            <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                                                        </tr>
                                                    </c:if>

                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${installation.type=='3'}">
                                                <section class="border p-3">
                                                    <h5 class="text-center"><spring:message code="label.vousavezselectionneztouteslaliste"/> </h5>
                                                </section>
                                            </c:if>
                                            <c:if test="${installation.type=='0'}">
                                                <h3 class="text-center">Vous avez droit à les categories suivant :</h3>
                                                <c:forEach items="${installation.categorie}" var="c">
                                                    <p>- ${c.nom_fr}</p>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-left mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>
                                        <spring:message code="button.equipedetravail"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.nbequipe"/></label>
                                                <input disabled type="text" class="form-control" value="${installation.nbr_equipe_travail}">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Horairedebutdexploitation"/></label>
                                                <input disabled type="text" class="form-control" value="${installation.horaire_exploitation}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Nbrdeffectif"/></label>
                                                <input type="text" class="form-control" disabled value="${installation.formation}">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingFour">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-left mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if><spring:message code="label.Piecesaccompagnelademande"/>
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
                                                <td colspan="2"><spring:message code="label.AucunFichier"/>  </td>
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


<c:if test="${(empty installation ) }"><spring:message code="label.Aucunresultat"/> </c:if>
<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
