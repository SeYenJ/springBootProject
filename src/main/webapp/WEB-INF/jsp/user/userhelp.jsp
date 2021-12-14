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
	<link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
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
<body>
	<div class="container">
		<h3><img src="/resources/images/find.png" width="30px">아이디 찾기</h3>	
				<h4>아이디는 가입시 등록한 메일 주소를 입력하여 찾을 수 있습니다. 가입할 때 등록한 메일 주소를 입력하고  "ID찾기" 버튼을 클릭해 주세요.</h4>
				<form id ="idCheckFrom" action="idCheck" >
					<input class="form-control" type="text" id="member_name" name="member_name" placeholder="Name" ><br>
					<input class="form-control" type="text" id="member_email" name="member_email" placeholder="Email Address" ><br>
					<div align="right">
						<input type="submit" class="btn btn-default" value="ID 찾기" >
						<input type="button" class="btn btn-default" id="cancel" value="취소" >
					</div>
				</form>  	
	</div>
</body>
</html>