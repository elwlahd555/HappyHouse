<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link href="${root}/resources/css/styles.css" rel="stylesheet" />
<link href="${root}/resources/css/select.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div id="layoutSidenav">
		<c:import url="/WEB-INF/views/include/side.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">지역 업종</h1>
					<div class="card mb-4">
						<div class="card-body">
							<script type="text/javascript">
							  let colorArr = [
								'table-primary',
								'table-success',
								'table-danger',
							  ];
							  $(document).ready(function () {
								$.ajax({
								  url: '${pageContext.request.contextPath}/map/sido',
								  type: 'GET',
								  contentType: 'application/json;charset=utf-8',
								  dataType: 'json',
								  success: function (sido) {
									console.log('hi ', sido);
									var data = '';
									for (let i = 0; i < sido.length; i++) {
									  data +=
										"<option value='" +
										sido[i].sidoCode +
										"'>" +
										sido[i].sidoName +
										'</option>';
									}
									$('#sido').append(data);
								  },
								  error: function (xhr, status, msg) {
									console.log(
									  '상태값 : ' + status + ' Http에러메시지 : ' + msg
									);
								  },
								});
							  });
							  ///////////////////////////////
							  $(document).ready(function () {
								$('#sido').change(function () {
								  $.get(
									'${pageContext.request.contextPath}/map/gugun',
									{
									  action: 'MAP_GUGUN',
									  sido: $('#sido').val(),
									},
									function (data, status) {
									  console.log('in gugun success');
									  $('#gugun').empty();
									  $('#gugun').append('<option value="0">선택</option>');
									  $.each(data, function (index, vo) {
										$('#gugun').append(
										  "<option value='" +
											vo.gugunCode +
											"'>" +
											vo.gugunName +
											'</option>'
										);
									  }); //each
									}, //function
									'json'
								  ); //get
								}); //change
								$('#gugun').change(function () {
								  $.get(
									'${pageContext.request.contextPath}/map/market',
									{
									  action: 'MAP_MARKET',
									  gugun: $('#gugun').val(),
									},

									function (data, status) {
									  $('#searchResult').empty();
									  $('#checksize').empty();
									  console.log('길이체크');
									  console.dir(data);
									  if (data.length > 0) {
										$.each(data, function (index, vo) {
										  let str =
											'<tr class=' +
											colorArr[index % 3] +
											'>' +
											'<td>' +
											vo.sectionname +
											'</td>' +
											'<td>' +
											vo.maincategory +
											'</td>' +
											'<td>' +
											vo.subcategory +
											'</td>' +
											'<td>' +
											vo.address +
											'</td></tr>';

										  $('#searchResult').append(str);
										  //                              $("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
										}); //each
									  } else {
										let str =
										  '<tr class=' +
										  colorArr[3] +
										  '>' +
										  '<td>거래내역이 없습니다.</td></tr>';
										$('#checksize').append(str);
										//                              $("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>"); //each
									  }
									  //geocode(data);
			
									  /////
									  // 주소-좌표 변환 객체를 생성합니다

var positions = {};


clusterer.clear();


var geocoder = new kakao.maps.services.Geocoder();
for (let i = 0; i < data.length; i++) {

geocoder.addressSearch(data[i].address, function(result, status) {


	var coords = new kakao.maps.LatLng(result[0].y, result[0].x)
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            position: coords
        });
		clusterer.addMarker(marker);

});
}

geocoder.addressSearch(data[0].address, function(result, status) {
	var coords = new kakao.maps.LatLng(result[0].y, result[0].x)
        map.setCenter(coords);

});
kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

// 현재 지도 레벨에서 1레벨 확대한 레벨
var level = map.getLevel()-1;

// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
map.setLevel(level, {anchor: cluster.getCenter()});
});


kakao.maps.event.addListener( clusterer, 'clusterclick', function( cluster ) {
    console.dir( cluster );
});
/*
kakao.maps.event.addListener(clusterer.marker, 'mouseover', function() {
    alert('marker mouseover!');
});


// 마커에 마우스오버 이벤트를 등록합니다
kakao.maps.event.addListener(clusterer.marker, 'mouseover', function() {
  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, clusterer.marker);
});

// 마커에 마우스아웃 이벤트를 등록합니다
kakao.maps.event.addListener(clusterer.marker, 'mouseout', function() {
    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    infowindow.close();
});
// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    content : iwContent
});

var iwContent = '<div style="padding:5px;">Hello World!</div>';
*/

/*		        // 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+data[i].sectionname+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		
		*/



			
			
			
			/*
			
									   var imageSrc =
										'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';
			
									  console.dir(data);
									  console.dir(markers);
			
									  hideMarkers();
									  markers = [];
			
									  for (var i = 0; i < data.length; i++) {
										// 마커 이미지의 이미지 크기 입니다
										var imageSize = new kakao.maps.Size(24, 35);
			
										// 마커 이미지를 생성합니다
										var markerImage = new kakao.maps.MarkerImage(
										  imageSrc,
										  imageSize
										);
			
										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
										  position: positions[i].latlng, // 마커를 표시할 위치
										  title: positions[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
										  image: markerImage, // 마커 이미지
										});
										markers.push(marker);
										        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
									  }
			
									  function setMarkers(map) {
										for (var i = 0; i < markers.length; i++) {
										  markers[i].setMap(map);
										}
									  }
									  showMarkers();
									  // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
									  function showMarkers() {
										setMarkers(map);
									  }
									  // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
									  function hideMarkers() {
										setMarkers(null);
									   } */
			
									  //////
									}, //function
									'json'
								  ); //get
								}); //change
							  }); //ready
							</script>
							시도 :
							<select id="sido">
							  <option value="0">선택</option>
							</select>
							구군 :
							<select id="gugun">
							  <option value="0">선택</option>
							</select>
							<select id="dong" style="display: none;">
							  <option value="0">선택</option>
							</select>
						  </div>

					</div>
				</div>
				<div class="card-body">
				  <div id="map" style="width: 100%; height: 500px"></div>
				</div>
				<script
				  type="text/javascript"
				  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=339dabf7e4db5fbb62ad255755d1f27d&libraries=services,clusterer"
				></script>
				<script>
				  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
					  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					  level: 7, // 지도의 확대 레벨
					};
	
				  var map = new kakao.maps.Map(mapContainer, mapOption);
				  // 아래와 같이 옵션을 입력하지 않아도 된다
				  var zoomControl = new kakao.maps.ZoomControl();
	
				  // 지도 오른쪽에 줌 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
				  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

				  var clusterer = new kakao.maps.MarkerClusterer({
    map: map,
    markers: markers,
    gridSize: 35,
    averageCenter: true,
	calculator: [10, 30, 50], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다
    minLevel: 6,
    disableClickZoom: true,
styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
                width : '30px', height : '30px',
                background: 'rgba(51, 204, 255, .8)',
                borderRadius: '15px',
                color: '#000',
                textAlign: 'center',
                fontWeight: 'bold',
                lineHeight: '31px'
            },
            {
                width : '40px', height : '40px',
                background: 'rgba(255, 153, 0, .8)',
                borderRadius: '20px',
                color: '#000',
                textAlign: 'center',
                fontWeight: 'bold',
                lineHeight: '41px'
            },
            {
                width : '50px', height : '50px',
                background: 'rgba(255, 51, 204, .8)',
                borderRadius: '25px',
                color: '#000',
                textAlign: 'center',
                fontWeight: 'bold',
                lineHeight: '51px'
            },
            {
                width : '60px', height : '60px',
                background: 'rgba(255, 80, 80, .8)',
                borderRadius: '30px',
                color: '#000',
                textAlign: 'center',
                fontWeight: 'bold',
                lineHeight: '61px'
            }
        ]
});
	
	
				  var markers = [];

				  
				</script>
			  </div>

				</div>




				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr style="text-align: center">
									<th>상호명</th>
									<th>대분류</th>
									<th>중분류</th>
									<th>주소</th>
								</tr>
							</thead>
							<tfoot>
								<tr style="text-align: center">
									<th>상호명</th>
									<th>대분류</th>
									<th>중분류</th>
									<th>주소</th>
								</tr>
							</tfoot>
							<tbody id="searchResult">
								<c:forEach var="sector" items="${sectors}">
									<tr style="text-align: center">

										<td><button style="border: 0; background: white;"
												id="look${sector.sectionno}">${sector.sectionname}</button></td>
										<td>${sector.maincategory}</td>
										<td>${sector.subcategory}</td>
										<td>${sector.address}
										<input type="hidden"
											value="${sector.sectionname }" id="lot"></input></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
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
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${root}/resources/assets/demo/datatables-demo.js"></script>
</body>
</html>
