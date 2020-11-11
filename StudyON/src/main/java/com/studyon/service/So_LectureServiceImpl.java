package com.studyon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyon.domain.So_LectureVO;
import com.studyon.persistence.So_LectureMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class So_LectureServiceImpl implements So_LectureService {
	
	private static final Logger log =  LoggerFactory.getLogger(So_LectureServiceImpl.class);
	
	@Setter(onMethod_ = @Autowired)
	private So_LectureMapper mapper;
	
	//강의 등록
	@Override
	public int So_LectureInsert(So_LectureVO lect) {
		
		return mapper.So_LectureInsert(lect);
	}
	
	@Override
	public List<So_LectureVO> getLectListAll() {
		log.info("getLectListAll..............");
		
		return mapper.getLectListAll();
	}
	
	@Override
	public So_LectureVO getLectCode(int lect_code) {
		log.info("get............. " + lect_code);
		
		return mapper.getLectCode(lect_code);
	}
}