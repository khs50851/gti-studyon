package com.studyon.service;

import com.studyon.domain.So_MemberVO;

public interface So_MemberService {
			//회원 등록
			public int So_MemberInsert(So_MemberVO mem);
			
			//아이디 중복체크
			public So_MemberVO idChk(String mem);
			
			//전화번호 중복확인
			public So_MemberVO phoneChk(String mem_phone);
			
			//로그인
		  	public So_MemberVO Login(So_MemberVO mem);
			
		  	//아이디 찾기
		  	public String serchId(String mem_name,String mem_phone);  
		  	
		  //회원 이름 찾기
			public So_MemberVO So_Memname(String mem_id);
			
			//패스워드 변경메소드
			public int searchPassword(String mem_id, String mem_email,String key);
			
			//패스워드 찾기시 ID와 Email을 받아서 회원 있는지 검색
			public So_MemberVO Searchmem(String mem_email,String mem_id);
}
