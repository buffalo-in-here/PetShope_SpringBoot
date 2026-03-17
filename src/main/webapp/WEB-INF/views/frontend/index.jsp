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
            <!-- Sale -->
            <div class="main__products-sale">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <a href="./danhmuc.html" class="banner-sale">
                                <img src="./img/oder-1.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-12 col-lg-6 block none">
                            <a href="./danhmuc.html" class="banner-sale">
                                <img src="./img/oder-2.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Bộ lọc sản phẩm -->
            <div class="filter-section">
                <div class="container">
                    <form action="${classpath }/index" method="get" class="filter-form">
                        <div class="row align-items-end g-3">
                            <div class="col-12 col-md-3">
                                <label for="keyWord" class="form-label">Tìm kiếm sản phẩm</label>
                                <input type="text" class="form-control" id="keyWord"
                                        name="keyWord" placeholder="Nhập tên sản phẩm..." value="${keyWord }" />
                            </div>
                            
                            <div class="col-12 col-md-2">
                                <label for="beginPrice" class="form-label">Giá từ</label>
                                <input class="form-control" type="number" 
                                    id="beginPrice" name="beginPrice" placeholder="Tối thiểu" value="${beginPrice }"/>
                            </div>
                            <div class="col-12 col-md-2">
                                <label for="endPrice" class="form-label">Giá đến</label>
                                <input class="form-control" type="number" 
                                    id="endPrice" name="endPrice" placeholder="Tối đa" value="${endPrice }"/>
                            </div>
                            
                            <div class="col-12 col-md-2">
                                <label for="minRating" class="form-label">Rating tối thiểu</label>
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
                                <label for="sortBy" class="form-label">Sắp xếp</label>
                                <select class="form-control" id="sortBy" name="sortBy">
                                    <option value="newest" <c:if test="${sortBy == 'newest'}">selected</c:if>>Mới nhất</option>
                                    <option value="price_low" <c:if test="${sortBy == 'price_low'}">selected</c:if>>Giá: Thấp → Cao</option>
                                    <option value="price_high" <c:if test="${sortBy == 'price_high'}">selected</c:if>>Giá: Cao → Thấp</option>
                                    <option value="name_az" <c:if test="${sortBy == 'name_az'}">selected</c:if>>Tên: A → Z</option>
                                    <option value="rating_high" <c:if test="${sortBy == 'rating_high'}">selected</c:if>>Rating: Cao → Thấp</option>
                                </select>
                            </div>
                            
                            <div class="col-12 col-md-1">
                                <button type="submit" class="btn btn-search w-100">
                                    <i class='bx bx-search'></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
											
            <!-- Danh mục sản phẩm -->
            <div class="main__products">
                <div class="container">
                    <div class="main__products-title">
                        <p>Danh Sách Sản Phẩm</p>
                    </div>
                    <div class="main__products-content">
                        <div class="row g-4">
                        <c:forEach items="${products }" var="product">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="product">
                                    <div class="thumb">
                                        <a href="${classpath }/product-detail/${product.id}" class="image">
                                            <img src="${classpath }/UploadFiles/${product.avatar}" class="fit-img zoom-img" alt="${product.name}" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22300%22 height=%22300%22%3E%3Crect fill=%22%23f0f0f0%22 width=%22300%22 height=%22300%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 dominant-baseline=%22middle%22 text-anchor=%22middle%22 font-family=%22Arial%22 font-size=%2216%22 fill=%22%23999%22%3ENo Image%3C/text%3E%3C/svg%3E'">
                                        </a>
                                        <span class="badges">
                                            <span class="new">NEW</span>
                                        </span>
                                    </div>
                                    <div class="content">
                                        <a href="${classpath }/product-detail/${product.id}" class="content-link">
                                            <h5 class="title">${product.name }</h5>
                                        </a>
                                        <div class="product-rating">
                                            <span class="stars">
                                                <c:set var="rating" value="${product.avgRating != null ? product.avgRating : 0}"/>
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:if test="${i <= rating}">⭐</c:if>
                                                    <c:if test="${i > rating && rating > i - 1}">⭐</c:if>
                                                </c:forEach>
                                            </span>
                                            <span class="rating-text">${rating != null && rating > 0 ? rating.toString().substring(0, java.lang.Math.min(3, rating.toString().length())) : 'Chưa có'}</span>
                                            <span class="review-count">(${product.reviewCount != null ? product.reviewCount : 0})</span>
                                        </div>
                                        <span class="price">
                                            <span class="new">
                                            	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
                                            	<sup>VNĐ</sup>
                                            </span>
                                        </span>
                                        <span class="symbol">
                                            <a href="#" title="Yêu thích"><i class='bx bx-heart'></i></a>
                                            <button type="button" onclick="addToCart(${product.id}, 1, '${product.name}')" title="Thêm vào giỏ"><i class='bx bx-cart'></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        </div>
                    </div>
                </div>
        <%-- Phan trang --%>
        <div class="container">
            <div class="pagination-wrapper">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}&keyWord=${keyWord}&beginPrice=${beginPrice }&endPrice=${endPrice}">
                                <i class='bx bx-chevron-left'></i> Trước
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                        <c:choose>
                            <c:when test="${pageNumber == currentPage}">
                                <li class="page-item active"><a class="page-link" href="?page=${pageNumber}&keyWord=${keyWord}&beginPrice=${beginPrice }&endPrice=${endPrice}">${pageNumber}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="?page=${pageNumber}&keyWord=${keyWord}&beginPrice=${beginPrice }&endPrice=${endPrice}">${pageNumber}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}&keyWord=${keyWord}&beginPrice=${beginPrice }&endPrice=${endPrice}">
                                Sau <i class='bx bx-chevron-right'></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
            
<!--             ------------------------------------------------------------------------------------------------------------ -->
            
            
            <!-- main bottom -->
            <div class="main__bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 none block">
                            <div class="main__bottom-wrap">
                                <div class="wrap__icon"><i class='bx bxs-truck'></i></div>
                                <div class="wrap__content">
                                    <h4 class="title">FREE SHIPPING</h4>
                                    <p>Free shipping on all order</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 none block">
                            <div class="main__bottom-wrap">
                                <div class="wrap__icon"><i class='bx bx-headphone'></i></div>
                                <div class="wrap__content">
                                    <h4 class="title">ONLINE SUPPORT</h4>
                                    <p>Online live support 24/7</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 none block">
                            <div class="main__bottom-wrap">
                                <div class="wrap__icon"><i class='bx bx-bar-chart-alt'></i></div>
                                <div class="wrap__content">
                                    <h4 class="title">MONEY RETURN</h4>
                                    <p>Back guarantee under 5 days</p>
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
		addToCart = function(_productId, _quantity, _productName) {		
			alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				id: _productId, //lay theo id
				quantity: _quantity,
				name: _productName,
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProducts").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
</body>

</html>