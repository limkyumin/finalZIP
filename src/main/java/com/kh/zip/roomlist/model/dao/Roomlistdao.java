package com.kh.zip.roomlist.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.chat.model.vo.Chatroom;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.roomlist.model.vo.Attachment;
import com.kh.zip.roomlist.model.vo.Roomlist;
import com.kh.zip.roomlist.model.vo.Wishlist;

@Repository
public class Roomlistdao {

	public ArrayList<Roomlist> searchRoomAll(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("roomlistMapper.searchRoomAll");
	}

	public Roomlist detailRoom(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.selectOne("roomlistMapper.detailRoom", roomNo);
	}
	
	public String selectUserId(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("userinfoMapper.selectUserId", userNo);
	}

	public String selectMasterId(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.selectOne("userinfoMapper.selectMasterId", roomNo);
	}
	
	public Chatroom selctChatroom(SqlSessionTemplate sqlSession, Chatroom c) {
		
		return sqlSession.selectOne("chatMapper.selectChatroom", c);
	}

	public ArrayList<Attachment> selectImages(SqlSessionTemplate sqlSession, int roomNo) {
		
		return (ArrayList)sqlSession.selectList("attachmentMapper.selectImages", roomNo);
	}
	
	public Attachment selectDocument(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.selectOne("attachmentMapper.selectDocument", roomNo);
	}
	
	public Roomlist checkRoom(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("roomlistMapper.checkRoom", userNo);
	}
	
	public int registerRoom(SqlSessionTemplate sqlSession, Roomlist r) {
		
		return sqlSession.insert("roomlistMapper.registerRoom", r);
	}
	
	public int registerThumbnail(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.registerThumbnail", a);
	}

	public int registerImages(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.registerImages", a);
	}

	public int registerDocument(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.registerDocument", a);
	}

	public int updateRoom(SqlSessionTemplate sqlSession, Roomlist r) {
		
		return sqlSession.update("roomlistMapper.updateRoom", r);
	}
	
	public int updateFiles(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.update("attachmentMapper.updateFiles", roomNo);
	}
	
	public int updateThumbnail(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.updateThumbnail", a);
	}

	public int updateImages(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.updateImages", a);
	}

	public int updateDocument(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("attachmentMapper.updateDocument", a);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.delete("roomlistMapper.deleteRoom", roomNo);
	}

	public int approveRoom(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.update("roomlistMapper.approveRoom", roomNo);
	}

	public Wishlist selectWishlist(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.selectOne("wishlistMapper.selectWishlist", w);
	}

	public int addWishlist(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.insert("wishlistMapper.addWishlist", w);
	}

	public int removeWishlist(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.update("wishlistMapper.removeWishlist", w);
	}

	public ArrayList<Roomlist> selectOption(SqlSessionTemplate sqlSession, Roomlist r) {
		
		return (ArrayList)sqlSession.selectList("roomlistMapper.selectOption", r);
	}
	
	public ArrayList<Roomlist> roomenroll(SqlSessionTemplate sqlSession, int userNo) {

		return (ArrayList)sqlSession.selectList("roomlistMapper.roomenroll", userNo);
	}	

	public ArrayList<Wishlist> mywishlist(SqlSessionTemplate sqlSession, int userNo, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("wishlistMapper.mywishlist", userNo, rowBounds);
	}

	public int wishListCount(SqlSessionTemplate sqlSession, Integer userNo) {
		
		return sqlSession.selectOne("wishlistMapper.wishListCount",userNo);
	}
}