<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/head.jsp" />



<table id="dtBasicExample" class="table" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Droit
      </th>
      <th class="th-sm">Valider
      </th>
      <th class="th-sm">Modifier
      </th>
      <th class="th-sm">Annuler
      </th>
      <th class="th-sm">Tous
      </th>
     
    </tr>
    
  </thead>
  <tbody>
  <c:forEach items="${roles}" var="c">
    <tr>
      <td>${c.role.nom}</td>
      
						<td><input onchange="addRoleFunction(this,${c.role.roleId},'valider',${profilId })"class="checkbox class${c.role.roleId}" type="checkbox" name="d" ${c.valider =="oui" ? 'checked' : ''}></td>
						<td><input onchange="addRoleFunction(this,${c.role.roleId},'modifier',${profilId })" class="checkbox class${c.role.roleId}" type="checkbox" name="d" ${c.modifier =="oui" ? 'checked' : ''}></td>
						<td><input onchange="addRoleFunction(this,${c.role.roleId},'annuler',${profilId })" class="checkbox class${c.role.roleId}" type="checkbox" name="d" ${c.annuler =="oui" ? 'checked' : ''}></td>
						<td><input onclick="checkAll(this,'${c.role.roleId}',${profilId })" class="checkbox check_all" type="checkbox" name="d7" ${c.tous =="oui" ? 'checked' : ''}></td>
						
      
    </tr>
    
   </c:forEach>
  
</table>





<script type="text/javascript">
function checkAll(element,roleId,profilId){
	
	
	
	if(element.checked==true){
		

 $.ajax({
		url :"/addProfilInfo",		
		type :"POST",
		
		data:{
			"profilId":profilId,
			"roleId":roleId,
			"action":"all"
			
			
		},
		success : function(response) {
			
			
		},
		error : function(response) {
			alert("error");
		}
	});
 $(".class"+roleId).prop('checked', true);
}
	else{
		$.ajax({
				url :"/deleteProfilInfo",		
				type :"POST",
				
				data:{
					"profilId":profilId,
					"roleId":roleId,
					"action":"all"
					
					
				},
				success : function(response) {
					
					
				},
				error : function(response) {
					alert("error");
				}
			}); 
	
		$(".class"+roleId).prop('checked', false);
	}
	
	
}


function addRoleFunction(element,roleId,action,profilId){
	   
    
  
 	  if(element.checked==true){
 		 
 		  $.ajax({
				url :"/addAction",		
				type :"POST",
				
				data:{
					"profilId":profilId,
					"roleId":roleId,
					"action":action
					
				},
				success : function(response) {
					
					
				},
				error : function(response) {
					alert("error");
				}
			});
 	  }
 	  
 	  
 	  else{
 		  $.ajax({
 				url :"/deleteAction",		
 				type :"POST",
 				
 				data:{
 					"profilId":profilId,
 					"roleId":roleId,
 					"action":action
 					
 				},
 				success : function(response) {
 					
 					
 				},
 				error : function(response) {
 					alert("error");
 				}
 			}); 
 	  }
 	   
    }
</script>






















<jsp:include page="../../includes/footer.jsp" />



