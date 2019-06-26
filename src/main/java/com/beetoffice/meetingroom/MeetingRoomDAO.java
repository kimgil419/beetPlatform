package com.beetoffice.meetingroom;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("MeetingRoomDAO")
public class MeetingRoomDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public MeetingRoomDAO() {

    }

    public void insertContent(MeetingRoomVO vo) {
        mybatis.insert("meetingroom.insertContent", vo);
    }

    public void updateContent(MeetingRoomVO vo) {
        mybatis.update("meetingroom.updateContent", vo);
    }

    public void deleteContent(MeetingRoomVO vo){
        mybatis.delete("meetingroom.deleteContent", vo);
    }

    public List<MeetingRoomVO> showMeetingRoom(MeetingRoomVO vo) {
        return mybatis.selectList("meetingroom.selectContent", vo);
    }
    public List<MeetingRoomVO> getAll(MeetingRoomVO vo) {
        return mybatis.selectList("meetingroom.selectAll", vo);
    }
    public List<MeetingRoomVO> getTime(MeetingRoomVO vo) {
        return mybatis.selectList("meetingroom.selectTime", vo);
    }
}
