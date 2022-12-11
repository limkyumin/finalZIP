package com.kh.zip.userinfo.controller;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class Naverloginapi extends DefaultApi20 {
	protected Naverloginapi(){    }

	private static class InstanceHolder {
		private static final Naverloginapi INSTANCE = new Naverloginapi();
	}

	public static Naverloginapi instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
