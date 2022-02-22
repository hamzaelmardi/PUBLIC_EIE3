
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/head.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
li{
color:black !important;
margin-right:12px !important;
margin-left:12px;

}
.nav{
margin-right: 20px;
    background: white;
    margin-: 25px;
    padding: 14px;
    border-top-left-radius: 53px;}
</style>
<div class="row">
<div class="col-md-6 col-sm-6 col-lg-6">
  
	 <div class="col-md-12 col-sm-12 col-lg-12">
	 <div class="row">
	 <div class="col-md-8 col-sm-8 col-lg-8">
		 <c:forEach items="${magasin}" var="m">
		 	<a id="ms-${m.magasinId}" onclick="getStockMagasin(${m.magasinId})"  class="tbs">${m.nom}</a>
		 </c:forEach>
		</div> 
		 <div class="col-md-4 col-sm-4 col-lg-4">
		
                <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="search">
                        <i class="mdi mdi-magnify"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="search" aria-label="search" aria-describedby="search" style="height:auto">
                </div>
              
	 </div></div>
	 </div>
	 
	
	 
	  
	 
	 <div class="col-md-12 col-sm-12 table-responsive col-lg-12">
	  <table style="margin-top:12px;" id="tableProfils" class="table table-striped hover compact table-bordered text-md-nowrap">
                                     <thead class="thead-bleu">
                                       <tr>           
                                         <th >Designation</th>
                                         <th >Reference</th>
                                         <th >Famille</th>
                                         <th >Prix</th> 
                                         <th >Stock</th>                                         
                                       </tr>
                                     </thead>
                                     
                                     <tbody>
	                                     
		                             <c:forEach items="${listF}" var="f">
	                                    <tr  id="tr-${f.stockId }">
	                                    
	                                         
	                                         <td>${f.article.designation}</td>
	                                         <td>${f.article.reference}</td>
	                                         <td>${f.article.famille.nom}</td>
	                                         <td>${f.article.prix}</td>
	                                         <td>${f.quantite}</td>
	                             
	                                         
	                                       </tr>
	                                    </c:forEach>
	                                    
                                       
                                     </tbody>
                                 </table>
	 </div>

</div>





<div class="col-md-3 col-sm-3 col-lg-3">

<form class="myForm1">
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label clb">Quantité</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="inputPassword" >
     </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb">Prix de vente</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="inputPassword" >
    </div>
  </div>
  
  <div class="form-group row">
  <div class="col-sm-3">
    <label for="inputPassword" class="  ">chéque</label>
     </div>
    <div class="col-sm-3">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
    </div>
    <div class="col-sm-3">
    <label for="inputPassword" class=" ">Espéce</label>
     </div>
    <div class="col-sm-3">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
    </div>
  </div>
  <div class="form-group row">
  <div class="col-sm-3">
    <label for="inputPassword" class="  ">Virement</label>
     </div>
    <div class="col-sm-3">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
    </div>
    <div class="col-sm-3">
    <label for="inputPassword" class=" ">TPE</label>
     </div>
    <div class="col-sm-3">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb">Montant reçu</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="inputPassword" >
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb">Date paiement</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="inputPassword" >
    </div>
  </div><div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb">Client</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="inputPassword" >
    </div>
  </div>
  <button type="submit" class="btn btn-primary btValid">Valider</button>
</form>

</div>

<div class="col-md-3 col-sm-3 col-lg-3">


</div>







</div>











<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<jsp:include page="../../includes/footer.jsp" />




<script type="text/javascript">

function getStockMagasin(id){
	$("#ms-"+id).adClass("btn");
	$.ajax({
		 type : "GET",
		 url :"/api/getStockOneMagasin/0/6",
		 data:{
			 'id':id
		 },
		 success : function(data) {
			 $(".row").html(data);
			
			
		 },
		 error : function(response) {
				alert("error getting stock failed")
			}
	 });
	
}



</script>






