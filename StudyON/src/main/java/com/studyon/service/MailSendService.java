package com.studyon.service;

import javax.servlet.http.HttpServletRequest;

public interface MailSendService {

		// 이메일 난수 만드는 메서드
		public String init();
		// 난수를 이용한 키 생성
		public String getKey(boolean lowerCheck, int size);
		
		// 회원가입 발송 이메일(인증키 발송)
	    public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request);
				
	  	
	  	// 유저 인증키 Y로 바꿔주는 메서드
	  	public int alter_userKey(String mem_id, String key); 
			
	  	//회원 비밀번호 찾을 이메일
	  	public void mailSendWithPassword(String e_mail, String user_id, HttpServletRequest request);
	  	
}
