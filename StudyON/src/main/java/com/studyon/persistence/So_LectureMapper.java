package com.studyon.persistence;

import com.studyon.domain.So_LectureVO;

public interface So_LectureMapper {
	
	// 강의 정보 등록
	public int So_LectureInsert(So_LectureVO lect);
	
	// 강의 이름 중복 검사
	public So_LectureVO lectNameChk(String lect);
	
}
