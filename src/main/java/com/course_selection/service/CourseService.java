package com.course_selection.service;

import com.course_selection.pojo.Selection_Information;

import java.util.List;

public interface CourseService {
    String seat_count(int eid, int weeknum, int section, int day);

    String select_course(Integer sid,String sname, Integer eid, Integer week, Integer day, Integer section,Integer grade);

    String cancel_course(Integer sid, Integer eid);

    Selection_Information findOne(Integer sid,Integer eid);

    List<Selection_Information> selected(int sid);
}
