package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.web.pet.model.PersistentRememberMeToken;

@Repository
public interface PersistentRememberMeTokenRepository extends JpaRepository<PersistentRememberMeToken, String> {

	PersistentRememberMeToken findByUsername(String username);

	PersistentRememberMeToken findBySeriesAndUsername(String series, String username);
}
