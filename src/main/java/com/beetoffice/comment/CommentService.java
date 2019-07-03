package com.beetoffice.comment;

import java.util.List;

public interface CommentService {
    void insertComment(CommentVO vo);
    List<CommentVO> getCommentList(CommentVO vo);
}
