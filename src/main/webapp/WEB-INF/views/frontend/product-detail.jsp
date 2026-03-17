<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
    <link rel="icon" type="image/x-icon" href="${classpath }/frontend/img/shop-icon.png">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
    <div class="wrapper">
    
        <!-- Header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    
        <main class="main">
            <div class="main__breadcrumb">
                <div class="container">
<!--                     <div class="bread-crumb"> -->
<%--                     	<img alt="" src="${classpath }/frontend/img/order-1.jpg"> --%>
<!--                     </div> -->
                </div>
            </div>
            <div class="main__section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 none block">
                            <div class="section__sidebar-widget">
                                <div class="widget__inner">
                                    <div class="widget__list">
                                        <img alt="" src="${classpath }/frontend/img/petshope.webp" width="300px" height="180px">
                                    </div> <br> <br><br>
                                     <div class="widget__list">
                                        <img alt="" src="${classpath }/frontend/img/cat_ava.jpg" width="300px" height="180px">
                                    </div> <br> <br><br>
                                     <div class="widget__list">
                                        <img alt="" src="${classpath }/frontend/img/dog_ava.jpg" width="300px" height="180px">
                                    </div> <br><br><br>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-12">
                            
                            <form class="form-inline" action="${classpath }/product-detail" method="get">
	                            <div class="section__product-detail">
	                                <div class="row">
	                                    <div class="col-12 col-lg-5">
	                                        <div class="product__detail-img">
	                                            <div class="swiper myProduct">
	                                                <div class="swiper-wrapper">
	                                                	
	                                                	<c:forEach items="${productImages }" var="productImage">
		                                                    <div class="swiper-slide">
		                                                        <img src="${classpath }/UploadFiles/${productImage.path }" alt="Product Image"
		                                                            class="swiper__product-img" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22400%22 height=%22400%22%3E%3Crect fill=%22%23f0f0f0%22 width=%22400%22 height=%22400%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 dominant-baseline=%22middle%22 text-anchor=%22middle%22 font-family=%22Arial%22 font-size=%2220%22 fill=%22%23999%22%3ENo Image Available%3C/text%3E%3C/svg%3E'">
		                                                    </div>
	                                                    </c:forEach>
	                                                </div>
	                                                <!-- <div class="swiper-button-next"></div>
	                                                <div class="swiper-button-prev"></div> -->
	                                                <div class="swiper-pagination"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-12 col-lg-7">
	                                        <div class="product__detail-summery">
	                                            <div class="product__header mb-10">
	                                                <h2 class="product__header-title">${product.name }</h2>
	                                            </div>
	                                            <div class="product__price mb-10">
	                                                <span class="curr__price">
	                                                	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
															<sup>vnđ</sup>
	                                                </span>
	                                              <%--   <span class="old__price"></span> --%>
	                                            </div>
	                                            <%-- <div class="product__code mb-10">
	                                                <span>Mã đơn hàng: ABC123</span>
	                                            </div>
	                                            --%>
	                                            <div class="product__inventroy mb-10">
	                                                <span class="inventroy-title"><i class='bx bx-check-circle'></i> Tình trạng: </span>
	                                                <span class="inventory__varient">Còn hàng</span>
	                                            </div>
	                                            <div class="product__quantity mb-10">
	                                                <span>
	                                                    <i class='bx bx-package'></i> Số lượng:
	                                                </span>
	                                                <div class="quantity__plus mb-10">
	                                                    <input type="number" name="quantity" id="quantity" value="1" min="1" max="99">
	                                                </div>
	                                            </div>
	                                            <div class="product__cart-button">
	                                                <span class="add-cart-heart" title="Thêm vào yêu thích">
	                                                	<a href="" >
	                                                    	<i class='bx bx-heart'></i>
	                                                	</a>
	                                                </span>
	                                                <span class="add-cart-heart" title="Thêm vào giỏ hàng">
	                                                    <a onclick="addToCart(${product.id }, '${product.name}')">
	                                                    	<i class='bx bx-cart'></i></a>
	                                                </span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </form>
                            <!-- chi tiết sản phẩm -->
                            <div class="section__product-description">
                                <h2 class="detail__heading">
                                    Chi tiết sản phẩm
                                </h2>
                                <div class="detail__text">
                                	<p>${product.detailDescription }</p>
                                </div>
                            </div>
                            
                            <!-- Phần đánh giá sản phẩm -->
                            <div class="product-reviews-section">
                                <div class="main__products-title">
                                    <p>Đánh Giá & Bình Luận</p>
                                </div>
                                
                                <!-- Hiển thị thống kê đánh giá -->
                                <div class="review-stats">
                                    <div class="stats-header">
                                        <div class="avg-rating">
                                            <div class="rating-number">${avgRating != null && avgRating > 0 ? avgRating.toString().substring(0, java.lang.Math.min(3, avgRating.toString().length())) : '0'}</div>
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:if test="${i <= avgRating}">⭐</c:if>
                                                    <c:if test="${i > avgRating && avgRating > i - 1}">⭐</c:if>
                                                </c:forEach>
                                            </div>
                                            <div class="review-count-text">${reviewCount} đánh giá</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Form đăng đánh giá -->
                                <div class="review-form-wrapper">
                                    <h4>Gửi đánh giá của bạn</h4>
                                    <form action="${classpath }/product-review/add" method="POST" class="review-form">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        
                                        <div class="form-group">
                                            <label>Đánh giá (1-5 sao)</label>
                                            <div class="star-rating">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <input type="radio" name="rating" id="star${i}" value="${i}" required>
                                                    <label for="star${i}">⭐</label>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Bình luận</label>
                                            <textarea name="comment" class="form-control" rows="4" placeholder="Chia sẻ trải nghiệm của bạn..."></textarea>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-primary">Gửi Đánh Giá</button>
                                    </form>
                                </div>
                                
                                <!-- Danh sách đánh giá -->
                                <div class="reviews-list">
                                    <c:if test="${not empty reviews}">
                                        <c:forEach items="${reviews}" var="review">
                                            <div class="review-item">
                                                <div class="review-header">
                                                    <strong>${review.user.name}</strong>
                                                    <span class="review-date"><fmt:formatDate value="${review.createDate}" pattern="dd/MM/yyyy"/></span>
                                                </div>
                                                <div class="review-rating">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <c:if test="${i <= review.rating}">⭐</c:if>
                                                        <c:if test="${i > review.rating}">☆</c:if>
                                                    </c:forEach>
                                                    <span class="rating-value">${review.rating}/5</span>
                                                </div>
                                                <div class="review-comment">
                                                    ${review.comment}
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty reviews}">
                                        <p class="no-reviews">Chưa có đánh giá nào. Hãy là người đầu tiên đánh giá!</p>
                                    </c:if>
                                </div>
                            </div>

                            <!-- sản phẩm tương tự -->
                            <div class="related__products">
                                <div class="main__products-title">
                                    <p>Sản phẩm tương tự</p>
                                </div>
                                <div class="row">
                                    <div class="swiper myRelated">
                                        <div class="swiper-wrapper">
                                            <c:forEach items="${productHot }" var="product">
                                            <div class="swiper-slide">
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="${classpath }/product-detail/${product.id}" class="image">
					                                            <img src="${classpath }/UploadFiles/${product.avatar}" width="200px" class="fit-img zoom-img" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22200%22 height=%22200%22%3E%3Crect fill=%22%23f0f0f0%22 width=%22200%22 height=%22200%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 dominant-baseline=%22middle%22 text-anchor=%22middle%22 font-family=%22Arial%22 font-size=%2214%22 fill=%22%23999%22%3ENo Image%3C/text%3E%3C/svg%3E'">
						                                </a>
                                                        <span class="badges">
					                                            <span class="new">new</span>
						                                 </span>
                                                    </div>
                                                    <div class="content">
                                                        <a href="${classpath }/product-detail/${product.id}" class="content-link">
				                                            <h5 class="title">${product.name }</h5>
				                                        </a>
                                                        <span class="price">
				                                            <!-- <span class="old">20.000.000đ</span> -->
				                                            <span class="new">
				                                            	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
				                                            	<sup>VNĐ</sup>
				                                            </span>
				                                        </span>
                                                        <span class="symbol">
				                                            <a href="#"><i class='bx bx-heart'></i></a>
															<!--nút thêm giỏ hàng -->
				                                            <button type="button" onclick="addToCart(${product.id}, 1, '${product.name}')"><i class='bx bx-cart'></i></button>
				                                        </span>

                                                    </div>
                                                </div>
                                                
                                            </div>
                                            </c:forEach>
                                        </div>
                                        <div class="swiper-button-next next"></div>
                                        <div class="swiper-button-prev prev"></div>
                                        <div class="swiper-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<!-- mobile menu -->
