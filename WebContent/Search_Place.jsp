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
.userimg {
	margin-top: 100px;
	width: 20px;
	height: 20px;
	border-radius: 200px;
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
								src="images/avatar-male.jpg" />vachester<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"> <i class="icon-user"></i>个人主页
								</a></li>
								<li><a href="#"> <i class="icon-gear"></i>账户设置
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
						<li><a href="ShowPDOAction"> <span aria-hidden="true"
								class="se7en-forms"></span>我的个人数据
						</a></li>
						<li><a href="charts.html"> <span aria-hidden="true"
								class="se7en-pages"></span>添加事件
						</a></li>
						<li><a class="current" href="Search.jsp"> <span
								aria-hidden="true" class="icon-search"></span>按维度搜索
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
			<div class="col-sm-3">
				<div class="widget-container fluid-height">
					<div class="widget-content">
						<div class="panel-group" id="accordion">
							<div class="panel">
								<div class="panel-heading">
									<div class="panel-title">
										<a class="accordion-toggle" data-parent="#accordion"
											data-toggle="collapse" href="#collapseOne">
											<div class="caret pull-right"></div>维度选择
										</a>
									</div>
								</div>
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">
										<div class="form-group">
											<label class="checkbox-inline"> <input id="checktime"
												class="checkclass" name="checkAll" type="checkbox"><span></span>时间
											</label> <label class="checkbox-inline"> <input
												id="checkplace" class="checkclass" name="checkAll"
												type="checkbox"><span></span>地点
											</label> <label class="checkbox-inline"> <input
												id="checkperson" class="checkclass" name="checkAll"
												type="checkbox"><span></span>人物
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="panel filter-categories">
								<div class="panel-heading">
									<div class="panel-title">
										<a class="accordion-toggle" data-parent="#accordion"
											data-toggle="collapse" href="#collapseO">
											<div class="pull-right"></div> 搜索关键词
										</a>
									</div>
								</div>
								<div class="panel">
									<div class="panel-body">
										<!-- datepicker -->
										<table id="time_key" class="table" style="display: none">
											<thead>
												<tr>
													<th>起始时间: <input type="text"
														class="span2 form-control" value="" id="dpd1">
													</th>
													<th>截止时间: <input type="text"
														class="span2 form-control" value="" id="dpd2">
													</th>
												</tr>
											</thead>
										</table>
										<!-- search for the place -->
										<div id="place_key" class="form-group" style="display: none">
											<label><b>地点关键词</b></label> <input id="place" type="text"
												class="form-control" value="">
										</div>
										<!-- search for the person -->
										<div id="person_key" class="form-group" style="display: none">
											<label><b>人物关键词</b></label> <input id="person" type="text"
												class="form-control" value="">
										</div>
										<!-- search button -->
										<div style="display: none" id="search">
											<button class="btn btn-success btn-block" id="search_btn">搜索</button>
											<form name="form" action="" method="post">
												<input style="display: none" type="text" name="choice" />
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid main-content">
				<ul class="timeline animated">
					<s:iterator value="results" var="event">
						<li>
							<div class="timeline-icon">
								<img class="userimg" src="images/avatar-male.jpg">
							</div>
							<div class="timeline-content">
								<h2>
									<s:property value="#event.PDOName" />
								</h2>
								<div class="table-responsive">
								<table class="table">
									<thead id="table_head">
										<tr>
											<s:iterator value="#event.headers" var="head">
												<th><s:property value="#head" /></th>
											</s:iterator>
										</tr>
									</thead>
									<tbody>
										<tr>
											<s:iterator value="#event.values" var="value">
												<td><s:property value="#value" /></td>
											</s:iterator>
										</tr>
									</tbody>
								</table>
								</div>
<%-- 								<div class="panel">
									<s:iterator value="#event.link" var="l">
										<s:url var="url" value="ShowLinkAction">
											<s:param name="link" value="%{#l}"></s:param>
										</s:url>
										<s:a href="%{url}"><s:property value="#l" /></s:a>
									</s:iterator>
								</div> --%>
								<div class="panel">
									<div class="panel-body">
										<div class="col-xs-1 col-md-1 col-sm-2 col-xs-3 text-center">
                                    	<a href="" class="btn-social btn-instagram" title="时间"></a>
                                		</div>
									</div>
								</div>
							</div>
						</li>

					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
	
	  <script>
  	$(document).ready(function(){
  		//refresh the page
  		$('.checkclass').each(function(){
  			$(this).attr("checked", false);
  		});
  		
  		//set cookie
  		$.cookie("timestatus", "0");
  		$.cookie("placestatus", "0");
  		$.cookie("personstatus", "0");
  	});
  </script>

  <script type="text/javascript">
      var timestatus = $.cookie("timestatus");
      $('#checktime').change(function(){
        if(timestatus == "0"){
          $('#time_key').fadeIn();
          timestatus = "1";
        }else{
          $('#dpd1').val("");
          $('#dpd2').val("");
          $('#time_key').fadeOut();
          timestatus = "0";
        }
      });

      var placestatus = $.cookie("placestatus");
      $('#checkplace').change(function(){
        if(placestatus == "0"){
          $('#place_key').fadeIn();
          placestatus = "1";
        }else{
          $("#place").val("");
          $('#place_key').fadeOut();
          placestatus = "0";
        }
      });

      var personstatus = $.cookie("personstatus");
      $('#checkperson').change(function(){
        if(personstatus == "0"){
          $('#person_key').fadeIn();
          personstatus = "1";
        }else{
          $("#person").val("");
          $('#person_key').fadeOut();
          personstatus = "0";
        }
      });

      var searchstatus = "";
      $('.checkclass').change(function(){
        searchstatus = "";
        $('.checkclass').each(function(){
          if($(this).is(':checked')){
            searchstatus += "1";
          }else{
            searchstatus += "0";
          }
        })

        if(searchstatus == "000"){
          $('#search').fadeOut();
        }else{
          $('#search').fadeIn();
        }
      });

      $('#search_btn').click(function(){
        var res = searchstatus;
        
        //start time
        var str = $('#dpd1').val();
        if(str == ""){
          res = res +  "/"; //空则增加空格
        }else{
          var arr = str.split("/");
          str = arr[2] + "-" + arr[0] + "-" + arr[1];
          res = res + "/" + str;
        }

        //end time
        str = $('#dpd2').val();
        if(str == ""){
          res = res; //空则增加空格
        }else{
          var arr = str.split("/");
          str = arr[2] + "-" + arr[0] + "-" + arr[1];
          res = res + "&" + str;
        }

        //place
        str = $('#place').val();
        if(str == ""){
          res = res + "/ "; //空则增加空格
        }else{
          res = res + "/" + str;
        }

        //person
        str = $('#person').val();
        if(str == ""){
          res = res + "/ ";
        }else{
          res = res + "/" + str;
        }
        $('input[name="choice"]').val(res);
        $('form[name="form"]').submit();
      });

  </script>
</body>

</html>
