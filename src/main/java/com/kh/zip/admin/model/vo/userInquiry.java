package com.kh.zip.admin.model.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class userInquiry {

	private int inquiryNo;	//문의번호
	private int userNo;	//회원번호
	private String reportId;	//신고대상자 id
	private String inquiryTitle;	//문의제목
	private String inquiryContent;	//문의내용
	private Date inquiryDate;	//문의작성일
	private String inquiryStatus; //문의 글상태
	private String originName;	//파일원본명
	private String changeName;	//파일수정명
	private String userId;	// 유저아이디 (조인)
	private String userStatus; // 유저상태도 조인해야함.
	private String answerStatus;
}
