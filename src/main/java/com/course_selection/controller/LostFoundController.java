package com.course_selection.controller;

import com.course_selection.mapper.LostFoundMapper;
import com.course_selection.pojo.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

@Controller
public class LostFoundController {
    @Autowired
    LostFoundMapper lostfoundMapper;

    @RequestMapping("/laf")
    public String lost(HttpServletRequest request, HttpServletResponse response,
                       @Param("type") String type, @Param("title") String title,
                       @Param("content") String content, @Param("place") String place,
                       @Param("number") String number, @Param("time") String time,
                       @Param("sid") Integer sid) {
        type = request.getParameter("type");
        title = request.getParameter("title");
        content = request.getParameter("content");
        HttpSession session = request.getSession();//获取session内容
        sid = ((Student) session.getAttribute("student")).getSid();
        number = String.valueOf(sid.intValue());
        place = lostfoundMapper.findastudent(sid).getSname();
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        time=sdf.format(d);
        lostfoundMapper.addlostfound(type, title, content, place, number, time);
        return "redirect:lostfound";
    }

    @RequestMapping("/laf_t")
    public String lost_teacher(HttpServletRequest request, HttpServletResponse response,
                       @Param("type") String type, @Param("title") String title,
                       @Param("content") String content, @Param("place") String place,
                       @Param("number") String number, @Param("time") String time) {
        type = request.getParameter("type");
        title = request.getParameter("title");
        content = request.getParameter("content");
        number = request.getParameter("number");
        place = "实验室";
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        time=sdf.format(d);
        lostfoundMapper.addlostfound(type, title, content, place, number, time);
        return "redirect:lostfound_teacher";
    }
}
