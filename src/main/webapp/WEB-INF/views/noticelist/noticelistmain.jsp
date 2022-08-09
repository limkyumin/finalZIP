<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 공지사항</title>

<style>
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}

#noticelist {
	text-align: center;
}

#noticelist>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	width: 20%;
}

.site-navigation>a:hover {
	text-decoration: none;
}

.dropdown>li>a {
	text-decoration: none;
}
</style>

<jsp:include page="../common/menubar.jsp" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_1.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">공지사항</h1>
				</div>
			</div>
		</div>

	</div>
	<div class="content">
		<br>
		<br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<br>

			<c:if test="${loginUser.userId eq 'admin' }">
				<a class="btn btn-secondary" style="float: right; background-color: #2D55C9;" href="enrollPage.no">글쓰기</a>
				<br>
			</c:if>
			<br>
			<table id="noticelist" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list }">
						<tr>
							<td>${n.noticeNo }</td>
							<td>${n.noticeTitle }</td>
							<td>관리자</td>
							<td>${n.noticeDate }</td>
							<td>${n.noticeView }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div id="pagingArea" align="center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">&lt;이전</a></li>
						</c:when>
						<c:otherwise>
							<c:if test="${not empty map }">
								<li class="page-item"><a class="page-link" href="search.no?currentPage=${pi.currentPage-1}&type=${map.type }&keyword=${map.keyword }">&lt;이전</a></li>
							</c:if>
							<c:if test="${empty map }">
								<li class="page-item"><a class="page-link" href="noticelist.no?npage=${pi.currentPage-1}">&lt;이전</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
						<c:choose>
							<c:when test="${i ne pi.currentPage }">
								<c:if test="${not empty map }">
									<li class="page-item"><a class="page-link" href="search.no?currentPage=${i}&type=${map.type }&keyword=${map.keyword }">${i}</a></li>
								</c:if>
								<c:if test="${empty map }">
									<li class="page-item"><a class="page-link" href="noticelist.no?npage=${i}">${i}</a></li>
								</c:if>
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
							<c:if test="${not empty map }">
								<li class="page-item"><a class="page-link" href="search.no?currentPage=${pi.currentPage+1}&type=${map.type }&keyword=${map.keyword }">다음&gt;</a></li>
							</c:if>
							<c:if test="${empty map }">
								<li class="page-item"><a class="page-link" href="noticelist.no?npage=${pi.currentPage+1}">다음&gt;</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<form id="searchForm" action="search.no" method="get" align="center">
				<input type="hidden" name="currentPage" value="1">
				<div class="select">
					<select class="custom-select" name="type">
						<option value="noticeTitle">제목</option>
						<option value="noticeContent">내용</option>
					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary" style="background-color: #2D55C9;">검색</button>
			</form>
			<form id="postform" action="" method="post">
				<input type="hidden" name="userNo" value="${loginUser.userNo }">
			</form>
			<script>
				$(function() {
					$(".table>tbody>tr").click(function() {
						location.href = "detail.no?nno=" + $(this).children().eq(0).text();
					})
				})
			</script>
			<br clear="both">
			<br>
			<br>
			<br>
		</div>
		<br>
		<br>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<jsp:include page="../common/preloader.jsp" />
</body>
</html>