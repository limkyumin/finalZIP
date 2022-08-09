package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.zip.admin.model.vo.userInfo;
import com.kh.zip.common.model.vo.userPageInfo;

public interface userService {
	
	//회원 정보띄우기
	ArrayList<userInfo> selectUserList(userPageInfo pi);
	
	//회원 정보띄우기(페이징처리)
	int selectListCountAdmin();
	
	//회원 정보수정하기
	int memberStatus(userInfo u);

	
	//검색결과 개수조회
	int selectSearchCount(HashMap<String, String> map);

	//회원(아이디,닉네임,회원상태) 검색
	ArrayList<userInfo> selectUserList2(HashMap<String, String> map, userPageInfo pi);

	
	// 메인페이지에 띄워줄것들 금일 회원현황
	int selectYmemberCnt();

	int selectSmemberCnt();

	int selectQmemberCnt();
	// 이번달 회원현황
	int selectYmemberMonthCnt();

	int selectSmemberMonthCnt();

	int selectQmemberMonthCnt();
	
	int selectListCountYmember();
	
	ArrayList<userInfo> selectUserListYmember(userPageInfo pi);
	
	int selectSearchCountYmember(HashMap<String, String> map);
	
	ArrayList<userInfo> selectUserListYmember2(HashMap<String, String> map, userPageInfo pi);
}
