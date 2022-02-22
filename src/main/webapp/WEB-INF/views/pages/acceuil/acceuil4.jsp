
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/head.jsp" />
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
	
	 
<form class="myForm1" id="f1" >
  <div class="form-group row">
	   <label for="inputPassword" class=" checkboxStyle ">R.Article par Ref.</label>
	   <div class="col-sm-12"  style="padding:0 !important; margin:0;" >
	      <input    onkeyup="autoArticle1('dirtResultat','dirtFan',this.value,'article')"  style="width: 95%;" type="text" data-choose=${hvv.article.articleId } value=${hvv.article.reference } id="article" name="article" autocomplete="off" class="header-email-mdp centerDiv form-control" placeholder=""/>
		<div id="dirtResultat ">
		   <ul id="dirtFan" class="">											 	
		   </ul>
	   </div>
	   </div>
	   <input   type="hidden" id="id"  value="${hvv.historiqueVenteId}">
  </div>

		
	<div class="form-group row">											   	
	    <label for="staticEmail" class="col-sm-5 col-form-label clb  formVenteLabelStyle ">Quantité</label>
	    <div class="col-sm-7">
	      <input type="text" class="form-control" id="quantite"   value="${hvv.quantite}">
	     </div>
  </div>
  
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb formVenteLabelStyle ">Prix de vente</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="prix"   value="${hvv.prix}">
    </div>
  </div>
  
  
  <div class="form-group row"> 
    
    
	    <div class="col-md-8 col-sm-8 col-lg-8 ">
	       <a  class="btn btn-primary btValid bk-color"  onclick="validerTicket()" >Valider Vente Espèce</a> 
	    </div>
	    
	    <div class="col-md-4 col-sm-4 col-lg-4 ">
	       <a  class="btn btn-primary btValid bk-color"  onclick="addArticle()" >Ajouter</a> 
	    </div>
  </div>
  
  
  <div class="form-group row">
	 <div class="col-sm-3">
	    <label for="inputPassword" class="  checkboxStyle "  >Crédit</label>
	 </div>
	 <div class="col-sm-1">
	        <input class="form-check-input" type="radio" onclick="enableForm()" name="paiementRadios" id="checkC1" value="2" >
	 </div>
	 <div class="col-sm-5">
	    <label for="inputPassword" class="checkboxStyle ">Sans Crédit</label>
	 </div>
	 <div class="col-sm-1">
	        <input class="form-check-input" type="radio"  onclick="enableForm()" name="paiementRadios" id="checkC2" value="1" >
	 </div>
  </div>
  
  
  
  <div class="form-group row"> 
	    <div class="col-sm-10">
	     
	    </div>
  </div>
  
  
</form>




<form class="myForm1" id="f2"   >
     
  <div class="form-group row">
	   
	    <div class="col-sm-4">
	    <label for="inputPassword" class="checkboxStyle ">Espèce</label>
	     </div>
	    <div class="col-sm-2">
	        <input class="form-check-input" type="radio"  onclick="enablePaiement()" name="exampleRadios" id="checkR1" value="1" checked disabled>
	    </div>
	   
	    <div class="col-sm-4">
	    	<label for="inputPassword" class="  checkboxStyle "  >chèque</label>
	     </div>
	    <div class="col-sm-2">
	        <input class="form-check-input" type="radio" onclick="enablePaiement()" name="exampleRadios" id="checkR2" value="2"  disabled>
	    </div>
	    
  </div>

  <div class="form-group row">
	  <div class="col-sm-4">
	    <label for="inputPassword" class=" checkboxStyle ">Virement</label>
	     </div>
	    <div class="col-sm-2">
	        <input class="form-check-input" type="radio"  onclick="enablePaiement()" name="exampleRadios" id="checkR3" value="3" disabled  >
	    </div>
	    <div class="col-sm-4">
	    <label for="inputPassword" class="checkboxStyle">TPE</label>
	     </div>
	    <div class="col-sm-2">
	        <input class="form-check-input" type="radio" onclick="enablePaiement()" name="exampleRadios" id="checkR4" value="4" disabled >
	    </div>
  </div>
  
  
  <div class="form-group row" id="d3">
	    <label for="inputPassword" class="col-sm-5 col-form-label clb formVenteLabelStyle ">Montant reçu</label>
	    <div class="col-sm-7">
	      <input type="text" class="form-control" id="montantPaiement" required disabled >
	    </div>
  </div>
  
  <div class="form-group row">
          <label for="inputPassword" class="col-sm-5 col-form-label clb formVenteLabelStyle " >Date paiement</label>                                      
          <div class="col-sm-7">
          <fmt:formatDate var="dates" pattern = "dd/MM/yyyy"  value = "${ep.date}" />
           <input  required type="text" id="datePaiement" class="form-control datepicker"  required  disabled  value="${dates}">
           </div>
   </div>
  
   
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label clb  formVenteLabelStyle ">numero</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="numeroPaiement"  required disabled>
    </div>
  </div> 
      
    <div class="form-group row">
	    <label for="inputPassword" class="col-sm-5 col-form-label clb  formVenteLabelStyle ">Organisme</label>
	    <div class="col-sm-7">
	      <input type="text" class="form-control" id="organismePaiement" required disabled >
	    </div>
  </div> 
     
      
      
    
  <div class="form-group row">
     <label for="inputPassword" class=" checkboxStyle ">R.Client par Nom</label>
    <div class="col-sm-12"  style="padding:0 !important; margin:0;" >
      <input    onkeyup="autoClient2('dirtResultat2','dirtFan2',this.value,'client')"  style="width: 95%;" type="text" data-choose="0" id="client" name="client" autocomplete="off" class="header-email-mdp centerDiv form-control" required placeholder=""/ >
	<div id="dirtResultat2 ">
	   <ul id="dirtFan2" class="">											 	
	   </ul>
   </div>
   </div>
  
  </div>
   
 <a  class="btn btn-primary btValid bk-color"  onclick="validerTicket()" >Valider</a>

</form>










	 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<jsp:include page="../../includes/footer.jsp" />




<script type="text/javascript">


	






</script>






