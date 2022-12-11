package com.kh.zip.noticelist.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Noticelist {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeWriter;
	private int noticeView;
	private String status;
}