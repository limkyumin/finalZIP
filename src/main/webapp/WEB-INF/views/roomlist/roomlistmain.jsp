<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 방찾기</title>

<!-- Kakao Map API Key -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=298cc0e5d132bf174e1a21edd9684edb&libraries=services"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 432px;height: 198px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 16px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 429px;height: 185px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 3px 0 0 10px;height: 35px; background: #eee;border-bottom: 1px solid #ddd;font-size: 22px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 10px 0 0 155px;height: 123px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 135px;height: 140px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -92px;left: 50%;bottom: 0;width: 33px;height: 18px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #2D55C9;}
    .link {border: 0px white; background-color: white;}
    .link:hover {font-weight: bold;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="map" style="width:1400px; height:800px; margin: auto; margin-top: 131px;"></div>
		
	<script>
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567),
			level: 8
		};

		var map = new kakao.maps.Map(container, options);
		
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		<c:forEach var="r" items="${list}">
			
			var clickedOverlay = null;
		
			var geocoder = new kakao.maps.services.Geocoder();
			
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			    	
			    	var lat = result[0].y;
				    var lng = result[0].x;
				    
				    var imageSrc = './resources/images/zip3.png',
				    imageSize = new kakao.maps.Size(42, 43);
				    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
				    markerPosition = new kakao.maps.LatLng(lat, lng);
				    
				    var marker = new kakao.maps.Marker({
				        position: markerPosition,
				        map: map,
				        image: markerImage
				    });
				    
				    var content = '<div class="wrap">' + 
			        '    <div class="info">' + 
			        '        <div class="title">' + 
			        '            ${r.title}' + 
			        '            <div class="close closeWindow" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
			        '                <img src="./${r.changeName}" width="135" height="140">' +
			        '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis" style="color: black;"><b>${r.wishGender}전용</b></div>' + 
			        '                <div class="ellipsis" style="color: black;">한달 방세 : <b>${r.price}만원</b></div>' +
			        '                <div class="ellipsis">흡연 : <b>${r.smokeYn}</b></div>' +
			        '                <div class="ellipsis">애완동물 : <b>${r.petYn}</b></div>' +
			        '				 <c:choose><c:when test="${not empty loginUser}"><div><form action="deTail.ro?rno=${r.roomNo}" method="post">' +
			        '							<input type="hidden" value="${loginUser.userNo}" name="userNo">' +
			        '							<button type="submit" class="link">상세보기</button></form></div>' + 
			        '					</c:when><c:otherwise><div><a href="detail.ro?rno=${r.roomNo}" class="link">상세보기</a></div></c:otherwise></c:choose>' +
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' + 
			        '</div>';
				    
			        var overlay = new kakao.maps.CustomOverlay({
				        content: content,
				        map: map,
				        position: marker.getPosition()
				    });
 			        overlay.setMap(null);
			        
				    kakao.maps.event.addListener(marker, 'click', function() {
				    	
				    	if(clickedOverlay) {
				    		clickedOverlay.setMap(null);
				    	}
				        overlay.setMap(map);
				        clickedOverlay = overlay;
				        
					    $('.closeWindow').on("click", function(){
					    	overlay.setMap(null);
					    });
				    });
			    };
			};
			
			geocoder.addressSearch('${r.address}', callback);
		
		</c:forEach>
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>