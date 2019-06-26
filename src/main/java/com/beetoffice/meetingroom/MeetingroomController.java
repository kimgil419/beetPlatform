package com.beetoffice.meetingroom;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MeetingroomController {

    @Autowired
    private MeetingRoomService meetingRoomService;

    @RequestMapping("/getMeetingRoomList.do")
    public String getMeetingRoomList(MeetingRoomVO vo, Model model){

        vo.setRoom_num("room1");

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Gson gson = new Gson();
        String meetingroomjson = gson.toJson(meetingroom);
        String allListjson = gson.toJson(allList);

        model.addAttribute("meetingRoomList",meetingroomjson);
        model.addAttribute("allList",allListjson);
        return "meetingroom/getMeetingRoomList";
    }

    @RequestMapping(value="/saveMeetingRoom.do", produces="application/json; charset=utf8")
    public @ResponseBody
    Map saveMeetingRoom(MeetingRoomVO vo, Model model){

        vo.setDept("인사팀");
        //세션데이터 입력

        meetingRoomService.insertReserveInfo(vo);

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Gson gson = new Gson();
        String meetingroomjson = gson.toJson(meetingroom);
        String allListjson = gson.toJson(allList);

        Map<String, String> dataList = new HashMap<>();
        dataList.put("meetingroom", meetingroomjson);
        dataList.put("allList", allListjson);
        return dataList;
    }

    @RequestMapping(value = "/selectroom.do", produces = "application/text; charset=utf8")
    public @ResponseBody String selectroom(MeetingRoomVO vo){

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);

        Gson gson = new Gson();
        return gson.toJson(meetingroom);

    }

    @RequestMapping(value = "/deleteRoom.do", produces = "application/json; charset=utf8")
    public @ResponseBody Map deleteroom(MeetingRoomVO vo){
        meetingRoomService.deleteReserveInfo(vo);

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Gson gson = new Gson();
        String meetingroomjson = gson.toJson(meetingroom);
        String allListjson = gson.toJson(allList);

        Map<String, String> dataList = new HashMap<>();
        dataList.put("meetingroom", meetingroomjson);
        dataList.put("allList", allListjson);
        return dataList;

    }

    @RequestMapping(value = "/getTime.do", produces = "application/text; charset=utf8")
    public @ResponseBody String getTime(MeetingRoomVO vo){
        System.out.println(vo);
        List<MeetingRoomVO> meetingroom =  meetingRoomService.getTime(vo);
        System.out.println(meetingroom);
        Gson gson = new Gson();

        return gson.toJson(meetingroom);
    }
}
