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
	
}
