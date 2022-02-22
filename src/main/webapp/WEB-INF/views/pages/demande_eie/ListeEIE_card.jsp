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
<div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'trl'}">
    <div class="main-panel">
        <div class="row">
            <div class="col-md-1 col-sm-1 col-lg-1"></div>

            <div class="col-md-3 col-sm-3 col-lg-3">

                <div class="card" style="width: 100%;">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-3 text-center">
                                <img src="/assets/images/Arb1.png" alt="">
                            </div>
                            <div class="col-12 text-center ">
                                <h6 class="card-title"><spring:message code="option.Etudedimpactenvironnementale"/></h6>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-md-3 col-sm-12">
                                </div>
                            </div>
                            <a class="btn btn-primary hvr-float-shadow" onclick="checkAut2('${user.st.EIE}','/api/checkEIESelect/EE')"><spring:message code="button.consulter"/></a>
                        </div>




                        <%--<a class="btn btn-primary hvr-float-shadow" href="/api/checkEIESelect"><spring:message code="button.consulter"/></a>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-lg-3">

                <div class="card" style="width:100%;">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-3 text-center">
                                <img src="/assets/images/Arb1.png" alt="">
                            </div>
                            <div class="col-12 text-center ">
                                <h6 class="card-title"><spring:message code="option.Noticedimpact"/></h6>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-3 col-sm-12">
                                <a class="btn btn-primary hvr-float-shadow " onclick="checkAut2('${user.st.NT}','/api/checkEIESelect/NT')"><spring:message code="button.consulter"/> </a>
                            </div>
                        </div>

                        <div  class="img-container"></div>



                        <%--<a class="btn btn-primary hvr-float-shadow" href="/api/checkUserDispatch/IT"><spring:message code="button.consulter"/> </a>--%>
                    </div>
                </div>

            </div>
            <div class="col-md-3 col-sm-3 col-lg-3">

                <div class="card" style="width: 100%;">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-3 text-center">
                                <img src="/assets/images/Arb1.png" alt="">
                            </div>
                            <div class="col-12 text-center ">
                                <h6 class="card-title"><spring:message code="option.Auditenvironnementale"/></h6>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-3 col-sm-12">
                                <a class="btn btn-primary hvr-float-shadow" onclick="checkAut2('${user.st.EA}','/api/checkEIESelect/AE')"><spring:message code="button.consulter"/></a>
                            </div>
                        </div>



                    </div>
                </div>
            </div>


        </div>
    </div>


</div>

<div id="myModal" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body justify-content-center">
                <h4 class="text-center"><spring:message code="label.Voulezvousajoutercettedemandeavotreprofil"/></h4>
                <i class="fa fa-info-circle" style="font-size: 80px; justify-content: center; display: flex; color: #f1c40f"></i>
            </div>
            <div class="modal-footer justify-content-center">
                <div class="btn-group">
                    <button class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span><spring:message code="label.non"/> </button>
                    <a class="btn btn-primary" type="button" href="/Mon_profil#comptes"> <spring:message code="label.oui"/> <span class="fa fa-check"></span></a>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dalog -->
</div>

<script>
    function checkAut2(checked, lien) {
        if (checked == 'on') {
            window.location = lien;
        } else {
            $("#myModal").modal('show');
        }
    }
</script>
<jsp:include page="../../includes/footer1.jsp"/>
