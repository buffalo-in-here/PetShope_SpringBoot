package vn.web.pet.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.SaleOrderProduct;
import vn.web.pet.repository.ISaleOrderProductRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class SaleOrderProductService {

	private final ISaleOrderProductRepository saleOrderProductRepository;

	public List<SaleOrderProduct> findAll() {
		return saleOrderProductRepository.findAll();
	}

	public SaleOrderProduct getById(int id) {
		Optional<SaleOrderProduct> opt = saleOrderProductRepository.findById(id);
		return opt.orElse(null);
	}

	public SaleOrderProduct saveOrUpdate(SaleOrderProduct entity) {
		return saleOrderProductRepository.save(entity);
	}

	public void deleteById(int id) {
		saleOrderProductRepository.deleteById(id);
	}
}
