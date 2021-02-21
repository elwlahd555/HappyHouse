<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="/Happy/resource/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
       	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../Include/header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="../Include/side.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">관심 지역</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                <input type="radio" name="sortD" id=""> 동 &nbsp;
                                <input type="radio" name="sortD" id=""> 가격 &nbsp;
                                <input type="checkbox">아파트 매매 &nbsp;
                                <input type="checkbox">아파트 전월세 &nbsp;
                                <input type="checkbox">주택 매매 &nbsp;
                                <input type="checkbox">주택 전월세 &nbsp;
                                &nbsp;<input type="text"> &nbsp; &nbsp;<button>검색</button>
                            </div>
 
                        </div>
                        <div class="card-body">
                            <div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
                            
                     </div>
                            <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBg7Lrvs5AWd6tuOOgY4vEWjoK2vVGM3V0&callback=initMap"></script>
                            
                            
                     <script>
                     
                            var multi = {lat: 37.5012743, lng: 127.039585};
                            var map;
                            var markers = [];
                            var infoWindow;
                            function initMap() {
                                map = new google.maps.Map(document.getElementById('map'), {
                                    center: multi, zoom: 15
                                });
                                
                                
                                infoWindow = new google.maps.InfoWindow;
                                
                                const myposition = "img/my_position.png";
                                
                                
                                //멀티캠퍼스
                                //const multimarker = new google.maps.Marker({coords: multi, content: '멀티캠퍼스', iconImage: myposition});
                                var multimarker = {
                                        coords: multi,
                                        iconImage: myposition,
                    // 							content: '멀티캠퍼스(역삼)'
                                };
                                addMarker(multimarker);
                                infoWindow.setPosition(multi);
                                infoWindow.setContent('멀티캠퍼스 <br>실거래가 : <br>전용면적 : <br>거래구분 : ');
                                infoWindow.open(map);
                            }
                            
                            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                                infoWindow.setPosition(pos);
                                infoWindow.setContent(browserHasGeolocation ?
                                    'Error: Geolocation 서비스 실패.' :
                                    'Error: Geolocation을 지원하지 않는 브라우저.');
                                infoWindow.open(map);
                            }
                            
                            function addMarker(props) {
                                const marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(parseFloat(props.coords.lat),parseFloat(props.coords.lng)),
                                    map: map
                                });
                                map.setCenter(marker.getPosition());
                                map.setZoom(15);
                                
                                if(props.iconImage){
                                    marker.setIcon(props.iconImage);
                                }

                                if(props.content){
                                    infoWindow = new google.maps.InfoWindow({
                                        content:props.content
                                    });

                                }
                                
                                marker.addListener('click', function() {
                                    map.setZoom(17);
                                    map.setCenter(marker.getPosition());
                                    bounceMarker(marker);
                                });
                                markers.push(marker);
                                setMapOnAll(map);
                            }
                            
                            function bounceMarker(marker) {
                                if (marker.getAnimation() !== null) {
                                    marker.setAnimation(null);
                                } else {
                                    marker.setAnimation(google.maps.Animation.BOUNCE);
                                }
                            }
                            
                            function deleteMarkers() {
                                clearMarkers();
                                markers = [];
                            }
                            
                            function clearMarkers() {
                                setMapOnAll(null);
                            }
                            
                            function setMapOnAll(map) {
                                for (let i = 0; i < markers.length; i++) {
                                    markers[i].setMap(map);
                                }
                            }			
                        </script>

                    </div>
                        
                    

                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
								<tr>
									<th>번호</th>
									<th>동</th>
									<th>아파트이름</th>
									<th>거래금액</th>
									<th>거래종류</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>동</th>
									<th>아파트이름</th>
									<th>거래금액</th>
									<th>거래종류</th>
								</tr>
							</tfoot>
                                <tbody>
                           <!--           <c:forEach var="sector" items="${sectors}">
										<tr style="text-align: center">
										
											<td><button style="border:0; background: white;" id = "look${sector.sectionno}" >${sector.sectionname}</button></td>
											<td>${sector.maincategory}</td>
											<td>${sector.subcategory}</td>
											<td>${sector.address}<input type = "hidden" value = "${sector.sectionname }" id = "lot"></input></td>
										</tr>
									</c:forEach>
                                 -->   
                                </tbody>
                            </table>
                        </div>
                    </div>

                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/Happy/resource/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="/Happy/resource/assets/demo/datatables-demo.js"></script>
    </body>
</html>
