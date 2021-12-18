<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
<body class="bg-gradient-primary">

<div class="container">

	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
				<div class="col-lg-7">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
						</div>
						<form id="form" action="/user/insertMember" method="POST">
							<table class="table">
								<tr>
									<td>부서 :</td>
									<td>
										<div class="form-group row">
											<div class="col-xs-10">
												<select class="form-control form-control-user" name="member_dprtm" id="member_dprtm">
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
												<select class="form-control form-control-user" name="member_rank" id="member_rank">
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
												<input class="form-control form-control-user" type="text" name="member_id" id="member_id"><p>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>이름 :</td>
									<td>
										<div class="form-group row">
											<div class="col-xs-10">
												<input class="form-control form-control-user" type="text" name="member_name" id="member_name"><p>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>E-mail :</td>
									<td>
										<div class="form-group row">
											<div class="col-xs-10">
												<input class="form-control form-control-user" type="text" name="member_email" id="member_email"><p>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>PW :</td>
									<td>
										<div class="form-group row">
											<div class="col-xs-10">
												<input class="form-control form-control-user" type="password" name="member_password" id="member_password" ><p>
											</div>
										</div>
									</td>
								</tr>
							</table>

							<hr>

							<div class="row">
								<div class="col-md-10" align="left">
									<input class="btn btn-default btn-user btn-block" type='reset' style="display: inline-block; width: 100px;">
								</div>
								<div class="col-md-2" align="right" style="display: inline-block; width: 500px;">
									<input type="button" class="btn btn-primary btn-user btn-block" id="updateBtn"  value="완료" onClick="joinChk()">
									<button type="button" class="btn btn-danger btn-user btn-block" onclick="location.href='/'">취소</button>
								</div>
							</div>

						</form>
						<hr>
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