package vn.web.pet.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import vn.web.pet.model.SaleOrder;
import vn.web.pet.repository.ISaleOrderRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class SaleOrderService {

	private final ISaleOrderRepository saleOrderRepository;

	public List<SaleOrder> findAll() {
		return saleOrderRepository.findAll();
	}

	public SaleOrder getById(int id) {
		Optional<SaleOrder> opt = saleOrderRepository.findById(id);
		return opt.orElse(null);
	}

	public SaleOrder saveOrUpdate(SaleOrder saleOrder) {
		return saleOrderRepository.save(saleOrder);
	}

	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		return saleOrderRepository.save(saleOrder);
	}

	public List<SaleOrder> findAllActive() {
		return saleOrderRepository.findByStatusTrue();
	}

	@Transactional
	public BigDecimal countNewOfMonuth() {
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
		int currentYear = currentDate.getYear();
		BigDecimal sum = saleOrderRepository.sumTotalByCreateDateMonthAndYear(currentMonth, currentYear);
		return sum != null ? sum : BigDecimal.ZERO;
	}
}
