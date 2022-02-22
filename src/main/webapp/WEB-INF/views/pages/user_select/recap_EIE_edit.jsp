<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
    .card-body{
    ${pageContext.response.locale!='ar'?'border-left: 8px solid #5d6974;':'border-right: 8px solid #5d6974;'}
    }
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
<div class="bg-white" id="accordion-style-1">
    <div class="row">
        <div class="col-12">
            <div class="accordion" id="accordionExample">
                        <div class="" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn text-white"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-right ml-3"></i>
                                        </c:if>
                                        <c:if test="${demande.type.equals('AE')}">
                                            <spring:message code="label.informationssurlepetitionnaireAE"/>
                                        </c:if>
                                        <c:if test="${!demande.type.equals('AE')}">
                                            <spring:message code="label.informationssurlepetitionnaire"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.NDemande"/>  </label>
                                                <input type="text" disabled value="${demande.num_demande}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Representant"/>  </label>
                                                <input type="text" disabled value="${demande.represantant}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.RaisonsocialeA"/>  </label>
                                                <input type="text" disabled value="${demande.raison_social}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.AdresseA"/> </label>
                                                <input type="text" disabled value="${demande.adresse}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.TelephoneA"/>  </label>
                                                <input type="tel" disabled value="${demande.tel}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.FaxA"/>  </label>
                                                <input type="text" disabled value="${demande.fax}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.EmailA"/> </label>
                                                <input type="text" disabled value="${demande.email}" class="form-control">
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
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-right ml-3"></i>
                                        </c:if>
                                        <c:if test="${type=='AE'}">
                                            <spring:message code="label.informationProjetAE"/>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <spring:message code="label.informationProjet"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <c:if test="${type=='EE' || type=='RS'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.intitule"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Transfrontalier"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.tronsfrontalier}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.interregion"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.interregion}">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${type=='AE'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Intituledeprojet"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Naturedactivite"/></label>
                                                    <textarea disabled type="text" class="form-control" rows="3">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="input-group" style="margin-top: 32px">
                                                    <input type="text" class="form-control" disabled value="<spring:message code="label.Consistancedelactivite"/>" aria-label="Username" aria-describedby="basic-addon1">
                                                    <span id="basic-addon1"><a target="_blank" class="btn btn-success btn-rounded" href="/downloadFile/${fn:replace(fn:replace(demande.url_file_AE,"/assets/myFile/",""),"/dowload_uploaded/","")}"> <span class="fa fa-download"></span></a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${type=='NT'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.intitule"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demande.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.NatureduProjet"/></label>
                                                    <textarea disabled type="text" class="form-control">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-right ml-3"></i>
                                        </c:if>
                                        <c:if test="${type=='AE'}">
                                            <spring:message code="label.localisationduprojet"/>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <spring:message code="label.localisationProjet"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <div class="row justify-content-center">
                                                <div class="col-10">
                                                    <div class="row "
                                                         style="background: gray;color: white;border-color: #737373;">
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.Regions"/>
                                                        </div>
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.prefecturesp"/>
                                                        </div>
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.communes"/>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demande.detailRegion.region}">
                                                                <ul>
                                                                    <c:forEach items="${demande.detailRegion.region}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demande.detailRegion.region}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demande.detailRegion.prefectures}">
                                                                <ul>
                                                                    <c:forEach items="${demande.detailRegion.prefectures}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demande.detailRegion.prefectures}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demande.detailRegion.communes}">
                                                                <ul>
                                                                    <c:forEach items="${demande.detailRegion.communes}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demande.detailRegion.communes}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="card-header" id="headingFour">
                                <h5 class="mb-0">
                                    <a class="accordion-toggle btn collapsed text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <i class="fa fa-angle-double-right mr-3"></i>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <i class="fa fa-angle-double-right ml-3"></i>
                                        </c:if></i><spring:message code="label.Piecesaccompagnelademande"/>
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

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

<script src="${pageContext.request.contextPath}/assets/intl-tel-input-master/build/js/intlTelInput.js"></script>
<script>
    var input_all = $("input[type=tel]");
    for (var x = 0;x<input_all.length;x++){
        window.intlTelInput(input_all[x], {
            // allowDropdown: false,
            // autoHideDialCode: false,
            //autoPlaceholder: "off",
            // dropdownContainer: document.body,
            // excludeCountries: ["us"],
            // formatOnDisplay: false,
            // geoIpLookup: function(callback) {
            //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
            //     var countryCode = (resp && resp.country) ? resp.country : "";
            //     callback(countryCode);
            //   });
            // },
            // hiddenInput: "full_number",
            // initialCountry: "auto",
            // localizedCountries: { 'de': 'Deutschland' },
            nationalMode: false,
            // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
            // placeholderNumberType: "MOBILE",
            // preferredCountries: ['cn', 'jp'],
            // separateDialCode: true,
            utilsScript: "${pageContext.request.contextPath}/assets/intl-tel-input-master/build/js/utils.js",
        });
    }

</script>
