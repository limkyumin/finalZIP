<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 1:1 문의</title>

<style>
    .content {
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter {
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background-color:white;
    }

    #inquiryList {text-align:center;}
    #inquiryList>tbody>tr:hover {cursor:pointer;}

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

<jsp:include page="../common/menubar.jsp"/>

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
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">1:1 문의</h1>
				</div>
			</div>
		</div>
		
	</div>
	<div class="content">
		<br><br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<br>
			
			<c:if test="${loginUser.userId ne 'admin' }">
				<a class="btn btn-secondary" style="float: right; background-color: #2D55C9;" href="enrollPage.in">글쓰기</a> <br>
			</c:if>
			<br>
			<table id="inquiryList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list }">
						<tr>
							<td>${i.inquiryNo }</td>
							<td>${i.inquiryTitle }</td>
							<td>${i.userId }</td>
							<td>${i.inquiryDate }</td>
							<c:if test="${i.answerStatus eq 'N' }">
								<td>답변대기</td>
							</c:if>
							<c:if test="${i.answerStatus eq 'Y' }">
								<td>답변완료</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
				$(function(){
					$("td:contains('답변대기')").css("color","rgb(210,147,30)");
		     		$("td:contains('답변완료')").css("color","rgb(89,196,202)");
				})
			</script>
			<br>
			<div id="pagingArea" align="center">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="#">&lt;이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="previousPage();">&lt;이전</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item"><a id="pageNum${p }" class="page-link" href="javascript:void(0);" onclick="movePage(${p});">${p}</a></li>
							<script>
								function movePage(num){
									
									for(var i = "${pi.startPage}"; i <= "${pi.endPage}"; i++){
										
										if(i == num){
											
											$("#postform").attr("action", "inquiry.in?ipage="+i).submit();
										};
									};
								};
							</script>
						</c:forEach>
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">다음&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="nextPage();">다음&gt;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<form id="postform" action="" method="post">
					<input type="hidden" name="userNo" value="${loginUser.userNo }">
				</form>
			<script>
				$(function(){
					$(".table>tbody>tr").click(function(){
						location.href="detail.in?ino=" + $(this).children().eq(0).text();
					})
				})
				
				function previousPage(){
					$("#postform").attr("action", "inquiry.in?ipage=${pi.currentPage-1}").submit();
				}
				
				function nextPage(){
					$("#postform").attr("action", "inquiry.in?ipage=${pi.currentPage+1}").submit();
				}
			</script>
			<br clear="both"><br><br><br>
		</div><br><br>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	<jsp:include page="../common/preloader.jsp"/>
</body>
</html>