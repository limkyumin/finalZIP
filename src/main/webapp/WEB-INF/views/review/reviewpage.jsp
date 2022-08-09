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

<script type="text/javascript" src="/zip/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

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

#enrollForm>table {
	width: 100%;
}

#enrollForm>table * {
	margin: 5px;
}
</style>

</head>
<body>

	<div class="hero page-inner overlay" style="background-image: url('./resources/images/hero_bg_1.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">입주후기 작성</h1>
				</div>
			</div>
		</div>

	</div>

	<div class="content">
		<br><br>
		<div class="innerOuter">
			<br><br>

			<form id="enrollForm" method="post" action="insert.re">
				<table align="center">
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" id="title" class="form-control" name="reviewTitle" required></td>
					</tr>
					<tr>
						<th><label for="writer">작성자</label></th>
						<td><input type="text" id="writer" class="form-control" value="${loginUser.userId }" name="userId" readonly></td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td><textarea id="content" class="form-control" rows="10" style="resize: none;" name="reviewContent" required></textarea></td>
					</tr>
				</table>
				<br>

				<div align="center">
					<input type="hidden" value="${loginUser.userNo }" name="reviewWriter">
					<button type="submit" id="insert" class="btn btn-primary" onclick="contentNotNull();">등록하기</button>
					<button type="button" class="btn btn-danger" onclick="history.back();">뒤로가기</button>
				</div>
			</form>
			<script type="text/javascript">
				var oEditors = [];
				$(function(){
					
					function smartEditor(){
						
						nhn.husky.EZCreator.createInIFrame({ 
							oAppRef: oEditors, 
							elPlaceHolder: 'content', //텍스트에디터 textare id명
							sSkinURI: '/zip/resources/smarteditor2/SmartEditor2Skin.html', 
							fCreator: 'createSEditor2' 
						});
					}
					smartEditor();			
				});
				function contentNotNull(){
					
					  oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
					  var data = oEditors.getById['txtContent'].getIR();
					  if(data == '<p><br></p>') {
						alert("내용을 입력해주세요.")
						oEditors.getById["content"].exec("FOCUS")
						return
					  } else {
						console.log(data)
					  }
				}
				$("#insert").click(function(){
			          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			          $("#enrollForm").submit();
			    });
			</script>
		</div>
		<br><br>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<jsp:include page="../common/preloader.jsp" />
</body>
</html>