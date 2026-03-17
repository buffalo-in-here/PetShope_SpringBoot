package vn.web.pet.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.Predicate;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.web.pet.configurer.UploadPathConfig;
import vn.web.pet.dto.Jw28Constant;
import vn.web.pet.dto.SearchModel;
import vn.web.pet.model.Product;
import vn.web.pet.model.ProductImage;
import vn.web.pet.repository.IProductRepository;

@Service
public class ProductService implements Jw28Constant {

	@Autowired
	private UploadPathConfig uploadPathConfig;

	@Autowired
	private ProductImageService productImageService;

	@Autowired
	private IProductRepository productRepository;

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public Product getById(int id) {
		Optional<Product> opt = productRepository.findById(id);
		return opt.orElse(null);
	}

	public Product saveOrUpdate(Product product) {
		return productRepository.save(product);
	}

	public List<Product> findAllActive() {
		return productRepository.findByStatusTrue();
	}

	@Transactional
	public int countNewOfMonuth() {
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
		int currentYear = currentDate.getYear();
		return (int) productRepository.countByCreateDateMonthAndYear(currentMonth, currentYear);
	}

	public List<Product> searchByName(String keyWord) {
		String kw = keyWord != null ? keyWord.toLowerCase().trim() : "";
		if (kw.isEmpty())
			return java.util.Collections.emptyList();
		return productRepository.findByNameContainingIgnoreCase(kw);
	}

	public List<Product> searchByCategoryId(int categoryId) {
		return productRepository.findByCategory_Id(categoryId);
	}

	public List<Product> searchProductByUser(int categoryId, String keyWord, String beginPriceRaw, String endPriceRaw) {
		String kw = (keyWord != null) ? keyWord.toLowerCase().trim() : "";
		BigDecimal beginPrice = null;
		BigDecimal endPrice = null;
		try {
			if (beginPriceRaw != null && !beginPriceRaw.isEmpty())
				beginPrice = new BigDecimal(beginPriceRaw);
			if (endPriceRaw != null && !endPriceRaw.isEmpty())
				endPrice = new BigDecimal(endPriceRaw);
		} catch (NumberFormatException ignored) {
		}
		final BigDecimal bp = beginPrice;
		final BigDecimal ep = endPrice;
		final int cid = categoryId;
		Specification<Product> spec = (root, query, cb) -> {
			List<Predicate> predicates = new java.util.ArrayList<>();
			if (cid != 0) {
				predicates.add(cb.equal(root.get("category").get("id"), cid));
			}
			if (!kw.isEmpty()) {
				String pattern = "%" + kw + "%";
				predicates.add(cb.or(
						cb.like(cb.lower(root.get("name")), pattern),
						cb.like(cb.lower(root.get("shortDescription")), pattern),
						cb.like(cb.lower(root.get("detailDescription")), pattern),
						cb.like(cb.lower(root.get("seo")), pattern)));
			}
			if (bp != null && ep != null) {
				predicates.add(cb.between(root.get("salePrice"), bp, ep));
			}
			return cb.and(predicates.toArray(new Predicate[0]));
		};
		return productRepository.findAll(spec);
	}

	public List<Product> searchProduct(SearchModel productSearch) {
		final int statusInt = productSearch.getStatus();
		final int categoryId = productSearch.getCategoryId();
		final String keyword = productSearch.getKeyword();
		final String beginDateStr = productSearch.getBeginDate();
		final String endDateStr = productSearch.getEndDate();
		Date beginDate = null;
		Date endDate = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (beginDateStr != null && !beginDateStr.isEmpty())
				beginDate = sdf.parse(beginDateStr);
			if (endDateStr != null && !endDateStr.isEmpty())
				endDate = sdf.parse(endDateStr);
		} catch (Exception ignored) {
		}
		final Date bd = beginDate;
		final Date ed = endDate;
		Specification<Product> spec = (root, query, cb) -> {
			List<Predicate> predicates = new java.util.ArrayList<>();
			if (statusInt == 0 || statusInt == 1) {
				predicates.add(cb.equal(root.get("status"), statusInt == 1));
			}
			if (categoryId != 0) {
				predicates.add(cb.equal(root.get("category").get("id"), categoryId));
			}
			if (keyword != null && !keyword.isEmpty()) {
				String k = keyword.toLowerCase();
				String pattern = "%" + k + "%";
				predicates.add(cb.or(
						cb.like(cb.lower(root.get("name")), pattern),
						cb.like(cb.lower(root.get("shortDescription")), pattern),
						cb.like(cb.lower(root.get("seo")), pattern)));
			}
			if (bd != null && ed != null) {
				predicates.add(cb.between(root.get("createDate"), bd, ed));
			}
			return cb.and(predicates.toArray(new Predicate[0]));
		};
		return productRepository.findAll(spec);
	}

	public boolean isUploadFile(MultipartFile file) {
		return file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty();
	}

	public boolean isUploadFiles(MultipartFile[] files) {
		return files != null && files.length > 0;
	}

	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {

		if (isUploadFile(avatarFile)) {
			String path = uploadPathConfig.getUploadPath() + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		if (isUploadFiles(imageFiles)) {
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {
					String path = uploadPathConfig.getUploadPath() + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return productRepository.save(product);
	}

	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {

		Product dbProduct = productRepository.findById(product.getId()).orElse(null);
		if (dbProduct == null)
			return productRepository.save(product);

		if (isUploadFile(avatarFile)) {
			String path = uploadPathConfig.getUploadPath() + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			path = uploadPathConfig.getUploadPath() + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		} else {
			product.setAvatar(dbProduct.getAvatar());
		}
		if (isUploadFiles(imageFiles)) {
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {
					String path = uploadPathConfig.getUploadPath() + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return productRepository.save(product);
	}

	@Transactional
	public void deleteProduct(Product product) {
		List<ProductImage> productImages = productImageService.getProductImagesByProductId(product.getId());
		for (ProductImage productImage : productImages) {
			String path = uploadPathConfig.getUploadPath() + productImage.getPath();
			File file = new File(path);
			file.delete();
		}
		String path = uploadPathConfig.getUploadPath() + product.getAvatar();
		File file = new File(path);
		file.delete();
		productRepository.delete(product);
	}
}
