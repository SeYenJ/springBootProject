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
	<link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
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
<body>
	<br><br>
	<div class="container" align="center">	
		<c:choose>
		    <c:when test="${sessionScope.member_id == null ||sessionScope.member_id == ''}"><br>
		 		<div align="center">
		 			<a href="/"><img src="/resources/images/welcome.png" width="200px"/></a><h1>Login</h1>
			 		 <form name="loginFrom" method="post" action="/user/loginCheck">
						<div class="form-group row">
							 <div class="col-xs-12">
								<input class="form-control" type="text" name="member_id" id ="member_id" placeholder="아이디를 입력하세요."><p>
							</div>
						</div>
						<div class="form-group row">
							 <div class="col-xs-12">
								<input class="form-control" type="password" name="member_password" id="member_password" placeholder="패스워드를 입력하세요.">									
							</div>
						</div>
						<div class="form-group row">
						<input type="button" id="loginButton" style="WIDTH:95%;HEIGHT:25pt;border:#F2CB61;" value="Login">
						</div>
						<div align="center">
						&nbsp &nbsp 아이디 저장 &nbsp <input type="checkbox" id="rememberId" >
						</div>
						<hr>
						<a href="/user/userhelp">아이디 찾기</a> |	
						<!-- <a href="">비밀번호 찾기</a> | -->			
						<a href="/user/join">회원가입</a>		
					 </form>		
				</div>			  
		    </c:when>
		    <c:otherwise>
		    		<img src="/resources/images/welcome.png" width="400px"/><p>
	      			<h3>${sessionScope.member_name}(${sessionScope.member_id}) 님 반갑습니다.</h3><br>
				<div align="center">
					<hr><br>
					<a href="/">메인으로</a> ||	
					<a href="board/content">게시글 작성</a> 
				</div>	
		    </c:otherwise>
		</c:choose>	
	</div>
</body>
</html>