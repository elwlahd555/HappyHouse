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
        <c:import url="/WEB-INF/views/include/header.jsp"/>
        <div id="layoutSidenav">
            <c:import url="/WEB-INF/views/include/side.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">국가 안심 병원</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                             우리모두 힘을 합쳐 코로나 예방합시다!! <br>
                                <a target="_blank" href="http://www.mohw.go.kr/react/index.jsp">보건복지부 홈페이지 이동</a>
                                유형 <br>
                                A : 외래진료 <br>
                                B : 외래진료 및 입원
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                국민 안심병원 목록
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead >
                                            <tr>
                                                <th>연번</th>
                                                <th>시도</th>
                                                <th>시군구</th>
                                                <th style='text-align: center'>병원이름</th>
                                                <th>신청유형</th>
                                                <th>주소</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </thead>
                                        <tfoot >
                                            <tr>
                                                <th>연번</th>
                                                <th>시도</th>
                                                <th>시군구</th>
                                                <th style='text-align: center;'>병원이름</th>
                                                <th>신청유형</th>
                                                <th>주소</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </tfoot>
                                        <tbody style='text-align: center;'>
                                        <c:forEach var="hospital" items="${list }" varStatus="count">  
                                            <tr>
												<td style="vertical-align: middle">${count.index+1 }</td>
												<td style="vertical-align: middle"  width = "80px">${hospital.sido }</td>
												<td style="vertical-align: middle"  width = "80px">${hospital.gugun }</td>
												<td style="vertical-align: middle" class="name">
													<strong  style = " font-size:1.5em;  color:deepskyblue ;">${hospital.hospitalname } </strong>
												</td>
												<td style="vertical-align: middle"  width = "100px">${hospital.apply }</td>
												<td style="vertical-align: middle; text-size : 10px" width = "100px">${hospital.hospitaladdress }</td>
												<td style="vertical-align: middle; text-size : 10px" width = "100px"><a href="${hospital.hospitaltel }"  style="vertical-align: middle">${hospital.hospitaltel }</a></td>
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
