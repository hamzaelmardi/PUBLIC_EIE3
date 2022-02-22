function searchNotification(){
    var searchDossier=$("input[name=searchDossier]").val();
    if(searchDossier!=''){
        $.get( "/checknotif/"+searchDossier, function( data ) {
            console.table(data);
            if(data){
                $("#errorSearch").hide()
                var will_be_added="<div class='container'>" +
                    " id : "+data.id+"<br>" +
                    " Code : "+data.code+"<br>" +
                    " Quantite : "+data.quantite +"<br>"+
                    "<a href='#'>voir plus</a>"+
                    " </div> "
                $("#infoSearch>.hp-box>.ow-vl-inner").empty();
                $("#infoSearch>.hp-box>.ow-vl-inner").append(will_be_added)
                $("#infoSearch").show();
            }else{
                $("#infoSearch").hide()
                $("#errorSearch").show()
            }
        });
    }
}

function AddDocForStockage(){
   
    
    $(".docs").css("display","block");$(".docsE").css("display","none");
    $("#blocEtapes").hide();
    $("#blocJuridiques").hide();
}

function clearRightSide(){
    var elementHtml= 'Choisi un type d\'autorisation';
    $("#docs").empty();
    $("#docs").append(elementHtml);

    var elementHtml= 'Choisi un type d\'autorisation';
    $("#docs2").empty();
    $("#docs2").append(elementHtml);

    var elementHtml= 'Choisi un type d\'autorisation';
    $("#docs3").empty();
    $("#docs3").append(elementHtml);

    $("#blocDocRequis").show();
    $("#blocEtapes").show();
    $("#blocJuridiques").show();
}

function showNbVisites(){
    $("#nbVisite").hide();
    $("#etudeImpactEIE").hide();
    $("#nbAutorisation").hide();
    $("#nbAutorisation2").hide();

    $("#nbVisite").show();
}
function showEtudeImpactEIE(){
    $("#nbVisite").hide();
    $("#etudeImpactEIE").hide();
    $("#nbAutorisation").hide();
    $("#nbAutorisation2").hide();

    $("#etudeImpactEIE").show();
}
function showNbAutorisation(){
    $("#nbVisite").hide();
    $("#etudeImpactEIE").hide();
    $("#nbAutorisation").hide();
    $("#nbAutorisation2").hide();

    $("#nbAutorisation").show();
}
function showNbAutorisation2(){
    $("#nbVisite").hide();
    $("#etudeImpactEIE").hide();
    $("#nbAutorisation").hide();
    $("#nbAutorisation2").hide();

    $("#nbAutorisation2").show();
}




function choosefaq(){
    var val = $("#choosefaq").val();
    if(val=="1")
    {
        $("#eie").hide();
        $("#autorist").show();
    }else{
        $("#eie").show();
        $("#autorist").hide();
    }
}


function chooseAutorisation(){
    $("#autorisationButton").removeClass("bg-primary");
    $("#autorisationButton").addClass("bg-secondary");
    $("#eieButton").addClass("bg-primary");

    $("#eie").hide();
    $("#autorist").show();
    $("#docs").empty();

    var elementHtml= 'Choisi un type d\'autorisation';

    $("#docs").empty();
    $("#docs").append(elementHtml);
}

function chooseEIE(){
    $("#eieButton").removeClass("bg-primary");
    $("#eieButton").addClass("bg-secondary");
    $("#autorisationButton").addClass("bg-primary");

    $("#autorist").hide();
    $("#eie").show();
    $("#docs").empty();

    var elementHtml= 'Choisi un type d\'autorisation';

    $("#docs").empty();
    $("#docs").append(elementHtml);
}


function etdenvernmtl(){
    
    $(".docs").empty();
    $(".docsE").css("display","block");
}
function comment(){
	
}