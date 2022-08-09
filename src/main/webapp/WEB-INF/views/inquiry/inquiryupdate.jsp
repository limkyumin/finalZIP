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

    #updateForm>table {width:100%;}
    #updateForm>table * {margin:5px;}
</style>

</head>
<body>

	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_1.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">1:1 문의 수정</h1>
				</div>
			</div>
		</div>

	</div>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <br><br><br>

            <form id="updateForm" method="post" action="update.in" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${i.inquiryTitle }" name="inquiryTitle" required></td>
                    </tr>
                    <c:if test="${not empty i.reportId }">
	                    <tr>
							<th><label for="reportWriter">신고대상자 아이디</label></th>
							<td><input type="text" id="reportWriter" class="form-control" value="${i.reportId }" name="reportId" required></td>
						</tr>
                    </c:if>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${i.userId }" name="userId" readonly></td>
                    </tr>
                    <c:if test="${not empty i.changeName }">
	                    <tr>
	                        <th><label for="upfile">첨부파일(예: 캡쳐 파일)</label></th>
	                        <td>
	                            <input type="file" id="upfile" class="form-control-file border" name="upfile">
	                            현재 업로드된 파일 : 
	                            <a href="${i.changeName }" download="${i.originName }">${i.originName }</a>
	                        </td>
	                    </tr>
                    </c:if>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="inquiryContent" required>${i.inquiryContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                	<input type="hidden" name="inquiryNo" value="${i.inquiryNo }">
                	<input type="hidden" name="userNo" value="${i.userNo }">
                	<input type="hidden" name="originName" value="${i.originName }">
                	<input type="hidden" name="changeName" value="${i.changeName }">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

	<jsp:include page="../common/footer.jsp" />

	<jsp:include page="../common/preloader.jsp" />
</body>
</html>