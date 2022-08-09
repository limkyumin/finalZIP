package com.kh.zip.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.inquiry.model.dao.Inquirydao;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.inquiry.model.vo.Reply;

@Service
public class Inquiryserviceimpl implements Inquiryservice{
	
	@Autowired
	private Inquirydao inquirydao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount1(int userNo) {
		
		return inquirydao.selectListCount1(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Inquiry> selectAll1(userPageInfo pi, int userNo) {
		
		return inquirydao.selectAll1(sqlSession, pi, userNo);
	}
	
	@Override
	public int selectListCount2() {
		
		return inquirydao.selectListCount2(sqlSession);
	}
	
	@Override
	public ArrayList<Inquiry> selectAll2(userPageInfo pi) {
		
		return inquirydao.selectAll2(sqlSession, pi);
	}
	
	@Override
	public int insertInquiry(Inquiry i) {
		
		return inquirydao.insertInquiry(sqlSession, i);
	}
	
	@Override
	public Inquiry inquiryDetail(int inquiryNo) {
		
		return inquirydao.inquiryDetail(sqlSession, inquiryNo);
	}
	
	@Override
	public ArrayList<Reply> selectReply(int refIno) {
		
		return inquirydao.selectReply(sqlSession, refIno);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		
		return inquirydao.updateInquiry(sqlSession, i);
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		
		return inquirydao.deleteInquiry(sqlSession, inquiryNo);
	}

	@Override
	public int insertReply(Reply r) {
		
		return inquirydao.insertReply(sqlSession, r);
	}

	@Override
	public void updateAnswerStatus(int inquiryNo) {
		
		inquirydao.updateAnswerStatus(sqlSession, inquiryNo);
	}
	
	@Override
	public ArrayList<Inquiry> inquiry(int userNo) {
		
		return inquirydao.inquiry(sqlSession, userNo);
	}
}