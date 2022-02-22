$(document).ready(function(){

    var current_fs, next_fs, previous_fs,id; //fieldsets
    var opacity;
    var current = 1;
    var steps = $("fieldset").length;

    setProgressBar(current);

    $(".next").click(function(){
        current_fs = $(this).parent().parent();
        id=$(this).parent().attr('id');
        next_fs = $(this).parent().parent().next();
        if($(this).parent().valid()){
            if(id === "administratif"){
                SetValue();
            }
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
//show the next fieldset
            next_fs.show();
//hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function(now) {
// for making fielset appear animation
                    opacity = 1 - now;

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(++current);
        }
        else{
            return false;
        }

    });

    $(".previous").click(function(){

        current_fs = $(this).parent().parent();
        previous_fs = $(this).parent().parent().prev();

//Remove class active
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
        previous_fs.show();

//hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now) {
// for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previous_fs.css({'opacity': opacity});
            },
            duration: 500
        });
        setProgressBar(--current);
    });

    function setProgressBar(curStep){
        var percent = parseFloat(100 / steps) * curStep;
        percent = percent.toFixed();
        $(".progress-bar")
            .css("width",percent+"%")
    }

});

function SetValue(){

    //Input Value
    debugger;
    var numRc = $("input[name=numRc]").val();
    var name_fr = $("input[name=name_fr]").val();
    var raison_ar = $("input[name=raison_ar]").val();
    var raison_fr = $("input[name=raison_fr]").val();
    var adresse_ar = $("textarea[name=adresse_ar]").val();
    var adresse_fr = $("textarea[name=adresse_fr]").val();
    var tel = $("input[name=tel]").val();
    var email = $("input[name=email]").val();
    var password = $("input[name=password]").val();
    var ct = $("#CT_1").is(":checked");
    var it = $("#IT_1").is(":checked");
    var zf = $("#ZF_1").is(":checked");
    var tr = $("#TR_1").is(":checked");
    var xd = $("#XD_1").is(":checked");
    var et = $("#ET_1").is(":checked");
    var ee = $("#EIE_1").is(":checked");
    var nt = $("#NI_1").is(":checked");
    var ae = $("#AE_1").is(":checked");

    //Récap Value

    $("#NumeroRc").val(numRc);
    $("#Representant").val(name_fr);
    $("#RaisonAr").val(raison_ar);
    $("#RaisonFr").val(raison_fr);
    $("#AdresseAr").val(adresse_ar);
    $("#AdresseFr").val(adresse_fr);
    $("#Telephone").val(tel);
    $("#mail").val(email);
    $("#motpasse").val(password);

    if(ct==true){
        $("#CT_2").attr('checked','true')
    }
    if(zf==true){
        $("#ZF_2").attr('checked','true')
    }
    if(it==true){
        $("#IT_2").attr('checked','true')
    }
    if(xd==true){
        $("#XD_2").attr('checked','true')
    }
    if(et==true){
        $("#ET_2").attr('checked','true')
    }
    if(tr==true){
        $("#TR_2").attr('checked','true')
    }
    if(ee==true){
        $("#EIE_2").attr('checked','true')
    }
    if(nt==true){
        $("#NI_2").attr('checked','true')
    }
    if(ae==true){
        $("#AE_2").attr('checked','true')
    }




}