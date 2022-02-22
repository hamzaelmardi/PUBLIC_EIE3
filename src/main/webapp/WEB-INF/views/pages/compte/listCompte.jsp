<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />


<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getCompte')">Liste des comptes</h2>
<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getOneCompte')">Nouveau  comptes</h2>
<table id="dtBasicExample" class="table" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Représantant
      </th>
      <th class="th-sm">email
      </th>
      <th class="th-sm">Tél
      </th>
      <th class="th-sm">Profil
      </th>
      
      <th class="th-sm">commission
      </th>
      <th class="th-sm">Magasin
      </th>
      <th class="th-sm">Action
      </th>
      
     
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${comptes}" var="a">
    <tr id="tr-${a.compteId}">
      <td>${a.nom}</td>
      <td>${a.email}</td>
      <td>${a.tel}</td>
      <td>${a.profil.nom}</td>
      <td>${a.commission}</td>
      <td>${a.magasin.nom}</td>
      <td><a class="btn btn-danger" onclick="deleteCompte(${a.compteId})">-</a>
      <a class="btn btn-warning" onclick="updateCompte(${a.compteId})">+</a>
      
      
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
</script>





















<jsp:include page="../../includes/footer.jsp" />



