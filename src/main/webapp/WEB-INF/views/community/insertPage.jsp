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
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../Include/header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="../Include/side.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4" style="display: inline-block;">${titleName }</h1>
                        <div class="controlbtn">
                            <button type="button" class="btn btn-success" id="btnOk">확인</button>
                            <button type="button" class="btn btn-success" id="btnReset">초기화</button>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                               깨끗하고 아름다운 댓글문화를 만들어 가요!<br>
                                <a target="_blank" href="https://datatables.net/">게시판 작성 유의사항</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                제목 : ${board.title }
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
                                       <form method="post" action="main.do?action=${ActionName }" id="InsertForm">
                                       <input type="hidden" id="position" name="position" value="admin">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <td>작성자</td>
                                                <td><input type="text" name="writer"  id="writer" style="width:100%"></td>
                                                <td>작성일</td>
                                                <td><input type="text" name="wday"  id="wday" style="width:100%"></td>
                                            </tr>
                                            <tr style="text-align: center;">
                                                <td>제목</td>
                                                <td colspan="3"><input type="text" name="title"  id="title" style="width:100%"></td>
                                            </tr>
                                        </thead>
                                       
                                        <tbody>
                                            <tr>
                                                 <td colspan="4"><textarea name="content" id="content" rows="3" style="width:100%"></textarea></td>
                                            </tr>  
                                        </tbody>
                                       </form>
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
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        <script>
	$("#btnOk").click(function() {	
		$('#InsertForm').submit();
	});
	
	$('#btnReset').click(function() {
		$('#InsertForm')[0].reset();
	});
	
	
</script>
    </body>
</html>
