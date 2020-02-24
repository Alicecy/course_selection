package com.course_selection.service.impl;

import com.course_selection.mapper.ExperimentMapper;
import com.course_selection.mapper.SelectionMapper;
import com.course_selection.pojo.Experiment;
import com.course_selection.pojo.Selection_Information;
import com.course_selection.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private RedisTemplate<Object,Object> redisTemplate;

    @Autowired
    private SelectionMapper selectionMapper;

    @Autowired
    private ExperimentMapper experimentMapper;

    @Override
    public String seat_count(int eid, int weeknum, int section, int day) {
        String result = "";
        int total = (experimentMapper.findE(eid)).getSeat_num();
        int now = (selectionMapper.findOne(eid, weeknum, section, day)).size();
        System.out.println(total);
        System.out.println(now);
        result = "剩余座位数量:" + (total - now);
        System.out.println(result);
        return result;
    }

    @Override
    public String select_course(Integer sid, String sname, Integer eid, Integer week, Integer day, Integer section,Integer grade) {
        String result = null;
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);
        List<Selection_Information> sc = selected(sid);
        for (Selection_Information selection_information : sc) {
            if (eid == selection_information.getEid()) {
                result = "该课程已选择";
                break;
            }
        }
        if (result != null) {
            return result;
        }
        Experiment experiment = experimentMapper.findE(eid);
        if(!((week >= experiment.getOne_start() && week<= experiment.getOne_end())||(week>=experiment.getOne_start()&&week<=experiment.getTwo_end()))) {
            return "该周次无此课程";
        }
        List<Selection_Information> sis = (List<Selection_Information>) redisTemplate.opsForValue().get("es"+eid+week+day+section);
        if (sis == null) {
            synchronized (this){
                sis = (List<Selection_Information>) redisTemplate.opsForValue().get("es"+eid+week+day+section);
                if (sis == null) {
                    System.out.println("查询数据库");
                    sis = selectionMapper.findOne(eid, week, day, section);
                    redisTemplate.opsForValue().set("es"+eid+week+day+section,sis);
                    redisTemplate.expire("es"+eid+week+day+section,600000, TimeUnit.MILLISECONDS);
                }else {
                    System.out.println("查询Redis");
                }
            }
        }else{
            System.out.println("查询Redis");
        }

        if (experiment.getSeat_num() == sis.size()) {
            result = "选课人数已满。";
            return result;
        }
        int seat = 1;

        for (Selection_Information selection_information : sis) {
            if (seat == selection_information.getSeat()) {
                seat++;
            } else {
                break;
            }
        }
        grade=0;
        Selection_Information si=new Selection_Information(0,sid, sname, eid, experiment.getEname(), week, day, section, experiment.getLab(), seat,grade);
        selectionMapper.add(sid, sname, eid, experiment.getEname(), week, day, section, experiment.getLab(), seat,grade);
        if (sc == null) {
            sc = new ArrayList<Selection_Information>();
        }
        sc.add(si);
        redisTemplate.opsForValue().set("s"+sid,sc);
        redisTemplate.expire("s"+sid,300000, TimeUnit.MILLISECONDS);
        result = "选课成功";
        return result;
    }

    @Override
    public String cancel_course(Integer sid, Integer eid) {
        String result = null;
        selectionMapper.delete(sid, eid);
        List<Selection_Information> sc = selectionMapper.findS(sid);
        if (sc != null) {
            redisTemplate.opsForValue().set("s"+sid,sc);
            redisTemplate.expire("s"+sid,300000, TimeUnit.MILLISECONDS);
        }else {
            redisTemplate.delete("s" + sid);
        }
        result = "该课程已取消预约";
        return result;
    }

    @Override
    public Selection_Information findOne(Integer sid, Integer eid) {
        return selectionMapper.findSI(sid,eid);
    }

    @Override
    public List<Selection_Information> selected(int sid) {
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);
        List<Selection_Information> sc = (List<Selection_Information>) redisTemplate.opsForValue().get("s"+sid);
        if (sc == null) {
            synchronized (this){
                sc = (List<Selection_Information>) redisTemplate.opsForValue().get("s"+sid);
                if (sc == null) {
                    System.out.println("学生查课查询数据库");
                    sc = selectionMapper.findS(sid);
                    redisTemplate.opsForValue().set("s"+sid,sc);
                    redisTemplate.expire("s"+sid,300000, TimeUnit.MILLISECONDS);
                }else {
                    System.out.println("学生查课查询Redis");
                }
            }
        }else{
            System.out.println("学生查课查询Redis");
        }
        return sc;
    }

}
