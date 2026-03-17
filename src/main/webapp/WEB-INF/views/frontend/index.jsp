<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetShop</title>
    <%--CSS--%>
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
   
</head>

<body>
    <div class="wrapper">

    	<%-- Header --%>
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

        <main class="main">
            <!-- Enhanced Hero Section -->
            <div class="main__products-sale">
                <div class="container">
                    <div class="row g-4">
                        <div class="col-12 col-lg-6">
                            <a href="${classpath}/index" class="banner-sale hover-lift">
                                <img src="${classpath}/frontend/img/oder-1.jpg" alt="Khuyến mãi đặc biệt" loading="lazy">
                            </a>
                        </div>
                        <div class="col-12 col-lg-6">
                            <a href="${classpath}/index" class="banner-sale hover-lift">
                                <img src="${classpath}/frontend/img/oder-2.jpg" alt="Ưu đãi hấp dẫn" loading="lazy">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Enhanced Filter Section -->
            <div class="filter-section">
                <div class="container">
                    <div class="text-center mb-4">
                        <h3 style="color: var(--dark-color); font-weight: 600; margin-bottom: 8px;">Tìm kiếm sản phẩm</h3>
                        <p style="color: var(--secondary-color); font-size: 14px;">Sử dụng bộ lọc để tìm thú cưng phù hợp với bạn</p>
                    </div>
                    <form action="${classpath}/index" method="get" class="filter-form">
                        <div class="row align-items-end g-3">
                            <div class="col-12 col-md-3">
                                <label for="keyWord" class="form-label">
                                    <i class='bx bx-search'></i> Tìm kiếm sản phẩm
                                </label>
                                <input type="text" class="form-control" id="keyWord"
                                        name="keyWord" placeholder="Nhập tên sản phẩm..." value="${keyWord}" />
                            </div>
                            
                            <div class="col-12 col-md-2">
                                <label for="beginPrice" class="form-label">
                                    <i class='bx bx-money'></i> Giá từ
                                </label>
                                <input class="form-control" type="number" 
                                    id="beginPrice" name="beginPrice" placeholder="Tối thiểu" value="${beginPrice}"/>
                            </div>
                            <div class="col-12 col-md-2">
                                <label for="endPrice" class="form-label">
                                    <i class='bx bx-money'></i> Giá đến
                                </label>
                                <input class="form-control" type="number" 
                                    id="endPrice" name="endPrice" placeholder="Tối đa" value="${endPrice}"/>
                            </div>
                            
                            <div class="col-12 col-md-2">
                                <label for="minRating" class="form-label">
                                    <i class='bx bx-star'></i> Rating tối thiểu
                                </label>
                                <select class="form-control" id="minRating" name="minRating">
                                    <option value="0" <c:if test="${minRating == 0}">selected</c:if>>Tất cả</option>
                                    <option value="1" <c:if test="${minRating == 1}">selected</c:if>>⭐ Từ 1 sao</option>
                                    <option value="2" <c:if test="${minRating == 2}">selected</c:if>>⭐ Từ 2 sao</option>
                                    <option value="3" <c:if test="${minRating == 3}">selected</c:if>>⭐ Từ 3 sao</option>
                                    <option value="4" <c:if test="${minRating == 4}">selected</c:if>>⭐ Từ 4 sao</option>
                                    <option value="5" <c:if test="${minRating == 5}">selected</c:if>>⭐ 5 sao</option>
                                </select>
                            </div>
                            
                            <div class="col-12 col-md-2">
                                <label for="sortBy" class="form-label">
                                    <i class='bx bx-sort'></i> Sắp xếp
                                </label>
                                <select class="form-control" id="sortBy" name="sortBy">
                                    <option value="newest" <c:if test="${sortBy == 'newest'}">selected</c:if>>Mới nhất</option>
                                    <option value="price_low" <c:if test="${sortBy == 'price_low'}">selected</c:if>>Giá: Thấp → Cao</option>
                                    <option value="price_high" <c:if test="${sortBy == 'price_high'}">selected</c:if>>Giá: Cao → Thấp</option>
                                    <option value="name_az" <c:if test="${sortBy == 'name_az'}">selected</c:if>>Tên: A → Z</option>
                                    <option value="rating_high" <c:if test="${sortBy == 'rating_high'}">selected</c:if>>Rating: Cao → Thấp</option>
                                </select>
                            </div>
                            
                            <div class="col-12 col-md-1">
                                <button type="submit" class="btn-search">
                                    <i class='bx bx-search'></i>
                                    <span class="d-none d-md-inline">Tìm</span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Enhanced Product Section -->
            <div class="main__products">
                <div class="container">
                    <div class="main__products-title">
                        <p>Danh Sách Sản Phẩm</p>
                    </div>
                    
                    <!-- Product Grid -->
                    <div class="main__products-content">
                        <div class="row g-4">
                        <c:choose>
                            <c:when test="${not empty products}">
                                <c:forEach items="${products}" var="product" varStatus="status">
                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <div class="product" style="animation-delay: ${status.index * 0.1}s">
                                            <div class="thumb">
                                                <a href="${classpath}/product-detail/${product.id}" class="image">
                                                    <img src="${classpath}/UploadFiles/${product.avatar}" 
                                                         class="fit-img zoom-img" 
                                                         alt="${product.name}" 
                                                         loading="lazy"
                                                         onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22300%22 height=%22300%22%3E%3Crect fill=%22%23f0f0f0%22 width=%22300%22 height=%22300%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 dominant-baseline=%22middle%22 text-anchor=%22middle%22 font-family=%22Arial%22 font-size=%2216%22 fill=%22%23999%22%3ENo Image%3C/text%3E%3C/svg%3E'">
                                                </a>
                                                <span class="badges">
                                                    <span class="new">NEW</span>
                                                </span>
                                            </div>
                                            <div class="content">
                                                <a href="${classpath}/product-detail/${product.id}" class="content-link">
                                                    <h5 class="title">${product.name}</h5>
                                                </a>
                                                <div class="product-rating">
                                                    <span class="stars">
                                                        <c:set var="rating" value="${product.avgRating != null ? product.avgRating : 0}"/>
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:choose>
                                                                <c:when test="${i <= rating}">⭐</c:when>
                                                                <c:otherwise>☆</c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </span>
                                                    <span class="rating-text">
                                                        ${rating != null && rating > 0 ? rating.toString().substring(0, java.lang.Math.min(3, rating.toString().length())) : 'Chưa có'}
                                                    </span>
                                                    <span class="review-count">(${product.reviewCount != null ? product.reviewCount : 0})</span>
                                                </div>
                                                <span class="price">
                                                    <span class="new">
                                                        <fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber>
                                                        <sup>VNĐ</sup>
                                                    </span>
                                                </span>
                                                <div class="symbol">
                                                    <a href="#" title="Yêu thích" class="hover-scale">
                                                        <i class='bx bx-heart'></i>
                                                    </a>
                                                    <button type="button" 
                                                            onclick="addToCart(${product.id}, 1, '${product.name}')" 
                                                            title="Thêm vào giỏ"
                                                            class="hover-scale">
                                                        <i class='bx bx-cart'></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12">
                                    <div class="text-center py-5">
                                        <i class='bx bx-search' style="font-size: 64px; color: var(--secondary-color); margin-bottom: 20px;"></i>
                                        <h4 style="color: var(--dark-color); margin-bottom: 10px;">Không tìm thấy sản phẩm</h4>
                                        <p style="color: var(--secondary-color);">Thử thay đổi bộ lọc hoặc từ khóa tìm kiếm</p>
                                        <a href="${classpath}/index" class="btn btn-primary mt-3">
                                            <i class='bx bx-refresh'></i> Xem tất cả sản phẩm
                                        </a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                </div>
                
                <!-- Enhanced Pagination -->
                <c:if test="${totalPages > 1}">
                    <div class="container">
                        <div class="pagination-wrapper">
                            <ul class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage - 1}&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">
                                            <i class='bx bx-chevron-left'></i> Trước
                                        </a>
                                    </li>
                                </c:if>
                                
                                <c:choose>
                                    <c:when test="${totalPages <= 7}">
                                        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                                            <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="?page=${pageNumber}&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">
                                                    ${pageNumber}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${currentPage > 3}">
                                            <li class="page-item">
                                                <a class="page-link" href="?page=1&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">1</a>
                                            </li>
                                            <c:if test="${currentPage > 4}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">...</span>
                                                </li>
                                            </c:if>
                                        </c:if>
                                        
                                        <c:forEach begin="${currentPage - 2}" end="${currentPage + 2}" var="pageNumber">
                                            <c:if test="${pageNumber >= 1 && pageNumber <= totalPages}">
                                                <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="?page=${pageNumber}&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">
                                                        ${pageNumber}
                                                    </a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        
                                        <c:if test="${currentPage < totalPages - 2}">
                                            <c:if test="${currentPage < totalPages - 3}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">...</span>
                                                </li>
                                            </c:if>
                                            <li class="page-item">
                                                <a class="page-link" href="?page=${totalPages}&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">
                                                    ${totalPages}
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                
                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage + 1}&keyWord=${keyWord}&beginPrice=${beginPrice}&endPrice=${endPrice}&minRating=${minRating}&sortBy=${sortBy}">
                                            Sau <i class='bx bx-chevron-right'></i>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>
            
            <!-- Enhanced Main Bottom Section -->
            <div class="main__bottom">
                <div class="container">
                    <div class="row g-4">
                        <div class="col-lg-4">
                            <div class="main__bottom-wrap hover-lift">
                                <div class="wrap__icon">
                                    <i class='bx bxs-truck'></i>
                                </div>
                                <div class="wrap__content">
                                    <h4 class="title">Miễn Phí Vận Chuyển</h4>
                                    <p>Giao hàng miễn phí cho tất cả đơn hàng</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="main__bottom-wrap hover-lift">
                                <div class="wrap__icon">
                                    <i class='bx bx-headphone'></i>
                                </div>
                                <div class="wrap__content">
                                    <h4 class="title">Hỗ Trợ Trực Tuyến</h4>
                                    <p>Hỗ trợ khách hàng 24/7</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="main__bottom-wrap hover-lift">
                                <div class="wrap__icon">
                                    <i class='bx bx-shield-check'></i>
                                </div>
                                <div class="wrap__content">
                                    <h4 class="title">Đảm Bảo Chất Lượng</h4>
                                    <p>Cam kết hoàn tiền trong 5 ngày</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        <%-- Footer --%>
        <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
        
        <div class="scroll__top">
            <i class='bx bx-up-arrow-alt'></i>
        </div>
        

        <!-- mobile menu -->
        <div class="mobile__menu-wrapper">
            <div class="mobile__menu-body">
                <div class="mobile__btn-close">
                    <i class='bx bx-x'></i>
                </div>
                <div class="mobile__content">
                    <div class="mobile__search-box">
