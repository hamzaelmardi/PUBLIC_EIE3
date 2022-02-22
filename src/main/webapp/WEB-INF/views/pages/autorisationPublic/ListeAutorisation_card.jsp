<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<style>
    <!--

    -->
    .card-body {
        text-align: center !important;
    }
</style>

<jsp:include page="../../includes/head.jsp"/>
<div class="container-fluid page-body-wrapper">
    <div class="main-panel">
        <div class="row">
            <div class="col-md-1 col-sm-1 col-lg-1"></div>
            <div  class="col-md-3 col-sm-3 col-lg-3 ">
                <div class="card " style="width:100%;">
                    <div class="card-body ${user.st.IT=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message code="label.Installationdetraitementdesdechets"/></h6>

                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.IT}','/api/checkUserDispatch/IT')"><spring:message
                                code="button.consulter"/> </a>
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 ">


                <div class="card " style="width: 100%;">
                    <div class="card-body ${user.st.ET=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message
                                code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h6>

                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.ET}','/api/checkUserDispatch/ET')"><spring:message
                                code="button.consulter"/></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-lg-3 ">

                <div class="card" style="width: 100%;">
                    <div class="card-body ${user.st.CT=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message code="label.Collectetransportdesdechetsdangereux"/></h6>

                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.CT}','/api/checkUserDispatch/CT')"><spring:message
                                code="button.consulter"/></a>
                    </div>
                </div>
            </div>
            <div class="col-md-1 col-sm-1 col-lg-1"></div>
        </div>


        <div class="row">
            <div class="col-md-1 col-sm-1 col-lg-1"></div>
            <div class="col-md-3 col-sm-3 col-lg-3 ">
                <div class="card" style="width:100%;">
                    <div class="card-body ${user.st.XD=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message code="label.Exportationdesdechetsdangereux"/></h6>

                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.XD}','/api/checkUserDispatch/XD')"><spring:message
                                code="button.consulter"/></a>
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-sm-4 col-lg-4 ">
                <div class="card" style="width:100%;">
                    <div class="card-body ${user.st.ZF=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message code="label.Importationdechetszonefranche"/></h6>

                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.ZF}','/api/checkUserDispatch/ZF')"><spring:message
                                code="button.consulter"/></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-lg-3 ">
                <div class="card" style="width: 100%;">
                    <div class="card-body ${user.st.TR=="on"?"":"bg_disabled"}">
                        <span class="fa fa-recycle" aria-hidden="true" style="font-size:40px"></span>
                        <h6 class="card-title"><spring:message code="label.Transitdesdechets"/></h6>
                        <a class="btn btn-primary hvr-float-shadow" type="button"
                           onclick="checkAut1('${user.st.TR}','/api/checkUserDispatch/TR')"><spring:message
                                code="button.consulter"/></a>
                    </div>
                </div>
            </div>
            <div class="col-md-1 col-sm-1 col-lg-1"></div>
        </div>


    </div>
</div>
<div id="myModal" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body justify-content-center">
                <h4 class="text-center"><spring:message code="label.Voulezvousajoutercettedemandeavotreprofil"/></h4>
                <i class="fa fa-info-circle"
                   style="font-size: 80px; justify-content: center; display: flex; color: #f1c40f"></i>
            </div>
            <div class="modal-footer justify-content-center">
                <div class="btn-group">
                    <button class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span><spring:message code="label.non"/>
                    </button>
                    <a class="btn btn-primary" type="button" href="/Mon_profil#comptes"><spring:message code="label.oui"/>  <span
                            class="fa fa-check"></span></a>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dalog -->
</div>

<script>
    function checkAut1(checked, lien) {
        if (checked == 'on') {
            window.location = lien;
        } else {
            $("#myModal").modal('show');
        }
    }
</script>


<jsp:include page="../../includes/footer1.jsp"/>
