<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>W
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link href="${root}/resources/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div id="layoutSidenav">
		<c:import url="/WEB-INF/views/include/side.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">게시판</h1>
					<div class="card mb-4">
						<div class="card-body">
							깨끗하고 아름다운 게사판을 만들싶다 <a target="_blank"
								href="https://datatables.net/">게시판 작성 유의사항</a> .
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 게시글
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>조횟수</th>
											<th>작성 날짜</th>
											<th class="del">삭제</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>조횟수</th>
											<th>작성 날짜</th>
											<th class="del">삭제</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>1</td>
											<td>집사고 싶다</td>
											<td>GUMI</td>
											<td>61</td>
											<td>2020/08/25</td>
											<th><input type="checkbox" name="delete"><label>삭제</label></th>
										</tr>
										<tr>
											<td>2</td>
											<td>차 먼저 집먼저</td>
											<td>SSAFY</td>
											<td>63</td>
											<td>2020/07/25</td>
											<th><input type="checkbox" name="delete"><label>삭제</label></th>

										</tr>
										<tr>
											<td>3</td>
											<td>집 너무 비싸</td>
											<td>MINT</td>
											<td>66</td>
											<td>2020/01/12</td>
											<th><input type="checkbox" name="delete"><label>삭제</label></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
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
