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
	<link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script>
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
<body class="bg-gradient-primary">
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
  			<input type="button" class="btn btn-default" id="updateBtn" onclick="location.href='/board/updatPage?board_num=${board.board_num}'" value="글 수정" >
  			<input type="button" class="btn btn-default" id="deleteBtn" value="글  삭제" onclick="countReply();">
	</c:if>
  			<input type="button" class="btn btn-warning" id="insertBtn" onclick="location.href='/board'" value="목록 보기">
	</div><br><br>	 
	</c:forEach>
	</form>
</div>	
		<jsp:include page="comment.jsp"/>
</body>
</html>