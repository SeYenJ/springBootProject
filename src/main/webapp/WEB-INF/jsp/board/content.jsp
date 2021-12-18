<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	 var g_count =1;	
	 function insertCon(){
			var member_id = $('#member_id').val();
			var type = $("#type").val();
			var title = $('#title').val();
			var content = $('#content').val();
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
		 }else if(content == ""){
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
<body class="bg-gradient-primary">
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
								<textarea class="form-control" name= "content" rows="13" id="content"></textarea></p>
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
		<div class="container" align="right">	
			<input type="button" class="btn btn-default" id="goBackBtn" onclick="location.href='/board'" value="돌아 가기">
			<input type="button" class="btn btn-info" id="insertBtn" onclick="insertCon()" value="작성 완료">
		</div>
	</form>
</div>
</body>
</html>