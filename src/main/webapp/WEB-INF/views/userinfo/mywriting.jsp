<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 내 작성글</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
button{
	float: right;
	position: relative;
	left: -40%;
	padding-top:5px !important;
	padding-right:10px !important;
	padding-bottom:5px !important;
	padding-left:10px !important;
	font-size:16px !important;
	font-weight:1000 !important;
	color:rgb(45, 85, 201) !important;
}
.close{
	float: right !important;
	left: 0% !important;
	position: relative;
	background-color: white !important;
}
#num{
	margin-bottom : 50px;
}

    #roomenroll,#inquiry,#review {text-align:center;	}
    #roomenroll,#inquiry,#review>tbody>tr:hover {cursor:pointer;}

    #pagingArea {width:fit-content; margin:auto;}
    
    #searchForm {
        width:80%;
        margin:auto;
    }
    #searchForm>* {
        float:left;
        margin:5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}
    .site-navigation>a:hover{
        text-decoration: none;
    }
    .dropdown>li>a{
        text-decoration: none;
    }
</style>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
					<h1 class="heading">내 작성글</h1>

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
					<h2 class="font-weight-bold heading text-primary mb-4">내 작성글</h2>
				</div>
				
				<div class="content1">
					<p class="innerOuter1"></p>
				
					<table id = "roomenroll" class="table table-hober">
						<thead>
						<h4>방등록</h4>
							<c:choose>
								<c:when test="${not empty list}">
										<tr>
											<th width="10%">글번호</th>
											<th width="30%">제목</th>
											<th width="60%">내용</th>
										</tr>
								</c:when>
								<c:otherwise>
									작성한 글이 없습니다.
								</c:otherwise>
							</c:choose>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="v" items="${list}">
										<tr class="roomenroll">
											<td>${v.roomNo }</td>
											<td>${v.title }</td>
											<td>${v.content }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					<table id = "inquiry" class="table table-hober">
						<thead>
						<h4>1:1 문의</h4>
							<c:choose>
								<c:when test="${not empty list2}">
										<tr>
											<th width="10%">글번호</th>
											<th width="30%">제목</th>
											<th width="40%">내용</th>
											<th width="20%">답변상태</th>
										</tr>
								</c:when>
								<c:otherwise>
									작성한 글이 없습니다.
								</c:otherwise>
							</c:choose>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${not empty list2}">
									<c:forEach var="v" items="${list2}">
										<tr class="inquiry">
											<td>${v.inquiryNo }</td>
											<td>${v.inquiryTitle }</td>
											<td>${v.inquiryContent }</td>
											<c:if test="${v.answerStatus eq 'N' }">
												<td>답변대기</td>
											</c:if>
											<c:if test="${v.answerStatus eq 'Y' }">
												<td>답변완료</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					<table id = "review" class="table table-hober">
						<thead>
						<h4>입주후기</h4>
							<c:choose>
								<c:when test="${not empty list3}">
										<tr>
											<th width="10%">글번호</th>
											<th width="90%">제목</th>
										</tr>
								</c:when>
								<c:otherwise>
									작성한 글이 없습니다.
								</c:otherwise>
							</c:choose>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${not empty list3}">
									<c:forEach var="v" items="${list3}">
										<tr class="review">
											<td>${v.reviewNo }</td>
											<td>${v.reviewTitle }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>					
					
				</div>
			</div>
		</div>
	</div>
	
	<form class="roomenroll2" id="postForm" action="" method="post">
		<input type="hidden" name="userNo" value="${loginUser.userNo }">
	</form>
	
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	$(function(){
		$(".roomenroll").click(function(){
			$(".roomenroll2").attr("action", "deTail.ro?rno=" + $(this).children().eq(0).text()).submit();
		})
	})
	
	$(function(){
		$(".inquiry").click(function(){
			$(".roomenroll2").attr("action", "detail.in?ino=" + $(this).children().eq(0).text()).submit();
		})
	})
	
	$(function(){
		$(".review").click(function(){
			$(".roomenroll2").attr("action", "detail.re?rno=" + $(this).children().eq(0).text()).submit();
		})
	})
	
	$(function(){
		$("td:contains('답변대기')").css("color","rgb(210,147,30)");
   		$("td:contains('답변완료')").css("color","rgb(89,196,202)");
	})
	
	function wishlist(){
		$("#postForm").attr("action", "wishlist.ro").submit();
	}
	
	function mywriting(){
		$("#postForm").attr("action", "roomenroll.bo").submit();
	}
	
	</script>
	
</body>
</html>