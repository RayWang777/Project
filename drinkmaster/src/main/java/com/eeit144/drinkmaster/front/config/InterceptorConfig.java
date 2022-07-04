package com.eeit144.drinkmaster.front.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.eeit144.drinkmaster.front.Interceptor.LoginInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	private LoginInterceptor loginInterceptor;

	@Autowired
	public InterceptorConfig(LoginInterceptor loginInterceptor) {
		super();
		this.loginInterceptor = loginInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor).addPathPatterns("/front/**")
		.excludePathPatterns("/front/","/front/login**","/front/firm/**","/front/store/**","/front/localstore","/front/comment/**");
	}

}
