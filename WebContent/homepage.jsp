<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>  
<head>
    <title>
    RecordBox
    </title>
    <!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
	<link href="stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/isotope.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/fullcalendar.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/wizard.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/select2.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/morris.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/datatables.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/datepicker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/timepicker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/colorpicker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/daterange-picker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/typeahead.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/summernote.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/pygments.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
	<link href="stylesheets/color/green.css" media="all" rel="alternate stylesheet" title="green-theme" type="text/css" />
	<link href="stylesheets/color/orange.css" media="all" rel="alternate stylesheet" title="orange-theme" type="text/css" />
	<link href="stylesheets/color/magenta.css" media="all" rel="alternate stylesheet" title="magenta-theme" type="text/css" />
	<link href="stylesheets/color/gray.css" media="all" rel="alternate stylesheet" title="gray-theme" type="text/css" />
	<script src="javascripts/jquery.min.js" type="text/javascript"></script>
	<script src="javascripts/jquery-ui.js" type="text/javascript"></script>
	<script src="javascripts/bootstrap.min.js" type="text/javascript"></script>
	<script src="javascripts/raphael.min.js" type="text/javascript"></script>
	<script src="javascripts/selectivizr-min.js" type="text/javascript"></script>
	<script src="javascripts/jquery.mousewheel.js" type="text/javascript"></script>
	<script src="javascripts/jquery.vmap.min.js" type="text/javascript"></script>
	<script src="javascripts/jquery.vmap.sampledata.js" type="text/javascript"></script>
	<script src="javascripts/jquery.vmap.world.js" type="text/javascript"></script>
	<script src="javascripts/jquery.bootstrap.wizard.js" type="text/javascript"></script>
	<script src="javascripts/fullcalendar.min.js" type="text/javascript"></script>
	<script src="javascripts/gcal.js" type="text/javascript"></script>
	<script src="javascripts/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="javascripts/datatable-editable.js" type="text/javascript"></script>
	<script src="javascripts/jquery.easy-pie-chart.js" type="text/javascript"></script>
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
	<script src="javascripts/bootstrap-colorpicker.js" type="text/javascript"></script>
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
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
  </head>
  <body>
    <div class="modal-shiftfix">
      <!-- Navigation -->
      <div class="navbar navbar-fixed-top scroll-hide">
        <div class="container-fluid top-bar">
          <div class="pull-right">
            <ul class="nav navbar-nav pull-right">
              <li class="dropdown user hidden-xs"><a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img width="34" height="34" src="images/avatar-male.jpg" />vachester<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">
                    <i class="icon-user"></i>个人主页</a>
                  </li>
                  <li><a href="#">
                    <i class="icon-gear"></i>账户设置</a>
                  </li>
                  <li><a href="login1.html">
                    <i class="icon-signout"></i>登出</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">RecordBox</a>
        </div>
        <div class="container-fluid main-nav clearfix">
          <div class="nav-collapse">
            <ul class="nav">
              <li>
                <a class="current" href="homepage.jsp"><span aria-hidden="true" class="se7en-home"></span>主页</a>
              </li>
              <li><a href="MyFiles.jsp">
                <span aria-hidden="true" class="se7en-forms"></span>我的个人数据</a>
              </li>
              <li><a href="">
                <span aria-hidden="true" class="se7en-pages"></span>添加事件</a>
              </li>
              <li><a href="">
                <span aria-hidden="true" class="icon-search"></span>按维度搜索</a>
              </li>
              <li><a href="">
                <span aria-hidden="true" class="icon-user"></span>个人主页</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- End Navigation -->
      <div class="container-fluid main-content">
        <!-- Statistics -->

      </div>
    </div>
  </body>

<<<<<<< HEAD
=======
								<li>
									<a href="javascript:;">
									<span class="time">5 mins</span>
									<span class="details">
									<span class="label label-sm label-icon label-success">
									<i class="fa fa-plus"></i>
									</span>
									新建「饮食」数据对象</span>
									</a>
								</li>
								<li>
									<a href="javascript:;">
									<span class="time">20 mins</span>
									<span class="details">
									<span class="label label-sm label-icon label-warning">
									<i class="fa fa-bell-o"></i>
									</span>
									新用户注册成功</span>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" class="img-circle" src="assets/admin/layout/img/vachester.jpg"/>
					<span class="username username-hide-on-mobile">
					vachester </span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="extra_profile.html">
							<i class="icon-user"></i>我的主页</a>
						</li>
						<li>
							<a href="page_calendar.html">
							<i class="icon-calendar"></i>我的RecordBox</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="extra_lock.html">
							<i class="icon-lock"></i> 锁 屏</a>
						</li>
						<li>
							<a href="login.html">
							<i class="icon-key"></i> 登 出 </a>
						</li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
				<!-- BEGIN QUICK SIDEBAR TOGGLER -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a href="javascript:;" class="dropdown-toggle">
					<i class="icon-logout"></i>
					</a>
				</li>
				<!-- END QUICK SIDEBAR TOGGLER -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div style="position:fixed"class="page-sidebar-wrapper">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
			   <li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler">
					</div>
					<!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="start active open">
					<a href="javascript:;">
					<i class="icon-home"></i>
					<span class="title">主页</span>
					<span class="selected"></span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-paper-plane"></i>
					<span class="title">
					多维度搜索</span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-docs"></i>
					<span class="title">添加事件</span>
					</a>
				</li>
				<li>
					<s:url var="myfile" value="ShowPDOAction"></s:url>
					<s:a href="%{myfile}">
					<i class="icon-briefcase"></i>
					<span class="title">我的个人数据</span>
					</s:a>
				</li>
<!-- 				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->
				<li>
					<a href="javascript:;">
					<i class="icon-user"></i>
					<span class="title">我的主页</span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-settings"></i>
					<span class="title">设置</span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-logout"></i>
					<span class="title">登 出</span>
					</a>
				</li>
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn blue">Save changes</button>
							<button type="button" class="btn default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="index.html">主页</a>
						<i class="fa fa-angle-right"></i>
					</li>
				</ul>
				<div class="page-toolbar">
					<div id="dashboard-report-range" class="pull-right tooltips btn btn-sm btn-default" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
						<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="../../assets/global/plugins/respond.min.js"></script>
<script src="../../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->
<script src="assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/index.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   QuickSidebar.init(); // init quick sidebar
Demo.init(); // init demo features
   Index.init();   
   Index.initDashboardDaterange();
   Index.initJQVMAP(); // init index page's custom scripts
   Index.initCalendar(); // init index page's custom scripts
   Index.initCharts(); // init index page's custom scripts
   Index.initChat();
   Index.initMiniCharts();
   Tasks.initDashboardWidget();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
>>>>>>> origin/vachester
</html>