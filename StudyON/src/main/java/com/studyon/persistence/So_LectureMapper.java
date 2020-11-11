package com.studyon.persistence;

import java.util.List;

import com.studyon.domain.So_LectureVO;

public interface So_LectureMapper {
	
	// 강의 정보 등록
	public int So_LectureInsert(So_LectureVO lect);
	
	// 강의 이름 중복 검사
	public So_LectureVO lectNameChk(String lect);
	
	// 전체 강의 조회
	public List<So_LectureVO> getLectListAll();
	
	// 강의 코드 조회
	public So_LectureVO getLectCode(int lect_code);
	
}