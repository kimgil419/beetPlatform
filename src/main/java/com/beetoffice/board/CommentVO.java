package com.beetoffice.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CommentVO {
	
	@Getter @Setter
    private int reply_seq, seq,ssreply,picksort;
	@Getter @Setter
    private String user_id, board_content, write_date, user_name; 
}
