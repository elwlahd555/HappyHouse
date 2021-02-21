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
    <link href="${root}/resources/css/styles.css" rel="stylesheet" />
    <link
      href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
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
            <h1 class="mt-4" style="border: #000">HAPPY SSAFY HOUSE</h1>
            <div class="card mb-4">
              <img src="/Happy/resource/img/apart.jpg" alt="" />
              <div class="card-body">
                <ol
                  class="breadcrumb mb-4"
                  style="background-color: #343a40 !important"
                >
                  <li
                    class="breadcrumb-item active"
                    style="
                      text-align: left;
                      font-size: 20px;
                      font-weight: 600;
                      color: #fff;
                      padding: 20px 0 40px;
                      text-shadow: 1px 1px 0px #000;
                    "
                  >
                    당신의 안전하고 쾌적한 휴식처를 <br />
                    차원이 다른 HAPPY HOUSE와 함께 찾아 보세요!
                  </li>
                </ol>
              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <h3 class="mt-4" style="border: #000">목적</h3>
              </div>
              <div class="card mb-4">
                쉽고 빠르게 원하는 지역의 부동산 정보를 찾아보세요~ <br />
                가격을 비교하여 최고의 집을 선택하세요 저희가 도와드리겠습니다.
              </div>
            </div>
            <div class="card mb-4">
              <div class="card-header">
                <h3 class="mt-4" style="border: #000">만든이</h3>
              </div>
              <div class="card mb-4">
                대표 : 김동빈, 심재혁, 임호빈 <br />
                tel :  02-3429-5100 <br />
                addr : 경상북도 구미시 임수동 94-1
              </div>
            </div>
          </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
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
  </body>
</html>
