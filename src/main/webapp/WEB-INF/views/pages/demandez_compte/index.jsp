<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
		prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<jsp:include page="../../includes/head.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/register/fonts/material-design-iconic-font/css/material-design-iconic-font.css">
<!-- DATE-PICKER -->
<!-- STYLE CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/register/css/style.css">

<style>
	<c:if test="${pageContext.response.locale!='fr'}">
		@media (min-width: 992px) {
			.tablist {
				position: absolute !important;
				right: 260px !important;
			}

			.my-ul {
				position: absolute !important;
				right: 600px !important;
			}
		}
		@media (max-width: 991px) {
			.tablist{
				position: absolute !important;
				right: 165px !important;
			}
			.my-ul{
				position: absolute !important;
				right: 359px !important;
			}
		}
		@media (max-width: 767px) {
			.tablist {
				position: absolute !important;
				right: -130px !important;
			}
			.my-ul {
				position: absolute !important;
				right: -73px !important;
			}
		}
	</c:if>
	.form-row{
		flex-wrap: inherit !important;
	}
	:focus {
		outline: none !important; }
	.form-controle{
		outline: none !important;
		transition: none !important;
	}
	#Autorisation ,#Evaluation{
		height: 140px !important;
		overflow-y: auto !important;
	}
</style>
<body>
		<div class="wrapper myyWrapper mt-5">
            <form action="" id="wizard" class="shadow border" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        		<!-- SECTION 1 -->
                <h2></h2>
                <section>
                    <div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath}/assets/register/images/plant.jpg" class="img-fluid" alt="">
						</div>
						<div class="form-content" >
							<div class="form-header">
								<h3><spring:message code="label.Inscription"/></h3>
							</div>
							<p>Saisir les données personnelles</p>
							<div class="form-row">
								<div class="form-holder w-100">
								</div>
							</div>
							<div class="mt-3">
								<div class="form-row">
									<div class="form-holder">
										<input type="text" placeholder="إسم الشركة" class="form-controle" dir="rtl">
									</div>
									<div class="form-holder">
										<input type="text" placeholder="<spring:message code="label.Username"/>" class="form-controle" dir="ltr">
									</div>
								</div>
								<div class="form-row mt-2">
									<div class="form-holder w-100">
										<input type="text" placeholder="<spring:message code="label.Telephone"/>" class="form-controle">
									</div>
								</div>
								<div class="form-row mt-2">
									<div class="form-holder w-100">
										<input type="text" placeholder="Address" class="form-controle" dir="ltr">
									</div>
								</div>
								<div class="form-row mt-2">
									<div class="form-holder w-100">
										<input type="text" placeholder="العنوان" class="form-controle" dir="rtl">
									</div>
								</div>
							</div>
						</div>
					</div>
                </section>

				<!-- SECTION 2 -->
                <h2></h2>
                <section>
                    <div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath}/assets/register/images/plant3.jpg" alt="">
						</div>
						<div class="form-content">
							<div class="form-header">
								<h3><spring:message code="label.Inscription"/></h3>
							</div>
							<p>Saisir les données d'authentification</p>
							<div class="form-row">
								<div class="form-holder w-100">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder w-100">
									<input type="text" placeholder="<spring:message code="label.Emaile"/>" class="form-controle">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder w-100">
									<input type="password" placeholder="Mot de passe" class="form-controle">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder w-100">
									<input type="password" placeholder="Confirmer Password" class="form-controle">
								</div>
							</div>

						</div>
					</div>
                </section>

                <!-- SECTION 3 -->
                <h2></h2>
                <section>
                    <div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath}/assets/register/images/plant4.jpg" alt="">
						</div>
						<div class="form-content">
							<div class="form-header">
								<h3><spring:message code="label.Inscription"/></h3>
							</div>
							<p>sélectionner les autorisation que vous travailler</p>
							<div class="infor-supl" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: 20px;">
								<div id="EIE_Autorisation1">
									<div class="row">
										<div class="col-6 m-0 p-0">
											<div class="checkbox-circle border m-0 p-2" style="background-color: #206c45 !important">
												<label style="color:white !important">
													<input type="checkbox"><span style="font-size: 12px !important"><spring:message code="label.EvaluationEnvironnementale"/></span>
													<span class="checkmark"></span>
												</label>
											</div>
											<div id="Autorisation" class="border">
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox"> <spring:message code="label.Importationdechetszonefranche"/>
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Collecte Transporteur
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Installation
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Transit des déchets
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/>
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Export des déchets
														<span class="checkmark"></span>
													</label>
												</div>
											</div>
										</div>
										<div class="col-6 m-0 p-0">
											<div class="checkbox-circle border m-0 p-2" style="background-color: #206c45 !important">
												<label style="color:white !important">
													<input type="checkbox"><span style="font-size: 12px !important"><spring:message code="label.EvaluationEnvironnementale"/></span>
													<span class="checkmark"></span>
												</label>
											</div>
											<div class="border" id="Evaluation">
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Etude d'impact sur l'envirennement
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Notice d'impact sur l'envirennement
														<span class="checkmark"></span>
													</label>
												</div>
												<div class="checkbox-circle m-0 p-0">
													<label>
														<input type="checkbox">  Audit Envirennementale
														<span class="checkmark"></span>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
					</div>
                </section>

				<h2></h2>
				<section>
					<div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath}/assets/register/images/plant5.jpg" alt="">
						</div>
						<div class="form-content">
							<div class="form-header">
								<h3><spring:message code="label.Inscription"/></h3>
							</div>
							<p>Saisir code captcha !</p>
							<div class="form-row">
								<div class="form-holder w-100">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder w-100">
								</div>
							</div>
							<div class="mt-3">
								<div class="capbox">
									<div id="CaptchaDiv"></div>
									<div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
										<spring:message code="label.Tapezlenumero"/><br>
										<input type="hidden" id="txtCaptcha">
										<input type="text" name="captcha" id="Captchay" size="15" ><br>
									</div>
								</div><br/>
								<label id="cap" style=" color: red;"></label>
								<!-- END CAPTCHA -->
								<div class="checkbox-circle mt-24">
									<label>
										<input type="checkbox" checked>  SVP! accepter <a href="#">les terms et les conditions ?</a>
										<span class="checkmark"></span>
									</label>
								</div>
							</div>
						</div>
					</div>
				</section>
            </form>
		</div>
