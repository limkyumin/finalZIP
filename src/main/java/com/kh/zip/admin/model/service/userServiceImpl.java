package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.admin.model.dao.userDao;
import com.kh.zip.admin.model.vo.userInfo;
import com.kh.zip.common.model.vo.userPageInfo;

@Service
public class userServiceImpl implements userService {

	@Autowired
	private userDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//유저명단 띄우기
	@Override
	public ArrayList<userInfo> selectUserList(userPageInfo pi) {
		
		return userDao.selectUserList(sqlSession,pi);
	}

	//유저상태 수정
	@Override
	public int memberStatus(userInfo u) {

		//int result = userDao.memberStatus(sqlSession,u);
		
		return userDao.memberStatus(sqlSession,u);
	}
	
	//유저명단 페이징처리
	@Override
	public int selectListCountAdmin() {
		
		return userDao.selectListCountAdmin(sqlSession);
	}



	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return userDao.selectSearchCount(sqlSession,map);
	}

	@Override
	public ArrayList<userInfo> selectUserList2(HashMap<String, String> map, userPageInfo pi) {
	
		return userDao.selectUserList2(sqlSession, map, pi);
	}

	@Override
	public int selectYmemberCnt() {
		return userDao.selectYmemberCnt(sqlSession);
	}

	@Override
	public int selectSmemberCnt() {
		return userDao.selectSmemberCnt(sqlSession);
	}

	@Override
	public int selectQmemberCnt() {
		return userDao.selectQmemberCnt(sqlSession);
	}

	@Override
	public int selectYmemberMonthCnt() {
		
		return userDao.selectYmemberMonthCnt(sqlSession);
	}

	@Override
	public int selectSmemberMonthCnt() {
		
		return userDao.selectSmemberMonthCnt(sqlSession);
	}

	@Override
	public int selectQmemberMonthCnt() {
		
		return userDao.selectQmemberMonthCnt(sqlSession);
	}

	@Override
	public int selectListCountYmember() {
		
		return userDao.selectListCountYmember(sqlSession);
	}

	@Override
	public ArrayList<userInfo> selectUserListYmember(userPageInfo pi) {
		
		return userDao.selectUserListYmember(sqlSession, pi);
	}

	@Override
	public int selectSearchCountYmember(HashMap<String, String> map) {
		
		return userDao.selectSearchYmember(sqlSession, map);
	}

	@Override
	public ArrayList<userInfo> selectUserListYmember2(HashMap<String, String> map, userPageInfo pi) {
		
		return userDao.selectUserListYmember2(sqlSession, map, pi);
	}
}