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
.hover:hover {
	cursor: pointer;
}

#myChart {
	
}
</style>


<!-- Custom fonts for this template-->
<link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 차트그래프  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<body id="page-top">
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="./">
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
			<li class="nav-item">
				<a class="nav-link collapsed" href="member.li" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>회원관리</span></a>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i> <span>문의관리</span>
				</a>
				<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">ADMINISTRATE</h6>
						<a class="collapse-item" href="userInquiry.li">1:1 문의</a> <a class="collapse-item" href="roomManagement.li">방 요청 / 수락</a>
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

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Alerts -->
						<!-- 방요청수락 -->
						<li class="nav-item dropdown no-arrow mx-1"><input type="hidden" id="startNum2" name="startNum2" value="1">
							<input type="hidden" id="endNum2" name="endNum2" value="3">

							<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> 
							<!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">${roomCount}</span>
							</a> <!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">방 요청 현황</h6>
								<div id="addBell">
									<c:forEach var="r" items="${mainBellList }">
										<a id="bellList" class="dropdown-item d-flex align-items-center" href="detail.ro?rno=${R.roomNo}">
											<div class="mr-3">
												<div class="icon-circle bg-primary">
													<i class="fas fa-exclamation-triangle text-white"></i>
												</div>
											</div>
											<div id="bellList2">
												<div id="bellBody" class="small text-gray-500">${r.roomNo }</div>
												${r.title }
											</div>
										</a>
									</c:forEach>
								</div>
								<div>
									<span id="ROOM" class="hover dropdown-item text-center small text-gray-500">더보기(More)</span>
								</div>

							</div>
						</li>
						
						<script>
							$(function() {
								$("#ROOM").click(function(e) {
									e.stopPropagation();
	
									var startNum2 = $('#startNum2').val();
									startNum2 = Number(startNum2) + 3;
									$('#startNum2').val(startNum2);
	
									var endNum2 = $('#endNum2').val();
									endNum2 = Number(endNum2) + 3;
									$('#endNum2').val(endNum2);
	
									$.ajax({
										url : "ajaxRoom",
										type : "post",
										dataType : "json",
										data : {
											"startNum2" : startNum2,
											"endNum2" : endNum2
										},
										success : function(data) {
	
											console.log("startNum2 콘솔", startNum2);
											console.log("endNum2 콘솔", endNum2);
											console.log(data);
	
											var addListHtml2 = "";
											if (data.length > 0) {
												for (var i = 0; i < data.length; i++) {
	
													console.log(data[i]);
	
													var idx2 = Number(startNum2) + Number(i) + 1;
	
													addListHtml2 += "<a class='dropdown-item d-flex align-items-center' href='detail.ro?rno=" + data[i].roomNo + "'>";
													addListHtml2 += "<div class='mr-3'>";
	
													addListHtml2 += "<div class='icon-circle bg-primary'>";
													addListHtml2 += "<i class='fas fa-exclamation-triangle text-white'></i>";
													addListHtml2 += "</div>";
													addListHtml2 += "</div>";
													addListHtml2 += "<div>";
													addListHtml2 += "<div id='bellBody' class='small text-gray-500'>" + data[i].roomNo + "</div>";
													addListHtml2 += "<div>" + data[i].title + "</div>";
													addListHtml2 += "</div>";
													addListHtml2 += "</a>";
												}
												$("#addBell").append(addListHtml2);
	
												data.forEach(function(el,index2) {
													//data[index] = el
													console.log(index2, el);
													// console.log('element', index, el);
													console.log(el.roomTitle);
													console.log(el.roomNo);
												});
											}
										},
										error : function() {
											console.log("통신실패");
										}
									})
								})
							})
						</script>

						<!-- 1:1문의 메시지버튼 -->
						<li class="nav-item dropdown no-arrow mx-1">
							<input type="hidden" id="startNum" name="startNum" value="1"> 
							<input type="hidden" id="endNum" name="endNum" value="3"> 
							<a class="nav-link dropdown-toggle" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
							<!-- Counter - Alerts --> <span class="badge badge-danger badge-counter">${inquiryCount}</span>
							</a> <!-- Dropdown - Alerts -->
							<div id="addList" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
							<!-- 여기가 table id라고 가정 -->
								<h6 class="dropdown-header">답변 미완성</h6>
								<div id="addList2">
									<c:forEach var="i" items="${mainMsgList }">

										<a class="dropdown-item d-flex align-items-center"
											href="detail.in?ino=${i.inquiryNo}">
											<div class="mr-3">
												<div class="icon-circle bg-warning">
													<i class="fas fa-exclamation-triangle text-white"></i>
												</div>
											</div>
											<div>
												<div id="listBody" class="small text-gray-500">${i.inquiryNo}</div>
												<div>${i.inquiryTitle}</div>
												<!-- 여기가 tbody -->
											</div>
										</a>
									</c:forEach>
								</div>
								<div>
									<span id="INQUIRY"
										class="hover dropdown-item text-center small text-gray-500">더보기(More)</span>
								</div>
							</div>
						</li>

						<script>
							$(function() {
								$("#INQUIRY").click(function(e) {
									e.stopPropagation();
									var startNum = $('#startNum').val();
									startNum = Number(startNum) + 3;
									$('#startNum').val(startNum);
	
									var endNum = $('#endNum').val();
									endNum = Number(endNum) + 3;
									$('#endNum').val(endNum);
	
									$.ajax({
										url : "ajaxInquiry",
										type : "post",
										dataType : "json",
										data : {
											"startNum" : startNum,
											"endNum" : endNum
										},
										success : function(data) {
											console.log("startNum 콘솔", startNum);
											console.log("endNum 콘솔", endNum);
											console.log(data);
	
											var addListHtml = "";
											if (data.length > 0) {
												for (var i = 0; i < data.length; i++) {
	
													console.log(data[i]);
	
													var idx = Number(startNum) + Number(i) + 1;
	
													//addListHtml += "<c:forEach var='"+i+"' items='"+data.mainMsgList[i]+"'>";
													addListHtml += "<a class='dropdown-item d-flex align-items-center' href='detail.in?ino=" + data[i].inquiryNo + "'>";
													addListHtml += "<div class='mr-3'>";
													addListHtml += "<div class='icon-circle bg-warning'>";
													addListHtml += "<i class='fas fa-exclamation-triangle text-white'></i>";
													addListHtml += "</div>";
													addListHtml += "</div>";
													addListHtml += "<div>";
													addListHtml += "<div id='listBody' class='small text-gray-500'>" + data[i].inquiryNo + "</div>";
													addListHtml += "<div>" + data[i].inquiryTitle + "</div>";
													addListHtml += "</div>";
													addListHtml += "</a>";
													//addListHtml += "</c:forEach>";
												}
												$("#addList2").append(addListHtml);
	
												data.forEach(function(el,index) {
													//data[index] = el
													console.log(index, el);
													// console.log('element', index, el);
													console.log(el.inquiryTitle);
													console.log(el.inquiryNo);
												});
											}
										},
										error : function() {
											console.log("통신실패");
										}
									})
								})
							})
						</script>


						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 
								<c:if test="${loginUser.userId }">
								</c:if> ${loginUser.userName}
								</span> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-600"></i>
							</a> <!-- Dropdown - User Information -->
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
				<div class="container-fluid">
					<!-- 원차트 -->
					<div class="container">
						<div class="row my-3">
							<div class="col-12" align="center"></div>
						</div>

						<div class="row my-2">
							<div class="col-lg-4">
								<div class="card">
									<div class="card-body">
										<h4 align="center">등록건물 현황</h4>
										<canvas id="myChart1"></canvas>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="card">
									<div class="card-body">
										<h4 align="center">등록건물 가격현황</h4>
										<canvas id="myChart3"></canvas>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="card">
									<div class="card-body">
										<h4 align="center">이번 달 회원현황</h4>
										<canvas id="myChart2"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="container" align="center">
						<div class="row my-3">
							<div class="col-12" align="center"></div>
						</div>

						<div class="row my-2">
							<div class="col-lg-4">
								<div class="card">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-600"></i>금일의 신규회원
												</div>
												<div class="hover h5 mb-0 font-weight-bold text-gray-800" onclick="location.href='todayYmember.li'">${todayYmemberCnt}명입니다</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="card">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class=" card-body">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-600"></i>금일의 정지회원
												</div>
												<div class="hover h5 mb-0 font-weight-bold text-gray-800" onclick="location.href='search.mem?mpage=1&type=userStatus&keyword=p'">${todaySmemberCnt}명입니다</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="card">
									<div class="card border-left-primary shadow h-100 py-2">


										<div class="card-body">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-600"></i>금일의 탈퇴회원
												</div>
												<div class="hover h5 mb-0 font-weight-bold text-gray-800" onclick="location.href='search.mem?mpage=1&type=userStatus&keyword=n'">${todayQmemberCnt}명입니다</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="container" align="center">
						<div class="row my-3">
							<div class="col-12" align="center"></div>
						</div>

						<div class="row my-2">
							<div class="col-lg-4">
								<div class="card">
									<div class="card border-left-danger shadow h-100 py-2">
										<div class="card-body">
											<div class="col mr-2">
												<i class="fas fa-bell fa-fw"></i>
												<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
													누락된 방 등록 승인/거절 요청</div>
												<div id="roomManagement" onclick="location.href='roomManagement.li'" class="hover h5 mb-0 font-weight-bold text-gray-800">
													<b class="m-0 font-weight-bold text-danger">${roomCount}</b>
													건이 승인대기중 입니다
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="card">
									<div class="card border-left-danger shadow h-100 py-2">
										<div class="card-body">
											<div class="col mr-2">
												<i class="fas fa-envelope fa-fw"></i>
												<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
													답변을 기다리고있는 1:1 문의</div>
												<div id="userInquiry" onclick="location.href='userInquiry.li'" class="hover h5 mb-0 font-weight-bold text-gray-800 ">
													<b class="m-0 font-weight-bold text-danger">${inquiryCount}</b>건이
													답변 대기중입니다
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->

					<!-- Footer -->
					<footer class="sticky-footer bg-white">
						<div class="container my-auto">
							<div class="copyright text-center my-auto">
								<span>Copyright &copy; ZIP 2022</span>
							</div>
						</div>
					</footer>
					<!-- End of Footer -->

				</div>
				<!-- End of Content Wrapper -->
			</div>
		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

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

	<!-- 건물별 차트 -->
	<script>
		data = {
			datasets : [ {
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(75, 192, 192, 0.2)' ],
				data : [ '${apartmentCnt}', '${housingCnt}',
						'${villaCnt}' ],

			} ],
			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels : [ '아파트', '주택', '빌라' ]
		};

		// 가운데 구멍이 없는 파이형 차트
		var ctx1 = document.getElementById("myChart1");
		var myPieChart = new Chart(ctx1, {
			type : 'pie',
			data : data,
			options : {}
		});
	</script>

	<!-- 회원 차트 -->
	<script>
		data = {
			datasets : [ {
				backgroundColor : [ 'rgba(75, 192, 192, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)' ],
				data : [ '${monthYmemberCnt}', '${monthSmemberCnt}',
						'${monthQmemberCnt}' ],

			} ],
			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels : [ '신규', '정지', '탈퇴' ]
		};

		// 가운데 구멍이 없는 파이형 차트
		var ctx1 = document.getElementById("myChart2");
		var myPieChart = new Chart(ctx1, {
			type : 'pie',
			data : data,
			options : {}
		});
	</script>

	<!-- 가격현황차트 -->
	<script>
		data = {
			datasets : [ {
				backgroundColor : [ 'rgba(75, 192, 192, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)' ],
				data : [ '${priceOne}', '${priceTwo}', '${priceThree}' ],

			} ],
			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels : [ '30~50', '51~70', '71 이상' ]
		};

		// 가운데 구멍이 없는 파이형 차트
		var ctx1 = document.getElementById("myChart3");
		var myPieChart = new Chart(ctx1, {
			type : 'pie',
			data : data,
			options : {}
		});
	</script>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <!-- 누르면 맨위로 가야됭는데!!!!!!!!!!!!!!!!!!!! -->
		<i class="fas fa-angle-up"></i>
	</a>

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
</body>
</html>