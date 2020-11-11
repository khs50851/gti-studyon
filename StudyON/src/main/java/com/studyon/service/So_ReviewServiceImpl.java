package com.studyon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_ReviewVO;
import com.studyon.persistence.So_ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class So_ReviewServiceImpl implements So_ReviewService {
	private static final Logger log = LoggerFactory.getLogger(So_ReviewServiceImpl.class);
	@Setter(onMethod_=@Autowired)
	private So_ReviewMapper mapper;
	
	@Override
		public int reviewinsert(So_ReviewVO rev) {
			return mapper.reviewinsert(rev);
		}
	
//	@Override
//	public List<So_ReviewVO> So_ReviewList() {
//		return mapper.So_ReviewList();
//	}
	
	@Override
	public List<So_ReviewVO> So_ReviewList(PageVO vo) {
		return mapper.So_ReviewList(vo);
	}
	
	@Override
	public int So_ReviewDelete(So_ReviewVO rev) {
		return mapper.So_ReviewDelete(rev);
	}
	
	@Override
	public int So_ReviewModify(So_ReviewVO rev) {
		return mapper.So_ReviewModify(rev);
	}
	
	@Override
	public int So_ReviewCount() {
		return mapper.So_ReviewCount();
	}
}
