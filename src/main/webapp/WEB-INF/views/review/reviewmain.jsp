<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 입주후기</title>

<jsp:include page="../common/menubar.jsp" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	#pagingArea {width:fit-content; margin:auto;}
</style>
</head>

<body>
	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_1.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">입주후기</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section section-properties">
		<div class="container">
			<c:if test="${not empty loginUser and loginUser.userId ne 'admin' and loginUser.userStatus ne 'P'}">
				<a class="btn btn-secondary" style="width: 90px; float: right; background-color: #2D55C9;" href="enrollPage.re">작성하기</a><br><br><br><br>
			</c:if>
			<div class="row">
				<c:forEach var="r" items="${list }">
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
						<div class="property-item mb-30">
							<a href="detail.re?rno=${r.reviewNo }" class="img">
								<img src="${r.thumbnail }" alt="Image" class="img-fluid">
							</a>
							<div class="property-content">
								<div class="price mb-2"></div>
								<div align="center">
									<span class="d-block mb-2 text-black-50"></span>
									<span class="city d-block mb-3">${r.reviewTitle }</span>
									<div class="specs d-flex mb-4">
										<span class="d-block d-flex align-items-center me-3">
											<span class="caption"></span>
										</span>
									</div>
									<a href="detail.re?rno=${r.reviewNo }" class="btn btn-primary py-2 px-3" style="background-color: #2D55C9;">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div id="pagingArea" align="center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">&lt;이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="review.re?rpage=${pi.currentPage-1}">&lt;이전</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
	                	<c:choose>
		                	<c:when test="${i ne pi.currentPage }">
		                		<li class="page-item"><a class="page-link" href="review.re?rpage=${i}">${i}</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item disabled"><a class="page-link" href="#">${i}</a></li>
	                		</c:otherwise>
	                	</c:choose>
               		</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="review.re?rpage=${pi.currentPage+1}">다음&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
    <jsp:include page="../common/preloader.jsp"/>
</body>
</html>