package vn.web.pet.controller.frontend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.web.pet.controller.BaseController;
import vn.web.pet.dto.Jw28Constant;
import vn.web.pet.dto.ProductStatic;
import vn.web.pet.model.Category;
import vn.web.pet.model.Product;
import vn.web.pet.model.ProductImage;
import vn.web.pet.model.ProductReview;
import vn.web.pet.model.User;
import vn.web.pet.service.CategoryService;
import vn.web.pet.service.ProductImageService;
import vn.web.pet.service.ProductReviewService;
import vn.web.pet.service.ProductService;
import vn.web.pet.service.UserService;

@Controller
public class HomeController extends BaseController implements Jw28Constant{
	@Autowired
	UserService userService;
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductImageService productImageService;
	@Autowired
	private ProductReviewService productReviewService;
	
	 public static String capitalizeFirstLetter(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }
	
	private Page<Product> paginate(List<Product> products, int page, int size) {
	    int start = (page - 1) * size;
	    int end = Math.min(start + size, products.size());
	    return new PageImpl<>(products.subList(start, end), PageRequest.of(page - 1, size), products.size());
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model, 
			           @RequestParam(name = "page", defaultValue = "1") int page,
			           @RequestParam(name = "keyWord", defaultValue = "") String keyWord,
			           @RequestParam(name = "beginPrice", defaultValue = "") String beginPrice,
			           @RequestParam(name = "endPrice", defaultValue = "") String endPrice,
			           @RequestParam(name = "categoryId", defaultValue = "0") int categoryId,
			           @RequestParam(name = "sortBy", defaultValue = "newest") String sortBy,
			           @RequestParam(name = "minRating", defaultValue = "0") int minRating) {
		ProductStatic productStatic = new ProductStatic();
		System.out.println("new = " + productStatic.getNewClient());
		
		List<Category> categories = categoryService.findAllActive();
		List<Product> allProducts = productService.searchProductByUser(categoryId, keyWord, beginPrice, endPrice);
		
		// Set rating info for each product
		for (Product p : allProducts) {
			p.setAvgRating(productReviewService.getAverageRating(p.getId()));
			p.setReviewCount(productReviewService.getReviewCount(p.getId()));
		}
		
		// Apply sorting
		allProducts = sortProducts(allProducts, sortBy, minRating);

	    Page<Product> productPage = paginate(allProducts, page, SIZE_OF_BIG_PAGE);

	    List<Product> products = productPage.getContent();
	    int totalPages = productPage.getTotalPages();
	    
	    //-----------------------Xử lý phần login-----------------------------------------------
	    User user = new User();
	    String userName = "";
		Object loginedUser = 
				SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		if (loginedUser != null && loginedUser instanceof UserDetails) {
			user = (User) loginedUser;
			userName = user.getName();
		}else
			userName = null;
		
		
	    model.addAttribute("products", products);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("keyWord", keyWord.trim());
	    model.addAttribute("beginPrice", beginPrice);
	    model.addAttribute("endPrice", endPrice);
	    model.addAttribute("sortBy", sortBy);
	    model.addAttribute("minRating", minRating);
	    model.addAttribute("userName", capitalizeFirstLetter(userName));
	    model.addAttribute("categories", categories);
		return "frontend/index";
	}
	
	private List<Product> sortProducts(List<Product> products, String sortBy, int minRating) {
		// Filter by rating first
		List<Product> filtered = new ArrayList<>();
		for (Product p : products) {
			Double avgRating = productReviewService.getAverageRating(p.getId());
			if (avgRating == null) avgRating = 0.0;
			if (avgRating >= minRating) {
				filtered.add(p);
			}
		}
		
		// Then sort
		switch (sortBy) {
			case "price_low":
				filtered.sort((p1, p2) -> p1.getPrice().compareTo(p2.getPrice()));
				break;
			case "price_high":
				filtered.sort((p1, p2) -> p2.getPrice().compareTo(p1.getPrice()));
				break;
			case "name_az":
				filtered.sort((p1, p2) -> p1.getName().compareToIgnoreCase(p2.getName()));
				break;
			case "rating_high":
				filtered.sort((p1, p2) -> {
					Double r1 = productReviewService.getAverageRating(p1.getId());
					Double r2 = productReviewService.getAverageRating(p2.getId());
					if (r1 == null) r1 = 0.0;
					if (r2 == null) r2 = 0.0;
					return r2.compareTo(r1);
				});
				break;
			case "newest":
			default:
				filtered.sort((p1, p2) -> p2.getCreateDate().compareTo(p1.getCreateDate()));
				break;
		}
		return filtered;
	}
	
	@GetMapping("/product-detail/{productId}")
	public String productDetail(Model model,
		@PathVariable("productId") int productId) {
		//lay sp trong db
		List<Category> categories = categoryService.findAllActive();
		Product product = productService.getById(productId);
		List<Product> allProducts = productService.searchByCategoryId(product.getCategory().getId());
		List<Product>productHot = new ArrayList<Product>();
		int sizeOfHost = Math.min(5, allProducts.size());
		for(int i = 0; i < sizeOfHost; i++)
			productHot.add(allProducts.get(i));
		
		model.addAttribute("product", product);
		
		//lay cac anh cua san pham
		List<ProductImage> productImages = productImageService.getProductImagesByProductId(productId);
		model.addAttribute("productImages", productImages);
		
		// Get product reviews
		List<ProductReview> reviews = productReviewService.getReviewsByProductId(productId);
		Double avgRating = productReviewService.getAverageRating(productId);
		Integer reviewCount = productReviewService.getReviewCount(productId);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("avgRating", avgRating != null ? avgRating : 0.0);
		model.addAttribute("reviewCount", reviewCount != null ? reviewCount : 0);
		
		model.addAttribute("categories", categories);
		model.addAttribute("productHot", productHot);
		
		return "frontend/product-detail";
	}
	
	@GetMapping("/lienhe")
	public String lienHe(Model model) {
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return "frontend/lienhe";
	}
	
	@RequestMapping(value = "/product-review/add", method = RequestMethod.POST)
	public String addReview(Model model,
			@RequestParam(name = "productId") int productId,
			@RequestParam(name = "rating") int rating,
			@RequestParam(name = "comment", defaultValue = "") String comment) {
		
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (loginedUser == null || !(loginedUser instanceof UserDetails)) {
			return "redirect:/login";
		}
		
		User user = (User) loginedUser;
		Product product = productService.getById(productId);
		
		if (product != null && rating >= 1 && rating <= 5) {
			productReviewService.createReview(product, user, rating, comment);
		}
		
		return "redirect:/product-detail/" + productId;
	}
}