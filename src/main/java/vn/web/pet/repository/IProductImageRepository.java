package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.ProductImage;

import java.util.List;

@Repository
public interface IProductImageRepository extends JpaRepository<ProductImage, Integer> {

    List<ProductImage> findByProduct_Id(int productId);
}
