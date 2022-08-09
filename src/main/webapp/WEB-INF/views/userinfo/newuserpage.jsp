<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 회원가입</title>
<link rel="stylesheet" href="./resources/css/newuserpage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#ZIP { 
	display: block; margin: 0px auto;
}
.form-wrap{
	margin-top:15px !important;
}
#chkhi{
	padding-top:30px;
}
</style>
</head>
<body>
<div class="wrap required">
		<a href="./">
			<img src="./resources/images/zip3.png" id="ZIP" style="width: 120px; height: 100px;">
		</a>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate action="insertuser.ui" method="post" id="enrollForm">
        
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userId">아이디</label>                             <!-- onpaste="return false;" = 복붙금지  -->
              <input type="text" class="form-control" id="userId" name="userId" onpaste="return false;" 
              onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" placeholder="영문자,숫자를 포함하여 총 4~20자로 입력해주세요" required> 
                   <div id="idcheck"></div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="userName">이름</label>
              <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요" value="" required>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userPwd">비밀번호</label>
              <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="영문자,숫자,특수문자로 총 8~15자로 입력해주세요" value="" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="userPwdchk">비밀번호 재확인</label>
              <input type="password" class="form-control" id="userPwdchk" name="userPwdchk" placeholder="비밀번호 재확인을 입력해주세요" value="" required>
            <font id="chkNotice" size="3"></font>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userBirth">생년월일</label>
              <input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="생년월일을 입력해주세요 ex)yyyymmdd" value="" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="userPhone">전화번호</label>
              <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="'-'를 제외한 전화번호를 입력해주세요" value="" required>
            </div>
          </div>
          
          <div class="row">
	          <div class="col-md-6 mb-3">
	            <label for="userEmail">이메일</label>
		            <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요" required>
		            <div id="mailcheck"></div>
		          	<button type="button" id="email_auth_btn" class="email_auth_btn btn btn-primary btn-sm">인증번호 받기</button>
	           </div>
				<div class="col-md-6 mb-3" id="chkhi">	
					<input type="text" placeholder="인증번호 입력" style="width:200px" id="email_auth_key" class="form-control" readonly required>  
						<div class="clearfix"></div>
	                    <span id="mail-check-warn"></span>
	          	</div>
          </div>
          

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userAddress">주소</label>
              	<input type="text" class="form-control" id="userAddress"  name="userAddress" placeholder="" readonly required>
				<button style="margin: 4px;" class="btn btn-primary btn-sm" type="button" id="userAddressbtn">
				<i class="icon-search icon-white"></i>검색</button>
              </div>
            <div class="col-md-6 mb-3">
              <label for="userAdrressH">상세주소</label>
              <input type="text" class="form-control" id="userAdrressDetail" name="userAddressDetail" placeholder="상세주소를 입력해주세요" value="" required>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="userHomenum">우편번호</label>
            <input type="text" class="form-control" disabled="disabled" style="width:100px" id="userHomenum" name="userHomenum" placeholder="" required>
          </div>

          <div class="mb-3">
            <label for="userGender">성별</label> &nbsp;&nbsp;
				<select name="userGender" id="userGender">
		            <option value="M">남성</option>
		            <option value="F">여성</option>
	        	</select>
          </div>
         
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          
          <div class="mb-4"></div>
          
          <div>
          <button class="btn btn-primary" type="submit" onclick="return validate();">가입 완료</button>
          <button class="btn btn-primary" type="button">가입 취소</button>
          </div>
          
        </form>
      </div>
    </div>
  </div>
