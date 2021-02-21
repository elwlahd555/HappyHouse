<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>23</title>
<link href="${root}/resources/css/styles.css" rel="stylesheet" />

<style>
#news-body {
	list-style: none;
	text-decoration: none;
	color: darkgreen;
}

#news-body a {
	color: black;
}

#news-body li {
	text-decoration: none;
	list-style: none;
}
#table-of-curve {
	padding-top: 100px;
}
#table-of-pie {
	padding-top: 100px;
}
</style>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>



</head>
<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="layoutSidenav">
		<c:import url="/WEB-INF/views/include/side.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">메인화면</h1>
					<div class="card mb-4">
						<div class="card-body">
							<ol class="breadcrumb mb-4">
								<li class="breadcrumb-item active">당신의 꿈의 휴식처를 함께
									찾아드릴게요!!!!</li>
							</ol>
						</div>
					</div>

					<div class="card-body container" id="views-body">
						<input type="number" placeholder="개월수를 입력하세요" id="search-month"></input>
						<button id="search-btn" class="btn btn-success">개월</button>
					</div>
					<div id="curve_chart" style="width: 600px; height: 500px; display:inline-block;"></div>
					<div id="table-of-curve" style="width: 400px; height: 500px; display:inline-block;"></div>
					<div id="piechart" style="width: 600px; height: 500px; display:inline-block;"></div>
					<div id="table-of-pie" style="width: 400px; height: 500px; display:inline-block;"></div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root}/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${root}/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${root}/resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${root}/resources/assets/demo/datatables-demo.js"></script>

	<script>
	var gData;
      $(document).ready(() => {
        $.ajax({
          url: '/happy/admin/all-views',
          data: {"month" : "3"},
          success: function (data) {
        	  console.dir(data);
        	  var gData = data;
        	  (function() {console.log("즉시 실행 함수 : " +gData)})();
        	  google.charts.load('current', {'packages':['corechart']});
        	  google.charts.setOnLoadCallback(function() {
        		  var value = google.visualization.arrayToDataTable(
        				  //배열 만들기 (배열 (배열))
        				  (() => {
        					  var arr = [];
        					  arr.push(['달','전체 조회수', '예시']);
        					  var month = 11;
        					  for(let i = 0; i < gData.length; i++) {
        						  var tmpArr = [];
        						  tmpArr[0] = month-- + '월';
        						  tmpArr[1] = gData[i];
        						  tmpArr[2] = 0;
        						  arr.push(tmpArr);
        					  }
        					  return arr;
        				  })()
        				  );

        	        var options = {
        	          title: '월별 전체 조회수(3개월)',
        	          curveType: 'function',
        	          legend: { position: 'bottom' }
        	        };

        	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        	        chart.draw(value, options);
        	  });
			  table = `<table class="table table-striped">
    <thead>
      <tr>
        <th>월</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
	`
	var month = 11;
	for(let i = 0; i < gData.length; i++) {
		table += `<tr>
        <td>` + month + `</td>
        <td>` + gData[i] + `</td>
      </tr>`;
	  month--;
	}
	table += `
    </tbody>
  </table>`;
  $('#table-of-curve').html(table);
          },
          beforeSend:function(){
              $('#news-body').html('<img src="https://blog.kakaocdn.net/dn/bbG1RK/btqv0yFV1hL/VrPRCiDEklhGYyfut4KqJ1/loading.gif?attach=1&knm=img.gif"/>')
          },
        });
        
        var gpData;
        $.ajax({
            url: '/happy/admin/realtime-search',
            dataType:"JSON",
            contentType:"application/json",
            success: function (data) {
          	  console.dir(data);
          	  gpData = data;
          	  (function() {console.log("즉시 실행 함수 : " +gpData)})();
          	google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(() => {
            	var data = google.visualization.arrayToDataTable(
            			(() => {
      					  var arr = [];
      					  arr.push(['구','실시간 검색']);
      					  for(let i = 0; i < gpData.length; i++) {
      						  var tmpArr = [];
      						  tmpArr[0] = gpData[i].dong;
      						  tmpArr[1] = parseInt(gpData[i].count);
      						  arr.push(tmpArr);
      					  }
      					  console.dir("pai arr : " + arr);
      					  return arr;
      				  })());

                  var options = {
                    title: '실시간 검색 TOP 5'
                  };

                  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                  chart.draw(data, options);
            });
			table = `<table class="table table-striped">
    <thead>
      <tr>
        <th>구군</th>
        <th>좋아요 수</th>
      </tr>
    </thead>
    <tbody>
	`
	for(let i = 0; i < gpData.length; i++) {
		table += `<tr>
        <td>` + gpData[i].dong + `</td>
        <td>` + gpData[i].count + `</td>
      </tr>`;
	}
	table += `
    </tbody>
  </table>`;
  $('#table-of-pie').html(table);
            },
            beforeSend:function(){
                $('#news-body').html('<img src="https://blog.kakaocdn.net/dn/bbG1RK/btqv0yFV1hL/VrPRCiDEklhGYyfut4KqJ1/loading.gif?attach=1&knm=img.gif"/>')
            },
          });
        
        
      });
      
      
      $('#search-btn').on('click', () => {
    	  if($('#search-month').val() < 1) {
    		  alert('0보다 큰 수를 입력하세요');
    		  return;
    	  }
    	  $.ajax({
              url: '/happy/admin/all-views',
              data: {"month" : $('#search-month').val()},
              success: function (data) {
            	  console.dir(data);
            	  var gData = data;
            	  (function() {console.log("즉시 실행 함수 : " +gData)})();
            	  google.charts.load('current', {'packages':['corechart']});
            	  google.charts.setOnLoadCallback(function() {
            		  var value = google.visualization.arrayToDataTable(
            				  //배열 만들기 (배열 (배열))
            				  (() => {
            					  var arr = [];
            					  arr.push(['달','전체 조회수', '예시']);
            					  var month = 11;
            					  for(let i = 0; i < gData.length; i++) {
            						  var tmpArr = [];
            						  tmpArr[0] = month-- + '월';
            						  tmpArr[1] = gData[i];
            						  tmpArr[2] = 0;
            						  arr.push(tmpArr);
            					  }
            					  return arr;
            				  })()
            				  );

            	        var options = {
            	          title: '월별 전체 조회수('+gData.length+'개월)',
            	          curveType: 'function',
            	          legend: { position: 'bottom' }
            	        };

            	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            	        chart.draw(value, options);
            	  });
				  var table = '';
			table = `<table class="table table-striped">
    <thead>
      <tr>
        <th>월</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
	`
	var month = 11;
	for(let i = 0; i < gData.length; i++) {
		table += `<tr>
        <td>` + month + `</td>
        <td>` + gData[i] + `</td>
      </tr>`;
	  month--;
	}
	table += `
    </tbody>
  </table>`;
  $('#table-of-curve').html(table);
              },
              beforeSend:function(){
                  $('#news-body').html('<img src="https://blog.kakaocdn.net/dn/bbG1RK/btqv0yFV1hL/VrPRCiDEklhGYyfut4KqJ1/loading.gif?attach=1&knm=img.gif"/>')
              },
            });
      });
    </script>
</body>
</html>
