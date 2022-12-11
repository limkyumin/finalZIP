<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">

<title>Z.I.P</title>
</head>
<body>
	
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<div class="hero">

		<div class="hero-slide">
			<div class="img overlay" style="background-image: url('./resources/images/hero_bg_3.jpg')"></div>
			<div class="img overlay" style="background-image: url('./resources/images/hero_bg_2.jpg')"></div>
			<div class="img overlay" style="background-image: url('./resources/images/hero_bg_1.jpg')"></div>
		</div>
		
		<jsp:include page="common/menubar.jsp"/>
		
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center">
					<h1 class="heading" data-aos="fade-up">어느 지역에서 살고싶으세요?</h1>
					<form action="selectOption.ro" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200" method="post">
						<select name="wishGender" class="form-control" style="height: 60px; text-align: center;">
							<option value="남성">남성전용</option>
							<option value="여성">여성전용</option>
							<option value="all">전체</option>
						</select>
						<select name="buildingType" class="form-control" style="height: 60px; text-align: center">
							<option value="아파트">아파트</option>
							<option value="빌라">빌라</option>
							<option value="주택">주택</option>
							<option value="all">전체</option>
						</select>
						<button type="submit" class="btn btn-primary" style="width: 200px; background-color: #2D55C9;">검색</button>
					</form>
				</div>
			</div>
		</div>
		
	</div>

	<div class="section">

		<div class="container">
			<div class="row section-counter mt-5" style="margin-top: 0px !important; margin-bottom: 30px;" align="center">
			
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="caption text-black-50">거래된 매물</span>
						<span class="number"><span class="countup text-primary">3298</span>건</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="caption text-black-50">누적 회원수</span>
						<span class="number"><span class="countup text-primary">2181</span>명</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="caption text-black-50">총 입주후기</span>
						<span class="number"><span class="countup text-primary">316</span>건</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="caption text-black-50">누적 1:1문의</span>
						<span class="number"><span class="countup text-primary">7191</span>건</span>
					</div>
				</div>
				
			</div>
			
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6">
					<h2 class="font-weight-bold text-primary heading" style="font-size: 36px; font-weight: bold;"><b>최근 입주후기</b></h2>
				</div>
				<div class="col-lg-6 text-lg-end">
					<p><a href="review.re" class="btn btn-primary py-2 px-3" style="background-color: #2D55C9;">입주후기 더보기</a></p>
				</div>
			</div>
			
			<div class="row">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			$.ajax({
				url: "topList.re",
				success: function(result){
					
					let value = "";
					
					for(let i in result){
						
						value += '<div class="property-item" style="width: 412px; height: 490px; display: inline-block; margin: 10px;"><a href="detail.re?rno=' + result[i].reviewNo + '" class="img">'
							   + '<img src="' + result[i].thumbnail + '" alt="Image" class="img-fluid" width="412px" height="412px">' 
							   + '</a><div class="property-content"><div class="price mb-2"></div><div align="center"><span class="d-block mb-2 text-black-50"></span>'
							   + '<span class="city d-block mb-3">' + result[i].reviewTitle + '</span>'
							   + '<div class="specs d-flex mb-4"><span class="d-block d-flex align-items-center me-3">'
							   + '<span class="caption"></span></span><span class="d-block d-flex align-items-center">'
							   + '<span class="caption"></span></span></div>'
							   + '<a href="detail.re?rno=' + result[i].reviewNo + '" class="btn btn-primary py-2 px-3" style="background-color: #2D55C9;">상세보기</a>'
							   + '</div></div></div>';
					}
					$(".property-slider").html(value);
				},
				error: function(){
					
					console.log("통신 실패");
				}
			})
		})
	</script>
	
	<div class="section section-4 bg-light">
		<div class="container">
			<div class="row justify-content-center  text-center mb-5">
				<div class="col-lg-5">
					<h2 class="font-weight-bold heading text-primary mb-4" style="width: 700px; font-weight: bold;">셰어하우스 생활, 이렇기 때문에 좋습니다!</h2>
				</div>
			</div>
			<div class="row justify-content-between mb-5">
				<div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
					<div class="img-about dots">
						<img src="./resources/images/123.jpg" alt="Image" class="img-fluid">
					</div>
				</div>
				<div class="col-lg-4">
					<div class="d-flex feature-h">
						<span class="wrap-icon me-3">
							<span class="icon-home2"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading">주거비용 절감</h3>
							<p class="text-black-50">가성비가 좋아 금전적인 부담을 줄일 수 있고, 저렴한 방세로 주거비용을 크게 줄일 수 있습니다.</p>   
						</div>
					</div>

					<div class="d-flex feature-h">
						<span class="wrap-icon me-3">
							<span class="icon-home2"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading">생활 비품 구비 완료</h3>
							<p class="text-black-50">다른 물품은 크게 구입하지 않아도 되어 번거로움이 없고, 개인 생활용품만 챙겨 오면 바로 생활할 수 있다는 장점이 있습니다. </p>   
						</div>
					</div>

					<div class="d-flex feature-h">
						<span class="wrap-icon me-3">
							<span class="icon-home2"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading">타인과의 교류</h3>
							<p class="text-black-50">한 공간에서 다양한 사람들과 거주하며 교류하다 보면 외로움이 덜하며, 보다 안전하며 심리적으로도 편안해질 수 있습니다.</p>   
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="common/footer.jsp"/>
	
    <jsp:include page="common/preloader.jsp"/>
</body>
</html>