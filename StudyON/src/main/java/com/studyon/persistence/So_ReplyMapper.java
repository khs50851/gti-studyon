package com.studyon.persistence;

import java.util.List;

import com.studyon.domain.So_ReplyVO;

public interface So_ReplyMapper {
	
	//댓글 리스트
	public List<So_ReplyVO> So_ReplyList(int qna_bno);
	
	//댓글 등록
	public int So_ReplyInsert(So_ReplyVO rvo);
	
	
}
