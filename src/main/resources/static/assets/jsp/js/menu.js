
    function authenticate(){
    var email = $("#emailval").val();
    var password = $("#passwordval").val();

    $.get( "/login/"+email+"/"+password, function( data ) {

    if(!$.trim(data)){
    swal({
    title: "Email ou mot de passe incorrect",
    text: "échec de la connexion",
    type: "warning",
    showCancelButton: false,
});


}else{
    window.location.href = "/espace_client";
}
});
}
