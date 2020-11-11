package com.studyon.service;

import java.util.List;

import com.studyon.domain.So_LectureVO;

public interface So_LectureService {
	
	public int So_LectureInsert(So_LectureVO lect);
	
	public List<So_LectureVO> getLectListAll();
	
	public So_LectureVO getLectCode(int lect_code);
}
