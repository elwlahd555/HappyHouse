<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원가입</h3>
								</div>
								<div class="card-body">
									<form method="post" action="join" id="joinForm">
										<div class="form-group">
											<div class="form-group">
												<label class="small mb-1" for="name">Name</label> <input
													class="form-control py-4" id="name" type="text" name="name"
													placeholder="Enter name" />
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="email">EMAIL</label> <input
												class="form-control py-4" id="email" name="email"
												type="email" aria-describedby="emailHelp"
												placeholder="Enter email address" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="password">Password</label> <input
														class="form-control py-4" id="password" name="password"
														type="password" placeholder="Enter password" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="confirmpassword">Confirm
														Password</label> <input class="form-control py-4"
														id="confirmpassword" name="confirmpassword"
														type="password" placeholder="Confirm password" />
												</div>
											</div>

										</div>
										<div class="form-group">
											<label class="small mb-1" for="tel">Phone Number</label> <input
												class="form-control py-4" id="tel" name="tel" type="text"
												placeholder="Enter phone number" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="address">Address</label> <input
												class="form-control py-4" id="address" type="text"
												name="address" placeholder="Enter address" />
										</div>
										<div class="form-group mt-4 mb-0">
											<a class="btn btn-primary btn-block" id="joinBtn">회원가입</a>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="logout">Have an account? Go
											to login</a>
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
	<script src="js/scripts.js"></script>
	<script>
		$("#joinBtn").click(
				function() {
					if (formChk([ 'name', 'email', 'password',
							'confirmpassword' ]) == false) {
						return false;
					}
					if (($('#password').val() != $('#confirmpassword').val())) {
						alert('비밀번호가 틀렸습니다.');
						return false;
					}
					$('#joinForm').submit();
				});

		function formChk(elements) {
			let result = true;
			$.each(elements, function(index, element) {
				let $ele = $(`#\${element}`);
				let msg = '필수 입력항목입니다. 내용을 입력하세요';
				if ($ele.val().trim() == '') {
					alert(msg);
					$ele.focus();
					result = false;
					return false;
				}
			});

			return result;
		}
	</script>
</body>
</html>
