<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
button{
	float: right;
	position: relative;
	left: -80.5%;
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
#delete{
left: -35% !important;
}

</style>
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
					<h1 class="heading">회원탈퇴</h1>

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
					<h2 class="font-weight-bold heading text-primary mb-4">회원탈퇴</h2>
					<h4>회원탈퇴 안내</h4>
					
					<h5>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요</h5><br>
					<h5>사용하고 계시는 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h5><br>
					<h5>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아있습니다.</h5>
					<h6>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.<br>
					탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해 드릴 수 없습니다.</h6>
					<div class="col-lg-6">
						<p class="text-black-50"><button class="btn btn-outline-info" type="button" onclick="history.back()">취소</button></p>
						<p class="text-black-50"><button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#deleteuser">회원탈퇴</button></p>
					</div>
					
					<div class="modal fade" id="deleteuser">
			        <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">회원탈퇴</h4>
			                    <button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							
			                <form action="deleteuser.ui" method="post">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div align="center">
						                            탈퇴 후 복구가 불가능합니다. <br>
						                            정말로 탈퇴 하시겠습니까? <br>
			                        </div>
			                        <br>
			                            <label for="userPwd" class="mr-sm-2">비밀번호 : </label>
			                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id="userPwd" name="userPwd"> <br>
			                    </div>
			                    <div class="modal-footer" align="center">
			                        <button type="submit" id="delete" class="btn btn-outline-info">탈퇴하기</button>
			                    </div>
			                </form>
			            </div>
			        </div>
    				</div>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	function wishlist(){
		$(".postForm").attr("action", "wishlist.ro").submit();
	}
	
	function mywriting(){
		$(".postForm").attr("action", "roomenroll.bo").submit();
	}
	</script>
	
</body>
</html>