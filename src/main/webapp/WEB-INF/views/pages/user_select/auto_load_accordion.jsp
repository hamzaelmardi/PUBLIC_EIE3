<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:choose>
    <c:when test="${show=='accordion'}">
        <c:forEach items="${doc}" var="d">
            <c:if test="${empty d.description && empty d.uri}">
                <button disabled class="btn-block text-left" style="background-color: #f6f6f6 !important; color: black !important;">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</button>
            </c:if>

            <c:if test="${not empty d.description || not empty d.uri}">
                <h3 class="text-white" style="background-color: #336c4e">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</h3>
            </c:if>
            <div>
                <c:if test="${d.nom_fr.contains('Garantie financière')}">
                    <c:if test="${pageContext.response.locale=='ar'}">
                        <p><strong><spring:message code="label.CTR1"/> </strong></p>
                        <p><strong><spring:message code="label.CTR0"/> </strong></p>
                        <p><strong><spring:message code="label.CTR2"/> </strong></p>
                        <p><strong><spring:message code="label.CTR3"/> </strong></p>
                    </c:if>
                    <p style="padding-left: 1%;padding-right: 1%;border: 2px solid black;">
                        <strong><spring:message code="label.CTR"/> </strong>
                        <c:if test="${pageContext.response.locale=='ar'}">
                            <br/>
                            <strong><spring:message code="label.CTR01"/> </strong>
                            <br/>
                            <strong><spring:message code="label.CTR02"/> </strong>
                            <br/>
                            <strong><spring:message code="label.CTR03"/> </strong>
                        </c:if>
                    </p>
                    <p style="padding-left: 1%;padding-right: 1%;border: 2px solid black;">
                        <strong><spring:message code="label.CS"/></strong>
                        <c:if test="${pageContext.response.locale=='ar'}">
                            <br/>
                            <strong><spring:message code="label.CS01"/> </strong>
                        </c:if>
                    </p>
                    <p style="padding-left: 1%;padding-right: 1%;border: 2px solid black;">
                        <strong><spring:message code="label.Quantitededechetstransferes"/>
                            <spring:message code="label.quantitededechetalaquantitetotale"/></strong>
                        <c:if test="${pageContext.response.locale=='ar'}">
                            <br/>
                            <strong><spring:message code="label.Q01"/> </strong>
                            <br/>
                            <strong><spring:message code="label.Q02"/> </strong>
                            <br/>
                            <strong><spring:message code="label.Q03"/> </strong>
                        </c:if>
                    </p>
                    <br>
                    <div style="background-color:#eee;color: black;padding-left: 1%;border: 1px solid black;">
                        <div class="row-fluid justify-content-center mb-1 mt-3" >
                            <div class="col-sm-12 pl-0 ct_calcule ">
                                <strong style="color: black">CT</strong> = <input value="0" min="0" class="frm_cal inp_cu_ct mt-2" type="number" placeholder="Cu" >
                                * <input class="frm_cal inp_q2_ct mt-2" value="0" min="0" type="number" placeholder="Q" >
                                * <input value="0" min="0" class="frm_cal inp_d_ct mt-2" type="number" placeholder="D" >
                                &nbsp; <button class="btn btn-sm btn-success mt-2" onclick="calculer2()" ><spring:message code="button.Calculer"/></button>
                                <br>
                                <div class="zone_resul">
                                    <span class="disp_none resultat_calcul2_ct"><strong style="color: black;">CT</strong> = <p class="res2_ct d-inline" id="res2">  </p></span>
                                </div>
                            </div>
                        </div>

                        <div class="row-fluid justify-content-center mb-5 mt-3">
                            <div class="col-sm-12 pl-0 gf_calcule">
                                <strong style="color: black">GF</strong> = <input value="0" min="0" class="frm_cal inp_ct_gf mt-2" width="20%" type="number" placeholder="CT" >
                                + <input class="frm_cal inp_ctr_gf mt-2" value="0" min="0" type="number" placeholder="CTR" > + <input value="0" min="0" class="frm_cal inp_cs_gf mt-2" type="number" placeholder="Cs" >
                                * <input class="frm_cal inp_q_gf mt-2" value="0" min="0" type="number" placeholder="Q" > * 1,2 &nbsp; <button class="btn btn-sm btn-success mt-2" onclick="calculer()" style="margin-top: 10px"><spring:message code="button.Calculer"/></button>
                                <br>
                                <div class="zone_resul_2">
                                    <span id="resultat_calcul" class="disp_none"><strong style="color: black">GF</strong> = <p class="res2_gf d-inline">  </p></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty d.description}">
                    <p>${d.description}</p>
                </c:if>
                <c:if test="${not empty d.uri}">
                    <p><spring:message code="label.Liensdelexemplaire"/>: <a href="/downloadFile/${fn:replace(d.uri,"/assets/myFile/","")}">cliquer ici</a></p>
                </c:if>
            </div>
        </c:forEach>
    </c:when>
    <c:when test="${show=='procedure'}">
        <div class="row-fluid d-none border p-2" id="dev_step">
            <p class="text-center h4 w-100 font_bold">
                <%--<spring:message code="option.Procedureasuivrepourobtenir"/>--%>
                    <c:choose>
                        <c:when test="${type=='ZF'}">
                            <c:set var="l_ph1" value=" d'autorisation d'importation des déchets d'une zone franche "/>
                        </c:when>
                        <c:when test="${type=='ET'}">
                            <c:set var="l_ph1" value=" d'autorisation d'importation des déchets non dangereux d'un pays étranger "/>
                        </c:when>
                        <c:when test="${type=='CT'}">
                            <c:set var="l_ph1" value=" d'autorisation de collecte - transport des déchets dangereux "/>
                        </c:when>
                        <c:when test="${type=='IT'}">
                            <c:set var="l_ph1" value=" d'autorisation d'installation de traitement des déchets "/>

                        </c:when>
                        <c:when test="${type=='XD'}">
                            <c:set var="l_ph1" value=" d'autorisation d'exportation des déchets "/>
                        </c:when>
                        <c:when test="${type=='TR'}">
                            <c:set var="l_ph1" value=" d'autorisation de transit des déchets "/>
                        </c:when>
                        <c:when test="${type=='EIE'}">
                            <c:set var="l_ph1" value=" de l'obtention de l'acceptabilité environnementale "/>
                        </c:when>
                        <c:when test="${type=='EIE1'}">
                            <c:set var="l_ph1" value=" de notice d'impact sur l'environnement "/>
                        </c:when>
                        <c:when test="${type=='EIE2'}">
                            <c:set var="l_ph1" value=" d'audit environnemental "/>
                        </c:when>
                    </c:choose>
                    <spring:message code="label.Procedureasuivrepourobtenirvotredemande"/> ${l_ph1}

            </p>
            <div class="col-2 p-0">
                <button class="btn btn-success btn-block" onclick="show_etape_normal()" style="margin: -63px 0px 20px 0px;"><span
                        class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></button>
            </div>
            <div class="col-sm-12 p-4 mt-4">
                <div class="row p-0 justify-content-center">

                    <div class="col-12">
                        <hr class="p_absolute_top">
                        <div class="row p-0 justify-content-center">
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.CreervotreCompte"/> "
                                        class="p-3 rounded-circle btn btn-success btn_step_perso btn_step_perso1"
                                        onclick="show_zone('z_compt',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/cadnat.png">
                                </button>
                            </div>
                            <c:if test="${type=='ZF' || type=='XD' || type=='EIE'}">
                                <div class="col-2 text-center">
                                    <button data-toggle="tooltip" data-placement="top"
                                            title="<spring:message code="label.Saisirvotredemande"/>"
                                            class="rounded-circle btn btn_gris btn_step_perso btn_step_perso2"
                                            onclick="show_zone('saisie',this)">
                                        <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                    </button>
                                </div>
                            </c:if>
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.AttachervosFichiers"/>"
                                        data_type="${type}"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone('attache',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/attache_file.png">
                                </button>
                            </div>
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.Suivrevotredemande"/> "
                                        class=" rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone('suivre',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                </button>
                            </div>
                            <div class="col-2 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.RetirerlaDecisiondAcceptabilitEnvironnementalesigne"/> "
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone('recevoir',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/img_doc_ok.png">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row clss_hide mt-5 z_compt">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold"><spring:message
                                        code="label.jecreemoncompte"/></p>
                                <p><spring:message code="label.IlvousfautauprealableCreerun"/> <a
                                        href="/demandez_compte" class="h5 text-primary font_bold">
                                    <spring:message code="label.SuivantA"/></a></p>
                                <p><spring:message code="label.passeserontgeneres"/></p>
                                <p><spring:message code="label.Votrecomptevavouspermettre"/></p>


                            </div>
                        </div>

                        <div class="row clss_hide mt-5 saisie collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    <c:if test="${type=='ZF' || type=='XD'}">
                                        <spring:message code="label.Jeremplisleformulairededemandedunumerodenotificationenligne"/>
                                    </c:if>
                                    <c:if test="${type=='EIE'}">
                                        <spring:message code="label.Jeremplisleformulairededemandedurenseignementprealableenligne"/>
                                    </c:if>
                                </p>
                                <c:if test="${type=='ZF' || type=='XD'}">
                                    <p>
                                        <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                             style="width: 40px;margin-left: 10px">
                                        <spring:message code="label.Pourdeposerunedemandedautorisation"/>  ${l_ph1},
                                        <spring:message code="label.ilfautdisposerauprealabledunnumerodenotification"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Apreslacreationdevotrecompte"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Alafinvousavezlapossibilitededeposervotredemandeencliquantsurle"/>
                                    </p>
                                </c:if>

                                <c:if test="${type=='EIE'}">
                                    <spring:message code="label.Vouspouvezdeposerunedemandedautorisation"/> ${l_ph1} de deux façon :
                                    <ul>
                                        <li> soit en remplissant le formulaire de renseignement préalable qui une fois validé va vous permetre de déposé votre demande d'autorisation ${l_ph1}</li>
                                        <li> ou bien vous pouvez passez cette etape qui est une étape facultatife et remplir directement votre demande d'autorisation ${l_ph1}  </li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 attache collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    Je dépose ma demande ${l_ph1}
                                </p>

                                <p>
                                    <c:if test="${type=='ZF' || type=='XD'}">
                                        après l'obtention du numéro de notification
                                    </c:if>
                                    vous pouvez déposer une nouvelle demande d'autorisation ${l_ph1}, en replissant le formulaire de dépôt de la demande en veillant
                                    à renseigner tous les champs du formulaire, et aussi les pièces à scanner et à envoyer au niveau du système: </p>


                                <p class="text-underline text-success font_bold">
                                    Les pièce à scanner :
                                </p>

                                <div id="accordion">
                                    <h3>Test</h3>
                                    <div>
                                        desciption
                                    </div>
                                </div>
                                <c:if test="${type=='CT' || type=='IT'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        Nombre de Demande Déposé :
                                    </p>
                                    <p>
                                        Chaque compte peux déposé une seule demande d'autorisation ${l_ph1} renouvlable
                                        uniquement si la date de validation de la demande est proche de la date de péremption
                                    </p>
                                    <c:if test="${type=='CT'}">
                                        <p>Dans le cas demande d'autorisation ${l_ph1} vous avez la possibilité d'ajouter ou de modifer un ou plusieurs déchets/Vehicules</p>
                                    </c:if>
                                </c:if>

                                <c:if test="${type=='ZF'|| type=='XD'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        Le choix du transporteur :
                                    </p>
                                    <p>
                                        Dans le cas des déchets Dangereux, vous pouvez Déclarer votre transporteurs
                                        depuis une liste mise a votre disposition.
                                    </p>
                                    <p>
                                        Si vous disposez d'un code de déchets, vous pouvez vérifier les transporteurs qui prennent en charge le type de déchets voulu.
                                    </p>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12">
                                            <label>List des codes</label>
                                            <select class="select2 form-control" onchange="rech_transporteur(this)">
                                                <option> <spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${codes}" var="c">
                                                    <option value="${c.id_code}"> ${c.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-12 mt-2" id="tab_transporteur">
                                            <table class="table table-striped table-bordered">
                                                <thead class="bg_stat_01">
                                                <tr>
                                                    <th>Nom</th>
                                                    <th>téléphone</th>
                                                    <th>Email</th>
                                                    <th>Fax</th>
                                                </tr>
                                                </thead>
                                                <tbody>


                                                    <tr class="text-center">
                                                        <td colspan="4">Aucun transporteur</td>
                                                    </tr>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <p>
                                        Et si vous n'avez pas un code de déchets, vous pouvez vérifier les transporteurs qui prennent en charge le type de déchets dans la liste suivante <a href="/CatalogueDesDechet" class="btn btn-primary rounded-circle btn-sm"> <span class="fa fa-arrow-right"></span></a>.
                                    </p>


                                </c:if>

                                <p class="text-underline text-success font_bold mt-3"><spring:message
                                        code="label.Acteurimpliqueetdelaisdetraitementparphase"/></p>

                                <table class="table table-striped table-bordered table-hover my_table">
                                    <thead class="bg_stat_01">
                                    <tr>
                                        <th><spring:message code="label.Statut"/></th>
                                        <th><spring:message code="label.Acteur"/></th>
                                        <th><spring:message code="label.Delais"/></th>
                                        <th><spring:message code="label.Detail"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><spring:message code="label.EnAttente"/></td>
                                        <td><spring:message code="label.Ministere"/></td>
                                        <td><spring:message code="label.jours"/></td>
                                        <td><spring:message
                                                code="label.Danscetteetapevotredossierestredirige"/></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="label.demandedecomplement"/></td>
                                        <td><spring:message code="label.Demandeur"/></td>
                                        <td> -</td>
                                        <td><spring:message
                                                code="label.Danscetteetapevotredossierestincomplet"/></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="label.AvisCommission"/></td>
                                        <td><spring:message code="label.Commission"/></td>
                                        <td><spring:message code="label.jours"/></td>
                                        <td><spring:message code="label.leservicedecommission"/></td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="label.Favorable"/></td>
                                        <td><spring:message code="label.Ministere"/></td>
                                        <td><spring:message code="label.jours"/></td>
                                        <td><spring:message code="label.servicespecialise"/></td>
                                    </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>

                        <div class="row clss_hide mt-5 suivre collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold"><spring:message
                                        code="label.Jefaislesuividemademandeenligne"/></p>
                                <p>
                                    Vous pouvez suivre l’évolution du traitement de votre ${l_ph1} à partir de la rubrique « Statut
                                    du Dossier ». Pour cela, vous devez saisir le numéro de votre dossier de demande d'autorisation ${l_ph1}
                                </p>
                                <p>
                                    Aussi vous recevrez également un email lors d'évolution d'état de votre
                                    dossier de demande d'autorisation ${l_ph1}
                                </p>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 recevoir collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    Je récupère mon autorisation ${l_ph1}
                                </p>
                                <p>
                                    A la fin du processus de traitement de votre demande ${l_ph1},
                                    vous seriez notifié par email de la date
                                    à partir de laquelle vous pouvez récupérer votre demande d'autorisation
                                </p>
                                <c:if test='${type.equals("XD") || type.equals("ZF") || type.equals("IT") || type.equals("CT")}'>
                                <p>
                                    La récupération de l’autorisation signée est tributaire de dépôt de la caution signée
                                </p>
                                </c:if>
                                <p>
                                    L'autorisation ${l_ph1} doit être retiré personnellement par son titulaire
                                </p>
                                <p>
                                    Les autorisations ${l_ph1} non retirées par
                                    leurs propriétaires dans un délai de deux mois à compter de leur date de notification
                                    sont annulées et détruites.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="row-fluid border d-none" id="dev_list_slc">
            <div class="col-12">
                <p class="h3 font_bold w-100 text-center p-4"><spring:message
                        code="label.Preparezvotredemarche"/></p><br><br>
                <div class="col-lg-2 col-sm-6 p-0">
			                				<button class="btn btn-success btn-block" onclick="show_etape_normal()" style="margin: -63px 0px 20px 0px;"><span
			                        		class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></button>
			            				</div>
            </div>
            <div class="col-12 p-0 m-0  bg-light border">
                <div class="row p-0 m-0">
                    <div class="col-12 ">
                        <p class="font_bold p-3 mb-0" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Jesouhaitefaireunedemandedautorisation"/> : </p>
                    </div>

                </div>
            </div>


            <div class="col-12 border" id="autorisation_groupe">
                <div class="row p-0 m-0 mt-3">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message code="label.Importationdechetszonefranche"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('ZF')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message
                                            code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('ET')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify ">
                                    <spring:message
                                            code="label.Collectetransportdesdechetsdangereux"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('CT')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message
                                            code="label.Installationdetraitementdesdechets"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('IT')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message code="label.Exportationdesdechetsdangereux"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('XD')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify ">
                                    <spring:message code="label.Transitdesdechets"/></h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('TR')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 border" id="EIE_groupe">
                <div class="row p-0 m-0 mt-3">
                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify ">
                                    <spring:message code="option.Etudedimpactenvironnementale"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('EIE')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message code="option.Noticedimpact"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('EIE1')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-justify">
                                    <spring:message code="option.Auditenvironnementale"/>
                                </h6>
                                <button class="btn btn-primary btn-sm" onclick="show_etape_perso('EIE2')">
                                    <spring:message code="label.Acceder"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
</c:choose>

<script>
    $(document).ready(function (){
        $('.Grp_dang .ui-accordion-content .ui-accordion-content-active').eq(0).hide();
        $('.Grp_dang .ui-accordion-content .ui-accordion-content-active').css("background-color","red");
    });
</script>




