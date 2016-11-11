<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>RecordBox</title>
<!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
<link rel="stylesheet" href="reveal.css">
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


<script type="text/javascript" src="jquery-1.6.min.js"></script>
<script type="text/javascript" src="jquery.reveal.js"></script>

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
<script src="javascripts/jquery.reveal.js" type="text/javascript"></script>
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

			<div class="col-md-12">
				<div class="widget-container fluid-height clearfix">
					<div class="heading">
						<i class="icon-briefcase"></i>
						<span id="PDOName"><s:property value="PDOName" /></span>
					</div>
					<div class="widget-content padded clearfix">
						<div class="table-responsive">
							<table class="table">
								<thead id="table_head">
									<tr>
									<th style="display: none">id</th>
									<s:iterator value="headers" var="head">
										<th><s:property value="#head" /></th>
									</s:iterator>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="data" var="row">
										<tr>
											<s:iterator value="#row" var="cell" status="judge">
												<s:if test="#judge.getIndex == 0">
													<td name="data" style="display: none"><s:property
															value="#cell" /></td>
												</s:if>
												<s:if test="#judge.getIndex != 0">
													<td name="data"><s:property value="#cell" /></td>
												</s:if>
											</s:iterator>
											<td>
												<div>
													<span class="myclass">
													<button id="Edit" data-title="Edit" data-toggle="modal"
														data-target="#edit" class="btn btn-xs btn-warning">
														<i class="icon-pencil"></i>编辑
													</button>
													</span>
<%-- 													<s:url var="deleteurl" value="DeleteEventAction">
														<s:param name="PDOName" value="%{PDOName}"></s:param>
														<s:param name="eventID" value="%{#row[0]}"></s:param>
													</s:url> --%>
													<span class="deleteclass">
														<button class="btn btn-xs btn-danger filter-can">
															<i class="icon-remove"></i>删除
														</button>
													</span>
												</div>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- end Responsive Table -->
		</div>
	</div>

	<!-- begin of the dialog -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">编辑事件</h4>
				</div>
				<form action="EditEventAction" method="post" name="form">
				<div class="modal-body" id="Dynamic_Modal">
				</div>
				<div class="modal-footer ">
						<button type="submit" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span>提交更新
						</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End of the dialog -->
	
	<!-- begin of the delete dialog -->
	  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
	      <div class="modal-dialog">
	    <div class="modal-content">
	          <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
	        <h4 class="modal-title custom_align" id="Heading">提示</h4>
	      </div>
	      <!-- Begin the form 指定action -->
	      <form name="form" action="deleteclass" method="post">
	      <div class="modal-body" id="Delete_Modal">
	       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>您确定要删除该事件吗？</div>
	      	</div>
	        <div class="modal-footer ">
	        <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>确定</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>取消</button>
	        </div>
	       </form>
	       <!-- End the form -->
	        </div>
	    <!-- /.modal-content --> 
	  </div>
	      <!-- /.modal-dialog --> 
	    </div>
	<!-- End of the delete dialog -->
	

	<script type="text/javascript">
	    $(".myclass").each(function(){
	      var btn = $(this).children();
	      btn.bind("click", function(event) {
	        /* Act on the event */
	        //delete Every rows before
	        $('#Dynamic_Modal').find("div[class='form-group']").each(function(){
	          $(this).remove();
	        });
	        var headers = [];
	        $('#table_head').find('th').each(function() {
	        headers.push($(this).text());
	        });
	        var PDOName = $('#PDOName').text();
	        $('#Dynamic_Modal')
			.append(
					"<div class='form-group' style='display:none'><input class='form-control' type='text' name='PDOName' value="+PDOName+"></input></div>");
	        var index = -1;
	        $(this).closest('tr').find("td[name='data']").each(function() {
	          //Data Cell's value
	          var Cell = $(this).text();

	          if(index == -1){
	          $('#Dynamic_Modal').append("<div class='form-group' style='display:none'><label>"+headers[0]+"</label><input class='form-control' type='text' name='eventID' value="+Cell+"></input></div>");

	          }else{
	          $('#Dynamic_Modal').append("<div class='form-group'><label>"+headers[index+1]+"</label><input class='form-control' type='text' name=" +"data"+"["+index+"] value="+Cell+"></input></div>");
	          }
	          index++;
	        });
	      });
	    });
	  </script>
	  
  	<script type="text/javascript">
	    $('.deleteclass').each(function(){
	      var btn = $(this).children();
	      btn.bind('click', function(event) {
	        /* Act on the event */
	        //delete Every rows before
	        $('#Delete_Modal').find("div[class='form-group']").each(function(){
	          $(this).remove();
	        });
	        //Get PDOName
	        var PDOName = $('#PDOName').text();
	        // alert(PDOName);
	        //Get EventID
	        var EventID = $(this).parent().parent().parent().parent().find("td:first").text();
	        // alert(EventID);
	        //Add PDOName row
	        $('#Delete_Modal').append("<div class='form-group' style='display:none'><input class='form-control' type='text' name='PDOName' value="+PDOName+"></input></div>");
	
	        //Add EventID row
	        $('#Delete_Modal').append("<div class='form-group' style='display:none'><input class='form-control' type='text' name='eventID' value="+EventID+"></input></div>");
	
	      });
	    })
  	</script>
  	
  	
</body>
</html>