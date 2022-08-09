package com.kh.zip.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.review.model.dao.Reviewdao;
import com.kh.zip.review.model.vo.Review;

@Service
public class Reviewserviceimpl implements Reviewservice {
	
	@Autowired
	private Reviewdao reviewdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReview(Review r) {
		
		return reviewdao.insertReview(sqlSession, r);
	}

	@Override
	public int selectListCount() {
		
		return reviewdao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectAll(userPageInfo pi) {
		
		return reviewdao.selectAll(sqlSession, pi);
	}

	@Override
	public Review reviewDetail(int reviewNo) {
		
		return reviewdao.reviewDetail(sqlSession, reviewNo);
	}

	@Override
	public int updateReview(Review r) {
		
		return reviewdao.updateReview(sqlSession, r);
	}

	@Override
	public int deleteReview(int reviewNo) {
		
		return reviewdao.deleteReview(sqlSession, reviewNo);
	}

	@Override
	public ArrayList<Review> selectTopList() {
		
		return reviewdao.selectTopList(sqlSession);
	}

	@Override
	public ArrayList<Review> review(int userNo) {
		
		return reviewdao.review(sqlSession, userNo);
	}
}