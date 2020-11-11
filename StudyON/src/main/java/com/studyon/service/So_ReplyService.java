package com.studyon.service;

import java.util.List;

import com.studyon.domain.So_ReplyVO;

public interface So_ReplyService {
	
	//댓글 리스트
	public List<So_ReplyVO> So_ReplyList(int qna_bno);
	
	//댓글 등록
	public int So_ReplyInsert(So_ReplyVO rvo);
	
	//댓글 수정
	public int So_ReplyModify(So_ReplyVO rvo);
	
	//댓글 삭제
	public int So_ReplyDelete(So_ReplyVO rvo);
}