<%-- 		<jsp:include page="/WEB-INF/views/frontend/layout/mobile-menu.jsp"></jsp:include> --%>
    </div>
    
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<!-- Add to cart -->
	<script type="text/javascript">
		// Enhanced quantity controls
		document.addEventListener('DOMContentLoaded', function() {
			const quantityInput = document.getElementById('quantity');
			
			// Add quantity control buttons
			const quantityContainer = document.querySelector('.quantity__plus');
			quantityContainer.style.display = 'flex';
			quantityContainer.style.alignItems = 'center';
			quantityContainer.style.gap = '10px';
			
			// Create decrease button
			const decreaseBtn = document.createElement('button');
			decreaseBtn.innerHTML = '<i class="bx bx-minus"></i>';
			decreaseBtn.type = 'button';
			decreaseBtn.className = 'quantity-btn decrease-btn';
			decreaseBtn.style.cssText = `
				width: 40px; height: 40px; border: 2px solid #e9ecef; 
				background: white; border-radius: 8px; cursor: pointer;
				display: flex; align-items: center; justify-content: center;
				transition: all 0.3s ease; font-size: 18px; color: #343a40;
			`;
			
			// Create increase button
			const increaseBtn = document.createElement('button');
			increaseBtn.innerHTML = '<i class="bx bx-plus"></i>';
			increaseBtn.type = 'button';
			increaseBtn.className = 'quantity-btn increase-btn';
			increaseBtn.style.cssText = `
				width: 40px; height: 40px; border: 2px solid #e9ecef; 
				background: white; border-radius: 8px; cursor: pointer;
				display: flex; align-items: center; justify-content: center;
				transition: all 0.3s ease; font-size: 18px; color: #343a40;
			`;
			
			// Insert buttons
			quantityContainer.insertBefore(decreaseBtn, quantityInput);
			quantityContainer.appendChild(increaseBtn);
			
			// Button hover effects
			[decreaseBtn, increaseBtn].forEach(btn => {
				btn.addEventListener('mouseenter', function() {
					this.style.borderColor = '#f6ab49';
					this.style.background = '#f6ab49';
					this.style.color = 'white';
					this.style.transform = 'translateY(-2px)';
				});
				
				btn.addEventListener('mouseleave', function() {
					this.style.borderColor = '#e9ecef';
					this.style.background = 'white';
					this.style.color = '#343a40';
					this.style.transform = 'translateY(0)';
				});
			});
			
			// Button functionality
			decreaseBtn.addEventListener('click', function() {
				let currentValue = parseInt(quantityInput.value);
				if (currentValue > 1) {
					quantityInput.value = currentValue - 1;
				}
			});
			
			increaseBtn.addEventListener('click', function() {
				let currentValue = parseInt(quantityInput.value);
				if (currentValue < 99) {
					quantityInput.value = currentValue + 1;
				}
			});
			
			// Add loading animation to cart buttons
			const cartButtons = document.querySelectorAll('.add-cart-heart');
			cartButtons.forEach(button => {
				button.addEventListener('click', function() {
					const icon = this.querySelector('i');
					const originalClass = icon.className;
					
					// Add loading animation
					icon.className = 'bx bx-loader-alt bx-spin';
					this.style.pointerEvents = 'none';
					
					// Restore after 2 seconds
					setTimeout(() => {
						icon.className = originalClass;
						this.style.pointerEvents = 'auto';
					}, 2000);
				});
			});
		});
		
		addToCart = function(_productId, _productName) {		
			const quantity = jQuery("#quantity").val();
			
			// Validate quantity
			if (!quantity || quantity < 1) {
				alert("Vui lòng chọn số lượng hợp lệ!");
				return;
			}
			
			let data = {
				id: _productId,
				name: _productName,
				quantity: quantity,
			};
				
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				
				success : function(jsonResult) {
					// Enhanced success notification
					const notification = document.createElement('div');
					notification.innerHTML = `
						<div style="
							position: fixed; top: 20px; right: 20px; z-index: 9999;
							background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
							color: white; padding: 15px 25px; border-radius: 12px;
							box-shadow: 0 4px 20px rgba(0,0,0,0.15);
							animation: slideInRight 0.5s ease-out;
						">
							<i class='bx bx-check-circle' style='font-size: 20px; margin-right: 10px;'></i>
							${jsonResult.message}
						</div>
					`;
					
					document.body.appendChild(notification);
					
					// Update cart count
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProducts").html(totalProducts);
					
					// Remove notification after 3 seconds
					setTimeout(() => {
						notification.remove();
					}, 3000);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					// Enhanced error notification
					const notification = document.createElement('div');
					notification.innerHTML = `
						<div style="
							position: fixed; top: 20px; right: 20px; z-index: 9999;
							background: linear-gradient(135deg, #dc3545 0%, #e74c3c 100%);
							color: white; padding: 15px 25px; border-radius: 12px;
							box-shadow: 0 4px 20px rgba(0,0,0,0.15);
							animation: slideInRight 0.5s ease-out;
						">
							<i class='bx bx-error-circle' style='font-size: 20px; margin-right: 10px;'></i>
							Đã có lỗi xảy ra, vui lòng thử lại!
						</div>
					`;
					
					document.body.appendChild(notification);
					
					setTimeout(() => {
						notification.remove();
					}, 3000);
				},
			});
		}
		
		// Add CSS animations
		const style = document.createElement('style');
		style.textContent = `
			@keyframes slideInRight {
				from {
					opacity: 0;
					transform: translateX(100px);
				}
				to {
					opacity: 1;
					transform: translateX(0);
				}
			}
			
			@keyframes bx-spin {
				from { transform: rotate(0deg); }
				to { transform: rotate(360deg); }
			}
			
			.bx-spin {
				animation: bx-spin 1s linear infinite;
			}
		`;
		document.head.appendChild(style);
	</script>
</body>

</html>