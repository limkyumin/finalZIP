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

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.content {
		width: 90%;
		margin: auto;
	}
	
	.innerOuter {
		width: 90%;
		margin: auto;
		padding: 5% 10%;
		background-color: white;
	}
	
	table * {
		margin: 5px;
	}
	
	table {
		width: 100%;
	}
</style>

</head>
<body>

	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_1.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">${r.reviewTitle }</h1>
				</div>
			</div>
		</div>

	</div>

	<div class="content">
		<br><br>
		<div class="innerOuter" align="center">
			<br> <a class="btn btn-secondary" style="float: right; background-color: #2D55C9;" href="review.re">목록</a>
			<br><br><br>

			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="200">제목</th>
					<td colspan="3">${r.reviewTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${r.userId }</td>
					<th>작성일</th>
					<td>${r.reviewDate }</td>
				</tr>
			</table>
			<br>

			<form id="postform" action="" method="post">
				<input type="hidden" name="rno" value="${r.reviewNo }">
			</form>
			
			<script>
				function postFormSubmit(num){
					
					if(num==1){
						
						$("#postform").attr("action", "updateForm.re").submit();
					}
					else{
						
						$("#postform").attr("action", "delete.re").submit();
					}
				}
			</script>
		</div>
		<div id="content2" align="center">
			${r.reviewContent }
		</div>
		<div align="center">
			<c:if test="${loginUser.userId eq r.userId }">
				<a class="btn btn-primary" onclick="postFormSubmit(1);">수정</a>
				<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제</a>
			</c:if>
			<c:if test="${loginUser.userId eq 'admin' }">
				<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제</a>
			</c:if>
		</div>
		<br><br>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<jsp:include page="../common/preloader.jsp" />
</body>
</html>