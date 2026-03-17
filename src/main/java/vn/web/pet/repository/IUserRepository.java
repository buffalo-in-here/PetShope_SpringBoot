package vn.web.pet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.web.pet.model.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface IUserRepository extends JpaRepository<User, Integer> {

    Optional<User> findByUsernameAndStatusTrue(String username);

    // Tìm tất cả user có status = true
    List<User> findByStatusTrue();
    
    // Đếm số user được tạo trong tháng và năm cụ thể
    @Query("SELECT COUNT(u) FROM User u WHERE MONTH(u.createDate) = :month AND YEAR(u.createDate) = :year")
    long countByCreateDateMonthAndYear(@Param("month") int month, @Param("year") int year);
}
