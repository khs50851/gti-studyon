package com.studyon.persistence;

import com.studyon.domain.So_MemberVO;

public interface So_MemberMapper {
	
	//회원 등록
	public int So_MemberInsert(So_MemberVO mem);
	
	//아이디 중복확인
	public So_MemberVO idChk(String mem);
	
	//유저 인증키 생성
	int GetKey(String mem_id, String user_key); 
	
	// 유저 인증키 Y로 바꿔주는 메서드
	int alter_userKey(String mem_id, String key); 
}
