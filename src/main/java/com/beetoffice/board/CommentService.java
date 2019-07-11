package com.beetoffice.board;

import java.util.List;

public interface CommentService {
    void insertComment(CommentVO vo);
    List<CommentVO> getCommentList(CommentVO vo);
    int deleteComment(int cno);
	void addComment(CommentVO vol);
	List<CommentVO> selectBoardCommentByCode(CommentVO vol);
}
