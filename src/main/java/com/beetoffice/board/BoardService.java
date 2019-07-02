package com.beetoffice.board;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo); //입력
	void updateBoard(BoardVO vo); //수정
	BoardVO updateBoardf(BoardVO vo); //게시물수정
	void deleteBoard(BoardVO vo); //삭제
	void getBoardInsert(BoardVO vo); //게시물 조회수 에 이용할 것;
	BoardVO getBoard(BoardVO vo); //조회(상세조회)
	List<BoardVO> getBoardList(BoardVO vo); //조회(글목록)
}
