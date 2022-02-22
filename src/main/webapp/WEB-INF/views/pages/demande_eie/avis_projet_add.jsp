<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<jsp:include page="../../includes/head.jsp"/>
<link href="${pageContext.request.contextPath}/assets/css/sweet-alert.css">
<script src="${pageContext.request.contextPath}/assets/js/swwtAlert2.js"></script>
<%--<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>--%>
<style>
    .dropdown-menu {
        min-width: ${pageContext.response.locale=='ar'?'9rem':'7rem'} !important;
        font-size: 14px !important;
        margin: 0.125rem ${pageContext.response.locale=='ar'?'40px':'-70px'} 0px;
    }

    .btn:focus, .btn.focus {
        outline: none !important;
        box-shadow: none !important;
    }

    .mydrop{
        position: absolute;
    ${pageContext.response.locale=='ar'?'left':'right'}: 35px !important;
        top: 0px;
        direction: ltr !important;
    }

    @media (max-width: 768px) {
        .breadcrumb-item a{
            font-size: 7pt !important;
        }
        .mydrop{
        ${pageContext.response.locale=='ar'?'left:23px !important;':'right:25px !important'};
            top: 0px;
        }
    }

    .mydrop ul li a:hover{
        background-color:#0aa68d;
        color: white;
    }

    .mydrop ul li a{
        text-decoration: none !important;
        margin-bottom:1rem;
        list-style: none !important;
        padding:20px
    }
