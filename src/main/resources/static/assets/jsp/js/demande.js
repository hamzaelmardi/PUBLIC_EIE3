


/**
$(document).ready(function() {
    var tabledemande = $('table').DataTable({
        "searching": false,
        "bLengthChange": false,
        "pageLength": 6,
        "processing": true,
        "serverSide": true,
        "responsive": true,
        "buttons": [
            {
                text: '<i class="fa fa-lg fa-file-text-o"></i> Fichier CSV',
                extend: 'csv',
                className: 'btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-csv ttip',
                title: 'k',
                extension: '.csv',
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            }, {
                text: '<i class="fa fa-lg fa-file-excel-o"></i> Fichier Excel',
                extend: 'excel',
                className: 'btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-xls ttip',
                title: 'k',
                extension: '.xls',
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            }, {
                text: '<i class="fa fa-lg fa-file-pdf-o"></i> Fichier PDF',
                extend: 'pdf',
                className: 'btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-pdf ttip',
                title: 'k',
                extension: '.pdf',
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            }
        ],
        language: {
            processing: '<i style="color: #173366" class="fa fa-circle-notch fa-spin fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span> ',
            "sProcessing":     "Traitement en cours...",
            "sSearch":         "Rechercher&nbsp;:",
            "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
            "sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            "sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
            "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            "sInfoPostFix":    "",
            "sLoadingRecords": "Chargement en cours...",
            "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
            "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
            "oPaginate": {
                "sFirst":      "Premier",
                "sPrevious":   "Pr&eacute;c&eacute;dent",
                "sNext":       "Suivant",
                "sLast":       "Dernier"
            },
            "oAria": {
                "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            },
            "select": {
                "rows": {
                    _: "%d lignes séléctionnées",
                    0: "Aucune ligne séléctionnée",
                    1: "1 ligne séléctionnée"
                }
            }
        },
        "ajax": {
            "type" : "GET",
            "url" : "/demande_affichapi",
            error: function(jqXHR, textStatus, ex) {
                console.log(textStatus + "," + ex + "," + jqXHR.responseText);
            },
            "dataSrc": function (json) {
                return json.data;
            },
        },
        "aoColumns": [
            { "mData": "num_demande"},
            { "mData": "etude_impact", render : function ( data, type, row, meta ) {
                    return data!=''?'<a href="/upload/'+data+'"  class="btn btn-success rounded-circle">\n' +
                        '                        <i class="fa fa-download"></i></a>':'';
                }},
            { "mData": "enquete_public", render : function ( data, type, row, meta ) {
                    return data!=''?'<a href="/upload/'+data+'"  class="btn btn-success rounded-circle">\n' +
                        '                        <i class="fa fa-download"></i></a>':'';
                }},
            { "mData": "date_demande" },
            { "mData": "etat", render : function ( data, type, row, meta ) {

                var rslt="";
                if(data=='en_attente'){rslt = '<i class="badge badge-warning">en attente </i>'}
                if(data=='refuse'){rslt = '<i class="badge badge-danger">réfusé </i>'}
                if(data=='attachement_enquet_public'){rslt = '<i class="badge badge-success">Attacher L\'enquête Public </i>'}
                if(data=='on_reunion'){rslt = '<i class="badge badge-primary">en reunion</i>'}

                    if(data=='accepter'){ rslt ='<i class="badge badge-success">Attente dépôt EIE</i>'}
                    if(data=='depot_depose'){ rslt ='<i class="badge badge-success">Dépôt EIE dépose</i>'}
                    if(data=='etablis_acc'){ rslt ='<i class="badge badge-success">Etablissement de l’acceptabilité</i>'}
                    if(data=='arretexam'){ rslt ='<i class="badge badge-danger">Arrêt d’examen</i>'}
                    if(data=='nonacceptable'){ rslt ='<i class="badge badge-danger">Non Acceptable </i>'}
                    if(data=='dmndcompl'){ rslt ='<i class="badge badge-danger">Demande de complément </i>'}
                    if(data=='noatteint'){ rslt ='<i class="badge badge-danger">Quorum no atteint </i>'}
                    if(data=='signature'){ rslt ='<i class="badge badge-primary">Attente Signature</i>'}
                    if(data=='signature_final'){ rslt ='<i class="badge badge-success">signée</i>'}

                    return rslt;

                }},
            { "mData": "cause" },
            { "mData": "num_demande", render : function ( data, type, row, meta ) {
                        var rslt="";
                    if(row.etat=='valide') {
                        rslt='<a href="/autorisation_document/'+row.num_demande+'" target="_blank" class="btn btn-success rounded-circle"> <i class="fa fa-print"></i> </a>';
                    }

                    if(row.etat=='en_attente') {
                        rslt=' <a href="/demande/'+row.id+'"  class="btn btn-primary rounded-circle"><i class="fa fa-edit"></i></a>';
                    }

                    if(row.etat=='accepter') {
                        rslt=' <a href="/piecejointdemande/'+row.id+'"  class="btn btn-primary rounded-circle"><i class="fa fa-plus-circle"></i></a>';
                    }

                    if(row.etat=='signature_final') {
                        rslt=' <a href="/demande_printqr/'+row.id+'" target="_blank"  class="btn btn-success rounded-circle"><i class="fa fa-file-word"></i></a>';
                    }



                    return rslt;
                }}
        ],
    }).order( [ 1, 'DESC' ] )
        .draw();

} );
 **/