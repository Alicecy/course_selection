package com.course_selection.mapper;

import com.course_selection.pojo.Selection_Information;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SelectionMapper {

    @Select("select * from selection_information where eid=#{eid} and weeknum=#{weeknum} and day=#{day} and section=#{section} order by seat asc")
    public List<Selection_Information> findOne(@Param("eid") int eid, @Param("weeknum") int weeknum, @Param("day") int day, @Param("section") int section);

    @Insert("insert into selection_information ( id, sid, sname, eid, ename, weeknum, day, section, lab ,seat,grade) values( null, #{sid}, #{sname}, #{eid}, #{ename}, #{weeknum}, #{day}, #{section}, #{lab} ,#{seat},#{grade})")
    public void add(@Param("sid") int sid, @Param("sname")String name, @Param("eid") int eid, @Param("ename") String ename, @Param("weeknum") int weeknum, @Param("day") int day, @Param("section") int section, @Param("lab") int lab, @Param("seat") int seat,@Param("grade") int grade);

    @Delete("delete from selection_information where sid=#{sid} and eid=#{eid}")
    public void delete(@Param("sid") int sid, @Param("eid") int eid);

    @Select("select * from selection_information where sid = #{sid} order by weeknum asc")
    public List<Selection_Information> findS(@Param("sid") int sid);

    @Select("select * from selection_information where sid = #{sid} and eid=#{eid}")
    public Selection_Information findSI(@Param("sid") int sid,@Param("eid")int eid);

}
