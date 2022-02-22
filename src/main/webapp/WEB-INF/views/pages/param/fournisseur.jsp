
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
                                            <h3 style="float:right;color:black">Fournisseur</h3>
                                            <div class="row p-0 m-0 mt-5">
                               
                              
                                              </div>
                                              
                                              
                                              <div class="row">
                                              <div class="col-6">
                                                <div class="form-group">
                                                  <label>Code</label>
                                                  <input   type="text" id="code" class="form-control">
                                                <label id="codeLabel" style="display:none">Entrez un nouveau Code</label>
                                                <input   type="hidden" id="testAjout" value="0">
                                               
                                                
                                                </div>
                                              </div>
                                              <div class="col-6">
                                                <div class="form-group">
                                                  <label>Nom</label>
                                                  <input  required type="text" id="nom" class="form-control">
                                               </div>
                                                
                                              </div></div>
                                              
                                              
                                            </div>
                                            </div>
                                            <div class="row  mb-4" style="margin:14px;">
                                              <button  class="btn btn-primary btn-block btnTo" onclick="addFournisseur()" > Enregistrer</button>
                                             <button class="btn btn-secondary btn-block" onclick="traitement_(0)" style="background: #f9ea5f;"> Annuler</button>
                                           
                                          </div>
                                         </div>
                                      </div>
                                   </div>
              				</div>
                      
                       <!-- fin etat Dossier -->

              
                <div class="card-body">


     <!-- D�but tableau param�tre "Etat de dossiers"-->
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
                                         <label>code</label>
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
                                   <h2>Fourniseur</h2>

                                 </div>
                                 <div class="col-9 ">
                                   <a class="btn btn-primary float-right text-white" onclick="frm_table('subtab_0','frm_etatDoss')">
                                     Nouveau Fournisseur
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
                                       <tr >
                                         <th class="text-center">Code</th>
                                         <th class="text-center">Nom</th>
                                         <th class="text-center">Action</th>
                                       </tr>
                                     </thead>
                                     <tbody>
                                    
                                    <c:forEach items="${listF}" var="f">
                                    
                                    <tr id="tr-${f.fournisseurId}">
                                         <td>${f.code}</td>
                                         <td>${f.nom}</td>
                             
                                         <td class="text-center">
                                           <ul class="list-inline m-0">
                                             <li class="list-inline-item">
                                               <button onclick="frm_table('subtab_0','frm_etatDoss')" class="btn btn-warning btn-sm rounded-circle tab_edit" type="button" data-toggle="tooltip" data-placement="top" title="Editer">
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
                                             <li class="list-inline-item">
                                               <button onclick="delete_famille(${f.fournisseurId})" class="btn btn-danger btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer">
                                                 <div class="icon_trash_1">
                                                   <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                      width="20px" height="20px" viewBox="0 0 489.74 489.74" style="enable-background:new 0 0 489.74 489.74;"
                                                      xml:space="preserve">
                                                     <g>
                                                       <g>
                                                         <path d="M399.179,67.285l-74.794,0.033L324.356,0L166.214,0.066l0.029,67.318l-74.802,0.033l0.025,62.914h307.739L399.179,67.285z
                                                            M198.28,32.11l94.03-0.041l0.017,35.262l-94.03,0.041L198.28,32.11z"/>
                                                         <path d="M91.465,490.646h307.739V146.359H91.465V490.646z M317.461,193.372h16.028v250.259h-16.028V193.372L317.461,193.372z
                                                            M237.321,193.372h16.028v250.259h-16.028V193.372L237.321,193.372z M157.18,193.372h16.028v250.259H157.18V193.372z"/>
                                                       </g>
                                                     </g>
                                                   </svg>
                                                 </div>
                                                 <div class="icon_trash_2 d-none">
                                                   <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                      width="20px" height="20px" viewBox="0 0 489.74 489.74" style="enable-background:new 0 0 489.74 489.74;"
                                                      xml:space="preserve">
                                                     <g>
                                                       <g>
                                                         <path d="M361.051,199.929H102.01V489.74h259.041V199.929L361.051,199.929z M170.818,450.163h-13.492V239.505h13.492V450.163z
                                                            M238.276,450.163h-13.492V239.505h13.492V450.163z M305.734,450.163h-13.492V239.505h13.492V450.163z"/>
                                                         <path d="M387.73,145.959l-52.74-30.672l28.129-48.365L248.047,0l-28.127,48.362l-56.113-32.634l-26.678,45.875l223.922,130.231
                                                           L387.73,145.959z M257.808,36.891l68.421,39.792l-14.564,25.038L243.241,61.93L257.808,36.891z"/>
                                                       </g>
                                                     </g>
                                                   </svg>
                                                 </div>
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
                           <div class="row justify-content-center">
                             <div class="col-11 mt-4">
                               <div class="row m-0 p-0 justify-content-end">
                                 <nav aria-label="Page navigation float-right mt-2">
                                   <ul class="pagination">
                                     <li class="page-item">
                                       <a class="page-link" href="#" aria-label="Previous">
                                         <span aria-hidden="true">&laquo;</span>
                                       </a>
                                     </li>
                                     <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                                     <li class="page-item">
                                       <a class="page-link" href="#" aria-label="Next">
                                         <span aria-hidden="true">&raquo;</span>
                                       </a>
                                     </li>
                                   </ul>
                                 </nav>
                               </div>

                             </div>
                           </div>

                        </div>
                      </div>


 </div>

                        </div>
                      </div>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<jsp:include page="../../includes/footer.jsp" />

<script >
function addFournisseur(){
	var code=$("#code").val();
	var nom=$("#nom").val();
	
	var fournisseur={
			
			"code":code,
			"nom":nom
			
	}
	
	
	$.ajax({
		 type: "POST",
         
         url :"/addFournisseur",
         contentType : 'application/json; charset=utf-8',
         
         data : JSON.stringify(fournisseur),
         
		success : function(response) {
			
			$(".mpParam").html(response);
		},
		error : function(response) {

			alert('Erreur ajout non effectu�');

		}
	}); 
	 
	
}
	
	
	
	
	/*  delete famille  begin */
	
	function delete_famille(id){
		
		$.ajax({
			 type : "POST",
			 url :"/deleteFournisseur",
			data:{
				"id":id
			},
			 success : function(data) {
				 
				 $("#tr-"+id).css("display","none");
			 },
			 error : function(response) {
					alert("error")
				}
		 });
		
	}
	
	
	
	
	
	
	
	
	
	
	/*  delete famille  end */
	
	function checkCode(val){
		$('#codeLabel').css("display","none");
		$.ajax({
			 type : "GET",
			 url :"/checkCode",
			 data:{
				 'val':val
			 },
			 success : function(data) {
				 /* alert()  */
				 if(data=="oui"){
					$('#codeLabel').css("display","block");
					$(".btnTo").prop("disabled", true);

				 }
				 else{
					 $(".btnTo").prop("disabled", false);
				 }
				 
				
			 },
			 error : function(response) {
					alert("error")
				}
		 });
		
	}
</script>



 


 


