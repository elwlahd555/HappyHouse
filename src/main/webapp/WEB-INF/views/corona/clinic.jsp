<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="${root}/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
         <c:import url="/WEB-INF/views/include/header.jsp" />
        <div id="layoutSidenav">
            <c:import url="/WEB-INF/views/include/side.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">선별진료소</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                             우리모두 힘을 합쳐 코로나 예방합시다!! <br>
                                <a target="_blank" href="http://www.mohw.go.kr/react/index.jsp">보건복지부 홈페이지 이동</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                선별진료소
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>연번</th>
                                                <th>도시</th>
                                                <th>구</th>
                                                <th>진료소명</th>
                                                <th>주소</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>연번</th>
                                                <th>도시</th>
                                                <th>구</th>
                                                <th>진료소명</th>
                                                <th>주소</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </tfoot>
                                        <tbody style='text-align: center;'>
                                        <c:forEach var="clinic" items="${list }" varStatus="count">  
                                            <tr>
												<td style="vertical-align: middle">${count.index+1 }</th>
												<td style="vertical-align: middle">${clinic.city }</td>
												<td style="vertical-align: middle">${clinic.gu }</td>
												<td style="vertical-align: middle">${clinic.hospital }</td>
												<td style="vertical-align: middle">${clinic.address }</td>
												<td style="vertical-align: middle">${clinic.phonenumber }</td>
												<%-- <td style="vertical-align: middle" class="name">
													<strong  style = " font-size:1.5em;  color:deepskyblue ;">${clinic.clinicname } </strong>
													<c:if test="${clinic.available eq '○' }"> <span  style = " font-size:1.5em;  color:deepskyblue ;"> O</span></c:if>
													<c:if test="${clinic.available ne '○' }"> <span style = " font-size:1.5em;  color:red ;"> X</span></c:if> 
													
													<p class="time_info">
														<span><img alt="/Happy/resource/img/apart.jpg" src="/Happy/resource/img/mon.jpg" width="25"> ${clinic.weekdaytime } </span> &nbsp;
														<span><img alt="/Happy/resource/img/apart.jpg" src="/Happy/resource/img/sat.jpg" width="25"> ${clinic.saturdaytime } </span><br>
														<span><img alt="/Happy/resource/img/apart.jpg" src="/Happy/resource/img/red.jpg" width="25"> ${clinic.redtime } </span><br>
													</p>
												</td>
												<td style="vertical-align: middle"><a href="${clinic.clinictel }"  style="vertical-align: middle">${clinic.clinictel }</a></td>
												<td style="vertical-align: middle"><a href="/react/ncov_map_page.jsp?hospitalCd=03&amp;region=서울&amp;town=강남구&amp;hospitalNm=강남구보건소"  style="vertical-align: middle">지도</a></td> --%>
											</tr>
 										</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
        <script src="${root}/resources/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${root}/resources/assets/demo/datatables-demo.js"></script>
    </body>
</html>
