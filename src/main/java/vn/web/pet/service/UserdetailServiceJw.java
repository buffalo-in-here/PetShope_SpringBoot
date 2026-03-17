package vn.web.pet.service;

import java.util.Optional;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.web.pet.model.User;
import vn.web.pet.repository.IUserRepository;

@Service
@RequiredArgsConstructor
public class UserdetailServiceJw implements UserDetailsService {

	private final IUserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> opt = userRepository.findByUsernameAndStatusTrue(username);
		if (opt.isPresent()) {
			return opt.get();
		}
		return new User();
	}
}
