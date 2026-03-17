# Nền Tảng Thương Mại Điện Tử PetShop

## Tổng Quan

PetShop là một ứng dụng web thương mại điện tử toàn diện được xây dựng bằng Spring Boot, được thiết kế đặc biệt để bán sản phẩm và vật tư cho thú cưng. Nền tảng cung cấp một giải pháp hoàn chỉnh cho cả khách hàng và quản trị viên với các tính năng bao gồm quản lý danh mục sản phẩm, chức năng giỏ hàng, xử lý đơn hàng và quản lý hàng tồn kho toàn diện.

## Tính Năng

### Tính Năng Dành Cho Khách Hàng
- Duyệt và tìm kiếm sản phẩm thú cưng với các tùy chọn lọc nâng cao
- Hỗ trợ phân trang để điều hướng sản phẩm hiệu quả
- Xem chi tiết sản phẩm với nhận xét và đánh giá
- Quản lý giỏ hàng với chức năng sửa số lượng
- Đặt hàng và theo dõi lịch sử đơn hàng
- Quản lý tài khoản người dùng và đăng ký
- Giao diện đáp ứng cho thiết bị để bàn và di động
- Gửi yêu cầu liên hệ và tư vấn

### Tính Năng Dành Cho Quản Trị Viên
- Quản lý tài khoản người dùng hoàn chỉnh
- Quản lý danh mục sản phẩm (thêm, sửa, xóa, xem)
- Quản lý hàng tồn kho và theo dõi kho
- Quản lý đơn hàng và xử lý đơn hàng
- Quản lý danh mục sản phẩm
- Báo cáo doanh số và phân tích
- Quản lý vai trò và quyền hạn người dùng

## Ngôn Ngữ Công Nghệ

### Backend
- Java 21
- Spring Boot 2.1.6
- Spring Security 5.1.5 (Xác thực & Phauthorization)
- Spring Data JPA (ORM)
- Tomcat 9.0.17 (Máy chủ nhúng)

### Frontend
- JSP (Java Server Pages)
- HTML5
- CSS3
- JavaScript (ES6+)
- Bootstrap Framework

### Cơ Sở Dữ Liệu
- MySQL/MariaDB
- JPA ORM để duy trì dữ liệu

### Quản Lý Dự Án & Công Cụ Build
- Apache Maven 3.x

## Cấu Trúc Dự Án

```
PetShope_SpringBoot/
├── src/
│   ├── main/
│   │   ├── java/vn/web/pet/
│   │   │   ├── Main.java                 (Điểm bắt đầu ứng dụng)
│   │   │   ├── configuration/            (Các lớp cấu hình Spring)
│   │   │   ├── controller/               (Xử lý yêu cầu)
│   │   │   │   ├── frontend/             (Bộ điều khiển khách hàng)
│   │   │   │   └── backend/              (Bộ điều khiển quản trị)
│   │   │   ├── model/                    (Các lớp thực thể)
│   │   │   ├── service/                  (Logic kinh doanh)
│   │   │   ├── repository/               (Tầng truy cập dữ liệu)
│   │   │   └── dto/                      (Đối tượng truyền dữ liệu)
│   │   ├── resources/
│   │   │   ├── application.properties    (Cấu hình)
│   │   │   ├── frontend/                 (CSS, JavaScript, Hình ảnh)
│   │   │   └── backend/                  (Tài sản quản trị)
│   │   └── webapp/
│   │       └── WEB-INF/views/            (Các mẫu JSP)
│   │           ├── frontend/             (Trang khách hàng)
│   │           ├── backend/              (Trang quản trị)
│   │           └── common/               (Các thành phần dùng chung)
├── pom.xml                               (Cấu hình Maven)
└── README.md

```

## Yêu Cầu Hệ Thống

- Java Development Kit (JDK) 21 trở lên
- Apache Maven 3.6.0 trở lên
- MySQL Server 5.7 trở lên
- RAM tối thiểu 4GB
- Hệ điều hành Windows, macOS hoặc Linux

## Cài Đặt & Thiết Lập

### 1. Clone Repository
```bash
git clone ...
cd PetShope_SpringBoot
```

### 2. Cấu Hình Cơ Sở Dữ Liệu
Tạo cơ sở dữ liệu MySQL và cập nhật các thuộc tính kết nối trong `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/petshop_db
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=create-drop
```

### 3. Build Dự Án
```bash
mvn clean install
```

### 4. Chạy Ứng Dụng
```bash
mvn spring-boot:run
```

Ứng dụng sẽ khởi động tại `http://localhost:9090`

## Hướng Dẫn Sử Dụng

### Cho Khách Hàng
1. Truy cập trang chủ để duyệt các sản phẩm thú cưng
2. Sử dụng các tùy chọn tìm kiếm và lọc để tìm sản phẩm cụ thể
3. Thêm các sản phẩm mong muốn vào giỏ hàng
4. Xem lại giỏ hàng của bạn và tiến hành thanh toán
5. Hoàn thành quá trình mua hàng
6. Theo dõi đơn hàng của bạn từ tài khoản

