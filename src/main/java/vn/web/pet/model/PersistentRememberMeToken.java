package vn.web.pet.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_persistent_login")
public class PersistentRememberMeToken {

	@Id
	@Column(name = "series", length = 64)
	private String series;

	@Column(name = "username", length = 120, nullable = false)
	private String username;

	@Column(name = "token", length = 64, nullable = false)
	private String token;

	@Column(name = "last_used", nullable = false)
	private Date lastUsed;

	public PersistentRememberMeToken() {
	}

	public PersistentRememberMeToken(String series, String username, String token, Date lastUsed) {
		this.series = series;
		this.username = username;
		this.token = token;
		this.lastUsed = lastUsed;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getLastUsed() {
		return lastUsed;
	}

	public void setLastUsed(Date lastUsed) {
		this.lastUsed = lastUsed;
	}
}
