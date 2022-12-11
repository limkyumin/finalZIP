package com.kh.zip.chat.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.chat.model.dao.Chatdao;
import com.kh.zip.chat.model.vo.Chatmessage;
import com.kh.zip.chat.model.vo.Chatroom;

@Service
public class Chatserviceimpl implements Chatservice {
	
	@Autowired
	private Chatdao chatdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Chatroom selectChatroom(Chatroom chatroom) {
		
		return chatdao.selectChatroom(sqlSession, chatroom);
	}
	
	@Override
	public Chatroom selectChatRoom(Chatmessage chatmessage) {
		
		return chatdao.selectChatRoom(sqlSession, chatmessage);
	}
	
	@Override
	public String selectChatRoomId(Chatmessage chatmessage) {
		
		return chatdao.selectChatRoomId(sqlSession, chatmessage);
	}
	
	@Override
	public int insertMessage(Chatmessage chatMessage) {
		
		return chatdao.insertMessage(sqlSession, chatMessage);
	}

	@Override
	public List<Chatmessage> messageList(Chatmessage chatmessage) {
		
		return chatdao.messageList(sqlSession, chatmessage);
	}

	@Override
	public int createChat(Chatroom room) {
		
		return chatdao.createChat(sqlSession, room);
	}

	@Override
	public Chatroom searchChatRoom(Chatroom room) {
		
		return chatdao.searchChatRoom(sqlSession, room);
	}

	@Override
	public List<Chatroom> chatRoomList(String userId) {
		
		return chatdao.chatRoomList(sqlSession, userId);
	}

	@Override
	public int selectUnReadCount(Chatmessage message) {
		
		return chatdao.selectUnReadCount(sqlSession, message);
	}

	@Override
	public int updateCount(Chatmessage message) {
		
		return chatdao.updateCount(sqlSession, message);
	}
}