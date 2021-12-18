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
<title>차트</title>
	<link rel="stylesheet" href="/resources/css/bootstrap.css" >
	<link rel="stylesheet" href="/resources/css/bootstrap-theme.css" >
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

    <script>

        $(document).ready(function() {
            // 기본 데이터 셋
            let myData = {
                labels: [],
                datasets: [
                  {
                    label: "질문 수(개)",
                    fill: false,
                    backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                   borderColor: [
                           //경계선 색상
                           'rgba(255, 99, 132, 1)',
                           'rgba(54, 162, 235, 1)',
                           'rgba(255, 206, 86, 1)',
                           'rgba(75, 192, 192, 1)',
                           'rgba(153, 102, 255, 1)',
                           'rgba(255, 159, 64, 1)'
                       ],
                    data: [],
                  }]
            };

            let myOption = {
              title: {
                display: true,
                text: null
              }
            };

            // 차트 그리기
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: myData,
                options: myOption
            });


            // 초기 그래프 설정
            $.ajax({
                async: false,
                url: "/chart/category", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                method: "GET", // HTTP 요청 메소드(GET, POST 등)
            })
            .done(function(data) {
                data.title = $("#category").text();
                updateChart(data);
            })
            .fail(function(xhr, status, errorThrown) {
                $("#text").html("오류가 발생했다.<br>")
                .append("오류명: " + errorThrown + "<br>")
                .append("상태: " + status);
            })


            // select 박스 제어
            $("#chartType").change(function() {
                 $("#chartType option:selected").each(function() {
                      updateType();
                 });
            });


            // 차트 내용 업데이트
            function updateChart(data) {
               if (data != null) {
                    myChart.data.datasets[0].data = data.data;
                    myChart.data.labels = data.labels;
                    myChart.options.title.text = data.title;
               }
               myChart.update();
            };

            // 차트 종류 업데이트
            function updateType() {
               myChart.destroy();
               myChart = new Chart(ctx, {
                    type: $("#chartType").val(),
                    data: myData,
                    options: myOption
               });
            };

            // 카테고리별 질문 개수
            $("#category").on('click', function() {
                $.ajax({
                    url: "/chart/category", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                    //data: { name: "홍길동" }, // HTTP 요청과 함께 서버로 보낼 데이터
                    method: "GET", // HTTP 요청 메소드(GET, POST 등)
                    //dataType: "json" // 서버에서 보내줄 데이터의 타입
                }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
                .done(function(data) {
                    console.log(data);
                    data.title = $("#category").text();
                    updateChart(data);
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.

                .fail(function(xhr, status, errorThrown) {
                    $("#text").html("오류가 발생했다.<br>")
                    .append("오류명: " + errorThrown + "<br>")
                    .append("상태: " + status);
                })

            });

            // 직급별 질문 개수
            $("#rank").on('click', function() {
                $.ajax({
                    url: "/chart/rank", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                    method: "GET", // HTTP 요청 메소드(GET, POST 등)
                }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
                .done(function(data) {
                    console.log(data);
                    data.title = $("#rank").text();
                    updateChart(data);
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.

                .fail(function(xhr, status, errorThrown) {
                    $("#text").html("오류가 발생했다.<br>")
                    .append("오류명: " + errorThrown + "<br>")
                    .append("상태: " + status);
                })
            });
        });

    </script>
</head>
<body>
    <div class="container">
        <button id="category">카테고리 별 질문개수</button>
        <button id="rank">직급 별 질문개수</button>
        <select name="chartType" id="chartType">
              <option value="bar">Bar</option>
              <option value="doughnut">Doughnut</option>
              <option value="pie">pie</option>
        </select>
        <div style="width: 900px; height: 900px;">
        	<!--차트가 그려질 부분-->
        	<canvas id="myChart"></canvas>
        </div>
    </div>


</body>
</html>