<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 1:1 문의</title>

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
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">1:1 문의</h1>
				</div>
			</div>
		</div>

	</div>

	<div class="content">
		<br><br>
		<div class="innerOuter">
			<br>
			<c:if test="${loginUser.userId eq 'admin' }">	
				 <a class="btn btn-secondary" style="float: left; background-color: #2D55C9;" href="javascript:void(0);" onclick="userInquiryMain();">관리자페이지</a>
			</c:if>
			<a class="btn btn-secondary" style="float: right; background-color: #2D55C9;" href="javascript:void(0);" onclick="inquiryMain();">목록</a>
			<br><br><br>
			<script>
				function userInquiryMain(){
					
					$("#postform").attr("action", "userInquiry.li").submit();
				}
			</script>
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="200">제목</th>
					<td colspan="3">${i.inquiryTitle }</td>
				</tr>
				<c:if test="${not empty i.reportId }">
					<tr>
						<th>신고대상자 아이디</th>
						<td>${i.reportId }</td>
					</tr>
				</c:if>
				<tr>
					<th>작성자</th>
					<td>${i.userId }</td>
					<th>작성일</th>
					<td>${i.inquiryDate }</td>
				</tr>
				<c:if test="${not empty i.changeName }">
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><a href="${i.changeName }" download="${i.originName }">${i.originName }</a></td>
					</tr>
				</c:if>
				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4"><p style="height: 150px;">${i.inquiryContent }</p></td>
				</tr>
			</table>
			<br>

			<div align="center">
				<c:if test="${loginUser.userId ne 'admin' and empty list }">
					<a class="btn btn-primary" onclick="postFormSubmit(1);">수정</a>
				</c:if>
				<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제</a>
			</div>
			<br><br>
			
			<table id="replyArea" class="table" align="center">
				<c:if test="${loginUser.userId eq 'admin' }">
                   	<form action="insertReply.in" method="post">
	                	<thead>
	                    	<tr>
		                        <th colspan="2">
		                        	<input type="hidden" name="ino" value="${i.inquiryNo }">
		                            <textarea class="form-control" name="replyContent" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle">
		                        	<button type="submit" class="btn btn-secondary" style="background-color: #2D55C9;">등록하기</button>
		                        </th>
	                    	</tr>
	                	</thead>
                	</form>
				</c:if>
                <tbody>
                	<c:if test="${!empty list }">
                	<c:forEach var="r" items="${list}" >
	                    <tr>
	                        <th>관리자</th>
	                        <td>${r.replyContent }</td>
	                        <td>${r.replyDate }</td>
	                    </tr>
                	</c:forEach>
                	</c:if>
                </tbody>
            </table>

			<form id="postform" action="" method="post">
				<input type="hidden" name="userNo" value="${loginUser.userNo }">
				<input type="hidden" name="ino" value="${i.inquiryNo }">
				<input type="hidden" name="changeName" value="${i.changeName }">
			</form>
			
			<script>
				function postFormSubmit(num){
					
					if(num==1){
						
						$("#postform").attr("action", "updateForm.in").submit();
					}
					else{
						
						$("#postform").attr("action", "delete.in").submit();
					}
				}
				
				function inquiryMain(){
					
					$("#postform").attr("action", "inquiry.in").submit();
				}
			</script>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<jsp:include page="../common/preloader.jsp" />
</body>
</html>