</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .select2_option {
           text-align: right;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .select2_option {
          text-align: left;
        }
    </style>
</c:if>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>

<style>
    .select2-container--default .select2-selection--multiple {
        padding: 0px;
    }
</style>

<div class="main-panel">
    <section class="mt-2 bg-white container-fluid" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row">
            <div class="col-12">

                <c:choose>
                    <c:when test="${type=='EE'}">
                        <spring:message code="option.Etudedimpactenvironnementale" var="p_page" />
                    </c:when>
                    <c:when test="${type=='RS'}">
                        <spring:message code="label.Renseignementprealable" var="p_page" />
                    </c:when>
                    <c:when test="${type=='NT'}">
                        <spring:message code="option.Noticedimpact" var="p_page" />
                    </c:when>
                    <c:when test="${type=='AE'}">
                        <spring:message code="option.Auditenvironnementale" var="p_page" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><spring:message code="label.Accueil"/> </a></li>
                        <li class="breadcrumb-item active"><a href="/api/checkEIESelect/${type=="RS"?"EE":type}">${p_page} </a></li>
                        <div class="mydrop">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                                    <img src="${pageContext.request.contextPath}/assets/images/question.png" width="30" class="img-fluid img-circle">
                                </button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" onclick="lightbox_open()"><span><img src="${pageContext.request.contextPath}/assets/images/play.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Video &nbsp;&nbsp;&nbsp;</span></a></li><hr>
                                    <c:choose>
                                        <c:when test="${type=='EE'}">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Etude%20d_impact%20sur%20l_environnement/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                        </c:when>
                                        <c:when test="${type=='NT'}">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Notice%20d_impact%20sur%20l_environnement/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                        </c:when>
                                        <c:when test="${type=='AE'}">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Audit%20environnemental/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/assets/pdf/Etude%20d_impact%20sur%20l_environnement/${pageContext.response.locale!='ar'?'inscription.pdf':'التسجيل.pdf'}" download><span><img src="${pageContext.request.contextPath}/assets/images/pdf.png" width="25" class="img-fluid img-circle"/>&nbsp;&nbsp; Pdf &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </ol>
                </nav>
                <div id="light">
                    <a class="boxclose" id="boxclose" onclick="lightbox_close();"></a>
                    <video id="VisaChipCardVideo" width="600" controls>
                        <c:choose>
                            <c:when test="${type=='EE'}">
                                <source src="${pageContext.request.contextPath}/assets/video/EIE_Deposer_Demande.mp4" type="video/mp4">
                            </c:when>
                            <c:when test="${type=='NT'}">
                                <source src="${pageContext.request.contextPath}/assets/video/Notice_deposer_demande.mp4" type="video/mp4">
                            </c:when>
                            <c:when test="${type=='AE'}">
                                <source src="${pageContext.request.contextPath}/assets/video/Audit_deposer_demande.mp4" type="video/mp4">
                            </c:when>
                            <c:otherwise>
                                <source src="${pageContext.request.contextPath}/assets/video/Renseignements.mp4" type="video/mp4">
                            </c:otherwise>
                        </c:choose>
                        <!--Browser does not support <video> tag -->
                    </video>
                </div>
                <div id="fade" onClick="lightbox_close();"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-sm-12">
                <c:if test="${type=='AE'}">
                    <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block ${demande.statut.id_statut_projet!=12 && !demande.type.equals('RS')?'active':''} cls_step" ${demande.statut.id_statut_projet==12 && demande.type.equals('RS')?'disabled':''} id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')"><spring:message code="label.informationssurlepetitionnaireAE"/></button>
                </c:if>
                <c:if test="${type!='AE'}">
                    <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block ${demande.statut.id_statut_projet!=12 && !demande.type.equals('RS')?'active':''} cls_step" ${demande.statut.id_statut_projet==12 && demande.type.equals('RS')?'disabled':''} id="step_id1" onclick="affiche_eie_zone('#step1','#step_id1')"><spring:message code="label.informationssurlepetitionnaire"/></button>
                </c:if>
                <c:if test="${demande.statut.id_statut_projet!=13}">
                    <c:if test="${type=='AE'}">
                    <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block cls_step" ${id==0 ?'disabled':''} id="step_id1_2" onclick="affiche_eie_zone('#step1_2','#step_id1_2')"><spring:message code="label.informationssurleprojetAE"/> </button>
                    <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block cls_step" ${id==0 ?'disabled':''} id="step_id2" onclick="affiche_eie_zone('#step2','#step_id2')" ><spring:message code="label.localisationProjetAE"/></button>
                    </c:if>
                    <c:if test="${type!='AE'}">
                        <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block cls_step" ${id==0 || (demande.statut.id_statut_projet==12 && demande.type.equals('RS'))?'disabled':''} id="step_id1_2" onclick="affiche_eie_zone('#step1_2','#step_id1_2')"><spring:message code="label.informationProjet"/></button>
                        <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block cls_step" ${id==0 || (demande.statut.id_statut_projet==12 && demande.type.equals('RS'))?'disabled':''} id="step_id2" onclick="affiche_eie_zone('#step2','#step_id2')" ><spring:message code="label.localisationProjet"/></button>
                    </c:if>
                    </c:if>
                <c:if test="${type=='EE'|| type=='NT'}">
                    <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block ${demande.statut.id_statut_projet==12 && demande.type.equals('RS')?'active':''} cls_step" ${id==0?'disabled':''} id="step_id3" onclick="affiche_eie_zone('#step3','#step_id3')"><spring:message code="label.Piecefournir"/> </button>
                </c:if>
                <button style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="btn btn-success btn-block cls_step montab" id="step_id4" onclick="affiche_eie_zone('#step4','#step_id4')" disabled> <spring:message code="label.Recapitulation"/> </button>
            </div>
            <div class="col-lg-8 col-sm-12 col-md-8">
                <div class="row pb-2 mt-3">
                    <div class="col-12 pl-0 px-2">
                        <h4 class="titre_abs " style="text-align:center"><c:if test="${type=='EE'}"><spring:message code="label.EtudedimpactEnvironnementale"/> </c:if>
                            <c:if test="${type=='RS'}"><spring:message code="label.Renseignementprealable"/> </c:if>
                            <c:if test="${type=='NT'}"><spring:message code="label.Noticedimpact"/> </c:if>
                            <c:if test="${type=='AE'}"><spring:message code="label.Auditenvironnementale"/> </c:if></h4>
                    </div>
                    <div id="step1" class="col-12 z_collecteur ${demande.statut.id_statut_projet!=12 && !demande.type.equals('RS')?'':'collapse'}" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" >
                        <form class="mt-3"  id="formAvisProjet" name="formAvisProjet" >
                            <input type="hidden" value="${(not empty demande)?demande.id_demande_information:'0'}" name="id_demande_information" id="id_demande_information">
                            <c:if test="${not empty demande}">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label ><spring:message code="label.NumeroDemande"/></label>
                                            <input onchange="checkUpdate(this.value)" disabled value="${demande.num_demande }" type="text" name="num_demande" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <%--information demandeur--%>
                            <div class="row">

                                <div class=" col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Raisonsocial"/>   </label>
                                        <input  value="${societe.st.raison_fr}" required ${disabled} type="text" name="raison_social" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">

                                    <div class="form-group">
                                        <label><spring:message code="label.Representant"/> </label>
                                        <input type="text" value="${societe.st.name_fr }" ${disabled} name="represantant" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class=" row">
                                <div class=" col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Email"/></label>
                                        <input value="${societe.st.email }" required ${disabled} type="email" name="email" id="emailEE" class="form-control" >
                                    </div>
                                </div>
                                <div class=" col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.tel"/> </label>
                                        <input value="${societe.st.tel }" required type="tel" ${disabled} name="tel" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-4 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Fax"/></label>
                                        <input ${disabled} required value="${demande.fax }" type="text" name="fax" id="fax" class="form-control" >
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 ">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Adresse"/></label>
                                        <textarea rows="2" ${disabled} type="text" name="adresse" class="form-control" >${societe.st.adresse_fr }</textarea>
                                    </div>
                                </div>
                            </div>
                            <%--information Projet--%>
                            <c:if test="${demande.statut.id_statut_projet==13}">
                                <hr>
                                <div class="row">
                                    <div class=" col form-group">
                                        <label ><spring:message code="label.Avisdeprojet"/> </label>
                                        <input required ${demande.statut.id_statut_projet==13?"":"disabled" } id="avis_projet" accept=".doc,.docx,.pdf"  type="file"  class="form-control" >
                                    </div>
                                </div>
                            </c:if>
                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <c:if test="${demande.statut.id_statut_projet!=13}">
                                        <button class="btn btn-success btn_suiv btn-block" id="btnSuivant"  onclick="addDemandeInfomration('formAvisProjet','${type}','${id}','#step1_2','#step_id1_2',this)">  <spring:message code="button.Suivant"/> </button>
                                    </c:if>
                                    <c:if test="${demande.statut.id_statut_projet==13}">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="set_avis_projet('#avis_projet','#id_demande_information')">  <spring:message code="button.Enregistrer"/> </button>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="step1_2" class="col-12 z_collecteur collapse"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" >
                        <form class="mt-3"  id="formProjet" name="formProjet" >
                            <div class="row">
                                <c:if test="${type=='AE'}">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.Intituledeprojet"/> </label>
                                        <input ${disabled} required value="${demande.intitule_projet }" type="text" id="intitule" name="intitule_projet" class="form-control">
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${type!='AE'}">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.intitule"/></label>
                                            <input ${disabled} required value="${demande.intitule_projet }" type="text" name="intitule_projet" class="form-control">
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label ><spring:message code="label.montantIves"/></label>
                                        <input ${disabled} required value="${demande.montant_investissement }" type="text" name="montant_investissement" class="form-control">
                                        <small class="text-danger">montant accept <b>"."</b> seulement</small>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${type!='NT' && type!='AE'}">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Tronsfrontalier"/>  </label>
                                                <select name="tronsfrontalier" id="tron" required class="form-control select2" data-width="100%" ${dd}>
                                                    <option ${demande.tronsfrontalier.equals('no')?"selected":"" }  value="${pageContext.response.locale=='ar'?'لا':'non'}"><spring:message code="label.non"/></option>
                                                    <option value="${pageContext.response.locale=='ar'?'نعم':'oui'}" ${demande.tronsfrontalier.equals('yes')?"selected":"" } ><spring:message code="label.oui"/></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.interregion"/></label>
                                                <select ${disabled } onchange="fun_disabled_region(this)" style="${pageContext.response.locale=='ar'?'right: 0':'left: auto'}" name="interregion" id="interregion" required class="form-control select2" data-width="100%" ${dd} >
                                                    <option value="${pageContext.response.locale=='ar'?'نعم':'oui'}" ${demande.interregion.equals('oui')?"selected":"" }><spring:message code="label.oui"/></option>
                                                    <option ${demande.interregion.equals('non')?"selected":"" }  value="${pageContext.response.locale=='ar'?'لا':'non'}" ><spring:message code="label.non"/></option>
                                                </select>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${type=='AE'}">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Naturedactivite"/> </label>
                                                    <textarea name="nature_projet" id="nature_projet" class="form-control" rows="3">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.NatureduProjet"/> </label>
                                                    <textarea name="nature_projet" id="nature_projet" class="form-control" rows="3">${demande.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </c:if>
                                       <!-- <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.ConsisitanceduProjet"/></label>
                                                <textarea name="consistance_proj" id="consit_proj" class="form-control" rows="3"></textarea>
                                            </div>
                                        </div>-->
                                    </c:otherwise>
                                </c:choose>


                                <c:if test="${not empty demande.categories}">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.TypedeProjet"/> </label>
                                            <select disabled multiple  required class="form-control select2 p-0" data-width="100%" >
                                                <c:forEach items="${demande.categories}"  var="cat" varStatus="loop">
                                                    <option selected value="${cat.id_categorie}" >${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                                <%-- EDH 11/07/2021 --%>
                                <!-- cette partie if-endIf  etait commanter et lors du test l'etape de validation de description du projet le fichier ne se telecharge pas  -->
                                <c:if test="${type=='AE'}">
                                    <%--   <div class="col-md-6 col-sm-12">

                                       <div class="form-group">
                                             <label> <spring:message code="label.Datederealisationduprojet"/> </label>
                                             <input ${disabled } type="date" name="dateResiliation" class="form-control" id="dateResiliation" value="${demande.dateResiliation}" required >
                                         </div>
                                     </div>
                                     <div class="col-md-6 col-sm-12 mt-2">
                                         <div class="form-group">
                                             <label><spring:message code="label.DatedeDemarrage"/> </label>
                                             <input ${disabled } type="date" name="dateDemarage" id="dateDemarage" class="form-control" value="${demande.dateDemarage}" required >
                                         </div>
                                     </div>--%>

                                        <div class="col-md-${not empty demande.url_file_AE?'5':'6'} col-sm-12 mt-2">
                                            <div class="form-group">
                                                <label ><spring:message code="label.Consistancedelactivite"/> </label>
                                                <input type="file" id="file_frm" class="form-control" onchange="update_new_AE()">
                                            </div>
                                        </div>
                                        <c:if test="${not empty demande.url_file_AE}">
                                        <div class="col-md-1" style="margin-top: 40px">
                                            <div class="form-group">
                                                <a href="/downloadFile/${fn:replace(fn:replace(demande.url_file_AE,"/assets/myFile/",""),"/dowload_uploaded/","")}"
                                                   class="btn btn-success rounded file_existe"><span
                                                        class="fa fa-download"></span></a>
                                            </div>
                                        </div>
                                        </c:if>
                                    </c:if>

                                <%-- EDH 11/07/2021 --%>
                            </div>
                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 mt-1 col-sm-12">
                                    <button class="btn btn-success btn_suiv btn-block" onclick="affiche_eie_zone('#step1','#step_id1')">  <spring:message code="button.Precedent"/> </button>
                                </div>
                                <c:if test="${type=='EE'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateDemandeInfomrationEE('formProjet','id_demande_information','#step2','#step_id2',this)" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='RS'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateDemandeInfomrationRS('formProjet','id_demande_information','#step4','#step_id4')" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='NT'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="updateDemandeInfomration('formProjet','id_demande_information','#step2','#step_id2',this)" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='AE'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn_suiv btn-block" onclick="updateDemandeInfomrationAE('formProjet','id_demande_information','#step2','#step_id2',this)" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                    <div id="step2" class="col-12 z_collecteur collapse"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                        <form class="mt-3"  id="formDetailRegion" name="formDetailRegion" >
                            <%--information region si possible--%>
                            <div id="zone_region">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.Regions"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_region" id="id_region" multiple onchange="load_pref_by_region(this)" ${dd}>
                                                <c:forEach items="${regions}" var="reg" varStatus="loop">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.region}" var="rr">
                                                                ${rr.regionId==reg.regionId?"selected":""}
                                                            </c:forEach>
                                                            value="${reg.regionId}">${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.PrefecturesProvinces"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_prefecture" id="id_prefecture" multiple onchange="load_commune_by_pref(this)" ${dd}>
                                                <%--auto load dynamique--%>
                                                <c:forEach items="${lp}" var="p">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.prefectures}" var="pp">
                                                                ${pp.id_prefecture==p.id_prefecture?"selected":""}
                                                            </c:forEach>
                                                            value="${p.id_prefecture}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.communes"/></label>
                                            <select ${demande.interregion=="non"?"disabled":""} class="form-control select2 id_commune" id="id_commune" multiple onchange="saveCommuneDetailregion(this)" ${dd}>
                                                <%--auto load dynamique--%>
                                                <c:forEach items="${lc}" var="c" varStatus="loopp">
                                                    <option
                                                            <c:forEach items="${demande.detailRegion.communes}" var="cc">
                                                                ${cc.id_commune==c.id_commune?"selected":""}
                                                            </c:forEach>
                                                            value="${c.id_commune}">${pageContext.response.locale=='ar'?c.nom_ar:c.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-0 justify-content-center mb-3">
                                <div class="col-sm-12 mt-1 col-md-3">
                                    <button class="btn btn-success btn-block" onclick="affiche_eie_zone('#step1_2','#step_id1_2')"><spring:message code="button.Precedent"/> </button>
                                </div>
                                <c:if test="${type=='EE' || type=='NT'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="updateRegionDemandeInfomration('${type}','#id_demande_information','#step3','#step_id3',this)" >  <spring:message code="button.Suivant"/> </button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='AE'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button onclick="verif_champs1('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
                                    </div>
                                </c:if>
                                <c:if test="${type=='RS'}">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn-block" onclick="verif_champs1('step3','${type}','id_demande_information','#step4','#step_id4')" ><spring:message code="label.Afficherlerecapitulatif"/></button>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                    <c:if test="${type=='EE'}">
                        <div id="step3" class="col-12 z_collecteur ${demande.statut.id_statut_projet==12 && demande.type.equals('RS')?'':'collapse'}"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <form  class="form-horizontal mt-3" >
                                <c:forEach items="${doc}" var="dc">
                                    <div class="row justify-content-center">
                                        <div class="col mt-3  ">
                                            <div class="form-group">
                                                <div>
                                                    <label style="width: 100%;">${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr }</label>
                                                    <div class="upload">
                                                        <input required
                                                               onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','EE','id_demande_information','file-chosen_${dc.id_docImport}')"
                                                               accept=".pdf" type="file"
                                                               id="doc${dc.id_docImport }" class="actual-btn" hidden>
                                                        <label class="uploadButton" for="doc${dc.id_docImport }">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>

                                                        <!-- name of file chosen -->
                                                        <span class="fileName" id="file-chosen_${dc.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty docNotify}">
                                            <div class="col-2 mt-5">
                                                <c:forEach items="${docNotify}" var="d">
                                                    <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                        <a href="/downloadFile/${fn:replace(d.url,"/assets/myFile/","")}"
                                                           class="btn btn-success rounded file_existe"><span
                                                                class="fa fa-download"></span></a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                                <div class="row p-0 justify-content-center mb-3 mt-4">
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button class="btn btn-success btn-block ${demande.statut.id_statut_projet==12 && demande.type.equals('RS')?'d-none':''}"  onclick="affiche_eie_zone1()"><spring:message code="button.Precedent"/> </button>
                                    </div>
                                    <div class="col-sm-12 mt-1 col-md-3">
                                        <button onclick="verif_champs('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
                                    </div>
                                </div>



                                <div class="row m-0 p-0 mt-5">
                                    <div class="col-3">
                                    </div>
                                    <div class="col-6" style="text-align: center">


                                    </div>
                                    <div class="col-3">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="step4" class="col-12 z_collecteur collapse" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-4 mt-1 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step3','#step_id3')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-4 mt-1 col-sm-6">

                                    <button type="button" disabled
                                            onclick="changer_statut1('id_demande_information',1,'<spring:message code="label.Votredemandeestdeposeavecsucces"/>','${type}')"
                                            class="btn btn-success btn-block EnregisterEE"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:if>
                    <c:if test="${type=='RS'}">
                        <div id="step4" class="col-12 z_collecteur collapse" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-4 mt-1 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step2','#step_id2')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-4 mt-1 col-sm-6">

                                    <button type="button" disabled
                                            onclick="changer_statut2('${type}','id_demande_information',11,'<spring:message code="label.Votredemandeestdeposeavecsucces"/>')"
                                            class="btn btn-success btn-block EnregisterEE"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${type=='AE'}">
                        <div id="step4" class="col-12 z_collecteur collapse" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-4 mt-1 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step2','#step_id2')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-4 mt-1 col-sm-6">

                                    <button type="button" disabled
                                            onclick="changer_statut2('${type}','id_demande_information',1,'<spring:message code="label.Votredemandeestdeposeavecsucces"/>')"
                                            class="btn btn-success btn-block EnregisterEE"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${type=='NT'}">
                        <div id="step3" class="col-12 z_collecteur collapse" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" >
                            <form  class="form-horizontal mt-3" id="formdoc">
                                <c:forEach items="${doc}" var="dc">
                                    <div class="row justify-content-center">
                                        <div class="col mt-3  ">
                                            <div class="form-group">
                                                <div>
                                                    <label style="width: 100%;"> ${pageContext.response.locale=='ar'?dc.nom_ar:dc.nom_fr }</label>
                                                    <div class="upload">
                                                        <input required
                                                               onchange="addDocG('0',${dc.id_docImport},'doc${dc.id_docImport }','NT','id_demande_information','file-chosen_${dc.id_docImport}')"
                                                               accept=".pdf" type="file"
                                                               id="doc${dc.id_docImport }" class="actual-btn" hidden>
                                                        <label class="uploadButton" for="doc${dc.id_docImport }">${pageContext.response.locale=='ar'?'قم بتحميل الوثيقة':'Importer un fichier'}</label>

                                                        <!-- name of file chosen -->
                                                        <span class="fileName" id="file-chosen_${dc.id_docImport}">${pageContext.response.locale=='ar'?'لم تقم باختيار اي وثيقة':'Aucun fichier choisi'}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty docNotify}">
                                            <div class="col-2 mt-5">
                                                <c:forEach items="${docNotify}" var="d">
                                                    <c:if test="${d.docImport.id_docImport==dc.id_docImport}">
                                                        <a href="/downloadFile/${fn:replace(d.url,"/assets/myFile/","")}"
                                                           class="btn btn-success rounded file_existe"><span
                                                                class="fa fa-download"></span></a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>



                                <div class="row p-0 justify-content-center mb-3 mt-4">
                                    <div class="col-sm-12 mt-1 col-md-4">
                                        <button class="btn btn-success btn-block" onclick="affiche_eie_zone('#step2','#step_id2')"><spring:message code="button.Precedent"/> </button>
                                    </div>
                                    <div class="col-sm-12  mt-1 col-md-4">
                                        <button onclick="verif_champs('step3','${type}','id_demande_information','#step4','#step_id4')" class="btn btn-success btn-block" ><spring:message code="label.Afficherlerecapitulatif"/></button>
                                    </div>
                                </div>



                                <div class="row m-0 p-0 mt-5">
                                    <div class="col-3">
                                    </div>
                                    <div class="col-6" style="text-align: center">


                                    </div>
                                    <div class="col-3">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="step4" class="col-12 z_collecteur collapse" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                            <div id="recap_ee"></div>
                            <div class="row justify-content-center mt-2 mb-4">
                                <div class="col-md-4 mt-1 col-sm-6">
                                    <button type="button"
                                            onclick="affiche_eie_zone('#step3','#step_id3')"
                                            class="btn btn-success btn-block"><spring:message code="button.Precedent"/>
                                    </button>
                                </div>
                                <div class="col-md-4 mt-1 col-sm-6">

                                    <button type="button" disabled
                                            onclick="changer_statut2('${type}','id_demande_information',1,'<spring:message code="label.Votredemandeestdeposeavecsucces"/>')"
                                            class="btn btn-success btn-block EnregisterEE"><spring:message code="button.Enregistrer"/>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>

<script>

    function affiche_eie_zone1() {
        var interregion=$("#interregion").val();
        if(interregion == "${pageContext.response.locale=='ar'?'لا':'non'}"){
            affiche_eie_zone('#step1_2','#step_id1_2');
        }else{
            affiche_eie_zone('#step2','#step_id2')
        }
    }

    function updateDemandeInfomrationAE(form, id_name, step, id_btn_step,val) {

        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();

        if ($.trim(id) === "" || id == null) {
            return false;
        }
        var montant = $("input[name=montant_investissement]").val();
       // var ntp = $("#nature_projet").val();
        var textnat=$("#nature_projet").val();
        var intitule=$("#intitule").val();

        var btn = $(".file_existe");


        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }
        if ($.trim(intitule) == "" || $.trim(textnat) == "" || btn ==null) {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.TousLesChampsestobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }
        var se = $("#"+form).serialize();

      /*  $empty = $('#'+form).find("input").filter(function() {
            return this.value === "";
        });
        if($empty.length) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.TousLesChampsestobligatoire"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
            return false;
        }*/
            $('#loader_modal').modal('show');
            $.ajax({
                type: "GET",
                url: "/api/updateDemandeInfomrationAE/" + id,
                contentType: 'application/json; charset=utf-8',
                data: se,
                success: function (response) {
                    $('#loader_modal').modal('hide');
                    console.log("success : " + response);
                    affiche_eie_zone(step, id_btn_step);
                },
                error: function (response) {

                    alert('Erreur ajout non effectue');

                }
            });

    }

    function changer_statut2(type,id_name, code_statut, msg_alert) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id + "/" + type;
        var test = false;
        var tr = $("#formdoc").find("input[type=file]").closest(".row.justify-content-center");
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0 && !test) {
                $(input).addClass("bg_error");
                test = true
            }
        });
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.lenumerodeEIEnestpasvalide"/>", "error");
            return false;
        }
        if (test) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Unouplusieurchampssontvides"/>", "error");
        } else {
                Swal.fire({
                    title: "<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>",
                    showDenyButton: true,
                    showCancelButton: false,
                    confirmButtonText: `<spring:message code="label.enregistrer"/>`,
                    denyButtonText: `<spring:message code="label.Annuler"/>`,
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "/api/changerStatuts2/" + id + "/" + code_statut,
                            type: 'GET',
                            data: {},
                        })
                        Swal.fire({
                            title: '<strong>' + msg_alert + '</strong>',
                            icon: 'success',
                            html: '<a href="' + link_recap + '" class="btn btn-success ml-2 "><spring:message code="label.Recapitulation"/></a>',
                            showCloseButton: false,
                            showCancelButton: false,
                            showConfirmButton: false,
                            focusConfirm: false,
                        })
                    }else{
                        window.location.href="/api/ListeEie/"+type;
                    }
                })
            }

    }

    function searchByEE(id,type) {

        $.ajax({
            url: "/api/recapEieEdit/"+id+"/"+type,
            type: "GET",
            data: {},
            success: function (response) {
                $("#recap_ee").html(response);
                setTimeout(function(){
                    $(".EnregisterEE").removeAttr('disabled');
                }, 2000);
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });

    }
    function verif_champs(id_form, type, id_name, next_step, tap) {
        if(event!=null)
            event.preventDefault();
        var test = false;
        var tr = $("#" + id_form).find("input[type=file]").closest(".row.justify-content-center");
        var id = $("#" + id_name).val();
        $(tr).each(function (idx, el) {
            var input = $(el).find("input[type=file]");
            var files = $(input).prop('files');
            var btn = $(el).find(".file_existe");
            if ($(btn).length == 0 && files.length == 0) {
                $(input).parent().addClass("bg_error");
                test = true;
            }else{
                $(input).parent().removeClass("bg_error");
            }
        });
        //$(".cls_step").removeClass('active')
        //$(tap).addClass('active');
        //$(".z_collecteur").hide();
        //$(next_step).show();

        if (test) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.Unouplusieurchampssontvides"/>", "error");
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Unouplusieurchampssontvides"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
        } else {
            $("#step_id4").removeAttr("disabled");
            searchByEE(id, type);
            affiche_eie_zone(next_step,tap);
        }
    }
    function verif_champs1(id_form, type, id_name, next_step, tap) {
        if(event!=null)
            event.preventDefault();

        var region = ""
        var prefecture = "";
        var commune = "";

        var test = false;
        var id = $("#" + id_name).val();
        var trans = $("#interregion").val();
        var tmp = $("#id_region").val();

        if(trans == "${pageContext.response.locale=='ar'?'نعم':'oui'}" || type=="AE"){
            <%--if(tmp==null || tmp.length < 2){--%>
            <%--    swal({--%>
            <%--        title: "<spring:message code="label.Avertissement"/>",--%>
            <%--        text: "<spring:message code="label.Mercidechoisiraumoinsdeuxregions"/>",--%>
            <%--        type: "error",--%>
            <%--        showCancelButton: false,--%>
            <%--        confirmButtonColor: "#256144",--%>
            <%--        confirmButtonText: "<spring:message code="label.OK"/> ",--%>
            <%--        html: false--%>
            <%--    });--%>
            <%--    return false;--%>
            <%--}--%>
            region = $("#id_region").val().join();
            prefecture = $("#id_prefecture").val().join();
            commune = $("#id_commune").val().join();
        }else if(trans=="${pageContext.response.locale=='ar'?'لا':'non'}"){
            region = "0";
            prefecture = "0";
            commune = "0";
        }

        $("#step_id4").removeAttr("disabled");
        searchByEE(id, type);
        affiche_eie_zone(next_step,tap);
    }

    function changer_statut1(id_name, code_statut, msg_alert,type) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var link_recap = "/api/recapEie/" + id + "/" + type;
        if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
            swal("<spring:message code="label.Avertissement"/>", "<spring:message code="label.lenumerodeEIEnestpasvalide"/>", "error");
            return false;
        }
        Swal.fire({
            title: "<spring:message code="label.Sivouscliquezsurenregistrervousnepouvezplusmodifiervotredemande"/>",
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: `<spring:message code="label.enregistrer"/>`,
            denyButtonText: `<spring:message code="label.Annuler"/>`,
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: "/api/changerStatuts/" + id + "/" + code_statut,
                    type: 'GET',
                    data: {},
                })
                Swal.fire({
                    title: '<strong>' + msg_alert + '</strong>',
                    icon: 'success',
                    html: '<a href="' + link_recap + '" class="btn btn-success ml-2 "><spring:message code="label.Recapitulation"/></a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            }else{
                window.location.href="/api/ListeEie/"+type;
            }
        })
    }
    $(function() {
        // Initialize form validation on the registration form.
        // It has the name attribute "registration"
        $("form[name='formAvisProjet']").validate({




            // Specify validation rules
            rules: {
                raison_social: {
                    required: true
                },
                email: {
                    required: true
                },
                tel : {
                    required: true,
                },
                fax : {
                    required: true,
                    number : true,
                    minlength:10,
                    maxlength:10
                },



            },


            // Specify validation error messages
            messages: {
                raison_social: "<spring:message code="label.Silvousplaitremplirlenomdelasociete"/>",
                email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                form.submit();
            }


        });



    });

    function addDemandeInfomration(from,type,id,next_step,id_btn,val){
        event.preventDefault();
            if ($("form[name='formAvisProjet']").valid()) {
                var se = $("#"+from).serializeObject();
                $('#loader_modal').modal('show');
                $.ajax({
                    type: "POST",
                    url: "/api/addDemandeInformation/"+id+"/"+type,
                    contentType: 'application/json; charset=utf-8',
                    data:JSON.stringify(se),
                    success: function (response) {
                        $('#loader_modal').modal('hide');
                        $(".cls_step:not(.montab)").prop("disabled",false);
                        $(".cls_step").removeClass('active')
                        $(id_btn).addClass('active');
                        $(".z_collecteur").hide();
                        $(next_step).show();
                        $("#id_demande_information").val(response);
                    },
                    error: function (response) {
                        $('#loader_modal').modal('hide');
                        alert('Erreur ajout non effectue');

                    }
                });
            } else {
                return false
            }
    }

    function updateDemandeInfomrationEE(form, id_name, step, id_btn_step,val) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        if ($.trim(id) === "" || id == null) {
            return false;
        }

        var montant = $("input[name=montant_investissement]").val();
        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }

        var intutule = $("input[name=intitule_projet]").val();
        if (intutule === "") {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.TousLesChampsestobligatoire"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }



        var interegion=$("#interregion").val();


        var se = $("#"+form).serialize();

        $('#loader_modal').modal('show');

        $.ajax({
            type: "GET",
            url: "/api/updateDemandeInfomrationEE/" + id,
            contentType: 'application/json; charset=utf-8',
            data: se,
            success: function (response) {
                $('#loader_modal').modal('hide');
                if(interegion == "${pageContext.response.locale=='ar'?'لا':'non'}"){
                    affiche_eie_zone('#step3','#step_id3');
                }else{
                    affiche_eie_zone('#step2','#step_id2');
                }
                //affiche_eie_zone(step, id_btn_step);
            },
            error: function (response) {
                $('#loader_modal').modal('hide');
                alert('Erreur ajout non effectue');

            }
        });
    }

    function updateDemandeInfomrationRS(form, id_name, step, id_btn_step) {
        if (event != null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        if ($.trim(id) === "" || id == null) {
            return false;
        }

        var montant = $("input[name=montant_investissement]").val();
        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }

            var intutule = $("input[name=intitule_projet]").val();
            if (intutule === "") {

                swal({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "<spring:message code="label.TousLesChampsestobligatoire"/> ",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "<spring:message code="label.OK"/> ",
                    html: false
                });
                return false;
            }


        var interegion=$("#interregion").val();


        var se = $("#"+form).serialize();

        $.ajax({
            type: "GET",
            url: "/api/updateDemandeInfomrationEE/" + id,
            contentType: 'application/json; charset=utf-8',
            data: se,
            success: function (response) {
                if(interegion == "${pageContext.response.locale=='ar'?'لا':'non'}"){
                    affiche_eie_zone('#step4','#step_id4');
                }else{
                    affiche_eie_zone('#step2','#step_id2');
                }
            },
            error: function (response) {
                alert('Erreur ajout non effectue');
            }
        });
    }

    function updateDemandeInfomration(form, id_name, step, id_btn_step,val) {
        if (event != null)
            event.preventDefault();

        $("#"+form).validate();
        var id = $("#" + id_name).val();
        if ($.trim(id) === "" || id == null) {
            return false;
        }

        var montant = $("input[name=montant_investissement]").val();
        if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }
        var intitule = $("input[name=intitule_projet]").val();
        if ($.trim(intitule) == "" || intitule == null) {
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsMontantdinvestissementestincorrecte"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.LechampsIntituleprojetestobligatoire"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/> ",
                html: false
            });
            return false;
        }

        var se = $("#"+form).serialize();

        $('#loader_modal').modal('show');
        $.ajax({
            type: "GET",
            url: "/api/updateDemandeInfomration/" + id ,

            data: se,
            success: function (response) {
                $('#loader_modal').modal('hide');
                console.log("success : " + response);
                affiche_eie_zone(step, id_btn_step);
            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });
    }


    function updateRegionDemandeInfomration(type, id_name, next_step, id_btn,val) {
        if(event!=null)
            event.preventDefault();

        var region = ""
        var prefecture = "";
        var commune = "";

        var trans = $("#interregion").val();
        if (trans == "${pageContext.response.locale=='ar'?'لا':'non'}") {
            if (next_step != "end") {
                $(".cls_step").removeClass('active')
                $(id_btn).addClass('active');
                $(".z_collecteur").hide();
                $(next_step).show();
                return false;
            } else if (next_step == "end") {
                // window.location.href = "/api/ListeEie/"+type;

            }
        }


        var tmp = $("#id_region").val();
        if(trans == "${pageContext.response.locale=='ar'?'نعم':'oui'}" && type!="NT" && type!='AE' ){
            if( tmp.length < 2 ){
                swal({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "<spring:message code="label.Mercidechoisiraumoinsdeuxregions"/>",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "<spring:message code="label.OK"/> ",
                    html: false
                });
                return false;
            }
        }

        if(trans == "${pageContext.response.locale=='ar'?'نعم':'oui'}" || type=="AE" || type=="NT" ){
            region = $("#id_region").val().join();
            prefecture = $("#id_prefecture").val().join();
            commune = $("#id_commune").val().join();
        }else if(trans=="${pageContext.response.locale=='ar'?'لا':'non'}"){
            region = "0";
            prefecture = "0";
            commune = "0";
        }



        var formdata = new FormData();
        formdata.append('region', region);
        formdata.append("prefecture", prefecture);
        formdata.append('commune', commune);

        var id = $("#id_demande_information").val();
        var link_recap = "/api/recapEie/" + id+"/"+type;
        $('#loader_modal').modal('show');
        $.ajax({
            type: "POST",
            url: "/api/updateRegionDemandeInformation/" + id + "/" + type,
            contentType: false,
            processData: false,
            data: formdata,
            success: function (response) {
                $('#loader_modal').modal('hide');
                if (next_step != "end") {
                    $(".cls_step").removeClass('active')
                    $(id_btn).addClass('active');
                    $(".z_collecteur").hide();
                    $(next_step).show();
                } else if (next_step == "end") {
                    Swal.fire({
                        title: "<strong><spring:message code="label.Votredemandeestdeposeavecsucces"/> </strong>",
                        icon: 'success',
                        html:'<a href="' + link_recap + '" class="btn btn-success ml-2 "><spring:message code="label.Recapitulation"/></a>',
                        showCloseButton: false,
                        showCancelButton: false,
                        showConfirmButton: false,
                        focusConfirm: false,
                    })
                }
            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });

    }
</script>
