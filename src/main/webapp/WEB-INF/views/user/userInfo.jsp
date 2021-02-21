<%@ page contentType="text/html; charset=utf-8"%>
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
                        <h1 class="mt-4">회원 관리</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                이 페이지는 관리자만 접근 가능한 페이지 입니다..<br>
                                <a target="_blank" href="https://datatables.net/">회원 정보</a>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                회원 정보 리스트
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                            
                                                <th>회원번호</th>
                                                <th>이메일</th>
                                                <th>이름</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            
                                                <th>회원번호</th>
                                                <th>이메일</th>
                                                <th>이름</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                                                                    <c:forEach var="member" items="${list }" >                                        
                                            <tr>
                                                <td><a href="userDetail?email=${member.email }">${member.memberno }</a></td>
                                                <td>${member.email }</td>
                                                <td>${member.name }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
<!--                                     <button type="button" class="btn btn-primary" onclick="userInsert">회원 추가</button>
                                    <button type="button" class="btn btn-success" onclick="userDetail">회원 상세 정보</button> -->
                                </div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>  <!--여기 나중에 현재 시간 넣기-->
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
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