### Cho Quản Trị Viên
1. Đăng nhập bằng thông tin đăng nhập của quản trị viên
2. Truy cập bảng điều khiển quản trị
3. Quản lý sản phẩm, danh mục và hàng tồn kho
4. Xử lý và theo dõi đơn hàng của khách hàng
5. Quản lý tài khoản người dùng và quyền hạn
6. Xem báo cáo doanh số và phân tích

## Các Endpoint Chính

### Frontend (Khách Hàng)
- `GET /` - Trang chủ
- `GET /product-list` - Trang danh sách sản phẩm
- `GET /product-detail/{id}` - Trang chi tiết sản phẩm
- `GET /cart-view` - Giỏ hàng
- `POST /checkout` - Thanh toán đơn hàng
- `GET /about` - Trang Về Chúng Tôi
- `GET /faq` - Trang Câu Hỏi Thường Gặp
- `GET /lienhe` - Trang liên hệ

### Backend (Quản Trị)
- `GET /admin/home` - Bảng điều khiển quản trị
- `GET /admin/product-list` - Quản lý sản phẩm
- `GET /admin/category-list` - Quản lý danh mục
- `GET /admin/user-list` - Quản lý người dùng
- `GET /admin/order-list` - Quản lý đơn hàng

## Các Tệp Cấu Hình

- `application.properties` - Cấu hình ứng dụng chính bao gồm kết nối cơ sở dữ liệu, cổng và cài đặt ghi nhật ký

## Tính Năng Bảo Mật

- Xác thực và phân quyền người dùng thông qua Spring Security
- Mã hóa mật khẩu và các phương pháp bảo mật tốt nhất
- Quản lý phiên cho xác thực người dùng
- Kiểm soát truy cập dựa trên vai trò (RBAC) cho các tính năng của quản trị viên
- Bảo vệ chống lại các lỗ hổng web phổ biến

## Sơ Đồ Cơ Sở Dữ Liệu

Ứng dụng sử dụng các thực thể JPA để quản lý các thực thể cốt lõi sau:
- User (Tài khoản khách hàng và quản trị viên)
- Product (Thông tin sản phẩm và hàng tồn kho)
- Category (Phân loại sản phẩm)
- Order (Đơn hàng của khách hàng)
- OrderDetail (Chi tiết sản phẩm trong đơn hàng)
- Rating/Review (Đánh giá sản phẩm)

## Build & Triển Khai

### Build Tệp WAR
```bash
mvn clean package -DskipTests
```

### Triển Khai tới Tomcat
Sao chép tệp WAR được tạo từ thư mục `target/` vào thư mục `webapps/` của Tomcat và khởi động lại Tomcat.

## Khắc Phục Sự Cố

### Các Vấn Đề Phổ Biến

1. **Lỗi Kết Nối Cơ Sở Dữ Liệu**
   - Xác minh rằng dịch vụ MySQL đang chạy
   - Kiểm tra thông tin xác thực cơ sở dữ liệu trong `application.properties`
   - Đảm bảo cơ sở dữ liệu tồn tại và có thể truy cập

2. **Cổng Đã Được Sử Dụng**
   - Thay đổi cổng trong `application.properties`: `server.port=8080`
   - Hoặc buộc kết thúc tiến trình sử dụng cổng 9090

3. **Vấn Đề Biên Dịch JSP**
   - Xóa bộ đệm Maven: `mvn clean`
   - Xây dựng lại dự án: `mvn install`

## Cân Nhắc Về Hiệu Suất

- Phân trang được triển khai để truy xuất dữ liệu hiệu quả
- Tải lười cho các thực thể liên quan
- Pooling kết nối để tối ưu hóa cơ sở dữ liệu
- Các chiến lược bộ đệm cho dữ liệu được truy cập thường xuyên

## Các Cải Tiến Trong Tương Lai

- Tích hợp với các cổng thanh toán (Stripe, PayPal)
- Hệ thống thông báo email cho đơn hàng
- Bảng điều khiển phân tích và báo cáo nâng cao
- Theo dõi hàng tồn kho với cảnh báo
- Công cụ đề xuất khách hàng dựa trên lịch sử mua hàng
- Phát triển ứng dụng di động

## Đóng Góp

Chúng tôi hoan nghênh các đóng góp. Vui lòng tuân theo cấu trúc mã hiện có và các quy ước đặt tên.

## Giấy Phép

Dự án này được cung cấp cho mục đích sử dụng giáo dục và thương mại.

## Liên Hệ & Hỗ Trợ

Để có câu hỏi, báo cáo lỗi hoặc yêu cầu tính năng, vui lòng liên hệ với nhóm phát triển hoặc mở một vấn đề trong repository.

---

**Phiên bản:** 1.0.0  
**Cập nhật lần cuối:** Tháng 3 năm 2026  
**Được duy trì bởi:** Nhóm phát triển  
