<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>Training System search practice</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo_main.css">
</head>

<body>
	<div id="main-wrapper">

		<!-- 导航 -->
		<jsp:include page="/WEB-INF/jsp/common/navigate.jsp"></jsp:include>

		<div class="template-page-wrapper">

			<!-- 菜单 -->
			<jsp:include page="/WEB-INF/jsp/admin/menu.jsp"></jsp:include>

			<div class="templatemo-content-wrapper">
				<div class="templatemo-content">
					<!--导航-->
					<ol class="breadcrumb">
						<li><a href="index.html">Admin Panel</a></li>
						<li class="active">View Practice Score</li>
					</ol>

					<div class="row">
						<div class="col-md-12">
							<div class="btn-group pull-right"	>
								<form class="navbar-form">
									<input type="text" class="form-control" id="sec_box_admin" placeholder="Search...by name"/>
									<input type="button" value="search" id="sec_btn_admin" class="btn btn-default" />
								</form>
							</div>

							<div class="table-responsive">
								<h3 class="margin-bottom-15">view trainee practice</h3>
								<table class="table table-striped table-hover table-bordered">
									<thead>
										<tr>
											<th width="10%">#id</th>
											<th width="10%">trainee name</th>
											<th width="10%">course name</th>
											<th width="10%">score</th>
											<th>score description</th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
								<div class="input_message">
									<div style="color: red" align="center">please input search condition</span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- 页脚 -->
			<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

		</div>
	</div>

	<script src="http://libs.useso.com/js/jquery/2.0.3/jquery.min.js"></script>
	<script src="http://libs.useso.com/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!-- <script src="http://apps.bdimg.com/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/js/templatemo_script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script src="${pageContext.request.contextPath}/js/practice.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/validator/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/personValidate.js"></script>
</body>
</html>