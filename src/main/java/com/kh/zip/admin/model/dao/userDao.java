package com.kh.zip.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.admin.model.vo.userInfo;
import com.kh.zip.common.model.vo.userPageInfo;

@Repository
public class userDao {
	
	
	//유저명단 띄우기
	public ArrayList<userInfo> selectUserList(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserList", null, rowBounds);
	}

	//유저 상태 수정하기
	public int memberStatus(SqlSessionTemplate sqlSession, userInfo u) {
		
		return sqlSession.update("adminMapper.memberStatus",u);
	}
	
	//유저 명단 페이징처리
	public int selectListCountAdmin(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectListCount");
	}

	//유저 검색

	public ArrayList<userInfo> selectUserList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			userPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserList", null, rowBounds);
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.selectOne("adminMapper.selectSearchCount",map);
	}

	//유저 검색에대한 페이징 처리
	public ArrayList<userInfo> selectUserList2(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserList2", map, rowBounds);
	}

	public int selectYmemberCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectYmemberCnt");
	}

	public int selectSmemberCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectSmemberCnt");
	}

	public int selectQmemberCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectQmemberCnt");
	}

	public int selectYmemberMonthCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectYmemberMonthCnt");
	}

	public int selectSmemberMonthCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectSmemberMonthCnt");
	}

	public int selectQmemberMonthCnt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectQmemberMonthCnt");
	}

	public int selectListCountYmember(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectListCountYmember");
	}

	public ArrayList<userInfo> selectUserListYmember(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserListYmember", null, rowBounds);
	}

	public int selectSearchYmember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("adminMapper.selectSearchYmember",map);
	}

	public ArrayList<userInfo> selectUserListYmember2(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserListYmember2", map, rowBounds);
	}
}