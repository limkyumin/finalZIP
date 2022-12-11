<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="./resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="./resources/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="./resources/css/tiny-slider.css">
<link rel="stylesheet" href="./resources/css/aos.css">
<link rel="stylesheet" href="./resources/css/style.css">

<style>
	#sidemenu{
		position: fixed;
		top: 55%;
		left: 95%;
	}
	#sidemenu>a{
    text-decoration: none;
    color: black;
	}
	#sidemenu>a>div{
	    width: 78px;
	    height: 65px;
	    margin: 10px;
	    background-color: white;
	}
	.sidemenu_title{
	    width: 100%;
	    height: 40%;
	    font-size: 18px;
	}
	.sidemenu_imgArea{
	    width: 70px;
	    height: 55px;
	    position: relative;
	}
	.sidemenu_img{
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    top: 0;
	    left: 0;
	}
	#sidemenu>a>div:hover{
	    font-weight: bold;
	}
</style>
</head>

<body>
	<c:if test="${not empty alertMsg}" >
		<script>
			alertify.alert("ZIP","${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="./" class="logo m-0 float-start">HOMELESS</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<c:if test="${loginUser.userId eq 'admin' }">
								<li><a href="admin.ui">관리자 페이지</a></li>
						</c:if>
						<li><a href="list.ro">방찾기</a></li>
						<c:choose>
							<c:when test="${!empty loginUser and loginUser.userId ne 'admin'}">
								<li><a href="javascript:void(0);" onclick="registerRoom();">방등록</a></li>
							</c:when>
							<c:when test="${loginUser.userId eq 'admin' }">
							
							</c:when>
							<c:otherwise> <!-- 로그인정보가 비어있다면 alert 출력 -->
								<li><a href="javascript:alert('로그인 후 이용해주세요');" onfocus="this.blur()">방등록</a></li>
							</c:otherwise>
						</c:choose>
						<li class="has-children">
							<a href="noticelist.no">커뮤니티</a>
							<ul class="dropdown">
								<li><a href="noticelist.no">공지사항</a></li>
								<c:choose>
									<c:when test="${!empty loginUser }">
										<li><a href="javascript:void(0);" onclick="inquiryPage();">1:1 문의</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:alert('로그인 후 이용해주세요');" onfocus="this.blur()">1:1 문의</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="review.re">입주후기</a></li>
							</ul>
						</li>
						<li>
							<c:choose>
								<c:when test="${!empty loginUser and loginUser.userId ne 'admin'}"> <!-- 로그인정보가 비어있지 않다면 마이페이지로 이동 -->
									<a href="mypage.ui">마이페이지</a>
								</c:when>
								<c:when test="${loginUser.userId eq 'admin'}">
									
								</c:when>
								<c:otherwise> <!-- 로그인정보가 비어있다면 alert 출력 -->
									<li><a href="javascript:alert('로그인 후 이용해주세요');" onfocus="this.blur()">마이페이지</a></li>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${empty loginUser && empty sessionId}">
									<!-- 로그인 전 -->
             						<a href="loginandnewuser.ui">로그인/회원가입</a>
             					</c:when>
								<c:otherwise>
									<!-- 로그인 후 -->
									<c:if test="${!empty loginUser}">
	                        			<label style="color: white; font-weight: bold;">${loginUser.userName}님 환영합니다.</label>
	                        			<a href="logout.ui">로그아웃</a>
                        			</c:if>
                        			<c:if test="${sessionId != null}">
                        				<label style="color: white; font-weight: bold;">${sessionId}님 환영합니다.</label>
	                        			<a href="logout">로그아웃</a>
                        			</c:if>
       							</c:otherwise>
      						</c:choose>
						</li>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
				<form class="postForm" id="postForm" action="" method="post">
					<input type="hidden" name="userNo" value="${loginUser.userNo }">
					<input type="hidden" name="userStatus" value="${loginUser.userStatus }">
				</form>
				<script>
					function registerRoom(){
						$(".postForm").attr("action", "registerPage.ro").submit();
					}
					
					function inquiryPage(){
						$(".postForm").attr("action", "inquiry.in").submit();
					}
				</script>
			</div>
		</div>
	</nav>
	
	<div id="sidemenu" align="center">
		<c:if test="${!empty loginUser and loginUser.userId ne 'admin' and loginUser.userStatus ne 'P'}">
			<a href="javascript:void(0);" onclick="loadChat();">
				<div id="side1">
					<div class="sidemenu_title">채팅목록</div>
					<div class="sidemenu_imgArea">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
					  		<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
					  		<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
						</svg>
					</div>
				</div>
			</a>
		</c:if>
		<a href="">
			<div id="side2" class="top">
				<div class="sidemenu_title">TOP</div>
				<div class="sidemenu_imgArea">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
			  			<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
					</svg>
				</div>
			</div>
		</a>
	</div>
	<script>
		$('.top').click(function() {
			$('html, body').animate({scrollTop : 0}, 100);
			return false;
		});
		function loadChat(){
			
			var pop_title = "popupOpen";
			var status = 'location=no, width=465, height=700, location=no, status=no, toolbars=no, scrollbars=no';
			window.open("chatlist.ch", pop_title, status);
			
		}
	</script>
</body>
</html>