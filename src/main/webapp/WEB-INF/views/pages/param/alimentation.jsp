
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


            <div class="col-lg-12 grid-margin grid-margin-md-0">
              <div class="card crdt">
              <!-- debut from etat dossier -->
                      <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px;">
    					           <div class="row p-0 m-0 justify-content-center">
                           <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
                              <div class="photo  hvr-buzz-out" >
                                  <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                              </div>
                                <div class="card">
                                   <div class="row justify-content-center">
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">
                                        
                                      </div>
                                    </div>
                                          <div class="col-10 mt-4">
                                            <h3 style="float:right;color:black">Historique Alimentation</h3>
                                            <div class="row p-0 m-0 mt-5">
                               
                              
                                              </div>
                                              
                                                    <div class="row">
	                                              <div class="col-6">
	                                                <div class="form-group">
	                                                   <label>Magasin</label>
	                                                  <select class="form-control" id="magasin">
	                                                   <c:forEach items="${magasin}" var="dd">
	                                                   <option ${ep.magasin.magasinId==dd.magasinId ? "selected":"" } value="${dd.magasinId }">${dd.nom }</option>
	                                                   </c:forEach>
	                                                 </select>
	                                                </div>
	                                              </div>
                                              
                                              
	                                                <div class="col-6">
	                                                <div class="form-group">
	                                                  <label>Article</label>
	                                                  
												<input  data-choose=${ep.article.articleId } value=${ep.article.reference }  onkeyup="autoArticle('dirtResultat','dirtFan',this.value,'article')" style="background: rgba(255, 255, 255, 0.7);" type="text" data-choose="0" id="article" name="article" autocomplete="off" class="header-email-mdp centerDiv form-control" placeholder=""/>
												<div id="dirtResultat">
			  										<ul id="dirtFan" class="">
												 	</ul>
											   	</div>
											</div>
	                                                
	                                                </div>
                                              </div>
                                              
                                              <div class="row">
                                              <div class="col-6">
                                                <div class="form-group">
                                                  <label>Quantite</label>
                                                  <input   type="text" id="quantite" class="form-control"  value="${ep.quantite}" >
                                                  <input   type="hidden" id="id"  value="${ep.historiqueReceptionId}">
                                                </div>
                                              </div>
                                              <div class="col-6">
                                                <div class="form-group">
                                                  <label>Date</label>
                                                  
                                                <fmt:formatDate var="dates" pattern = "dd/MM/yyyy"  value = "${ep.date}" />
         
                                                  <input  required type="text" id="date" class="form-control datepicker"    value="${dates}">
                                                                                               </div>
                                                
                                              </div>
                                              
                                              </div>
                                              
                                              
                                              
                                              
                                              
                                        
                                              
                                              </div>
                                            
                                            
                                              <div class="row">
                                            
                                              </div>
                                              
                                              
                                            </div>
                                            </div>
                                            <div class="row  mb-4" style="margin:14px;">
                                              <button class="btn btn-primary btn-block btnTo" onclick="addArticle()" > Enregistrer</button>
                                             <button class="btn btn-secondary btn-block" onclick="traitement_(0)" style="background: #f9ea5f;"> Annuler</button>
                                           
                                          </div>
                                         </div>
                                      </div>
                                   </div>
              				</div>
                      
                       <!-- fin etat Dossier -->

              
                <div class="card-body">


     <!-- Début tableau paramètre "Etat de dossiers"-->
                      <div class="col-12 grid-margin stretch-card z_tab" id="subtab_0"  >
                        <div class="card">
                        
                           <div class="row justify-content-center">
                           
                             <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >
                               
                               <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                               <div class="row p-4 justify-content-center">
                                 <div class="col-8">
                                   <div class="row p-0">
                                     <div class="col-12">
                                       <div class="form-group">
                                         <label>Famille</label>
                                         <input type="text" name="desi" class="form-control">
                                       </div>
                                     </div>
                                     <div class="col-12">
                                       <div class="form-group">
                                         <label>D�signation</label>
                                         <input type="text" name="detail" class="form-control">
                                       </div>
                                     </div>
                                   </div>
                                   <div class="row p-0 justify-content-end">
                                     <div class="col-12">
                                       <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')">rechercher</button>
                                     </div>
                                   </div>
                                 </div>
                               </div>
                             </div>
                             <div class="col-11 pr-0">
                               <div class="row m-0 pt-5">
                                 <div class="col-3 pl-0">
                                   <h2>Stock Magasins de vente</h2>

                                 </div>
                                 <div class="col-9 ">
                                   <a class="btn btn-primary float-right text-white" onclick="frm_table('subtab_0','frm_etatDoss')">
                                     Nouvelle Alimentation
                                   </a>
                                   
                                     
                                 </div>
                               </div>
                             </div>

                           </div>

                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                             <div class="modal-dialog">
                             <div class="modal-content">
                             <div class="modal-header">
                             <h5 class="modal-title" id="exampleModalLabel">Filtrer</h5>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                             </button>
                             </div>
                             <div class="modal-body">
                             <div class="row text-dark">
                             <div class="col-12 table-responsive">
                             <table class="table table-bordered table-hover">
                                 <thead>
                                   <tr>
                                     <th>Colonne</th>
                                     <th>Etat</th>
                                   </tr>
                                 </thead>
                                 <tbody>
                                   <tr>
                                     <td>Nom</td>
                                     <td>
                                       <div class="custom-control custom-checkbox custom-switch">
                                         <input name="col_0" type="checkbox" class="custom-control-input" id="col_0" checked>
                                         <label class="custom-control-label" for="col_0"></label>
                                       </div>
                                     </td>
                                   </tr>
                                   <tr>
                                     <td>Description</td>
                                     <td>
                                       <div class="custom-control custom-checkbox custom-switch">
                                         <input name="col_1" type="checkbox" class="custom-control-input" id="col_1" checked>
                                         <label class="custom-control-label" for="col_1"></label>
                                       </div>
                                     </td>
                                   </tr>
                                 </tbody>
                             </table>
                             </div>
                             </div>
                             </div>
                             <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                             <button type="button" class="btn btn-primary" data-dismiss="modal">Enregistrer</button>
                             </div>
                             </div>
                             </div>
                           </div>



                           <div class="row justify-content-center">
                             <div class="col-11 pt-4">
                                 <table id="tableProfils" class="table table-striped hover compact table-bordered text-md-nowrap">
                                     <thead class="thead-bleu">
                                       <tr>
                                         
                                         <th class="text-center">Magasin</th>
                                          <th class="text-center">Reference</th>
                                          <th class="text-center">Quantite</th>
                                           
                                            <th class="text-center">Date</th>
                                            
                                         <th class="text-center">Action</th>
                                       </tr>
                                     </thead>
                                     <tbody>
                                     
                                         
                                   
                                    <c:forEach items="${listF}" var="ff">
                                    <tr  id="tr-${ff.historiqueAlimentationId }">
                                    
                                         
                                         <td>${ff.magasin.nom}</td>
                                         <td>${ff.article.reference}</td>
                                         <td>${ff.quantite}</td>
                                         <td><fmt:formatDate type = "date"   value = "${ff.date}" />
			</td>
                                      
                             
                                         <td class="text-center">
                                           <ul class="list-inline m-0">
                                             <li class="list-inline-item">
                         
                                                  <button onclick="frm_tables('subtab_0','frm_etatDoss',${ff.historiqueAlimentationId})" class="btn btn-warning btn-sm rounded-circle tab_edit" type="button" data-toggle="tooltip" data-placement="top" title="Editer">
                                                 <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                     viewBox="0 0 469.336 469.336" style="enable-background:new 0 0 469.336 469.336;" xml:space="preserve" width="20px">
                                                  <g>
                                                    <g>
                                                      <g>
                                                        <path d="M347.878,151.357c-4-4.003-11.083-4.003-15.083,0L129.909,354.414c-2.427,2.429-3.531,5.87-2.99,9.258
                                                          c0.552,3.388,2.698,6.307,5.76,7.84l16.656,8.34v28.049l-51.031,14.602l-51.51-51.554l14.59-51.075h28.025l8.333,16.67
                                                          c1.531,3.065,4.448,5.213,7.833,5.765c0.573,0.094,1.146,0.135,1.708,0.135c2.802,0,5.531-1.105,7.542-3.128L317.711,136.26
                                                          c2-2.002,3.125-4.712,3.125-7.548c0-2.836-1.125-5.546-3.125-7.548l-39.229-39.263c-2-2.002-4.708-3.128-7.542-3.128h-0.021
                                                          c-2.844,0.01-5.563,1.147-7.552,3.159L45.763,301.682c-0.105,0.107-0.1,0.27-0.201,0.379c-1.095,1.183-2.009,2.549-2.487,4.208
                                                          l-18.521,64.857L0.409,455.73c-1.063,3.722-0.021,7.736,2.719,10.478c2.031,2.033,4.75,3.128,7.542,3.128
                                                          c0.979,0,1.958-0.136,2.927-0.407l84.531-24.166l64.802-18.537c0.195-0.056,0.329-0.203,0.52-0.27
                                                          c0.673-0.232,1.262-0.61,1.881-0.976c0.608-0.361,1.216-0.682,1.73-1.146c0.138-0.122,0.319-0.167,0.452-0.298l219.563-217.789
                                                          c2.01-1.991,3.146-4.712,3.156-7.558c0.01-2.836-1.115-5.557-3.125-7.569L347.878,151.357z"/>
                                                        <path d="M456.836,76.168l-64-64.054c-16.125-16.139-44.177-16.17-60.365,0.031l-39.073,39.461
                                                          c-4.135,4.181-4.125,10.905,0.031,15.065l108.896,108.988c2.083,2.085,4.813,3.128,7.542,3.128c2.719,0,5.427-1.032,7.51-3.096
                                                          l39.458-39.137c8.063-8.069,12.5-18.787,12.5-30.192S464.899,84.237,456.836,76.168z"/>
                                                      </g>
                                                    </g>
                                                  </g>
                                                  </svg>

                                               </button>
                                             </li>
                                            
                                           </ul>
                                         </td>
                                       </tr>
                                    </c:forEach>
                                       
                                     </tbody>
                                 </table>
                             </div>
                           </div>
                        
  <div class="text-center" dir="rtl">
							  	<c:if test="${(page)>0}">
									<c:set value="${page-1}" var="page_db"/>
									<c:set value="${totalPage-1}" var="page_LAST"/>
								</c:if>
								<c:if test="${(page)<=0}">
									<c:set value="0" var="page_db"/>
									<c:set value="0" var="page_LAST"/>
								</c:if>
							    <a  style="font-size: 20px;  onclick="list(0,6)"   class="btnss" ><span class="fa fa-fast-forward"></span></a>
							    <a  style="font-size: 26px;  onclick="list(${page_db},6)" class="btnss" ><span class="fa fa-arrow-circle-right"></span></a>
							
							    <c:set var = "salary"  value = "${totalPage-page-1}"/>
							    <c:choose>
							    	<c:when test="${salary>5 }">
							    		<c:set var = "toAdd"  value = "5"/>
							  		</c:when>
							  		<c:otherwise>
							  			<c:set var = "toAdd"  value = "${totalPage-page-1}"/>
									</c:otherwise>
								</c:choose>
							
							    <c:if test="${totalPage>0}">
								<c:forEach begin="${page}" end="${page+toAdd}" var="c">
									<a style="font-size: 26px; style="border-radius: 50%;"  onclick="list(${c},6)"  ${c==number ? 'class=" btnss active"' : 'class="btnss"'}>${c+1}</a>
								</c:forEach> 
								</c:if>
								<c:if test="${(page)>=(totalPage-1)}">
									<c:set value="${totalPage-1}" var="page_end"/>
								</c:if>
								
								<c:if test="${(page)<(totalPage-1)}">
									<c:set value="${page+1}" var="page_end"/>
								</c:if>
								
								<a  style="font-size: 26px; onclick="list(${page_end},6)"  class="btnss"   ><span class="fa fa-arrow-circle-left"></span></a>
							   <a   style="font-size: 20px; onclick="list(${page_LAST},6)" class="btnss" ><span class="fa fa-fast-backward"></span></a>
						</div>
	
	
	</div>

                        </div>

                        </div>
                      </div>


 </div>
 
                      </div>



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" >
<!--

