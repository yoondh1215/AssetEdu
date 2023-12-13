package kr.co.kfs.assetedu.servlet.session;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Value;


public class SessionListener implements HttpSessionListener{

	@Value("${server.servlet.session.timeout}")
	private int sessionTime;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		se.getSession().setMaxInactiveInterval(sessionTime);
		HttpSessionListener.super.sessionCreated(se);
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSessionListener.super.sessionDestroyed(se);
	}

}
