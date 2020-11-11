package com.studyon.persistence;

import java.util.List;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_ReviewVO;

public interface So_ReviewMapper {
	//리뷰 등록
	public int reviewinsert(So_ReviewVO rev);
		
//	//리뷰 조회
//	public List<So_ReviewVO> So_ReviewList();
	
	//리뷰 조회
	public List<So_ReviewVO> So_ReviewList(PageVO vo);
	
	//리뷰 수정
	public int So_ReviewModify(So_ReviewVO rev);
	
	//전체카운트
	//이 갯수를 가지고 나누기 10을하면 3페이지인지 4페이지인지를 알 수 있음
	//페이지가 추가되면 저 boardlist를 부르는데 전체 글들을 불러올 필요는 없음
	public int So_ReviewCount();
	
	//리뷰 삭제
	public int So_ReviewDelete(So_ReviewVO rev);
}
