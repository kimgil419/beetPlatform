package com.beetoffice.meetingroom;

import com.beetoffice.user.UserVO;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MeetingRoomController {

    @Autowired
    private MeetingRoomService meetingRoomService;

    @RequestMapping("/getMeetingRoomList.do")
    public String getMeetingRoomList(MeetingRoomVO vo, Model model, HttpSession session) {

        String dept = (String) session.getAttribute("dept");

        vo.setRoom_num("room1");
        Gson gson = new Gson();
        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        String meetingroomjson = gson.toJson(meetingroom);

        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        String allListjson = gson.toJson(allList);

        model.addAttribute("userDept",dept);
        model.addAttribute("meetingRoomList",meetingroomjson);
        model.addAttribute("allList",allListjson);
        return "meetingroom/getMeetingRoomList";
    }

    @RequestMapping(value="/saveMeetingRoom.do", produces="application/json; charset=utf8")
    public @ResponseBody
    Map saveMeetingRoom(MeetingRoomVO vo, Model model, HttpSession session){

        String dept = (String) session.getAttribute("dept");
        vo.setDept(dept);
        String user_id = (String) session.getAttribute("user_id");
        vo.setUser_id(user_id);
        String user_name = (String) session.getAttribute("user_name");
        vo.setUser_name(user_name);

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

    @RequestMapping(value = "/selectroom.do", produces = "application/json; charset=utf8")
    public @ResponseBody Map selectroom(MeetingRoomVO vo){

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








    @RequestMapping("/meetingrommbookinglist.do")
    public @ResponseBody Map meetingrommbookinglist(MeetingRoomVO vo, HttpSession session) {

        String dept = (String) session.getAttribute("dept");

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Map list = new HashMap();
        list.put("event", meetingroom);
        list.put("bookingList", allList);
        list.put("userDept", dept);

        System.out.println(list);

        return list;
    }

    @RequestMapping(value="/saveBooking.do", produces="application/json; charset=utf8")
    public @ResponseBody
    Map saveBooking(MeetingRoomVO vo, Model model, HttpSession session){

        String dept = (String) session.getAttribute("dept");
        vo.setDept(dept);
        String user_id = (String) session.getAttribute("user_id");
        vo.setUser_id(user_id);
        String user_name = (String) session.getAttribute("user_name");
        vo.setUser_name(user_name);

        System.out.println(vo);

        meetingRoomService.insertReserveInfo(vo);

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Map list = new HashMap<>();
        list.put("event", meetingroom);
        list.put("bookingList", allList);
        return list;
    }


    @RequestMapping(value = "/deleteList.do", produces = "application/json; charset=utf8")
    public @ResponseBody Map deleteList( MeetingRoomVO vo){

        System.out.println(vo);

        meetingRoomService.deleteReserveInfo(vo);

        List<MeetingRoomVO> meetingroom =  meetingRoomService.getReserveInfo(vo);
        List<MeetingRoomVO> allList =  meetingRoomService.getAll(vo);

        Map list = new HashMap<>();
        list.put("event", meetingroom);
        list.put("bookingList", allList);


        System.out.println(list);
        return list;
    }

}
