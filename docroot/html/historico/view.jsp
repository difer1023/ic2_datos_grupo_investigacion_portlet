<%@include file="../init.jsp" %>

<%
String produccionPorAno=(String)request.getAttribute("produccionPorAno");
%>

<script src="http://code.highcharts.com/highcharts.js"></script>
   <script src="http://code.highcharts.com/modules/exporting.js"></script>
<portlet:actionURL name="seleccionMetodo" var="actionForm"></portlet:actionURL>

<form id="formularioExtraccion" action="<%=actionForm%>" method="POST">
<div class="form-group">
                  <label>Tipología</label>
                  <select class="form-control" id="tipologia">
                    <option selected>Selecciona</option>
                  </select>
</div>

<div class="form-group">
                  <label>Tipo de producto</label>
                  <select class="form-control" id="tipoProducto" disabled>
                    <option selected>Selecciona</option>
                  </select>
</div>
</form>
<div id="contenedor"></div>


<script>
var produccionPorAno=JSON.parse('<%=produccionPorAno %>');
var tipologiaSeleccionada;
if(produccionPorAno){
	produccionPorAno.forEach(function(produccion){
		$("#tipologia").append('<option value="'+produccion.c_area_conocimiento+'">'+produccion.c_area_conocimiento+'</option>');
	});
}

$("#tipologia").change(function(){
	
	tipologiaSeleccionada=produccionPorAno.filter(producto => producto.c_area_conocimiento===$("#tipologia").val());
	if(tipologiaSeleccionada.length>0){
		$("#tipoProducto option:not(option:first-child)").remove();
		tipologiaSeleccionada[0].valor.forEach(function(tipoProducto){
			$("#tipoProducto").append('<option value="'+tipoProducto.c_tipo_producto+'">'+tipoProducto.c_tipo_producto+'</option>');
		});
		$("#tipoProducto").attr("disabled", false);
	}
});

$("#tipoProducto").change(function(){
	
	var seleccion=tipologiaSeleccionada[0].valor.filter(producto => producto.c_tipo_producto==$("#tipoProducto").val());
	
	if(seleccion.length>0){
		console.log(seleccion);
		var anos=[];
		var serie=[];
		seleccion[0].valor.forEach(function(categoria){
			categoria.valor.forEach(function(detalle){
				if (anos.indexOf(detalle.i_ano)==-1) anos.push(detalle.i_ano);
			});
		});
		
		anos.sort(function(a,b){return a-b;});
		
		seleccion[0].valor.forEach(function(categoria){
			var valores=new Array(anos.length);
			valores.fill(0);
			categoria.valor.forEach(function(detalle){
				valores[anos.indexOf(detalle.i_ano)]=detalle.i_num_productos;
			});
			serie.push({name:categoria.c_categoria,data:valores});
		});
		
		$(function ($) {
		    $('#contenedor').highcharts({
		        title: {
		            text: 'Producción por año',
		            x: -20 //center
		        },
		        subtitle: {
		            text: 'Convocatoria 833',
		            x: -20
		        },
		        xAxis: {
		            categories: anos
		        },
		        yAxis: {
		            title: {
		                text: 'Número de productos'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: serie
		    });
		});
	}
});
</script>