<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	 var g_count =1;	
	 function insertCon(){
			var member_id = $('#member_id').val();
			var type = $("#type").val();
			var title = $('#title').val();
			var bcontent = $('#bcontent').val();
			var member_password = $('#member_password').val();
			var uploadfile = $('#uploadfile').val();
			var pw = member_password.length;
			
		 if(uploadfile!=""){
			 var extName = uploadfile.substr(uploadfile.length - 3); 
			 
			  if(extName!="GIF"&&extName!="PNG"&&extName!="JPG"&&extName!="gif"&&extName!="png"&&extName!="jpg"){
				  alert("이미지 파일만 저장이 가능합니다.")
				  return;
			  }
		}
		//제목 중복 체크
	 	 var titleck = 0;
		 if(member_id == ""){
			 alert("작성자를 입력해 주세요");
		 }else if(type == ""){
			 alert("게시글 구분을 선택해주세요.");
		 }else if(title == ""){
			 alert("타이틀을 입력해 주세요");
		 }else if(bcontent == ""){
			 alert("내용을 입력해 주세요");
		 }else if (isNaN(member_password)==true || 10 < pw){
			 console.log(isNaN(member_password));
			 alert("패스워드는 10자리 이하 숫자만 입력해 주세요");
		 }else if(4 > pw){
			 alert("패스워드는 4자리 이상 입력해 주세요");
		 }else{
			 $.ajax({
		            async: true,
		            type : 'POST',
		            data : title,
		            url : "/board/titleCheck",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {
		                    alert("같은 게시글이  존재합니다. 다른 제목을 입력해주세요.");
		                    $("#title").focus();                
		                } else {
		                    alert("정상적으로 게시글이 등록 됩니다.");		                    
							document.getElementById('contentForm').submit(); 
							titleck = 1;		                    
		                }
		            },
		            error : function(error) {		                
		                alert("error : " + error);
		            }
		        });
			 }
		 }
	 
	 function addfile(){
		 g_count++
		 if(g_count === 4){
			 alert("첨부파일은 3개까지 등록이 가능합니다.");
		 }else{
	         var str = "<p><input type='file' id='uploadfile_"+(g_count)+" name='uploadfile_"+(g_count)+"'/></p>";
	         $("#fileDiv").append(str);			
		 }
	 }
	 
	function getCmaFileView(obj,stype) {
	    var s = getCmaFileInfo(obj,stype);
	    alert(s);
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
				<form id="contentForm" name="contentForm" action="/board/insertContent" method="post" enctype="multipart/form-data">
					<h3>게시글 작성</h3>
					<table class="table">
							<tr>
								<td>id :
								<td>
									<div class="form-group row">
										 <div class="col-xs-10">
											${login.member_id}( ${login.member_name} )
											<input class="form-control" type="hidden" name="member_id" id="member_id" value="${login.member_id}"/>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>구분 :
								<td>
									<div class="form-group row">
										 <div class="col-xs-10">
											<select class="form-control" name="type" id="type">
											  <option value="">선택</option>
											  <option value="JAVA">JAVA</option>
											  <option value="SQL">SQL</option>
											  <option value="JSP">JSP</option>
											  <option value="javascript">javascript</option>
											  <option value="web">web</option>
											  <option value="기타">기타</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>제목 :</td>
								<td>
									<div class="form-group row">
										 <div class="col-xs-10">
											<input class="form-control" type="text" name="title" id="title"/> <p>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>내용 :</td>
								<td>
									<div class="form-group row">
										 <div class="col-xs-10">
											<textarea class="form-control" name= "bcontent" rows="13" id="bcontent"></textarea></p>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>password :</td>
								<td>
									<div class="form-group row">
										 <div class="col-xs-10">
											<input class="form-control" type="password" name="member_password" id="member_password"/><p>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>파일 :</td>
								<td>
									<div class="form-group row" >
										 <div class="col-xs-10">
											  <input type="file" name="uploadfile" id="uploadfile" placeholder="파일 선택" /><p><br>
											  <div id="fileDiv"></div>
										</div>
									</div>
								</td>
							</tr>
						</table>
				</form>

				<div class="btns" align="right">
					<input type="button" class="btn btn-dark" id="goBackBtn" onclick="location.href='/board'" value="돌아 가기">
					<input type="button" class="btn btn-primary" id="insertBtn" onclick="insertCon()" value="작성 완료">
				</div>

			</div>

		</div>
	</div>
</div>
<!-- End of Page Wrapper -->

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