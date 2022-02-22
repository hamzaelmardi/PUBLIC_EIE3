function addImportateur(){
	alert("Importateur 2");
	var id=$("#id").val();
	var notifId=$("#notifId").val();
	var nom=$("#nom").val();
	var adresse=$("#adresse").val();
	var mail=$("#email").val();
	var tel=$("#telephone").val();
	var fax=$("#fax").val();
	 var imp={"nom" : nom,"idImp":id,"adresse":adresse,"email":mail,"tel":tel,"fax":fax};
		 
		 $.ajax({
             url :"/api/addImporteur/"+notifId,
             type : "POST",                    
             contentType : 'application/json; charset=utf-8',
             
             data : JSON.stringify(imp),
             success : function (response) {
           	
            	  
                 
             },
             error : function (response) {
            	
            	

                
             }
         }); 

}

function addTransport(){
	var id=$("#id").val();
	var notifId=$("#notifId").val();
	var nom=$("#nom").val();
	var adresse=$("#adresse").val();
	var mail=$("#email").val();
	var tel=$("#telephone").val();
	var moyenTransport=$("#moyenTransport").val();
	var fax=$("#fax").val();
	 var imp={"nom" : nom,"id":id,"adresse":adresse,"email":mail,"tel":tel,"fax":fax,"moyenTransport":moyenTransport};
		 
		 $.ajax({
             url :"/api/addTransporteur/"+notifId,
             type : "POST",                    
             contentType : 'application/json; charset=utf-8',
             
             data : JSON.stringify(imp),
             success : function (response) {
           	
            	  
                 
             },
             error : function (response) {
            	
            	

                
             }
         }); 
	
}


function addproducteur(){
	var id=$("#id").val();
	var notifId=$("#notifId").val();
	var nom=$("#nom").val();
	var adresse=$("#adresse").val();
	var mail=$("#email").val();
	var tel=$("#telephone").val();
	var fax=$("#fax").val();
	var lieu=$("#lieu").val();
	var imp={"nom" : nom,"idImp":id,"adresse":adresse,"email":mail,"tel":tel,"fax":fax,"lieu":lieu};
		 
		 $.ajax({
             url :"/api/addProducteurDechet/"+notifId,
             type : "POST",                    
             contentType : 'application/json; charset=utf-8',
             
             data : JSON.stringify(imp),
             success : function (response) {
           	
            	  
                 
             },
             error : function (response) {
            	
            	

                
             }
         }); 
	
	
}

function addNotification(){
	alert("Add Notif In JS file");
	var id=$("#id_notification").val();
	var num_notification=$("#num_notification").val();
	var concerne=$("#concerne").val();
	var mail=$("#email").val();
	var quantite=$("#quantite").val();
	var unite=$("#unite").val();
	var premierdepart=$("#premierdepart").val();
	var dernierdepart=$("#dernierdepart").val();
	var conditionement=$("#conditionement").val();
	var prescription=$("#prescription").val();
	var codeOperation=$("#codeOperation").val();
	var phisique=$("#phisique").val();
	var zonefranche=$("#zonefranche").val();
	var destributionfinal=$("#destributionfinal").val();
	var bureau=$("#bureau").val();
	var imp={"num_notification" : num_notification,"idnotif":id,"concerne":concerne,"email":mail,"quantite":quantite,"unite":unite,"premierdepart":premierdepart,
			
			"dernierdepart":dernierdepart,
			"conditionement":conditionement,
			"prescription":prescription,
			"codeOperation":codeOperation,
			"phisique":phisique,
			"zonefranche":zonefranche,
			"destributionfinal":destributionfinal,
			"bureau":bureau
	
	
	};
	
	 $.ajax({
         url :"/api/addNotifications",
         type : "POST",                    
         contentType : 'application/json; charset=utf-8',
         
         data : JSON.stringify(imp),
         success : function (response) {
       	
        	  
             
         },
         error : function (response) {
        	
        	

            
         }
     }); 
}
