package com.kh.zip.inquiry.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int replyNo;
	private int refIno;
	private String replyContent;
	private Date replyDate;
	private String replyStatus;
}