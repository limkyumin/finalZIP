package com.kh.zip.inquiry.model.service;

import java.util.ArrayList;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.inquiry.model.vo.Reply;

public interface Inquiryservice {
	
	int selectListCount1(int userNo);
	
	int selectListCount2();
	
	ArrayList<Inquiry> selectAll1(userPageInfo pi, int userNo);
	
	ArrayList<Inquiry> selectAll2(userPageInfo pi);
	
	int insertInquiry(Inquiry i);
	
	Inquiry inquiryDetail(int inquiryNo);
	
	ArrayList<Reply> selectReply(int refIno);
	
	int updateInquiry(Inquiry i);
	
	int deleteInquiry(int inquiryNo);
	
	int insertReply(Reply r);
	
	void updateAnswerStatus(int inquiryNo);
	
	ArrayList<Inquiry> inquiry(int userNo);
	
}