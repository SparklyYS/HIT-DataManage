<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>RecordBox</title>
<!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
<link href="stylesheets/bootstrap.min.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/font-awesome.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/se7en-font.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/isotope.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/jquery.fancybox.css" media="all"
	rel="stylesheet" type="text/css" />
<link href="stylesheets/fullcalendar.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/wizard.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/select2.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/morris.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/datatables.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/datepicker.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/timepicker.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/colorpicker.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/bootstrap-switch.css" media="all"
	rel="stylesheet" type="text/css" />
<link href="stylesheets/daterange-picker.css" media="all"
	rel="stylesheet" type="text/css" />
<link href="stylesheets/typeahead.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/summernote.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/pygments.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/style.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="stylesheets/color/green.css" media="all"
	rel="alternate stylesheet" title="green-theme" type="text/css" />
<link href="stylesheets/color/orange.css" media="all"
	rel="alternate stylesheet" title="orange-theme" type="text/css" />
<link href="stylesheets/color/magenta.css" media="all"
	rel="alternate stylesheet" title="magenta-theme" type="text/css" />
<link href="stylesheets/color/gray.css" media="all"
	rel="alternate stylesheet" title="gray-theme" type="text/css" />
<script src="javascripts/jquery.min.js" type="text/javascript"></script>
<script src="javascripts/jquery-ui.js" type="text/javascript"></script>
<script src="javascripts/bootstrap.min.js" type="text/javascript"></script>
<script src="javascripts/raphael.min.js" type="text/javascript"></script>
<script src="javascripts/selectivizr-min.js" type="text/javascript"></script>
<script src="javascripts/jquery.mousewheel.js" type="text/javascript"></script>
<script src="javascripts/jquery.vmap.min.js" type="text/javascript"></script>
<script src="javascripts/jquery.vmap.sampledata.js"
	type="text/javascript"></script>
<script src="javascripts/jquery.vmap.world.js" type="text/javascript"></script>
<script src="javascripts/jquery.bootstrap.wizard.js"
	type="text/javascript"></script>
<script src="javascripts/fullcalendar.min.js" type="text/javascript"></script>
<script src="javascripts/gcal.js" type="text/javascript"></script>
<script src="javascripts/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="javascripts/datatable-editable.js" type="text/javascript"></script>
<script src="javascripts/jquery.easy-pie-chart.js"
	type="text/javascript"></script>
<script src="javascripts/excanvas.min.js" type="text/javascript"></script>
<script src="javascripts/jquery.isotope.min.js" type="text/javascript"></script>
<script src="javascripts/isotope_extras.js" type="text/javascript"></script>
<script src="javascripts/modernizr.custom.js" type="text/javascript"></script>
<script src="javascripts/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="javascripts/select2.js" type="text/javascript"></script>
<script src="javascripts/styleswitcher.js" type="text/javascript"></script>
<script src="javascripts/wysiwyg.js" type="text/javascript"></script>
<script src="javascripts/summernote.min.js" type="text/javascript"></script>
<script src="javascripts/jquery.inputmask.min.js" type="text/javascript"></script>
<script src="javascripts/jquery.validate.js" type="text/javascript"></script>
<script src="javascripts/bootstrap-fileupload.js" type="text/javascript"></script>
<script src="javascripts/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="javascripts/bootstrap-timepicker.js" type="text/javascript"></script>
<script src="javascripts/bootstrap-colorpicker.js"
	type="text/javascript"></script>
<script src="javascripts/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="javascripts/typeahead.js" type="text/javascript"></script>
<script src="javascripts/daterange-picker.js" type="text/javascript"></script>
<script src="javascripts/date.js" type="text/javascript"></script>
<script src="javascripts/morris.min.js" type="text/javascript"></script>
<script src="javascripts/skycons.js" type="text/javascript"></script>
<script src="javascripts/fitvids.js" type="text/javascript"></script>
<script src="javascripts/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="javascripts/main.js" type="text/javascript"></script>
<script src="javascripts/respond.js" type="text/javascript"></script>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">
</head>
<body>
	<div class="modal-shiftfix">
		<!-- Navigation -->
		<div class="navbar navbar-fixed-top scroll-hide">
			<div class="container-fluid top-bar">
				<div class="pull-right">
					<ul class="nav navbar-nav pull-right">
						<li class="dropdown user hidden-xs"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"> <img width="34" height="34"
								src="images/avatar-male.jpg" />${sessionScope.userName}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"> <i class="icon-user"></i>个人主页
								</a></li>
								<li><a href="LogOutAction"> <i class="icon-signout"></i>登出
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
				<a class="navbar-brand" href="#">RecordBox</a>
			</div>
			<div class="container-fluid main-nav clearfix">
				<div class="nav-collapse">
					<ul class="nav">
						<li><a href="HomeAction"><span aria-hidden="true"
								class="se7en-home"></span>主页</a></li>
						<li><a class="current" href="ShowPDOAction"> <span
								aria-hidden="true" class="se7en-forms"></span>我的个人数据
						</a></li>
						<li><a href="charts.html"> <span aria-hidden="true"
								class="se7en-pages"></span>添加事件
						</a></li>
						<li><a href="charts.html"> <span aria-hidden="true"
								class="icon-search"></span>按维度搜索
						</a></li>
						<li><a href="charts.html"> <span aria-hidden="true"
								class="icon-user"></span>个人主页
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Navigation -->
		<div class="container-fluid main-content">
			<!-- Statistics -->
			<div class="row">
				<div class="col-lg-12">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-tasks"></i>新建PDO
							<button class="btn btn-sm btn-primary-outline pull-right"
								id="add-row" onclick="Hello()">
								<i class="icon-plus"></i>添加属性
							</button>
						</div>
						<table class="table table-bordered table-striped"
							id="tabletemplate" style="display: none">
							<thead>
							</thead>
							<tbody>
								<tr>
									<td name="No" width=6%></td>
									<td><input id="property" name="headers"
										class="form-control"></td>
									<td>
										<button id="Button2" onclick="deltr(this)"
											class='btn btn-danger btn-sm glyphicon glyphicon-remove row-remove'></button>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="widget-content padded clearfix">
							<form action="AddPDOAction" method="post" name="form">
								<table class="table table-bordered table-striped"
									id="dynamictable">
									<thead>
										<tr>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td width=6%>PDO名称</td>
											<td><input name="PDOName" class="form-control">
											</td>
										</tr>
										<tr>
											<td name="No" width=6%>属性ID: 1</td>
											<td><input id="property" name="headers[0]"
												class="form-control"></td>
											<td>
												<button id="Button2" onclick="deltr(this)"
													class='btn btn-danger btn-sm glyphicon glyphicon-remove row-remove'></button>
											</td>
										</tr>
									</tbody>
								</table>
								<button id="submit" type="submit"
									class="btn btn-primary pull-right">提交</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- end DataTables Example -->
		</div>
	</div>
	<script>
		function Hello() {
			$('#tabletemplate tbody tr').clone()
					.appendTo('#dynamictable tbody');
			ChangeIndex();
		}
		
		function ChangeIndex() {
			var index = -1;
			$('#dynamictable tbody tr').each(
					function() {
						$(this).find("td[name='No']").html(
								"属性ID: " + (index + 1));
						$(this).find("input[id='property']").attr("name",
								"headers" + "[" + index + "]");
						index++;
					});
		}

		function deltr(opp) {
			var length = $('#dynamictable tbody tr').length;
			if (length <= 2) {
				alert('至少保留一个属性');
			} else {
				$(opp).parent().parent().remove();
				ChangeIndex();
			}
		}
	</script>

</body>

</html>