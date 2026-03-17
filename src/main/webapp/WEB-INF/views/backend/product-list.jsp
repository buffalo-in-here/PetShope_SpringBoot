<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${classpath }/backend/assets/images/favicon.png">
    <title>${title }</title>
    
    <!-- variables -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <!-- Custome css resource file -->
    <jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
    
</head>

<body>
	
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
        <!-- Topbar header - style you can find in pages.scss -->
        <jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
        <!-- End Topbar header -->
       
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <jsp:include page="/WEB-INF/views/backend/layout/left-slide-bar.jsp"></jsp:include>
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
        	<!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">Danh sách sản phẩm</h2>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                        	
                            <div class="card-body">
	                        	<form action="${classpath }/admin/product/list" method="get">
		                            <div class="table-responsive">
	                                	
	                               	<div class="row">
										<div class="col-md-2">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/product/add" role="button"
													class="btn btn-primary">Thêm sản phẩm mới</a>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group mb-4">
												<h3>Tổng sản phẩm: &nbsp ${productSearch.totalItems }</h3>
											</div>
										</div>	
										
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label>Trang hiện tại</label>
												<input id="currentPage" name="currentPage" class="form-control"
														value="${productSearch.currentPage }">
											</div>
										</div>	
	
									</div>	
										<!-- Tìm kiếm -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<!-- 
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
			                                        <label for="status">Active</label>
			                                         -->
			                                        <select class="form-control"
														id="status" name="status">
															<option value="2">Tất cả</option>
															<option value="1">Hoạt động</option>
															<option value="0">Không hoạt động</option>
													</select>
												</div>
											</div>
											
											<div class="col-md-2">
												<select class="form-control" id="categoryId" name="categoryId" style="margin-right: 10px;">
													<option value="0">Chọn danh mục</option>
													<c:forEach items="${categories }" var="category">
														<option value="${category.id }">${category.name }</option>
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-2">
												<input class="form-control" type="date" 
													id="beginDate" name="beginDate"/>		
											</div>
											<div class="col-md-2">
												<input class="form-control"
																type="date" id="endDate" name="endDate" />		
											</div>
											
											<div class="col-md-3">
												<input type="text" class="form-control" id="keyword"
														name="keyword" placeholder="Từ khóa tìm kiếm" />		
											</div>
											
											<div class="col-md-1">
											
											
												<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Tìm kiếm</button>
											</div>
										</div>
										<!-- Hết tìm kiếm -->
	                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
	                                        <thead>
	                                            <tr align="center">
	                                            	<th scope="col">STT</th>
	                                                <th scope="col">ID</th>
	                                                <th scope="col">Danh mục</th>
	                                                <th scope="col">Tên</th>
	                                                <th scope="col">Giá</th>
	                                                <th scope="col">Giá bán</th>
	                                                <th scope="col">Ảnh đại diện</th>
	                                                <th scope="col">Mô tả</th>
	                                                <th scope="col">Chi tiết</th>
	                                                <th scope="col">Tạo bởi</th>
	                                                <th scope="col">Cập nhật bởi</th>
	                                                <th scope="col">Ngày tạo</th>
	                                                <th scope="col">Ngày cập nhật</th>
	                                                <th scope="col">Trạng thái</th>
	                                                <th scope="col">Hot</th>
	                                                <th scope="col">Seo</th>
	                                                <th scope="col">Hành động</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach var="product" items="${products }" varStatus="loop">
	                                            <tr>
	                                            	<th scope="row">${loop.index + 1 }</th>
	                                                <td>${product.id }</td>
	                                                <td>${product.category.name }</td>
	                                                <td>${product.name }</td>
	                                                <td align="right">
	                                                	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
	                                                </td>
	                                                <td align="right">${product.salePrice }</td>
	                                                
	                                                <td>
	                                                	<img width="40px" height="40px" 
	                                                		src="${classpath }/UploadFiles/${product.avatar }" class="light-logo">
	                                                </td>
	                                                
	                                                <td>${product.shortDescription }</td>
	                                                <td>${product.detailDescription }</td>
	                                                <td>${product.userCreateProduct.username }</td>
	                                                <td>${product.userUpdateProduct.username }</td>
	                                                
	                                                <td>
	                                                	<fmt:formatDate value="${product.createDate }" pattern="dd-MM-yyyy"/>
	                                                </td>
	                                                <td>${product.updateDate }</td>
	                                                
	                                                <td>
	                                                	<span id="_product_status_${product.id }">
	                                                		<c:choose>
	                                                			<c:when test="${product.status }">
	                                                				<span>Active</span>
	                                                			</c:when>
	                                                			<c:otherwise>
	                                                				<span>Inactive</span>
	                                                			</c:otherwise>
	                                                		</c:choose>
	                                                	</span>
	                                                	
	                                                </td>
	                                                <td>
	                                                	<span id="_product_isHot_${product.id }">
	                                                		<c:choose>
	                                                			<c:when test="${product.isHot }">
	                                                				<span>Yes</span>
	                                                			</c:when>
	                                                			<c:otherwise>
	                                                				<span>No</span>
	                                                			</c:otherwise>
	                                                		</c:choose>
	                                                	</span>
	                                                </td>
	                                               	<td>${product.seo }</td>
	                                                <td>
	                                                	<a href="${classpath }/admin/product/edit/${product.id }" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${classpath }/admin/product/delete/${product.id }" role="button" 
	                                                							class="btn btn-secondary">Delete</a>
	                                                </td>
	                                            </tr>
	                                            </c:forEach>
	                                        </tbody>
	                                        <tfoot>
	                                            <tr align="center">
	                                                <th scope="col">STT</th>
	                                                <th scope="col">ID</th>
	                                                <th scope="col">Danh mục</th>
	                                                <th scope="col">Tên</th>
	                                                <th scope="col">Giá</th>
	                                                <th scope="col">Giá bán</th>
	                                                <th scope="col">Ảnh đại diện</th>
	                                                <th scope="col">Mô tả</th>
	                                                <th scope="col">Chi tiết</th>
	                                                <th scope="col">Tạo bởi</th>
	                                                <th scope="col">Cập nhật bởi</th>
	                                                <th scope="col">Ngày tạo</th>
	                                                <th scope="col">Ngày cập nhật</th>
	                                                <th scope="col">Trạng thái</th>
	                                                <th scope="col">Hot</th>
	                                                <th scope="col">Seo</th>
	                                                <th scope="col">Hành động</th>
	                                            </tr>
	                                        </tfoot>
	                                    </table>
	                                    
	                                    <div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
	                                        		<a href="${classpath }/admin/product/add" role="button" 
	                                        			class="btn btn-primary">Add new product</a>
                                      			</div>
	                                    	</div>
											<%-- Phan trang --%> 
		                                    <div class="col-md-6">
			                                    <div class="pagination float-right">
													<div id="paging"></div>
												</div>
		                                    </div>
		                                  </div>
		                            </div>	                           
	                        	</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    
	<!-- Slider js: All Jquery-->
    <jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
    
    <!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#categoryId").val(${productSearch.categoryId});
			//Dat gia tri cua keyword ung voi dieu kien search truoc do
			$("#keyword").val('${productSearch.keyword}');	
			$("#beginDate").val('${productSearch.beginDate}');
			$("#endDate").val('${productSearch.endDate}');
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
 
</body>

</html>