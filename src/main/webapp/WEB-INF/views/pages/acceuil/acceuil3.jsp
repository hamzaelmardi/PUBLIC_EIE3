
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
	
	
	
	
<div class="col-md-12 col-sm-12 col-lg-12 tableTicket">

	 <div class="col-md-12 col-sm-12 col-lg-12">
		 <div class="row" style="margin-top:12px;">
				 <div class="col-md-8 col-sm-8 col-lg-8  ">
						 <button type="submit" class="btn btn-primary btValid bk-color"  onclick="addNewLiseteVente()" >Nouvelle Vente</button>
						<a class="fa fa-arrow-circle-left"    style="font-size: 25;color: #e8c431;" aria-hidden="true"   onclick=" getTicket('-1')"></a>
						 <a class="fa fa-arrow-circle-right"  style="font-size: 25;color: #e8c431;" aria-hidden="true" onclick=" getTicket('1')"></a>
					    <input type="text" id="idNumVente" style="width: 60;" value="${matricule}">
					    <input type="hidden" id="idvente" value="${idlisteVente}">
					    
					     <a class="fa fa-check-circle" style="font-size: 25;color: #e8c431;" aria-hidden="true" onclick=" getTicket('0')"></a>

				</div> 
				 <div class="col-md-3 col-sm-3 col-lg-3">
		  			 
			     
				  
<span id="notification_count">${fn:length(notifNumber)}</span>

<a href="#" id="notificationLink"><i class="fa fa-cart-plus"></i></a>

        <div id="notificationContainer">
            <div id="notificationTitle">Liste des ventes Encours</div>
            <div id="notificationsBody" class="notifications">
                <ul>
                <c:forEach items="${notifNumber }" var="v">
                <li><a onclick="getTicketDouble('0','${v.matricule }')">Vente numero ${v.matricule }  le <a  id="ticketDate"   class="tbs"><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${v.date }" /></a>
			</a></li>
                </c:forEach>
                    
                   
                </ul>
            </div>
            <div id="notificationFooter"><a href="#" id='AddNew'>voir Tous</a>

            
        </div>
    
    

    
		  			
			     </div>
		 </div>
		 
		 
		 <div class="row">
				 <div class="col-md-6 col-sm-6 col-lg-6  ">
						<a id="ticketEtat"  class="tbs">${ticketEtat}</a>
						<a  id="ticketDate"   class="tbs"><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${ticketDate}" /></a>
				</div> 
				 <div class="col-md-6 col-sm-6 col-lg-6">
		  			 <label for="inputPassword" class="col-sm-5 col-form-label clb formVenteLabelStyle ">Total</label>
		  			  <input for="inputPassword" class="col-sm-5 col-form-label clb" value="${ticketTotal}" id="ticketTotal" disabled>
			     </div>
		 </div>
	</div>
	 
	
	 
	 <div class="col-md-12 col-sm-12 table-responsive col-lg-12">
	  <table style="margin-top:12px;" id="tableProfils" class="table table-striped hover compact table-bordered text-md-nowrap">
                                     <thead class="thead-bleu">
                                       <tr>           
                                         <th >Reference</th>
                                         <th >Quantite</th>     
                                         <th >Prix</th> 
                                         <th >Action</th>                       
                                       </tr>
                                     </thead>
                                     
                                     <tbody>
	                                 
	                                
	                                     
		                            <c:forEach items="${hvv}" var="h">
	                                    <tr  id="tr-${h.historiqueVenteId}">
	                                          	                                       
	                                         <td>${h.article.reference}</td>
	                                         <td>${h.quantite}</td>
	                                         <td>${h.prix}</td>
	                                        
	                                      <td>
	                                         
	                                        <a class="fa fa-pencil" style="margin-right: 10;color: gray;font-size: 20;"aria-hidden="true"   onclick="getEnregistrement(${h.historiqueVenteId})" ></a>
	                                         <a  class="fa fa-trash" style="color: red;font-size: 20;" aria-hidden="true"></a></td>	                                   
	                                                
	                                       </tr>
	                                 </c:forEach>
	                                    
	                                    
                                       
                                     </tbody>
                                 </table>
	 </div>


</div>







</div>
	
	
	
	
	
	
	
	<script type="text/javascript">
<!--

//-->
$(document).ready(function () {
    $("#notificationLink").click(function () {
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("slow");
        $('#notificationLink > i.fa-bell').addClass('fa-bell-o');
        $('#notificationLink > i.fa-bell').removeClass('fa-bell');
        return false;
    });

    //Document Click hiding the popup 
    $(document).click(function () {
        $("#notificationContainer").hide();
    });

    //Popup on click
    $("#notificationContainer").click(function () {
        return false;
    });
    
    $('#AddNew').on('click', function(){
        $('#notificationsBody ul').append('<li>New Message</li>');
    });

});
	
</script>
	
	
	
	<jsp:include page="../../includes/footer.jsp" />
	
	
	
	
	 
	 









	 









