<%@include file="../init.jsp" %>

   <script src="http://code.highcharts.com/highcharts.js"></script>
   <script src="http://code.highcharts.com/modules/exporting.js"></script>
<%
String produccionPorAutor=(String)request.getAttribute("produccionPorAutor");
String produccionPorTipologia=(String)request.getAttribute("produccionPorTipologia");
Integer anoFinVentanaObservacion=(Integer)request.getAttribute("anoFinVentanaObservacion");
String clasificacionGrupo=(String)request.getAttribute("clasificacionGrupo");
String clasificacionObjetivo=(String)request.getAttribute("clasificacionObjetivo");
%>
<!-- Info boxes -->
<div class="row">
  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-aqua"><i class="fa fa-check-circle-o"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Clasificación actual</span>
        <span class="info-box-number"><%=clasificacionGrupo %></span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-red"><i class="fa fa-line-chart"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Clasificación objetivo</span>
        <span class="info-box-number"><%=clasificacionObjetivo %></span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->

  <!-- fix for small devices only -->
  <div class="clearfix visible-sm-block"></div>

  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-green"><i class="fa fa-calendar-check-o"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Fecha limite productos convocatoria</span>
        <span class="info-box-number">31-12-<%=anoFinVentanaObservacion %></span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->

<div class="container">
	<div id="pie" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
	<br>
	<div id="barras" style="min-width: 310px; max-width: 1058px;"></div>
	<br>
</div>
<script>
var produccionPorAutor=JSON.parse('<%=produccionPorAutor %>');
var produccionPorTipologia=JSON.parse('<%=produccionPorTipologia %>');

if(produccionPorTipologia){
	var serie=[];
	produccionPorTipologia.forEach(function(producto){
		serie.push({name:producto.c_area_conocimiento,y:producto.i_num_productos});
	});
	console.log(serie);
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
	        	useHTML: true
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
	        name: 'Cantidad',
	        colorByPoint: true,
	        data: serie,
	        point:{
	            events:{
	                click: function (event) {
	                	console.log(event.point.index);
	                	
	                	dibujarGraficaModal(event.point.index);
	                	$("#myModal").modal("show");
	                }
	            }
	        }
	    }]
	});
}

if(produccionPorAutor){

	var serie=[];
	produccionPorAutor.forEach(function(producto){
		serie.push({name:producto.n_nombre,y:producto.i_num_productos,drilldown:producto.n_nombre});
	});
	console.log(serie);
	Highcharts.chart('barras', {
		chart: {
	        type: 'column'
	    },
	    scrollbar: {
	        enabled: true
	    },
	    title: {
	        text: 'Autores con mayor producción'
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
	        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b><br/>'
	    },

	    "series": [
	        {
	            "name": "Autor",
	            "colorByPoint": true,
	            "data": serie
	        }
	    ]
	    
	});
	
}


function dibujarGraficaModal(indice){
	console.log(produccionPorTipologia[indice]);
	var categorias=[];
	var serie=[];
	var produccion=produccionPorTipologia[indice];
	
	produccion.valor.forEach(function(producto){
		categorias.push(producto.c_categoria);
		serie.push(producto.i_num_productos);
	});
	
	
	Highcharts.chart('detalleTipo', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: produccion.c_area_conocimiento
	    },
	    xAxis: {
	        categories: categorias,
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Numero de productos',
	            align: 'high'
	        },
	        labels: {
	            overflow: 'justify'
	        }
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
	    series: [{
	        name: 'Productos',
	        data: serie
	    }]
	});
}
</script>

<!-- Modal -->
<div class="modal bsModal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div id="detalleTipo" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>