<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Câu Hỏi Thường Gặp - PetShop</title>
    <%-- CSS --%>
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <style>
        .faq__hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        
        .faq__hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .faq__hero p {
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        .faq__section {
            padding: 60px 0;
        }
        
        .faq__container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .faq__category {
            margin-bottom: 50px;
        }
        
        .faq__category-title {
            font-size: 24px;
            color: #333;
            font-weight: 700;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 3px solid #667eea;
        }
        
        .faq__item {
            background: #f8f9fa;
            margin-bottom: 15px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .faq__item:hover {
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.1);
        }
        
        .faq__question {
            padding: 20px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8f9fa;
            transition: all 0.3s ease;
            user-select: none;
        }
        
        .faq__question:hover {
            background: #e9ecef;
            padding-left: 25px;
        }
        
        .faq__question-text {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            flex: 1;
        }
        
        .faq__toggle {
            font-size: 24px;
            color: #667eea;
            transition: transform 0.3s ease;
            line-height: 1;
        }
        
        .faq__item.active .faq__toggle {
            transform: rotate(180deg);
        }
        
        .faq__answer {
            padding: 0;
            max-height: 0;
            overflow: hidden;
            transition: all 0.3s ease;
            background: white;
        }
        
        .faq__item.active .faq__answer {
            max-height: 500px;
            padding: 20px;
            border-top: 2px solid #667eea;
        }
        
        .faq__answer-text {
            color: #666;
            line-height: 1.8;
            font-size: 15px;
        }
        
        .faq__answer-text p {
            margin-bottom: 10px;
        }
        
        .faq__answer-text ul {
            list-style: none;
            padding-left: 0;
            margin: 10px 0;
        }
        
        .faq__answer-text li {
            padding-left: 20px;
            margin-bottom: 8px;
            position: relative;
            color: #666;
        }
        
        .faq__answer-text li:before {
            content: "•";
            position: absolute;
            left: 0;
            color: #667eea;
            font-weight: bold;
        }
        
        .search__box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 40px;
        }
        
        .search__box input {
            width: 100%;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .search__box input::placeholder {
            color: #ccc;
        }
        
        .no__results {
            text-align: center;
            padding: 40px 20px;
            color: #666;
        }
        
        .no__results p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        
        .contact__cta {
            background: #e7f3ff;
            padding: 30px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            margin-top: 40px;
        }
        
        .contact__cta h3 {
            color: #333;
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .contact__cta p {
            color: #666;
            margin-bottom: 15px;
        }
        
        .contact__cta a {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .contact__cta a:hover {
            background: #764ba2;
            transform: translateX(5px);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <%-- Header --%>
        <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

        <main class="main">
            <!-- Hero Section -->
            <section class="faq__hero">
                <div class="container">
                    <h1>Câu Hỏi Thường Gặp</h1>
                    <p>Tìm kiếm câu trả lời cho những câu hỏi phổ biến của bạn về PetShop</p>
                </div>
            </section>

            <!-- FAQ Section -->
            <section class="faq__section">
                <div class="container">
                    <div class="faq__container">
                        <!-- Search Box -->
                        <div class="search__box">
                            <input type="text" id="faqSearch" placeholder="Tìm kiếm câu hỏi...">
                        </div>

                        <!-- General Questions -->
                        <div class="faq__category">
                            <h2 class="faq__category-title">Câu Hỏi Chung</h2>
                            
                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">PetShop là gì?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        PetShop là một nền tảng thương mại điện tử hàng đầu cung cấp hàng nghìn sản phẩm chất lượng cao cho các loài thú cưng khác nhau. Chúng tôi cam kết mang đến trải nghiệm mua sắm tốt nhất và các sản phẩm an toàn cho thú cưng yêu quý của bạn.
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Bạn có hoạt động bao lâu rồi?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        PetShop được thành lập vào năm 2014 và đã phục vụ hơn 100,000 khách hàng yêu thú cưng với hơn 10 năm kinh nghiệm trong lĩnh vực này. Chúng tôi liên tục phát triển và cải thiện dịch vụ để đáp ứng nhu cầu của khách hàng.
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Bạn bán những loài vật nào?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Chúng tôi cung cấp sản phẩm cho nhiều loài thú cưng bao gồm:
                                        <ul>
                                            <li>Chó (Thức ăn, đồ chơi, quần áo, phụ kiện)</li>
                                            <li>Mèo (Thức ăn, cát vệ sinh, đồ chơi, lều)</li>
                                            <li>Chim (Thức ăn, lồng, đồ chơi)</li>
                                            <li>Chuột, Thỏ, Guinea pig (Thức ăn, chuồng, đồ chơi)</li>
                                            <li>Cá (Thức ăn, bộ lọc, bình cá)</li>
                                            <li>Rồng nước, Tắc kè (Thức ăn, đèn, đá nóng)</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Tất cả sản phẩm có an toàn không?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Có, tất cả sản phẩm của chúng tôi đều được kiểm tra chất lượng kỹ lưỡng. Chúng tôi chỉ hợp tác với các nhà sản xuất đáng tin cậy và đảm bảo rằng tất cả sản phẩm đều có chứng chỉ an toàn quốc tế. Nếu có bất kỳ vấn đề, chúng tôi sẽ hoàn lại tiền ngay lập tức.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order & Delivery -->
                        <div class="faq__category">
                            <h2 class="faq__category-title">Đặt Hàng & Giao Hàng</h2>
                            
                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Làm cách nào để đặt hàng?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Để đặt hàng rất đơn giản:
                                        <ul>
                                            <li>Duyệt danh sách sản phẩm trên website</li>
                                            <li>Chọn sản phẩm bạn muốn và thêm vào giỏ hàng</li>
                                            <li>Kiểm tra lại giỏ hàng và nhấp vào "Thanh Toán"</li>
                                            <li>Điền thông tin giao hàng và phương thức thanh toán</li>
                                            <li>Xác nhận đơn hàng và chờ xác nhận từ chúng tôi</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Bao lâu thì sản phẩm tới?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Thời gian giao hàng phụ thuộc vào vị trí của bạn:
                                        <ul>
                                            <li>Khu vực Hà Nội & TP.HCM: 24-48 giờ</li>
                                            <li>Các thành phố lớn: 2-3 ngày</li>
                                            <li>Khu vực vông xa: 3-5 ngày</li>
                                        </ul>
                                        Bạn sẽ nhận được mã theo dõi để kiểm tra trạng thái đơn hàng thực tế.
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Bạn giao hàng tới những nơi nào?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Chúng tôi giao hàng tới tất cả các tỉnh, thành phố trên toàn quốc. Nếu bạn ở khu vực xa xôi, vui lòng liên hệ với chúng tôi để biết thêm chi tiết về phí giao hàng.
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Có phí giao hàng không?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Phí giao hàng phụ thuộc vào khu vực và trọng lượng đơn hàng. Tuy nhiên, nếu đơn hàng của bạn trên 500,000 VNĐ, bạn sẽ được giao hàng miễn phí trong khu vực nội thành.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Payment -->
                        <div class="faq__category">
                            <h2 class="faq__category-title">Thanh Toán</h2>
                            
                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Bạn chấp nhận những phương thức thanh toán nào?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Chúng tôi chấp nhận các phương thức thanh toán sau:
                                        <ul>
                                            <li>Thanh toán khi nhận hàng (COD)</li>
                                            <li>Chuyển khoản ngân hàng</li>
                                            <li>Ví điện tử (Momo, ZaloPay, ViettelPay)</li>
                                            <li>Thẻ tín dụng/Thẻ ghi nợ</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Thanh toán có an toàn không?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Có, tất cả giao dịch thanh toán của chúng tôi đều được mã hóa bằng SSL (Secure Sockets Layer) - công nghệ bảo mật hàng đầu trong ngành. Thông tin cá nhân và thẻ tín dụng của bạn sẽ được bảo vệ tuyệt đối.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Returns & Refunds -->
                        <div class="faq__category">
                            <h2 class="faq__category-title">Trả Hàng & Hoàn Tiền</h2>
                            
                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Chính sách trả hàng của bạn là gì?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Chúng tôi cung cấp chính sách hoàn tiền 30 ngày nếu bạn không hài lòng. Sản phẩm phải:
                                        <ul>
                                            <li>Còn nguyên vẹn và chưa sử dụng</li>
                                            <li>Có đầy đủ hóa đơn và bao bì gốc</li>
                                            <li>Được yêu cầu trả lại trong vòng 30 ngày kể từ ngày nhận hàng</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Nếu sản phẩm bị hỏng hoặc lỗi thì sao?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Nếu sản phẩm bị hỏng hoặc có khiếm khuyết khi nhận hàng, vui lòng liên hệ với chúng tôi ngay. Chúng tôi sẽ:
                                        <ul>
                                            <li>Xem xét yêu cầu của bạn trong vòng 24 giờ</li>
                                            <li>Gửi sản phẩm thay thế hoặc hoàn tiền</li>
                                            <li>Chi trả phí giao hàng ngược lại</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Mất bao lâu để nhận hoàn tiền?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Sau khi chúng tôi kiểm tra và xác nhận đơn yêu cầu hoàn tiền, tiền sẽ được hoàn trở lại tài khoản ngân hàng của bạn trong vòng 5-7 ngày làm việc.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Account -->
                        <div class="faq__category">
                            <h2 class="faq__category-title">Tài Khoản</h2>
                            
                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Làm cách nào để tạo tài khoản?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Tạo tài khoản rất đơn giản:
                                        <ul>
                                            <li>Nhấp vào nút "Đăng Ký" ở trang chủ</li>
                                            <li>Nhập email và tạo mật khẩu mạnh</li>
                                            <li>Xác nhận email của bạn</li>
                                            <li>Hoàn thành thông tin tiểu sử</li>
                                            <li>Bắt đầu mua sắm!</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="faq__item">
                                <div class="faq__question" onclick="toggleFaq(this)">
                                    <span class="faq__question-text">Tôi quên mật khẩu thì sao?</span>
                                    <span class="faq__toggle">+</span>
                                </div>
                                <div class="faq__answer">
                                    <div class="faq__answer-text">
                                        Không cần lo lắng! Nhấp vào "Quên Mật Khẩu" trên trang đăng nhập, nhập email của bạn, và chúng tôi sẽ gửi một liên kết đặt lại mật khẩu đến email của bạn. Tuân theo hướng dẫn trong email để tạo mật khẩu mới.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Contact CTA -->
                        <div class="contact__cta">
                            <h3>Không tìm thấy câu trả lời?</h3>
                            <p>Nếu bạn không tìm thấy câu trả lời cho câu hỏi của mình, vui lòng liên hệ với đội hỗ trợ khách hàng của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ!</p>
                            <a href="/lienhe">Liên Hệ Chúng Tôi</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <%-- Footer --%>
        <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

        <div class="scroll__top" style="display: none;"></div>
    </div>

    <%-- JS --%>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

    <script>
        function toggleFaq(element) {
            const faqItem = element.closest('.faq__item');
            
            // Close other items
            document.querySelectorAll('.faq__item.active').forEach(item => {
                if (item !== faqItem) {
                    item.classList.remove('active');
                }
            });
            
            // Toggle current item
            faqItem.classList.toggle('active');
        }

        // Search functionality
        document.getElementById('faqSearch').addEventListener('keyup', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const faqItems = document.querySelectorAll('.faq__item');
            
            faqItems.forEach(item => {
                const questionText = item.querySelector('.faq__question-text').textContent.toLowerCase();
                const answerText = item.querySelector('.faq__answer-text').textContent.toLowerCase();
                
                if (questionText.includes(searchTerm) || answerText.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
