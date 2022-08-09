package com.kh.zip.chat.model.service;

import java.util.List;

import com.kh.zip.chat.model.vo.Chatmessage;
import com.kh.zip.chat.model.vo.Chatroom;

public interface Chatservice {
	
	/**
     * 방 번호를 선택하는 메소드
     * @param roomId
     * @return
     */
	Chatroom selectChatroom(Chatroom chatroom);
	
    Chatroom selectChatRoom(Chatmessage chatmessage);
    /**
     * 채팅 메세지 DB 저장
     * @param chatMessage
     * @return 
     */
    
    String selectChatRoomId(Chatmessage chatmessage);
    
    int insertMessage(Chatmessage chatMessage);
 
    /**
     * 메세지 내용 리스트 출력
     * @param roomId
     * @return
     */
    List<Chatmessage> messageList(Chatmessage chatmessage);
 
    /**
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(Chatroom room);
 
    /**
     * DB에 채팅 방이 있는지 확인
     * @param room
     * @return
     */
    Chatroom searchChatRoom(Chatroom room);
 
    /**
     * 채팅 방 리스트 출력
     * @param userEmail
     * @return
     */
    List<Chatroom> chatRoomList(String userId);
 
    /**
     * 채팅 읽지 않은 메세지 수 출력
     * @param message
     * @return
     */
    int selectUnReadCount(Chatmessage message);
 
    /**
     * 읽은 메세지 숫자 0으로 바꾸기
     * @param message
     * @return
     */
    int updateCount(Chatmessage message);
}