package com.course_selection.util;

import com.course_selection.pojo.School_Hours;

import java.util.Date;

public class WeekUtil {

    public long countWeek(School_Hours school_hours) {
        Date d1 = school_hours.getDate();
        Date d2 = new Date(System.currentTimeMillis());
        long diff = d2.getTime() - d1.getTime();
        long week = diff / (1000 * 60 * 60 * 24*7);
        week++;
        System.out.println("当前周次:"+week);
        return week;
    }
}
