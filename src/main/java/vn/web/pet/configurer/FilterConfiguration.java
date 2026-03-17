package vn.web.pet.configurer;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuration để register AdminRedirectFilter
 */
@Configuration
public class FilterConfiguration {

	@Bean
	public AdminRedirectFilter adminRedirectFilter() {
		return new AdminRedirectFilter();
	}

	@Bean
	public FilterRegistrationBean<AdminRedirectFilter> filterRegistrationBean(AdminRedirectFilter filter) {
		FilterRegistrationBean<AdminRedirectFilter> registrationBean = new FilterRegistrationBean<>(filter);
		registrationBean.addUrlPatterns("/*");
		registrationBean.setOrder(1);  // Chạy trước các filter khác
		return registrationBean;
	}
}