</div>
  <script>
  
  //정규표현식 시작
  function validate(){

      var userName = document.getElementById("userName").value;
      var userPwd = document.getElementById("userPwd").value;
      var userPwdchk = document.getElementById("userPwdchk").value;
      var userBirth = document.getElementById("userBirth").value;
      var userPhone = document.getElementById("userPhone").value;
      var email_auth_btn = document.getElementById("email_auth_btn").value;
      
      regExp=/^[가-힣]{2,}$/;
      if(!regExp.test(userName)){
          alert("유효한 이름을 입력해주세요.")
          document.getElementById("userName").select(); 
          return false;
      }
      
      regExp=/^[a-z\d!@#$%^&*\s]{8,15}$/i;
      if(!regExp.test(userPwd)){
          alert("비밀번호 입력 시 영문자,숫자,특수문자로 총 8~15자로 입력해주세요.");
          document.getElementById("userPwd").select();
          return false;
      }
      
      if(userPwd!=userPwdchk){
          alert("비밀번호와 동일하게 입력해주세요.");
          document.getElementById("userPwdchk").select();
          return false;
      }
      
      regExp=/^(19[0-9][0-9]|20\d{2})(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
      if(!regExp.test(userBirth)){
          alert("형식에 맞춰서 생년월일을 입력해주세요.")
          document.getElementById("userBirth").select(); 
          return false;
      }
      
      regExp=/^01([0|1|6|7|8|9])?([0-9]{4})?([0-9]{4})$/;
      if(!regExp.test(userPhone)){
          alert("'-'를 제외한 전화번호를 입력해주세요.")
          document.getElementById("userPhone").select(); 
          return false;
      }
      
  }
  //정규표현식 끝
    
    //아이디 중복체크(비동기) 시작
    $(function(){
    	let $idchk = $("#enrollForm input[name=userId]");
    
    		$idchk.keyup(function(){
    		    var userId = document.getElementById("userId").value;
    			var regExp= /^[a-zA-Z](?=.*[a-zA-Z])(?=.*?[0-9]).{3,19}$/;
    			
    			if($idchk.val().length>=4){
    				
	            		$.ajax({
	        				url : "idCheck.ui",
	        				data : {
	        					checkId : $idchk.val()
	        				},
	        				success : function(result){
	        					if(result == "NNNNN"){ 
	        						$("#idcheck").show();
	        						$("#idcheck").css("color","red").text("중복된 아이디이거나 탈퇴된 아이디입니다. 다른 아이디를 입력해주세요.");
	        						$("#enrollForm :submit").attr("disabled",true);
	        					} else{
		        					if(regExp.test(userId)==true){
		        						$("#idcheck").show();
		        						$("#idcheck").css("color","blue").text("멋진 아이디네요!");
		        						$("#enrollForm :submit").attr("disabled",false);
		        						return false;
		        					}else if(regExp.test(userId)==false){
		        						$("#idcheck").show();
		        						$("#idcheck").css("color","grey").text("아이디 입력 시 영문자,숫자를 포함하여 총 4~20자로 입력해주세요");
		        						return false;
		        					}else {
		        						$("#idcheck").show();
		        						$("#idcheck").css("color","grey").text("아이디를 입력해주세요");
		        					}
	        					}
	        				},
	        				error : function(){
	        						
	        						console.log("통신실패했다람쥐");
	        				}
	        			})
	            	}else{ 
	            		$("#idcheck").hide();
	            	
	            		$("#enrollForm :submit").attr("disabled",true);
	            	}
    	})
    })
  //아이디 중복체크(비동기) 끝  
  
  //비밀번호 확인 비교 시작
	  $(function(){
	    $('#userPwd').keyup(function(){
	      $('#chkNotice').html('');
	    });
	
	    $('#userPwdchk').keyup(function(){
	
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
  
	//주소 검색 시작  
    function search_userAddress(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
                 // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var userAddress = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수
				 var userHomenum = 	data.zonecode;
                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                	 userAddress = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	 userAddress = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== '' && data.apartment === 'Y') {
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.

                 } 
                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById("userHomenum").value = userHomenum;
                 document.getElementById("userAddress").value = userAddress;
                 $("#userHomenum").prop('readonly', true);
                 $("#userAddress").prop('readonly', true);
                 // 커서를 상세주소 필드로 이동한다.
                 $("#userAdrressH").focus();
             }
		}).open();
	}


		$("#userAddressbtn").on("click", function(){
				search_userAddress();
		});
		$("#userAddress").on("click", function(){
			search_userAddress();
		});
	//주소 검색 끝
	
	//이메일 중복체크(비동기) 시작
	$(function(){
    	let $mailchk = $("#enrollForm input[name=userEmail]");
    
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
	        						$("#enrollForm :submit").attr("disabled",true);
	        						$("#email_auth_btn").attr("disabled",true);
	        					} else{
		        					if(regExp.test(userEmail)==true){
		        						$("#mailcheck").show();
		        						$("#mailcheck").css("color","blue").text("사용가능한 이메일입니다.");
		        						$("#enrollForm :submit").attr("disabled",false);
		        						$("#email_auth_btn").attr("disabled",false);
		        						return false;
		        					}else if(regExp.test(userEmail)==false){
		        						$("#mailcheck").show();
		        						$("#mailcheck").css("color","grey").text("이메일 형식에 맞춰서 8~20자로 입력해주세요");
		        						return false;
		        					}else{
		        						$("#mailcheck").show();
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
	            	
	            		$("#enrollForm :submit").attr("disabled",true);
	            	}
    	})
    })
	//이메일 중복체크(비동기) 끝
		
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
			$("#enrollForm :submit").attr("disabled",false);
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#email_auth_btn').attr('disabled',true);
			$('#userEmail').attr('readonly',true);
			$('#email_auth_key').attr('readonly',true);
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			$("#enrollForm :submit").attr("disabled",true);
		}
	});
	//인증번호 비교 끝
	
	//이메일 인증 끝
	
	//한글, 특수문자 입력 방지
	function characterCheck(obj){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=가-힣ㄱ-ㅎㅏ-ㅣ]/gi; 
		if( regExp.test(obj.value) ){
		alert("한글 및 특수문자는 입력하실수 없습니다.");
		obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		}
	}
	//한글, 특수문자 입력 방지
	
	//F12 키입력 거부 시작
	$(document).ready(function(){
        $(document).bind('keydown',function(e){
             if ( e.keyCode == 123 /* F12 */) {
                  e.preventDefault();
                  e.returnValue = false;
             } 
        });
   });
	//F12 키입력 거부 끝
	
	//우클릭 사용 금지 시작
	document.onmousedown=disableclick;
    status="우클릭은 사용하실 수 없습니다.";

    function disableclick(event){
         if (event.button==2) {
              alert(status);
              return false;
         }
    }
    //우클릭 사용 금지 끝
    
    $(document).ready(function() { 
    	$("[name=userId]").attr("required" , true);    
    	});

  </script>
</body>
</html>