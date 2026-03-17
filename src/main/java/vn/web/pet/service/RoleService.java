package vn.web.pet.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.Role;
import vn.web.pet.repository.IRoleRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class RoleService {

	private final IRoleRepository roleRepository;

	public List<Role> findAll() {
		return roleRepository.findAll();
	}

	public Role getById(int id) {
		Optional<Role> opt = roleRepository.findById(id);
		return opt.orElse(null);
	}

	public Role saveOrUpdate(Role role) {
		return roleRepository.save(role);
	}

	public Role getRoleByName(String name) {
		Optional<Role> opt = roleRepository.findByName(name);
		return opt.orElse(new Role());
	}

	@Transactional
	public void deleteRoleById(int id) {
		roleRepository.deleteById(id);
	}

	@Transactional
	public void inactiveRole(Role role) {
		roleRepository.save(role);
	}
}
