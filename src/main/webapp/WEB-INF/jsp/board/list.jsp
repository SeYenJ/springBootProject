<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 목록</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8">	 
	 $(document).ready(function(){
		 //기존 쿠키 값 가져오기
		 var key = getCookie("key");
		 $("#member_id").val(key);	 
		 if($("#member_id").val() != ""){
		 	$("#rememberId").attr("checked",true); 
	 		}	
		 //아이디 저장 체크박스에 변화가 생길 경우
		 $("#rememberId").change(function(){
			 if($("#rememberId").is(":checked")){
				 setCookie("key", $("#member_id").val(),7);
				 alert($("#member_id").val());
			 }else{
				 deleteCookie("key");	 
			 }
		 });
		 
 		 //ID 저장하기를 한 상태에서 ID를 입력하는 경우 
		 $("#member_id").keyup(function(){ //ID 입력 칸에 ID를 입력할때
			 if($("#rememberId").is(":checked")){
				 setCookie("key", $("#member_id").val(),7);//7일 동안 쿠키 보관
			 }
		 }); 
 		 
 		 //로그인 input 유효성 검사
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
 		 
 		 //로그 아웃시 alert();
	 	$("#logout").click(function(){
	 		alert("정상적으로 로그아웃 되었습니다.");
	 		window.location.href = "/user/logout";	 		
	 		});
		 });
	 
	 	//정렬 기준 값
		var result = new Array();
 		var titlevalue = 0;
 		var namevalue = 0;
 		var viewvalue = 0;
 		var datevalue = 0;
 		
 		//게시글 정렬 기능
	 	function sort(data){
 			
 		//값이 중복되어 쌓이기는거 방지
 		var list = new Array();
 		
 		//뿌려진 게시글 정보 가져오기
 		<c:forEach items="${memberList}" var="member" >
 		 var json = new Object();	
 		  json.type ="${member.type}";
 		  json.title ="${member.title}";
 		  json.member_id ="${member.member_id}";
 		  json.board_regdate ="<fmt:formatDate value="${member.board_regdate}" pattern="yyy-MM-dd "/>";
 		  json.views ="${member.views}";
 		  json.board_num ="${member.board_num}";
 		  json.uploadfile ="${member.uploadfile}";
 		  json.c_num ="${member.c_num}";
 		  list.push(json);
 		</c:forEach>
 		
 		result = list;
	 		
 		//제목 순
 		if(data == "type"){
 			if(titlevalue == 0 ){
 	 	 		result.sort(function(a, b) { // 제목 오름차순
	 			return a.type < b.type ? -1 : a.type > b.type ? 1 : 0; })
	 			titlevalue = 1;
 			}else{
	 			result.sort(function(a, b) {  // 제목 내림차순
				return a.title > b.title ? -1 : a.title < b.title ? 1 : 0;})
				titlevalue = 0;
 			}
 			
 		//제목 순 	
 		}else if(data == "title"){
 			if(titlevalue == 0 ){
 	 	 		result.sort(function(a, b) { // 제목 오름차순
	 			return a.title < b.title ? -1 : a.title > b.title ? 1 : 0; })
	 			titlevalue = 1;
 			}else{
	 			result.sort(function(a, b) {  // 제목 내림차순
				return a.title > b.title ? -1 : a.title < b.title ? 1 : 0;})
				titlevalue = 0;
 			}
 			
 		//작성자 순 	
 		}else if (data == "name"){ 	 
 			if(namevalue == 0 ){
 				result.sort(function(a, b) { // 작성자 오름차순
 				return a.member_id < b.member_id ? -1 : a.member_id > b.member_id ? 1 : 0; }) 
 				namevalue = 1;
 			}else{
 				result.sort(function(a, b) { // 작성자 내림차순
 		 		return a.member_id > b.member_id ? -1 : a.member_id < b.member_id ? 1 : 0; }) 
 		 		namevalue = 0;
 			}
 			
 		//조회순 
 		}else if (data == "views"){
 			if(viewvalue == 0){
 				result.sort(function(a, b){  // 숫자 오름차순
				return Number(a.views) - Number(b.views);  })	
				viewvalue = 1;
 			}else{
	 			result.sort(function(a, b){  // 숫자 내림차순
				return Number(b.views) - Number(a.views);  })
				viewvalue = 0;
 			}
 			
 		//날짜 순
 		}else if (data == "regdate"){
				if(datevalue == 0){
 				result.sort(function(a, b){  // 숫자 오름차순
				return Number(a.board_num) - Number(b.board_num);  })	
				datevalue = 1;
 			}else{
	 			result.sort(function(a, b){  // 숫자 내림차순
				return Number(b.board_num) - Number(a.board_num);  })
				datevalue = 0;
 			}
	 		}
			
 		//화면
		$('#table *').remove();         
		var tmpHtml ="";
		for(var i = 0 ; i<result.length;i++){
			
			var num = i+1;
			tmpHtml +=" <tr>";
			tmpHtml +=" <td>"+num+"</td>";
			tmpHtml +=" <td>"+result[i].type+"</td>";
			tmpHtml +=" <td><a href='/board/view?board_num="+result[i].board_num+"' style='color:#4C4C4C ; text-decoration:none'>"+result[i].title
			
		if(result[i].uploadfile!=""){
			
			tmpHtml += "&nbsp[" +result[i].c_num+ "] <img src='../resources/images/imgck.png' width='9px' align='center'></a></td>";
			
		}else{
			tmpHtml += "</a></td>"; 
		}
			tmpHtml +=" <td>"+result[i].member_id+"</td>";
			tmpHtml +=" <td>"+result[i].board_regdate+"</td>";
			tmpHtml +=" <td>"+result[i].views+"</td>";
		}
			tmpHtml +="</tr>";
			tmpHtml +="</tbody>";
		
		$('#table').append(tmpHtml);
			 		
 		}
	 	
	 	//검색 엔터키 액션
	 	function enterkey(){
	 		if(window.event.keyCode == 13){
	 			setSearchSelect();
	 		}
	 	}
	 	
	 	//검색 기능
	 	function setSearchSelect(){	
	 		
	 		var temp = $(':radio[name="radioValue"]:checked').val();
	 		var $searchTypeSel = $('#searchTypeSel');
			var $keyword = $('#keyword');		
				//검색 내용이 없으면 경고창
				
				var searchTypeVal = $searchTypeSel.val();
				var keywordVal = $keyword.val();
				
				if(!temp){
					temp="all";
			
				}
				if(!searchTypeVal){
					alert("검색 조건을 선택하세요!");
					$searchTypeSel.focus();
					return;
				//검색어 입력 안했으면 검색창
				}else if(!keywordVal){
					alert("검색어를 입력하세요!");
					$('#keyword').focus();
					return;
				}
				var url = "/board?"
					+ "&temp=" + temp	
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal)
				location.href = url;
		}	
	 	
	 	//쿠키 등록,저장 ,삭제
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
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">woorI Community</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item">
			<a class="nav-link" href="index.html">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>HOME</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
			BOARD
		</div>

		<!-- Nav Item - Tables -->
		<li class="nav-item active">
			<a class="nav-link" href="tables.html">
				<i class="fas fa-fw fa-table"></i>
				<span>Board</span></a>
		</li>

		<!-- Nav Item - Charts -->
		<li class="nav-item">
			<a class="nav-link" href="charts.html">
				<i class="fas fa-fw fa-chart-area"></i>
				<span>Charts</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->


	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>


				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<div class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
						   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:choose>
								<c:when test="${sessionScope.login == null}">
									<button id="joinUser" class="btn btn-default" onclick="location.href='/user/join'">회원가입</button>
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" >로그인</button>
								</c:when>
								<c:otherwise>
									${login.member_dprtm}  ${login.member_name} ${login.member_rank}
									[<b class="mr-2 d-none d-lg-inline text-gray-600 small">${login.member_id}</b>]
									<img style="margin-left: 10px;" class="img-profile rounded-circle"
										 src="/resources/images/undraw_profile.svg">
									<button type="button" class="btn btn-dark btn-sm"  id="logout" style="margin-left: 10px;" onclick="location.href='/user/logout'">로그아웃</button>
								</c:otherwise>
							</c:choose>
						</div>
					</li>

				</ul>

			</nav>
			<!-- End of Topbar -->


	<div class="container" >
    	<br>
	   	<div class="row" style="">
		<!-- 검색 select 박스 추가 -->

			<div class="col-md-8" align="right">
				<div class="form-inline">
					<select class="form-control navbar-search small" id ="searchTypeSel">
						<option value="">검색조건</option>
						<option value="t" <c:if test="${pageMaker.searchType == 't'}">selected='selected'</c:if>>제목</option>
						<option value="tc"<c:if test="${pageMaker.searchType == 'tc'}">selected='selected'</c:if>>제목+내용</option>
						<option value="id"<c:if test="${pageMaker.searchType == 'id'}">selected='selected'</c:if>>작성자</option>
					</select>
					&nbsp
						<input class="form-control small" type="text" id="keyword" name="keyword" value="${pageMaker.keyword}" placeholder="검색어를 입력하세요" onkeyup="enterkey();" />
						&nbsp&nbsp
						<input type="radio" name="radioValue" value="r"<c:if test="${pageMaker.temp == 'r' }">checked='checked'</c:if> checked='checked'/>최신순
						&nbsp
						<input type="radio" name="radioValue" value="v"<c:if test="${pageMaker.temp == 'v'}">checked='checked'</c:if>/>조회순			
						&nbsp
						<input type="radio" name="radioValue" value="c"<c:if test="${pageMaker.temp == 'c'}">checked='checked'</c:if>/>댓글순 
						 &nbsp
					<div class="input-group-append">
						<button class="btn btn-primary" type="button" id="searchBtn" onclick="setSearchSelect();">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</div>
			<!-- 검색 select 박스 끝 -->					
			<div class="col-md-4" align="right">
				<div class="container">
					<!-- 삭제 모달 팝업 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel" align="left">Login</h4>
					      </div>
					      <div class="modal-body" align="left">
						      <form name="loginFrom" method="post">
								<table class="table">
									<tr> 
										<td>아이디 :</td>
										<td>
											<div class="form-group row">
												 <div class="col-xs-11">
													<input class="form-control" type="text" name="member_id" id ="member_id"><p>
												</div>
											</div>
										</td>	
									</tr>
									<tr> 
										<td>PW :</td>
										<td>
											<div class="form-group row">
												 <div class="col-xs-11">
													<input class="form-control" type="password" name="member_password" id="member_password">									
												</div>
											</div>
										</td>	
									</tr>											
								</table>
								<div align="left">
								&nbsp &nbsp 아이디 저장 &nbsp <input type="checkbox" id="rememberId" >
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								<button id="loginButton" name="loginButton" type="button" class="btn btn-info">로그인</button>
						     	 </div>
							</form>					      	
					      </div>										      
					    </div>
					  </div>
					</div>
				</div>	
				<!-- 모달 팝업  끝 -->						
			</div>		
		</div>
	<div style="height :300px">
		<hr style="border-color:#8C8C8C">	
		<table class="table">
		        <thead>
		            <tr>
		                <th>번호</th>
		                <th><a onclick="sort('type');">구분</a></th>
		                <th><a onclick="sort('title');">제목</a></th>
		                <th><a onclick="sort('name');">이름</a></th>
	   	                <th><a onclick="sort('regdate');">작성일</a></th>
	   	                <th><a onclick="sort('views');">조회수</a></th>
		            </tr>
		        </thead>
		        <tbody id="table">
		      		<c:choose>
			      		<c:when test="${fn:length(memberList) > 0}">
			           			<c:forEach items="${memberList}" var="member" varStatus="status" >
					                <tr>
					                    <td>${status.count}</td>
					                    <td>${member.type}</td> 
					                    <td><a href="${path}/board/view?board_num=${member.board_num}" style="color:#4C4C4C ; text-decoration:none"> ${member.title}
					                    <c:set var="uploadfile" value="${member.uploadfile}" /> [${member.c_num}]
					                     <c:choose>
										    <c:when test="${uploadfile eq null or uploadfile eq ''}">
	
										    </c:when>
										    <c:otherwise>
										       	 <img src="../resources/images/imgck.png" width="9px" align="center"> 
										    </c:otherwise>
										</c:choose></a>
										</td>
					                    <td>${member.member_id}</td>
					                    <td><fmt:formatDate value="${member.board_regdate}" pattern="yyy-MM-dd "/></td>
					                    <td>${member.views}</td>
					                </tr>
			            		</c:forEach>
			            
						</c:when>
						<c:otherwise> 
									<tr> 
										<td colspan="3">죄송합니다.검색하신 단어로는 조회된 결과가 없습니다.</td>
								 	</tr> 
					 	</c:otherwise> 
				 	</c:choose>
		        </tbody>
		    </table>	
	    </div>	
    	<div align="right" style="margin-top: 30px;">
	  		<input type="button" class="btn btn-dark" id="goBackBtn" onclick="location.href='/board'" value="목록 돌아가기">
   			<input type="button" class="btn btn-primary" id="insertBtn" onclick="location.href='/board/content'" value="게시글 작성" >
   		</div>	
   		<!-- 페이징 구역 -->
	    <div align="center">
		    <ul class="pagination" style="text-align: center;">
		    	<!-- 이전 -->
	    	  	<c:if test="${pageMarker.prev}">
			    	<li>
			            <a href="/board?page=${pageMarker.startPage-1}"> [이전] </a>
			           
			        </li>
			    </c:if>	
			    	   	    
			    <c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" var="index">
			        <li><a href="/board?page=${index}&temp=${pageMaker.temp}&searchType=${pageMaker.searchType}&keyword=${pageMaker.keyword}" style="color:#4C4C4C ; text-decoration:none">[${index}]</a></li>
			    </c:forEach>	
			    <!-- 다음 -->
			    <c:if test="${pageMarker.next}">
			    	<li>
			            <a href="/board?page=${pageMarker.endPage+1}"> [다음] </a>
			        </li>
			    </c:if>		  
			</ul>			
 		</div> 
	 </div>

	</div>
	</div>
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>



</body>
</html>