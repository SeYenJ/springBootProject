<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 찾기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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

	 $(document).ready(function(){
		 
		 	if ("${check}"== "not"){
		 		 if (confirm("입력하신 정보는 가입되지 않은 정보입니다. 회원가입을 진행하시겠습니까?") == true){    //확인
		 			window.location.href = "/user/join";
		 		 }else{   //취소
		 		     return false;
		 		 }
		 	}
		 	
		 	if ("${check}"== "check"){
		 		 if (confirm("입력하신 메일의 아이디는'  ${member_id} '입니다. 로그인을 하시겠습니까?") == true){    //확인
		 			window.location.href = "/";
		 		 }else{   //취소
		 		     return false;
		 		 }
		 	}
		 	
		 	$("#cancel").click(function(){
		 		window.history.back();
		 	});
	 });
 	</script>


</head>

<body class="bg-gradient-primary">

<div class="container">

	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-2">Forgot Your ID?</h1>
									<p class="mb-4">아이디는 가입시 등록한 메일 주소를 입력하여 찾을 수 있습니다. 가입할 때 등록한 메일 주소를 입력하고 "ID찾기" 버튼을 클릭해 주세요.</p>
								</div>
								<form id ="idCheckFrom" action="idCheck" >
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											   id="member_name" name="member_name" placeholder="Name">
										<br>
										<input class="form-control form-control-user" type="email" id="member_email" name="member_email" placeholder="Email Address" >
									</div>

									<input type="submit" class="btn btn-primary btn-user btn-block" value="ID 찾기" >
									<input type="button" class="btn btn-primary btn-user btn-block" id="cancel" value="취소" >

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

</body>
</html>