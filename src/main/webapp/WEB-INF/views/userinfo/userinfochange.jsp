<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 회원정보수정</title>
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
					<h1 class="heading">회원정보수정</h1>

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
					<h2 class="font-weight-bold heading text-primary mb-4">회원정보수정</h2>
				</div>
				<div class="col-lg-6">
					<p class="text-black-50">이름 : ${loginUser.userName }<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#updateusername">수정</button></p>
					<p class="text-black-50">전화번호 : ${loginUser.userPhone }<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#updateuserphone">수정</button></p>
					<p class="text-black-50">이메일 : ${loginUser.userEmail }<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#updateuseremail">수정</button></p>
					<p class="text-black-50">비밀번호 변경<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#updateuserpw">비밀번호 변경</button></p>
					<p class="text-black-50">회원탈퇴<button class="btn btn-outline-info" type="button" onclick="location.href='deleteuserpage.ui';">회원탈퇴 페이지로 이동</button></p>
				</div>
					
					<div class="modal fade" id="updateusername">
			        <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">이름변경</h4>
			                    <button type="button" class="close" data-dismiss="modal">&times;</button>
			                </div>
			
			                <form action="updateusername.ui" method="post">
			                <input type="hidden" name="userId" value="${loginUser.userId }">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div align="center">
			                        </div>
			                        <br>
			                            <label for="userName" class="mr-sm-2">변경할 이름 : </label>
			                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="이름을 입력해주세요" id="userName" name="userName"> <br>
			                    </div>
			                    <!-- Modal footer -->
			                    <div class="modal-footer" align="center">
			                        <button type="submit" class="btn btn-outline-info">변경하기</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    	</div>
			    					
					<div class="modal fade" id="updateuserphone">
			        <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">전화번호 변경</h4>
			                    <button type="button" class="close" data-dismiss="modal">&times;</button>
			                </div>
			
			                <form action="updateuserphone.ui" method="post">
			                <input type="hidden" name="userId" value="${loginUser.userId }">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div align="center">
			                        </div>
			                        <br>
			                            <label for="userPhone" class="mr-sm-2">변경할 전화번호 : </label>
			                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="번호를 입력해주세요" id="userPhone" name="userPhone"> <br>
			                    </div>
			                    <!-- Modal footer -->
			                    <div class="modal-footer" align="center">
			                        <button type="submit" class="btn btn-outline-info">변경하기</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    	</div>
				
					<div class="modal fade" id="updateuseremail">
			        <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">이메일 변경</h4>
			                    <button type="button" class="close" data-dismiss="modal">&times;</button>
			                </div>
			
			                <form action="updateuseremail.ui" id="enrollform" method="post">
			                <input type="hidden" name="userId" value="${loginUser.userId }">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div align="center">
			                        </div>
			                        <br>
			                            <label for="userEmail" class="mr-sm-2">변경할 이메일 : </label>
			                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="이메일을 입력해주세요" id="userEmail" name="userEmail"> <br>
			                            <div id="mailcheck"></div>
			                            <div id="num">
								          	<button type="button" id="email_auth_btn" class="email_auth_btn btn btn-outline-info btn-sm">인증번호 받기</button>
								        </div>
							           <div class="col-md-6 mb-3" id="chkhi">	
									   		<input type="text" placeholder="인증번호 입력" style="width:200px" id="email_auth_key" class="form-control mb-2 mr-sm-2" readonly required>  
											<div class="clearfix"></div>
							                   <span id="mail-check-warn"></span>
							           </div>
							           </div>
			                    <!-- Modal footer -->
			                    <div class="modal-footer" align="center">
			                        <button type="submit" class="btn btn-outline-info">변경하기</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    	</div>
			    	
			    	<div class="modal fade" id="updateuserpw">
			        <div class="modal-dialog modal-sm">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">비밀번호 변경</h4>
			                    <button type="button" class="close" data-dismiss="modal">&times;</button>
			                </div>
			
			                <form action="updateuserpwd.ui" method="post" id="enrollForm">
			                <input type="hidden" name="userId" value="${loginUser.userId }">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div align="center">
			                        </div>
			                        <br>
			                            <label for="userPwd" class="mr-sm-2">변경할 비밀번호 : </label>
			                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id="userPwd" name="userPwd"> <br>
			                            <label for="userPwdchk" class="mr-sm-2">변경할 비밀번호 확인 : </label>
			                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id="userPwdchk" name="userPwdchk"> <br>
			                            <font id="chkNotice" size="3"></font>
			                    </div>
			                    <!-- Modal footer -->
			                    <div class="modal-footer" align="center">
			                        <button type="submit" class="btn btn-outline-info" onclick="return validate();">변경하기</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    	</div>
				
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	<form class="postForm" id="postForm" action="" method="post">
		<input type="hidden" name="userNo" value="${loginUser.userNo }">
	</form>
	
	<script>
	function validate(){
		
		var userPwd = document.getElementById("userPwd").value;
		
		regExp=/^[a-z\d!@#$%^&*\s]{8,15}$/i;
	      if(!regExp.test(userPwd)){
	          alert("비밀번호 입력 시 영문자,숫자,특수문자로 총 8~15자로 입력해주세요.");
	          document.getElementById("userPwd").select();
	          return false;
	      }
	}
	
	//비밀번호 확인 비교 시작
	  $(function(){
	    $('#userPwd').keyup(function(){
	      $('#chkNotice').html('');
	    });
	
	    $('#userPwdchk').keyup(function(){
	    	console.log($('#userPwd').val());
			console.log($('#userPwdchk').val());
	        if($('#userPwd').val() != $('#userPwdchk').val()){
	          $('#chkNotice').html('비밀번호가 일치하지 않습니다');
	          $('#chkNotice').attr('color', 'red');
	          $("#enrollForm :submit").attr("disabled",true);
	        } else{
	          $('#chkNotice').html('비밀번호가 일치합니다');
	          $('#chkNotice').attr('color', 'blue');
	          $("#enrollForm :submit").attr("disabled",false);
	        }
	
	    });
	});
	//비밀번호 확인 비교 끝
	
	//이메일 중복체크(비동기) 시작
	$(function(){
    	let $mailchk = $("#enrollform input[name=userEmail]");
    
    		$mailchk.keyup(function(){
    		    var userEmail = document.getElementById("userEmail").value;
    		    
    		    var regExp=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    			
    			if($mailchk.val().length>=8){
    				
	            		$.ajax({
	        				url : "mailCheck.ui",
	        				data : {
	        					checkId : $mailchk.val()
	        				},
	        				success : function(result){
	        					if(result == "NNNNN"){ 
	        						$("#mailcheck").show();
	        						$("#mailcheck").css("color","red").text("중복된 이메일입니다. 다른 이메일을 사용해주세요.");
	        						$("#enrollform :submit").attr("disabled",true);
	        						$("#email_auth_btn").attr("disabled",true);
	        					} else{
		        					if(regExp.test(userEmail)==true){
		        						$("#mailcheck").show();
		        						$("#mailcheck").css("color","blue").text("사용가능한 이메일입니다.");
		        						$("#enrollform :submit").attr("disabled",true);
		        						$("#email_auth_btn").attr("disabled",false);
		        						return false;
		        					}else if(regExp.test(userEmail)==false){
		        						$("#mailcheck").show();
		        						$("#enrollform :submit").attr("disabled",true);
		        						$("#mailcheck").css("color","grey").text("이메일 형식에 맞춰서 8~20자로 입력해주세요");
		        						return false;
		        					}else{
		        						$("#mailcheck").show();
		        						$("#enrollform :submit").attr("disabled",true);
		        						$("#mailcheck").css("color","grey").text("이메일를 입력해주세요")
		        					}
	        					}
	        				},
	        				error : function(){
	        						
	        						console.log("통신실패했다람쥐");
	        						
	        				}
	        			})
	            	}else{ 
	            		$("#mailcheck").hide();
	            	
	            		$("#enrollform :submit").attr("disabled",true);
	            	}
    	})
    })
	
  //이메일 인증 시작
	$(".email_auth_btn").click(function(){	    
		$("#email_auth_key").attr('readonly', false).focus();
    	 var email = $('#userEmail').val();
    	 
    	 if(email == ''){
    	 	alert("이메일을 입력해주세요.");
    	 	return false;
    	 }
    	 
    	 $.ajax({
			type : "POST",
			url : "email.ui",
			data : {email : email},
			success: function(data){
				code=data;
				alert("인증번호가 발송되었습니다.");
				email_auth_cd = data;
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
	
	//인증번호 비교 시작
	$('#email_auth_key').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$("#enrollform :submit").attr("disabled",false);
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#email_auth_btn').attr('disabled',true);
			$('#userEmail').attr('readonly',true);
			$('#email_auth_key').attr('readonly',true);
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			$("#enrollform :submit").attr("disabled",true);
		}
	});
	//인증번호 비교 끝
	//이메일 중복체크(비동기) 끝
	
	function wishlist(){
		$(".postForm").attr("action", "wishlist.ro").submit();
	}
	
	function mywriting(){
		$(".postForm").attr("action", "roomenroll.bo").submit();
	}
	
	</script>
	
</body>
</html>