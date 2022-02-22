(function() {
	
	
    var options = {
        title: {
            text: "Nombre de visite par region"
        },
        subtitles: [{
            text: "2020 - 2021"
        }],
        animationEnabled: true,
        data: [{
            type: "pie",
            startAngle: 40,
            toolTipContent: "<b>{label}</b>: {y}%",
            indexLabelFontSize: 16,
            indexLabel: "{label} - {y}",
            dataPoints: [
                { y: 10.11, label: "Tanger-Tétouan-Al Hoceïma",color:"#ff3e50",indexLabelFontSize:11 },
                { y: 6.20, label: "Oriental " ,color : "#3EFFE2" ,indexLabelFontSize:11},
                { y: 5.44, label: "Fès-Meknès" ,color:"#68ff3e" ,indexLabelFontSize:11},
                { y: 12.16, label: "Rabat-Salé-Kénitra" ,color:"#ffb83e" ,indexLabelFontSize:11},
                { y: 2.90, label: "Béni Mellal-Khénifra" ,color:"#ff3ef5" ,indexLabelFontSize:11},
                { y: 20.20, label: "Casablanca-Settat" ,color:"#ff3e6b" ,indexLabelFontSize:11},
                { y: 8.80, label: "Marrakech-Safi" ,color:"#3e9bff" ,indexLabelFontSize:11},
                { y: 7.50, label: "Drâa-Tafilalet" ,color:"#7b6df5" ,indexLabelFontSize:11},
                { y: 10.15, label: "Souss-Massa" ,color:"#3eff51" ,indexLabelFontSize:11},
                { y: 6.20, label: "Guelmim-Oued Noun" ,color:"#ffec3e" ,indexLabelFontSize:11},
                { y: 4.20, label: "Laâyoune-Sakia El Hamra" ,color:"#ff3e98" ,indexLabelFontSize:11},
                { y: 6.14, label: "Dakhla-Oued Ed-Dahab" ,color:"#3ed8ff" ,indexLabelFontSize:11}
            ]
        }]
    };

    $("#chartContainer").CanvasJSChart(options);


    var chart = new CanvasJS.Chart("chartContainerBar1", {
        animationEnabled: true,
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        title:{
            text: "Autorisations"
        },
        subtitles: [{
            text: "2020 - 2021"
        }],
        axisY: {
            title: "Nombre de dossier",
            interval: 10000,
            interlacedColor: "#F8F1E4",
            minimum: 200000
        },
        data: [{
            type: "column",
            showInLegend: false,
            legendMarkerColor: "grey",
            dataPoints: [
                { y: 300878, label: "Traité" },
                { y: 296455,  label: "Acceptée" },
            ]
        }]
    });
    chart.render();


    $("#chartContainer").CanvasJSChart(options);


    var chart = new CanvasJS.Chart("chartContainerBar2", {
        animationEnabled: true,
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        title:{
            text: "EIE"
        },
        subtitles: [{
            text: "2020 - 2021"
        }],
        axisY: {
            title: "Nombre de Dossiers ",
            interval: 10000,
            interlacedColor: "#F8F1E4",
            minimum: 290000
        },
        data: [{
            type: "column",
            showInLegend: false,
            legendMarkerColor: "grey",
            dataPoints: [
                { y: 400878, label: "Traité" },
                { y: 389954,  label: "Acceptée" },
            ]
        }]
    });
    chart.render();
	})();
