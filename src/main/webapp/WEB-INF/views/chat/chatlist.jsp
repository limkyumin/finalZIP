<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/images/zip3.png">
<meta charset="UTF-8">
<title>Z.I.P | 채팅 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
.iconImg{position:fixed; top:90%; left:85%;}
.iconImg:hover{cursor: pointer; width: 68px; height: 68px;}
.chatTop {width: 460px; height: 45px; display: inline-block; padding-top: 10px;}
.name_container{float: left; padding-top: 5px;}
.display-none {display: none;}
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
	<div class="chatIcon font_jua">
		<img src="./resources/images/chat-icon.png" class="iconImg">
	</div>

	<script>
		$(document).on("click", ".chatIcon", function() { // 채팅 Icon 클릭 시,
			if ($('.chatContainer').hasClass("display-none")) { // if ) 채팅방이 열려있지 않을 때,
				$('.chatListContainer').toggleClass('display-none'); // 리스트를 연다.
				
			} else { // else ) 채팅방이 열려있다면,
				$('.chatContainer').toggleClass('display-none'); // 채팅방을 닫는다.
			}

			if (!$('.chatListContainer').hasClass('display-none')) { // 채팅 리스트가 닫혀 있을 때
				getRoomList(); // 채팅 방 목록을 불러온다.
			}
		});

		$(document).on("click", "img.close", function() { // X 버튼 클릭 시,
			$('.chatContainer').toggleClass('display-none'); // 채팅방을 닫는다.
		});

		$(document).on("click", "img.down", function() { // - 버튼 클릭 시,
			$('.chatContainer').toggleClass('display-none'); // 채팅방을 닫고,
			$('.chatListContainer').toggleClass('display-none'); // 리스트를 연다.
		});
	</script>

	<div class="chatContainer display-none">
		<div class="chatTop">
			<div class="name_container font_noto" id="setName">
				<!-- 이름 동적 생성 -->
			</div>
			<div class="floatRight">
				<img src="./resources/images/chat-close.png" class="btnImg close">
			</div>
			<div class="floatRight">
				<img src="./resources/images/chat-minus.png" class="btnImg down">
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

	<div class="chatListContainer">
		<div class="chatTop">
			<div style="padding: 0px; margin-left: 0px; font-size: 18px; font-weight: bold; text-align: center;">나의 채팅리스트</div>
		</div>
		<div class="chatList"></div>
	</div>

	<script>
		let countAll = 0;

		function getRoomList() {

			$.ajax({
				url : "chatRoomList.ch",
				data : {
					userId : "${loginUser.userId}"
				},
				dataType : "json",
				async : false,
				success : function(data) {
					let loginList = "";

					$.ajax({
						url : "chatSession.ch",
						data : {},
						async : false,
						dataType : "json",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								loginList += data[i];
							}
						}
					});
					$chatWrap = $(".chatList");
					$chatWrap.html("");

					var $div;
					var $divs;
					var $span;

					if (data.length > 0) {
						countAll = 0;

						for ( var i in data) {

							if (data[i].userId == "${loginUser.userId}") {

								if (loginList.indexOf(data[i].masterId) != -1) {
									$div = $("<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].masterId);
								} else {
									$div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].masterId);
								}
								$divs = $("<div class='userId'>").text(data[i].masterId);
							} else {
								if (loginList.indexOf(data[i].userId) != -1) {
									$div = $("<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].roomId).attr("id", data[i].userId);
								} else {
									$div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].roomId).attr("id", data[i].userId);
								}
								$divs = $("<div class='userId'>").text(data[i].userId);
							}

							if (data[i].unReadCount != 0) {
								$span = $("<span class='notRead'>").text(data[i].unReadCount);
							} else {
								$span = $("<span>");
							}
							$div.append($divs);
							$div.append($span);

							$chatWrap.append($div);

							countAll += parseInt(data[i].unReadCount);
						}
					} else {
						$chatWrap.html("채팅 목록이 없습니다.");
					}
				}
			});
		}

		$(window).on('load', function() {

			getRoomList();
		});
	</script>

	<!-- 채팅 방 관련 -->
	<script>
		let roomId;
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

		// 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
		function enterRoom(obj) {
			// 현재 html에 추가되었던 동적 태그 전부 지우기
			$('div.chatMiddle:not(.format) ul').html("");
			// obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
			roomId = obj.getAttribute("id");
			// 해당 채팅 방의 메세지 목록 불러오기
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
		}

		// 채팅 방 열어주기
		$(document).on("click", ".enterRoomList", function() {
			$(".chatContainer").toggleClass("display-none");
			$(this).parent().parent().toggleClass("display-none");
			// 이름 추가
			$("#setName").html($(this).children('div').html() + ' 님과의 대화');
			// 사진 추가
			$("#setPic").attr("src", $(this).children('img').attr('src'));
			// 스크롤바 아래 고정
			$('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
			// 로그인 상태 일 때 
			if ($(this).hasClass('chatList_box')) {
				// 점 표시
				$('#loginOn').addClass('profile_img_Container');
			}
			// 로그아웃 상태 일 때
			else {
				// 점 빼기
				$('#loginOn').removeClass('profile_img_Container');
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

			if (data.userId != "${ loginUser.userId }") {
				CheckLR(data);
			}
		}

		// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
		function CheckLR(data) {
			// userId가 loginSession의 userId와 다르면 왼쪽, 같으면 오른쪽
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