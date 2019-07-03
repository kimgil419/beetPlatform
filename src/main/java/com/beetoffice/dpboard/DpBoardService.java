package com.beetoffice.dpboard;

import java.util.List;
import java.util.Map;

import com.beetoffice.board.BoardVO;

public interface DpBoardService {
	void dpinsertBoard(DpBoardVO vo); //입력
	void dpupdateBoard(DpBoardVO vo); //수정
	DpBoardVO dpupdateBoardf(DpBoardVO vo); //게시물수정
	void dpdeleteBoard(DpBoardVO vo); //삭제
	void dpgetBoardInsert(DpBoardVO vo); //게시물 조회수 에 이용할 것;
	DpBoardVO dpgetBoard(DpBoardVO vo); //조회(상세조회)
	List<DpBoardVO> dpgetBoardList(DpBoardVO vo); //조회(글목록)
	int dpgetTotalCount(DpBoardVO vo);
	int dpgetTotalCounts(DpBoardVO vo);
}
