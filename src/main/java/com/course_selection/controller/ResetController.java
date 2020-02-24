package com.course_selection.controller;

import com.course_selection.mapper.ResetMapper;
import com.course_selection.mapper.WeekMapper;
import com.course_selection.pojo.School_Hours;
import com.course_selection.pojo.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ResetController {
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    ResetMapper resetMapper;
    @Autowired
    WeekMapper weekMapper;

    //重置密码
    @RequestMapping("/reset_pa")
    public String reset(@Param ("sid") int sid,Student stu){
        //教师端登录判断加在了页面跳转处
        sid=stu.getSid();
        resetMapper.reset_password(sid);
        return "redirect:homepage_teacher";
    }

    //设置开学日期
    @RequestMapping("/set_day")
    public String set_day(@Param("year") String year, @Param("month")String month, @Param("day")String day) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date=sdf.parse(year+"-"+month+"-"+day);
        resetMapper.set_day(date);
        School_Hours school_hours = weekMapper.findDay();
        redisTemplate.opsForValue().set("school_hours", school_hours);
        return "redirect:homepage_teacher";
    }
}
