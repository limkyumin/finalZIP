<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 마이페이지</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	

	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_3.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading">마이페이지</h1>

					<nav aria-label="breadcrumb" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="mypage.ui" style="font-size: 17px;">마이페이지</a></li>
							<li class="breadcrumb-item "><a href="userinfochange.ui" style="font-size: 17px;">회원정보수정</a></li>
							<li class="breadcrumb-item "><a href="javascript:void(0);" onclick="wishlist();" style="font-size: 17px;">관심목록</a></li>
							<li class="breadcrumb-item "><a href="javascript:void(0);" onclick="mywriting();" style="font-size: 17px;">내 작성글</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row text-left mb-5">
				<div class="col-12">
					<h2 class="font-weight-bold heading text-primary mb-4">내 정보</h2>
				</div>
				<div class="col-lg-6">
					<p class="text-black-50">${loginUser.userName }님의 정보</p>
					<p class="text-black-50">전화번호 : ${loginUser.userPhone }</p>
					<p class="text-black-50">이메일 : ${loginUser.userEmail }</p>
					<p class="text-black-50">가입날짜 : ${loginUser.enrollDate }</p>
					<c:if test="${loginUser.userStatus eq 'Y' }">
						<p class="text-black-50">회원상태 : 정상</p>
					</c:if>
					<c:if test="${loginUser.userStatus eq 'P' }">
						<p class="text-black-50">회원상태 : 정지</p>
					</c:if>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
		
				<form class="postForm" id="postForm" action="" method="post">
					<input type="hidden" name="userNo" value="${loginUser.userNo }">
				</form>
				
				<script>
					function wishlist(){
						$(".postForm").attr("action", "wishlist.ro").submit();
					}
					
					function mywriting(){
						$(".postForm").attr("action", "roomenroll.bo").submit();
					}
				</script>
	
</body>
</html>