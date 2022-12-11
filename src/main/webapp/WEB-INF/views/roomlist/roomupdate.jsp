<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 방 수정</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="../common/menubar.jsp"/>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	.site-navigation>a:hover{
	    text-decoration: none;
	}
	.dropdown>li>a{
	    text-decoration: none;
	}
</style>
</head>
<body>
	
	<div class="hero page-inner overlay" style="background-image: url('./resources/images/2-a.jpg'); height: 500px;">

		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 500px;">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up" style="padding-top: 50px;">방 수정</h1>
				</div>
			</div>
		</div>
	</div>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <br>

            <form action="update.ro" method="post" enctype="multipart/form-data">
                <div class="form-group">
                
					<input type="hidden" value="${loginUser.userNo }" name="userNo">
                	<input type="hidden" value="${r.roomNo }" name="roomNo">
                	
                    <label for="title">* 제목 : </label>
                    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title" value="${r.title }" required> <br>
					
					<label for="">* 건물유형 : </label> &nbsp;&nbsp;
					<c:if test="${r.buildingType eq '아파트' }">
                    	<input type="radio" id="apartment" value="아파트" name="buildingType" checked>
					</c:if>
                    <label for="apartment">아파트</label> &nbsp;&nbsp;
                    <c:if test="${r.buildingType eq '빌라' }">
                    	<input type="radio" id="villa" value="빌라" name="buildingType" checked>
                    </c:if>
                    <label for="villa">빌라</label> &nbsp;&nbsp;
                    <c:if test="${r.buildingType eq '주택' }">
                    	<input type="radio" id="housing" value="주택" name="buildingType" checked>
                    </c:if>
                    <label for="housing">주택</label> &nbsp;&nbsp;<br><br>
                    
                    <label for="buildingLevel">* 층수 : </label>
                    <input type="number" class="form-control" id="buildingLevel" placeholder="층수를 입력하세요(숫자만)" name="buildingLevel" value="${r.buildingLevel }" required> <br>

                    <label for="tenantNumber">* 총 하우스메이트 인원수 : </label>
                    <input type="number" class="form-control" id="tenantNumber" placeholder="인원수를 입력하세요(숫자만)" name="tenantNumber" value="${r.tenantNumber }" required> <br>

                    <label for="address">* 주소(상세주소 제외) : </label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="" value="${r.address }" readonly required>
                    <button style="margin: 4px; background-color: #2D55C9;" class="btn btn-primary btn-sm" type="button" id="addressbtn">
					<i class="icon-search icon-white"></i>검색</button> <br><br>

                    <label for="addressDetail">* 상세주소 : </label>
                    <input type="text" class="form-control" id="addressDetail" placeholder="상세 주소를 입력하세요(예 : XX동 YY호만 )" name="addressDetail" value="${r.addressDetail }" required> <br>
					
					<label for="">* 선호 성별 :   &nbsp;</label> &nbsp;&nbsp;
					<c:if test="${r.wishGender eq '남성' }">
                    	<input type="radio" id="Male" value="남성" name="wishGender" checked>
					</c:if>
                    <label for="Male">남성</label> &nbsp;&nbsp;
                    <c:if test="${r.wishGender eq '여성' }">
                    	<input type="radio" id="Female" value="여성" name="wishGender" checked>
                    </c:if>
                    <label for="Female">여성</label> &nbsp;&nbsp;<br><br>
					
                    <label for="">* 선호 연령대 : </label> &nbsp;&nbsp;
                    <c:if test="${r.wishAge eq '20대' }">
                    	<input type="radio" id="twenties" value="20대" name="wishAge" checked>
                    </c:if>
                    <label for="twenties">20대</label> &nbsp;&nbsp;
                    <c:if test="${r.wishAge eq '30대' }">
                    	<input type="radio" id="thirties" value="30대" name="wishAge" checked>
                    </c:if>
                    <label for="thirties">30대</label> &nbsp;&nbsp;
                    <c:if test=" ${r.wishAge eq '무관' }">
                    	<input type="radio" id="noProblem" value="무관" name="wishAge" checked>
                    </c:if>
                    <label for="noProblem">없음</label> &nbsp;&nbsp;<br><br>
                    
                    <label for="">* 반려동물 :  &nbsp; &nbsp;</label> &nbsp;&nbsp;
                    <c:if test="${r.petYn eq '가능' }">
                    	<input type="radio" id="petY" value="가능" name="petYn" checked>
                    </c:if>
                    <label for="petY">가능</label> &nbsp;&nbsp;
                    <c:if test="${r.petYn eq '불가' }">
                    	<input type="radio" id="petN" value="불가" name="petYn" checked>
                    </c:if>
                    <label for="petN">불가</label> &nbsp;&nbsp;<br><br>
                    
                    <label for="">* 흡연자 :   &nbsp; &nbsp; &nbsp;</label> &nbsp;&nbsp;
                    <c:if test="${r.smokeYn eq '가능' }">
                    	<input type="radio" id="smokeY" value="가능" name="smokeYn" checked>
                    </c:if>
                    <label for="smokeY">가능</label> &nbsp;&nbsp;
                    <c:if test="${r.smokeYn eq '불가'}">
                    	<input type="radio" id="smokeN" value="불가" name="smokeYn" checked>
                    </c:if>
                    <label for="smokeN">불가</label> &nbsp;&nbsp;<br><br>
					
					<label for="upfile">* 사진파일</label>
					<input type="file" multiple="multiple" id="upfile1" class="form-control-file border" name="upfile1"> <br>
					현재 업로드 된 사진파일 : 
					<c:forEach var="i" items="${list }">
						<a href="${i.changeName }" download="${i.originName }">${i.originName }</a>
					</c:forEach>
					
					<br><br>
					<label for="upfile2">* 주택임대차계약서 사본</label>
					<input type="file" id="upfile2" class="form-control-file border" name="upfile2"> <br>
					현재 업로드 된 주택임대차계약서 사본 : 
					<a href="${at.changeName }" download="${at.originName }">${at.originName }</a>
					<br><br>
                    <label for="phone">* 한달 방세 : </label>
                    <input type="number" class="form-control" id="phone" placeholder="숫자만 입력하세요(단위 : 만원)" name="price" value="${r.price }" required> <br>
                    
                    <label for="address">* 내용 : </label>
                    <textarea class="form-control" rows="5" id="comment" placeholder="내용을 입력하세요" name="content" required>${r.content }</textarea> <br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" style="background-color: #2D55C9;">수정</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
            <script>
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
	                         document.getElementById("address").value = userAddress;
	                         $("#address").prop('readonly', true);
	                         // 커서를 상세주소 필드로 이동한다.
	                         $("#userAdrressH").focus();
	                     }
	        		}).open();
	        	}
	
	        	$("#addressbtn").on("click", function(){
	        			search_userAddress();
	        	});
	        	$("#address").on("click", function(){
	        		search_userAddress();
	        	});
            </script>
        </div>
        <br><br>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
    <jsp:include page="../common/preloader.jsp"/>
</body>
</html>