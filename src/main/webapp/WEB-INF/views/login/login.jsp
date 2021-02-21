<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
        <link href="${root}/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication"
		style="background-image: url(${root}/resources/img/apart.jpg); background-repeat: no-repeat; background-size: cover;">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">로그인</h3>
								</div>
								<div class="card-body">
									<form action='login' method="post" id="loginForm">
										<div>
										<c:if test="${not empty msg }">
											<p class="text-center">${msg}</p>
										</c:if>
										</div>
											<div class="form-group">
												<label class="small mb-1" for="email">이메일</label> <input
													class="form-control py-4" id="email" name="email" type="text"
													placeholder="이메일을 입력하시오" value="${saveid}"/>
											</div>
											<div class="form-group">
												<label class="small mb-1" for="password">비밀번호</label> <input
													class="form-control py-4" name="password" id="password"
													type="password" placeholder="Enter password" />
											</div>
											<div class="form-group">
												<div class="custom-control custom-checkbox">
													<input class="custom-control-input" name="idsave"
														id="idsave" type="checkbox" value="saveok"${idck}/> <label
														class="custom-control-label" for="idsave" >이메일
														기억하기</label>
												</div>
											</div>
											<div
												class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
												<a class="small" href="findpass">비밀번호
													찾기</a> <a class="btn btn-primary" type="btn" id="btn">로그인</a>
											</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="join">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
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
	<script>
		$("#btn").click(function() {
			if ($('#email').val().trim() == '') {
				alert('아이디를 입력하세요');
				$('#email').focus();
				return;
			}
			if ($('#password').val().trim() == '') {
				alert('패스워드를 입력하세요');
				$('#password').focus();
				return;
			}
			$("#loginForm").submit();
		});
	</script>
</body>
</html>
