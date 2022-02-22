<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />



<div class="row">

<div class="col-md-4 mdf " style="margin-top:3px;">
<form style="margin-left:12px;" id="loginForm" name="loginForm">

   
    
    
  
  <div class="row">
   <div class="col">
    <label class="cls">Sous Famille</label>
    <select class="form-control" id="magasin">
      <c:forEach items="${sousFamille}" var="a">
      <option ${comptes.sousFamille.sousFamilleId==a.sousFamilleId?"selected":"" } value="${a.sousFamilleId}">${a.nom}</option>
      </c:forEach>
      
     
    </select>
  </div>
  
  <div class="col">
    <label class="cls">Fournisseur</label>
    <select class="form-control" id="depot">
      
      <option ${comptes.fournisseur.soufournisseurId==a.fournisseurId?"selected":""}  value="${a.fournisseurId }">oui</option>
      
      
      
     
    </select>
  </div></div>
  <div class="row">
  <div class="col">
  <label for="">Quantité</label>
  <input value="${comptes.quantite }" class="form-control" type="text" value="Artisanal kale" id="example-text-input">
  </div>
  <div class="col">
    <label for="exampleInputPassword1">Date</label>
    <div class="form-group row">
 
    <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
  
</div></div>
  </div>
  
  
  <a id="codeLabel" class="btn btn-primary" onclick="addCompte()" style="color:white;">Valider</a>
</form></div>

<div class="col-md-8">

<jsp:include page="listReception.jsp" />

</div></div>





<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>



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
		 url :"/checkEmail",
		 data:{
			 'val':val
		 },
		 success : function(data) {
			
			 if(data=="non"){
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

function addCompte(){
	
   
	
	var quantite=$("#quantite").val();
	var fournisseur=$("#fournisseur").val();
	var sousFamille=$("#sousFamille").val();
	var date=$("#date").val();
	
	var cmt={
			
			
			"quantite":quantite,
			"fournisseurId":fournisseur,
			"sousFamilleId":sousFamille,
			"receptionId":receptionId,
			"sousFamille":{"sousFamilleId":sousFamille},
			"fournisseur":{"fournisseurId":fournisseur}
	};
	 if (validator.form()) {
	       
	   
	$.ajax({
		type: "POST",
        
        url :"/addCompte",
        contentType : 'application/json; charset=utf-8',
        
        data : JSON.stringify(cmt),
        
		success : function(response) {
			
			$(".content-wrapper").html(response);
		},
		error : function(response) {

			alert('Erreur ajout non effectué');

		}
	 });
	
} }




function deleteCompte(id){
	
	$.ajax({
		 type : "POST",
		 url :"/deleteCompte",
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

function updateCompte(id){
	
	$.ajax({
		 type : "GET",
		 url :"/api/getOneCompteId",
		data:{
			"id":id
		},
		 success : function(data) {
			 
			 
			 $(".content-wrapper").html(data);
			 $("#tr-"+id).addClass("updated");
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}


function validatePassword() {
    var validator = $("#loginForm").validate({
        rules: {
            password: "required",
            confirmpassword: {
                equalTo: "#password"
            }
        },
        messages: {
            password: " Enter Password",
            confirmpassword: " Enter Confirm Password Same as Password"
        }
    });
    if (validator.form()) {
        alert('Sucess');
    }
}
</script>






















<jsp:include page="../../includes/footer.jsp" />



