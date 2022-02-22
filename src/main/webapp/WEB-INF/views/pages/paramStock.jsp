
<jsp:include page="../includes/tag.jsp" />
<jsp:include page="../includes/head.jsp" />

 <div class="row" style="margin:0;margin-top:25px;">
            <div class="col-lg-12 grid-margin grid-margin-md-0">
              <div class="card crd">
                <div class="card-body">
                       <div class="row portfolio-grid">
                                    <div class="col-xl-1 col-lg-1 col-md-4 col-sm-6 col-12">
                                               <div class="flip-card">
                                                   <div class="flip-card-inner">
                                                       <div class="flip-card-front">
                                                         <div class="mt-3">
                                                            <i class="mdi mdi-account-switch btn-icon-prepend mdi-36px" style="text-align:center"></i>
                                                            <h6 class="card-title2 mb-1">Nouveau Article</h6>
                                                        </div>
                                                       </div>
                                                       <div class="flip-card-back" >
                                                            <h6>Article</h6>
                                                          <button onclick="getFunctionParam('getParamArticle/0/6')" type="button" class="btn btn-primary" style="background-color:white;color:#003366 !important;"> Afficher</button>
                                               </div>
                                            </div>
                                         </div>
                                 </div>
                                 
                                 <div class="col-xl-1 col-lg-1 col-md-4 col-sm-6 col-12">
                                     <div class="flip-card">
                                         <div class="flip-card-inner">
                                             <div class="flip-card-front">
                                               <div class="mt-3">
                                                  <i class="mdi mdi-folder-multiple btn-icon-prepend mdi-36px" style="text-align:center"></i>
                                                  <h6 class="card-title2 mb-1">Entr�es d�pot</h6>
                                              </div>
                                             </div>
                                             <div class="flip-card-back" >
                                                  <h6>Entr�es</h6>
                                                 <button onclick="getFunctionParam('getParamReception/0/6')" type="button" class="btn btn-primary" style="background-color:white;color:#003366;"> Afficher</button>
                                                 <!--<button onclick="etat_dossiers(0)" type="button" class="btn btn-primary" style="background-color:white;color:#003366 !important;"> Afficher</button>-->
                                                 <!--<button onclick="etat_dossiers(0)" type="button" class="fermer btn btn-primary" style="display:none;background-color:white;color:#003366 !important;"> Fermer</button>-->

                                             </div>
                                         </div>
                                     </div>

                                   </div>
                                 <div class="col-xl-1 col-lg-1 col-md-4 col-sm-6 col-12">
                                     <div class="flip-card">
                                         <div class="flip-card-inner">
                                             <div class="flip-card-front">
                                               <div class="mt-3">
                                                  <i class="mdi mdi-account-multiple-outline btn-icon-prepend mdi-36px" style="text-align:center"></i>
                                                  <h6 class="card-title2 mb-1">Alimentation Magasins</h6>
                                              </div>
                                             </div>
                                             <div class="flip-card-back" >
                                                  <h6>Alimentations</h6>
                                                 <button onclick="getFunctionParam('getParamAlimentation/0/6')" type="button" class="btn btn-primary" style="background-color:white;color:#003366 !important;"> Afficher</button>
                                             </div>
                                         </div>
                                     </div>

                                   </div>
                                   
                                        
                                             
                                               
                                              
                                               
										


                  
                        </div>                      
	              </div>
	      </div>
    </div>
<div class="row mpParam" >















<jsp:include page="../includes/footer.jsp" />
 <script type="text/javascript">
 
 $(document).ready(function() {
   $('.dropdown-toggle').dropdown();
   $(".select2").select2();


   $(".tab_trash").on({
       mouseenter: function() {
         $(this).parent().find(".icon_trash_1").addClass('d-none');
         $(this).parent().find(".icon_trash_2").removeClass('d-none');
       
       },
       mouseleave: function() {
         $(this).parent().find(".icon_trash_2").addClass('d-none');
         $(this).parent().find(".icon_trash_1").removeClass('d-none');
          
       }
   });



 });
 function frm_search(id){
     if($("#"+id+" #zone_search:visible").length!=0)
       $("#"+id+" #zone_search:visible").hide('slow');
     else
       $("#"+id+" #zone_search").show('slow');
   }

  

     function traitement_(id){
       $(".from_add").hide();
       $(".z_tab").hide();
       $(".flip-card-front").css({'background':'#fff',"color":"black"});
       $('h6.card-title2').css('color', 'black');

         if($("#subtab_"+id+":visible").length!=0){
           $("#subtab_"+id+":visible").hide('slow');
           $('div.flip-card-front:eq('+id+')').css('background-color', '#fff');
           $('div.flip-card-front:eq('+id+')').css('color', 'black');
           $('h6.card-title2:eq('+id+')').css('color', 'black');
           $('h6.card-title2:eq('+id+')').css('font-weight', '500');
         }
         else {
           for (var iter = 0; iter < 22; iter++) {
               if (iter != id) {
                 $("#subtab_"+id).hide('slow');
               }
           }
           $("#subtab_"+id).show('slow');
           $('div.flip-card-front:eq('+id+')').css('background-color', '#003366');
           $('div.flip-card-front:eq('+id+')').css('color', '#fff');
           $('h6.card-title2:eq('+id+')').css('color', '#fff');

         }
       }

function frm_table(id_tab,id_form){
 /*'subtab_0','frm_etatDoss'*/
$("#"+id_tab).hide("slow");
$("#"+id_form).show("slow");
}


function delete_tr(val){
 swal({
    title: '�tes-vous s�r ?',
    text: "Vous ne pourrez pas revenir sur cela !",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#00695c',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Oui, supprimer !',
    cancelButtonText: "Annuler",
  }, function (isConfirm) {
      if (isConfirm) {
          swal("Supprimer!", "L'élément a bien été supprimé", "success");
          //tableProfils.row($(btn).parents('tr')).remove().draw(false);
          $(val).parents("tr:first").remove();
      } else {
          swal("Annuler!", "L'élément n'a pas été supprimé", "error");
      }
  });
}

</script>



