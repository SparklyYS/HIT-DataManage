<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!-- saved from url=(0043)file:///E:/JavaWEB/RecordBoxTest/index.html -->
<html
	class="csstransforms csstransforms3d csstransitions js flexbox flexboxlegacy canvas canvastext postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RecordBox</title>
<!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
<link href="./MyFiles_files/bootstrap.min.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/font-awesome.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/se7en-font.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/isotope.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/jquery.fancybox.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/fullcalendar.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/wizard.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/select2.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/morris.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/datatables.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/datepicker.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/timepicker.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/colorpicker.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/bootstrap-switch.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/daterange-picker.css" media="all"
	rel="stylesheet" type="text/css">
<link href="./MyFiles_files/typeahead.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/summernote.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/pygments.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/style.css" media="all" rel="stylesheet"
	type="text/css">
<link href="./MyFiles_files/green.css" media="all"
	rel="alternate stylesheet" title="green-theme" type="text/css">
<link href="./MyFiles_files/orange.css" media="all"
	rel="alternate stylesheet" title="orange-theme" type="text/css">
<link href="./MyFiles_files/magenta.css" media="all"
	rel="alternate stylesheet" title="magenta-theme" type="text/css">
<link href="./MyFiles_files/gray.css" media="all"
	rel="alternate stylesheet" title="gray-theme" type="text/css">
<div class="fit-vids-style" id="fit-vids-style" style="display: none;">
	­
	<style>
.fluid-width-video-wrapper {
	width: 100%;
	position: relative;
	padding: 0;
}

.fluid-width-video-wrapper iframe, .fluid-width-video-wrapper object,
	.fluid-width-video-wrapper embed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</div>
<script src="./MyFiles_files/jquery.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery-ui.js" type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/raphael.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/selectivizr-min.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.mousewheel.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/jquery.vmap.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.vmap.sampledata.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/jquery.vmap.world.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/jquery.bootstrap.wizard.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/fullcalendar.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/gcal.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/datatable-editable.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/jquery.easy-pie-chart.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/excanvas.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.isotope.min.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/isotope_extras.js" type="text/javascript"></script>
<script src="./MyFiles_files/modernizr.custom.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.fancybox.pack.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/select2.js" type="text/javascript"></script>
<script src="./MyFiles_files/styleswitcher.js" type="text/javascript"></script>
<script src="./MyFiles_files/wysiwyg.js" type="text/javascript"></script>
<script src="./MyFiles_files/summernote.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.inputmask.min.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/jquery.validate.js" type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap-fileupload.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap-datepicker.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap-timepicker.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap-colorpicker.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/bootstrap-switch.min.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/typeahead.js" type="text/javascript"></script>
<script src="./MyFiles_files/daterange-picker.js" type="text/javascript"></script>
<script src="./MyFiles_files/date.js" type="text/javascript"></script>
<script src="./MyFiles_files/morris.min.js" type="text/javascript"></script>
<script src="./MyFiles_files/skycons.js" type="text/javascript"></script>
<script src="./MyFiles_files/fitvids.js" type="text/javascript"></script>
<script src="./MyFiles_files/jquery.sparkline.min.js"
	type="text/javascript"></script>
