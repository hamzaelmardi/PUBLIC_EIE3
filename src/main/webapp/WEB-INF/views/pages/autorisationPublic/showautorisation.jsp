<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>



<jsp:include page="card.jsp" />



<div class="row justify-content-center">
    <div class="col-10">
        <div class="row m-0 p-0 mt-5" style="padding: 30px !important; padding: 12px;  ">



            <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

                <h3 ><spring:message code="label.Dossiers" />  </h3>
            </div>


            <div id="blockOnershow" class="col-5">
                <input type="hidden" value="2" name="id_composdossier"><input type="hidden" value="4" name="id_notif">
                <div class="doc_notifi d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> DOC Notification </div><div> <input type="checkbox" <c:if test="${cm.doc_notifi=='on'}"> checked  </c:if> disabled name="doc_notifi" onclick="grtcheck()" id="check_doc_notifi"><a target="_blank"  <c:if test="${cm.doc_notifi=='on'}"> href="/upload/${cmd.doc_notifi}" </c:if> ><i class="fa fa-download" <c:if test="${cm.doc_notifi!='on'}">style="color: red"></c:if> <c:if test="${cm.doc_notifi=='on'}">style="color: blue"></c:if></i></a></div></div>
                <div class="doc_mouvement d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> DOC Mouvement</div> <div> <input type="checkbox" <c:if test="${cm.doc_mouvement=='on'}"> checked  </c:if> disabled name="doc_mouvement" onclick="grtcheck()" id="check_doc_mouvement"><a target="_blank" <c:if test="${cm.doc_mouvement=='on'}"> href="/upload/${cmd.doc_mouvement}" </c:if> ><i class="fa fa-download" style="text-align: right;color: red"></i></a></div></div>
                <div class="garantie_Financiere d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Garantie Financièreppp </div> <div> <input  type="checkbox" <c:if test="${cm.garantie_Financiere=='on'}"> checked  </c:if> disabled name="garantie_Financiere" onclick="grtcheck()" id="check_garantie_Financiere"><a target="_blank" <c:if test="${cm.garantie_Financiere=='on'}"> href="/upload/${cmd.garantie_Financiere}" </c:if> ><i class="fa fa-download" <c:if test="${cm.garantie_Financiere=='on'}">style="color: blue"></c:if><c:if test="${cm.garantie_Financiere!='on'}">style="color: red"></c:if> </i></a></div></div>
                <div class="contrat d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Contrat</div> <div> <input type="checkbox" <c:if test="${cm.contrat=='on'}"> checked  </c:if> disabled name="contrat" onclick="grtcheck()" id="check_contrat"><a target="_blank"  <c:if test="${cm.contrat=='on'}"> href="/upload/${cmd.contrat}" </c:if> ><i class="fa fa-download" <c:if test="${cm.contrat!='on'}">style="color: red"></c:if> <c:if test="${cm.contrat=='on'}">style="color: blue"></c:if> </i></a></div></div>
                <div class="analyses_fiche d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Analyses/Fiche d’identification DD</div> <div> <input type="checkbox" <c:if test="${cm.analyses_fiche=='on'}"> checked  </c:if> disabled name="analyses_fiche" onclick="grtcheck()" id="check_analyses_fiche"><a target="_blank" <c:if test="${cm.analyses_fiche=='on'}"> href="/upload/${cmd.analyses_fiche}" </c:if> ><i class="fa fa-download" <c:if test="${cm.analyses_fiche!='on'}">style="color: red"></c:if> <c:if test="${cm.analyses_fiche=='on'}">style="color: blue"></c:if>  </i></a></div></div>
                <div class="cap d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> CAP</div> <div> <input type="checkbox" <c:if test="${cm.cap=='on'}"> checked  </c:if> disabled name="cap" onclick="grtcheck()" id="check_cap"><a target="_blank" <c:if test="${cm.cap=='on'}"> href="/upload/${cmd.cap}" </c:if> ><i class="fa fa-download" <c:if test="${cm.cap=='on'}">style="color: blue"></c:if> <c:if test="${cm.cap!='on'}">style="color: red"></c:if> </i></a></div></div>
                <div class="autorisation_exploitation d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Autorisation d’exploitation l’installation</div> <div> <input type="checkbox" <c:if test="${cm.autorisation_exploitation=='on'}"> checked  </c:if>  disabled name="autorisation_exploitation" onclick="grtcheck()" id="check_autorisation_exploitation"><a target="_blank" <c:if test="${cm.autorisation_exploitation=='on'}"> href="/upload/${cmd.autorisation_exploitation}" </c:if> ><i class="fa fa-download" <c:if test="${cm.autorisation_exploitation!='on'}">style="color: red"></c:if> <c:if test="${cm.autorisation_exploitation=='on'}">style="color: blue"></c:if> </i></a></div></div>
            </div>
            <div id="blocktworshow" class="col-7">
                <div class="autorisation_installation d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Autorisation de l’installation </div><div> <input type="checkbox" <c:if test="${cm.autorisation_installation=='on'}"> checked  </c:if> disabled name="autorisation_installation" onclick="grtcheck()" id="check_autorisation_installation"><a target="_blank" <c:if test="${cm.autorisation_installation=='on'}">  href="/upload/${cmd.autorisation_installation}" </c:if> ><i class="fa fa-download"  <c:if test="${cm.autorisation_installation=='on'}">style="color: blue"></c:if> <c:if test="${cm.autorisation_installation!='on'}">style="color: red"></c:if> </i></a></div></div>
                <div class="assurance_responsabilite d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Assurance  Responsabilité Civile </div><div> <input type="checkbox" <c:if test="${cm.assurance_responsabilite=='on'}"> checked  </c:if> disabled name="assurance_responsabilite" onclick="grtcheck()" id="check_assurance_responsabilite"><a target="_blank" <c:if test="${cm.assurance_responsabilite=='on'}"> href="/upload/${cmd.assurance_responsabilite}" </c:if> ><i class="fa fa-download" <c:if test="${cm.assurance_responsabilite!='on'}">style="color: red"></c:if> <c:if test="${cm.assurance_responsabilite=='on'}">style="color: blue"></c:if> </i></a></div></div>
                <div class="autorisation_collecte d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Autorisation de Collecte et transport </div><div> <input type="checkbox"  <c:if test="${cm.autorisation_collecte=='on'}"> checked  </c:if>  disabled name="autorisation_collecte" onclick="grtcheck()" id="check_autorisation_collecte"><a target="_blank" <c:if test="${cm.autorisation_collecte=='on'}"> href="/upload/${cmd.autorisation_collecte}" </c:if> ><i class="fa fa-download" <c:if test="${cm.autorisation_collecte=='on'}">style="color: blue"></c:if> <c:if test="${cm.autorisation_collecte!='on'}">style="color: red"></c:if> </i></a></div></div>
                <div class="declaration_honneur d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Déclaration  l’honneur l’exactitude </div><div> <input type="checkbox"  <c:if test="${cm.declaration_honneur=='on'}"> checked  </c:if>  disabled name="declaration_honneur" onclick="grtcheck()" id="check_declaration_honneur"><a target="_blank" <c:if test="${cm.declaration_honneur=='on'}">href="/upload/${cmd.declaration_honneur}" </c:if> ><i class="fa fa-download"  <c:if test="${cm.declaration_honneur=='on'}">style="color: blue"></c:if> <c:if test="${cm.declaration_honneur!='on'}">style="color: red"></c:if>  </i></a></div></div>
                <div class="cahier_charge d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Cahier de charge </div><div> <input type="checkbox" <c:if test="${cm.cahier_charge=='on'}"> checked  </c:if>  disabled name="cahier_charge" onclick="grtcheck()" id="check_cahier_charge"><a target="_blank" <c:if test="${cm.cahier_charge=='on'}">href="/upload/${cmd.cahier_charge}" </c:if>  ><i class="fa fa-download" <c:if test="${cm.cahier_charge=='on'}">style="color: blue"></c:if> <c:if test="${cm.cahier_charge!='on'}">style="color: red"></c:if> </i></a></div></div>
                <div class="demandeautorisation d-flex justify-content-between"><div><i class="fa fa-file-pdf"></i> Demande Autorisation </div><div> <input type="checkbox" <c:if test="${cm.demandeautorisation=='on'}"> checked  </c:if>  disabled name="demandeautorisation" onclick="grtcheck()" id="check_demandeautorisation"><a target="_blank" <c:if test="${cm.demandeautorisation=='on'}"> href="/upload/${cmd.demandeautorisation}" </c:if>><i class="fa fa-download" <c:if test="${cm.demandeautorisation=='on'}">style="color: blue"></c:if> <c:if test="${cm.demandeautorisation!='on'}">style="color: red"></c:if> </i></a></div></div>
            </div>

        </div>
    
        <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

                    <h3 > Notification </h3>
                </div>
            <table class="table">
                  <thead  style="background:#336c4e">
                    <tr>
                      <th scope="col" style="color:white">#</th>
                      <th scope="col" style="color:white">N° Notification</th>
                      <th scope="col" style="color:white">Source</th>
                      <th scope="col" style="color:white">Type</th>
                      <th scope="col" style="color:white">Unite</th>
                      <th scope="col" style="color:white">Quantité</th>
                      <th scope="col" style="color:white">Traitement/Valorisation</th>
                       <th scope="col" style="color:white">code</th>

                    </tr>
                  </thead>
                  <tbody>
        <tr>
          <th scope="row">1</th>
          <td>${notif.num_notification}</td>
          <td>${notif.source==1?"source1":""}${notif.source==2?"source2":""}${notif.source==3?"source3":""}${notif.source==4?"source4":""}
     </td>

          <td>${notif.type==1?"type1":""}${notif.type==2?"type2":""}${notif.type==3?"type3":""}${notif.type==4?"type4":""}</td>
          <td>${notif.unite==1?"KG":""}${notif.unite==2?"L":""}${notif.unite==3?"M":""}${notif.unite==4?"KM":""}</td>

          <td>${notif.quantite}</td>
          <td>${notif.val_ou_trait }</td>
          <td>${notif.code==1?"code1":""}${notif.code==2?"code2":""}${notif.code==3?"code3":""}${notif.code==4?"code4":""}</td>





        </tr>


      </tbody>
            </table>
        </div>



        <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

            <h3 > Notification Détail </h3>
            </div>
            <table class="table">
                <thead  style="background:#336c4e">
                <tr>
                    <!--Notifications-->

                    <th scope="col" style="color:white">Premier départ</th>
                    <th scope="col" style="color:white">Dernier départ</th>
                    <th scope="col" style="color:white">Type conditionnement</th>
                    <th scope="col" style="color:white">Prescriptions spéciales </th>
                    <th scope="col" style="color:white">Nom Zone</th>
                    <th scope="col" style="color:white">Nom destination</th>
                    <th scope="col" style="color:white">Bureaux</th>
                    <th scope="col" style="color:white">Identification</th>

                </tr>
                </thead>
                <tbody>
                <tr>

                    <!-- Notifications -->

                    <td>${n.premierdepart}</td>
                    <td>${n.dernierdepart}</td>
                    <td> ${n.conditionement} </td>
                    <td>${n.prescription} </td>
                    <td>${n.zoneFranche} </td>
                    <td>${n.destributionfinal} </td>
                    <td>${n.bureau} </td>
                    <td>${n.codeOperation} </td>



                </tr>


                </tbody>
            </table>
        </div>



        <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

            <h3> Importateur Notification</h3>
        </div>
        <table class="table">
            <thead  style="background:#336c4e">
            <tr>
                <!--Importateur Notification-->

                <th scope="col" style="color:white"><spring:message code="label.nom"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Adresse"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.telephone"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.personneacontacter"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Fax"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.email"/> </th>

            </tr>
            </thead>
            <tbody>
            <tr>

                <!-- Importateur Notification -->

                <td>${n.importeur.nom}</td>
                <td>${n.importeur.adresse}</td>
                <td> ${n.importeur.telephone} </td>
                <td></td>
                <td>${n.importeur.fax} </td>
                <td>${n.importeur.email} </td>


            </tr>


            </tbody>
        </table>
        </div>




        <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

            <h3> Transporteur(s) prévu :</h3>
        </div>
        <table class="table">
            <thead  style="background:#336c4e">
            <tr>
                <!--Importateur Notification-->

                <th scope="col" style="color:white"><spring:message code="label.nom"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Adresse"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.telephone"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.personneacontacter"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Fax"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.email"/> </th>

            </tr>
            </thead>
            <tbody>
            <tr>

                <!-- Importateur Notification -->
    <c:forEach items="${n.transporteur}" var="t" varStatus="loop">
                <td>${t.nom}</td>
                <td>${t.adresse}</td>
                <td> ${t.telephone} </td>
                <td></td>
                <td>${t.fax} </td>
                <td>${t.mail} </td>
    </c:forEach>


            </tr>


            </tbody>
        </table>
        </div>





        <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">

            <h3> <spring:message code="label.producteursdesdechets"/></h3>
        </div>
        <table class="table">
            <thead  style="background:#336c4e">
            <tr>
                <!--Producteur(s) des déchets-->

                <th scope="col" style="color:white"><spring:message code="label.nom"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Adresse"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.telephone"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.personneacontacter"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.Fax"/> </th>
                <th scope="col" style="color:white"><spring:message code="label.email"/> </th>

            </tr>
            </thead>
            <tbody>
            <tr>

                <!-- Producteur(s) des déchets -->

                <td>${n.producteur.nom}</td>
                <td>${n.producteur.adresse}</td>
                <td> ${n.producteur.telephone} </td>
                <td></td>
                <td>${n.producteur.fax} </td>
                <td>${n.producteur.mail} </td>


            </tr>


            </tbody>
        </table>
        </div>



    <!-- Entreprise -->
        <div class="row m-0 p-0 mt-5">
         <div class="col-md-12" style="text-align: center; margin-bottom: 22px;">
   
                <h3><spring:message code="label.Informationdelentreprise"/> </h3>
            </div>
   <table class="table">
  <thead style="background:#336c4e">
    <tr>
      <th scope="col" style="color:white">#</th>
      <th scope="col" style="color:white"><spring:message code="label.Patente"/> </th>
      <th scope="col" style="color:white"><spring:message code="label.NomEntreprise"/> </th>
      <th scope="col" style="color:white"><spring:message code="label.telephone"/></th>
      <th scope="col" style="color:white"><spring:message code="label.Adresse"/></th>
      <th scope="col" style="color:white"><spring:message code="label.RepresentantdelEntreprise"/> </th>
      <th scope="col" style="color:white"><spring:message code="label.email"/></th>
       <th scope="col" style="color:white"><spring:message code="label.Fax"/></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>${entreprise.num_patente}</td>
      <td>${entreprise.nom_entreprise}</td>
      
      <td>${entreprise.telephone}</td>
      <td>${entreprise.adresse}</td>
      
      <td>${entreprise.represent_entreprise}</td>
      <td>${entreprise.email}</td>
      <td>${entreprise.fax}</td>
      
    </tr>
    
    
  </tbody>
</table>
           
          
        </div>









    </div>







