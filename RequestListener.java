package listener;

import java.util.logging.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class RequestListener
 *
 */
public class RequestListener implements HttpSessionAttributeListener, ServletContextListener {
	static Logger log = Logger.getLogger("RequestListener");
    /**
     * Default constructor.
     */
    public RequestListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  {
         // TODO Auto-generated method stub
    	log.info("ContextInitialized");
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent event)  {
         // TODO Auto-generated method stub
    	log.info("attributeAdded："+event.getName()+"/"+event.getValue().toString());
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  {
         // TODO Auto-generated method stub
    	log.info("attributeRemoved："+event.getName()+"/"+event.getValue().toString());
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  {
         // TODO Auto-generated method stub
    	log.info("attributeReplaced："+event.getName()+"/"+event.getValue().toString());
    }

    /**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  {
         // TODO Auto-generated method stub
    	log.info("ContextDestroyed");
    }

}
