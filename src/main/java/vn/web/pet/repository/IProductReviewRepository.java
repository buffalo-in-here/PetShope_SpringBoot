package vn.web.pet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.web.pet.model.ProductReview;

@Repository
public interface IProductReviewRepository extends JpaRepository<ProductReview, Integer> {

	List<ProductReview> findByProduct_IdAndStatusTrue(Integer productId);

	List<ProductReview> findByStatusTrue();

	@Query("SELECT AVG(pr.rating) FROM ProductReview pr WHERE pr.product.id = :productId AND pr.status = true")
	Double getAverageRating(@Param("productId") Integer productId);

	@Query("SELECT COUNT(pr) FROM ProductReview pr WHERE pr.product.id = :productId AND pr.status = true")
	Integer countByProductId(@Param("productId") Integer productId);
}
