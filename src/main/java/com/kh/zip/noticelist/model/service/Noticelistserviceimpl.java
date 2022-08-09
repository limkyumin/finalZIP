package com.kh.zip.noticelist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.noticelist.model.dao.Noticelistdao;
import com.kh.zip.noticelist.model.vo.Noticelist;

@Service
public class Noticelistserviceimpl implements Noticelistservice {
	
	
	@Autowired
	private Noticelistdao noticelistdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return noticelistdao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Noticelist> selectAll(userPageInfo pi) {
		
		return noticelistdao.selectAll(sqlSession, pi);
	}
	
	@Override
	public int increaseCount(int noticeNo) {
		
		return noticelistdao.increaseCount(sqlSession, noticeNo);
	}
	
	@Override
	public int insertNoticelist(Noticelist n) {
		
		return noticelistdao.insertNoticelist(sqlSession, n);
	}

	@Override
	public Noticelist noticelistDetail(int noticeNo) {
		
		return noticelistdao.noticelistDetail(sqlSession, noticeNo);
	}

	@Override
	public int updateNoticelist(Noticelist n) {
		
		return noticelistdao.updateNoticelist(sqlSession, n);
	}

	@Override
	public int deleteNoticelist(int noticeNo) {
		
		return noticelistdao.deleteNoticelist(sqlSession, noticeNo);
	}

	@Override
	public int selectSearchList(HashMap<String, String> map) {
		
		return noticelistdao.selectSearchList(sqlSession, map);
	}

	@Override
	public ArrayList<Noticelist> selectSearchList2(HashMap<String, String> map, userPageInfo pi) {
		
		return noticelistdao.selectSearchList2(sqlSession, map, pi);
	}
}