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
        <c:if test="${notification.zf_et=='XD' || notification.zf_et=='ZF'}">
          <div class="">

            <div class="card-header" id="headingOne1">
              <h5 class="mb-0">
                <a class="accordion-toggle btn text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                  <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} "></i>

                  <spring:message code="label.Numerodenotification"/>
                </a>
              </h5>
            </div>

            <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
              <div class="card-body">
                <div class="row m-0 p-0 mt-2">
                  <div class="col-6">
                    <div class="form-group">
                      <label><spring:message code="label.Numerodenotification"/></label>
                      <input class="form-control" value="${notification.num_notification}" disabled>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label><spring:message code="label.Classificationdesdechets"/> </label>
                      <input class="form-control" value="${pageContext.response.locale!='ar'?notification.classification.nom_fr:notification.classification.nom_ar}" disabled>
                    </div>
                  </div>
                </div>
                <div class="row m-0 p-0 mt-2">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.code"/> </label>
                      <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label><spring:message code="label.typededechet"/> </label>
                      <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                    </div>
                  </div>

                </div>

                <div class="row m-0 p-0 mt-2">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label>
                        <c:choose>
                          <c:when test="${type=='ZF'}">
                            <spring:message code="label.ZoneFranche"/>
                          </c:when>
                          <c:when test="${type=='XD'}">
                            <spring:message code="label.PaysEtranger"/>
                          </c:when>
                          <c:otherwise>
                            <spring:message code="label.pays"/>
                          </c:otherwise>
                        </c:choose>
                      </label>
                      <input type="text" disabled value="${pageContext.response.locale!='ar'?notification.zonneFranche.nom_fr:notification.zonneFranche.nom_ar} ${pageContext.response.locale!='ar'?notification.pays.nom_fr:notification.pays.nom_ar}" class="form-control">
                    </div>
                  </div>

                  <%--<div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.producteur"/>  </label>
                      <input type="text" disabled value="${notification.producteur_text}" class="form-control">
                    </div>
                  </div>--%>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.quantitetotaleprevu"/> </label>
                      <input type="text" disabled value="${notification.quantite}" class="form-control">
                    </div>
                  </div>
                </div>

                <div class="row m-0 p-0 mt-2">


                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.unite"/>  </label>
                      <input type="text" disabled value="${pageContext.response.locale!='ar'?notification.unite.nom_fr:notification.unite.nom_ar}" class="form-control">
                    </div>
                  </div>

                </div>

              </div>
            </div>

            <div class="card-header" id="headingOne2">
              <h5 class="mb-0">
                <a class="accordion-toggle collapsed btn text-white" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" type="button" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                  <i class="fa fa-angle-double-${pageContext.response.locale=='ar'?'left':'right'} "></i>

                  <c:if test="${notification.zf_et.equals('ZF')}">
                    <spring:message code="label.ImportateurN"/>
                  </c:if>
                  <c:if test="${notification.zf_et.equals('XD')}">
                    <spring:message code="label.ExportateurNotifiant"/>
                  </c:if>
                </a>
              </h5>
            </div>

            <div id="collapseOne2" class="collapse fade" aria-labelledby="headingOne2" data-parent="#accordionExample">
              <div class="card-body">
                <div class="row mb-2">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group text-left">
                      <label> Nom de la société </label>
                      <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group text-right">
                      <label dir="rtl"> اسم الشركة </label>
                      <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text" class="form-control">
                    </div>
                  </div>
                </div>

                <div class="row mb-2">
          <c:if test="${notification.zf_et.equals('ZF')}">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.personneacontacter"/> </label>
                      <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                    </div>
                  </div>
          </c:if>
                  <c:if test="${notification.zf_et.equals('XD')}">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.personneacontacter"/> </label>
                        <input value="${notification.importateur.genre}" disabled type="text" class="form-control">
                      </div>
                    </div>
                  </c:if>
                  <c:if test="${notification.zf_et.equals('ZF')}">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.identifiantfiscal"/> </label>
                        <input value="${notification.importateur.idf}" disabled type="text" class="form-control">
                      </div>
                    </div>
                  </c:if>
                  <c:if test="${notification.zf_et.equals('XD')}">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.Qualite"/> </label>
                        <input value="${notification.importateur.qualite}" disabled type="text" class="form-control">
                      </div>
                    </div>
                  </c:if>
                </div>
                <div class="row mb-2">
          <c:if test="${notification.zf_et.equals('XD')}">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.NometPrenom"/> </label>
                      <input disabled type="text" class="form-control" value="${notification.importateur.contact_fr}">
                    </div>
                  </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label> <spring:message code="label.identifiantfiscal"/> </label>
                        <input value="${notification.importateur.idf}" disabled type="text" class="form-control">
                      </div>
                    </div>
                  </c:if>
                </div>
                <div class="row mb-2">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.Adresse"/> </label>
                      <textarea disabled rows ="2" class="form-control">${notification.importateur.adresse_fr} </textarea>
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.Telephone"/> </label>
                      <input value="${notification.importateur.tel}" disabled type="text" class="form-control">
                    </div>
                  </div>
                </div>
                <div class="row mb-2">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.Fax"/> </label>
                      <input disabled class="form-control" value="${notification.importateur.fax}">
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label> <spring:message code="label.Email"/> </label>
                      <input value="${notification.importateur.mail}" disabled type="text" class="form-control">
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </c:if>
      </div>
    </div>
  </div>
</div>


<script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true,
      heightStyle: "content",
    });
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

            });

  }
</script>
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
