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
			<jsp:include page="/WEB-INF/jsp/trainer/menu.jsp"></jsp:include>
			<!--/.navbar-collapse -->

			<div class="templatemo-content-wrapper">
				<div class="templatemo-content">

					<ol class="breadcrumb">
						<li>Trainer Panel</li>
						<li><a href="${pageContext.request.contextPath}/trainer/practice/view">Course Manage</a></li>
						<li class="active">Practice Progress View</li>
					</ol>

					<div class="row">
						<div class="col-md-12">

							<div class="table-responsive">
								<h4 class="margin-bottom-15">${course.name} Course's Practice Progress</h4>
								<table class="table table-striped table-hover table-bordered ">
									<thead>
										<tr>
											<th>Trainee Name</th>
											<th>Weather Finish Practice</th>
											<th>Weather Input Grade</th>
											<th>Practice View</th>
											<th>Grade Manage</th>
										</tr>
									</thead>
									<tbody id="tbodycourses" class="text-left">
										<c:forEach items="${pageResult.rows}" var="practice">
											<tr>
												<td>${practice.user.loginname}</td>
												<td>
													<c:if test="${practice.status == 0}">
														<span style="color: red;">no</span>
													</c:if> 
													<c:if test="${practice.status == 1 || practice.status == 2}">
														<span style="color: green;">yes</span>
													</c:if>
												</td>
												<td>
													<c:if test="${practice.status == 0 || practice.status == 1}">
														<span style="color: red;">no</span>
													</c:if> 
													<c:if test="${practice.status == 2}">
														<span style="color: green;">yes</span>
													</c:if>
												</td>
												<td>
													<c:if test="${practice.status == 0}">
														<span style="color: red;">Trainee's practice don't complete </span>
													</c:if> 
													<c:if test="${practice.status == 1 || practice.status == 2}">
														<input type="button" name="viewPracticeContent" class="btn btn-primary" value="Practice View"/>
													</c:if> 
													<input type="hidden" value="${practice.content}"/>
												</td>
												<td>
													<c:if test="${practice.status == 1}">
														<input type="button" name="inputScore" class="btn btn-primary" value="Input Score"/>
													</c:if> 
													<c:if test="${practice.status == 2}">
														${practice.score}分
														<input type="button" name="inputScore" class="btn btn-primary" value="Edit Score"/>
													</c:if>
													<input type="hidden" value="${practice.id}"/>
													<input type="hidden" value="${practice.score}"/>
													<input type="hidden" value="${practice.scoreDescription}"/>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- page begin  -->
							<span style="font-weight: 700;float: left;margin-top: 30px;color: #0071e4;">All(${pageResult.totalRows})</span>
							<div style="float: right">
								<ul class="pagination">
									<c:if test="${pageResult.currentPage-1<=0}">
										<li class="disabled"><a href="#">&emsp;&nbsp;first&emsp;&nbsp;</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage-1>0}">
										<li><a href="viewDetail?page=1&id=${course.id}">&emsp;&nbsp;first&emsp;&nbsp;</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage-1<=0}">
										<li class="disabled"><a href="#">Previous</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage-1>0}">
										<li><a href="viewDetail?page=${pageResult.currentPage-1}&id=${course.id}">Previous</a></li>
									</c:if>
									<li><a href="" style="color: black;">&emsp;&nbsp;${pageResult.currentPage}/${pageResult.totalPages}&emsp;&nbsp;</a></li>
									<c:if test="${pageResult.currentPage+1>pageResult.totalPages}">
										<li class="disabled"><a href="#">&emsp;&nbsp;next&emsp;&nbsp;</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage+1<=pageResult.totalPages}">
										<li><a href="viewDetail?page=${pageResult.currentPage+1}&id=${course.id}">&emsp;&nbsp;next&emsp;&nbsp;</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage+1>pageResult.totalPages}">
										<li class="disabled"><a href="#">&emsp;&nbsp;last&emsp;&nbsp;</a></li>
									</c:if>
									<c:if test="${pageResult.currentPage+1<=pageResult.totalPages}">
										<li><a href="viewDetail?page=${pageResult.totalPages}&id=${course.id}">&emsp;&nbsp;last&emsp;&nbsp;</a></li>
									</c:if>
								</ul>
							</div>
							<!-- page end  -->
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="practiceViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title">${course.name} Course Practice Check</h4>
						</div>
						<div class="modal-body">
           					<script id="practiceViewContainer" name="editcontent" type="text/plain"></script>
        				</div>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="inputScoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="false">
				<div class="modal-dialog">
					<form class="form-horizontal" role="form">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title">${course.name} Course Practice Score</h4>
							</div>
							<div class="modal-body">
								<input id="practiceId" type="hidden"/>
								<div class="form-group">
									<label class="col-sm-2 control-label">Score</label>
									<div class="col-sm-10">
	           							<input id="practiceScore" type="text" class="form-control" placeholder="The points system used percentile"/>
	           						</div>
	           					</div>
	           					<div class="form-group">
									<label class="col-sm-2 control-label">Description</label>
									<div class="col-sm-10">
	           							<textarea id="practiceScoreDescription" class="form-control" rows="3"></textarea>
	           						</div>
	           					</div>
	        				</div>
	        				<div class="modal-footer">
								<a id="confirmScore" class="btn btn-primary">Commit</a>
							</div>
						</div>
					</form>
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