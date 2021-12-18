<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>

	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8">
		function countReply (){
		//댓글이 존재하는 게시물의 삭제 처리 방지
		var count = "${count}";
		//댓글의 수가 0 보다 크면
		if(count>0){
			alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
			return;
		}
		//댓글의 수가 0이면 삭제 처리
		if(confirm("삭제 하시겠습니까?")){
			$('#form').submit();
		}
	}
	
	</script>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/board">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">woorI Community</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item">
			<a class="nav-link" href="/board">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>HOME</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
			BOARD
		</div>

		<!-- Nav Item - Tables -->
		<li class="nav-item active">
			<a class="nav-link" href="/board">
				<i class="fas fa-fw fa-table"></i>
				<span>Board</span></a>
		</li>

		<!-- Nav Item - Charts -->
		<li class="nav-item">
			<a class="nav-link" href="/chart">
				<i class="fas fa-fw fa-chart-area"></i>
				<span>Charts</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->


	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>


				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<div class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
							 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:choose>
								<c:when test="${sessionScope.login == null}">
									<button id="joinUser" class="btn btn-default" onclick="location.href='/user/join'">회원가입</button>
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" >로그인</button>
								</c:when>
								<c:otherwise>
									${login.member_dprtm}  ${login.member_name} ${login.member_rank}
									[<b class="mr-2 d-none d-lg-inline text-gray-600 small">${login.member_id}</b>]
									<img style="margin-left: 10px;" class="img-profile rounded-circle"
										 src="/resources/images/undraw_profile.svg">
									<button type="button" class="btn btn-dark btn-sm"  id="logout" style="margin-left: 10px;" onclick="location.href='/user/logout'">로그아웃</button>
								</c:otherwise>
							</c:choose>
						</div>
					</li>

				</ul>

			</nav>
			<!-- End of Topbar -->

			<div class="container">
				<form id="form" action="/board/delete">
				<c:forEach items="${dto}" var="board" >
				<h3>게시글 보기</h3>
				<table class="table">
				<tr>
					<td style="width:100px">작성일자 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								 <input type="hidden" name="board_num" value="${board.board_num}">
								 <fmt:formatDate value="${board.board_regdate}" pattern="yyy-MM-dd"/><p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>조회수 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								 ${board.views}
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>구분 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								${board.type}
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>제목 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								${board.title}
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<c:set var="uploadfile" value="${board.uploadfile}" />
									<c:choose>
										<c:when test="${uploadfile eq null or uploadfile eq ''}">

										</c:when>

										<c:otherwise>
											<div align="center" >
												<br>
												<img src="/resources/images/${board.uploadfile}" align="center" width="500px" height="300px"/>
												<br><br>
											</div>
										</c:otherwise>
									</c:choose>
								<div>
									${board.content}
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								${board.member_id}
							</div>
						</div>
					</td>
				</tr>
				</table>
				<br>
				<div align="right">
				<!-- 자신의 게시글만 관리할 수 있는 설정 -->
				<c:if test="${login.member_id eq board.member_id}">
						<input type="button" class="btn btn-primary" id="updateBtn" onclick="location.href='/board/updatPage?board_num=${board.board_num}'" value="글 수정" >
						<input type="button" class="btn btn-danger" id="deleteBtn" value="글  삭제" onclick="countReply();">
				</c:if>
						<input type="button" class="btn btn-dark" id="insertBtn" onclick="location.href='/board'" value="목록 보기">
				</div><br><br>
				</c:forEach>
				</form>
			</div>
					<jsp:include page="comment.jsp"/>
		</div>
	</div>
</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>


</body>
</html>