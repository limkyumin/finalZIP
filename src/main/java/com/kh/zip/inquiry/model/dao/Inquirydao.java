package com.kh.zip.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.inquiry.model.vo.Reply;

@Repository
public class Inquirydao {
	
	public int selectListCount1(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount1", userNo);
	}
	
	public ArrayList<Inquiry> selectAll1(SqlSessionTemplate sqlSession, userPageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectAll1", userNo, rowBounds);
	}
	
	public int selectListCount2(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount2");
	}
	
	public ArrayList<Inquiry> selectAll2(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectAll2", null, rowBounds);
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.insert("inquiryMapper.insertInquiry", i);
	}
	
	public Inquiry inquiryDetail(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.selectOne("inquiryMapper.inquiryDetail", inquiryNo);
	}
	
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int refIno) {
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectReply", refIno);
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		
		return sqlSession.update("inquiryMapper.updateInquiry", i);
	}

	public int deleteInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.update("inquiryMapper.deleteInquiry", inquiryNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("inquiryMapper.insertReply", r);
	}

	public int updateAnswerStatus(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.update("inquiryMapper.updateAnswerStatus", inquiryNo);
	}
	
	public ArrayList<Inquiry> inquiry(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.inquiry", userNo);
	}
}