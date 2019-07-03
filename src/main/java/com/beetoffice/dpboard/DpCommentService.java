package com.beetoffice.dpboard;

import java.util.List;

public interface DpCommentService {
    void dpinsertComment(DpCommentVO vo);
    List<DpCommentVO> dpgetCommentList(DpCommentVO vo);
    void dpdeleteComment(DpCommentVO vo);
}
