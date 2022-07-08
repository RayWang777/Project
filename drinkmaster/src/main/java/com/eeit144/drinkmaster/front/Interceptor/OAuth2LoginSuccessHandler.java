package com.eeit144.drinkmaster.front.Interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit144.drinkmaster.back.model.UserService;
import com.eeit144.drinkmaster.bean.AuthenticationProvider;
import com.eeit144.drinkmaster.bean.UserBean;
@Component
@SessionAttributes(names= {"canSeeUser"})
public class OAuth2LoginSuccessHandler  extends SimpleUrlAuthenticationSuccessHandler{
		@Autowired
	private UserService userService;
	
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request ,HttpServletResponse response
				,Authentication authentication) throws IOException,ServletException{
			UserOAuth2 user = (UserOAuth2) authentication.getPrincipal();
			String email =user.getEmail();
			String name= user.getFullName();
			UserBean user1 = userService.findAllByUserAccount(email);
			System.out.println("customer email=" +email); 
			System.out.println("my name is" + name);
			if(user1==null) {
				userService.createNewCustomerAfterOAuthLoginSuccess(email,name,AuthenticationProvider.GOOGLE);
				 
			}
			else {
				userService.updateCustomerAfterLogin(email,name,AuthenticationProvider.GOOGLE);
			}
			    UserBean nowUser =userService.findAllByUserAccount(email);
			    System.out.println(nowUser.getUserName());
			  
			HttpSession session= request.getSession();
			session.setAttribute("canSeeUser", nowUser);
			
			
			super.onAuthenticationSuccess(request, response, authentication);
			}
}
