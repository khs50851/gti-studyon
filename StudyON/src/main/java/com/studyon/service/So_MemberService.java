package com.studyon.service;

import com.studyon.domain.So_MemberVO;

public interface So_MemberService {
	
	//회원 등록
	public int So_MemberInsert(So_MemberVO mem);
	
	//아이디 중복체크
	public So_MemberVO idChk(String mem);
}
