package vn.web.pet.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.ProductImage;
import vn.web.pet.repository.IProductImageRepository;

@Service
@RequiredArgsConstructor
public class ProductImageService {

	private final IProductImageRepository productImageRepository;

	public List<ProductImage> getProductImagesByProductId(int productId) {
		return productImageRepository.findByProduct_Id(productId);
	}
}