//-->
</script>

<script type="text/javascript">

function list(page, size) {
	getFunctionParam("/api/getParamAlimentation/"+page+"/"+size);
}







function convertDate(date)
{
	
	var datetblighFo = moment(date, "DD/MM/YYYY");
    var datetb =datetblighFo.format('YYYY-MM-DD');
    var mydate = new Date(datetb);
    return  mydate
}


function addArticle(){
	
	
	
	var article=$("#article").attr("data-choose");
	var quantite=$("#quantite").val();
	var magasin=$("#magasin").val();
	var date=$("#date").val();
	var id=$("#id").val();
	
	var dates = convertDate(date); 
	
	
	
	var reception={
			
			"quantite":quantite,
			"date":dates,
			"article":{"articleId":article},
			"magasin":{"magasinId":magasin},
			"historiqueAlimentationId":id,
			
	}
	
	
	
	$('#codeLabel2').css("display","none");
		
					$.ajax({
						 type: "POST",     
				         url :"/addHistoriqueAlimentation",
				         contentType : 'application/json; charset=utf-8',
				         data : JSON.stringify(reception),
				         
						success : function(response) {
							$(".mpParam").html(response);
						},
						error : function(response) {
							alert('Erreur ajout impossible');
						}
					}); 
}
	
	
	
	
	/*  delete famille  begin */
	
	function delete_Alimentation(id){
		
		$.ajax({
			 type : "POST",
			 url :"/deleteAlimentation",
			data:{
				"id":id
			},
			 success : function(data) {
				
				 $("#tr-"+id).css("display","none");
			 },
			 error : function(response) {
					alert("error delete function failed")
				}
		 });
		
	}
	
	
	
	/*  delete famille  end */
	
	function checkCode(val){
		
		$('#codeLabel2').css("display","none");
		$.ajax({
			 type : "GET",
			 url :"/checkTraitement",
			 data:{
				 'nom':val
			 },
			 success : function(data) {
				 /* alert()  */
				 if(data=="oui"){
					
					$('#codeLabel2').css("display","block");
					$("#codeLabel").prop("disabled", true);

				 }
				 else{
				
					 $("#codeLabel").prop("disabled", false);
				 }
				 
				
			 },
			 error : function(response) {
					alert("error check function failed")
				}
		 });
		
	}
	
	function frm_tables(id_tab,id_form,id){
		
	      $.ajax({
				 type : "GET",
				 url :"/api/getOneHistoriqueAlimentation",
				 data:{
					 'id':id
				 },
				 success : function(data) {
					 $(".mpParam").html(data);
					 $("#"+id_tab).hide("slow");
				      $("#"+id_form).show("slow");
					 
					
				 },
				 error : function(response) {
						alert("error check function failed")
					}
			 });
			
	    }
	
	
	
	  
</script>



 


 

<jsp:include page="../../includes/footer.jsp" />
