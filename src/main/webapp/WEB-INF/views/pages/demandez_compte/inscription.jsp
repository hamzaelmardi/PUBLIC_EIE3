<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
		prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<jsp:include page="../../includes/head.jsp"/>
<style>

	#raison_fr-error{
		position: absolute;
		bottom: -35px;
	}

	.txt_area_resize_no{
		margin-left:43px;
		resize: none;
	}
	.position_icon_ar{
		position: absolute;
		left: 0	;
		height: 38px;
		z-index: 1;
	}
	.position_icon_fr{
		position: absolute;
		right: 0	;
		height: 38px;
		z-index: 1;
	}
	.position_icon_ar2{
		position: absolute;
		left: 0	;
		height: 80px;
		z-index: 1;
	}

	.error{
		display:block !important;
	}
	.tooltip_ .field_icon{
		background: dodgerblue;
		color: white;
		padding-top: 0.7rem !important;
		min-width: 50px;
		text-align: center;
	}
	input,textarea{
		width:85% !important;
	}
	.input-container {
		display: -ms-flexbox; /* IE10 */
		display: flex;
		width: 100%;
		margin-bottom: 15px;
	}
	input[type="checkbox"] {
		position: ${pageContext.response.locale!="ar"?'relative':'absolute'} !important;
		display: inline-block;
	}
	#message {
		display:none;
		color: #000;
		position: relative;
		padding: 10px;
	}
	#message p {
		font-family:"Open Sans", sans-serif;
		font-size: 14px;
		margin-left: 25px;
	}
	/* Add a green text color and a checkmark when the requirements are right */
	.valide {
		color: #50D2C2;
	}
	.valide:before {
		position: relative;
		left: -12px;
		font-family: "Font Awesome 5 Free";
		content: "\f058";
		margin-left:${pageContext.response.locale!='fr'?'20px':'0'};
	}
	/* Add a red text color and an "x" icon when the requirements are wrong */
	.invalide {
		color: #ee0000;
	}
	.invalide:before {
		position: relative;
		left: -12px;
		font-family: "Font Awesome 5 Free";
		content: "\f057";
		margin-left:${pageContext.response.locale!='fr'?'20px':'0'};
	}
	#accordion .panel-title a::before, #accordion .panel-title a.collapsed::before {
	${pageContext.response.locale=='ar'?'left':'right'}: 40px !important;
	}
	#EIE_Autorisation2 ul {
		list-style: none !important;
		margin: 0 !important;
		background: #ffffff !important;
		padding: 0 !important;
	}
	#EIE_Autorisation2 ul li {
		position: relative !important;
	}
	#EIE_Autorisation2 input {
		width: 1.25rem !important;
		height: 1.25rem !important;
		border: 1px solid hsl(0, 0%, 85%) !important;
		border-radius: 1px !important;
		vertical-align: sub !important;
		position: absolute !important;
		transform: translateY(-50%) !important;
		outline: none !important;
		top: 26px !important;
	}
	#EIE_Autorisation2 input:checked {
		background-color: hsl(0, 0%, 40%) !important;
		border-color: hsl(0, 0%, 40%) !important
	}
	#EIE_Autorisation2 input label {
		text-decoration: line-through !important;
		color: hsl(0, 0%, 70% ) !important;
		font-weight: 600 !important;
		background-color: hsl(0, 0%, 97%) !important;
	}
	#EIE_Autorisation2 input:focus,
	#EIE_Autorisation2 input:hover {
		box-shadow: 0 0 0 3px hsl(0, 0%, 85%) !important;
		border-color: hsl(0, 0%, 40%) !important;
	}
	#EIE_Autorisation2 input:after {
		content: "" !important;
		width: 100% !important;
		height: 100% !important;
		position: absolute !important;
		left: 0 !important;
		top: 0 !important;
		background-image: url("data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzMwMHB4JyB3aWR0aD0nMzAwcHgnICBmaWxsPSIjZmZmZmZmIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCIgdmVyc2lvbj0iMS4xIiB4PSIwcHgiIHk9IjBweCI+PHRpdGxlPmljb25fYnlfUG9zaGx5YWtvdjEwPC90aXRsZT48ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz48ZyBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48ZyBmaWxsPSIjZmZmZmZmIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNi4wMDAwMDAsIDI2LjAwMDAwMCkiPjxwYXRoIGQ9Ik0xNy45OTk5ODc4LDMyLjQgTDEwLjk5OTk4NzgsMjUuNCBDMTAuMjI2Nzg5MSwyNC42MjY4MDE0IDguOTczMTg2NDQsMjQuNjI2ODAxNCA4LjE5OTk4Nzc5LDI1LjQgTDguMTk5OTg3NzksMjUuNCBDNy40MjY3ODkxNCwyNi4xNzMxOTg2IDcuNDI2Nzg5MTQsMjcuNDI2ODAxNCA4LjE5OTk4Nzc5LDI4LjIgTDE2LjU4NTc3NDIsMzYuNTg1Nzg2NCBDMTcuMzY2ODIyOCwzNy4zNjY4MzUgMTguNjMzMTUyOCwzNy4zNjY4MzUgMTkuNDE0MjAxNCwzNi41ODU3ODY0IEw0MC41OTk5ODc4LDE1LjQgQzQxLjM3MzE4NjQsMTQuNjI2ODAxNCA0MS4zNzMxODY0LDEzLjM3MzE5ODYgNDAuNTk5OTg3OCwxMi42IEw0MC41OTk5ODc4LDEyLjYgQzM5LjgyNjc4OTEsMTEuODI2ODAxNCAzOC41NzMxODY0LDExLjgyNjgwMTQgMzcuNzk5OTg3OCwxMi42IEwxNy45OTk5ODc4LDMyLjQgWiI+PC9wYXRoPjwvZz48L2c+PC9nPjwvc3ZnPg==");
		background-size: 40px !important;
		background-repeat: no-repeat !important;
		background-position: center !important;
	}
	#EIE_Autorisation2 input:focus,
	#EIE_Autorisation2 input:hover {
		box-shadow: 0 0 0 3px hsl(0, 0%, 92%) !important;
		border-color: hsl(0, 0%, 55%) !important;
	}
	#EIE_Autorisation2 label {
		padding: 0.75rem ${pageContext.response.locale=='ar'?'3rem':'1rem'} 0.75rem calc(1.2rem * 2.25) !important;
		display: inline-block !important;
		font-size: 13px !important;
		width: 100% !important;
		user-select: none !important;
		border-bottom: 2px solid hsl(0, 0%, 93%) !important;
		cursor: pointer !important;
	}
	#EIE_Autorisation2 label:hover {
		border-bottom-color: hsl(0, 0%, 68%) !important;
	}

	.fa-user-lock{
		position: absolute;
		top: 13px;
		color: white;
		font-size: 19px;
		${pageContext.response.locale=='ar'?'margin-right: 9px':'margin-left: 54px'};
	}

	@media (max-width:665px){
		.fa-user-lock{
			${pageContext.response.locale=='ar'?'margin-right: 9px':'margin-left: -10px'};
		}
		strong{
			display: none !important;
		}
	}

	.inscription .fieldlabels {
		color: gray;
		text-align: left;
		margin-top: 20px;
	}
	#petitionnaire label, #societe label{
		float: ${pageContext.response.locale=='ar'?'right':'left'};
	}

