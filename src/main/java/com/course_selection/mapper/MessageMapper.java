package com.course_selection.mapper;

import com.course_selection.pojo.Message;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface MessageMapper{
    @Select("select * from message order by id desc")
    public List<Message> findMessage();
    @Insert("insert into message (sid,sname,time,`to`,content) values( #{sid}, #{sname}, #{time}, #{to}, #{content})")
    public void save(@Param("sid") Integer sid, @Param("sname") String sname, @Param("time") Date time, @Param("to") String to, @Param("content")String content);


    @Update("update message set reply=#{reply},reply_time=#{reply_time} where id = #{id}")
    public void addReply(@Param("reply") String reply,@Param("reply_time") String reply_time,@Param("id") Integer id);
}
