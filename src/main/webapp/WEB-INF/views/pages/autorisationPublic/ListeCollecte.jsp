<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>



<jsp:include page="../../includes/head.jsp" />

<jsp:include page="card.jsp" />

<style>
.modal-dialog.modal-xl {
	max-width: initial;
}
</style>


<section class="services-section" style="background-color: white">
	<div class="col-lg-12 grid-margin stretch-card cardstatistic"
		id="pagereload">

		<c:choose>
			<c:when test="${requestScope['javax.servlet.forward.request_uri']=='/api/getListCollectTrans'}">
				<c:set var="p_page" value="Collecte/transport des déchets dangereux"/>
			</c:when>
			<c:otherwise>
				<c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
			</c:otherwise>
		</c:choose>

		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/></a></li>
				<li class="breadcrumb-item active" aria-current="page">${p_page}</li>
			</ol>
		</nav>
		<a href="" class="btn "
			style="background-color: #336c4e;margin-bottom:12px;color:white;"><spring:message
				code="label.ListedesCollectes" /></a> <a href="/api/addCollectTrans/0/N"
			class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;"><spring:message
				code="label.Nouelledemande" /></a>
		<%--<a href="/api/addDemandNotification/0" class="btn " style="background-color: #336c4e;margin-bottom:12px;color:white;">Nouvelle  demande </a>--%>

		<table id="tab2"
			class="table table-striped hover compact table-bordered text-md-nowrap">
			<thead class="thead-bleu">
				<tr>
<th class=""><spring:message code="label.Ndemande"/></th>

					<th class=""><spring:message code="label.Raisonsociale" /></th>
					<th class="">IF</th>
					<th class=""><spring:message code="label.Etatdelademande" /></th>
					<th class=""><spring:message code="label.Adresse" /></th>
					<th class=""><spring:message code="label.Telephone" /></th>
					<th class=""><spring:message code="label.Fax" /></th>
					<th class=""><spring:message code="label.Email" /></th>
					<th class=""><spring:message code="label.code" /></th>
					<th class=""><spring:message code="label.typededechet" /></th>
					<th class=""><spring:message code="label.Typedevehicules" /></th>
					<th class=""><spring:message code="label.typedeconteneurs" />
					</th>
					<th class=""><spring:message code="label.NombredeVehicule" />
					</th>
					<th class=""><spring:message code="label.Nombredeconteneurs" />
					</th>
					<th class=""><spring:message code="label.informationvehicule" />
					</th>
					<th class=""><spring:message code="label.Action" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notif}" var="n">
					<tr>
					<td>${n.num_demande}</td>
						<td>${n.demandeur_Nom}</td>
						<td>${n.idfiscale}</td>
						<td><span class="badge bg-success">${n.statut.nom_fr}</span>
						</td>
						<td>${n.demandeurAdresse}</td>
						<td>${n.demandeurTel}</td>
						<td>${n.demandeurFax}</td>
						<td>${n.demandeurEmail}</td>
						<td>${(not empty n.code)? n.code.nom_fr : " - "}</td>
						<td>${(not empty n.type)? n.typeDechet : " - "}</td>
						<td>${n.typevehicule.nom_fr}</td>
						<td>${n.typeConteneurs.nom_fr}</td>
						<td>${n.nombre_vehicule}</td>
						<td>${n.nombre_conteneur}</td>
						<td><c:if test="${not empty n.vehicules}">
								<button class="btn btn-success rounded"
									onclick="show_vehicule('${n.id_collecte}')">
									<span class="fa fa-truck"></span>
								</button>
							</c:if> <c:if test="${empty n.vehicules}">
								<span class="f-12"><spring:message
										code="label.Aucunvehiculenestenregistre" /></span>
							</c:if></td>

						<td><c:choose>
								<c:when test="${n.statut.id_statut_installation==2}">
									<a href="/api/validateDocCt/${n.id_collecte }"
										class="btn btn-primary"><i class="fa fa-upload "
										title="Améliorer les documents" style="margin: 0 !important"></i></a>
								</c:when>
								<c:otherwise>
									<c:choose>

										<c:when test="${n.statut.id_statut_installation==4}">
											<a class="btn btn-warning rounded"
												href="${url_admin}/generate_pdf_collecte/${n.id_collecte}">
												<span class="fa fa-download"></span>
											</a>
										</c:when>
										<c:when test="${n.statut.id_statut_installation==3}">
											<a class="btn btn-warning rounded"
												href="${url_admin}/generate_word_collecte/${n.id_collecte}">
												<span class="fa fa-download"></span>
											</a>
										</c:when>
										<c:when test="${n.statut.id_statut_installation==1}">
											<a class="btn btn-warning rounded"
											   href="/api/addCollectTrans/${n.id_collecte}/N"><spring:message
													code="label.Editer" /> </a>
										</c:when>

									</c:choose>

								</c:otherwise>
							</c:choose> <%--installation de demande--%></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</section>



<!-- Modal -->
<div class="modal fade" id="notif_back" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><spring:message code="label.Notification" /></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-12 table-responsive">
						<table class="table table-hover table-striped table-bordered"
							id="tab_notif">
							<thead>
								<tr>
									<th><spring:message code="label.Message" /></th>
									<th><spring:message code="label.Fichier" /></th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><spring:message code="label.Erreur" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer" /></button>

			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">
					<spring:message code="label.Listedesvehicules" />
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-12 table-responsive">
						<table class="table table-hover table-striped table-bordered"
							id="tab_vehicule">
							<thead>
								<tr>
									<th><spring:message code="label.NMatriculation" /></th>
									<th><spring:message code="label.NChassis" /></th>
									<th><spring:message code="label.Poidstotalencharge" /></th>
									<th><spring:message code="label.Poidsnetduvehicule" /></th>
									<th><spring:message code="label.Equipementdesecurite" /></th>
									<th><spring:message code="label.Attestationdassurance" />
									</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><spring:message code="label.Erreur" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					<spring:message code="label.Fermer" />
				</button>

			</div>
		</div>
	</div>
</div>

<script>
	function show_vehicule(id) {
		event.preventDefault();
		$("#staticBackdrop").modal("show")
		var data = new FormData();
		data.append("id", id);
		$
				.ajax({
					type : "POST",
					enctype : 'multipart/form-data',
					url : "/api/getvehicule",
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(response) {

					    if(response.user==null || response.user==""){
					        window.location.href="/";
                        }
						$("#tab_vehicule tbody").html("");
						if ($(response.vehicules).length > 0)

							$(response.vehicules)
									.each(
											function(idx, el) {
												var equipe = "Aucun équipement de sécurité";
												if (el.equipementSecurite != null) {
													equipe = el.equipementSecurite.nom_fr;
												}
												var btn_url = "";
												if(el.doc_assurance!=null && el.doc_assurance!=""){
													btn_url = el.doc_assurance
															.replace(
																	'/assets/myFile/',
																	'/dowload_uploaded/');

													btn_url = '<a href="'+response.url_Admin+btn_url+'" target="_blank" download class="btn btn-warning rounded-circle"><span class="fa fa-download"></span></a>'

												}

												var tr = "<tr> <td>"
														+ el.num_matricule
														+ "</td> <td>"
														+ el.num_chassis
														+ "</td> <td>"
														+ el.poit_totale_charge
														+ "</td> <td>"
														+ el.point_net
														+ "</td> <td>" + equipe
														+ "</td> <td>"
														+ btn_url
														+ "</td> </tr>";

												$("#tab_vehicule tbody")
														.append(tr);
											})

					},
					error : function() {

					}
				});
	}
</script>




<jsp:include page="../../includes/footer1.jsp" />
