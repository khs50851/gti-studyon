package com.studyon.service;

import java.util.List;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_QnaVO;

public interface So_QnaService {
		//게시글 등록
		public int So_QnaWrite(So_QnaVO qvo);
		
//		//전체 게시글 조회
//		public List<So_QnaVO> So_QnaList();
		
		//게시글 한개 눌렀을때 조회
		public So_QnaVO So_QnaView(int qna_bno);
		
		//게시글 수정
		public int So_QnaModify(So_QnaVO qvo);
		
		//게시글 삭제
		public int So_QnaDelete(int qna_bno);
		
		//전체카운트
		//이 갯수를 가지고 나누기 10을하면 3페이지인지 4페이지인지를 알 수 있음
		//페이지가 추가되면 저 boardlist를 부르는데 전체 글들을 불러올 필요는 없음
		public int So_QnaCount();
		
		//검색 조건에 맞는 전체카운트  검색했을때 1개면 1페이 11개면 2페이지 뭐 이런식으로 나와야함
		//여기서 vo는 search key의 역할도 함
		public int So_QnaCountSearch(PageVO vo);
		
		//전체글
		public List<So_QnaVO> So_QnaList(PageVO vo);
		
		
		//검색
		public List<So_QnaVO> So_QnaListSearch(PageVO vo);
			
		//페이지 처리를 하려면 보드에 들어가있는 총 갯수를 알아서 
		//우리가 보편적으로 35개 글이면 4페이지가 나오면 되자나
		//10으로 나눴을때 몫이면 3이자나 나머지가 없으면 3페이지가 맞는데 나머지가 있으면 4페이지(+1을 해야하는거)
}
