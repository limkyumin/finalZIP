package com.kh.zip.userinfo.model.service;

import com.kh.zip.userinfo.model.vo.Naver;
import com.kh.zip.userinfo.model.vo.Userinfo;

public interface Userinfoservice {

	//로그인
	Userinfo loginuser(Userinfo u);
	
	//회원가입
	int insertuser(Userinfo u);
	
	//회원정보 수정 - 이름
	int updateusername(Userinfo u);
	
	//회원정보 수정 - 전화번호
	int updateuserphone(Userinfo u);
		
	//회원정보 수정 - 이메일
	int updateuseremail(Userinfo u);
	
	//회원정보 수정 - 비밀번호
	int updateuserpwd(Userinfo u);
	
	//회원탈퇴
	int deleteuser(String userId);
	
	//아이디 중복체크
	int idCheck(String userId);
	
	//이메일 중복체크
	int mailCheck(String userId);

	//아이디 찾기
	String idsearch(Userinfo u);
	
	//비밀번호 찾기
	String pwsearch(Userinfo u);

	//네이버 로그인
	Naver naverlogin(Naver naver);

	//네이버 정보 담기
	int naverinsert(Naver naver);

}
