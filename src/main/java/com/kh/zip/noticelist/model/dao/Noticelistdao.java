package com.kh.zip.noticelist.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.noticelist.model.vo.Noticelist;

@Repository
public class Noticelistdao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticelistMapper.selectListCount");
	}

	public ArrayList<Noticelist> selectAll(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("noticelistMapper.selectAll", null, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticelistMapper.increaseCount", noticeNo);
	}
	
	public int insertNoticelist(SqlSessionTemplate sqlSession, Noticelist n) {
		
		return sqlSession.insert("noticelistMapper.insertNoticelist", n);
	}
	
	public Noticelist noticelistDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticelistMapper.noticelistDetail", noticeNo);
	}

	public int updateNoticelist(SqlSessionTemplate sqlSession, Noticelist n) {
		
		return sqlSession.update("noticelistMapper.updateNoticelist", n);
	}

	public int deleteNoticelist(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticelistMapper.deleteNoticelist", noticeNo);
	}

	public int selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("noticelistMapper.selectSearchList", map);
	}

	public ArrayList<Noticelist> selectSearchList2(SqlSessionTemplate sqlSession, HashMap<String, String> map, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("noticelistMapper.selectSearchList2", map, rowBounds);
	}
}