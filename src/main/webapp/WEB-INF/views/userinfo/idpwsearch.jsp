<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P &mdash; 아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="./resources/css/loginandnewuser.css">
<style>
.idpw{
	text-decoration:none;
	color:black;
	font-size:12px;
	float: right;
	position: relative;
	left: -30%;
}
#ZIP { 
	display: block; margin: 0px auto;
}
.form-wrap{
	margin-top:15px !important;
}
.btn{
	background-color: #2D55C9;
	padding : 7px;
	color : white;
	border: 0;
	outline: 0;
	border-radius: 10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
</head>
<body>

	<c:if test="${not empty alertMsg}" >
		<script>
		alertify.alert("ZIP","${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

    <div class="wrap">
    	<a href="./">
    		<img src="./resources/images/zip3.png" id="ZIP" style="width: 120px; height: 100px;">
    	</a>
        <div class="form-wrap">
            <div class="button-wrap">
                <div id="btn"></div>
                <button type="button" class="togglebtn" onclick="idsearch()">아이디<br>찾기</button>
                <button type="button" class="togglebtn" onclick="pwsearch()">비밀번호<br> 찾기</button>
            </div>
            <form id="idsearch" action="" class="input-group" method="post">
                <input type="text" class="input-field" placeholder="전화번호를 입력해주세요" id="userPhone" name="userPhone" required>
                <input type="email" class="input-field" placeholder="이메일을 입력해주세요" id="userEmail" name="userEmail" required>
                <br>
                <button type="button" class="btn" id="checkEmail">아이디 찾기</button>
                <button type="button" class="btn" onclick="history.back();">로그인 페이지로 이동</button><br>
            </form>
            <form id="pwsearch" action="" class="input-group" method="post">
                <input type="text" class="input-field" placeholder="아이디를 입력해주세요" id="userId" name="userId" required>
                <input type="email" class="input-field" placeholder="이메일을 입력해주세요" id="userEmail" name="userEmail" required>
                <div id="mailcheck"></div>
                <br>
                <button type="button" class="btn" id="pwcheck">비밀번호 찾기</button>
                <button type="button" class="btn" onclick="history.back();">로그인 페이지로 이동</button><br>
            </form>
        </div>
    </div>
    <script>
        var x = document.getElementById("idsearch");
        var y = document.getElementById("pwsearch");
        var z = document.getElementById("btn");
        
        
        function idsearch(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";
        }

        function pwsearch(){
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }
        
        //아이디 찾기 시작
        $("#checkEmail").click(function(){	     	 
    	 var userEmail = $('#userEmail').val();
    	 var userPhone = $('#userPhone').val();
    	 
	    	 if((userEmail == '')||(userPhone == '')){
	    	 	alert("빈칸없이 입력해주세요");
	    	 	return false;
	    	 }
    	 
	    	 $.ajax({
				type : "POST",
				url : "idsearch.ui",
				data : {"userEmail" : userEmail, "userPhone" : userPhone},
				success: function(data){
					code=data;
					alert("메일로 아이디가 발송되었습니다.");
				},
				error: function(data){
					alert("메일 발송에 실패했습니다.");
					console.log("실패");
				}
			}); 
		});
        //아이디 찾기 끝
        
        //비밀번호 찾기 시작
        $("#pwcheck").click(function(){	     	 
    	 var userId = $('#userId').val();
    	 var userEmail = $('#userEmail').val();
    	 
	    	 if((userId == '')||(userEmail == '')){
	    	 	alert("빈칸없이 입력해주세요");
	    	 	return false;
	    	 }
    	 
	    	 $.ajax({
				type : "POST",
				url : "pwsearch.ui",
				data : {"userId" : userId, "userEmail" : userEmail},
				success: function(data){
					code=data;
					alert("메일로 비밀번호가 발송되었습니다.");
				},
				error: function(data){
					alert("메일 발송에 실패했습니다.");
					console.log("실패");
				}
			}); 
		});
        //비밀번호 찾기 끝
        
       	$(function(){
    	let $mailchk = $("#pwsearch input[name=userEmail]");
    
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
	        					console.log(result);
	        					if(result == "NNNNN"){ 
	        						$("#mailcheck").show();
	        						$("#mailcheck").css("color","green").text("이메일 인증 가능한 이메일입니다.");
	        						$("#pwsearch :button").attr("disabled",false);
	        					} else{
		        					if(result == "NNNNY"){
		        						$("#mailcheck").show();
		        						$("#mailcheck").css("color","red").text("이메일 인증 불가능한 이메일입니다.");
		        						$("#pwsearch :button").attr("disabled",true);
		        						return false;
		        					}else if(regExp.test(userEmail)==false){
		        						$("#mailcheck").show();
		        						$("#mailcheck").css("color","grey").text("이메일 형식에 맞춰서 8~20자로 입력해주세요");
		        						$("#pwsearch :button").attr("disabled",true);
		        						return false;
		        					}
	        					}
	        				},
	        				error : function(){
	        						
	        						console.log("통신실패했다람쥐");
	        						
	        				}
	        			})
	            	}else{ 
	            		$("#mailcheck").hide();
	            	
	            		$("#pwsearch :button").attr("disabled",true);
	            	}
    	})
    })
        
    </script>
    

</body>
</html>