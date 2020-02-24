package com.course_selection.controller;

import com.course_selection.mapper.ExperimentMapper;
import com.course_selection.mapper.PostMapper;
import com.course_selection.pojo.Experiment;
import com.course_selection.pojo.PostNote;
import com.course_selection.pojo.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class PostController {
    @Autowired
    private ExperimentMapper experimentMapper;
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    PostMapper postMapper;

    //发布通知
    @RequestMapping("/pnotice")
    public String pnotice(HttpServletRequest request, HttpServletResponse response,
                          @Param("tname") String tname, @Param("comment") String comment, @Param("time") Date time, PostNote p) throws ParseException {
        setInformation("notice", request, tname, comment, time, p);
        return "redirect:homepage_teacher";
    }

    //删除通知
    @RequestMapping("/delete_notice")
    public String delete_notice(@Param("id") Integer id, HttpServletRequest request, PostNote p) throws Exception {
        HttpSession session = request.getSession();//获取session内容
        id = p.getId();
        postMapper.delete_notices(id);
        List<PostNote> notes = postMapper.findNotice();
        if (notes == null) {
            notes = new ArrayList<PostNote>();
        }
        redisTemplate.opsForValue().set("notices", notes);
        return "redirect:post_notice";
    }

    //发布注意事项
    @RequestMapping("/pattention")
    public String pattention(HttpServletRequest request, HttpServletResponse response,
                             @Param("tname") String tname, @Param("comment") String comment, @Param("time") Date time, PostNote p) throws ParseException {
        setInformation("attention", request, tname, comment, time, p);
        return "redirect:homepage_teacher";
    }

    //删除注意事项
    @RequestMapping("/delete_attention")
    public String delete_attention(@Param("id") Integer id, PostNote p) throws Exception {
        id = p.getId();
        postMapper.delete_attentions(id);
        List<PostNote> notes = postMapper.findAttention();
        if (notes == null) {
            notes = new ArrayList<PostNote>();
        }
        redisTemplate.opsForValue().set("attentions", notes);
        return "redirect:post_notes";
    }

    //发布实验室守则
    @RequestMapping("/prules")
    public String prules(HttpServletRequest request, HttpServletResponse response,
                         @Param("tname") String tname, @Param("comment") String comment, @Param("time") Date time, PostNote p) throws ParseException {
        setInformation("rule", request, tname, comment, time, p);
        return "redirect:homepage_teacher";
    }

    //删除实验室守则
    @RequestMapping("/delete_rules")
    public String delete_rules(@Param("id") Integer id, PostNote p) throws Exception {
        id = p.getId();
        postMapper.delete_rule(id);
        List<PostNote> notes = postMapper.findRule();
        if (notes == null) {
            notes = new ArrayList<PostNote>();
        }
        redisTemplate.opsForValue().set("rules", notes);
        return "redirect:post_rules";
    }

    //发布实验开放信息
    @RequestMapping("/popenInfo")
    public String popenInfo(HttpServletRequest request, HttpServletResponse response,
                            @Param("eid") Integer eid, @Param("ename") String ename, @Param("one_start") Integer one_start,
                            @Param("one_end") Integer one_end, @Param("two_start") Integer two_start, @Param("two_end") Integer two_end,
                            @Param("lab") Integer lab, @Param("seat_num") Integer seat_num, @Param("remark") String remark, Experiment e) throws ParseException {
        HttpSession session = request.getSession();//获取session内容
        eid = e.getEid();
        ename = e.getEname();
        one_start = e.getOne_start();
        one_end = e.getOne_end();
        two_end = e.getTwo_end();
        two_start = e.getTwo_start();
        lab = e.getLab();
        seat_num = e.getSeat_num();
        remark = e.getRemark();
        postMapper.save_openInfo(eid, ename, one_start, one_end, two_start, two_end, lab, seat_num, remark);
        List<Experiment> experiments = (List<Experiment>) redisTemplate.opsForValue().get("experiments");
        if (experiments == null) {
            experiments=new ArrayList<Experiment>();
        }
        experiments = experimentMapper.findAllE();
        redisTemplate.opsForValue().set("experiments", experiments);
        return "redirect:homepage_teacher";
    }

    //删除实验开放信息
    @RequestMapping("/delete_openInfo")
    public String delete_openInfos(@Param("id") Integer id, PostNote p) throws Exception {
        id = p.getId();
        postMapper.delete_openInfo(id);
        List<Experiment> experiments = experimentMapper.findAllE();
        if (experiments == null) {
            experiments = new ArrayList<Experiment>();
        }
        redisTemplate.opsForValue().set("experiments", experiments);
        return "redirect:post_openInfo";
    }

    public void setInformation(String name, HttpServletRequest request, String tname, String comment, Date time, PostNote p) throws ParseException {
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);
        HttpSession session = request.getSession();//获取session内容
        tname = ((Teacher) session.getAttribute("teacher")).getTname();
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
        String date = sdf.format(d);
        time = sdf.parse(date);
        comment = p.getComment();
        PostNote note = new PostNote();
        note.setComment(comment);
        note.setPublisher(tname);
        note.setTime(time);
        if (name.equals("notice")) {
            postMapper.save_notice(comment, tname, time);
            List<PostNote> notices = (List<PostNote>) redisTemplate.opsForValue().get("notices");
            if (notices == null) {
                notices = new ArrayList<PostNote>();
            }
            notices.add(note);
            redisTemplate.opsForValue().set("notices", notices);
        } else if (name.equals("rule")) {
            postMapper.save_rule(comment, tname, time);
            List<PostNote> rules = (List<PostNote>) redisTemplate.opsForValue().get("rules");
            if (rules == null) {
                rules = new ArrayList<PostNote>();
            }
            rules.add(note);
            redisTemplate.opsForValue().set("rules", rules);
        } else if (name.equals("attention")) {
            postMapper.save_attention(comment, tname, time);
            List<PostNote> attentions = (List<PostNote>) redisTemplate.opsForValue().get("attentions");
            if (attentions == null) {
                attentions = new ArrayList<PostNote>();
            }
            attentions.add(note);
            redisTemplate.opsForValue().set("attentions", attentions);
        }
    }
}
