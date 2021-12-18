<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
	<link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8">	
 	function updateConfirm(){
			 var member_password = $('#member_password').val();	
			 var board_num = $('#board_num').val();
			 var type = $("#type").val();
			 var title = $('#title').val();
			 var content = $('#content').val();
			 var pw = member_password.length;			 
			 var message = confirm("정말 수정하시겠습니까?");
			 
			 var memberJson = new Object();
			 memberJson.member_password = member_password;
			 memberJson.board_num =board_num;
			 memberJson.type =type;
			 memberJson.title =title;
			 memberJson.content =content;
 
			 if(type == ""){
				 alert("게시글 구분을 선택해주세요.");
				 return;
			 }else if (member_password==""){
				 alert("패스워드를 입력해 주세요");
				 return;
				 
			 }else if(title == ""){
				 alert("타이틀을 입력해 주세요");
				 return;
			 }else if(content == ""){
				 alert("내용을 입력해 주세요");
				 return;
			 }else if(message== true){
				 $.ajax({
			            type : 'POST',
			            data : memberJson,
			            url : "/board/UpdateCheck",
			            success : function(data) {
			            	console.log(data.cnt);
			                if (data.cnt == 0) {
			                	//패스워드가 같지 않을 경우 수정되지 않는다.
			                    alert("패스워드가 다릅니다. 수정할 수 없습니다.");
			                    $("#title").focus();                
			                } else {
			                    alert("정상적으로 게시글이 수정 됩니다.");	
			                    location.href="/board/view?board_num="+board_num+"";
			                }
			            },
			            error : function(error) {			                
			                alert("error : " + error);
			            }
			        });
				
			 }else{
				 return;
			 }
	 } 
	 </script>
</head>
<body class="bg-gradient-primary">
<div class="container">
	<form id="form" action="/board/update" method="post">
	<c:forEach items="${dto}" var="board" >
  	<h3>게시글 수정</h3>	 
	<table class="table">
				<tr> 
					<td>구분 :</td>
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
								  <option value="기타">web</option>
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
							 	<input type="hidden" name="board_num" id="board_num" value="${board.board_num}">
								<input class="form-control" type="text" name="title" id="title" value="${board.title}">
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>내용 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<textarea class="form-control" name="content" id="content" rows="13">${board.content}</textarea>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>작성일자 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<fmt:formatDate value="${board.board_regdate}" pattern="yyy-MM-dd hh:mm:ss"/><p>
						</div>
					</td>	
				</tr>		
				<tr> 
					<td>이름 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="name" value="${board.member_id}" disabled><p>
							</div>
						</div>
					</td>	
				</tr>	
				<tr> 
					<td>비밀번호 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="password" name="member_password" id="member_password"><p>
								※게시글의 비밀번호를 입력 후 수정이 가능합니다.
							</div>
						</div>
					</td>	
				</tr>					
			</table>
	    <div align="right">
	  			<input type="button" class="btn btn-default" id="insertBtn" onclick="location.href='/board/view?board_num=${board.board_num}'" value="돌아가기">
	  			<input type="button" class="btn btn-warning" id="updateBtn" onclick="updateConfirm()" value="작성 완료" >
		</div><br><br>	 
		</c:forEach>
	</form>
	
</div>
</body>
</html>