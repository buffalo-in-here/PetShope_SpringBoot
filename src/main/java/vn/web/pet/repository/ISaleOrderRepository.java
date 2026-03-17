package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.SaleOrder;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ISaleOrderRepository extends JpaRepository<SaleOrder, Integer> {

    List<SaleOrder> findByStatusTrue();

    @Query(value = "SELECT COALESCE(SUM(total), 0) FROM tbl_sale_order WHERE MONTH(create_date) = :month AND YEAR(create_date) = :year", nativeQuery = true)
    BigDecimal sumTotalByCreateDateMonthAndYear(@Param("month") int month, @Param("year") int year);
}
