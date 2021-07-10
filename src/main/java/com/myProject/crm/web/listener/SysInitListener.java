package com.myProject.crm.web.listener;

import com.myProject.crm.settings.dao.DicTypeDao;
import com.myProject.crm.settings.dao.DicValueDao;
import com.myProject.crm.settings.domain.DicType;
import com.myProject.crm.settings.domain.DicValue;
import com.myProject.crm.settings.service.impl.DicServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class SysInitListener implements ServletContextListener {
    /*
        该方法是用来监听上下文域对象的方法，当服务器启动，上下文域对象创建
        对象创建完毕后，马上执行该方法

        event: 该参数能够取得监听的对象
               监听的是什么对象，就可以通过该参数能取得什么对象
               例如现在监听的是上下文域对象，通过该参数就可以取得上下文域对象
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {

//         System.out.println("上下文域对象创建了");
        System.out.println("服务器缓存处理数据字典开始");

//        ServletContext application = event.getServletContext();
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());

        // 获取bean
        DicTypeDao dicTypeDao = context.getBean(DicTypeDao.class);
        DicValueDao dicValueDao = context.getBean(DicValueDao.class);
        DicServiceImpl ds = context.getBean(DicServiceImpl.class);
        ds.setDicTypeDao(dicTypeDao);
        ds.setDicValueDao(dicValueDao);
//        DicTypeDao dicTypeDao = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(DicTypeDao.class);
//        DicValueDao dicValueDao = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(DicValueDao.class);


        Map<String, List<DicValue>> map = ds.getAll();

        ServletContext application = sce.getServletContext();
        Set<String> set = map.keySet();
        for (String key : set) {
            application.setAttribute(key, map.get(key));
        }


        System.out.println("服务器缓存处理数据字典结束");


        //--------------------------------------------------
        // 数据字典处理完毕之后，处理Stage2Possibility.properties文件
        /*
            处理Stage2Possibility.properties文件步骤：
                解析该文件，将该属性文件中的键值对关系处理成为java中键值对关系（map）

                Map<String(阶段stage), String(可能性possibility)> pMap = ....
                pMap.put(..., ...)
                ...

                pMap保存值之后，放在服务器缓存中
                application.setAttribute("pMap", pMap);
         */
        Map<String, String> pMap = new HashMap<>();

        ResourceBundle rb = ResourceBundle.getBundle("conf/Stage2Possibility");

        Enumeration<String> e = rb.getKeys();

        while (e.hasMoreElements()) {
            // 阶段
            String key = e.nextElement();
            // 可能性
            String value = rb.getString(key);

            pMap.put(key, value);
        }
        // 将pMap保存到服务器缓存中
        application.setAttribute("pMap", pMap);
        System.out.println("pMap缓存完毕");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
