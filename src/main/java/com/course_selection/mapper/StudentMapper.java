package com.course_selection.mapper;


import com.course_selection.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StudentMapper {

    @Select("select * from student")
    public List<Student> findAll();


    @Select("select * from student where sid=#{sid} and password=#{password} ")
    public Student login(@Param("sid") Integer sid, @Param("password") String password);

    @Update("update student set password=#{password_new} where sid = #{sid} and password=#{password}")
    public void UpdateStudent(@Param("sid") Integer sid, @Param("password") String password, @Param("password_new") String password_new, @Param("sname") String sname);

    @Select("select * from student where sid=#{sid} and password=#{password}")
    public Student findOne(@Param("sid") Integer sid, @Param("password") String password, @Param("sname") String sname);

    @Select("select * from student where id=#{id}")
    public Student findById(@Param("id") Integer id);

}
