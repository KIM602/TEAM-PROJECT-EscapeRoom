package com.EscapeRoom.admin.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;
import com.EscapeRoom.admin.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ProjectAdminDao edao = Constant.edao;
		
		ProjectAdminJoinDto dto = edao.login(username);
		System.out.println("dto : " + dto);
		
		if( dto == null ) {
			System.out.println("security에서 dto null로 로그인 실패");
			throw new UsernameNotFoundException("No user found with username");
		}
		String pw = dto.getPpw();
		String auth = dto.getAuth();
		System.out.println("pw : " + pw + " auth : " + auth);
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority(auth));
		
		UserDetails user = new User(username, pw, roles);
		return user;
		
	}

}
