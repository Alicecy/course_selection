package com.course_selection.controller;

import com.course_selection.mapper.StudentMapper;
import com.course_selection.pojo.Student;
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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController extends HttpServlet {
    private static final Logger log= LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = {"/to/login","/unauth"})
    public String toLogin(){
        return "login";
    }


    @Autowired
    private StudentMapper studentMapper;


    @Autowired
    private Environment environment;

    /**
     * 学生登陆真证
     * @param sid
     * @param password
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam Integer sid, @RequestParam String password, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response )
            throws IOException, InterruptedException {
        String errorMeg="";
        try{
            if(!SecurityUtils.getSubject().isAuthenticated()){
                String sid_02=sid.toString();
                String newPwd=new Md5Hash(password,environment.getProperty("shiro.encrypt.password.salt")).toString();
                UsernamePasswordToken token=new UsernamePasswordToken(sid_02,newPwd);
                SecurityUtils.getSubject().login(token);
            }
        }catch (UnknownAccountException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("sid",sid);
            log.info("错误是：",errorMeg);
        }catch (DisabledAccountException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("sid",sid);
            log.info("错误是：",errorMeg);
        }catch (IncorrectCredentialsException e){

            errorMeg=e.getMessage();
            modelMap.addAttribute("sid",sid);
            log.info("错误是：",errorMeg);
        }catch (Exception e){
            errorMeg="用户登录异常，请联系管理员!";
            e.printStackTrace();
            log.info("错误是：",errorMeg);
        }
        if(StringUtils.isBlank(errorMeg)){

            errorMeg=null;
            modelMap.addAttribute("errorMeg",errorMeg);

            Student student=studentMapper.findBySid(sid);

            request.getSession(false).setAttribute("student", student);
            return "redirect:/homepage";
        }else{
            modelMap.addAttribute("errorMeg",errorMeg);
            return "login";
        }
    }



    @RequestMapping(value = {"/updateStudent"})
    public String changePassword(HttpServletRequest request, HttpServletResponse response){

        Student student=(Student) request.getSession().getAttribute("student");
        if(student==null){
            return "homePage";
        }
        request.getSession(false).setAttribute("student", student);

        return "updatePassword";
    }

    @RequestMapping(value = {"changePassword"},method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changePassword(HttpServletRequest request, HttpServletResponse response,
                                              @RequestParam("sid") Integer sid,
                                              @RequestParam("sname") String sname,
                                              @RequestParam("password") String password,
                                              @RequestParam("password_new") String password_new) {
        Map<String, String> ret = new HashMap<String, String>();
        if(password_new!=""){
            String newPwd=new Md5Hash(password,environment.getProperty("shiro.encrypt.password.salt")).toString();

            Student student=(Student) request.getSession().getAttribute("student");
            System.out.println(student.getPassword());
            System.out.println(newPwd);
            //cdcec07ef9f12801cb8c9cf328340397
            if (student.getPassword().equals(newPwd)) {
                String salt="92dd90534a404926b50a43c7a3c5b79e";
                password_new=new Md5Hash(password_new,salt).toString();
                studentMapper.changePassword(sid, password, password_new, student.getId());
                ret.put("type", "success");
                ret.put("msg", "修改密码成功!");
                return ret;
            }
        }
        ret.put("type", "error");
        ret.put("msg", "更改密码失败!");
        return ret;
    }

    @RequestMapping(value = {"/logout"})
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "login";
    }


}
