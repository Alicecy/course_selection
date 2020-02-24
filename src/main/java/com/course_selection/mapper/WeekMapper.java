package com.course_selection.mapper;

import com.course_selection.pojo.School_Hours;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface WeekMapper {
    @Select("select * from school_hours ")
    public School_Hours findDay();
}
