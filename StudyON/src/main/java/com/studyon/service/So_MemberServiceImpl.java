package com.studyon.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyon.domain.So_MemberVO;
import com.studyon.persistence.So_MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class So_MemberServiceImpl implements So_MemberService {
private static final Logger log = LoggerFactory.getLogger(So_MemberServiceImpl.class);
	
	@Setter(onMethod_=@Autowired)
	private So_MemberMapper mapper;
	
	//회원 등록
	@Override
	public int So_MemberInsert(So_MemberVO mem) {
		
		return mapper.So_MemberInsert(mem);
	}
	
	//아이디 중복체크
	@Override
	public So_MemberVO idChk(String mem) {
		return mapper.idChk(mem);
	}
	
	//전화번호 중복체크
	@Override
	public So_MemberVO phoneChk(String mem_phone) {
		return mapper.phoneChk(mem_phone);
	}
	
	//로그인
	@Override
	public So_MemberVO Login(So_MemberVO mem) {
		return mapper.Login(mem);
	}
	
	//아이디찾기
	@Override
	public String serchId(String mem_name, String mem_phone) {
		return mapper.serchId(mem_name, mem_phone);
	}
	
	@Override
	public So_MemberVO So_Memname(String mem_id) {
		return mapper.So_Memname(mem_id);
	}
	
	@Override
	public int searchPassword(String mem_id, String mem_email, String key) {
		return mapper.searchPassword(mem_id, mem_email, key);
	}
	
	//id랑 email로 회원 있는지 검색(패스워도 찾기용)
	@Override
	public So_MemberVO Searchmem(String mem_email, String mem_id) {
		return mapper.Searchmem(mem_email, mem_id);
	}
	
}
