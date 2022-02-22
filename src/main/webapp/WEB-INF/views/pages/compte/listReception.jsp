<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />


<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getCompte')">Liste des receptions</h2>
<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getOneCompte')">Nouveau  reception</h2>
<table id="dtBasicExample" class="table" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Sous Famille
      </th>
      <th class="th-sm">Quantite
      </th>
      <th class="th-sm">Date
      </th>
      <th class="th-sm">Fournisseur
      </th>
      
      
      <th class="th-sm">Action
      </th>
      
     
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${comptes}" var="a">
    <tr id="tr-${a.receptionId}">
      <td>${a.sousFamille.nom}</td>
      <td>${a.quantite}</td>
      <td>${a.date}</td>
      <td>${a.fournisseur.nom}</td>
      
      <td><a class="btn btn-danger" onclick="deleteCompte(${a.receptionId})">-</a>
      <a class="btn btn-warning" onclick="updateCompte(${a.receptionId})">+</a>
      
      
      </td>
      
      
    </tr>
    
   </c:forEach>
  
</table>






<script type="text/javascript">
function showRole(val){
	$.ajax({
		 type : "GET",
		 url :"/getProfilDetails",
		 data:{
			 'val':val
		 },
		 success : function(data) {
			 
			 $(".content-wrapper").html(data);
			 
			
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}
function deleteCompte(id){
	
	$.ajax({
		 type : "POST",
		 url :"/deleteReception",
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
</script>





















<jsp:include page="../../includes/footer.jsp" />



