<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Z.I.P | 관리자페이지</title>

<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}

#searchForm {
            width:100%;
            height:50px;
            margin:auto;
            padding-left:500px;
        }
        #searchForm>* {
            float:left;
            margin:3px;
        }
        .select {width:10%;}
        .text {width:20%;}
        .searchBtn {width:20%;}


</style>

<!-- Custom fonts for this template-->
<link href="./resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="./resources/vendor/jquery/jquery.min.js"></script>
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="./resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="./resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="./resources/js/demo/chart-area-demo.js"></script>
<script src="./resources/js/demo/chart-pie-demo.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

</head>
<body>
<body id="page-top">
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="./">
				<div class="sidebar-brand-icon rotate-n-15">
					
				</div>
				<div class="sidebar-brand-text mx-3">HOMELESS</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="admin.ui">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>관리자 페이지</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Administrate</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="member.li" data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>회원관리</span>
			</a></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>문의관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">ADMINISTRATE</h6>
						<a class="collapse-item" href="userInquiry.li">1:1 문의</a> <a
							class="collapse-item" href="roomManagement.li">방 요청 / 수락</a>
					</div>
				</div></li>

			<!-- Divider -->
			
		</ul>

		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        

                        <!-- Nav Item - Alerts -->
                        

                        <!-- Nav Item - Messages -->
                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                
                                
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                	<c:if test="${loginUser.userId }">
									</c:if>
									${loginUser.userName}
                                </span>
                                
                                
                               <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-600"></i>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="noticelist.no"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Notice
								</a> 
								<a class="dropdown-item" href="review.re"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Review
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
                        </li>

                    </ul>

                </nav>
	
	
				<br>
		<div align="center" style="width:120%; height:50px;">
			<form id="searchForm"  action="search.mem" method="get" >
				<input type="hidden" name="mpage" value="1">
                <div class="select">
                    <select class="custom-select" name="type">
                        <option value="userId">아이디</option>
                        <option value="userName">이름</option>
                        <option value="userStatus">회원상태</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" bg-light border-0 small" placeholder="검색어를 입력하세요"
                    aria-label="Search" aria-describedby="basic-addon2" name="keyword">
                </div>
                
                <button class="btn btn-primary" type="submit">
					<i class="fas fa-search fa-sm"></i>
				</button>
            </form>
		</div>
				
				
			</div>
			<div class="container-fluid">


				<table class="table">
					<thead>

						<tr class="table-primary">
							<td align="center">회원번호</td>
							<td align="center">이름</td>
							<td align="center">회원 아이디</td>
							<td align="center">성별</td>
							<td align="center">회원상태</td>
							<td align="center">가입일</td>
							<td align="center"></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="u" items="${list }">
							<tr class="table-light">
								<td align="center">${u.userNo}</td>
								<td align="center">${u.userName}</td>
								<td align="center">${u.userId}</td>
								<td align="center">${u.userGender}</td>
								<td align="center">${u.userStatus}</td>
								<td align="center">${u.enrollDate}</td>
								<td align="center"><button type="button" class="btn btn-primary modifyBtn" data-toggle="modal"
										data-target="#updateStatus">상태변경</button></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>

			<div id="paging-area" align="center" >
    		<c:if test="${pi.currentPage ne 1 }">
    			<button class="btn btn-primary" onclick="location.href='member.li?mpage=${pi.currentPage-1}'">[이전]</button>
    		</c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
	 			<c:choose>
	 				<c:when test="${ empty map }">
	 					<button class="btn btn-primary" onclick="location.href='member.li?mpage=${i}'">[${i}]</button>
	 				</c:when>
	 				
	 				<c:otherwise>
				  		<button class="btn btn-primary" onclick="location.href='search.mem?mpage=${i}&type=${type}&keyword=${keyword}'">[${i}]</button>
	 				</c:otherwise>
	 				
	            </c:choose>
            </c:forEach>
            <c:if test="${ pi.currentPage ne pi.maxPage }">
            	<button class="btn btn-primary" onclick="location.href='member.li?mpage=${pi.currentPage+1}'">[다음]</button>
            </c:if>
    	</div>
			
			
				

			</div>
			
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; HOMELESS 2022</span>
					</div>
				</div>
			</footer>



			<!-- 멤버 정보수정 시작  -->

			<!-- The Modal -->
			<div class="modal fade" id="updateStatus" align="center" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header" align="center">
							<h3 class="modal-title" style="width: 100%;">회원상태 수정</h3>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form action="memStatus.update" method="post" align="center">

								<input type="hidden" id="modalHidden" name="userId"> <select
									name="userStatus">
									<option value="Y">정상</option>
									<option value="P">정지</option>
									<option value="N">탈퇴</option>
									<option value="F">강제탈퇴</option>
								</select> <br>
								<br>


								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" id="confirmBtn">정보변경</button>
									<button type="button" class="btn btn-dark" id="confirmBtnMiss" data-dismiss="modal">닫기</button>
													
								</div>
							</form>
									<script>
									$(function(){
										$('#confirmBtn').click(function(){
											if(confirm("정말 수정하시겠습니까?")){
												alert("완료");
												return true;

											}else{
												
												return false;
											}

										});
									});
									</script>
						</div>
					</div>
				</div>
			</div>

		<script>
			$(function(){
				$(".modifyBtn").click(function(){
					var userId = $(this).parents().eq(1).children().eq(2).text();
					$("#modalHidden").val(userId);
					
					console.log($("#modalHidden").val());
			
				})
			})
		</script>


		</div>
	</div>
	
	<!--우측상단 관리자 페이지 Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout.ui" id="Logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
	
	
	
	    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top"> <!-- 누르면 맨위로 가야됭는데!!!!!!!!!!!!!!!!!!!! -->
        <i class="fas fa-angle-up"></i>
    </a>
</body>
</html>