package com.kh.zip.review.model.service;

import java.util.ArrayList;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.review.model.vo.Review;

public interface Reviewservice {
	
	int insertReview(Review r);
	
	int selectListCount();
	
	ArrayList<Review> selectAll(userPageInfo pi);
	
	Review reviewDetail(int reviewNo);
	
	int updateReview(Review r);
	
	int deleteReview(int reviewNo);
	
	ArrayList<Review> selectTopList();

	ArrayList<Review> review(int userNo);
}