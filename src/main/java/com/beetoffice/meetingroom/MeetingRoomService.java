package com.beetoffice.meetingroom;

import java.util.List;

public interface MeetingRoomService {

    void insertReserveInfo(MeetingRoomVO vo);
    void updateReserveInfo(MeetingRoomVO vo);
    void deleteReserveInfo(MeetingRoomVO vo);
    List<MeetingRoomVO> getReserveInfo(MeetingRoomVO vo);
    List<MeetingRoomVO> getAll(MeetingRoomVO vo);
    List<MeetingRoomVO> getTime(MeetingRoomVO vo);


}
