package com.kh.zip.common.template;

import com.kh.zip.common.model.vo.userPageInfo;

public class userPagination {
	
	public static userPageInfo getPageInfo(int listCount,int currentPage, int pageLimit, int userLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/userLimit);
		if(listCount == 0) {
			maxPage = 1;
		}
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage+pageLimit -1 ;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		return new userPageInfo(listCount,currentPage,pageLimit,userLimit,maxPage,startPage,endPage);
	}
}