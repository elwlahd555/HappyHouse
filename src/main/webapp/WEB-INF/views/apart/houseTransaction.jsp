<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <style>
      .map_wrap,
      .map_wrap * {
        margin: 0;
        padding: 0;
        font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
        font-size: 12px;
      }
      .map_wrap {
        position: relative;
        width: 100%;
        height: 350px;
      }
      #category {
        position: absolute;
        top: 10px;
        left: 10px;
        border-radius: 5px;
        border: 1px solid #909090;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
        background: #fff;
        overflow: hidden;
        z-index: 2;
      }
      #category li {
        float: left;
        list-style: none;
        width: 50px;
        border-right: 1px solid #acacac;
        padding: 6px 0;
        text-align: center;
        cursor: pointer;
      }
      #category li.on {
        background: #eee;
      }
      #category li:hover {
        background: #ffe6e6;
        border-left: 1px solid #acacac;
        margin-left: -1px;
      }
      #category li:last-child {
        margin-right: 0;
        border-right: 0;
      }
      #category li span {
        display: block;
        margin: 0 auto 3px;
        width: 27px;
        height: 28px;
      }
      #category li .category_bg {
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
          no-repeat;
      }
      #category li .bank {
        background-position: -10px 0;
      }
      #category li .mart {
        background-position: -10px -36px;
      }
      #category li .pharmacy {
        background-position: -10px -72px;
      }
      #category li .oil {
        background-position: -10px -108px;
      }
      #category li .cafe {
        background-position: -10px -144px;
      }
      #category li .store {
        background-position: -10px -180px;
      }
      #category li.on .category_bg {
        background-position-x: -46px;
      }
      .placeinfo_wrap {
        position: absolute;
        bottom: 28px;
        left: -150px;
        width: 300px;
      }
      .placeinfo {
        position: relative;
        width: 100%;
        border-radius: 6px;
        border: 1px solid #ccc;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
        background: #fff;
      }
      .placeinfo:nth-of-type(n) {
        border: 0;
        box-shadow: 0px 1px 2px #888;
      }
      .placeinfo_wrap .after {
        content: '';
        position: relative;
        margin-left: -12px;
        left: 50%;
        width: 22px;
        height: 12px;
        background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
      }
      .placeinfo a,
      .placeinfo a:hover,
      .placeinfo a:active {
        color: #fff;
        text-decoration: none;
      }
      .placeinfo a,
      .placeinfo span {
        display: block;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }
      .placeinfo span {
        margin: 5px 5px 0 5px;
        cursor: default;
        font-size: 13px;
      }
      .placeinfo .title {
        font-weight: bold;
        font-size: 14px;
        border-radius: 6px 6px 0 0;
        margin: -1px -1px 0 -1px;
        padding: 10px;
        color: #fff;
        background: #d95050;
        background: #d95050
          url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
          no-repeat right 14px center;
      }
      .placeinfo .tel {
        color: #0f7833;
      }
      .placeinfo .jibun {
        color: #999;
        font-size: 11px;
        margin-top: 0;
      }
    </style>
    <link href="${root}/resources/css/styles.css" rel="stylesheet" />
    <link href="${root}/resources/css/select.css" rel="stylesheet" />
    <link
      href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid">
            <h1 class="mt-4">실시간 거래</h1>
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
                          $('#gugun').append(
                            '<option value="0">구/군</option>'
                          );
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
                        '${pageContext.request.contextPath}/map/dong',
                        {
                          action: 'MAP_DONG',
                          gugun: $('#gugun').val(),
                        },
                        function (data, status) {
                          $('#dong').empty();
                          $('#dong').append(
                            '<option value="0">읍/면/동</option>'
                          );
                          $.each(data, function (index, vo) {
                            $('#dong').append(
                              "<option value='" +
                                vo.dongName +
                                "'>" +
                                vo.dongName +
                                '</option>'
                            );
                          }); //each
                        }, //function
                        'json'
                      ); //get
                    }); //change
                    $('#dong').change(function () {
                      $.get(
                        '${pageContext.request.contextPath}/map/house',
                        {
                          action: 'MAP_HOUSE',
                          dong: $('#dong').val(),
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
                                vo.no +
                                '</td>' +
                                '<td>' +
                                vo.dong +
                                '</td>' +
                                '<td><a href="#" data-toggle="modal" data-target="#userDeleteConfirm' +
                                index +
                                '">' +
                                vo.aptName +
                                '</a></td>' +
                                '<td>' +
                                vo.dealAmount +
                                '</td>' +
                                '<td>' +
                                vo.type +
                                '</td></tr>';
                              $('#searchResult').append(str);

                              let modalstr =
                                '<div class="modal" id="userDeleteConfirm' +
                                index +
                                '"><div class="modal-dialog"><div class="modal-content"><!-- Modal Header --><div class="modal-header"><h4 class="modal-title">상세 보기</h4><button type="button" class="close" data-dismiss="modal">&times;</button></div><!-- Modal body --><div class="modal-body"><div id="modal-img"><img src="../resources/img/apt' +
                                (index % 10) +
                                '.jpg" alt="" width="400px" height="500px"/></div><div style="margin-top: 30px" id="modal-context"><form method="post" action="addInterest" id="joinForm"><div class="form-group"><label class="small mb-1" for="aptName">아파트 이름 :</label> <input class="form-control py-4" id="aptName" type="text" name="aptName" value="'+
                                vo.aptName +'"/></div><br /> <div class="form-group"><label class="small mb-1" for="dealAmount">아파트 가격 : </label> <input class="form-control py-4" id="dealAmount" type="text" name="dealAmount" value="'+
                                vo.dealAmount +'"/>만원</div> <button type="button" class="btn" data-dismiss="modal">관심등록</button></form><br /></div></div><!-- Modal footer --><div class="modal-footer"><button type="button"class="btn btn-danger" data-dismiss="modal">삭제</button></div></div></div></div>';

                              $('#modal-div').append(modalstr);

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

                          map.setCenter(
                            new kakao.maps.LatLng(data[0].lat, data[0].lng)
                          );

                          var positions = {};

                          for (let i = 0; i < data.length; i++) {
                            positions[i] = {
                              content:
                                '<div style="padding:5px; width:300px; height:300px; text-align:center"><div>' +
                                data[i].aptName +
                                '</div><div><img alt="" src="${root}/resources/img/apt' +
                                (i % 10) +
                                '.jpg" width="200px"/></div><div>건설연도 : ' +
                                data[i].buildYear +
                                '년</div><div>거래일 : ' +
                                data[i].dealYear +
                                '년 ' +
                                data[i].dealMonth +
                                '월</div><div>거래가격 : ' +
                                data[i].dealAmount +
                                '만원</div></div>',
                              title: data[i].aptName,
                              latlng: new kakao.maps.LatLng(
                                data[i].lat,
                                data[i].lng
                              ),
                            };
                          }

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
                            var gapX = MARKER_WIDTH + SPRITE_GAP, // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
                              originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
                              overOriginY =
                                (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
                              normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
                              clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
                              spriteImageSize = new kakao.maps.Size(
                                SPRITE_WIDTH,
                                SPRITE_HEIGHT
                              ); // 스프라이트 이미지의 크기
                            // 마커를 생성합니다
                            var marker = new kakao.maps.Marker({
                              position: positions[i].latlng, // 마커를 표시할 위치
                              title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                              image: markerImage, // 마커 이미지
                            });
                            // 마커에 표시할 인포윈도우를 생성합니다
                            var infowindow = new kakao.maps.InfoWindow({
                              content: positions[i].content, // 인포윈도우에 표시할 내용
                            });
                            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                            // 이벤트 리스너로는 클로저를 만들어 등록합니다
                            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다

                            var bigMap =
                              'https://map.kakao.com/link/map/' +
                              data[i].aptName +
                              ',' +
                              data[i].lat +
                              ',' +
                              data[i].lng;
                            kakao.maps.event.addListener(
                              marker,
                              'mouseover',
                              makeOverListener(map, marker, infowindow)
                            );
                            kakao.maps.event.addListener(
                              marker,
                              'mouseout',
                              makeOutListener(infowindow)
                            );
                            kakao.maps.event.addListener(
                              marker,
                              'click',
                              openMapListener(bigMap)
                            );

                            markers.push(marker);
                          }

                          // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
                          function makeOverListener(map, marker, infowindow) {
                            return function () {
                              infowindow.open(map, marker);
                            };
                          }

                          var markerSize = new kakao.maps.Size(
                              MARKER_WIDTH,
                              MARKER_HEIGHT
                            ), // 기본, 클릭 마커의 크기
                            markerOffset = new kakao.maps.Point(
                              OFFSET_X,
                              OFFSET_Y
                            ), // 기본, 클릭 마커의 기준좌표
                            overMarkerSize = new kakao.maps.Size(
                              OVER_MARKER_WIDTH,
                              OVER_MARKER_HEIGHT
                            ), // 오버 마커의 크기
                            overMarkerOffset = new kakao.maps.Point(
                              OVER_OFFSET_X,
                              OVER_OFFSET_Y
                            ); // 오버 마커의 기준 좌표

                          // 인포윈도우를 닫는 클로저를 만드는 함수입니다
                          function makeOutListener(infowindow) {
                            return function () {
                              infowindow.close();
                            };
                          }

                          //마커 클릭
                          function openMapListener(bigMap) {
                            return function () {
                              window.open(bigMap);
                            };
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
                          }

                          //////
                        }, //function
                        'json'
                      ); //get
                    }); //change
                  }); //ready
                </script>
                시/도 :
                <select id="sido">
                  <option value="0">시/도</option>
                </select>
                구/군 :
                <select id="gugun">
                  <option value="0">구/군</option>
                </select>
                읍/면/동 :
                <select id="dong">
                  <option value="0">읍/면/동</option>
                </select>
              </div>

              <div>
                <h3 class="text-center" id="checksize"></h3>
              </div>
            </div>

            <div class="map_wrap card-body">
              <div id="map" style="width: 100%; height: 500px"></div>
              <ul id="category">
                <li id="BK9" data-order="0">
                  <span class="category_bg bank"></span>
                  은행
                </li>
                <li id="MT1" data-order="1">
                  <span class="category_bg mart"></span>
                  마트
                </li>
                <li id="PM9" data-order="2">
                  <span class="category_bg pharmacy"></span>
                  약국
                </li>
                <li id="OL7" data-order="3">
                  <span class="category_bg oil"></span>
                  주유소
                </li>
                <li id="CE7" data-order="4">
                  <span class="category_bg cafe"></span>
                  카페
                </li>
                <li id="CS2" data-order="5">
                  <span class="category_bg store"></span>
                  편의점
                </li>
              </ul>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <script
              type="text/javascript"
              src="//dapi.kakao.com/v2/maps/sdk.js?appkey=339dabf7e4db5fbb62ad255755d1f27d&libraries=services,clusterer"
            ></script>

            <script>
              var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                  level: 3, // 지도의 확대 레벨
                };

              var map = new kakao.maps.Map(mapContainer, mapOption);
              // 아래와 같이 옵션을 입력하지 않아도 된다
              var zoomControl = new kakao.maps.ZoomControl();

              // 지도 오른쪽에 줌 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
              map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

              var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
                MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
                OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
                OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
                OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
                OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
                OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
                OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
                SPRITE_MARKER_URL =
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
                SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
                SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
                SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

              // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
              var placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
                contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
                markers = [], // 마커를 담을 배열입니다
                currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
              // 장소 검색 객체를 생성합니다
              var ps = new kakao.maps.services.Places(map);

              // 지도에 idle 이벤트를 등록합니다
              kakao.maps.event.addListener(map, 'idle', searchPlaces);

              // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
              contentNode.className = 'placeinfo_wrap';

              // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
              // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
              addEventHandle(
                contentNode,
                'mousedown',
                kakao.maps.event.preventMap
              );
              addEventHandle(
                contentNode,
                'touchstart',
                kakao.maps.event.preventMap
              );

              // 커스텀 오버레이 컨텐츠를 설정합니다
              placeOverlay.setContent(contentNode);

              // 각 카테고리에 클릭 이벤트를 등록합니다
              addCategoryClickEvent();

              // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
              function addEventHandle(target, type, callback) {
                if (target.addEventListener) {
                  target.addEventListener(type, callback);
                } else {
                  target.attachEvent('on' + type, callback);
                }
              }

              // 카테고리 검색을 요청하는 함수입니다
              function searchPlaces() {
                if (!currCategory) {
                  return;
                }

                // 커스텀 오버레이를 숨깁니다
                placeOverlay.setMap(null);

                // 지도에 표시되고 있는 마커를 제거합니다
                // removeMarker();

                ps.categorySearch(currCategory, placesSearchCB, {
                  useMapBounds: true,
                });
              }

              // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
              function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {
                  // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                  displayPlaces(data);
                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                  // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
                } else if (status === kakao.maps.services.Status.ERROR) {
                  // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
                }
              }

              // 지도에 마커를 표출하는 함수입니다
              function displayPlaces(places) {
                // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
                // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
                var order = document
                  .getElementById(currCategory)
                  .getAttribute('data-order');

                for (var i = 0; i < places.length; i++) {
                  // 마커를 생성하고 지도에 표시합니다
                  var marker = addMarker(
                    new kakao.maps.LatLng(places[i].y, places[i].x),
                    order
                  );

                  // 마커와 검색결과 항목을 클릭 했을 때
                  // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                  (function (marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function () {
                      displayPlaceInfo(place);
                    });
                  })(marker, places[i]);
                }
              }

              // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
              function addMarker(position, order) {
                var imageSrc =
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                  imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
                  imgOptions = {
                    spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                    spriteOrigin: new kakao.maps.Point(46, order * 36), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(11, 28), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                  },
                  markerImage = new kakao.maps.MarkerImage(
                    imageSrc,
                    imageSize,
                    imgOptions
                  ),
                  marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage,
                  });

                marker.setMap(map); // 지도 위에 마커를 표출합니다
                markers.push(marker); // 배열에 생성된 마커를 추가합니다

                return marker;
              }

              // 지도 위에 표시되고 있는 마커를 모두 제거합니다
              function removeMarker() {
                for (var i = 0; i < markers.length; i++) {
                  markers[i].setMap(null);
                }
                markers = [];
              }

              // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
              function displayPlaceInfo(place) {
                var content =
                  '<div class="placeinfo">' +
                  '   <a class="title" href="' +
                  place.place_url +
                  '" target="_blank" title="' +
                  place.place_name +
                  '">' +
                  place.place_name +
                  '</a>';

                if (place.road_address_name) {
                  content +=
                    '    <span title="' +
                    place.road_address_name +
                    '">' +
                    place.road_address_name +
                    '</span>' +
                    '  <span class="jibun" title="' +
                    place.address_name +
                    '">(지번 : ' +
                    place.address_name +
                    ')</span>';
                } else {
                  content +=
                    '    <span title="' +
                    place.address_name +
                    '">' +
                    place.address_name +
                    '</span>';
                }

                content +=
                  '    <span class="tel">' +
                  place.phone +
                  '</span>' +
                  '</div>' +
                  '<div class="after"></div>';

                contentNode.innerHTML = content;
                placeOverlay.setPosition(
                  new kakao.maps.LatLng(place.y, place.x)
                );
                placeOverlay.setMap(map);
              }

              // 각 카테고리에 클릭 이벤트를 등록합니다
              function addCategoryClickEvent() {
                var category = document.getElementById('category'),
                  children = category.children;

                for (var i = 0; i < children.length; i++) {
                  children[i].onclick = onClickCategory;
                }
              }

              // 카테고리를 클릭했을 때 호출되는 함수입니다
              function onClickCategory() {
                var id = this.id,
                  className = this.className;

                placeOverlay.setMap(null);

                if (className === 'on') {
                  currCategory = '';
                  changeCategoryClass();
                  removeMarker();
                } else {
                  currCategory = id;
                  changeCategoryClass(this);
                  searchPlaces();
                }
              }

              // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
              function changeCategoryClass(el) {
                var category = document.getElementById('category'),
                  children = category.children,
                  i;

                for (i = 0; i < children.length; i++) {
                  children[i].className = '';
                }

                if (el) {
                  el.className = 'on';
                }
              }
            </script>
          </div>

          <div class="card-body">
            <div class="table-responsive">
              <table
                class="table table-bordered"
                id="dataTable"
                width="100%"
                cellspacing="0"
              >
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
                <tbody id="searchResult">
                  <%--
                  <c:forEach var="house" items="${houses}" varStatus="count">
                    <tr>
                      <td>${house.no}</td>
                      <td>${house.dong}</td>
                      <td>
                        <a
                          href="#"
                          data-toggle="modal"
                          data-target="#userDeleteConfirm"
                          >${house.aptName}</a
                        >
                      </td>

                      <td>${house.dealAmount}</td>
                      <td>${house.type}</td>
                    </tr>
                  </c:forEach>
                  --%>
                </tbody>
              </table>
            </div>
          </div>
          <div id="modal-div"></div>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">Copyright &copy; Your Website 2020</div>
              <div>
                <a href="#">Privacy Policy</a> &middot;
                <a href="#">Terms &amp; Conditions</a>
              </div>
            </div>
          </div>
        </footer>
      </div>

    </div>

    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root}/resources/js/scripts.js"></script>
    <script
      src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root}/resources/assets/demo/datatables-demo.js"></script>
    <script>
      $("input[id^='button']").on('click', function (e) {
        // 동작할 기능
        var id = $(this).attr('id');
        var dong = id.split('_');
        alert(dong[2]);
      });
    </script>
  </body>
</html>
