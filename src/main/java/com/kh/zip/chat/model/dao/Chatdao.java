package com.kh.zip.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.chat.model.vo.Chatmessage;
import com.kh.zip.chat.model.vo.Chatroom;

@Repository
public class Chatdao {
	
	public Chatroom selectChatroom(SqlSessionTemplate sqlSession, Chatroom chatroom) {
		
		return sqlSession.selectOne("chatMapper.selectChatroom", chatroom);
	}
	
	public Chatroom selectChatRoom(SqlSessionTemplate sqlSession, Chatmessage chatmessage) {
		
		return sqlSession.selectOne("chatMapper.selectChatRoom", chatmessage);
	}
	
	public String selectChatRoomId(SqlSessionTemplate sqlSession, Chatmessage chatmessage) {
		
		return sqlSession.selectOne("chatMapper.selectChatRoomId", chatmessage);
	}
	
	public int insertMessage(SqlSessionTemplate sqlSession, Chatmessage chatMessage) {
		
		return sqlSession.insert("chatMapper.insertMessage", chatMessage);
	}

	public List<Chatmessage> messageList(SqlSessionTemplate sqlSession, Chatmessage chatmessage) {
		
		return sqlSession.selectList("chatMapper.messageList", chatmessage);
	}

	public int createChat(SqlSessionTemplate sqlSession, Chatroom room) {
		
		return sqlSession.insert("chatMapper.createChat", room);
	}

	public Chatroom searchChatRoom(SqlSessionTemplate sqlSession, Chatroom room) {
		
		return (Chatroom)sqlSession.selectOne("chatMapper.searchChatRoom", room);
	}

	public List<Chatroom> chatRoomList(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectList("chatMapper.chatRoomList", userId);
	}

	public int selectUnReadCount(SqlSessionTemplate sqlSession, Chatmessage message) {
		
		return sqlSession.selectOne("chatMapper.selectUnreadCount", message);
	}

	public int updateCount(SqlSessionTemplate sqlSession, Chatmessage message) {
		
		return sqlSession.update("chatMapper.updateCount", message);
	}
}