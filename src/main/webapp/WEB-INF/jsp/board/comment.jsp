<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	 <script type="text/javascript" charset="utf-8">

	 function insertCom(){
			var writer = $('#writer').val();
			var member_password = $('#s').val();
			var comment = $('#comment').val();
			
			var pw = member_password.length;
			
		 if(writer == ""){
			 alert("작성자를 입력해 주세요");
			 return;
		 }else if(member_password == ""){
			 alert("패스워드를 입력해 주세요");
			 return;
		 }else if (isNaN(member_password)==true || 10 < pw){
			 alert("패스워드는 10자리 이하 숫자만 입력해 주세요");
			 return;
		 }else if(4 > pw){
			 alert("패스워드는 4자리 이상 입력해 주세요");
		 }else if(comment == ""){
		 
			 alert("작성할 댓글을 입력해 주세요");
			 return;
		 }else{
			 $('#commentForm').submit();
		 }
	 }
	 
	function deleteCom(code){
		 var member_password = $('#member_password'+code).val();	
		 var comment_code = $('#comment_code'+code).val();
		 
		 var memberJson = new Object();		 
		 memberJson.member_password = member_password;
		 memberJson.comment_code = comment_code;
		 
		 if(member_password == ""){
			 alert("패스워드를 입력해 주세요");
			 return;
		 }else{
		 $.ajax({
	            type : 'POST',
	            data : memberJson,
	            url : "/board/deleteCheck",
	            success : function(data) {
	            	console.log(data.cnt);
	                if (data.cnt == 0) {
	                	
	                	//패스워드가 같지 않을 경우 수정되지 않는다.
	                    alert("패스워드가 다릅니다. 삭제할 수 없습니다.");
	                    $("#member_password"+code).focus(); 
	                    
	                } else {
	                    alert("정상적으로 댓글이 삭제 됩니다.");		
	                    location.reload();
						titleck = 1;		                    
	                }
	            },
	            error : function(error) {			                
	                alert("error : " + error);
	            }
	        });
		}
	} 
	 </script>
</head>
<body class="bg-gradient-primary">
	<div class="container">
	       <div id="commentList">
	         	<table class="table table-responsive">
	         		<tr>
	         			<td style="background-color:#F6F6F6;" colspan="4"><h5>댓글 목록  ▼</h5></td>
	         		</tr>
	         		<tr>
	         			<td align="center">내용</td>
	         			<td>등록자</td>
	         			<td>등록일</td>
	         			<td align="center">실행</td>
	         		</tr>
	         	<c:choose>	
         			<c:when test="${fn:length(C_dto) > 0}">
	         			<c:forEach items="${C_dto}" var="commentList" >	         	
	         		<tr>
	         			<td style="width:60%;">${commentList.comment}</td>
	         			<td>${commentList.writer}</td>
	         			<td><fmt:formatDate value="${commentList.comment_regdate}" pattern="yyy-MM-dd "/></td>
	         			<td align="center"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal${commentList.comment_code}" >삭제</button> 
	         		
	         		<!-- 댓글 삭제 모달 팝업 -->
	         		<!-- myModal 해당 리스트마다 id 값 이 같았기 때문에 첫번쩨  modal 만 가지고 왔던 거였음 ! ${commentList.comment_code}를 이용헤서 각각 아이디를 다르게 부여함 -->
						<div class="modal fade" id="myModal${commentList.comment_code}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<h4 class="modal-title" id="myModalLabel" align="left">댓글 삭제</h4>
						      </div>
						      <div class="modal-body" align="left">
							    <form id="deletecomform${commentList.comment_code}" name="deletecomform" method="post">
										<table class="table">
											<tr> 
												<td align="center">
												<input type="hidden" id="comment_code${commentList.comment_code}"  name="comment_code" value="${commentList.comment_code}">
													해당 댓글을 삭제 하시려면 비밀번호를 입력하여야 합니다.
												</td>
											</tr>
											<tr>
												<td>
													<input class="form-control" type="password"  id="member_password${commentList.comment_code}"  name="member_password" />									
												</td>	
											</tr>											
										</table>
								      <div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											<button type="button" onclick="deleteCom(${commentList.comment_code})" class="btn btn-info">삭제</button>
								      </div>
								</form>					      	
						      </div>
						    </div>
						  </div>
						</div>					
					<!-- 모달 팝업  끝 -->	   	         				  			
	         		</tr>
  			    </c:forEach> 
  			    	</c:when>
					<c:otherwise>  
								<tr > 
									<td colspan="4">해당 게시물에는 댓글이 없습니다.</td>
							 	</tr> 
				 	</c:otherwise> 
			 	</c:choose>      	
	         	</table>	
			 </div>	
			 		 		    

    <form id="commentForm" name="commentForm" method="post" action="/board/insertComment">
    <c:forEach items="${dto}" var="board" >
	    <br><br>
	        <div>
	            <div>
	            
	            <c:choose>
				    <c:when test="${login.member_id == null}">
				    <table class="table"> 
		                <tr>
		         			<td style="background-color:#F6F6F6;" colspan="4"><h5>댓글 작성  ▼</h5></td>
		         		</tr> 
		         		<tr>
			         		<td>
			   				 댓글 작성은 로그인 후 이용이 가능합니다.<a href="/"> >>로그인 페이지로 이동</a> <br><br> 
			   				 </td>
		   				 </tr>
	   				 </table>
				    </c:when>
			    <c:otherwise>
			        <table class="table"> 
		                <tr>
		         			<td style="background-color:#F6F6F6;" colspan="4"><h5>댓글 작성  ▼</h5></td>
		         		</tr> 
		                <tr>
		                	<td>
		                		작성자 :
		                	</td>
		                	<td>	     		                		
								<div class="col-xs-4">
									${login.member_id}( ${login.member_name} )
		               		 		 <input class="form-control" type="hidden" id="writer" name="writer" value="${login.member_id}"/> 
		               			</div>             			
		                	</td>
		                </tr> 
		                <tr>
		                	<td>
		                		비밀번호 :
		                			<input type="hidden" id="parent_num" name="parent_num" value="${board.board_num}" /> 
		        					<input type="hidden" id="board_num" name="board_num" value="${board.board_num}" />
		                	</td>
		                	<td>	     		                		
								<div class="col-xs-4">
		               		 		 <input class="form-control" type="password" id="s" name="member_password" /> 
		               			</div>             			
		                	</td>
		                </tr>                   
		                    <tr>
		                        <td colspan="2">
		                        	<div class="col-xs-10" >
			                            <textarea class="form-control" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
			                            <br>
		                            </div>
		                            <div class="col-xs-2" align="center">
		                            <button type="button" class="btn btn-success" onclick="insertCom()">댓글 등록</button>	                  
		                            </div>
		                        </td>
		                    </tr>
		                </table>	
				    </c:otherwise>
				</c:choose>			          
	            </div>
	        </div> 
      </c:forEach>       
   		 </form>
	</div> 	 
</body>
</html>
