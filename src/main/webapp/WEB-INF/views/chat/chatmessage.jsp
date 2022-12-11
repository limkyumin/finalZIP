<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 채팅 메세지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
.chatTop {width: 460px; height: 45px; display: inline-block; padding-top: 10px;}
.name_container{float: left; padding-top: 5px;}
.floatRight {display: inline-block; float: right;}
.userId:hover {font-weight: bold; cursor: pointer; background-color: rgb(241,241,241);}
#setName {font-weight: bold;}
.btnImg:hover {width: 36px; height: 36px;}
ul {padding-left: 10px;}
ul>.left {width: 200px;}
ul>.right {width: 200px; padding-left: 250px;}
.chatMiddle>ul {list-style: none;}
.sender{font-weight: bold;}
.message{border: 1px solid black;}
.format>ul>li>.message {border: 0px solid white;}
.chatBottom>textarea {width: 458px; height: 50px; padding: 0px;}
</style>
</head>
<body>
	<div class="chatContainer display-none">
		<div class="chatTop">
			<div class="name_container font_noto" id="setName">
				<!-- 이름 동적 생성 -->
			</div>
			<div class="floatRight">
<!-- 				<img src="./resources/images/chat-close.png" class="btnImg close"> -->
			</div>
			<div class="floatRight">
<!-- 				<img src="./resources/images/chat-minus.png" class="btnImg down"> -->
			</div>
		</div>
		<div class="chatMiddle">
			<ul>
				<!-- 동적 생성 -->
			</ul>
		</div>
		<div class="chatBottom">
			<textarea placeholder="메세지를 입력해 주세요."></textarea>
		</div>
	</div>

	<!-- format -->
	<div class="chatMiddle format">
		<ul>
			<li>
				<div class="sender">
					<span></span>
				</div>
				<div class="message">
					<span></span>
				</div>
			</li>
		</ul>
	</div>

	<script>
		let roomId = '${roomId}';

		$(window).on('load', function() {

			$.ajax({
				url : roomId + ".ch",
				data : {
					userId : "${loginUser.userId}"
				},
				async : false,
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						// 채팅 목록 동적 추가
						CheckLR(data[i]);
					}
				}
			});
			// 웹소켓 연결
			connect();
			console.log("enterRoom");
			
			$("#setName").html(roomId + ' 님과의 대화');
		});

		// enter 키 이벤트
		$(document).on('keydown', 'div.chatBottom textarea', function(e) {
			if (e.keyCode == 13 && !e.shiftKey) {
				e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
				const message = $(this).val(); // 현재 입력된 메세지를 담는다.

				let search3 = $('div.chatBottom textarea').val();

				if (search3.replace(/\s|  /gi, "").length == 0) {
					return false;
					$('div.chatBottom textarea').focus();
				}

				sendMessage(message);
				// textarea 비우기
				clearTextarea();
			}
		});
		// 웹소켓
		let websocket;

		//입장 버튼을 눌렀을 때 호출되는 함수
		function connect() {
			// 웹소켓 주소
			var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/chat.ch";
			// 소켓 객체 생성
			websocket = new WebSocket(wsUri);
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
		}

		//웹 소켓에 연결되었을 때 호출될 함수
		function onOpen() {
			// ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가
			const data = {
				"roomId" : roomId,
				"userId" : "${ loginUser.userId }",
				"messageContent" : "ENTER-CHAT"
			};
			let jsonData = JSON.stringify(data);
			websocket.send(jsonData);
		}

		// * 1 메시지 전송
		function sendMessage(message) {

			const data = {
				"roomId" : roomId,
				"userId" : "${ loginUser.userId }",
				"messageContent" : message
			};

			CheckLR(data);

			let jsonData = JSON.stringify(data);

			websocket.send(jsonData);
		}

		// * 2 메세지 수신
		function onMessage(evt) {

			let receive = evt.data.split(",");

			const data = {
				"userId" : receive[0],
				"messageContent" : receive[1]
			};
			console.log(data);
			if (data.userId != "${ loginUser.userId }") {
				CheckLR(data);
			}
		}

		// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
		function CheckLR(data) {
			// email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
			const LR = (data.userId != "${ loginUser.userId }") ? "left" : "right";
			// 메세지 추가
			appendMessageTag(LR, data.userId, data.messageContent);
		}

		// * 3 메세지 태그 append
		function appendMessageTag(LR_className, userId, message) {

			const chatLi = createMessageTag(LR_className, userId, message);

			$('div.chatMiddle:not(.format) ul').append(chatLi);

			// 스크롤바 아래 고정
			$('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
		}

		// * 4 메세지 태그 생성
		function createMessageTag(LR_className, userId, message) {

			// 형식 가져오기
			let chatLi = $('div.chatMiddle.format ul li').clone();

			chatLi.addClass(LR_className); // left : right 클래스 추가
			// find() : chatLi의 하위 요소 찾기
			chatLi.find('.sender span').text(userId); // 이름 추가
			chatLi.find('.message span').text(message); // 메세지 추가

			return chatLi;
		};

		// * 5 - 채팅창 비우기
		function clearTextarea() {
			$('div.chatBottom textarea').val('');
			return false;
		};
	</script>
</body>
</html>