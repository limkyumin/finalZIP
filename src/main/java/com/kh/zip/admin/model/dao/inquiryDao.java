package com.kh.zip.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.admin.model.vo.userInquiry;
import com.kh.zip.common.model.vo.userPageInfo;

@Repository
public class inquiryDao {

	public int inquiryListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminInquiryMapper.inquiryListCount");
	}

	public ArrayList<userInquiry> selectInquiryList(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminInquiryMapper.selectInquiryList", null, rowBounds);
	}

	public int inquiryMsg(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminInquiryMapper.inquiryMsg");
	}

//	public ArrayList<userInquiry> mainInquiryList(SqlSessionTemplate sqlSession) {
//		
//		return (ArrayList)sqlSession.selectList("adminInquiryMapper.mainInquiryList");
//	}

	public ArrayList<userInquiry> mainInquiryList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return (ArrayList)sqlSession.selectList("adminInquiryMapper.mainInquiryList", map);
	}
	


}
