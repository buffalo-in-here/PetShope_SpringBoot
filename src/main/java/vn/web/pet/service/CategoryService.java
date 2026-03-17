package vn.web.pet.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.Category;
import vn.web.pet.repository.ICategoryRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class CategoryService {

	private final ICategoryRepository categoryRepository;

	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	public Category getById(int id) {
		Optional<Category> opt = categoryRepository.findById(id);
		return opt.orElse(null);
	}

	public Category saveOrUpdate(Category category) {
		return categoryRepository.save(category);
	}

	public List<Category> findAllActive() {
		return categoryRepository.findByStatusTrue();
	}

	@Transactional
	public void deleteCategoryById(int categoryId) {
		categoryRepository.deleteById(categoryId);
	}
}
