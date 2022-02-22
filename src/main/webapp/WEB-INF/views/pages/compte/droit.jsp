<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />


<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getListe')">Liste des profiles</h2>
<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getDroit')">Nouveau  profile</h2>
<div class="row">

<div class="col-md-10"><input type="text" id="nom"  onchange="checkCode(this.value)" class="form-control"><label id="codeLabel" style="display:none">Entrez un nouveau Code</label></div>
<div class="col-md-2"><a class="btn btn-primary btnTo hidden"  onclick="addProfil()">+</a></div>
</div>

<div class="colhere" >




<script type="text/javascript">
function addProfil(){
	$(".colhere").html(" ");
	var nom=$("#nom").val();
var profil={
			
			
			"nom":nom
			
			
			
	}
	
	$.ajax({
		 type : "POST",
		 contentType :'application/json; charset=utf-8',
		 url :"/addProfil",
		 data:JSON.stringify(profil),
		 
		 success : function(data) {
			 
			 $(".colhere").html(data);
		 },
		 error : function(response) {
				alert("error")
			}
	 });
}

function checkCode(val){
	$('#codeLabel').css("display","none");
	$.ajax({
		 type : "GET",
		 url :"/checkProfil",
		 data:{
			 'val':val
		 },
		 success : function(data) {
			 
			 if(data=="oui"){
				$('#codeLabel').css("display","block");
				

			 }
			 else{
				 $(".btnTo").removeClass("hidden");
			 }
			 
			
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}
</script>






















<jsp:include page="../../includes/footer.jsp" />



