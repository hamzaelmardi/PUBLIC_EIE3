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
        <c:if test="${type=='ZF' || type=='XD'}">
            <c:forEach items="${doc}" var="d">
                <c:if test="${not empty d.description || not empty d.uri}">
                    <button class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'} btn-block text-white" style="background-color: #b3b3b3!important;color: white !important; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</button>
                </c:if>
                <c:if test="${empty d.description && empty d.uri}">
                    <c:if test="${d.nom_fr.contains('Garantie financière')}">
                        <button class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'} btn-block text-white" style="background-color: #b3b3b3!important; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</button>
                    </c:if>
                    <c:if test="${d.nom_fr!='Garantie financière'}">
                        <button disabled class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'} btn-block text-black" style="background-color: #f6f6f6 !important; cursor: auto; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</button>
                    </c:if>
                </c:if>
                <div class="${d.classification.id_classification==1?'Grp_dang':'Grp_simpl d-none'}">
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
                                        <span class="disp_none resultat_calcul2_ct "><strong style="color: black;">CT</strong> = <p class="res2_ct d-inline" id="res2">  </p></span>
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
                        <p>Liens pour télécharger le modèle: <a type="button" href="/downloadFile/${fn:replace(d.uri,"/assets/myFile/","")}">cliquer ici</a></p>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${type!='ZF' && type!='XD'}">
            <c:forEach items="${doc}" var="d">
                <c:if test="${empty d.description && empty d.uri}">
                    <c:if test="${d.nom_fr.contains('Garantie financière')}">
                        <h3 class="text-white" style="background-color: #b3b3b3!important; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</h3>
                    </c:if>
                    <c:if test="${!d.nom_fr.contains('Garantie financière')}">
                        <button disabled class="btn-block" style="background-color: #f6f6f6 !important; cursor: auto;color: black !important; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</button>
                    </c:if>
                </c:if>
                <c:if test="${not empty d.description || not empty d.uri}">
                    <h3 class="text-white" style="background-color: #b3b3b3!important; text-align: ${pageContext.response.locale=='ar'?'right':'left'};">${pageContext.response.locale=='ar'?d.nom_ar:d.nom_fr}</h3>
                </c:if>
                <div>
                    <c:if test="${d.nom_fr.contains('Garantie financière')}">
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CTR</strong><spring:message code="label.CTR"/>
                        </p>

                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">CS</strong><spring:message code="label.CS"/>
                        </p>
                        <p style="padding-left: 1%;border: 2px solid black;">
                            <strong style="color: green">Q</strong> : <spring:message code="label.Quantitededechetstransferes"/>
                            <spring:message code="label.quantitededechetalaquantitetotale"/>
                        </p>
                        <br>
                        <div style="background-color: #eee;color: black;padding-left: 1%;border: 1px solid black;">

                            <div class="row-fluid justify-content-center mb-1 mt-3" >
                                <div class="col-sm-12 pl-0 ct_calcule">
                                    <strong style="color: black">CT</strong> = <input value="0" min="0" class="frm_cal inp_cu_ct mt-2" type="number" placeholder="Cu" >
                                    * <input class="frm_cal inp_q2_ct mt-2" value="0" min="0" type="number" placeholder="Q" >
                                    * <input value="0" min="0" class="frm_cal inp_d_ct mt-2" type="number" placeholder="D" >
                                    &nbsp; <button class="btn btn-sm btn-success mt-2" onclick="calculer2()" ><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul">
                                        <span class="disp_none resultat_calcul2_ct"><strong style="color: black;">CT</strong> = <p class="res2_ct d-inline" id="res2_ct">  </p></span>
                                    </div>

                                </div>
                            </div>

                            <div class="row-fluid justify-content-center mb-5 mt-3">
                                <div class="col-sm-12 pl-0 gf_calcule">
                                    <strong style="color: black">GF</strong> = <input value="0" min="0" class="frm_cal inp_ct_gf mt-2" width="20%" type="number" placeholder="CT" >
                                    + <input class="frm_cal inp_ctr_gf mt-2" value="0" min="0" type="number" placeholder="CTR" > + <input value="0" min="0" class="frm_cal inp_cs_gf mt-2" type="number" placeholder="Cs">
                                    * <input class="frm_cal inp_q_gf mt-2" value="0" min="0" type="number" placeholder="Q" > * 1,2 &nbsp; <button class="btn btn-sm btn-success mt-2" onclick="calculer()" style="margin-top: 10px"><spring:message code="button.Calculer"/></button>
                                    <br>
                                    <div class="zone_resul_2">
                                        <span class="disp_none"><strong style="color: black">GF</strong> = <p class="res2_gf d-inline">  </p></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty d.description}">
                        <p>${d.description}</p>
                    </c:if>
                    <c:if test="${not empty d.uri}">
                        <p>Liens de l'exemplaire: <a href="/downloadFile/${fn:replace(d.uri,"/assets/myFile/","")}">cliquer ici</a></p>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>

    </c:when>
    <c:when test="${show=='procedure'}">
        <style>
            .select2-results__option{
                text-align: left;
            }
            #accordion .ui-accordion-header-icon.ui-icon.ui-icon-triangle-1-e{
                display: none !important;
            }
        </style>

        <div class="row-fluid d-none border p-2 bg-white" id="dev_step">
            <p class="text-center h4 w-100 font_bold">
                    <%--<spring:message code="option.Procedureasuivrepourobtenir"/>--%>
                <c:choose>

                    <c:when test="${type=='ZF' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة للحصول على ترخيص  لاستيراد نفايات من منطقة حرة"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value="obtenir votre demande d'autorisation d'importation des déchets d'une zone franche"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='ET'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة للحصول على ترخيص لاستيراد نفايات غير خطرة من بلد أجنبي "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" obtenir votre demande d'autorisation d'importation des déchets non dangereux d'un pays étranger "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='CT'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة للحصول على ترخيص جمع ونقل النفايات الخطرة "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" obtenir votre demande d'autorisation de collecte - transport des déchets dangereux "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='IT' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value="المسطرة المتبعة لطلب تصريح لمنشأة معالجة النفايات "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" obtenir votre demande d'autorisation d'installation de traitement des déchets dangereux"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='XD'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة لطلب تصريح تصدير النفايات الخاص بك "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" obtenir votre demande d'autorisation d'exportation des déchets "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='TR'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة لطلب تصريح نقل النفايات الخاص بك "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" obtenir votre demande d'autorisation de transit des déchets "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value="المسطرة المتبعة لطلب الموافقة البيئية "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" l'obtention de l'acceptabilité environnementale "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE1'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value="المسطرة المتبعة للحصول على قرار الموافقة البيئية للمشاريع الخاضعة لبطاقة التأثير على البيئة "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" l'obtention de la Décision d'Acceptabilité Environnementale d'un projet soumis à la Notice d'Impact sur l'Environnement"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE2'  }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph1" value=" المسطرة المتبعة للحصول على شهادة المطابقة البيئية  "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph1" value=" l'obtention du Certificat de Conformité Environnementale "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${type=='ZF' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب استيراد النفايات من منطقة حرة "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'importation des déchets d'une zone franche "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='ET' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب استيراد النفايات غير الخطرة من بلد أجنبي"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'importation des déchets non dangereux d'un pays étranger "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='CT' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="  المسطرة المتبعة لجمع - نقل النفايات الخطرة "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" de collecte - transport des déchets dangereux "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='IT' && pageContext.response.locale!='ar'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب منشأة معالجة النفايات "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'installation de traitement des déchets dangereux"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='XD'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب تصدير النفايات"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'exportation des déchets "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='TR' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب عبور النفايات "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" de transit des déchets "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE' }">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب الحصول على القبول البيئي "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'obtention de l'acceptabilité environnementale "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE1'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب الحصول على إشعار الأثر البيئي "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'obtention de la Décision d'Acceptabilité Environnementale d'un projet soumis à la Notice d'Impact sur l'Environnement "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <c:when test="${type=='EIE2'}">
                        <c:choose>
                            <c:when test="${pageContext.response.locale=='ar'}">
                                <c:set var="l_ph2" value="المسطرة المتبعة لطلب الحصول على تدقيق بيئي "/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="l_ph2" value=" d'obtention du Certificat de Conformité Environnementale "/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>


                </c:choose>
                        <!-- francais récuprer de fichier lang
                        Arabe récuprer depuis la variable -->
                <spring:message code="label.Procedureasuivrepour" var="tmp_pp"/> ${pageContext.response.locale=='ar'?"":tmp_pp}  ${l_ph1}

            </p>
            <c:choose>
                <c:when test="${type=='EIE'||type=='EIE2'||type=='EIE1'}">
                    <c:set var="Param_etap" value="4"/>
                </c:when>
                <c:otherwise>
                    <c:set var="Param_etap" value="3"/>
                </c:otherwise>
            </c:choose>
            <div class="col-lg-2 col-md-4 p-0">
                <button class="btn btn-success btn-block" onclick="sectautoris_table_select(${Param_etap})"><span
                        class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/></button>
            </div>
            <div class="col-sm-12 p-4 mt-4">
                <div class="row p-0 justify-content-center">

                    <div class="col-12 d-xl-block d-lg-block d-md-block d-sm-none hidden-xs-down">
                        <hr class="p_absolute_top rotate-hr">
                        <div class="row p-0 justify-content-center">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mt-1 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.CreervotreCompte"/>"
                                        class="p-3 rounded-circle btn btn-success btn_step_perso btn_step_perso1"
                                        onclick="show_zone2('z_compt',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/cadnat.png">
                                </button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mt-1 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.Saisirvotredemande"/>"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso2"
                                        onclick="show_zone2('saisie',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                </button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mt-1 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.AttachervosFichiers"/> "
                                        data_type="${type}"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('attache',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/attache_file.png">
                                </button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mt-1 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.Traitementdevotredemande"/> "
                                        class=" rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('suivre',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                </button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mt-1 text-center">
                                <button data-toggle="tooltip" data-placement="top"
                                        title="<spring:message code="label.RetirerlaDecisiondAcceptabilitEnvironnementalesigne"/>"
                                        class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3"
                                        onclick="show_zone2('recevoir',this)">
                                    <img src="${pageContext.request.contextPath}/assets/images/img_doc_ok.png">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 d-xl-none d-lg-none d-md-none d-sm-block block-xs-down">
                        <div class="row p-0 justify-content-center monCard">
                            <div class="col-12 p-4 mt-1 text-center active card" type="button" onclick="show_zone_2('z_compt',this)">
                                <div class="row align-items-baseline">
                                    <div class="col-2"><button data-toggle="tooltip" data-placement="top"
                                                                title="<spring:message code="label.CreervotreCompte"/>"
                                                                class="p-3  rounded-circle btn btn-success btn_step_perso btn_step_perso1">
                                        <img src="${pageContext.request.contextPath}/assets/images/cadnat.png">
                                    </button>
                                    </div>
                                    <div class="col-8">
                                        <p class="text-success h-4 ml-5 text-left font_bold"><spring:message
                                                code="label.jecreemoncompte"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 p-4 mt-1 text-center card" type="button" onclick="show_zone_2('saisie',this)">
                                <div class="row align-items-baseline">
                                    <div class="col-2"><button data-toggle="tooltip" data-placement="top"
                                                               title="<spring:message code="label.Saisirvotredemande"/>"
                                                               class=" btn rounded-circle btn_gris btn_step_perso btn_step_perso2">
                                        <img src="${pageContext.request.contextPath}/assets/images/saisir.png">
                                    </button>
                                    </div>
                                    <div class="col-8">
                                        <p class="text-success h-4 ml-5 text-left font_bold"><spring:message
                                                code="label.DeposerleDossier"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 p-4 mt-1 text-center card" type="button"  data_type="${type}" onclick="show_zone_2('attache',this)">
                                <div class="row align-items-baseline">
                                    <div class="col-2"> <button data-toggle="tooltip" data-placement="top"
                                                                title="<spring:message code="label.AttachervosFichiers"/>"
                                                                class=" btn rounded-circle btn_gris btn_step_perso btn_step_perso3">
                                        <img src="${pageContext.request.contextPath}/assets/images/attache_file.png">
                                    </button>
                                    </div>
                                    <div class="col-8">
                                        <p class="text-success h-4 ml-5 text-left font_bold"><spring:message
                                                code="label.Piecesafournir"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 p-4 mt-1 text-center card" type="button" onclick="show_zone_2('suivre',this)">
                                <div class="row align-items-baseline">
                                    <div class="col-2">  <button data-toggle="tooltip" data-placement="top"
                                                                 title="<spring:message code="label.Traitementdevotredemande"/>"
                                                                 class="rounded-circle  btn btn_gris btn_step_perso btn_step_perso3">
                                        <img src="${pageContext.request.contextPath}/assets/images/check_file.png">
                                    </button>
                                    </div>
                                    <div class="col-8">
                                        <p class="text-success h-4 ml-5 text-left font_bold">Etapes de traitement de dossier</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 p-4 mt-1 text-center card" onclick="show_zone_2('recevoir',this)">
                                <div class="row align-items-baseline">
                                    <div class="col-2"> <button data-toggle="tooltip" data-placement="top"
                                                                title="<spring:message code="label.RetirerlaDecisiondAcceptabilitEnvironnementalesigne"/>"
                                                                class="rounded-circle btn btn_gris btn_step_perso btn_step_perso3">
                                        <img src="${pageContext.request.contextPath}/assets/images/img_doc_ok.png">
                                    </button>
                                    </div>
                                    <div class="col-8">
                                        <p class="text-success h-4 ml-5 text-left font_bold">Récupération d'un autorisation</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                        <div class="row clss_hide mt-5 z_compt">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold"><spring:message
                                        code="label.jecreemoncompte"/></p>
                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <p><spring:message code="label.Pourdeposervotredemandedobtention"/> <a
                                                href="/demandez_compte" class="h5 text-primary font_bold">
                                            <spring:message code="label.SuivantA"/></a></p>
                                        <p><spring:message code="label.Votreidentifiantetvotremotdepasse"/></p>
                                        <p><spring:message code="label.Votrecomptevavouspermettreenplus"/></p>
                                    </c:when>
                                    <c:when test="${type=='EIE1'}">
                                        <p><spring:message code="label.demandedobtentiondenoticedimpact"/> <a
                                                href="/demandez_compte" class="h5 text-primary font_bold">
                                            <spring:message code="label.SuivantA"/><i class="fa fa-arrow-right"></i></a></p>
                                        <p><spring:message code="label.Votreidentifiantetvotremotdepasse"/></p>
                                        <p><spring:message code="label.Votrecomptevavouspermettreenplus"/></p>
                                    </c:when>
                                    <c:when test="${type=='EIE2'}">
                                        <p><spring:message code="label.demandedobtentiondelauditenvironnemental"/> <a
                                                href="/demandez_compte" class="h5 text-primary font_bold">
                                            <spring:message code="label.SuivantA"/></a></p>
                                        <p><spring:message code="label.Votreidentifiantetvotremotdepasse"/></p>
                                        <p><spring:message code="label.Votrecomptevavouspermettreenplus"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p><spring:message code="label.IlvousfautauprealableCreerun"/> <spring:message code="label.SuivantA"/> <a type="button" class="btn btn-primary circle ml-3" href="/demandez_compte" style="color: black">
                                            <i class="fa fa-arrow-right text-white m-auto"></i></a></p>
                                        <p><spring:message code="label.passeserontgeneres"/></p>
                                        <p><spring:message code="label.Votrecomptevavouspermettre"/></p>
                                    </c:otherwise>
                                </c:choose>





                            </div>
                        </div>

                        <div class="row clss_hide mt-5 saisie collapse">
                            <div class="col-12">

                                <p class="text-success h-4 font_bold">
                                    <c:choose>
                                        <c:when test="${type=='EIE' && pageContext.response.locale!='ar'}">
                                            Je dépose ma demande d’obtention de l'Acceptabilité Environnementale
                                        </c:when>
                                        <c:when test="${type=='EIE'  && pageContext.response.locale=='ar'}">
                                            أقدم طلبي من أجل الحصول على الموافقة البيئية
                                        </c:when>
                                        <c:when test="${type=='EIE2' && pageContext.response.locale!='ar'}">
                                            Je dépose ma demande d’obtention du Certificat de Conformité Environnementale
                                        </c:when>
                                        <c:when test="${type=='EIE2' && pageContext.response.locale=='ar'}">
                                            أقدم طلبي للحصول على شهادة المطابقة البيئية
                                        </c:when>
                                        <c:when test="${type=='EIE1' && pageContext.response.locale!='ar'}">
                                            Je dépose ma demande d’obtention de la Décision d'Acceptabilité Environnementale d'un projet soumis à la Notice d'Impact sur l'Environnement
                                        </c:when>
                                        <c:when test="${type=='EIE1' && pageContext.response.locale=='ar'}">
                                            أقدم طلبي للحصول على قرار الموافقة البيئية للمشاريع الخاضعة لبطاقة التأثير على البيئة
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message code="label.Jedeposemademande"/> ${l_ph2}
                                        </c:otherwise>
                                    </c:choose>

                                </p>
                                <c:if test="${type=='ZF' || type=='XD'}">
                                    <p>
                                        <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                             style="width: 40px;margin-left: 10px">
                                        <spring:message code="label.Pourdeposerunedemandedautorisation"/> ${l_ph2},
                                        <spring:message code="label.ilfautdisposerauprealabledunnumerodenotification"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Apreslacreationdevotrecomptevouspouvezfaire"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Alafinvousavezlapossibilitesoitdedeposervotre"/>${l_ph2},
                                        <spring:message code="label.oubienvousavezlapossibilitedeterminerlenregistrementdevotredemande"/> ${l_ph2} <spring:message code="label.dansunedateulterieure"/>
                                    </p>
                                </c:if>
                                <c:if test="${type=='EIE'}">
                                    <p><spring:message code="label.Vouspouvezdeposervotredemandedobtentiondelacceptabilitenvironnementale"/></p>

                                    <ul class="mt-3">
                                        <li class="pl-2">  <spring:message code="label.Soitenremplissantleformulairederenseignement"/></li>
                                        <li class="pl-2"><spring:message code="label.Ouendeposantdirectementvotredemandesansremplirleformulaire"/>  </li>
                                    </ul>
                                    <p class="mb-3"><spring:message code="label.Leformulairederenseignementprealablevouspermettradeverifier"/> </p>
                                </c:if>

                                <c:if test="${type=='EIE2'}">
                                    <p>
                                        <c:if test="${type=='ZF' || type=='XD'}">
                                            <spring:message code="label.apreslobtentiondunumero"/>
                                        </c:if>
                                        <spring:message code="label.VouspouvezdeposervotredemandedobtentionduCertificatdeConformiteEnvironnementale"/>
                                    </p>
                                </c:if>
                                <c:if test="${type=='EIE1'}">
                                    <p>
                                        <c:if test="${type=='ZF' || type=='XD'}">
                                            <spring:message code="label.apreslobtentiondunumero"/>
                                        </c:if>
                                        <spring:message code="label.VouspouvezdeposerdevotreprojetsoumislaNoticedimpactsurlEnvironnement"/>
                                    </p>
                                </c:if>


                                <c:if test="${type=='ZF'|| type=='XD'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        <spring:message code="label.Lechoixdutransporteur"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.DanslecasdesdechetsDangereux"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Sivousdisposezduncodededechets"/>
                                    </p>
                                    <div class="row justify-content-start">
                                        <div class="col-md-3 col-sm-12">
                                            <p><spring:message code="label.Rechercherledehetspar"/> </p>
                                        </div>
                                        <div class="col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <input type="radio" value="code" name="code" checked>&nbsp;<spring:message code="label.Codededechets"/>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12">
                                            <div class="form-group">
                                                <input type="radio" value="type" name="code" > <spring:message code="label.Typededechets"/>
                                            </div>
                                        </div>

                                        <div class="col-md-4 col-sm-12" id="dechet_code">
                                            <label><spring:message code="label.Codededechets"/> </label>
                                            <select dir="ltr" class="select2 form-control" onchange="rech_transporteur(this)" ${dd}>
                                                <option> <spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${codes}" var="c">
                                                    <option value="${c.id_code}"> ${c.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 d-none" id="dechet_type">
                                            <label><spring:message code="label.Typededechets"/> </label>
                                            <select class="select2 form-control " onchange="rech_transporteur(this)" ${dd}>
                                                <option><spring:message code="option.Choisir"/></option>
                                                <c:forEach items="${codes}" var="c">
                                                    <option value="${c.id_code}"> ${c.nom_ar}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 mt-2" id="tab_transporteur">
                                            <table class="table table-striped table-bordered d-none">
                                                <thead class="bg_stat_01">
                                                <tr>
                                                    <th><spring:message code="label.nom"/></th>
                                                    <th><spring:message code="label.telephone"/></th>
                                                    <th><spring:message code="label.Email"/></th>
                                                    <th><spring:message code="label.Fax"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>


                                                <tr class="text-center">
                                                    <td colspan="4"><spring:message code="label.Aucuntransporteur"/></td>
                                                </tr>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <p>
                                        <spring:message code="label.Etsivousnavezpasuncodededechets"/>    <a href="/CatalogueDesDechet" class="btn btn-primary rounded-circle btn-sm"> <span class="fa fa-arrow-right"></span></a>.
                                    </p>


                                </c:if>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 attache collapse">
                            <div class="col-12">
                                <c:if test="${type.equals('EIE1')}">
                                    <p class="text-underline text-success font_bold">
                                        <spring:message code="label.Lespiecesaccompagnantlademande"/>
                                    </p>
                                </c:if>
                                <c:if test="${type.equals('EIE2')}">
                                    <p class="text-underline text-success font_bold">
                                        <spring:message code="label.Lespiecesaccompagnantlademande"/>
                                    </p>
                                </c:if>
                                <c:if test="${type.equals('EIE')}">
                                    <p class="text-underline text-success font_bold">
                                        <spring:message code="label.LesdocumentsnecessairesdesprojetssoumislEIE"/>
                                    </p>
                                </c:if>

                                <c:if test="${type=='ZF' || type=='XD'}">
                                    <div class="row mb-3">
                                        <div class="col-lg-5 col-md-6 col-sm-12 pt-1 pr-0">
                                            <spring:message code="label.Listedespiecesafournirpourlesdechets"/>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <select class="form-control" onchange="afficher_accord(this)" ${dd}>
                                                <option selected value="1"> <spring:message code="label.dangereux"/></option>
                                                <option value="2"><spring:message code="label.nondangereux"/></option>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${type=='ET' || type=='TR'}">
                                    <h3><spring:message code="label.Listedespiecesafournir"/>:</h3>
                                </c:if>
                                <c:if test="${type=='CT' || type=='IT'}">
                                    <h3><spring:message code="label.Listedespiecesafournir"/>:</h3>
                                </c:if>
                                <div id="accordion">
                                    <h3><spring:message code="label.Test"/></h3>
                                    <div>
                                        <spring:message code="label.desciption"/>
                                    </div>
                                </div>
                                <br>
                                <c:if test="${type!='EIE1'}">
                                    <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                         style="width: 40px;margin-left: 10px">
                                    <spring:message code="label.lespiecesaccompagnantlademandedoiventetre"/>
                                </c:if>
                                <c:if test="${type=='EIE1'}">
                                    <img src="${pageContext.request.contextPath}/assets/images/warning.png"
                                         style="width: 40px;margin-left: 10px">
                                    <spring:message code="label.lapieceaccompagnantlademandedoitetrescannee"/>
                                </c:if>
                                <c:if test="${type=='CT' || type=='IT'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        <spring:message code="label.NombredeDemandeDepose"/>
                                    </p>
                                    <p>
                                        <spring:message code="label.Chaquecomptepeuxdeposeruneseule"/>  ${l_ph2} <spring:message code="label.renouvlableuniquementsiladatedevalidationde"/>
                                    </p>
                                    <c:if test="${type=='CT'}">
                                        <p><spring:message code="label.Danslecasdemandedautorisation"/> ${l_ph2} <spring:message code="label.vousavezlapossibilitedajouter"/></p>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 recevoir collapse">
                            <div class="col-12">
                                <p class="text-success h-4 font_bold">
                                    <c:choose>
                                        <c:when test="${type=='EIE'}">
                                            <spring:message code="label.Jerecuperemademandedobtention"/>
                                        </c:when>
                                        <c:when test="${type=='EIE1'}">
                                            <spring:message code="label.Jerecuperemademandedobtentiondenoticedimpactsurlenvironnement"/>
                                        </c:when>
                                        <c:when test="${type=='EIE2'}">
                                            <spring:message code="label.Jerecuperemademandedobtentiondelauditenvironnemental"/>
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message code="label.Jerecupremonautorisation"/> ${l_ph2}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <p><spring:message code="label.Alafinduprocessusdetraitementdevotredemandedobtention"/></p>
                                        <p style="font-size: 14px"><b><spring:message code="label.Lacceptabiliteenvironnementaledoitetre"/></b></p>
                                    </c:when>
                                    <c:when test="${type=='EIE1'}">
                                        <p><spring:message code="label.Alafinduprocessusdetraitementdevotredemandedobtentionimpact"/></p>
                                        <p style="font-size: 14px"><b><spring:message code="label.Lanoticedimpactsurlenvironnementdoitetreretireeparsondemandeur"/></b></p>
                                    </c:when>
                                    <c:when test="${type=='EIE2'}">
                                        <p><spring:message code="label.AlafinduprocessusdetraitementdevotredemandeCertificatdeConformitEnvironnementale"/> </p>
                                        <p><spring:message code="label.LeCertificatdeConformitEnvironnementaledoitetreretirparsondemandeur"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>
                                            <spring:message code="label.Alafinduprocessusdetraitementdevotredemande"/> ${l_ph2},
                                            <spring:message code="label.vousserieznotifieparemaildeladate"/>
                                        </p>
                                        <c:if test='${type.equals("XD") || type.equals("ZF") || type.equals("IT") || type.equals("CT")}'>
                                            <p>
                                                <spring:message code="label.Larecupérationdelautorisationsigneeesttributaire"/>
                                            </p>
                                        </c:if>
                                        <p>
                                            <spring:message code="label.Lautorisation"/> ${l_ph2} <spring:message code="label.doitetreretirepersonnellementparsontitulaire"/>
                                        </p>
                                        <p>
                                            <spring:message code="label.Lesautorisation"/> ${l_ph2} <spring:message code="label.nonretireesparleursproprietairesdansundelaidedeuxmois"/>
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="row clss_hide mt-5 suivre collapse">
                            <div class="col-12">
                                <c:if test="${type!='EIE2'}">
                                    <p class="text-underline   mt-3">
                                        <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesetapesciapres"/>
                                    </p>
                                </c:if>
                                <c:if test="${type=='EIE2'}">
                                    <p class="text-underline text-success font_bold mt-3">
                                        <spring:message code="label.Lesetapeslesdelaisreglementairesetlesacteursimpliquesdansletraitementdemondossier"/>
                                    </p>
                                </c:if>

                                <c:choose>
                                    <c:when test="${ type=='EIE2'}">
                                        <div class="mb-3 col-10 justify-content-center">
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/images/audit_organigrame.png" >
                                                <c:if test="${pageContext.response.locale!='ar'}">
                                                <img src="${pageContext.request.contextPath}/assets/images/audit_organigrame.png" width="100%"></a>
                                                 </c:if>
                                            <c:if test="${pageContext.response.locale=='ar'}">
                                                 <img src="${pageContext.request.contextPath}/assets/images/auditarabe.png"  width="100%"></a>
                                            </c:if>
                                        </div>
                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                <div class="table-responsive">
                                    <c:if test="${pageContext.response.locale!='ar'}">
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #0aab90"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #0aab90"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En cours de traitement-Complétude</td>
                                                <td class="font_time_serif size_12">Vérification des informations fournies dans la demande de conformité environnementale</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente du complément du dossier</td>
                                                <td class="font_time_serif size_12">L’exploitant est invité à déposer le complément du dossier
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Réunion de recevabilité programmée</td>
                                                <td class="font_time_serif size_12">Le secrétariat du comité de conformité environnementale informe les membres du comité et l’exploitant et/ou son bureau d’études de la date, de l’heure et de l’objet de la réunion d’examen de l’étude d’audit environnemental.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente de l’AE et du CC</td>
                                                <td class="font_time_serif size_12"></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Réunion d’examen programmée</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente du complément de l’AE</td>
                                                <td class="font_time_serif size_12"></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Rapport en cours de vérification
                                                </td>
                                                <td class="font_time_serif size_12"></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Visite de terrain programmée</td>
                                                <td class="font_time_serif size_12"></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente des rapports périodiques</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Vérification des rapports périodiques</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente du rapport final</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Vérification du rapport final</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Réunion de délibération programmée</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr><tr>
                                                <td class="font_time_serif font_bold size_12">Certificat en cours de signature</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr><tr>
                                                <td class="font_time_serif font_bold size_12">Certificat signé</td>
                                                <td class="font_time_serif size_12">
                                                </td>
                                            </tr>



                                            </tbody>
                                        </table>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <table id="table_acteur_ar" class="my_table table table-hover table-bordered table-striped">
                                                <thead class="bg-light">
                                                <tr>
                                                    <th class="text-underline bold text-center font_time_serif" style="background-color: #0aab90"> <spring:message code="label.Statutdudossier"/></th>
                                                    <th class="text-underline bold text-center font_time_serif" style="background-color: #0aab90"><spring:message code="label.Details"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">ملف في طور المعالجة</td>
                                                    <td class="font_time_serif size_12">التحقق من المعلومات الواردة في طلب المطابقة البيئة</td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">في انتظار اكتمال الملف</td>
                                                    <td class="font_time_serif size_12"> استدعاء المستغل  لاستكمال ملفه
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">في انتظار دراسة الافتحاص البيئي</td>
                                                    <td class="font_time_serif size_12">استدعاء المستغل لوضع دراسة الافتحاص البيئي
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">اجتماع مبرمج</td>
                                                    <td class="font_time_serif size_12">تشعر كتابة لجنة المطابقة البيئية أعضاء اللجنة مع المستغل أو مكتب الدراسات بتاريخ و ساعة و موضوع  اجتماع مناقشة دراسة الافتحاص البيئي للنشاط</td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">في انتظار استكمال دراسة الافتحاص البيئي</td>
                                                    <td class="font_time_serif size_12">استدعاء المستغل لوضع العناصر التكميلية لدراسة الافتحاص البيئي</td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">الموافقة المبدئية على الاستصلاح البيئي للنشاط موضوع الدراسة في انتظار التقارير الدورية المتعلقة بمراحل تقدم أشغال الاستصلاح البيئي للوحدة
                                                    </td>
                                                    <td class="font_time_serif size_12">استدعاء المستغل لوضع التقارير الدورية لمراحل تقدم أشغال الاستصلاح البيئي للنشاط او الوحدة الصناعية المعنية </td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">في انتظار الملف النهائي</td>
                                                    <td class="font_time_serif size_12">استدعاء المستغل لوضع الملف النهائي لطلب المطابقة البيئة للنشاط / الوحدة الصناعية المعنية</td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">برمجة اجتماع التداول</td>
                                                    <td class="font_time_serif size_12">تقوم كتابة لجنة المطابقة البيئية بإشعار أعضاء اللجنة ومستغل الوحدة المعنية أو مكتب الدراسات بتاريخ، ساعة وموضوع الاجتماع.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">في  طور التوقيع </td>
                                                    <td class="font_time_serif size_12">قرار المطابقة البيئة في طور التوقيع
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="font_time_serif font_bold size_12">قرار الموافقة البيئية موقع</td>
                                                    <td class="font_time_serif size_12">استدعاء المستغل لسحب قرار المطابقة البيئية لنشاطه أو وحدته الصناعية.
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </c:if>
                                </div>
                                    </c:when>
                                    <c:when test="${type=='EIE' }">
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <div class="mb-3">
                                                <a target="_blank" href="${pageContext.request.contextPath}/assets/images/EIE_organigrame_ar.png" >
                                                    <img src="${pageContext.request.contextPath}/assets/images/EIE_organigrame_ar.png" width="100%"></a>
                                            </div>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <div class="mb-3">
                                                <a target="_blank" href="${pageContext.request.contextPath}/assets/images/EIE_organigrame.png" >
                                                    <img src="${pageContext.request.contextPath}/assets/images/EIE_organigrame.png" width="100%"></a>
                                            </div>
                                        </c:if>

                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                <div class="table-responsive">
                                <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #389c64"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #389c64"><spring:message code="label.Details"/></th>
                                            </tr>
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #a0dcbc"> </th>
                                                <th class="text-underline bold font_time_serif" style="background-color: #a0dcbc"><spring:message code="label.Renseignementsprealables"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.Dossierencourstraitement"/> </td>
                                                <td class="font_time_serif size_12"><spring:message code="label.Dossierencourstraitement1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.Projetnonassujettis"/> </td>
                                                <td class="font_time_serif size_12"> <spring:message code="label.Projetnonassujettis1"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.ProjetassujettisCNEE"/> </td>
                                                <td class="font_time_serif size_12"> <spring:message code="label.ProjetassujettisCNEE1"/>
                                                    <br><spring:message code="label.ProjetassujettisCNEE2"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color:#a0dcbc "><spring:message code="label.ProjetassujettisCRI"/> </td>
                                                <td class="font_time_serif size_12"> <spring:message code="label.ProjetassujettisCRI1"/>
                                                   <br> <spring:message code="label.ProjetassujettisCRI2"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.EnattenteduEIEetduCCETdesconclusionsdeEP"/> </td>
                                                <td class="font_time_serif size_12"> <spring:message code="label.EnattenteduEIEetduCCETdesconclusionsdeEP1"/>
                                                </td>
                                            </tr>
                                            </tbody>
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif" style="background-color: #a0dcbc"> </th>
                                                <th class="text-underline bold font_time_serif" style="background-color: #a0dcbc"><spring:message code="label.etudeimpactenvironnemental"/></th>
                                            </tr>
                                            </thead>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.EnattentedesconclusionsdeEP"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.EnattentedesconclusionsdeEP1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.Reunionprogramme"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.Reunionprogramme1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.Arretexamen"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.Arretexamen1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.EnattenteducomplementdeEIE"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.EnattenteducomplementdeEIE1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.ProjetAcceptableEnattentedesversionssignesdeEIEetduCC"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.ProjetAcceptableEnattentedesversionssignesdeEIEetduCC1"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.Encoursdesignature"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.Encoursdesignature1"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12" style="background-color: #a0dcbc"><spring:message code="label.AcceptabilitEnvironnementalesigne"/></td>
                                                <td class="font_time_serif size_12"><spring:message code="label.AcceptabilitEnvironnementalesigne1"/>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                </div>
                                    </c:when>
                                    <c:when test="${type=='ZF'}">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-4 col-md-6 col-sm-12">
                                                <select class="form-control" id="shema" onchange="etapeshema(this.value)" ${dd}>
                                                    <option value="1" selected><spring:message code="label.dangereux"/> </option>
                                                    <option value="2"><spring:message code="label.nondangereux"/></option>
                                                </select>
                                            </div>
                                        </div>


                                        <br/>
                                        <div id="shema1">
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_zf.PNG">
                                                <img style="width: 100%;" src="${pageContext.request.contextPath}/assets/images/shema_zf.PNG"></a>
                                        </div>
                                        <div id="shema2" style="display: none">
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_zf_dnd.PNG">
                                                <img style="width: 100%" src="${pageContext.request.contextPath}/assets/images/shema_zf_dnd.PNG"></a>
                                        </div>
                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier En attente  </td>
                                                <td class="font_time_serif size_12">  En cours de traitement et vérification des pièces fournies </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier  Incomplet </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à déposer le complément de dossier </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier Validé   </td>
                                                <td class="font_time_serif size_12">  Le dossier est complet </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Avis de département concernée   </td>
                                                <td class="font_time_serif size_12">  Envoi de courrier au département concerné</td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Non favorable   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon ( à supprimer)  </td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Autorisation Signée   </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer l’autorisation de ...(selon le type d’autorisation) </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente validation de certificat   </td>
                                                <td class="font_time_serif size_12">  Le certificat d’élimination des déchets est en cours de traitement</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat valide   </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à retirer la garantie financière </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat  invalide </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à justifier  le certificat d’élimination des déchets </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de validation du transporteur   </td>
                                                <td class="font_time_serif size_12">  La validation du transporteur en cours de traitement</td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur valide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur invalide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>



                                            </tbody>
                                        </table>

                                    </c:when>

                                    <c:when test="${type=='CT'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_collecte.PNG">
                                            <img src="${pageContext.request.contextPath}/assets/images/shema_collecte.PNG"></a>

                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente </td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Incomplet</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Contrôle préliminaire</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente d'avis d'AGCDD</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente d'avis de commission</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Refus</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Favorable</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Non favorable</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Attente d'avis de département concerné</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de signature</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Favorable sous réserve</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Demande de complément</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Favorable (commission)</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Non Favorable (commission)</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Signée</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Complément attaché</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>



                                            </tbody>
                                        </table>

                                    </c:when>

                                    <c:when test="${type=='IT'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_it.PNG">
                                            <img style="width: 100%" src="${pageContext.request.contextPath}/assets/images/shema_it.PNG"></a>
                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>

                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Incomplet</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">visite planifié</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Favorable</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Non favorable</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de validation de département concerné</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Non favorable (comité)</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Signée</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de programmer une visite</td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>




                                            </tbody>
                                        </table>

                                    </c:when>
                                    <c:when test="${type=='XD'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_xd.PNG">
                                            <img style="width: 100%" src="${pageContext.request.contextPath}/assets/images/shema_xd.PNG"></a>

                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">En attente  </td>
                                                <td class="font_time_serif size_12"> En cours de traitement et vérification des pièces fournies  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Incomplet </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à déposer le complément de dossier  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Valide   </td>
                                                <td class="font_time_serif size_12">  Le dossier est complet </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Avis de département concerné   </td>
                                                <td class="font_time_serif size_12"> Envoi de courrier au département concerné </td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Non favorable   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon   </td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Autorisation Signée   </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer l’autorisation de ...(selon le type d’autorisation) </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente validation certificat   </td>
                                                <td class="font_time_serif size_12"> Le certificat d’élimination des déchets est en cours de traitement </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat valide   </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer la garantie financière  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat invalide   </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à justifier  le certificat d’élimination des déchets</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de validation du Transporteur   </td>
                                                <td class="font_time_serif size_12">  La validation du transporteur en cours de traitement</td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur valide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur invalide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>



                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${type=='ET'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_ET.PNG">
                                            <img src="${pageContext.request.contextPath}/assets/images/shema_ET.PNG"></a>

                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Dossier En attente  </td>
                                                <td class="font_time_serif size_12">  En cours de traitement et vérification des pièces fournies </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Dossier Incomplet </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à déposer le complément de dossier </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier Validé  </td>
                                                <td class="font_time_serif size_12"> Le dossier est complet  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Avis de département concerné   </td>
                                                <td class="font_time_serif size_12"> Envoi de courrier au département concerné </td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Non favorable   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon(à supprimer)   </td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"> Autorisation Signée   </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à retirer l’autorisation de ...(selon le type d’autorisation)</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente validation de certificat   </td>
                                                <td class="font_time_serif size_12"> Le certificat d’élimination des déchets est en cours de traitement </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat valide   </td>
                                                <td class="font_time_serif size_12">  Le pétitionnaire est invité à retirer la garantie financière </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat invalide   </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à justifier  le certificat d’élimination des déchets </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de validation du Transporteur   </td>
                                                <td class="font_time_serif size_12"> La validation du transporteur en cours de traitement </td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur valide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur invalide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>



                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${type=='TR'}">
                                        <a target="_blank" href="${pageContext.request.contextPath}/assets/images/shema_TR.PNG">
                                            <img style="width: 100%" src="${pageContext.request.contextPath}/assets/images/transit.PNG"></a>

                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                        <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier En attente</td>
                                                <td class="font_time_serif size_12"> En cours de traitement et vérification des pièces fournies  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier  Incomplet</td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à déposer le complément de dossier  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Dossier Validé   </td>
                                                <td class="font_time_serif size_12"> Le dossier est complet  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Avis de département concerné   </td>
                                                <td class="font_time_serif size_12"> Envoi de courrier au département concerné </td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Non favorable   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
                                            <%--<tr>
                                                <td class="font_time_serif font_bold size_12">Brouillon ( à supprimer)   </td>
                                                <td class="font_time_serif size_12">  </td>
                                            </tr>--%>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Autorisation Signée   </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer l’autorisation de ...(selon le type d’autorisation) </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente validation de certificat   </td>
                                                <td class="font_time_serif size_12">  Le certificat d’élimination des déchets est en cours de traitement</td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat valide  </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à retirer la garantie financière  </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Certificat  invalide  </td>
                                                <td class="font_time_serif size_12"> Le pétitionnaire est invité à justifier  le certificat d’élimination des déchets </td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12">Attente de validation du transporteur  </td>
                                                <td class="font_time_serif size_12">  La validation du transporteur en cours de traitement</td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur valide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="font_time_serif font_bold size_12">Transporteur invalide   </td>--%>
<%--                                                <td class="font_time_serif size_12">  </td>--%>
<%--                                            </tr>--%>



                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${pageContext.response.locale=='ar'}">
                                            <div class="mb-3">
                                                 <img src="${pageContext.request.contextPath}/assets/images/notice_logigrame_ar.PNG" width="100%">
                                            </div>
                                        </c:if>
                                        <c:if test="${pageContext.response.locale!='ar'}">
                                            <div class="mb-3">
                                                <img src="${pageContext.request.contextPath}/assets/images/shema_NT.PNG" width="100%"></a>
                                            </div>
                                        </c:if>
                                        <p class="text-underline text-success font_bold mt-3">
                                            <spring:message code="label.Enfonctiondavancementsurvotredossierlesystemeaffichelesstatutsciapres"/>
                                        </p>
                                <div class="table-responsive">
                                    <table id="table_acteur" class="my_table table table-hover table-bordered table-striped">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-underline bold text-center font_time_serif"> <spring:message code="label.Statutdudossier"/></th>
                                                <th class="text-underline bold text-center font_time_serif"><spring:message code="label.Details"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"><spring:message code="label.Dossierencoursdetraitementnt"/> </td>
                                                <td class="font_time_serif size_12"><spring:message code="label.Dossierencoursdetraitementnt1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"><spring:message code="label.EnattentedelaversionfinaledelaNIE"/> </td>
                                                <td class="font_time_serif size_12"><spring:message code="label.EnattentedelaversionfinaledelaNIE1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"><spring:message code="label.AcceptabiliteEnvironnementaleencoursdesignature"/> </td>
                                                <td class="font_time_serif size_12"><spring:message code="label.AcceptabiliteEnvironnementaleencoursdesignature1"/></td>
                                            </tr>
                                            <tr>
                                                <td class="font_time_serif font_bold size_12"><spring:message code="label.AcceptabiliteEnvironnementalesigne"/> </td>
                                                <td class="font_time_serif size_12"><spring:message code="label.AcceptabiliteEnvironnementalesigne1"/></td>
                                            </tr>

                                            </tbody>
                                        </table>
                                     </div>
                                    </c:otherwise>
                                </c:choose>

                                <p class="text-success h-4 font_bold mt-3">
                                    <spring:message code="label.Suivremondossier"/>
                                        <%-- <spring:message code="label.Jefaislesuividemademandeenligne"/>--%>
                                </p>
                                <c:choose>
                                    <c:when test="${type=='EIE'}">
                                        <p><spring:message code="label.Vouspouvezsuivreletatdavancementlarubrique"/></p>
                                    </c:when>
                                    <c:when test="${type=='EIE1'}">
                                        <p><spring:message code="label.Vouspouvezsuivreletatdavancementlarubriquelanotice"/></p>
                                    </c:when>
                                    <c:when test="${type=='EIE2'}">
                                        <p><spring:message code="label.Vouspouvezsuivreletatdavancementdevotredemandeapartirdelarubriqueavancement"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>
                                            <spring:message code="label.Vouspouvezsuivrelevolutiondutraitementdevotredemande"/> ${l_ph2}<spring:message code="label.partirdelarubriqueStatut"/>  ${l_ph2}.
                                        </p>
                                        <p>
                                            <spring:message code="label.Aussivousrecevrezegalementunemaillorsdevolutiondetatdevotre"/> ${l_ph2}.
                                        </p>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>

                        <div class="row clss_hide mt-3 suivre collapse">
                            <div class="col-12">
                                <ul class="list_disque ml-5">
                                    <c:if test="${type=='XD' || type=='ZF'}">
                                        <li>
                                            <spring:message code="label.Decretndujanvierrelatifalagestiondesdechetsdangereux"/>
                                            <a target="_blank" download="Décret.docx" href="${pageContext.request.contextPath}/assets/file/decret.docx">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_word.png" width="40px">
                                            </a>
                                        </li>
                                    </c:if>
                                    <%--<c:if test="${type=='EIE'}">
                                        <li>
                                            <spring:message code="label.Loinrelativeauxetudesdimpactsurlenvironnement"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N12_03.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.LoinportantreformedesCentresRegionauxdInvestissement"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N47_18.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.LoinrelativealEvaluationenvironnementale"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N49_17.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.DecretnrelatifauxattributionsetaufonctionnementducNEEetdesCREI"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_563.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.Decretnfixantlesmodalitesdorganisationetdederoulementdelenquetepublique"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_564.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.Refrentieldesetudesdimpactsurlenvironnement"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Referentiel_EIE.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.Directives"/>
                                        </li>
                                        <div class="ml-4 size_12">
                                            <spring:message code="label.Projetdecreationdesunitesindustrielles"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Unites_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdamenagementdeszonesindustrielles"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Zones_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdedechargecontrolee"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_Decharges_controlees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetaquacole"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Projets_aquacoles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.ProjetduneStationdEpurationdesEauxUsees"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_epuration_eau_usees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdextractiondemateriauxdeconstruction"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Extraction_materiaux_construction.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            7.Projet touristique
                                            <a target="_blank">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            8.Projet d’infrastructure linéaire
                                            <a target="_blank">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                        </div>
                                    </c:if>--%>
                                    <%--<c:if test="${type=='EIE1'}">
                                        <li>
                                            <spring:message code="label.Loinrelativeauxetudesdimpactsurlenvironnement"/>
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N12_03.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Loi n° 12-03 Relative aux études d'impact sur l'environnement
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N12_03.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Loi n° 47-18 portant réforme des Centres Régionaux d'investissement
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/LoisN_47_18%20.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Loi n° 49-17 relative à l'evaluation environnementale
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Lois_N49_17.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI
                                            <a target="_blank"  href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_563.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Decret_n_2_04_564.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            Référentiel des études d'impact sur l'environnement.
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Referentiel_EIE.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="40px">
                                            </a>
                                        </li>
                                        <li>
                                            <spring:message code="label.Directives"/>
                                        </li>
                                        <div class="ml-4 size_12">
                                            <spring:message code="label.Projetdecreationdesunitesindustrielles"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Unites_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdamenagementdeszonesindustrielles"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Zones_Industrielles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdedechargecontrolee"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_Decharges_controlees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetaquacole"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Projets_aquacoles.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.ProjetduneStationdEpurationdesEauxUsees"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_epuration_eau_usees.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>
                                            <spring:message code="label.Projetdextractiondemateriauxdeconstruction"/>
                                            <a target="_blank" href="${pageContext.request.contextPath}/assets/file/Directive_EIE_Extraction_materiaux_construction.pdf">
                                                <img src="${pageContext.request.contextPath}/assets/images/file_PDF.png" width="30px">
                                            </a><br>

                                        </div>
                                    </c:if>--%>
                                </ul>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="row-fluid border d-none bg-white" id="dev_list_slc">
            <div class="col-12">
                <p class="h3 font_bold w-100 text-center p-4"><spring:message
                        code="label.Preparezvotredemarche"/></p><br><br>
                <div class="col-lg-2 col-sm-6 p-0">
                    <button class="btn btn-success btn-block" onclick="show_etape_normal()" style="margin: -63px 0px 20px 0px;">
                        <span class="fa fa-arrow-left"></span> <spring:message code="label.Retour"/>
                    </button>
                </div>
            </div>
            <div class="col-12 p-0 m-0 bg-light border">
                <div class="row p-0 m-0">
                    <div class="col-12">
                        <p class="font_bold p-3 mb-0" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code="label.Jesouhaitefaireunedemandedautorisation"/> : </p>
                    </div>
                </div>
            </div>

            <div class="col-12 border" id="autorisation_groupe">
                <div class="row p-0 m-0 mt-3">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="label.Importationdechetszonefranche"/></h6>
<%--                                <div class="dddd" style="position: absolute;top: 110px;right: 10px;cursor: pointer">--%>
<%--                                    <div class="badge pulsate" onclick="go_link('/new_procedure/ZF')">--%>
<%--                                        <spring:message code="label.Nouveau"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('ZF')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/ZF')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message
                                            code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('ET')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/ET')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message
                                            code="label.Collectetransportdesdechetsdangereux"/></h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('CT')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.CT}','/api/checkUserDispatch/CT')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message
                                            code="label.Installationdetraitementdesdechets"/></h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('IT')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/IT')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="label.Exportationdesdechetsdangereux"/></h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('XD')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/XD')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>


                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message code="label.Transitdesdechets"/></h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('TR')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('${user.st.ZF}','/api/checkUserDispatch/TR')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

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
                                <h6 style="min-height: 3.5em" class="card-title text-center ">
                                    <spring:message code="option.Etudedimpactenvironnementale"/>
                                </h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('on','/api/checkEIESelect/EE')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="option.Noticedimpact"/>
                                </h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE1')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('on','/api/checkEIESelect/NT')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="card w-100">
                            <div class="card-body text-center">
                                <h6 style="min-height: 3.5em" class="card-title text-center">
                                    <spring:message code="option.Auditenvironnementale"/>
                                </h6>
                                <c:choose>
                                    <c:when test="${empty user}">
                                        <button class="btn btn-primary btn-sm" onclick="show_etape_perso2('EIE2')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm" onclick="checkAut('on','/api/checkEIESelect/AE')">
                                            <spring:message code="label.Acceder"/>
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script>
            $("input[name=code]").off().on("change",function(){
                var id = $(this).val();
                if(id=='type'){
                    $("#dechet_code").addClass("d-none");
                    $("#dechet_type").removeClass("d-none");
                }else{
                    $("#dechet_type").addClass("d-none");
                    $("#dechet_code").removeClass("d-none");
                }
            });

            function etapeshema(val){
                if(val=='1'){
                    $("#shema1").show();
                    $("#shema2").hide();
                }else{
                    $("#shema2").show();
                    $("#shema1").hide();
                }
            }
        </script>
    </c:when>
</c:choose>




