package com.course_selection.controller;


import com.course_selection.mapper.TeacherMapper;
import com.course_selection.pojo.Teacher;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class TeacherController extends HttpServlet {

    private static final Logger log= LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private Environment environment;

    @Autowired
    private TeacherMapper teacherMapper;

    @RequestMapping(value = {"/teacher/login_teacher","/unauth"})
    public String toLogin_teacher(){
        return "login_teacher";
    }

    /**
     * 教师登陆真证
     * @param tid
     * @param password
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/login_teacher",method = RequestMethod.POST)
    public String loginTeacher(@RequestParam Integer tid, @RequestParam String password, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response ) {
        String errorMeg="";
        try{
            if(!SecurityUtils.getSubject().isAuthenticated()){
                String tid_02=tid.toString();
                String newPwd=new Md5Hash(password,environment.getProperty("shiro.encrypt.password.salt")).toString();
                UsernamePasswordToken token=new UsernamePasswordToken(tid_02,newPwd);
                SecurityUtils.getSubject().login(token);
            }
        }catch (UnknownAccountException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("tid",tid);
            log.info("错误是：",errorMeg);
        }catch (DisabledAccountException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("tid",tid);
            log.info("错误是：",errorMeg);
        }catch (IncorrectCredentialsException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("tid",tid);
            log.info("错误是：",errorMeg);
        }catch (Exception e){
            errorMeg="用户登录异常，请联系管理员!";
            e.printStackTrace();
            log.info("错误是：",errorMeg);
        }
        if(StringUtils.isBlank(errorMeg)){

            errorMeg=null;
            modelMap.addAttribute("errorMeg",errorMeg);
            Teacher teacher=teacherMapper.findByTid(tid);
            request.getSession(false).setAttribute("teacher", teacher);
            return "redirect:homepage_teacher";
        }else{
            modelMap.addAttribute("errorMeg",errorMeg);
            return "login_teacher";
        }

    }

    @RequestMapping(value = {"/logout_teacher"})
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "login_teacher";
    }


}
