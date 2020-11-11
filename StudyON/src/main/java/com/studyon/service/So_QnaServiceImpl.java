package com.studyon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_QnaVO;
import com.studyon.persistence.So_QnaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class So_QnaServiceImpl implements So_QnaService {
	
	private static final Logger log = LoggerFactory.getLogger(So_QnaServiceImpl.class);
	
	@Setter(onMethod_=@Autowired)
	private So_QnaMapper mapper;
	
	
	@Override
	public int So_QnaWrite(So_QnaVO qvo) {
		return mapper.So_QnaWrite(qvo);
	}
	
//	@Override
//	public List<So_QnaVO> So_QnaList() {
//		return mapper.So_QnaList();
//	}
	
	@Override
	public So_QnaVO So_QnaView(int qna_bno) {
		return mapper.So_QnaView(qna_bno);
	}
	
	@Override
	public int So_QnaModify(So_QnaVO qvo) {
		return mapper.So_QnaModify(qvo);
	}
	
	@Override
	public int So_QnaDelete(int qna_bno) {
		return mapper.So_QnaDelete(qna_bno);
	}
	
	@Override
	public int So_QnaCount() {
		return mapper.So_QnaCount();
	}
	
	@Override
	public int So_QnaCountSearch(PageVO vo) {
		return mapper.So_QnaCountSearch(vo);
	}
	
	@Override
	public List<So_QnaVO> So_QnaList(PageVO vo) {
		return mapper.So_QnaList(vo);
	}
	
	@Override
	public List<So_QnaVO> So_QnaListSearch(PageVO vo) {
		return mapper.So_QnaListSearch(vo);
	}
	
}
