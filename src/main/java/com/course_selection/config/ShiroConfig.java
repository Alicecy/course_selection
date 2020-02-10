package com.course_selection.config;


import com.course_selection.realm.CustomRealm;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * Shiro通用化配置
 */
@Configuration
public class ShiroConfig {
    @Bean
    public CustomRealm customRealm(){
        return new CustomRealm();
    }

    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager=new DefaultWebSecurityManager();
        securityManager.setRealm(customRealm());
        return securityManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(){
        ShiroFilterFactoryBean bean=new ShiroFilterFactoryBean();
        bean.setSecurityManager(securityManager());
        bean.setLoginUrl("/to/login");
        bean.setUnauthorizedUrl("/unauth");

        Map<String, String> filterChainDefinitionMap=new HashMap<>();
        filterChainDefinitionMap.put("/to/login","anon");
        filterChainDefinitionMap.put("/**","anon");
        filterChainDefinitionMap.put("/operating","authc");
        filterChainDefinitionMap.put("/search","authc");
        filterChainDefinitionMap.put("/mailbox","authc");
        filterChainDefinitionMap.put("/experiments","authc");
        filterChainDefinitionMap.put("/logout", "logout");
//        filterChainDefinitionMap.put("/*","authc");//访问该链接需要授权

        bean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return bean;
    }
}