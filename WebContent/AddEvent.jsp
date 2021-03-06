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
<script src="./javascripts/jquery.cookie.js" type="text/javascript"></script>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">

<style type="text/css">
.visible-lg {
	margin-top: 10px;
}
</style>
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
								src="images/avatar-male.jpg" />${sessionScope.userName}<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
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
						<li><a href="QuickAddEvent"> <span aria-hidden="true"
								class="se7en-pages"></span>添加事件
						</a></li>
						<li><a href="Search.jsp"> <span aria-hidden="true"
								class="icon-search"></span>按维度搜索
						</a></li>
						<li><button class="btn btn-success" id="event_add">添加事件</button></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Navigation -->
		<div class="container-fluid main-content">
			<!-- Statistics -->
			<%-- 			<div class="col-md-3 visible-md visible-lg">
				<div class="widget-container fluid-height">
					<div class="heading">
						<i class="icon-calendar"></i>添加事件
					</div>
					<div class="widget-content padded">
						<s:iterator value="pdoHeaders.keySet()" var="pdo">
							<div class="external-events">
								<div class="heading" id="PDOName"><i class="icon-briefcase"></i><s:property value="#pdo" /></div>
								<s:iterator value="pdoHeaders[#pdo]" var="head">
								<div class="form-group">
								<label><b><s:property value="#head" /></b></label>
								<input class="input form-control" name="data" id="event_title" type="text" value="">
								</div>
								</s:iterator>
							</div>
						</s:iterator>
						<form id="form" name="form" action="AddEventAction" method="post">
						</form>
					</div>
				</div>
			</div> --%>

			<s:iterator value="pdoHeaders.keySet()" var="pdo">
				<div class="col-md-3 visible-md visible-lg">
					<div class="widget-container fluid-height">
						<div class="heading">
							<i class="icon-calendar"></i>添加事件
						</div>
						<div class="widget-content padded">
							<div class="external-events">
								<div class="heading" id="PDOName"><i class="icon-briefcase"></i><s:property value="#pdo" /></div>
								<s:iterator value="pdoHeaders[#pdo]" var="head">
									<div class="form-group">
										<label><b><s:property value="#head" /></b></label>
										<s:if test="#head == '时间'">
											<input class="input form-control" name="data"
												id="event_title" type="date" value="2016-01-01">
										</s:if>
										<s:else>
											<input class="input form-control" name="data"
												id="event_title" type="text" value="">
										</s:else>
									</div>
								</s:iterator>
							</div>
							<form id="form" name="form" action="AddEventAction" method="post">
							</form>
						</div>
					</div>
				</div>
			</s:iterator>

		</div>
	</div>

	<script>
		$('#event_add')
				.click(
						function() {
							var data = "";
							$('.external-events').each(function() {
								//Add PDOName to the str
								data += $(this).find('#PDOName').text();
								var InputList = $(this).find("input");
								InputList.each(function() {
									if ($(this).val() == "") {
										data = data + "&" + " ";
									} else {
										data = data + "&" + $(this).val();//Add Property value to the str
									}
								});
								data += "/";
							});
							data = data.substring(0, data.length - 1);
							$('#form')
									.append(
											"<input style='display:none' name='data' type='text' value="+data+">");
							$('#form').submit();

						});
	</script>
</body>
</html>
