package com.course_selection.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Mapper
@Repository
public interface ResetMapper {
    @Update("update student set password=initial_password where sid = #{sid}")
    public void reset_password(@Param("sid") int sid);

//    @Insert("insert into school_hours (date) values( #{date})")
    @Update("update school_hours set date=#{date} ")
    public void set_day(@Param ("date") Date date);
}