</style>
<script>
	$(function(){
		$('#accordion a').eq(0).trigger('click');
		$(".icon.error").empty();
	});
</script>
<div class="container-fluid inscription" style="margin-top: 13rem">
	<div class="row justify-content-center">
		<div class="col-sm-12 col-md-11 col-lg-8 text-center p-5 shadow card" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
			<div class="card">
				<h4 class="text-left ml-2 ${pageContext.response.locale=='ar'?'text-right':'text-left'}" style="color: black"><i class="fa fa-user-plus mx-2"></i><spring:message code="label.Inscription"/></h4>
				<hr>
				<div id="msforme">
					<!-- progressbar -->
					<c:if test="${pageContext.response.locale=='ar'}">
						<ul id="progressbar">
							<li id="confirm" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.RecapN"/>"></i><strong><spring:message code="label.RecapN"/></strong></li>
							<li id="payment" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.choixdesactes"/>"></i><strong><spring:message code="label.choixdesactes"/></strong></li>
							<li id="personal" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.Authentification"/>"><i class="fa fa-user-lock" style="margin-right: 2.7rem"></i><strong><spring:message code="label.Authentification"/></strong></li>
							<li class="active" id="account" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.petitionnaire"/>"><strong><spring:message code="label.petitionnaire"/></strong></li>
						</ul>
					</c:if>
					<c:if test="${pageContext.response.locale!='ar'}">
						<ul id="progressbar">
							<li class="active" id="account" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.petitionnaire"/>"><strong><spring:message code="label.petitionnaire"/></strong></li>
							<li id="personal" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.Authentification"/>"><i class="fa fa-user-lock" style="margin-right: 2.7rem"></i><strong><spring:message code="label.Authentification"/></strong></li>
							<li id="payment" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.choixdesactes"/>"></i><strong><spring:message code="label.choixdesactes"/></strong></li>
							<li id="confirm" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.RecapN"/>"></i><strong><spring:message code="label.RecapN"/></strong></li>
						</ul>
					</c:if>
					<div class="progress">
						<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<br> <!-- fieldsets -->
					<fieldset>
						<form id="petitionnaire">
							<div class="form-card">
								<div class="row">
									<div class="col-12">
										<h2 class="fs-title ${pageContext.response.locale=='ar'?'text-right':'text-left'}"><spring:message code="label.informationssurlepetitionnaire"/> :</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels">Raison Sociale <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon5"><i class="far fa-building"></i></span>
												</div>
											</c:if>
											<input   type="text" name="raison_fr" placeholder="<spring:message code="label.RaisonS"/>" value="" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale_fr"></p>
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-prepend position_icon_ar">
													<span class="input-group-text" id="basic-addon5"><i class="far fa-building"></i></span>
												</div>
											</c:if>
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels float-right"><small class="text-danger">*</small> إسم الشركة  </label>
										<div class="input-group mb-3">
											<input  dir="rtl" type="text" name="raison_ar" placeholder="إسم الشركة " value="" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale"></p>
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon6"><i class="far fa-building"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.NumeroRC"/>  <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon9"><i class="fas fa-sort-numeric-up-alt"></i></span>
											</div>
											<input  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="text" name="numRc" value="" placeholder="<spring:message code="label.NumeroRC"/>" class="form-control"  onkeyup="ses_rc()"><p id="in_RC"></p>
											<div class="input-group-append tooltip_" style="${pageContext.response.locale=='ar'?'left:0;':'right:0;'}">
												<i  class="fa fa-info-circle field_icon m-0" style="background-color: #5d6974;"></i>
												<div class="tooltiptext input-group-text"><img src="../../assets/css/images/RC.jpg" width="100%" style="width: 320px !important;max-width: unset;position: absolute;left: 0" /></div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.tel"/> <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<input style="width: 100% !important;direction: ltr;" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="tel" name="tel" value="" class="form-control"/>
											<div class="input-group-prepend position_icon_fr">
												<span class="input-group-text" id="basic-addon4"><i class="fa fa-phone"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels">Adresse <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon7"><i class="fas fa-map-marked-alt"></i></span>
												</div>
											</c:if>
											<textarea  name="adresse_fr" placeholder="Adresse" class="form-control ${pageContext.response.locale=='ar'?'txt_area_resize_no':''} "  onkeyup="ses_ad()"></textarea><p id="in_Adresse_fr"></p>
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-prepend position_icon_ar2">
													<span class="input-group-text" id="basic-addon7"><i class="fas fa-map-marked-alt"></i></span>
												</div>
											</c:if>
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels float-right"><small class="text-danger">*</small>العنوان   </label>
										<div class="input-group mb-3">
											<textarea dir="rtl" name="adresse_ar" placeholder="العنوان" class="form-control"  onkeyup="ses_ad()"></textarea><p id="in_Adresse"></p>
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon8"><i class="fas fa-map-marked-alt"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.Representant"/>  <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend" >
													<span class="input-group-text" id="basic-addon"><i class="fa fa-user"></i></span>
												</div>
											</c:if>

												<input type="hidden" name="societesId" id="compteId" value="0">
												<input required id="username"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"  type="text" name="name_fr"  value="" placeholder="<spring:message code="label.Username"/>" class="form-control">
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-prepend position_icon_ar" >
													<span class="input-group-text" id="basic-addon"><i class="fa fa-user"></i></span>
												</div>
											</c:if>
												<input type="hidden" name="etat" id="etat" >
											</div>
									</div>
								</div>
							</div>
							<button type="button"  name="next" class="next action-button btn"><spring:message code="button.Suivant"/> <i class="ml-2 fa fa-angle-${pageContext.response.locale=='ar'?'left':'right'}"></i></button>
						</form>
					</fieldset>
					<fieldset>
						<form id="societe">
							<div class="form-card">
								<div class="row">
									<div class="col-12">
										<h2 class="fs-title ${pageContext.response.locale=='ar'?'text-right':'text-left'}"><spring:message code="label.infosurAuthentification"/> :</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.Email"/>  <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend" >
													<span class="input-group-text" id="basic-addon3"><i class="fa fa-envelope"></i></span>
												</div>
											</c:if>

											<input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="email" autocomplete="off"
												   name="email" value=""
												   placeholder="<spring:message code="label.Emaile"/>" onblur="checkmail1()"
												   class="form-control" id="emaily"/><p id="in_email"></p>
											<label id="chekmail" style=" color: red;"></label>
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-append position_icon_ar" >
													<span class="input-group-text" id="basic-addon3"><i class="fa fa-envelope"></i></span>
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.Motdepasse"/> <small class="text-danger">*</small></label>
										<div class="input-group mb-3">
											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon1"><i toggle="#password-field1" class="fa fa-fw fa-eye field_icon toggle-password"></i></span>
												</div>
											</c:if>
											<input required dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="password" value="" placeholder="<spring:message code="label.Motdepasse"/>" name="password" class="form-control" id="psw">
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-append position_icon_ar">
													<span class="input-group-text" id="basic-addon1"><i toggle="#password-field1" class="fa fa-fw fa-eye field_icon toggle-password"></i></span>
												</div>
											</c:if>
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<label class="fieldlabels"><spring:message code="label.ConfirmerMotdepasse"/> <small class="text-danger">*</small></label>
										<div class="input-group mb-3">

											<c:if test="${pageContext.response.locale!='ar'}">
												<div class="input-group-prepend" >
													<span class="input-group-text" id="basic-addon2"><i toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password1"></i></span>
												</div>
											</c:if>
											<input onchange="validationmotpasse()"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="password" value="" placeholder="<spring:message code="label.ConfirmerMotdepasse"/>" name="password11" class="form-control" id="psw11">
											<c:if test="${pageContext.response.locale=='ar'}">
												<div class="input-group-append position_icon_ar">
													<span class="input-group-text" id="basic-addon2"><i toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password1"></i></span>
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<div class="row  m-0 p-0 ${pageContext.response.locale=='ar'?'text-right':'text-left'}">
									<div id="message" class="col-xl-6 col-lg-12">
										<div class="row">
											<div class="col-12">
												<span style="font-size:8pt"><spring:message code="label.Mot8M"/>"</span>
											</div>
										</div>
										<div class="row mt-2">
											<div class="col-lg-6 m-0 p-0 col-md-12">
												<p id="letter" class="invalide"><spring:message code="label.lettreminuscule"/></p>
											</div>
											<div class="col-lg-6 m-0 p-0 col-md-12">
												<p id="capital" class="invalide"><spring:message code="label.lettremajuscule"/></p>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 m-0 p-0 col-md-12">
												<p id="number" class="invalide"><spring:message code="label.unnumber"/></p>
											</div>
											<div class="col-lg-6 m-0 p-0 col-md-12">
												<p id="length" class="invalide"><spring:message code="label.huitcaractere"/></p>
											</div>
										</div>
										<div class="row">
											<div class="col-12 m-0 p-0">
												<p id="symbole" class="invalide"><spring:message code="label.Symbole"/></p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${pageContext.response.locale=='ar'}">
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-right"></i> <spring:message code="button.Precedent"/></button>
								<button type="button" name="next" class="next action-button mx-2" ><spring:message code="button.Suivant"/> <i class="ml-2 fa fa-angle-left"></i></button>
							</c:if>
							<c:if test="${pageContext.response.locale!='ar'}">
								<button type="button" name="next" class="next action-button" ><spring:message code="button.Suivant"/> <i class="ml-2 fa fa-angle-right"></i></button>
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-left"></i> <spring:message code="button.Precedent"/></button>
							</c:if>
						</form>
					</fieldset>
					<fieldset>
						<form id="administratif">
							<div class="form-card">
								<div class="row">
									<div class="col-12">
										<h2 class="fs-title ${pageContext.response.locale=='ar'?'text-right':'text-left'}"><spring:message code="label.choixdesactes"/> :</h2>
									</div>
								</div>
								<div class="form-content">
									<div class="infor-supl" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: 20px;">
											<div id="EIE_Autorisation1">
												<div class="row">
													<div class="col-md-6 col-sm-12 m-0 p-0">
														<div class="checkbox-list">
															<div class="checkbox border" style="background-color: #206c45">
																<input type="checkbox" name="environnement" type="checkbox" data-name="EIE1"  id="EIE">
																<label for="EIE"><spring:message code="label.EvaluationEnvironnementale"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox"  class="custom-control-input eie" name="eie" id="EIE_1">
																<label for="EIE_1"><spring:message code="label.etudeimpactenvironnemental"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="custom-control-input eie" name="nt" id="NI_1">
																<label for="NI_1"><spring:message code="label.Noticedimpact"/></label>
															</div>
															<div class="checkbox border-bottom">
																<input type="checkbox"  class="custom-control-input eie" name="ea" id="AE_1" >
																<label for="AE_1"><spring:message code="label.Auditenvironnementale"/></label>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-sm-12 m-0 p-0">
														<div style="height: 370px !important;overflow-y: scroll">
															<div class="checkbox-list">
															<div class="checkbox border" style="background-color: #206c45">
																<input type="checkbox" name="autorisation" type="checkbox" data-name="Autorisation1"  id="AUT">
																<label for="AUT"><spring:message code="label.Autorisationdesdechets"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="aut" name="it" id="IT_1">
																<label for="IT_1"><spring:message code="label.Installationdetraitementdesdechets"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="aut" name="ct" id="CT_1">
																<label for="CT_1"><spring:message code="label.Collectetransportdesdechetsdangereux"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="aut" name="xd" id="XD_1">
																<label for="XD_1"><spring:message code="label.Exportationdesdechetsdangereux"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="aut" name="tr" id="TR_1">
																<label for="TR_1"><spring:message code="label.Transitdesdechets"/></label>
															</div>
															<div class="checkbox">
																<input type="checkbox" class="aut" name="zf" id="ZF_1">
																<label for="ZF_1"><spring:message code="label.Importationdechetszonefranche"/></label>
															</div>
															<div class="checkbox border-bottom">
																<input type="checkbox" class="aut" name="et" id="ET_1">
																<label for="ET_1"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></label>
															</div>
														</div>
														</div>
													</div>
												</div>

											</div>
										</div>
								</div>
							</div>
							<c:if test="${pageContext.response.locale=='ar'}">
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-right"></i> <spring:message code="button.Precedent"/></button>
								<button type="button" name="next" class="next action-button mx-2" ><spring:message code="button.Suivant"/> <i class="ml-2 fa fa-angle-left"></i></button>
							</c:if>
							<c:if test="${pageContext.response.locale!='ar'}">
								<button type="button" name="next" class="next action-button" ><spring:message code="button.Suivant"/> <i class="ml-2 fa fa-angle-right"></i></button>
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-left"></i> <spring:message code="button.Precedent"/></button>
							</c:if>
						</form>
					</fieldset>
					<fieldset>
						<form id="recap">
							<div class="form-card">
									<div class="row">
										<div class="col-12">
											<h2 class="fs-title ${pageContext.response.locale=='ar'?'text-right':'text-left'}"><spring:message code="label.RecapN"/> :</h2>
										</div>
									</div> <br><br>
									<div class="container" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
										<div class="row justify-content-center">
											<div class="col-md-12">
												<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingOne">
															<h4 class="panel-title">
																<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
																	<spring:message code="label.informationssurlepetitionnaire"/>
																</a>
															</h4>
														</div>
														<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
															<div class="panel-body p-2">
																<div class="row">
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels">Raison Sociale : </label>
																			<input type="text"  id="RaisonFr"  disabled class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels">اسم الشركة :  </label>
																			<input type="text" id="RaisonAr" disabled class="form-control" dir="rtl"/>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels">Adresse : </label>
																			<input type="text" id="AdresseFr" disabled class="form-control"/>
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels">العنوان : </label>
																			<input type="text" id="AdresseAr" disabled class="form-control" dir="rtl"/>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels"><spring:message code="label.Representant"/> : </label>
																			<input type="text" id="Representant" disabled class="form-control"/>
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels"><spring:message code="label.Tel"/> : </label>
																			<input type="text"  disabled id="Telephone" class="form-control"/>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels"><spring:message code="label.NumeroRC"/> : </label>
																			<input type="text" id="NumeroRc"  disabled  placeholder="" class="form-control"/>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingTwo">
															<h4 class="panel-title">
																<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
																	<spring:message code="label.infosurAuthentification"/>
																</a>
															</h4>
														</div>
														<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
															<div class="panel-body p-2">
																<div class="row">
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels"><spring:message code="label.Email"/> :</label>
																			<input type="email"  name="" disabled id="mail" class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-12">
																		<div class="form-group">
																			<label class="fieldlabels"><spring:message code="label.Password"/> :</label>
																			<input type="text" disabled id="motpasse" class="form-control"/>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingThree">
															<h4 class="panel-title">
																<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
																	<spring:message code="label.choixdesactes"/>
																</a>
															</h4>
														</div>
														<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
															<div class="panel-body">
																<div class="form-content">
																	<div class="infor-supl" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: 20px;">
																		<div id="EIE_Autorisation2">
																			<div class="row justify-content-center">
																				<div class="col-md-5 col-sm-12 m-0 p-0">
																					<ul>
																						<li>
																							<input type="checkbox" id="ZF_2" name="cb1" disabled>
																							<label for="ZF_2"><spring:message code="label.Importationdechetszonefranche"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="CT_2" name="cb2" disabled>
																							<label for="CT_2"><spring:message code="label.Collectetransportdesdechetsdangereux"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="IT_2" name="cb3" disabled>
																							<label for="IT_2"><spring:message code="label.Installationdetraitementdesdechets"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="XD_2" name="cb3" disabled>
																							<label for="XD_2"><spring:message code="label.Exportationdesdechetsdangereux"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="TR_2" name="cb3" disabled>
																							<label for="TR_2"><spring:message code="label.Transitdesdechets"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="ET_2" name="cb3" disabled>
																							<label for="ET_2"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></label>
																						</li>
																					</ul>
																				</div>
																				<div class="col-md-2"></div>
																				<div class="col-md-5 col-sm-12 m-0 p-0">
																					<ul>
																						<li>
																							<input type="checkbox" id="EIE_2" name="cb1" disabled>
																							<label for="EIE_2"><spring:message code="label.EtudedimpactEnvironnementale"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="NI_2" name="cb2" disabled>
																							<label for="NI_2"><spring:message code="label.Noticedimpactsurlenvironnement"/></label>
																						</li>
																						<li>
																							<input type="checkbox" id="AE_2" name="cb3" disabled>
																							<label for="AE_2"><spring:message code="label.Auditenvironnementale"/></label>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<!-- Strart CAPTCHA -->
							<div class="row m-0 pl-5 pr-5 mt-3">
								<div class="capbox">
									<div id="CaptchaDiv"></div>
									<div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
										<spring:message code="label.Tapezlenumero"/><br>
										<input type="hidden" id="txtCaptcha">
										<input type="text" name="captcha" id="Captchay" size="15" onchange="auto_check(this)"><br>
									</div>
								</div><br/>
								<label id="cap" style=" color: red;"></label>
								<br><br>
								<div class="col-12" >
									<span id="msg_error"></span>
								</div>
							</div>
							<!-- END CAPTCHA -->
							<div class="row m-0 pl-5 pr-5 mt-3" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
								<div class="col-md-12 m-0 p-0 ">
									<div class="custom-control m-0 p-0 custom-checkbox">
										<input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="checkbox" class="custom-control-input" name="customChec" id="customCheck1" onchange="cacher_afficher_message(this)">
										<label class="custom-control-label" for="customCheck1"><spring:message code="label.Jailuetjaccepte"/></label>
										<p style="font-size: 10px"> <spring:message code="label.lesconditionsgeneralesdutilisation"/></p>
									</div>
									<label id="capcustom" style=" color: red;"></label>
								</div>
							</div>
							<c:if test="${pageContext.response.locale=='ar'}">
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-right"></i> <spring:message code="button.Precedent"/></button>
								<button type="button" name="next" onclick="verifierValidation(this)" class="action-button mx-2" style="width:150px">تسجيل  <i class="ml-2 fa fa-save"></i></button>
							</c:if>
							<c:if test="${pageContext.response.locale!='ar'}">
								<button type="button" name="next" onclick="verifierValidation(this)" class="action-button" style="width:150px">Enregistrer <i class="ml-2 fa fa-save"></i></button>
								<button type="button" name="previous" class="previous action-button-previous" style="width:140px"><i class="mr-2 fa fa-angle-left"></i> <spring:message code="button.Precedent"/></button>
							</c:if>
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../includes/footer1.jsp"/>
<script src="${pageContext.request.contextPath}/assets/register/js/monJs.js"></script>