<script src="./MyFiles_files/main.js" type="text/javascript"></script>
<script src="./MyFiles_files/respond.js" type="text/javascript"></script>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">
<style type="text/css">
.fancybox-margin {
	margin-right: 0px;
}
</style>
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>
<body>
	<div class="modal-shiftfix">
		<!-- Navigation -->
		<div class="navbar navbar-fixed-top scroll-hide"
			style="overflow: visible;">
			<div class="container-fluid top-bar">
				<div class="pull-right">
					<ul class="nav navbar-nav pull-right">
						<li class="dropdown user hidden-xs"><a data-toggle="dropdown"
							class="dropdown-toggle"
							href="file:///E:/JavaWEB/RecordBoxTest/index.html#"> <img
								width="34" height="34" src="./MyFiles_files/avatar-male.jpg">${sessionScope.userName}<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="file:///E:/JavaWEB/RecordBoxTest/index.html#">
										<i class="icon-user"></i>个人主页
								</a></li>
								<li><a href="LogOutAction">
										<i class="icon-signout"></i>登出
								</a></li>
							</ul></li>
					</ul>
				</div>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="file:///E:/JavaWEB/RecordBoxTest/index.html#">RecordBox</a>
			</div>
			<div class="container-fluid main-nav clearfix">
				<div class="nav-collapse">
					<ul class="nav">
						<li><a href="HomeAction"><span aria-hidden="true"
								class="se7en-home"></span>主页</a></li>
						<li><a class="current" href="ShowPDOAction"> <span
								aria-hidden="true" class="se7en-forms"></span>我的个人数据
						</a></li>
						<li><a href="file:///E:/JavaWEB/RecordBoxTest/charts.html">
								<span aria-hidden="true" class="se7en-pages"></span>添加事件
						</a></li>
						<li><a href="file:///E:/JavaWEB/RecordBoxTest/charts.html">
								<span aria-hidden="true" class="icon-search"></span>按维度搜索
						</a></li>
						<li><a href="file:///E:/JavaWEB/RecordBoxTest/charts.html">
								<span aria-hidden="true" class="icon-user"></span>个人主页
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container-fluid main-content">
			<div class="page-title"></div>
			<!-- DataTables Example -->
			<div class="row">
				<div class="col-lg-12">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<div class="col-md-5">
								<a href="AddPDO.jsp">
									<button id="sample_editable_1_new" class="btn btn-success">
										<i class="icon-plus"></i>新建PDO
									</button>
								</a>
							</div>
							<div class="pull-right">
								<div class="btn-group">
									<button class="btn btn-info">
										<i class="fa fa-file-text"> </i>添加事件
									</button>
									<button data-title="Edit" data-toggle="modal"
										data-target="#edit" class="btn btn-info">
										<i class="fa fa-file"> </i>Excel导入
									</button>
								</div>
							</div>
						</div>
						<div class="widget-content padded clearfix">
							<table class="table table-bordered table-striped" id="dataTable1">
								<thead>
									<th class="check-header hidden-xs"><label><input
											id="checkAll" name="checkAll" type="checkbox"><span></span></label>
									</th>
									<th>数据名</th>
									<th>事件数</th>
									<th class="hidden-xs">创建时间</th>
									<th style="display: none">最近修改时间</th>
									<th style="display: none">status</th>
									<th></th>
								</thead>
								<tbody>
									<s:iterator value="pdos" var="pdo">
										<tr>
											<td class="check hidden-xs"><label><input
													name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
											</td>
											<td><s:url var="eventurl" value="ShowEventAction">
													<s:param name="PDOName" value="%{#pdo.pdoName}"></s:param>
												</s:url> <s:a href="%{eventurl}">
													<s:property value="#pdo.pdoName" />
												</s:a></td>
											<td><s:property value="#pdo.count" /></td>
											<td class="hidden-xs"><s:date name="#pdo.t"
													format="yyyy/MM/dd HH:mm:ss" /></td>
											<td style="display: none">2016/11/3</td>
											<td style="display: none">Approved</td>
											<td class="actions"><s:url var="deleteurl"
													value="DeletePDOAction">
													<s:param name="PDOName" value="%{#pdo.pdoName}"></s:param>
												</s:url> <s:a href="%{deleteurl}">
													<div class="action-buttons">
														<i class="icon-trash"></i>
													</div>
												</s:a></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- end DataTables Example -->
		</div>
	</div>

	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Excel文件导入</h4>
				</div>
				<!-- Contents should be follow the real data -->
				<form action="ImportPDOAction" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="file" name="excelFile">
					</div>
					<!-- End the Modal Contents  -->
					<div class="modal-footer ">
						<button type="submit" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign">导入</span>
						</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>


</body>
</html>