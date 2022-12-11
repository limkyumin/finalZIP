package com.kh.zip.chat.model.vo;

import lombok.Data;

@Data
public class Chatroom {
	
	private String roomId;
	private String userId;
	private String masterId;
	private int unReadCount;
}