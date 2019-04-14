<%@include file="../init.jsp" %>

<script src="http://code.highcharts.com/highcharts.js"></script>
   <script src="http://code.highcharts.com/modules/exporting.js"></script>
<portlet:actionURL name="seleccionMetodo" var="actionForm"></portlet:actionURL>

<form id="formularioExtraccion" action="<%=actionForm%>" method="POST">
<div class="form-group">
                  <label>Tipología</label>
                  <select class="form-control" id="tipologia">
                    <option>GNC</option>
                    <option>DTI</option>
                    <option>ASC</option>
                    <option>FRH</option>
                  </select>
</div>

<div class="form-group">
                  <label>Tipo de producto</label>
                  <select class="form-control" id="tipoProducto" disabled>
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
</div>
</form>
<div id="contenedor"></div>
<script type="text/javascript">

</script>

<script>
$("#tipologia").change(function(){
	$("#tipoProducto").attr("disabled", false);
});

$("#tipoProducto").change(function(){
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
	            categories: ['2008', '2009', '2010', '2011', '2012', '2013',
	                '2014', '2015', '2016', '2017', '2018']
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
	        series: [{
	            name: 'ART_A1',
	            data: [3.0, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
	        }, {
	            name: 'LIB_A1',
	            data: [0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
	        }, {
	            name: 'CAP_LIB_A1',
	            data: [0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
	        }, {
	            name: 'SF_A',
	            data: [4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
	        }]
	    });
	});
});
</script>