package vn.web.pet.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.stereotype.Service;

import vn.web.pet.model.PersistentRememberMeToken;
import vn.web.pet.repository.PersistentRememberMeTokenRepository;

/**
 * Custom Persistent Token Repository using JPA
 */
@Service
public class JpaPersistentTokenRepository implements PersistentTokenRepository {

	@Autowired
	private PersistentRememberMeTokenRepository tokenRepository;

	@Override
	public void createNewToken(
			org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken token) {
		PersistentRememberMeToken newToken = new PersistentRememberMeToken(
				token.getSeries(),
				token.getUsername(),
				token.getTokenValue(),
				token.getDate()
		);
		tokenRepository.save(newToken);
	}

	@Override
	public void updateToken(String series, String tokenValue, Date lastUsed) {
		PersistentRememberMeToken token = tokenRepository.findById(series).orElse(null);
		if (token != null) {
			token.setToken(tokenValue);
			token.setLastUsed(lastUsed);
			tokenRepository.save(token);
		}
	}

	@Override
	public org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken
		getTokenForSeries(String seriesId) {
		PersistentRememberMeToken token = tokenRepository.findById(seriesId).orElse(null);
		if (token != null) {
			return new org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken(
					token.getUsername(),
					token.getSeries(),
					token.getToken(),
					token.getLastUsed()
			);
		}
		return null;
	}

	@Override
	public void removeUserTokens(String username) {
		PersistentRememberMeToken token = tokenRepository.findByUsername(username);
		if (token != null) {
			tokenRepository.delete(token);
		}
	}
}
