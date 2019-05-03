<%@include file="../init.jsp"%>
<%
String tiposProductos=(String) request.getAttribute("tiposProductos");
String productosGrupo=(String) request.getAttribute("productosGrupo");
String meta=(String) request.getAttribute("meta");
%>
<%if(meta!=null && !meta.equals("")){ %>
<div class="col-md-12">
	<div class="box box-solid">
		<div class="box-header with-border">
			<h3 class="box-title">Meta del grupo</h3>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-group" id="accordion">
				<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
				<div class="panel box box-primary">
					<div class="box-header with-border">
						<h4 class="box-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="false" class="collapsed">
								Generación de Nuevo Conocimiento </a>
						</h4>
						<div class="progress progress-sm active">
							<div id="progressBarGNC"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="0" aria-valuemin="0"
								aria-valuemax="100" style="width: 0%">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</div>
					<div id="collapseOne" class="panel-collapse collapse"
						aria-expanded="false" style="height: 0px;">
						<div class="row" id="metaGNC"></div>
					</div>
				</div>
				<div class="panel box box-danger">
					<div class="box-header with-border">
						<h4 class="box-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" class="collapsed" aria-expanded="false">
								Desarrollo Tecnológico e Innovación </a>
						</h4>
						<div class="progress progress-sm active">
							<div id="progressBarDTI"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="0" aria-valuemin="0"
								aria-valuemax="100" style="width: 0%">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</div>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					aria-expanded="false" style="height: 0px;">
					<div class="box-body">
						<div class="row" id="metaDTI"></div>
					</div>
				</div>
				<div class="panel box box-success">
					<div class="box-header with-border">
						<h4 class="box-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseThree" class="collapsed" aria-expanded="false">
								Apropiación Social del Conocimiento </a>
						</h4>
						<div class="progress progress-sm active">
							<div id="progressBarASC"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="0" aria-valuemin="0"
								aria-valuemax="100" style="width: 0%">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</div>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					aria-expanded="false" style="height: 0px;">
					<div class="box-body">
						<div class="row" id="metaASC"></div>
					</div>
				</div>
				<div class="panel box box-success">
					<div class="box-header with-border">
						<h4 class="box-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseFour" class="collapsed" aria-expanded="false">
								Formación del Recurso Humano en CTel </a>
						</h4>
						<div class="progress progress-sm active">
							<div id="progressBarFRH"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="20" aria-valuemin="0"
								aria-valuemax="100" style="width: 20%">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>
					</div>
				</div>
				<div id="collapseFour" class="panel-collapse collapse"
					aria-expanded="false" style="height: 0px;">
					<div class="box-body">
						<div class="row" id="metaFRH"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var tiposProductos=JSON.parse('<%=tiposProductos%>');
var productosGrupo=JSON.parse('<%=productosGrupo%>');
var meta=JSON.parse('[<%=meta%>]');

var productosGNC=tiposProductos.filter(producto => producto.c_area_conocimiento==="GNC");
var productosDTI=tiposProductos.filter(producto => producto.c_area_conocimiento==="DTI");
var productosFRH=tiposProductos.filter(producto => producto.c_area_conocimiento==="FRH");
var productosASC=tiposProductos.filter(producto => producto.c_area_conocimiento==="ASC");


var totalGNC=0;
var totalDTI=0;
var totalFRH=0;
var totalASC=0;
var numeroGNC=0;
var numeroDTI=0;
var numeroFRH=0;
var numeroASC=0;
console.log(meta);
meta.forEach(function(itemMeta){
	console.log(itemMeta);
	var productoGrupo=productosGrupo.filter(producto => producto.c_categoria===itemMeta.c_categoria);
	var filtroGNC=productosGNC.filter(producto => producto.k_codigo===itemMeta.c_categoria);
	var filtroDTI=productosDTI.filter(producto => producto.k_codigo===itemMeta.c_categoria);
	var filtroFRH=productosFRH.filter(producto => producto.k_codigo===itemMeta.c_categoria);
	var filtroASC=productosASC.filter(producto => producto.k_codigo===itemMeta.c_categoria);
	if(filtroGNC.length>0){
		if(productoGrupo.length>0){
			$('#metaGNC').append('<div class="col-md-4"><div class="progress-group">'+
			'<span class="progress-text">'+filtroGNC[0].n_nombre+'</span> <span class="progress-number"><b>'+productoGrupo[0].i_num_productos+'</b>/'+
			itemMeta.i_num_productos+'</span><div class="progress sm">'+
			'<div class="progress-bar progress-bar-aqua" style="width: '+((productoGrupo[0].i_num_productos*100)/itemMeta.i_num_productos)+'%"></div></div></div></div>');
			numeroGNC+=productoGrupo[0].i_num_productos;
		}else{
			$('#metaGNC').append('<div class="col-md-4"><div class="progress-group">'+
					'<span class="progress-text">'+filtroGNC[0].n_nombre+'</span> <span class="progress-number"><b>0</b>/'+
					itemMeta.i_num_productos+'</span><div class="progress sm">'+
					'<div class="progress-bar progress-bar-aqua" style="width: 0%"></div></div></div></div>');
		}
		totalGNC+=itemMeta.i_num_productos;
	}
	if(filtroDTI.length>0){
		if(productoGrupo.length>0){
			$('#metaDTI').append('<div class="col-md-4"><div class="progress-group">'+
			'<span class="progress-text">'+filtroDTI[0].n_nombre+'</span> <span class="progress-number"><b>'+productoGrupo[0].i_num_productos+'</b>/'+
			itemMeta.i_num_productos+'</span><div class="progress sm">'+
			'<div class="progress-bar progress-bar-aqua" style="width: '+((productoGrupo[0].i_num_productos*100)/itemMeta.i_num_productos)+'%"></div></div></div></div>');
			numeroDTI+=productoGrupo[0].i_num_productos;
		}else{
			$('#metaDTI').append('<div class="col-md-4"><div class="progress-group">'+
					'<span class="progress-text">'+filtroDTI[0].n_nombre+'</span> <span class="progress-number"><b>0</b>/'+
					itemMeta.i_num_productos+'</span><div class="progress sm">'+
					'<div class="progress-bar progress-bar-aqua" style="width: 0%"></div></div></div></div>');
		}
		totalDTI+=itemMeta.i_num_productos;
	}
	if(filtroFRH.length>0){
		if(productoGrupo.length>0){
			$('#metaFRH').append('<div class="col-md-4"><div class="progress-group">'+
			'<span class="progress-text">'+filtroFRH[0].n_nombre+'</span> <span class="progress-number"><b>'+productoGrupo[0].i_num_productos+'</b>/'+
			itemMeta.i_num_productos+'</span><div class="progress sm">'+
			'<div class="progress-bar progress-bar-aqua" style="width: '+((productoGrupo[0].i_num_productos*100)/itemMeta.i_num_productos)+'%"></div></div></div></div>');
			numeroFRH+=productoGrupo[0].i_num_productos;
		}else{
			$('#metaFRH').append('<div class="col-md-4"><div class="progress-group">'+
					'<span class="progress-text">'+filtroFRH[0].n_nombre+'</span> <span class="progress-number"><b>0</b>/'+
					itemMeta.i_num_productos+'</span><div class="progress sm">'+
					'<div class="progress-bar progress-bar-aqua" style="width: 0%"></div></div></div></div>');
		}
		totalFRH+=itemMeta.i_num_productos;
	}
	if(filtroASC.length>0){
		if(productoGrupo.length>0){
			$('#metaASC').append('<div class="col-md-4"><div class="progress-group">'+
			'<span class="progress-text">'+filtroASC[0].n_nombre+'</span> <span class="progress-number"><b>'+productoGrupo[0].i_num_productos+'</b>/'+
			itemMeta.i_num_productos+'</span><div class="progress sm">'+
			'<div class="progress-bar progress-bar-aqua" style="width: '+((productoGrupo[0].i_num_productos*100)/itemMeta.i_num_productos)+'%"></div></div></div></div>');
			numeroASC+=productoGrupo[0].i_num_productos;
		}else{
			$('#metaASC').append('<div class="col-md-4"><div class="progress-group">'+
					'<span class="progress-text">'+filtroASC[0].n_nombre+'</span> <span class="progress-number"><b>0</b>/'+
					itemMeta.i_num_productos+'</span><div class="progress sm">'+
					'<div class="progress-bar progress-bar-aqua" style="width: 0%"></div></div></div></div>');
		}
		totalASC+=itemMeta.i_num_productos;
	}
	
});
$("#progressBarGNC").css('width',((numeroGNC*100)/totalGNC)+'%');
$("#progressBarDTI").css('width',((numeroDTI*100)/totalDTI)+'%');
$("#progressBarFRH").css('width',((numeroFRH*100)/totalFRH)+'%');
$("#progressBarASC").css('width',((numeroASC*100)/totalASC)+'%');

</script>
<%}else{%>
<div class="col-md-12">
	<div class="box box-solid">
		<div class="box-header with-border">
			<h3 class="box-title">Meta del grupo</h3>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<p>Aún no has definido una meta para tu grupo, defínela en el simulador, o en el módulo de recomendación.</p>
		</div>
	</div>
</div>
<%}%>