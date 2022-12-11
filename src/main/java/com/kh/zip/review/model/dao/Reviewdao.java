package com.kh.zip.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.review.model.vo.Review;

@Repository
public class Reviewdao {

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.insert("reviewMapper.insertReview", r);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	public ArrayList<Review> selectAll(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAll", null, rowBounds);
	}

	public Review reviewDetail(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.selectOne("reviewMapper.reviewDetail", reviewNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.updateReview", r);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}

	public ArrayList<Review> selectTopList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectTopList");
	}

	public ArrayList<Review> review(SqlSessionTemplate sqlSession, int userNo) {
			
			return (ArrayList)sqlSession.selectList("reviewMapper.review", userNo);
	}
}