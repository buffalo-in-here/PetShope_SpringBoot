package vn.web.pet.configurer;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Cấu hình đường dẫn upload dùng thư mục tương đối (từ thư mục gốc project).
 */
@Configuration
public class UploadPathConfig {

	@Value("${pet.upload.dir:UploadFiles}")
	private String uploadDir;

	/**
	 * Đường dẫn đầy đủ tới thư mục upload (tương đối từ user.dir - thư mục chạy ứng dụng).
	 */
	public String getUploadPath() {
		return System.getProperty("user.dir") + File.separator + uploadDir + File.separator;
	}

	public String getUploadDir() {
		return uploadDir;
	}
}
