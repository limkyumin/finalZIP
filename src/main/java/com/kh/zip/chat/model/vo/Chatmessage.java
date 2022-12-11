package com.kh.zip.chat.model.vo;

import lombok.Data;

@Data
public class Chatmessage {
	
	private String roomId;
	private String messageId;
	private String messageContent;
	private String userId;
	private int unReadCount;
	private int sessionCount;
}