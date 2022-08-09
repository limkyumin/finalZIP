package com.kh.zip.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.zip.chat.model.service.Chatservice;
import com.kh.zip.chat.model.vo.Chatmessage;
import com.kh.zip.chat.model.vo.Chatroom;
import com.kh.zip.chat.model.vo.Chatsession;

@Controller
public class Chatcontroller {
	
	@Autowired
	Chatservice chatservice;
	
	@Autowired
	private Chatsession cSession;
	
	@RequestMapping("chatlist.ch")
	public String chatlist() {
		
		return "chat/chatlist";
	}
	
	// 해당 채팅방의 채팅 메세지 불러오기
	@RequestMapping("{roomId}.ch")
	public void messageList(@PathVariable String roomId, String userId, Model model, HttpServletResponse response) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		// 읽은 메세지의 숫자를 0으로 바꾸기
		Chatmessage message = new Chatmessage();
		message.setUserId(userId);
		message.setRoomId(roomId);
		List<Chatmessage> mList = chatservice.messageList(message);
		chatservice.updateCount(message);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mList, response.getWriter());
	}
	
	// 채팅방이 없을 때 생성하기
	@RequestMapping("createChat.ch")
	public String createChat(String userId2, String masterId, HttpSession session, Model model) {
		
		Chatroom room = new Chatroom();
		room.setUserId(userId2);
		room.setMasterId(masterId);
		
		int result = chatservice.createChat(room);
		
		if(result > 0) {
			System.out.println("방 만들기 완료");
		}
		model.addAttribute("roomId", masterId);
		return "chat/chatmessage";
	}
	
	// 채팅방 목록 불러오기
	@ResponseBody
	@RequestMapping("chatRoomList.ch")
	public void createChat(Chatroom room, Chatmessage message, String userId, HttpServletResponse response) throws JsonIOException, IOException {
		
		List<Chatroom> cList = chatservice.chatRoomList(userId);
		
		for(int i = 0; i < cList.size(); i++) {
			
			message.setRoomId(cList.get(i).getRoomId());
			message.setUserId(userId);
			
			int count = chatservice.selectUnReadCount(message);
			
			cList.get(i).setUnReadCount(count);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(cList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("chatSession.ch")
	public void chatSession(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<String> chatSessionList = cSession.getLoginUser();
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(chatSessionList, response.getWriter());
	}
};