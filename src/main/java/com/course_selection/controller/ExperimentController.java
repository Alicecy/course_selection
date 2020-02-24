package com.course_selection.controller;

import com.course_selection.pojo.School_Hours;
import com.course_selection.pojo.Student;
import com.course_selection.service.impl.CourseServiceImpl;
import com.course_selection.service.impl.StudentServiceImpl;
import com.course_selection.util.WeekUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class ExperimentController {
    @Autowired
    private CourseServiceImpl courseService;
    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    @RequestMapping("/count")
    public String count(HttpServletRequest request, HttpServletResponse response,
                        @Param("eid") Integer eid, @Param("week") Integer week, @Param("section") Integer section, @Param("day") Integer day) {
        String result = "";
        if (eid == 0) {
            result = "请选择实验";
            return result;
        }
        System.out.println(result);
        result = courseService.seat_count(eid, week, section, day);
        System.out.println(result);
        return result;
    }


    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response,
                         @Param("eid") Integer eid, @Param("week") Integer week, @Param("day") Integer day, @Param("section") Integer section) {
        String result = null;
        if (eid == 0) {
            result = "请选择实验";
            return result;
        }
        System.out.println(result);
        Student student = (Student) request.getSession().getAttribute("student");
        if (student.getSelected_num() == student.getTotal_num()) {
            return "选择实验已达上限！";
        }
        long nowWeek = new WeekUtil().countWeek((School_Hours) redisTemplate.opsForValue().get("school_hours"));
        if (nowWeek >= week) {
            return "仅能选择下周及之后的实验，请重新选择！";
        }
        int sid = student.getSid();
        String sname = student.getSname();
        int grade=0;
        result = courseService.select_course(sid, sname, eid, week, day, section,grade);
        student.selectCourse();
        student = studentService.addCourse(student);
        System.out.println(result);
        return result;
    }

    @RequestMapping("/cancel")
    public String cancel(HttpServletRequest request, HttpServletResponse response,
                         @Param("eid") Integer eid) {
        String result = null;
        System.out.println(eid);
        Student student = (Student) request.getSession().getAttribute("student");
        System.out.println(student);
        if (null == student) {
            return "登录信息已过期，请重新登陆。";
        }
        long nowWeek = new WeekUtil().countWeek((School_Hours) redisTemplate.opsForValue().get("school_hours"));
        if (nowWeek >= courseService.findOne(student.getSid(), eid).getWeeknum()) {
            return "仅能取消本周及之后的预约，请重新选择！";
        }
        student.cancelCourse();
        student = studentService.cancelCourse(student);
        result = courseService.cancel_course(student.getSid(), eid);
        return result;
    }
}
