package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.admin.model.dao.inquiryDao;
import com.kh.zip.admin.model.vo.userInquiry;
import com.kh.zip.common.model.vo.userPageInfo;

@Service
public class userInquiryServiceImpl implements userInquiryService {

	@Autowired
	private inquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int inquiryListCount() {
		
		return inquiryDao.inquiryListCount(sqlSession);
	}

	@Override
	public ArrayList<userInquiry> selectInquiryList(userPageInfo pi) {
		
		return inquiryDao.selectInquiryList(sqlSession,pi);
	}

	@Override
	public int inquiryMsg() {
	
		return inquiryDao.inquiryMsg(sqlSession);
	}



//	@Override
//	public ArrayList<userInquiry> mainInquiryList() {
//
//		return inquiryDao.mainInquiryList(sqlSession);
//	}
	
	
	@Override
	public ArrayList<userInquiry> mainInquiryList(HashMap<String, Integer> map) {
		
		return inquiryDao.mainInquiryList(sqlSession, map);
	}
	
}
