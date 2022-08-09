package com.kh.zip.inquiry.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Inquiry {
	
	private int inquiryNo;
	private int userNo;
	private String reportId;
	private String inquiryTitle;
	private String inquiryContent;
	private Date inquiryDate;
	private String inquiryStatus;
	private String answerStatus;
	private String originName;
	private String changeName;
	private String userId;
	private int rownum;
}