<script>
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
			if (o[this.name]) {
			if (!o[this.name].push) {
			o[this.name] = [o[this.name]];
		}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
		});
			return o;
		};

		function validateemail($email) {
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		return emailReg.test( $email );
	}

		function validatetel($tel) {
		var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
		return filter.test( $tel );
	}

		function add_inscription(val){

			if(!$("#customCheck1").is(":checked")){

				return false;
			}

		event.preventDefault();
		//$(val).prop("disabled",true);

		if ($('#EIE').is(':checked')) {
		var etat=$("#etat").val("1");
	}
		if ($('#AUT').is(':checked')) {
		var etat=$("#etat").val("2");
	}
		if ($('#EIE').is(':checked') && $('#AUT').is(':checked')) {
		var etat=$("#etat").val("3");
	}
		var se = $("#petitionnaire,#societe,#administratif").serializeObject();
		var id=$("#compteId").val();
		var password=$("#psw").val();

		$(val).prop("disabled", "true");
		$('#loader_modal').modal('show');

		$.ajax({
				type: "POST",
				url :"/addSociete/"+id,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(se),
				success : function(response) {
				console.log(response)
				$(val).prop("disabled", "false");
				$('#loader_modal').modal('hide');
					PrintElem(response.compteId,password);
					Swal.fire({
						title: '<spring:message code="label.Message"/>',
						<c:if test="${pageContext.response.locale=='ar'}">
							text: response.email+" : <spring:message code="label.Votreidentifiantest"/> ",
						</c:if>
						<c:if test="${pageContext.response.locale!='ar'}">
							text: "<spring:message code="label.Votreidentifiantest"/>: "+response.email,
						</c:if>
						icon: 'success',
						showCancelButton: false,
						confirmButtonColor: '#47e793',
						confirmButtonText: '<spring:message code="label.OK"/>'
					}).then((result) => {
						if (result.isConfirmed) {
							window.location="/index";
						}
					})
				},
		error : function() {
			$(val).prop("disabled", "false");
			$('#loader_modal').modal('hide');
		}
	});
	}

		function PrintElem(id,password) {
			window.location.href ="/generateRecapInscription/" + id+"/"+password
		}

		$("#AUT").click(function () {
			$(".aut").prop('checked', $(this).prop('checked'));
		});
		$("#EIE").click(function () {
			$(".eie").prop('checked', $(this).prop('checked'));
		})

		$(document).on('click', '.toggle-password', function() {

		$(this).toggleClass("fa-eye fa-eye-slash");

		var input = $("#psw");
		input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
	});
		$(document).on('click', '.toggle-password1', function() {

		$(this).toggleClass("fa-eye fa-eye-slash");

		var input = $("#psw11");
		input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
	});


