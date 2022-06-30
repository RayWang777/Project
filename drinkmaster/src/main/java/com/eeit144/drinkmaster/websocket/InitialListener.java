package com.eeit144.drinkmaster.websocket;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


//本Listener由IoC容器控管，所以並未使用@WebListener註釋
public class InitialListener implements ServletContextListener {
	private static final Logger logger = LoggerFactory.getLogger(InitialListener.class);
			
 public void contextInitialized(ServletContextEvent event)  {
     ServletContext context  = event.getServletContext();
     context.setAttribute("contextPath", context.getContextPath());
     logger.info("InitialListener已經啟動...");
 }

 @Override
 public void contextDestroyed(ServletContextEvent sce)  {
 }
}
