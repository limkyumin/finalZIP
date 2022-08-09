package com.kh.zip.common.model.vo;

public class roomPageInfo {
	
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int roomLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public roomPageInfo() {
		super();
	}

	public roomPageInfo(int listCount, int currentPage, int pageLimit, int roomLimit, int maxPage, int startPage,
			int endPage) {
		super();		
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.roomLimit = roomLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getRoomLimit() {
		return roomLimit;
	}

	public void setRoomLimit(int roomLimit) {
		this.roomLimit = roomLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "roomPageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", roomLimit=" + roomLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	
	
	
}
	