package com.yukino.bilibili;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

/**
 * Application Lifecycle Listener implementation class VisitsListener
 *
 */
@WebListener
public class VisitsListener implements ServletContextListener, ServletRequestListener {

    /**
     * Default constructor. 
     */
    public VisitsListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent sre)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent sre)  {
    	HttpServletRequest request = (HttpServletRequest)sre.getServletRequest();
        String url = request.getRequestURL().toString();
        //ajaxµÄÇëÇó²»Ëã
        if(url.endsWith("/rt") == true) {
            return;
        }
         List<String> timeList = (List)sre.getServletContext().getAttribute("timeList");
         List<Integer> valueList = (List)sre.getServletContext().getAttribute("valueList");
         Date date = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
         String time = sdf.format(date);
         
         if(timeList.indexOf(time) == -1) {
        	 timeList.add(time);
        	 valueList.add(1);
        	 sre.getServletRequest().setAttribute("timeList", timeList);
        	 sre.getServletRequest().setAttribute("valueList", valueList);
         }else {
        	 int index = timeList.indexOf(time);
        	 int value = valueList.get(index);
        	 valueList.set(index, value+1);
        	 sre.getServletRequest().setAttribute("valueList", valueList);
         }
         
         System.out.println("timeList:"+timeList);
         System.out.println("valueList:"+valueList);
         
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         List timeList = new ArrayList();
         List valueList = new ArrayList();
         sce.getServletContext().setAttribute("timeList", timeList);
         sce.getServletContext().setAttribute("valueList", valueList);
         
    }
    
    
	
}
