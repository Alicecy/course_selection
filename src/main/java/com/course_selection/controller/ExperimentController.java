package com.course_selection.controller;

import com.course_selection.pojo.ShowExperiment;
import com.course_selection.pojo.Student;
import com.course_selection.service.impl.CourseServiceImpl;
import com.course_selection.service.impl.StudentServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
        int sid = student.getSid();
        result = courseService.select_course(sid, eid, week, day, section);
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
        student.cancelCourse();
        student = studentService.cancelCourse(student);
        result = courseService.cancel_course(student.getSid(), eid);
        return result;
    }
}
