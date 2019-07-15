package com.beetoffice.board;

import java.util.List;

public interface CommentService {
    List<CommentVO> getCommentList(CommentVO vo);

	void addComment(CommentVO vol);
	
	List<CommentVO> selectBoardCommentByCode(CommentVO vol);

	void deleteComment(String ccd);
    
	
}
