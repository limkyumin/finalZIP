package com.kh.zip.chat.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("csession")
public class Chatsession {
	
	// static으로 필드 변수 설정하여 ArrayList 이용할 수 있도록 선언
	private static ArrayList<String> loginUser = new ArrayList<String>();
	
	// 로그인하면 ArrayList에 추가
	public void addLoginUser(String userId) {
		
		loginUser.add(userId);
	}
	
	// 로그아웃하면 ArrayList에서 제거
	public void removeLoginUser(String userId) {
		
		loginUser.remove(userId);
	}
	
	// 현재 로그인 되어있는 유저 목록 가져오기
	public static ArrayList<String> getLoginUser() {
		
		return loginUser;
	}
	
	public static void setLoginUser(ArrayList<String> loginUser) {
		
		Chatsession.loginUser = loginUser;
	}
}