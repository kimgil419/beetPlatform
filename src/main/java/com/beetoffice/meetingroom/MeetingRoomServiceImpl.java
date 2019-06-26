package com.beetoffice.meetingroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("meetingRoomService")
public class MeetingRoomServiceImpl implements MeetingRoomService {

    @Autowired
    private MeetingRoomDAO mrDAO;

    @Override
    public void insertReserveInfo(MeetingRoomVO vo) {
        mrDAO.insertContent(vo);
    }

    @Override
    public void updateReserveInfo(MeetingRoomVO vo) {
        mrDAO.updateContent(vo);
    }

    @Override
    public void deleteReserveInfo(MeetingRoomVO vo) {
        mrDAO.deleteContent(vo);
    }

    @Override
    public List<MeetingRoomVO> getReserveInfo(MeetingRoomVO vo) {
        return mrDAO.showMeetingRoom(vo);
    }

    @Override
    public List<MeetingRoomVO> getAll(MeetingRoomVO vo) {
        return mrDAO.getAll(vo);
    }

    @Override
    public List<MeetingRoomVO> getTime(MeetingRoomVO vo) {
        return mrDAO.getTime(vo);
    }

}
