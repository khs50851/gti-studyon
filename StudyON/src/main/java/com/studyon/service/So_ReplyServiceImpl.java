package com.studyon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyon.domain.So_ReplyVO;
import com.studyon.persistence.So_ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class So_ReplyServiceImpl implements So_ReplyService {
private static final Logger log = LoggerFactory.getLogger(So_ReplyServiceImpl.class);
	
	@Setter(onMethod_=@Autowired)
	private So_ReplyMapper mapper;
	
	@Override
	public List<So_ReplyVO> So_ReplyList(int qna_bno) {
		return mapper.So_ReplyList(qna_bno);
	}
	
	@Override
	public int So_ReplyInsert(So_ReplyVO rvo) {
		return mapper.So_ReplyInsert(rvo);
	}
	
}
