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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
	
    </head>
    <body class="sb-nav-fixed">
        <c:import url="/WEB-INF/views/include/header.jsp" />
        <div id="layoutSidenav">
            <c:import url="/WEB-INF/views/include/side.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4" style="display: inline-block;">${titleName }</h1>

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
                                        <c:choose>


                                            <c:when test="${userinfo.email eq 'admin@admin' }">
                                                <form method="post" action="updateInfo?ino=${board.ino}" id="PageForm">
			                                        <thead>
                                                        <tr style="text-align: center;">
			                                                <td>제목</td>
			                                                <td colspan="3"><input type="text" name="title"  value="${board.title }" id="title" style="width:100%"></td>
			                                            </tr>
			                                        </thead>
			                                        <tbody>
                                                        <tr>
                                                            <td colspan="4"><textarea name="content" id="content" rows="3" style="width:100%">${board.content}</textarea></td>
			                                            </tr>  
                                                    </tbody>
                                                    

                                                        <div class="controlbtn">
                                                            <button type="button" class="btn btn-success" id="btnOk">수정</button>
                                                            <a class="btn btn-primary"  id="btnOk" href="deleteInfo?ino=${board.ino }"> 삭제</a>
                                                        </div>

                                                </form>
                                            </c:when>
                                            
                                            
                                            <c:otherwise>
                                                <thead>
                                                    <tr style="text-align: center;">
                                                        <td>작성자</td>
                                                        <td>${board.writer }</td>
                                                        <td>작성일</td>
                                                        <td>${board.wday }</td>
                                                    </tr>
                                                    <tr style="text-align: center;">
                                                        <td>제목</td>
                                                        <td colspan="3">${board.title }</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4">${board.content }</td>
                                                    </tr>  
                                                </tbody>
                                            </c:otherwise>
                                            
                                        </c:choose>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                댓글
                                <button class="writeOpinion" style="float: right; margin-right: 50px; background:orchid; border: none; font-size: large;">글쓰기</button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>내용</th>
                                                <th>작성자</th>
                                                <th>작성 날짜</th>
                                                <th class="del">삭제</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>번호</th>
                                                <th>내용</th>
                                                <th>작성자</th>
                                                <th>작성 날짜</th>
                                                <th class="del">삭제</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>1등!</td>
                                                <td>GUMI</td>
                                                <td>2020/08/25</td>
                                                <td  class="del"  ><input type="checkbox" name="delete"><label>삭제</label></th>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>감사합니다.</td>
                                                <td>SSAFY</td>
                                                <td>2020/07/25</td>
                                                <td  class="del"  ><input type="checkbox" name="delete"><label>삭제</label></th>
                                              
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>222222222</td>
                                                <td>MINT</td>
                                                <td>2020/01/12</td>
                                                <td  class="del"  ><input type="checkbox" name="delete"><label>삭제</label></th>
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
				
				$('#PageForm').submit();
			});
		</script>
        
    </body>
</html>
