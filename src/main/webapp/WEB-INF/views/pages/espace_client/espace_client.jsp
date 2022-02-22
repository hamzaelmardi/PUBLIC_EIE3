<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<!--Error Section-->
<jsp:include page="../../includes/head.jsp"/>

<section class="error-section">
    <div class="auto-container">
  

        <div class="row clearfix " style="margin-top:162px;" dir="${pageContext.response.locale=='ar'?'rtl':'trl'}">
            <!--Feature Block-->
              
            <div class="featured-block col-lg-6 col-md-6 col-sm-12 ">
                 <div class="inner-box" style=''>
                    <div class="content-box">
                        <div class="icon-box"><img src="/assets/images/arbre2.png" alt=""></div>
                        <div class="content">
                            
                            <h4><a href="/api/ListeAutorisation_card/ZF/d" class="st"><spring:message code="label.Autorisationdesdechets"/></a></h4>
                        </div>
                    </div>
                    <div class="more-link">
                        <a href="/api/ListeAutorisation_card/ZF/d"><span class="flaticon-right-2"></span></a>
                    </div>
                </div>
            </div>

            <!--Feature Block-->
            <div class="featured-block col-lg-6 col-md-6 col-sm-12">
                
                    <div class="inner-box" >

                        <div class="content-box">
                            <div class="icon-box"><img src="/assets/images/Arb1.png" alt=""></div>
                            <div class="content">
                                <h4><a href="/api/ListeEIE_card"  class="st"><spring:message code="label.Evaluationenvironnementale"/></a></h4>
                            </div>
                        </div>
                        <div class="more-link">
                            <a href="/api/ListeEIE_card"><span class="flaticon-right-2"></span></a>
                        </div>
                    </div>
               
            </div>


        </div>
    </div>
</section>



<jsp:include page="../../includes/footer1.jsp"/>
