package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import controller.action.Action;

/**
 * Application Lifecycle Listener implementation class ActionMapper
 *
 */
public class ActionMapping implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ActionMapping() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	ServletContext context = arg0.getServletContext();
    	String filename = context.getInitParameter("filename");
    	
    	Properties prop = new Properties();
    	try {
			prop.load(context.getResourceAsStream(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	Iterator<Object> it = prop.keySet().iterator();
    	String key = null;
    	Action action = null;
    	HashMap<String,Action> mapper = new HashMap<String,Action>();
    	while(it.hasNext()){
    		key = (String) it.next();
    		try {
				action = (Action) Class.forName(prop.getProperty(key)).newInstance();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
    		mapper.put(key, action);
    	}
    	
    	context.setAttribute("mapper", mapper);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
