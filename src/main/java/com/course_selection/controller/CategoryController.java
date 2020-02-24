package com.course_selection.controller;

import com.course_selection.mapper.*;
import com.course_selection.pojo.*;
import com.course_selection.service.impl.CourseServiceImpl;
import com.course_selection.util.WeekUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    private LostFoundMapper lostfoundMapper;
    @Autowired
    private WeekMapper weekMapper;
    @Autowired
    private ExperimentMapper experimentMapper;
    @Autowired
    private CourseServiceImpl courseService;
    @Autowired
    private MailboxMapper mailboxMapper;
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private PostMapper postMapper;

    @RequestMapping("/lostfound")
    public String lostfound(Model m,
                            @RequestParam(value = "start", defaultValue = "0")
                                    int start, @RequestParam(value = "size", defaultValue = "5")
                                    int size) throws Exception {
        PageHelper.startPage(start, size, "id desc");//根据start,size进行分页，并且设置id 倒排序
        List<Lost_Found> lf = lostfoundMapper.findalllost_found();
        PageInfo<Lost_Found> page = new PageInfo<>(lf);//根据返回的集合，创建PageInfo对象
        m.addAttribute("page", page);
        return "lostfound";
    }

    @RequestMapping("/mailbox")
    public String mailbox(HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        Student student = (Student) request.getSession().getAttribute("student");
        if (null == student) {
            return "login";
        }
        HttpSession session = request.getSession();//获取session内容
        Integer sid = ((Student) session.getAttribute("student")).getSid();
        List<Mailbox> mail = mailboxMapper.findMail(sid);
        request.getSession(false).setAttribute("mail", mail);
        return "mailbox";
    }

    @RequestMapping("/message")
    public String message(HttpServletRequest request) throws Exception {
        List<Message> messages = messageMapper.findMessage();
        request.getSession(false).setAttribute("mes", messages);
        return "message";
    }

    @RequestMapping("/experiments")
    public String experiments() {
        return "schedule_experiments";
    }

    @RequestMapping("/operating")
    public String operating(HttpServletResponse response, HttpServletRequest request) {
        Student student = (Student) request.getSession().getAttribute("student");
        if (null == student) {
            return "login";
        }
        getTime(request);
        return "schedule_operating";
    }

    @RequestMapping("/search")
    public String search(HttpServletResponse response, HttpServletRequest request) {
        Student student = (Student) request.getSession().getAttribute("student");
        if (null == student) {
            return "login";
        }
        List<Selection_Information> sis = courseService.selected(student.getSid());
        request.setAttribute("sis", sis);
        getTime(request);
        return "search_operating";
    }

    @RequestMapping({"/homepage", "/"})
    public String homepage(HttpServletRequest request, HttpServletResponse response) {
        getInformation(request);
        return "homePage";
    }

    @RequestMapping("/query_teacher")
    public String query_teacher() {
        return "query_teacher";
    }

    //教师主页
    @RequestMapping({"/homepage_teacher", "/teacher_channel"})
    public String homepage_teacher(HttpServletRequest request) {
        getInformation(request);
        return "homePage_teacher";
    }

    @RequestMapping("/lostfound_teacher")
    public String lostfound_teacher(Model m,HttpServletRequest request,
                            @RequestParam(value = "start", defaultValue = "0")
                                    int start, @RequestParam(value = "size", defaultValue = "5")
                                    int size) throws Exception {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        PageHelper.startPage(start, size, "id desc");//根据start,size进行分页，并且设置id 倒排序
        List<Lost_Found> lf = lostfoundMapper.findalllost_found();
        PageInfo<Lost_Found> page = new PageInfo<>(lf);//根据返回的集合，创建PageInfo对象
        m.addAttribute("page", page);
        return "lostfound_teacher";
    }

    //    发布注意事项
    @RequestMapping("/post_notes")
    public String post_notes(HttpServletRequest request) throws Exception {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        List<PostNote> posts = postMapper.findAttention();
        request.getSession(false).setAttribute("attention", posts);
        return "post_notes";
    }

    //    发布信息主目录
    @RequestMapping("/post_content")
    public String post_content(HttpServletRequest request) {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        return "post_content";
    }

    //    发布通知
    @RequestMapping("/post_notice")
    public String post_notice(HttpServletRequest request) throws Exception {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        List<PostNote> posts = postMapper.findNotice();
        request.getSession(false).setAttribute("notice", posts);
        return "post_notice";
    }

    //    发布实验室守则
    @RequestMapping("/post_rules")
    public String post_rules(HttpServletRequest request) throws Exception {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        List<PostNote> posts = postMapper.findRule();
        request.getSession(false).setAttribute("rules", posts);
        return "post_rules";
    }

    //    发布实验室开放信息
    @RequestMapping("/post_openInfo")
    public String post_openInfo(HttpServletRequest request) {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        List<Experiment> posts = postMapper.findOpenInfo();
        request.getSession(false).setAttribute("open", posts);
        return "post_openInfo";
    }

    //回复留言
    @RequestMapping("/reply_message")
    public String reply_message(HttpServletRequest request, HttpServletResponse response, @Param("reply") String reply, @Param("id") Integer id) {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String reply_time = sdf.format(new Date());
        messageMapper.addReply(reply, reply_time, id);
        List<Message> messages = messageMapper.findMessage();
        request.getSession(false).setAttribute("mes", messages);
        return "reply_message";
    }

    //重置密码
    @RequestMapping("/reset_password")
    public String reset_password(HttpServletRequest request) {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        return "reset_password";
    }

    //设置开学日期
    @RequestMapping("/set_startDate")
    public String set_startDate(HttpServletRequest request) {
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        School_Hours school_hours = weekMapper.findDay();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String time = sdf.format(school_hours.getDate());
        request.setAttribute("time", time);
        return "set_startDate";
    }

    @RequestMapping("/query_student_subscribe")
    public String query_student(HttpServletRequest request){
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        return "query_student_subscribe";
    }
    @RequestMapping("/query_teacher_teacher")
    public String query_teacher_T(HttpServletRequest request){
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if (null == teacher) {
            return "login_teacher";
        }
        return "query_teacher_teacher";
    }

    void getInformation(HttpServletRequest request) {
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);
        List<Experiment> experiments = (List<Experiment>) redisTemplate.opsForValue().get("experiments");
        List<PostNote> notices = (List<PostNote>) redisTemplate.opsForValue().get("notices");
        List<PostNote> attentions = (List<PostNote>) redisTemplate.opsForValue().get("attentions");
        List<PostNote> rules = (List<PostNote>) redisTemplate.opsForValue().get("rules");
        if (notices == null) {
            synchronized (this) {
                notices = (List<PostNote>) redisTemplate.opsForValue().get("notices");
                if (notices == null) {
                    System.out.println("查询数据库");
                    notices = postMapper.findNotice();
                    redisTemplate.opsForValue().set("notices", notices);
                } else {
                    System.out.println("查询Redis");
                }
            }
        } else {
            System.out.println("查询Redis");
        }
        if (attentions == null) {
            synchronized (this) {
                attentions = (List<PostNote>) redisTemplate.opsForValue().get("attentions");
                if (attentions == null) {
                    System.out.println("查询数据库");
                    attentions = postMapper.findAttention();
                    redisTemplate.opsForValue().set("attentions", attentions);
                } else {
                    System.out.println("查询Redis");
                }
            }
        } else {
            System.out.println("查询Redis");
        }
        if (rules == null) {
            synchronized (this) {
                rules = (List<PostNote>) redisTemplate.opsForValue().get("rules");
                if (rules == null) {
                    System.out.println("查询数据库");
                    rules = postMapper.findRule();
                    redisTemplate.opsForValue().set("rules", rules);
                } else {
                    System.out.println("查询Redis");
                }
            }
        } else {
            System.out.println("查询Redis");
        }

        if (experiments == null) {
            synchronized (this) {
                experiments = (List<Experiment>) redisTemplate.opsForValue().get("experiments");
                if (experiments == null) {
                    System.out.println("查询数据库");
                    experiments = experimentMapper.findAllE();
                    redisTemplate.opsForValue().set("experiments", experiments);
                } else {
                    System.out.println("查询Redis");
                }
            }
        } else {
            System.out.println("查询Redis");
        }
        request.setAttribute("experiments", experiments);
        request.setAttribute("notice", notices);
        request.setAttribute("attentions", attentions);
        request.setAttribute("rules", rules);
        getTime(request);
    }



    public void getTime(HttpServletRequest request){
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);
        School_Hours school_hours = (School_Hours) redisTemplate.opsForValue().get("school_hours");
        if (school_hours == null) {
            synchronized (this) {
                school_hours = (School_Hours) redisTemplate.opsForValue().get("school_hours");
                if (school_hours == null) {
                    System.out.println("查询数据库");
                    school_hours = weekMapper.findDay();
                    redisTemplate.opsForValue().set("school_hours", school_hours);
                } else {
                    System.out.println("查询Redis");
                }
            }
        } else {
            System.out.println("查询Redis");
        }
        long nowWeek = new WeekUtil().countWeek(school_hours);
        request.setAttribute("nowWeek",nowWeek);
    }

}
