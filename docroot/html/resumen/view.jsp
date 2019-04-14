<%@include file="../init.jsp" %>

   <script src="http://code.highcharts.com/highcharts.js"></script>
   <script src="http://code.highcharts.com/modules/exporting.js"></script>

<div id="pie" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
<script>
Highcharts.chart('pie', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Producción según tipología'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.y:.1f}</b>',
        	useHTML: true,
            formatter: function() {
                let selectedKey = this.key;
                console.log(this.key);
                setTimeout( function() {
                    $("#hc-tooltip").highcharts({
                    	chart: {
                            type: 'bar'
                        },
                        title: {
                            text: 'Producción '+selectedKey
                        },
                        xAxis: {
                            colors: ['#ED561B', '#DDDF00', '#24CBE5', '#64E572'],
                            categories: ['ART_A1', 'ART_C', 'LIB_A', 'CAP_LIB_B'],
                            title: {
                                text: null
                            }
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Population (millions)',
                                align: 'high'
                            },
                            labels: {
                                overflow: 'justify'
                            }
                        },
                        tooltip: {
                            valueSuffix: ' millions'
                        },
                        plotOptions: {
                            bar: {
                                dataLabels: {
                                    enabled: true
                                }
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'top',
                            x: -40,
                            y: 80,
                            floating: true,
                            borderWidth: 1,
                            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
                            shadow: true
                        },
                        credits: {
                            enabled: false
                        },
                        series: [{data: [107,106, 10, 35]}]
                    });
                }, 1510)
                
                return '<div id="hc-tooltip"></div>';
            }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.y:.1f} ',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'tipologias',
        colorByPoint: true,
        data: [{
            name: 'GNC',
            y: 56.33
        }, {
            name: 'ASC',
            y: 24.03
            //sliced: true,
            //selected: true
        }, {
            name: 'DTI',
            y: 10.38
        }, {
            name: 'FRH',
            y: 4.77
        }],
        point:{
            events:{
                click: function (event) {

                }
            }
        }
    }]
});
</script>
   
<div id="stackedColumns"></div>>
<script>
Highcharts.chart('stackedColumns', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Producción según tipología por año'
    },
    xAxis: {
        categories: ['2015', '2016', '2017', '2018']
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Número de productos'
        },
        stackLabels: {
            enabled: true,
            style: {
                fontWeight: 'bold',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
            }
        }
    },
    legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
    tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true,
                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
            }
        }
    },
    series: [{
        name: 'GNC',
        data: [5, 3, 4, 7, 2]
    }, {
        name: 'DTI',
        data: [2, 2, 3, 2, 1]
    }, {
        name: 'ASC',
        data: [3, 4, 4, 2, 5]
    },{
        name: 'FRH',
        data: [6, 5, 1, 4, 3]
    }]
});
</script>

