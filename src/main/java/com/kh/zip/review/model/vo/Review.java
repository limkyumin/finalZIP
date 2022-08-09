package com.kh.zip.review.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int reviewWriter;
	private String status;
	private String thumbnail;
	private String userId;
	private int rNum;
	private int rownum;
}