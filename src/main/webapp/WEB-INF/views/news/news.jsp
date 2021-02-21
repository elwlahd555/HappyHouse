<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>23</title>
    <link href="${root}/resources/css/styles.css" rel="stylesheet" />

    <style>
      #news-body {
        list-style: none;
        text-decoration: none;
        color: darkgreen;
      }

      #news-body a {
        color: black;
      }

      #news-body li {
        text-decoration: none;
        list-style: none;
      }
      #modal-body {
        overflow: auto;
      }
      .modal-content {
      }
    </style>
  </head>
  <body class="sb-nav-fixed">
    <c:import url="/WEB-INF/views/include/header.jsp" />

    <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid">
            <h1 class="mt-4">뉴스</h1>
            <div class="card mb-4">
              <div class="card-body">
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">
                    당신의 꿈의 휴식처를 함께 찾아드릴게요!!!!
                  </li>
                </ol>
              </div>
            </div>

            <div class="card-body container" id="news-body"></div>
          </div>
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

    <!-- The Modal -->
    <div class="modal fade" id="myModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">Modal Heading</h4>
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
          </div>

          <!-- Modal body -->
          <div class="modal-body" id="modal-body">Modal body..</div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
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
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root}/resources/assets/demo/chart-area-demo.js"></script>
    <script src="${root}/resources/assets/demo/chart-bar-demo.js"></script>
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
      $(document).ready(() => {
        $.ajax({
          url: '/happy/news/headline',
          success: function (data) {
            $('#news-body').html(data);

            const wrap = document.querySelector('#news-body');
            const elements = wrap.getElementsByTagName('li');
            for (let i = 0; i < elements.length; i++) {
              elements[i].classList.add('list-group-item');
            }
          },
          beforeSend: function () {
            $('#news-body').html(
              '<img src="https://blog.kakaocdn.net/dn/bbG1RK/btqv0yFV1hL/VrPRCiDEklhGYyfut4KqJ1/loading.gif?attach=1&knm=img.gif"/>'
            );
          },
        });
      });

      document.querySelector('main').addEventListener('click', (e) => {
        if (e.target.nodeName === 'A') {
          // ajax 동작
          e.preventDefault();
          console.dir(e.target.getAttribute('href'));
          //알림
          $.ajax({
            url: '/happy/news/modal',
            data: { href: e.target.getAttribute('href') },
            success: function (data) {
              $('#myModal').modal({ show: true });
              $('#modal-body').html(data);
            },
            beforeSend: function () {
              $('#modal-body').html(
                '<img src="https://blog.kakaocdn.net/dn/bbG1RK/btqv0yFV1hL/VrPRCiDEklhGYyfut4KqJ1/loading.gif?attach=1&knm=img.gif"/>'
              );
            },
          });
        }
      });
    </script>
  </body>
</html>
