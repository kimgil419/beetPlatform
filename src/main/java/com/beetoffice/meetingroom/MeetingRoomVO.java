package com.beetoffice.meetingroom;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class MeetingRoomVO {

    @Getter
    @Setter
    int idx;
    @Getter
    @Setter
    String start, end, user_id, dept, user_name, book_date, room_num, title;


}