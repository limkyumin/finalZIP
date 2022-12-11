package com.kh.zip.userinfo.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.userinfo.model.dao.Userinfodao;
import com.kh.zip.userinfo.model.vo.Naver;
import com.kh.zip.userinfo.model.vo.Userinfo;

@Service
public class Userinfoserviceimpl implements Userinfoservice{
	
	@Autowired
	private Userinfodao userinfodao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Userinfo loginuser(Userinfo u) {
		
		Userinfo loginUser = userinfodao.loginuser(sqlSession,u);

		return loginUser;
	}

	@Override
	public int insertuser(Userinfo u) {
		
		int result = userinfodao.insertuser(sqlSession,u);
		
		return result;
	}

	@Override
	public int updateusername(Userinfo u) {
		
		int result = userinfodao.updateusername(sqlSession,u);
		
		return result;
	}
	
	@Override
	public int updateuserphone(Userinfo u) {

		int result = userinfodao.updateuserphone(sqlSession,u);

		return result;
	}
	
	@Override
	public int updateuseremail(Userinfo u) {
		
		int result = userinfodao.updateuseremail(sqlSession,u);
		
		return result;
	}
	
	@Override
	public int updateuserpwd(Userinfo u) {
		
		int result = userinfodao.updateuserpwd(sqlSession,u);
		
		return result;
	}


	@Override
	public int deleteuser(String userId) {
		
		int result = userinfodao.deleteuser(sqlSession,userId);
		
		return result;
	}

	@Override
	public int idCheck(String userId) {
		
		return userinfodao.idCheck(sqlSession,userId);
	}

	@Override
	public int mailCheck(String userId) {
		
		return userinfodao.mailCheck(sqlSession,userId);
	}

	@Override
	public String idsearch(Userinfo u) {
		
		return userinfodao.idsearch(sqlSession,u);
	}

	@Override
	public String pwsearch(Userinfo u) {
		
		return userinfodao.pwsearch(sqlSession,u);
	}

	@Override
	public Naver naverlogin(Naver naver) {
		
		return userinfodao.naverlogin(sqlSession,naver);
	}

	@Override
	public int naverinsert(Naver naver) {
		
		return userinfodao.naverinsert(sqlSession,naver);
	}

}
