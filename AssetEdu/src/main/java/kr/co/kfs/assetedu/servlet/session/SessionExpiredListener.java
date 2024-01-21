package kr.co.kfs.assetedu.servlet.session;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Component;

import kr.co.kfs.assetedu.servlet.security.UserPrincipal;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SessionExpiredListener implements ApplicationListener<SessionDestroyedEvent> {

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
        for (SecurityContext securityContext : event.getSecurityContexts()) {
            Authentication authentication = securityContext.getAuthentication();
            UserPrincipal user = (UserPrincipal) authentication.getPrincipal(); // UserPrincipal is my custom Principal class
            log.debug("user[{}] session expired!" + user.getUsername());
        }
		
	}



}