<!--                         <form > -->
<!--                             <input type="text" placeholder="Tìm kiếm..." class="mobile__search-input" name="searchKey"> -->
<!--                             <button type="submit" class="mobile__search-btn"> -->
<!--                                 <i class='bx bx-search' ></i> -->
<!--                             </button> -->
<!--                         </form> -->
                    </div>
                    <div class="mobile__navigation">
                        <ul class="mobile__nav">
                            <li class="mobile__children"><a href="./index.html" class="mobile__link">Trang chủ</li>
                            <li class="mobile__children">
                                <a href="#" class="mobile__link">Thú cưng
                                    <i class='bx bx-chevron-down'></i>
                                </a>
                                <ul class="mobile__submenu">
                                    <li class="mobile__submenu-item"><a href="./danhmuc.html"
                                            class="mobile__submenu-link">Chó
                                            Corgi</a></li>
                                    <li class="mobile__submenu-item"><a href="./danhmuc.html"
                                            class="mobile__submenu-link">Chó
                                            Beagle</a></li>
                                    <li class="mobile__submenu-item"><a href="./danhmuc.html"
                                            class="mobile__submenu-link">Chó Alaska
                                            Malamute</a></li>
                                    <li class="mobile__submenu-item"><a href="./danhmuc.html"
                                            class="mobile__submenu-link">Chó Golden
                                            Retriever</a></li>
                                    <li class="mobile__submenu-item"><a href="./danhmuc.html"
                                            class="mobile__submenu-link"> Chó Husky
                                            Siberian</a></li>
                                </ul>
                            </li>
                            <li class="mobile__children"><a href="#" class="mobile__link">Phụ kiện</a></li>
                            <li class="mobile__children">
                                <a href="#" class="mobile__link">Dịch vụ <i class='bx bx-chevron-down'></i></a>
                                <ul class="mobile__submenu">
                                    <li class="mobile__submenu-item"><a href="#" class="mobile__submenu-link">Spa</a>
                                    </li>
                                    <li class="mobile__submenu-item"><a href="#" class="mobile__submenu-link">Chăm sóc
                                            thú cưng</a></li>
                                </ul>
                            </li>
                            <li class="mobile__children"><a href="./lienhe.html" class="mobile__link">Liên hệ </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- js --%>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
    
    <!-- Add to cart -->
	<script type="text/javascript">
		// Enhanced Add to Cart with better UX
		addToCart = function(_productId, _quantity, _productName) {
			// Show loading state
			const button = event.target.closest('button');
			const originalContent = button.innerHTML;
			button.innerHTML = '<i class="bx bx-loader-alt bx-spin"></i>';
			button.disabled = true;
			
			let data = {
				id: _productId,
				quantity: _quantity,
				name: _productName,
			};
				
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				
				success : function(jsonResult) {
					// Show success message
					showNotification('success', jsonResult.message || 'Đã thêm sản phẩm vào giỏ hàng!');
					
					// Update cart count
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProducts").html(totalProducts);
					
					// Add success animation
					button.innerHTML = '<i class="bx bx-check"></i>';
					button.style.background = 'var(--success-color)';
					
					setTimeout(() => {
						button.innerHTML = originalContent;
						button.style.background = '';
						button.disabled = false;
					}, 2000);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					showNotification('error', 'Đã có lỗi xảy ra khi thêm sản phẩm!');
					button.innerHTML = originalContent;
					button.disabled = false;
				},
			});
		}
		
		// Enhanced notification system
		function showNotification(type, message) {
			// Remove existing notifications
			const existingNotifications = document.querySelectorAll('.notification');
			existingNotifications.forEach(n => n.remove());
			
			// Create notification element
			const notification = document.createElement('div');
			notification.className = `notification notification-\${type}`;
			notification.innerHTML = `
				<div class="notification-content">
					<i class="bx \${type === 'success' ? 'bx-check-circle' : 'bx-error-circle'}"></i>
					<span>\${message}</span>
					<button class="notification-close" onclick="this.parentElement.parentElement.remove()">
						<i class="bx bx-x"></i>
					</button>
				</div>
			`;
			
			// Add styles
			notification.style.cssText = `
				position: fixed;
				top: 20px;
				right: 20px;
				z-index: 9999;
				background: \${type === 'success' ? '#d4edda' : '#f8d7da'};
				color: \${type === 'success' ? '#155724' : '#721c24'};
				border: 1px solid \${type === 'success' ? '#c3e6cb' : '#f5c6cb'};
				border-radius: 8px;
				padding: 15px 20px;
				box-shadow: 0 4px 12px rgba(0,0,0,0.15);
				animation: slideInRight 0.3s ease-out;
				max-width: 400px;
			`;
			
			document.body.appendChild(notification);
			
			// Auto remove after 5 seconds
			setTimeout(() => {
				if (notification.parentElement) {
					notification.style.animation = 'slideOutRight 0.3s ease-out';
					setTimeout(() => notification.remove(), 300);
				}
			}, 5000);
		}
		
		// Add CSS animations
		const style = document.createElement('style');
		style.textContent = `
			@keyframes slideInRight {
				from {
					transform: translateX(100%);
					opacity: 0;
				}
				to {
					transform: translateX(0);
					opacity: 1;
				}
			}
			
			@keyframes slideOutRight {
				from {
					transform: translateX(0);
					opacity: 1;
				}
				to {
					transform: translateX(100%);
					opacity: 0;
				}
			}
			
			.notification-content {
				display: flex;
				align-items: center;
				gap: 10px;
			}
			
			.notification-close {
				background: none;
				border: none;
				cursor: pointer;
				padding: 0;
				margin-left: auto;
				opacity: 0.7;
				transition: opacity 0.2s;
			}
			
			.notification-close:hover {
				opacity: 1;
			}
		`;
		document.head.appendChild(style);
		
		// Enhanced form interactions
		document.addEventListener('DOMContentLoaded', function() {
			// Add loading state to search form
			const searchForm = document.querySelector('.filter-form');
			if (searchForm) {
				searchForm.addEventListener('submit', function() {
					const submitBtn = this.querySelector('.btn-search');
					const originalContent = submitBtn.innerHTML;
					submitBtn.innerHTML = '<i class="bx bx-loader-alt bx-spin"></i> Đang tìm...';
					submitBtn.disabled = true;
				});
			}
			
			// Add smooth scroll to top functionality
			const scrollTopBtn = document.querySelector('.scroll__top');
			if (scrollTopBtn) {
				scrollTopBtn.addEventListener('click', function() {
					window.scrollTo({
						top: 0,
						behavior: 'smooth'
					});
				});
			}
			
			// Lazy loading for images
			const images = document.querySelectorAll('img[loading="lazy"]');
			if ('IntersectionObserver' in window) {
				const imageObserver = new IntersectionObserver((entries, observer) => {
					entries.forEach(entry => {
						if (entry.isIntersecting) {
							const img = entry.target;
							img.classList.add('fade-in');
							observer.unobserve(img);
						}
					});
				});
				
				images.forEach(img => imageObserver.observe(img));
			}
		});
	</script>
	
	<style>
		.fade-in {
			animation: fadeIn 0.5s ease-in;
		}
		
		@keyframes fadeIn {
			from { opacity: 0; }
			to { opacity: 1; }
		}
	</style>
</body>

</html>