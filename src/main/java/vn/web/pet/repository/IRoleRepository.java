package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.Role;

import java.util.Optional;

@Repository
public interface IRoleRepository extends JpaRepository<Role, Integer> {

    Optional<Role> findByName(String name);
}
