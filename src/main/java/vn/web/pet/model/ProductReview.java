package vn.web.pet.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product_review")
public class ProductReview extends BaseModel {

	@Column(name = "rating", nullable = false)
	private Integer rating; // 1-5 stars

	@Column(name = "comment", length = 1000, nullable = true)
	private String comment;

	// Mapping many-to-one: tbl_product_review-to-tbl_product
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;

	// Mapping many-to-one: tbl_product_review-to-tbl_user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public ProductReview() {
		super();
	}

	public ProductReview(Integer id, Date createDate, Date updateDate, Boolean status, Integer rating,
			String comment, Product product, User user) {
		super(id, createDate, updateDate, status);
		this.rating = rating;
		this.comment = comment;
		this.product = product;
		this.user = user;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
