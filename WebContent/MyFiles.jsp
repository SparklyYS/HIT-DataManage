<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>RecordBox</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>

<style>
#PDOtable{
	margin: 20px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="index.html">
			</a>
			<div class="menu-toggler sidebar-toggler hide">
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<i class="icon-bell"></i>
					<span class="badge badge-default">
					4 </span>
					</a>
					<ul class="dropdown-menu">
						<li class="external">
							<h3><span class="bold">4 </span>个未读的信息</h3>
							<a href="extra_profile.html">view all</a>
						</li>
						<li>
							<ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
								<li>
									<a href="javascript:;">
									<span class="time">just now</span>
									<span class="details">
									<span class="label label-sm label-icon label-danger">
									<i class="fa fa-bolt"></i>
									</span>
									删除「饮食」一个事件</span>
									</a>
								</li>
								<li>
									<a href="javascript:;">
									<span class="time">3 mins</span>
									<span class="details">
									<span class="label label-sm label-icon label-success">
									<i class="fa fa-plus"></i>
									</span>
									在「饮食」中添加事件</span>
									</a>
								</li>

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
				<li class="dropdown dropdown-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" class="img-circle" src="assets/admin/layout/img/vachester.jpg"/>
					<span class="username username-hide-on-mobile">
					vachester </span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="homepage.jsp">
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
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
			   <li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler">
					</div>
					<!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<a href="homepage.jsp">
					<i class="icon-home"></i>
					<span class="title">主页</span>
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
				<li class="start active open">
					<a href="javascript:;">
					<i class="icon-briefcase"></i>
					<span class="title">我的个人数据</span>
					<span class="selected"></span>
					</a>
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
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>
						<i class="icon-briefcase"></i>
						<a href="MyFiles.html">我的个人数据</a>
						<i class="fa fa-angle-right"></i>
					</li>
				</ul>
				<div class="page-toolbar">
					<div id="dashboard-report-range" class="pull-right tooltips btn btn-sm btn-default" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
						<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
					</div>
				</div>
			</div>
			<!-- 我的个人数据表格 -->
		    <div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>我的个人数据
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button id="sample_editable_1_new" class="btn green">
											<i class="fa fa-plus"></i>新建PDO
											</button>
										</div>
									</div>

									<div class="col-md-5 pull-right">
										<div class="btn-group">
											<button class="btn default">
												<i class="fa fa-file-text">
												</i>个人数据导入
											</button>
											<button class="btn default">
												<i class="fa fa-file">
												</i>个人数据导出
											</button>
											<button class="btn default">
												<i class="icon-docs">
												</i>添加事件
											</button>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-striped table-bordered table-hover" id="sample_1">
							<thead>
							<tr>
								<!-- <th class="table-checkbox"> -->
									<!-- <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"/> -->
								<!-- </th> -->
								<th>
									 数据名
								</th>
								<th>
									 事件数
								</th>
								<th>
									 创建时间
								</th>
								<th>
									 操作
								</th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="pdos" var="p">
							<tr class="odd gradeX">
								<!-- <td> -->
									<!-- <input type="checkbox" class="checkboxes" value="1"/> -->
								<!-- </td> -->
								<td>
								    <s:url var="detailurl"  value="ShowEventAction">
									<s:param name="PDOName" value="%{#p.PDOName}"></s:param>
									</s:url>
									<s:a href="%{detailurl}"><s:property value="%{#p.PDOName}"/></s:a>
								</td>
								<td>
									 <s:property value="%{#p.count}"/>
								</td>
								<td>
									<s:date name="#p.t" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									删除 编辑
								</td>
							</tr>
							</s:iterator>
							</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
>>>>>>> origin/vachester
				</div>
              </div>
              <div class="widget-content padded clearfix">
                <table class="table table-bordered table-striped" id="dataTable1">
                  <thead>
                    <th class="check-header hidden-xs">
                      <label><input id="checkAll" name="checkAll" type="checkbox"><span></span></label>
                    </th>
                    <th>
                      数据名
                    </th>
                    <th>
                      事件数
                    </th>
                    <th class="hidden-xs">
                      创建时间
                    </th>
                    <th style="display: none">
                      最近修改时间
                    </th>
                    <th style="display:none">
                    	status
                    </th>
                    <th></th>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="check hidden-xs">
                        <label><input name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
                      </td>
                      <td>
                       	饮食
                      </td>
                      <td>
                        12
                      </td>
                      <td class="hidden-xs">
                        2016/11/1
                      </td>
                      <td style="display: none">
						2016/11/3
                      </td>
                      <td style="display: none">
                        Approved
                      </td>
                      <td class="actions">
                        <div class="action-buttons">
						<a class="table-actions" href="#"><i class="icon-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="check hidden-xs">
                        <label><input name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
                      </td>
                      <td>
                        金钱
                      </td>
                      <td>
						50
                      </td>
                      <td class="hidden-xs">
						2016/11/1
                      </td>
                      <td style="display: none">
						2016/11/3
                      </td>
                      <td style="display:none">
                        Approved
                      </td>
                      <td class="actions">
                        <div class="action-buttons">
						<a class="table-actions" href="#"><i class="icon-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="check hidden-xs">
                        <label><input name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
                      </td>
                      <td>
                        运动
                      </td>
                      <td>
                       	30
                      </td>
                      <td class="hidden-xs">
                        2016/11/2
                      </td>
                      <td style="display: none">
						2016/11/3
                      </td>
                      <td style="display:none">
                        Pending
                      </td>
                      <td class="actions">
                        <div class="action-buttons">
						<a class="table-actions" href="#"><i class="icon-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="check hidden-xs">
                        <label><input name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
                      </td>
                      <td>
                        看书
                      </td>
                      <td>
                        5
                      </td>
                      <td class="hidden-xs">
                        2016/11/3
                      </td>
                      <td style="display: none">
                        2016/11/3
                      </td>
                      <td style="display:none">
                        Rejected
                      </td>
                      <td class="actions">
                        <div class="action-buttons">
						<a class="table-actions" href="#"><i class="icon-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="check hidden-xs">
                        <label><input name="optionsRadios1" type="checkbox" value="option1"><span></span></label>
                      </td>
                      <td>
                        学习
                      </td>
                      <td>
                        10
                      </td>
                      <td class="hidden-xs">
                        2016/11/3
                      </td>
                      <td style="display: none">
                        2016/11/3
                      </td>
                      <td style="display:none;">
                        Approved
                      </td>
                      <td class="actions">
                        <div class="action-buttons">
                        <a class="table-actions" href="#"><i class="icon-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- end DataTables Example -->
      </div>
    </div>
  	
  	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Excel文件导入</h4>
      </div>
      <!-- Contents should be follow the real data -->
      <form action="" method="post" enctype="multipart/form-data">
      <div class="modal-body">
		<input type="file" name="excelFile">
      </div>
      <!-- End the Modal Contents  -->
      <div class="modal-footer ">
        <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign">导入</span></button>
      </div>
      </form>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
</div>



</body></html>