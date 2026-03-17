package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.SaleOrderProduct;

@Repository
public interface ISaleOrderProductRepository extends JpaRepository<SaleOrderProduct, Integer> {
}
