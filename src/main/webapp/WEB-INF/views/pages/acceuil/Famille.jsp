
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

</style>
<div class="container">
<div class="row">
    <div class="col-12">
    <a class="btn btn-sucsess" style="color:white" data-toggle="modal" data-target="#exampleModal">Nouvelle Famille</a>
    </div></div>
  <div class="row">
    <div class="col-12">
		<table class="table table-image">
		  <thead>
		    <tr>
		      <th scope="col">Code</th>
		      <th scope="col">Image</th>
		      <th scope="col">Nom</th>
		      <th scope="col">Description</th>
		      
		    </tr>
		  </thead>
		  <tbody>
		 <c:forEach items="${listF}" var="list" varStatus="loop">
		  
		  <tr>
		      <th scope="row">${list.code}</th>
		      <td class="w-25">
			      <img src="${list.photo}" class="img-fluid img-thumbnail" alt="Sheep">
		      </td>
		      <td>${list.nom}</td>
		      <td>${list.description}</td>
		      
		    </tr>
		  
		    </c:forEach>
		    
		  </tbody>
		</table>   
    </div>
  </div>
  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nouvelle Famille</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        	<form id="idForm">
        		 
			  <div class="form-group">
			    <label for="exampleFormControlInput1">Nom de la famille*</label>
			    <input type="text" class="form-control" name="nomFamille" placeholder="Ecrire le nom ici ..." required>
			  </div>
			 <div class="form-group">
			    <label for="exampleFormControlInput1">Code de La Famille*</label>
			    <input type="text" class="form-control" name="codeFamille" placeholder="Ecrire le code ici ..." required>
			 </div>
			  	  
			  <div class="form-group">
			    <label for="exampleFormControlTextarea1">Description</label>
			    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			  </div>
			  <div class="custom-file">
				    <input type="file" class="  form-control custom-file-input" name="imageUrl" id ="imageFamille"  accept="image/x-png,image/gif,image/jpeg"  required>
				    <label class="custom-file-label" for="validatedCustomFile">Choisir l'image...</label>
				    <div class="invalid-feedback">Example invalid custom file feedback</div>
			  </div>
				
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        <a onclick="newFamily()" type="button" class="btn btn-primary">Enregistrer</a>
      </div>
    </div>
  </div>
</div>
</div>


<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">

  function newFamily(){
	  var data = new FormData();
	  if(document.getElementById('imageFamille')!=null){
			var imageFamille = document.getElementById('imageFamille').files.length;
			for (var x = 0; x < imageFamille; x++) {
				data.append("imageFamille", document.getElementById('imageFamille').files[x]);
			} 
		}else{
			data.append("imageFamille", null);
		}
	  
	  var nomFamille=$("input[name='nomFamille']").val();
	  var codeFamille=$("input[name='codeFamille']").val();
	  var description=$("textarea[name='description']").val();
	  
	  var Famille= {
	            "nom": nomFamille,
	            "code": codeFamille,
	           
	            "description":description

	        }
	  data.append('famille', JSON.stringify(Famille));
	  $.ajax( {
	      type: "POST",
	      url: "addFamily",
	      
	      enctype: 'multipart/form-data',
          data : data,
          processData: false,
          contentType: false,
          cache: false,
          timeout: 600000,
	      success: function( response ) {
	        console.log( response );
	      }
	    } );
  }
</script>