</script>
<script>

	function validationmotpasse() {
		var password = $("input[name=password]").val();
		var password11 = $("input[name=password11]").val();
		if($.trim(password11) =="" || $.trim(password11) !=$.trim(password))
		{
			$("#passcom").text("<spring:message code="label.Vosmotsdepassedoiventcorrespondre"/>");
			return false;
		}
		else
		{
			$("#passcom").text("");
			return true;

		}
	}

	function update(){
		var checkbox = $(this);
		var name = checkbox.data('name');
		if( checkbox.is(':checked') ) {
			$( '#' + name ).show();
		} else {
			$( '#' + name ).hide();
		}
	}

	//just setup change and each to use the same function
	$('.custom-control-input').change(update).each(update);

	$(function() {
		$("#petitionnaire").validate({

			rules: {
				name_fr: {
					required: true
				},
				tel : {
					required: true,
				},
				raison_fr: {
					required: true
				},
				numRc: {
					required: true,
				},
				adresse_fr: {
					required: true,
				},

			},
			messages: {
				raison_fr: "<spring:message code="label.champsObligatoire"/>",
				numRc: "<spring:message code="label.champsObligatoire"/>",
				adresse_fr: "<spring:message code="label.champsObligatoire"/>",
				name_fr: "<spring:message code="label.Silvousplaitmettezunusernamevalide"/>",
				tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",

			},
			submitHandler: function(form) {
				form.submit();
			}
		});
	});

	$(function() {
		$("#societe").validate({

			rules: {
				email: {
					required: true,
					email: true,
				},
				password: {
					required: true,
				},
				password11: {
					required: true,
					minlength: 8,
					equalTo: '#psw'
				},

			},
			messages: {
				password11: {
					required: "<spring:message code="label.Veuillezfournirunmotdepasse"/>",
					minlength: "<spring:message code="label.Votremotdepassedoitconteniraumoinscaracteres"/>",
					equalTo:"<spring:message code="label.mememotpasse"/>"
				},
				email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
				password: "<spring:message code="label.champsObligatoire"/>",

			},
			submitHandler: function(form) {
				form.submit();
			}
		});
	});

	$(function() {
		$("#administratif").validate({

			rules: {
				captcha : {
                     required: true,
                     number : true,
                     minlength: 5,
                     maxlength: 5,
                     equalTo : '#txtCaptcha'
                 },
				customChec : {
					required: true,
				},

			},
			messages: {
				captcha: "<spring:message code="label.Silvousplaitmettezunnombrevalide"/>",
				customChec: "<spring:message code="label.conditions"/>",
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
	});


</script>
<script>
	var myInput = document.getElementById ("psw");
	var letter = document.getElementById ("letter");
	var capital = document.getElementById ("capital");
	var number = document.getElementById ("number");
	var length = document.getElementById ("length");
	var symbole = document.getElementById ("symbole");

	// When the user starts to type something inside the password field
	myInput.onkeyup = function () {
		// Validate lowercase letters
		var lowerCaseLetters = /[a-z]/g;
		if (myInput.value.match (lowerCaseLetters)) {
			letter.classList.remove ("invalide");
			letter.classList.add ("valide");
		} else {
			letter.classList.remove ("valide");
			letter.classList.add ("invalide");
		}

		// Validate capital letters
		var upperCaseLetters = /[A-Z]/g;
		if (myInput.value.match (upperCaseLetters)) {
			capital.classList.remove ("invalide");
			capital.classList.add ("valide");
		} else {
			capital.classList.remove ("valide");
			capital.classList.add ("invalide");
		}

		// Validate numbers
		var numbers = /[0-9]/g;
		if (myInput.value.match (numbers)) {
			number.classList.remove ("invalide");
			number.classList.add ("valide");
		} else {
			number.classList.remove ("valide");
			number.classList.add ("invalide");
		}

		var sym = /[!@#$%^&*+=._-]/g;
		if (myInput.value.match(sym)) {
			symbole.classList.remove ("invalide");
			symbole.classList.add ("valide");
		} else {
			symbole.classList.remove ("valide");
			symbole.classList.add ("invalide");
		}

		// Validate length
		if (myInput.value.length >= 8) {
			length.classList.remove ("invalide");
			length.classList.add ("valide");
		} else {
			length.classList.remove ("valide");
			length.classList.add ("invalide");
		}

		if(myInput.value.match (lowerCaseLetters) && myInput.value.match (upperCaseLetters) && myInput.value.match (numbers) && myInput.value.match(sym) && myInput.value.length >= 8){
			document.getElementById ("message").style.display = "none";
		}
		else{
			document.getElementById ("message").style.display = "block";
		}
	}
	function affecter_label_input(id_champs,msg,affecter){
		if($("#"+id_champs+"-error").length<=0){
			var lbl = $('<label style="display: block !important;font-size: 11px" class="error" />').attr({
				id: id_champs+'-error',
				for:id_champs
			}).appendTo($(affecter).parent()).text(msg);
		}
	}

	function verifierValidation(val){

		var valide = true;
		var checkbox = $("#customCheck1").is(":checked");

		if(!checkbox){
			affecter_label_input("customCheck1","<spring:message code="label.conditions"/>","#customCheck1")
			valide =false;
		}else{
			if($("#customCheck1-error").length>0){
				$("#customCheck1-error").remove();
			}
		}
		var Captchay1 = $("#Captchay").val();
		var Captchay2 = $("#txtCaptcha").val();

		if(Captchay1!=Captchay2){
			affecter_label_input("Captchay","<spring:message code="label.Silvousplaitmettezunnombrevalide"/>",".capbox")
			valide =false;
		}

		if(valide){
			add_inscription(val);
		}else{
			return false;
		}

	}

	function cacher_afficher_message(val){
		var id = $(val).prop("id")
		id+="-error"
		if($("#"+id).length>0){
			if($(val).is(":checked")){
				$("#"+id).remove();
			}
		}else{
			if(!$(val).is(":checked")){
				affecter_label_input("customCheck1","<spring:message code="label.conditions"/>","#customCheck1")
			}
		}
	}

	function auto_check(val){
		var code1 = $(val).val();
		var code2 = $("#txtCaptcha").val();

		var id = $(val).prop("id")
		id+="-error"

		if($("#"+id).length>0){
			if(code1==code2){
				$("#"+id).remove();
			}
		}

	}

</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
