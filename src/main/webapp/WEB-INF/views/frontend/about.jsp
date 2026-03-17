<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - PetShop</title>
    <%-- CSS --%>
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <style>
        .about__hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        
        .about__hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .about__hero p {
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        .about__section {
            padding: 60px 0;
        }
        
        .about__content {
            display: flex;
            align-items: center;
            gap: 40px;
            margin-bottom: 60px;
        }
        
        .about__content.reverse {
            flex-direction: row-reverse;
        }
        
        .about__text h2 {
            font-size: 32px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .about__text p {
            color: #666;
            line-height: 1.8;
            margin-bottom: 15px;
            font-size: 16px;
        }
        
        .about__image {
            flex: 1;
            min-height: 300px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 60px;
        }
        
        .about__features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        
        .feature__card {
            background: #f8f9fa;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .feature__card:hover {
            border-color: #667eea;
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.1);
        }
        
        .feature__icon {
            font-size: 40px;
            color: #667eea;
            margin-bottom: 15px;
            display: block;
        }
        
        .feature__card h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .feature__card p {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
        }
        
        .team__section {
            background: #f8f9fa;
            padding: 60px 0;
        }
        
        .team__section h2 {
            font-size: 32px;
            text-align: center;
            color: #333;
            margin-bottom: 50px;
            font-weight: 700;
        }
        
        .team__grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .team__member {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        
        .team__member:hover {
            transform: translateY(-5px);
        }
        
        .member__image {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 80px;
        }
        
        .member__info {
            padding: 20px;
            text-align: center;
        }
        
        .member__name {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        
        .member__role {
            color: #667eea;
            font-size: 14px;
            margin-bottom: 10px;
        }
        
        .member__description {
            color: #666;
            font-size: 13px;
            line-height: 1.5;
        }
        
        .cta__section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        
        .cta__section h2 {
            font-size: 32px;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .cta__section p {
            font-size: 16px;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .cta__button {
            display: inline-block;
            background: white;
            color: #667eea;
            padding: 12px 40px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .cta__button:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <%-- Header --%>
        <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

        <main class="main">
            <!-- Hero Section -->
            <section class="about__hero">
                <div class="container">
                    <h1>Về Chúng Tôi</h1>
                    <p>Chúng tôi tận tâm phục vụ những người yêu thú cưng với các sản phẩm chất lượng hàng đầu</p>
                </div>
            </section>

            <!-- About Section -->
            <section class="about__section">
                <div class="container">
                    <div class="about__content">
                        <div class="about__text" style="flex: 1;">
                            <h2>Chúng Tôi Là Ai?</h2>
                            <p>PetShop là một nền tảng thương mại điện tử hàng đầu chuyên cung cấp các sản phẩm và dịch vụ chất lượng cao cho các động vật nuôi. Với hơn 10 năm kinh nghiệm trong ngành, chúng tôi đã phục vụ hàng triệu khách hàng yêu thú cưng trên khắp đất nước.</p>
                            <p>Sứ mệnh của chúng tôi là giúp các chủ nuôi thú cưng tìm kiếm các sản phẩm tốt nhất, an toàn và hiệu quả nhất cho những người bạn lông xanh của họ. Chúng tôi tin rằng mỗi thú cưng đáng được chăm sóc tốt nhất.</p>
                        </div>
                        <div class="about__image">
                            <i class='bx bx-happy'></i>
                        </div>
                    </div>

                    <div class="about__content reverse">
                        <div class="about__text" style="flex: 1;">
                            <h2>Cam Kết Của Chúng Tôi</h2>
                            <p>Chúng tôi cam kết mang đến sản phẩm chất lượng cao với giá cạnh tranh nhất. Mỗi sản phẩm được kiểm tra kỹ lưỡng trước khi gửi đến tay khách hàng để đảm bảo an toàn và hiệu quả.</p>
                            <p>Đội ngũ hỗ trợ khách hàng 24/7 của chúng tôi luôn sẵn lòng giải đáp mọi câu hỏi và mối quan tâm của bạn. Sự hài lòng của khách hàng là ưu tiên hàng đầu của chúng tôi.</p>
                        </div>
                        <div class="about__image">
                            <i class='bx bx-check-circle'></i>
                        </div>
                    </div>

                    <!-- Features -->
                    <div class="about__features">
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-store'></i></span>
                            <h3>Sản Phẩm Đa Dạng</h3>
                            <p>Cung cấp hàng nghìn sản phẩm cho các loài thú cưng khác nhau: chó, mèo, chim, chuột, thỏ và nhiều loài khác</p>
                        </div>
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-fast-forward'></i></span>
                            <h3>Giao Hàng Nhanh</h3>
                            <p>Đảm bảo giao hàng trong 24-48 giờ tại các thành phố lớn với dịch vụ tracking theo dõi thời gian thực</p>
                        </div>
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-shield-alt'></i></span>
                            <h3>Chất Lượng Đảm Bảo</h3>
                            <p>Tất cả sản phẩm đều được kiểm tra chất lượng và có chứng chỉ an toàn quốc tế</p>
                        </div>
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-headphone'></i></span>
                            <h3>Hỗ Trợ Tuyệt Vời</h3>
                            <p>Đội hỗ trợ khách hàng có kinh nghiệm luôn sẵn sàng giúp đỡ và tư vấn miễn phí</p>
                        </div>
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-money'></i></span>
                            <h3>Giá Cạnh Tranh</h3>
                            <p>Luôn cung cấp giá tốt nhất trên thị trường với các chương trình khuyến mãi hấp dẫn</p>
                        </div>
                        <div class="feature__card">
                            <span class="feature__icon"><i class='bx bx-award'></i></span>
                            <h3>Được Tín Nhiệm</h3>
                            <p>Ghi danh nhiều giải thưởng uy tín về chất lượng dịch vụ từ các tổ chức quốc tế</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Team Section -->
            <section class="team__section">
                <div class="container">
                    <h2>Nhóm Chúng Tôi</h2>
                    <div class="team__grid">
                        <div class="team__member">
                            <div class="member__image">
                                <i class='bx bx-user'></i>
                            </div>
                            <div class="member__info">
                                <div class="member__name">Trần Đức Quang</div>
                                <div class="member__role">Người Sáng Lập & CEO</div>
                                <div class="member__description">Có hơn 10 năm kinh nghiệm trong lĩnh vực thương mại điện tử và chăm sóc thú cưng</div>
                            </div>
                        </div>
                        <div class="team__member">
                            <div class="member__image">
                                <i class='bx bx-user'></i>
                            </div>
                            <div class="member__info">
                                <div class="member__name">Bộ Phận Phát Triển</div>
                                <div class="member__role">Kỹ Sư Phần Mềm</div>
                                <div class="member__description">Đội ngũ phát triển tận tâm luôn nâng cấp platform để mang lại trải nghiệm tốt nhất</div>
                            </div>
                        </div>
                        <div class="team__member">
                            <div class="member__image">
                                <i class='bx bx-user'></i>
                            </div>
                            <div class="member__info">
                                <div class="member__name">Bộ Phận Hỗ Trợ</div>
                                <div class="member__role">Chăm Sóc Khách Hàng</div>
                                <div class="member__description">Luôn sẵn sàng giúp đỡ và giải quyết mọi vấn đề của khách hàng 24/7</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Stats Section -->
            <section class="about__section">
                <div class="container">
                    <div class="team__grid">
                        <div style="text-align: center; padding: 20px;">
                            <h3 style="font-size: 36px; color: #667eea; font-weight: 700;">100,000+</h3>
                            <p style="color: #666; font-size: 16px;">Khách Hàng Hài Lòng</p>
                        </div>
                        <div style="text-align: center; padding: 20px;">
                            <h3 style="font-size: 36px; color: #667eea; font-weight: 700;">50,000+</h3>
                            <p style="color: #666; font-size: 16px;">Sản Phẩm Có Sẵn</p>
                        </div>
                        <div style="text-align: center; padding: 20px;">
                            <h3 style="font-size: 36px; color: #667eea; font-weight: 700;">1,000+</h3>
                            <p style="color: #666; font-size: 16px;">Thương Hiệu Đối Tác</p>
                        </div>
                        <div style="text-align: center; padding: 20px;">
                            <h3 style="font-size: 36px; color: #667eea; font-weight: 700;">24/7</h3>
                            <p style="color: #666; font-size: 16px;">Hỗ Trợ Khách Hàng</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- CTA Section -->
            <section class="cta__section">
                <div class="container">
                    <h2>Sẵn Sàng Bắt Đầu?</h2>
                    <p>Khám phá hàng ngàn sản phẩm chất lượng cao cho thú cưng yêu quý của bạn ngay hôm nay!</p>
                    <a href="/" class="cta__button">Bắt Đầu Mua Sắm</a>
                </div>
            </section>
        </main>

        <%-- Footer --%>
        <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

        <div class="scroll__top" style="display: none;"></div>
    </div>

    <%-- JS --%>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
</body>
</html>
