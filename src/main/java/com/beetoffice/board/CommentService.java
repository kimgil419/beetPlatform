package com.beetoffice.board;

import java.util.List;

public interface CommentService {
    void insertComment(CommentVO vo);
    List<CommentVO> getCommentList(CommentVO vo);
    void deleteComment(CommentVO vo);
}
