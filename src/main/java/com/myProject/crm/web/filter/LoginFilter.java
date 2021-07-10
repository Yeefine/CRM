package com.myProject.crm.web.filter;

import com.myProject.crm.settings.domain.User;
import org.apache.ibatis.annotations.Param;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        System.out.println("进入到验证有没有登录过的过滤器");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;


        String path = request.getServletPath();

        if ("/login.jsp".equals(path) || "/user/login.do".equals(path)) {   // 放行
            chain.doFilter(req, resp);
        } else {    // 验证
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user != null) { // 登录过
                chain.doFilter(req, resp);
            } else {    // 非法访问
                response.sendRedirect(request.getContextPath() + "/login.jsp");

            }
        }


    }

    @Override
    public void destroy() {

    }
}
