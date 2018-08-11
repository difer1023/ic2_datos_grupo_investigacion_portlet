<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<!-- Info boxes -->
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">CPU Traffic</span>
              <span class="info-box-number">90<small>%</small></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Likes</span>
              <span class="info-box-number">41,410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Sales</span>
              <span class="info-box-number">760</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-line-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Clasificacion</span>
              <span class="info-box-number">C</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
		
      <div class="row">
	      <div class="col-md-8">
	      	<div class="box box-default">
	            <div class="box-header with-border">
	              <h3 class="box-title">Produccion General</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="row">
	                <div class="col-md-8">
	                  <div class="chart-responsive">
	                    <canvas id="pieChart" height="350"></canvas>
	                  </div>
	                  <!-- ./chart-responsive -->
	                </div>
	                <!-- /.col -->
	                <div class="col-md-4">
	                  <ul class="chart-legend clearfix">
	                    <li><i class="fa fa-circle-o text-red"></i> Generacion nuevo conocimiento</li>
	                    <li><i class="fa fa-circle-o text-green"></i> Desarrollo tecnologico e innovacion</li>
	                    <li><i class="fa fa-circle-o text-yellow"></i> Apropiacion social de conocimiento</li>
	                    <li><i class="fa fa-circle-o text-aqua"></i> Formacion de recurso humano CTI Tipo A</li>
	                    <li><i class="fa fa-circle-o text-light-blue"></i> Formacion de recurso humano CTI Tipo B</li>
	                  </ul>
	                </div>
	                <!-- /.col -->
	              </div>
	              <!-- /.row -->
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer no-padding">
	              <ul class="nav nav-pills nav-stacked">
	                <li><a href="#">United States of America
	                  <span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>
	                <li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a>
	                </li>
	                <li><a href="#">China
	                  <span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>
	              </ul>
	            </div>
	            <!-- /.footer -->
	          </div>
	          <!-- /.box -->
          </div>
	          <div class="col-md-4">
	          	<div class="box box-default">
	          		<div class="box-header with-border">
	              <h3 class="box-title">Indicadores</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	          		<div class="row">
	                <div class="col-md-12">
	                  <div class="progress-group">
	                    <span class="progress-text">Productos TOP</span>
	                    <span class="progress-number"><b>160</b>/200</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-aqua" style="width: 20%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                  <div class="progress-group">
	                    <span class="progress-text">Productos A</span>
	                    <span class="progress-number"><b>310</b>/400</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-red" style="width: 80%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                  <div class="progress-group">
	                    <span class="progress-text">Productos B</span>
	                    <span class="progress-number"><b>480</b>/800</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-green" style="width: 80%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                  <div class="progress-group">
	                    <span class="progress-text">Productos Apropiacion Social de Conocimiento</span>
	                    <span class="progress-number"><b>250</b>/500</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-yellow" style="width: 80%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                  <div class="progress-group">
	                    <span class="progress-text">Formacion de recurso humano CTI Tipo A</span>
	                    <span class="progress-number"><b>250</b>/500</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-blue" style="width: 80%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                  <div class="progress-group">
	                    <span class="progress-text">Formacion de recurso humano CTI Tipo B</span>
	                    <span class="progress-number"><b>250</b>/500</span>
	
	                    <div class="progress sm">
	                      <div class="progress-bar progress-bar-blue" style="width: 80%"></div>
	                    </div>
	                  </div>
	                  <!-- /.progress-group -->
	                </div>
	                <!-- /.col -->
	              </div>
	              <!-- /.row -->
	              </div>
	          	</div>
	          </div>
      </div>
      <!-- /.row -->

	  <div class="row">
	  	
	  </div>
	  <!-- /.row -->
      
      <script src="<%=request.getContextPath()%>/js/graphics.js?v1.1"></script>