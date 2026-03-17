package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.Product;

import java.util.List;

@Repository
public interface IProductRepository extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product> {

    List<Product> findByStatusTrue();

    @Query("SELECT COUNT(p) FROM Product p WHERE MONTH(p.createDate) = :month AND YEAR(p.createDate) = :year")
    long countByCreateDateMonthAndYear(@Param("month") int month, @Param("year") int year);

    List<Product> findByNameContainingIgnoreCase(String name);

    List<Product> findByCategory_Id(int categoryId);
}
