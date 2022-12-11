package com.kh.zip.userinfo.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.userinfo.model.vo.Naver;
import com.kh.zip.userinfo.model.vo.Userinfo;

@Repository
public class Userinfodao {

	public Userinfo loginuser(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.selectOne("userinfoMapper.loginuser",u);
	}

	public int insertuser(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.insert("userinfoMapper.insertuser",u);
	}

	public int updateusername(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.update("userinfoMapper.updateusername",u);
	}
	
	public int updateuserphone(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.update("userinfoMapper.updateuserphone",u);
	}
	
	public int updateuseremail(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.update("userinfoMapper.updateuseremail",u);
	}
	
	public int updateuserpwd(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.update("userinfoMapper.updateuserpwd",u);
	}

	public int deleteuser(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("userinfoMapper.deleteuser",userId);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("userinfoMapper.idCheck",userId);
	}

	public int mailCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("userinfoMapper.mailCheck",userId);
	}

	public String idsearch(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.selectOne("userinfoMapper.idsearch",u);
	}
	
	public String pwsearch(SqlSessionTemplate sqlSession, Userinfo u) {
		return sqlSession.selectOne("userinfoMapper.pwsearch",u);
	}

	public Naver naverlogin(SqlSessionTemplate sqlSession, Naver naver) {
		return sqlSession.selectOne("naverMapper.naverlogin",naver);
	}

	public int naverinsert(SqlSessionTemplate sqlSession, Naver naver) {
		return sqlSession.insert("naverMapper.naverinsert",naver);
	}

}
