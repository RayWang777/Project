package com.eeit144.drinkmaster.front.aop;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.eeit144.drinkmaster.bean.UserBean;


@Aspect
@Component
public class LogAop {
	
	private final Logger logger = LoggerFactory.getLogger(LogAop.class);
	
	@Pointcut("execution(public * com.eeit144.drinkmaster.front.controller..*.*(..))")
	public void controllerLog() {}
	
	
	@Before("controllerLog()")
	public void  logBefore(JoinPoint joinPoint) {
//		System.out.println("執行"+joinPoint.getSignature().getDeclaringTypeName()+"類別"+joinPoint.getSignature().getName()+"時間:"+new Date());
		logger.info(joinPoint.getSignature().getDeclaringTypeName()+"類別"+joinPoint.getSignature().getName()+"時間:"+new Date());
//		String methodName = getMethodName(joinPoint);
//		System.out.println(methodName);
		
		return; 
	}
	
	
	
	
//	private String getMethodName(JoinPoint joinPoint) {
//        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
//        return signature.getName();
//    }
//	
		
}
