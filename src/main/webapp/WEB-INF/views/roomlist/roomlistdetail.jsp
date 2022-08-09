<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 방찾기</title>
<jsp:include page="../common/menubar.jsp"/>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	#roomDoc:hover{font-weight: bold;}
</style>
</head>
<body>
	
	<div class="hero page-inner overlay" style="background-image: url('./resources/images/1-a.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">${r.title }</h1>
				</div>
			</div>
		</div>
		
	</div>

	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-7">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide img">
							<c:forEach var="a" items="${list }">
								<img src="./${a.changeName }" alt="방사진" class="img-fluid">
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h2 class="heading text-primary" style="font-weight: bold; text-align: center; color: #2D55C9;">${r.title }</h2>
					<br><br>
					
					<p class="meta" style="text-align: center; font-size: 24px; font-weight: bold;">방 상세정보</p>
					<table class="table table-striped" style="text-align: center;">
						<tbody>
							<tr>
					      		<th scope="row"></th>
					      		<td>주소</td>
					      		<td>${r.address }</td>
					    	</tr>
					    	<c:if test="${loginUser.userId eq 'admin'}">
						    	<tr>
						      		<th scope="row"></th>
						      		<td>상세주소</td>
						      		<td>${r.addressDetail }</td>
						    	</tr>
					    	</c:if>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>건물유형</td>
					      		<td>${r.buildingType }</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>층수</td>
					      		<td>${r.buildingLevel }층</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>총 하우스메이트 인원 수</td>
					      		<td>${r.tenantNumber }명</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>선호하는 성별</td>
					      		<td>${r.wishGender }</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>선호하는 연령대</td>
					      		<td>${r.wishAge }</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>흡연</td>
					      		<td>${r.smokeYn }</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td>애완동물</td>
					      		<td>${r.petYn }</td>
					    	</tr>
					    	<tr>
					      		<th scope="row"></th>
					      		<td style="padding-top: 10px;">한달 방세</td>
					      		<td style="font-size: 18px;"><b>${r.price }만원</b></td>
					    	</tr>
					    	<c:if test="${loginUser.userId eq 'admin' and r.status eq 'W'}">
						    	<tr>
						      		<th scope="row"></th>
						      		<td style="padding-top: 10px;">주택임대차계약서 사본</td>
						      		<td style="font-size: 16px;"><a href="${at.changeName }" download="${at.originName }" style="text-decoration: none; color: black;" id="roomDoc">${at.originName }</a></td>
						    	</tr>
					    	</c:if>
					  	</tbody>
					</table>
					<div class="d-block agent-box" style="padding: 10px;">
						<div class="text">
							<div class="meta mb-3">작성자 <h3 class="mb-0" style="font-size: 24px;">${r.userId }</h3></div>
							<p>${r.content }</p>
						</div>
						<c:if test="${not empty loginUser }">
							<c:if test="${loginUser.userId ne r.userId and loginUser.userId ne 'admin'}">
								<c:if test="${empty ch and loginUser.userStatus ne 'P'}">
									<button type="button" id="chatbtn" class="btn btn-success" onclick="createChat();" style="margin-left:100px; margin-bottom: 10px; width: 117px; height: 36px;">1:1 채팅하기</button><br>
								</c:if>
								<c:if test="${loginUser.userStatus ne 'P' }">
									<c:choose>
										<c:when test="${not empty w }">
											<button type="button" class="btn btn-warning" onclick="removeWishlist();" style="margin-left: 35px; maring-bottom: 10px;">관심 목록 제거</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-primary" onclick="addWishlist();" style="margin-left: 45px; maring-bottom: 10px; background-color: #2D55C9;">관심 목록 추가</button>
										</c:otherwise>
									</c:choose>
									<button type="button" class="btn btn-danger" onclick="reportPage();" style="margin-left: 0px; margin-top: 0px;">신고하기</button>
								</c:if>
								<c:if test="${loginUser.userStatus eq 'P' }">
									<c:choose>
										<c:when test="${not empty w }">
											<button type="button" class="btn btn-warning" onclick="removeWishlist();" style="margin-left: 95px; maring-bottom: 10px;">관심 목록 제거</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-primary" onclick="addWishlist();" style="margin-left: 95px; maring-bottom: 10px; background-color: #2D55C9;">관심 목록 추가</button>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:if>
							<c:if test="${loginUser.userId eq 'admin' and r.status eq 'W'}">
								<button type="button" class="btn btn-primary" onclick="approveRoom();" style="margin-left: 70px; margin-top: 10px; background-color: #2D55C9;">등록승인</button>
								<button type="button" class="btn btn-danger" onclick="rejectRoom();" style="margin-top: 10px;">등록거절</button><br>
							</c:if>
							<c:if test="${loginUser.userId eq 'admin' and r.status eq 'Y'}">
								<button type="button" class="btn btn-danger" onclick="deleteRoom();" style="margin-left: 130px; margin-top: 10px;">삭제</button>
							</c:if>
							<c:if test="${loginUser.userId eq r.userId}">
								<button type="button" class="btn btn-warning" onclick="updatePage();" style="margin-left: 85px; margin-top: 10px;">수정</button>
								<button type="button" class="btn btn-danger" onclick="deleteRoom();" style="margin-top: 10px;">방내리기</button>
							</c:if>
						</c:if>
					</div>
					<form id="postform" name="postform" action="" method="post">
						<input type="hidden" name="userNo" value="${loginUser.userNo }">
						<input type="hidden" name="roomNo" value="${r.roomNo }">
						<input type="hidden" name="userId" value="${r.userId }">
						<input type="hidden" name="userId2" value="${loginUser.userId }">
						<input type="hidden" name="masterId" value="${r.userId}">
					</form>
					<script>
						function addWishlist(){
							$("#postform").attr("action", "addWishlist.ro").submit();
						}
						
						function removeWishlist(){
							$("#postform").attr("action", "removeWishlist.ro").submit();
						}
						
						function reportPage(){
							$("#postform").attr("action", "reportPage.in").submit();
						}
						function updatePage(){
							$("#postform").attr("action", "updatePage.ro").submit();
						}
						
						function deleteRoom(){
							$("#postform").attr("action", "delete.ro").submit();
						}
						
						function approveRoom(){
							$("#postform").attr("action", "approve.ro").submit();
						}
						
						function rejectRoom(){
							$("#postform").attr("action", "reject.ro").submit();
						}
						
						function createChat(){
							
							var status = 'location=no, width=600, height=800, status=no, directories=no, menubar=no, toolbar=no, resizable=no';
							var createchat = window.open('', 'popupOpener', status);
							
							var postform = document.postform;
							postform.target = "popupOpener";
							postform.action = "createChat.ch";
							postform.method = "post";
							createchat.resizeTo(465, 700);
							postform.submit();
							
							$("#chatbtn").attr("disabled", true);
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
    <jsp:include page="../common/preloader.jsp"/>
</body>
</html>