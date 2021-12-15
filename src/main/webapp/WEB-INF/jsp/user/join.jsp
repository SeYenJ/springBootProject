<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	function joinChk(){
		if($("#member_dprtm").val() ==""){
			alert("부서를 선택해주세요.");
			
		}else if($("#member_rank").val() ==""){
			alert("직급을 선택해주세요.");
			
		}else if($("#member_id").val() ==""){
			alert("ID를 입력해 주세요.");
			
		}else if($("#member_name").val() ==""){
			alert("이름을 입력해주세요.");
			
		}else if($("#member_email").val() ==""){
			alert("이메일를 입력해 주세요.");
			
		}else if($("#member_password").val() ==""){
			alert("비밀번호를 입력해 주세요.");
			
		}else{
			document.getElementById('form').submit(); 
		}
		
	}
	
	</script>
</head>
<body>
	<div class="container">
		<form id="form" action="/user/insertMember" method="POST">
			<h3><img src="/resources/images/join.png" width="50px"/><img src="/resources/images/joinpage.PNG" width="150px"/></h3><p><br>
			<table class="table">
				<tr> 
					<td>부서 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<select class="form-control" name="member_dprtm" id="member_dprtm">
							 	  <option value="">선택</option>
								  <option value="SQM부">SQM부</option>
								  <option value="SI사업부">SI사업부</option>
								  <option value="SM사업부">SM사업부</option>
								  <option value="Cloud신사업부">Cloud신사업부</option>
								</select>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>직급 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<select class="form-control" name="member_rank" id="member_rank">
							 	  <option value="">선택</option>
								  <option value="사원">사원</option>
								  <option value="대리">대리</option>
								  <option value="과장">과장</option>
								  <option value="차장">차장</option>
								  <option value="부장">부장</option>
								  <option value="이사">이사</option>
								  <option value="대표">대표</option>
								</select>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>아이디 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_id" id="member_id"><p>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>이름 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_name" id="member_name"><p>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>E-mail :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_email" id="member_email"><p>
							</div>
						</div>
					</td>	
				</tr>		
				<tr> 
					<td>PW :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="password" name="member_password" id="member_password" ><p>
							</div>
						</div>
					</td>	
				</tr>						
			</table>
			<br>
					<div class="row">
			<div class="col-md-10" align="left">
				<input class="btn btn-default" type='reset'>
			</div>
			<div class="col-md-2" align="right">
  				<input type="button" class="btn btn-info" id="updateBtn"  value="완료" onClick="joinChk()">
				<button type="button" class="btn btn-default" onclick="location.href='/'">취소</button>		
			</div>
		</div>	
		</form>
	
	</div>
</body>
</html>