<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>Trainer-practice</title>
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
			<jsp:include page="/WEB-INF/jsp/trainee/menu.jsp"></jsp:include>
			<!--/.navbar-collapse -->

			<div class="templatemo-content-wrapper">
				<div class="templatemo-content">

					<ol class="breadcrumb">
						<li>Trainee Panel</li>
						<li class="active">Term View</li>
						<li class="active">Usergroup View</li>
					</ol>

					<div class="row">
						<div class="col-md-12">

							<div class="table-responsive">
								<h4 class="margin-bottom-15">Term View</h4>
								<table class="table table-striped table-hover table-bordered ">
									<thead>
										<tr>
											<th>#id</th>
											<th>Group Name</th>
											<th>Discription</th>
											<th>Users Name</th>
										</tr>
									</thead>
									<tbody id="tbodycourses" class="text-left">
										<tr>
											<td>1</td>
											<td>A组</td>
											<td>分组A描述</td>
											<td>trainee</td>
										</tr>
										<tr>
											<td>1</td>
											<td>A组</td>
											<td>分组A描述</td>
											<td>Davis Zhang</td>
										</tr>
										<tr>
											<td>1</td>
											<td>A组</td>
											<td>分组A描述</td>
											<td>Hiram Huang</td>
										</tr>
										<tr>
											<td>1</td>
											<td>A组</td>
											<td>分组A描述</td>
											<td>Jennifer Tian</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="practiceManageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="practiceModalH4"></h4>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>

			<!-- 页脚 -->
			<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
		</div>
		<script src="http://libs.useso.com/js/jquery/2.0.3/jquery.min.js"></script>
		<script src="http://libs.useso.com/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/templatemo_script.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
		<script src="${pageContext.request.contextPath}/js/viewPractice.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/validator/js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/personValidate.js"></script>

	</div>
</body>
</html>