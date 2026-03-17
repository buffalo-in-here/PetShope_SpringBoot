package vn.web.pet.configurer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import org.springframework.beans.factory.annotation.Autowired;

@Configuration
public class MvcConfigurer implements WebMvcConfigurer {

	@Autowired
	private UploadPathConfig uploadPathConfig;
	@Bean
	public ViewResolver viewResolver() {
		// Xu ly va tra ve doi tuong view thong qua ten
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	// Dang ky thu muc chua resource file (css, js, img, ...)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/frontend/**").addResourceLocations("classpath:/frontend/");
		registry.addResourceHandler("/backend/**").addResourceLocations("classpath:/backend/");
		
		// Cấu hình để hỗ trợ realtime khi upload ảnh mới
		// setCachePeriod(0) để không cache, ảnh mới sẽ hiển thị ngay lập tức
		registry.addResourceHandler("/UploadFiles/**")
				.addResourceLocations("file:" + uploadPathConfig.getUploadPath())
				.setCachePeriod(0);
	}

}
