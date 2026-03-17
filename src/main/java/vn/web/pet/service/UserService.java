package vn.web.pet.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.User;
import vn.web.pet.repository.IUserRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {
	private final IUserRepository userRepository;

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User getById(int id) {
		Optional<User> opt = userRepository.findById(id);
		return opt.orElse(null);
	}

	public User saveOrUpdate(User user) {
		return userRepository.save(user);
	}

	public List<User> findAllActive() {
		return userRepository.findByStatusTrue();
	}

	@Transactional
	public void deleteUserById(int id) {
		userRepository.deleteById(id);
	}

	@Transactional
	public int countNewOfMonuth() {
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
		int currentYear = currentDate.getYear();
		return (int) userRepository.countByCreateDateMonthAndYear(currentMonth, currentYear);
	}
}