<div id="barras"></div>
<script>
Highcharts.chart('barras', {
	chart: {
        type: 'column'
    },
    title: {
        text: 'Producción por autor'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total productos'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
    },

    "series": [
        {
            "name": "Autores",
            "colorByPoint": true,
            "data": [
                {
                    "name": "Paulo Alonso Gaona García",
                    "y": 62,
                    "drilldown": "Paulo Alonso Gaona García"
                },
                {
                    "name": "Carlos Enrique MONTENEGRO MARIN",
                    "y": 10,
                    "drilldown": "Carlos Enrique MONTENEGRO MARIN"
                },
                {
                    "name": "Julio Barón Velandia",
                    "y": 9,
                    "drilldown": "Julio Barón Velandia"
                },
                {
                    "name": " Andres Camilo Rodriguez Villamizar",
                    "y": 1,
                    "drilldown": " Andres Camilo Rodriguez Villamizar"
                },
                {
                    "name": "Ernesto Andres Gutierrez Arrazola",
                    "y": 7,
                    "drilldown": "Ernesto Andres Gutierrez Arrazola"
                },
                {
                    "name": "Nelson Javier Cristancho Sastoque",
                    "y": 20,
                    "drilldown": "Nelson Javier Cristancho Sastoque"
                },
                {
                    "name": "Jeisson Rodrigo Piñeros Ramirez",
                    "y": 6,
                    "drilldown": "Jeisson Rodrigo Piñeros Ramirez"
                },
                {
                    "name": "Saira Esperanza Carvajal Ladino",
                    "y": 7,
                    "drilldown": "Saira Esperanza Carvajal Ladino"
                },
                {
                    "name": "Jonathan Enrique Cuspoca Ruiz",
                    "y": 12,
                    "drilldown": "Jonathan Enrique Cuspoca Ruiz"
                },
                {
                    "name": "Ronald Jared Romero Reyes",
                    "y": 35,
                    "drilldown": "Ronald Jared Romero Reyes"
                }
            ]
        }
    ],
    "drilldown": {
        "series": [
            {
                "name": "Chrome",
                "id": "Chrome",
                "data": [
                    [
                        "v65.0",
                        0.1
                    ],
                    [
                        "v64.0",
                        1.3
                    ],
                    [
                        "v63.0",
                        53.02
                    ],
                    [
                        "v62.0",
                        1.4
                    ],
                    [
                        "v61.0",
                        0.88
                    ],
                    [
                        "v60.0",
                        0.56
                    ],
                    [
                        "v59.0",
                        0.45
                    ],
                    [
                        "v58.0",
                        0.49
                    ],
                    [
                        "v57.0",
                        0.32
                    ],
                    [
                        "v56.0",
                        0.29
                    ],
                    [
                        "v55.0",
                        0.79
                    ],
                    [
                        "v54.0",
                        0.18
                    ],
                    [
                        "v51.0",
                        0.13
                    ],
                    [
                        "v49.0",
                        2.16
                    ],
                    [
                        "v48.0",
                        0.13
                    ],
                    [
                        "v47.0",
                        0.11
                    ],
                    [
                        "v43.0",
                        0.17
                    ],
                    [
                        "v29.0",
                        0.26
                    ]
                ]
            },
            {
                "name": "Firefox",
                "id": "Firefox",
                "data": [
                    [
                        "v58.0",
                        1.02
                    ],
                    [
                        "v57.0",
                        7.36
                    ],
                    [
                        "v56.0",
                        0.35
                    ],
                    [
                        "v55.0",
                        0.11
                    ],
                    [
                        "v54.0",
                        0.1
                    ],
                    [
                        "v52.0",
                        0.95
                    ],
                    [
                        "v51.0",
                        0.15
                    ],
                    [
                        "v50.0",
                        0.1
                    ],
                    [
                        "v48.0",
                        0.31
                    ],
                    [
                        "v47.0",
                        0.12
                    ]
                ]
            },
            {
                "name": "Internet Explorer",
                "id": "Internet Explorer",
                "data": [
                    [
                        "v11.0",
                        6.2
                    ],
                    [
                        "v10.0",
                        0.29
                    ],
                    [
                        "v9.0",
                        0.27
                    ],
                    [
                        "v8.0",
                        0.47
                    ]
                ]
            },
            {
                "name": "Safari",
                "id": "Safari",
                "data": [
                    [
                        "v11.0",
                        3.39
                    ],
                    [
                        "v10.1",
                        0.96
                    ],
                    [
                        "v10.0",
                        0.36
                    ],
                    [
                        "v9.1",
                        0.54
                    ],
                    [
                        "v9.0",
                        0.13
                    ],
                    [
                        "v5.1",
                        0.2
                    ]
                ]
            },
            {
                "name": "Edge",
                "id": "Edge",
                "data": [
                    [
                        "v16",
                        2.6
                    ],
                    [
                        "v15",
                        0.92
                    ],
                    [
                        "v14",
                        0.4
                    ],
                    [
                        "v13",
                        0.1
                    ]
                ]
            },
            {
                "name": "Opera",
                "id": "Opera",
                "data": [
                    [
                        "v50.0",
                        0.96
                    ],
                    [
                        "v49.0",
                        0.82
                    ],
                    [
                        "v12.1",
                        0.14
                    ]
                ]
            }
        ]
    }
});</script>

<!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
 
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>