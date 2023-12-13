package kr.co.kfs.assetedu.servlet.security;

import java.util.Collection;
import java.util.List;
import java.util.Objects;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.kfs.assetedu.model.Sys01User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserPrincipal implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userId;
	private String username;
	transient private String password;
	transient private Sys01User user;
	private List<GrantedAuthority> authorites;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorites;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof UserPrincipal))
			return false;
		UserPrincipal that = (UserPrincipal) o;
		return username.equals(that.username);
	}

	@Override
	public int hashCode() {
		return Objects.hash(username);
	}

}
