package com.eeit144.drinkmaster.front.Interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.eeit144.drinkmaster.bean.UserBean;
import com.eeit144.drinkmaster.front.controller.FrontUserController;
import com.sun.istack.Nullable;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(FrontUserController.class);
	
	public LoginInterceptor() {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		
		if(uri.equals("/drinkmaster/front/loginGo") || uri.equals("/drinkmaster/front/login") || uri.equals("/drinkmaster/front/")) {
//			System.out.println("123");
			return true;
		}
//		System.out.println(uri);
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("canSeeUser");
		
		if(user != null) {
			logger.info(user.getUserAccount()+"登入 時間為"+ new Date());
			return true;
		}
		else {
			response.sendRedirect("/drinkmaster/front/login");
			return false;
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}

}
