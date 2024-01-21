package kr.co.kfs.assetedu.servlet.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Sys01User;

@Service
public class SecurityUserDetailsService implements UserDetailsService {

//	@Autowired
//	private Sys01UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//admin userid로 로그인한 경우 ROLE_ADMIN을 부여한다. 
		String role = "ROLE_MEMBER";
		Sys01User foundUser = null;
		if("admin".equals(username)) {
			foundUser = new Sys01User();
			foundUser.setSys01UserId(username);
			foundUser.setSys01UserNm("관리자");
			foundUser.setSys01Pwd(passwordEncoder.encode("1111"));
			role = "ROLE_ADMIN";
		}else {
//			Sys01User user = new Sys01User();
//			user.setSys01UserId(username);
//			foundUser = userService.selectOne(user);
//			if(foundUser == null) {
//				throw new UsernameNotFoundException(username + " not found");
//			}
		}
		
		List<GrantedAuthority> authorites = new ArrayList<GrantedAuthority>();
		authorites.add(new SimpleGrantedAuthority(role));
		
		return UserPrincipal.builder()
		.userId(foundUser.getSys01UserId())
		.username(foundUser.getSys01UserNm())
		.password(foundUser.getSys01Pwd())
		.user(foundUser)
		.authorites(authorites)
		.build();	
	}

}
