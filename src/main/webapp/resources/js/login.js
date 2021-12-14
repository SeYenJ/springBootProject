function login(){
	var id = form.id.value;
	var pwd = form.pwd.value;
	$.ajax(
			{
				url:'ajaxLogin',
				type:'POST',
				data:{'id':id,'pwd':pwd},
				dataType:'json',
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				success: function(login){
					if(login.result==true){
						$('#result').html('로그인 성공');
					}else{
						$('#result').html('로그인 실패');
					}
				},
				error: function(errMsg){ alert("에러"+errMsg); }
			})
}

$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣는다. 없으면 공백으로 들어간다.
	var userId =getCookie("userId");
	$("input[name='id']").val(userId); 
	if($("input[name='id']").val() != ""){ 
	   $("#idSaveCheck").attr("checked", true); 
	}
	$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
    if($("#idSaveCheck").is(":checked")){ // 
        var userInputId = $("input[name='id']").val();
        setCookie("userId", userInputId, 7); 
    }else{ // ID 저장하기 체크 해제 시,
        deleteCookie("userId");
    }
	});
	 // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});

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