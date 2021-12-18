<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인 페이지</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
 	<script type="text/javascript" charset="utf-8">
	 $(document).ready(function(){
		 	//기존 쿠기 값 가져오기
			 var key = getCookie("key");
			 $("#member_id").val(key);
			 
			 if($("#member_id").val() != ""){
			 	$("#rememberId").attr("checked",true); 
		 		}
			 
		 	//아이디 저장 체크박스를 클릭한 경우	
			 $("#rememberId").change(function(){
				 if($("#rememberId").is(":checked")){
					 setCookie("key", $("#member_id").val(),7);
	
				 }else{//id 저장하기 체크 해제 시
					 deleteCookie("key");	 
				 }
			 });	
		 	
	 		 //ID 저장하기를 한 상태에서 ID를 입력하는 경우 
			 $("#member_id").keyup(function(){
				 if($("#rememberId").is(":checked")){
					 setCookie("key", $("#member_id").val(),7);
				 }
			 }); 
	 		 
	 		 //로그인 실패할 경우
		 	if ("${msg}"== "failure"){
		 		alert("잘못된 로그인 정보입니다.다시 입력해 주세요");
		 		$('#member_id').focus();
		 	}
	 		 
		 	//로그인 유효성 검사
		 	$("#loginButton").click(function(){
		 		var member_id = $("#member_id").val();
		 		var member_password = $("#member_password").val();
		 		if(member_id == ""){
		 			alert("아이디를 입력하여 주세요.");
		 			return;
		 		}
		 		
		 		if(member_password == ""){
		 			alert("패스워드를 입력하여 주세요.");
		 			return;
		 		}	 		
		 		document.loginFrom.action="${path}/user/loginCheck"		 		
		 		document.loginFrom.submit();	 		
		 	});
		 	
		 	//로그아웃 할경우 alert();
		 	$("#logout").click(function(){
		 		alert("정상적으로 로그아웃 되었습니다.");
		 		window.location.href = "/user/logout";	 		
			 	});
			 });
	 
	 		//쿠키 등록 ,저장 ,삭제
			function setCookie(cookieName, value, exdays){
		 	    var exdate = new Date();
		 	    exdate.setDate(exdate.getDate() + exdays);
		 	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		 	    document.cookie = cookieName + "=" + cookieValue;
		 	}
		 	 
		 	function deleteCookie(cookieName){
		 	    var expireDate = new Date();
		 	    expireDate.setDate(expireDate.getDate() - 1);
		 	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		 	}
		 	 
		 	function getCookie(cookieName) {
		 	    cookieName = cookieName + '=';
		 	    var cookieData = document.cookie;
		 	    var start = cookieData.indexOf(cookieName);
		 	    var cookieValue = '';
		 	    if(start != -1){
		 	        start += cookieName.length;
		 	        var end = cookieData.indexOf(';', start);
		 	        if(end == -1)end = cookieData.length;
		 	        cookieValue = cookieData.substring(start, end);
		 	    }
		 	    return unescape(cookieValue);
		 	}
 	
 	</script>	 
</head>
<body  class="bg-gradient-primary">

<div class="container">

	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
							<c:choose>
								<c:when test="${sessionScope.member_id == null ||sessionScope.member_id == ''}">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form name="loginFrom" method="post" action="/user/loginCheck">
										<div class="form-group">
											<input type="text" name="member_id" id ="member_id" class="form-control form-control-user" aria-describedby="emailHelp"
												   placeholder="ID">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												   name="member_password" id="member_password" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck">
												<label class="custom-control-label" for="customCheck" id="rememberId">아이디저장</label>
											</div>
										</div>
										<a class="btn btn-primary btn-user btn-block" id="loginButton" >
											Login
										</a>
										<hr>
									</form>
									<div class="text-center">
										<a class="small" href="/user/userhelp">아이디 찾기</a> |
										<a class="small" href="/user/join">회원가입</a>
									</div>
								</c:when>
							</c:choose>
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