//package com.dentaire.demo;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationListener;
//import org.springframework.security.core.session.SessionDestroyedEvent;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Component;
//
//
//import com.twins.dao.UserRepository;
//import com.twins.model.User;
//
//import org.springframework.security.core.context.SecurityContext;
//
//
//
//
//@Component
//public class LogoutListener implements ApplicationListener<SessionDestroyedEvent> {
//	
//	@Autowired
//	private UserRepository userRepository;
//	
//
//	@Override
//	public void onApplicationEvent(SessionDestroyedEvent event) {
//		
//		List<SecurityContext> lstSecurityContext = event.getSecurityContexts();
//        UserDetails ud;
//        for (SecurityContext securityContext : lstSecurityContext)
//        {
//            ud = (UserDetails) securityContext.getAuthentication().getPrincipal();
//            User u = userRepository.ifExistsEmail(ud.getUsername());
//            if(u != null)
//            {
//            	 u.setActive("non");
//            }
//           
//            userRepository.save(u);
//            
//            // ...
//            System.out.println("it is deconnected automaticly " + ud.getUsername() );
//             
//        }
//	}
//
//}
