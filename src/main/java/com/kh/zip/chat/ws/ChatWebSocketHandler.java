package com.kh.zip.chat.ws;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.zip.chat.model.service.Chatservice;
import com.kh.zip.chat.model.vo.Chatmessage;
import com.kh.zip.chat.model.vo.Chatroom;

@Controller
public class ChatWebSocketHandler extends TextWebSocketHandler implements InitializingBean {
	
	@Autowired
	Chatservice chatservice;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	// 채팅방 목록<방번호, ArrayList<Session>>이 들어감
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	
	// Session, 방번호 들어감
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	
	
	private static int i;
	
	// WebSocket 연결에 성공했을 때
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        i++;
        System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
    }
	
	// WebSocket 연결 종료했을 때
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        i--;
        System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
        sessionList.remove(session);
        // sessionList에 session이 있다면
        if(sessionList.get(session) != null) {

        }
    }
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 전달받은 메세지
        String msg = message.getPayload();
        // Json객체 → Java객체
        Chatmessage chatmessage =  objectMapper.readValue(msg, Chatmessage.class);
        // 받은 메세지에 담긴 roomId로 해당 채팅방을 찾아옴
        Chatroom chatroom = chatservice.selectChatRoom(chatmessage);
        String roomId = chatservice.selectChatRoomId(chatmessage);
        // 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔는데 DB에 채팅방이 있을 때
        // 채팅방 생성
        if(RoomList.get(roomId) == null && chatmessage.getMessageContent().equals("ENTER-CHAT") && chatroom != null) {
        	
        	// 채팅방에 들어갈 session들
        	ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
        	
        	// session 추가
        	sessionTwo.add(session);
        	
        	// sessionList에 추가
        	sessionList.put(session, chatroom.getUserId());
        	
        	// RoomList에 추가
        	RoomList.put(roomId, sessionTwo);
        	
        	System.out.println("채팅방 생성");
        }
        
        // 채팅방이 존재할 때
        else if(RoomList.get(roomId) != null && chatmessage.getMessageContent().equals("ENTER-CHAT") && chatroom != null) {
        	
        	// RoomList에서 해당 방번호를 가진 방이 있는지 확인
        	RoomList.get(roomId).add(session);
        	
        	// sessionList에 추가
        	sessionList.put(session, chatroom.getUserId());
        	
        	System.out.println("생성된 채팅방으로 입장");
        }
        
        // 채팅 메세지 입력 시
        else if(RoomList.get(roomId) != null && !chatmessage.getMessageContent().equals("ENTER-CHAT") && chatroom != null) {
        	
        	// 메세지에 아이디 담기
        	TextMessage textmessage = new TextMessage(chatmessage.getUserId() + "," + chatmessage.getMessageContent());
        	// 현재 session 수
        	int sessionCount = 1;
        	
        	// 해당 채팅방의 session에 뿌려주기
//        	for(WebSocketSession sess : RoomList.get(roomId)) {
//        		sess.sendMessage(textmessage);
//        		sessionCount++;
//        	}
        	
        	if(i == 1) {
        		((WebSocketSession)RoomList.get(roomId).get(0)).sendMessage(textmessage);
        	}
        	else {
        		((WebSocketSession)RoomList.get(roomId).get(0)).sendMessage(textmessage);
            	((WebSocketSession)RoomList.get(roomId).get(1)).sendMessage(textmessage);
        	}
        	
        	// sessionCount 저장
        	// sessionCount가 1일 때 unReadCount = 0
        	// sessionCount가 2일 때 unReadCount = 1
        	chatmessage.setSessionCount(sessionCount);
        	
        	// DB에 저장
        	int a = chatservice.insertMessage(chatmessage);
        	
        	if(a == 1) {
        		System.out.println("메세지 전송 및 DB 저장 성공");
        	}
        	else {
        		System.out.println("메세지 전송 및 DB 저장 실패");
        	}
        }
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
	}
}