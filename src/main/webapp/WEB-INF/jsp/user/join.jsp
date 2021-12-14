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
</head>
<body>
	<div class="container">
		<form id="form" action="/user/insertMember" method="POST">
			<h3><img src="/resources/images/join.png" width="50px"/><img src="/resources/images/joinpage.PNG" width="150px"/></h3><p><br>
			<table class="table">
				<tr> 
					<td>아이디 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_id"><p>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>이름 :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_name"><p>
							</div>
						</div>
					</td>	
				</tr>
				<tr> 
					<td>E-mail :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="text" name="member_email"><p>
							</div>
						</div>
					</td>	
				</tr>		
				<tr> 
					<td>PW :</td>
					<td>
						<div class="form-group row">
							 <div class="col-xs-10">
								<input class="form-control" type="password" name="member_password"><p>
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
  				<input type="submit" class="btn btn-info" id="updateBtn"  value="완료" >
				<button type="button" class="btn btn-default" onclick="location.href='/'">취소</button>		
			</div>
		</div>	
		</form>
	
	</div>
</body>
</html>