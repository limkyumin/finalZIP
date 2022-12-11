package com.kh.zip.common.template;

import com.kh.zip.common.model.vo.roomPageInfo;

public class roomPagination {
	
	public static roomPageInfo getPageInfo(int listCount,int currentPage, int pageLimit, int roomLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/roomLimit);
		if(listCount == 0) {
			maxPage = 1;
		}
		
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage+pageLimit -1 ;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		return new roomPageInfo(listCount,currentPage,pageLimit,roomLimit,maxPage,startPage,endPage);
	}
}
