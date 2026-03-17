package vn.web.pet.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.web.pet.model.Product;
import vn.web.pet.model.ProductReview;
import vn.web.pet.model.User;
import vn.web.pet.repository.IProductReviewRepository;

@Service
public class ProductReviewService {

	@Autowired
	private IProductReviewRepository productReviewRepository;

	public List<ProductReview> findAll() {
		return productReviewRepository.findAll();
	}

	public ProductReview getById(Integer id) {
		Optional<ProductReview> opt = productReviewRepository.findById(id);
		return opt.orElse(null);
	}

	public ProductReview saveOrUpdate(ProductReview productReview) {
		return productReviewRepository.save(productReview);
	}

	public void delete(Integer id) {
		productReviewRepository.deleteById(id);
	}

	public List<ProductReview> getReviewsByProductId(Integer productId) {
		return productReviewRepository.findByProduct_IdAndStatusTrue(productId);
	}

	public Double getAverageRating(Integer productId) {
		Double avg = productReviewRepository.getAverageRating(productId);
		return avg != null ? avg : 0.0;
	}

	public Integer getReviewCount(Integer productId) {
		Integer count = productReviewRepository.countByProductId(productId);
		return count != null ? count : 0;
	}

	public ProductReview createReview(Product product, User user, Integer rating, String comment) {
		ProductReview review = new ProductReview();
		review.setProduct(product);
		review.setUser(user);
		review.setRating(rating);
		review.setComment(comment);
		review.setStatus(true);
		review.setCreateDate(new Date());
		review.setUpdateDate(new Date());
		return productReviewRepository.save(review);
	}
}