</body>

<script src="${pageContext.request.contextPath}/assets/register/js/jquery-3.3.1.min.js"></script>
<!-- JQUERY STEP -->
<script src="${pageContext.request.contextPath}/assets/register/js/jquery.steps.js"></script>

<script>
	$(function(){
		$("#wizard").steps({
			headerTag: "h2",
			bodyTag: "section",
			transitionEffect: "fade",
			enableAllSteps: true,
			transitionEffectSpeed: 500,
			labels: {
				finish: "<spring:message code="label.enregistrer"/>",
				next: "<spring:message code="button.Suivant"/>",
				previous: "<spring:message code="button.Precedent"/>"
			}
		});
		$('.wizard > .steps li a').click(function(){
			$(this).parent().addClass('checked');
			$(this).parent().prevAll().addClass('checked');
			$(this).parent().nextAll().removeClass('checked');
		});
		// Custome Jquery Step Button
		$('.forward').click(function(){
			$("#wizard").steps('next');
		})
		$('.backward').click(function(){
			$("#wizard").steps('previous');
		})
		// Select Dropdown
		$('html').click(function() {
			$('.select .dropdown').hide();
		});
		$('.select').click(function(event){
			event.stopPropagation();
		});
		$('.select .select-control').click(function(){
			$(this).parent().next().toggle();
		})
		$('.select .dropdown li').click(function(){
			$(this).parent().toggle();
			var text = $(this).attr('rel');
			$(this).parent().prev().find('div').text(text);
		})
	})
</script>

<jsp:include page="../../includes/footer1.jsp"/>
