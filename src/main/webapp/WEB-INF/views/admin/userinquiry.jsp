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
	#inquiryList>tbody>tr:hover {cursor:pointer;}

</style>

</script-->
<!-- Custom fonts for this template-->
<link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<body id="page-top">
	<div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./">

                <div class="sidebar-brand-text mx-3">HOMELESS </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="admin.ui">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>관리자 페이지</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Administrate
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">

                <a class="nav-link collapsed" href="member.li" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원관리</span>
                </a>

            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>문의관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">ADMINISTRATE</h6>
                        <a class="collapse-item" href="userInquiry.li">1:1 문의</a>
                        <a class="collapse-item" href="roomManagement.li">방 요청 / 수락</a>
                    </div>
                </div>
            </li>

            

            

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                   

                   

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">${inquiryCount}</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                   	답변 미완성
                                </h6>
                                	<c:forEach var="i" items="${list }">
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">${i.inquiryNo}</div>
                                       		${i.inquiryTitle}
                                    </div>
                                    </c:forEach>
                                </a>
                                
                               
                                <a class="dropdown-item text-center small text-gray-500" href="#">CLOSE</a>
                            </div>
                        </li>

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
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                

				
				
				<table id="inquiryList" class="table table-hover">
					<thead>
						<tr class="table-primary">
							
							<td align="center">번호</td>
							<td align="center">회원 아이디</td>
							<td align="center">문의 제목</td>							
							<td align="center">회원 상태</td>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${list }">
							<tr class="table-light">
							
								<td id="ino" align="center">${i.inquiryNo}</td>
								<td align="center">${i.userId}</td>
								<td align="center">${i.inquiryTitle}</td>								
								<td align="center">${i.userStatus}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				
				<script>
					$(function(){
	            		$("#inquiryList>tbody>tr").click(function(){
	            			location.href = 'detail.in?ino=' + $(this).children("#ino").text();
	            			
	            		})
	            	})
            	
           		 </script>



				<div id="paging-area" align="center" >
    		<c:if test="${pi.currentPage ne 1 }">
    			<button class="btn btn-primary" onclick="location.href='userInquiry.li?aipage=${pi.currentPage-1}'">[이전]</button>
    		</c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}" step="1">
	 			<c:choose>
	 				<c:when test="${ empty type }">
	 					<button class="btn btn-primary" onclick="location.href='userInquiry.li?aipage=${i}'">[${i}]</button>
	 				</c:when>
	 				
	            </c:choose>
            </c:forEach>
            <c:if test="${ pi.currentPage ne pi.maxPage }">
            	<button class="btn btn-primary" onclick="location.href='userInquiry.li?aipage=${pi.currentPage+1}'">[다음]</button>
            </c:if>
    			</div>	
                
            </div>
            
            
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; HOMELESS 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    


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
        <!--우측상단 관리자 페이지 Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    </div>

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
    
        <!-- Scroll to Top Button--> <!-- 얘 스크롤 맨위로가는 버튼 안생기는게 아직 아무것도 안만들어서 인듯? -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    
</body>
</html>