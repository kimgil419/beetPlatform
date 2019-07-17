package com.beetoffice.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
public class LikeVO {

	@Getter @Setter
	private String user_id,reply_seq,reallike;
}
