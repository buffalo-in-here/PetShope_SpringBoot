package vn.web.pet.configurer;

import java.io.File;
import java.math.BigDecimal;
import java.util.Date;

import javax.annotation.PostConstruct;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import vn.web.pet.model.Category;
import vn.web.pet.model.Product;
import vn.web.pet.model.ProductImage;
import vn.web.pet.model.Role;
import vn.web.pet.model.User;
import vn.web.pet.service.CategoryService;
import vn.web.pet.service.ProductService;
import vn.web.pet.service.RoleService;
import vn.web.pet.service.UserService;

@Component
@RequiredArgsConstructor
public class DataSeeder {

	private final UploadPathConfig uploadPathConfig;

	private final RoleService roleService;

	private final UserService userService;

	private final CategoryService categoryService;

	private final ProductService productService;

	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(4);

	@PostConstruct
	public void seed() {
		ensureUploadFolders();
		seedRoles();
		seedUsers();
		seedCategories();
		seedProducts();
	}

	private void ensureUploadFolders() {
		String base = uploadPathConfig.getUploadPath();
		new File(base + "Product" + File.separator + "Avatar").mkdirs();
		new File(base + "Product" + File.separator + "Image").mkdirs();
		new File(base + "ContactFiles").mkdirs();
	}

	private void seedRoles() {
		if (!roleService.findAll().isEmpty())
			return;

		saveRole("ROLE_ADMIN", "Quản trị viên");
		saveRole("ROLE_STAFF", "Nhân viên");
		saveRole("ROLE_USER", "Người dùng");
	}

	private void saveRole(String name, String description) {
		Role r = new Role();
		r.setName(name);
		r.setDescription(description);
		r.setStatus(true);
		r.setCreateDate(new Date());
		r.setUpdateDate(new Date());
		roleService.saveOrUpdate(r);
	}

	private void seedUsers() {
		if (!userService.findAll().isEmpty())
			return;

		seedUser("admin", "123456", "Admin", "admin@pet.com", "0901234567", "Địa chỉ admin", "ROLE_ADMIN");
		seedUser("staff", "123456", "Nhân viên", "staff@pet.com", "0901234568", "Địa chỉ staff", "ROLE_STAFF");
		seedUser("user", "123456", "Người dùng", "user@pet.com", "0901234569", "Địa chỉ user", "ROLE_USER");
	}

	private void seedUser(String username, String rawPassword, String name, String email, String mobile, String address, String roleName) {

		// Tạo user mới
		User user = new User();
		user.setUsername(username);
		user.setPassword(passwordEncoder.encode(rawPassword));
		user.setName(name);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setAddress(address);
		user.setStatus(true);
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());

		// Lưu user trước
		userService.saveOrUpdate(user);

		// Gán role cho user
		Role role = roleService.getRoleByName(roleName);
		role.getUsers().add(user);
		roleService.saveOrUpdate(role);
	}

	private void seedCategories() {
		if (!categoryService.findAll().isEmpty())
			return;

		// Lấy admin user để gán làm người tạo category
		User admin = userService.findAll().stream()
				.filter(u -> "admin".equals(u.getUsername()))
				.findFirst()
				.orElse(null);

		// Categories cho chó
		seedCategory("Chó Corgi", "Giống chó Corgi nhỏ nhắn, chân ngắn, thông minh và thân thiện", "cho-corgi", admin);
		seedCategory("Chó Poodle", "Giống chó Poodle thông minh, lông xoăn, dễ huấn luyện", "cho-poodle", admin);
		seedCategory("Chó Becgie", "Giống chó Becgie Đức thông minh, trung thành, phù hợp làm chó nghiệp vụ", "cho-becgie", admin);
		seedCategory("Chó Alaska", "Giống chó Alaska Malamute to lớn, mạnh mẽ, lông dày", "cho-alaska", admin);
		seedCategory("Chó Husky", "Giống chó Husky Siberian năng động, mắt xanh đặc trưng", "cho-husky", admin);
		seedCategory("Chó Phú Quốc", "Giống chó Phú Quốc thuần Việt, thông minh và trung thành", "cho-phu-quoc", admin);
		seedCategory("Chó Samoyed", "Giống chó Samoyed lông trắng, thân thiện, luôn tươi cười", "cho-samoyed", admin);
		seedCategory("Chó Collie", "Giống chó Collie thông minh, lông dài, dễ huấn luyện", "cho-collie", admin);

		// Categories cho mèo
		seedCategory("Mèo Anh Lông Ngắn", "Giống mèo Anh lông ngắn (ALN) dễ nuôi, hiền lành", "meo-anh-long-ngan", admin);
		seedCategory("Mèo Ba Tư", "Giống mèo Ba Tư lông dài, mặt tròn, sang trọng", "meo-ba-tu", admin);
		seedCategory("Mèo Ragdoll", "Giống mèo Ragdoll hiền lành, lông mềm mại, thích được ôm", "meo-ragdoll", admin);
		seedCategory("Mèo Bengal", "Giống mèo Bengal vằn như báo, năng động và thông minh", "meo-bengal", admin);
		seedCategory("Mèo Himalaya", "Giống mèo Himalaya lai giữa Ba Tư và Xiêm, mắt xanh", "meo-himalaya", admin);
		seedCategory("Mèo Xiêm", "Giống mèo Xiêm mảnh mai, mắt xanh, thông minh", "meo-xiem", admin);
		seedCategory("Mèo Mỹ Lông Ngắn", "Giống mèo Mỹ lông ngắn khỏe mạnh, dễ nuôi", "meo-my-long-ngan", admin);
	}

	private void seedCategory(String name, String description, String seo, User creator) {
		Category category = new Category();
		category.setName(name);
		category.setDescription(description);
		category.setSeo(seo);
		category.setStatus(true);
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());
		if (creator != null) {
			category.setUserCreateCategory(creator);
			category.setUserUpdateCategory(creator);
		}
		categoryService.saveOrUpdate(category);
	}

	private void seedProducts() {
		if (!productService.findAll().isEmpty())
			return;

		// Lấy admin user để gán làm người tạo product
		User admin = userService.findAll().stream()
				.filter(u -> "admin".equals(u.getUsername()))
				.findFirst()
				.orElse(null);

		// Seed products cho chó
		seedDogsProducts(admin);
		
		// Seed products cho mèo
		seedCatsProducts(admin);
	}

	private void seedDogsProducts(User creator) {
		// Chó Corgi
		Category corgiCategory = categoryService.findAll().stream()
				.filter(c -> "cho-corgi".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Corgi Pembroke Welsh", "Chó Corgi Pembroke Welsh thuần chủng, 3 tháng tuổi, đã tiêm phòng đầy đủ. Tính cách thân thiện, thông minh, dễ huấn luyện.", 
				new BigDecimal("15000000"), new BigDecimal("12000000"), 10, "Pembroke-Welsh-Corgi_av0.webp", corgiCategory, creator);
		
		seedProduct("Chó Corgi Cardigan", "Chó Corgi Cardigan thuần chủng, 4 tháng tuổi, khỏe mạnh, đã tẩy giun. Chân ngắn đặc trưng, lông đẹp.", 
				new BigDecimal("18000000"), new BigDecimal("15000000"), 8, "corgi-cardigan-av0.jpg", corgiCategory, creator);
		
		seedProduct("Chó Corgi Mix", "Chó Corgi lai, 2 tháng tuổi, màu sắc đa dạng. Giá cả phải chăng, phù hợp nuôi làm thú cưng.", 
				new BigDecimal("8000000"), new BigDecimal("6500000"), 15, "corgi-mixes_av0.jpg", corgiCategory, creator);

		// Chó Poodle
		Category poodleCategory = categoryService.findAll().stream()
				.filter(c -> "cho-poodle".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Poodle Toy", "Chó Poodle Toy thuần chủng, kích thước nhỏ, lông xoăn đặc trưng. Thông minh, dễ huấn luyện, phù hợp sống trong căn hộ.", 
				new BigDecimal("12000000"), new BigDecimal("10000000"), 12, "cho-toy-poodle_av0.jpg", poodleCategory, creator);
		
		seedProduct("Chó Poodle Miniature", "Chó Poodle Miniature, 5 tháng tuổi, đã cắt tỉa lông chuyên nghiệp. Tính cách vui vẻ, thân thiện với trẻ em.", 
				new BigDecimal("16000000"), new BigDecimal("13500000"), 6, "Miniature-Poodle_av0.jpg", poodleCategory, creator);
		
		seedProduct("Chó Poodle Standard", "Chó Poodle Standard kích thước lớn, lông trắng tinh khôi. Giống chó quý tộc, thông minh và trung thành.", 
				new BigDecimal("20000000"), new BigDecimal("17000000"), 4, "standard_poodie_av0.jpg", poodleCategory, creator);
		
		seedProduct("Chó Poodle Phantom", "Chó Poodle Phantom màu đen phối nâu, rất hiếm và đẹp. Đã huấn luyện cơ bản, biết ngồi, nằm, đứng.", 
				new BigDecimal("25000000"), new BigDecimal("22000000"), 3, "Phantom-Poodle-av0.jpg", poodleCategory, creator);

		// Chó Becgie
		Category becgieCategory = categoryService.findAll().stream()
				.filter(c -> "cho-becgie".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Becgie Đức Lông Dài", "Chó Becgie Đức lông dài thuần chủng, 6 tháng tuổi. Thông minh, trung thành, phù hợp làm chó canh gác.", 
				new BigDecimal("22000000"), new BigDecimal("18000000"), 5, "becgie-duc_longdai_av0.jpg", becgieCategory, creator);
		
		seedProduct("Chó Becgie Đức Đen", "Chó Becgie Đức màu đen thuần chủng, dòng máu nhập khẩu. Khỏe mạnh, thông minh, dễ huấn luyện.", 
				new BigDecimal("25000000"), new BigDecimal("20000000"), 4, "becgie_den_av0.webp", becgieCategory, creator);
		
		seedProduct("Chó Becgie Sable", "Chó Becgie màu sable (nâu vàng), 4 tháng tuổi. Tính cách ổn định, thích hợp làm chó gia đình.", 
				new BigDecimal("20000000"), new BigDecimal("16000000"), 7, "becgie_sabe_av0.jpg", becgieCategory, creator);
		
		seedProduct("Chó Becgie Trắng", "Chó Becgie màu trắng hiếm có, 5 tháng tuổi. Ngoại hình nổi bật, tính cách hiền lành.", 
				new BigDecimal("28000000"), new BigDecimal("24000000"), 2, "becgie_trang_av0.webp", becgieCategory, creator);

		// Chó Alaska
		Category alaskaCategory = categoryService.findAll().stream()
				.filter(c -> "cho-alaska".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Alaska Malamute", "Chó Alaska Malamute thuần chủng, 4 tháng tuổi. Kích thước lớn, lông dày, phù hợp nuôi ở vùng mát.", 
				new BigDecimal("30000000"), new BigDecimal("25000000"), 3, "alaska_malamute_av0.webp", alaskaCategory, creator);

		// Chó Husky
		Category huskyCategory = categoryService.findAll().stream()
				.filter(c -> "cho-husky".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Husky Siberian", "Chó Husky Siberian mắt xanh đặc trưng, 5 tháng tuổi. Năng động, thích chạy nhảy, cần không gian rộng.", 
				new BigDecimal("28000000"), new BigDecimal("23000000"), 4, "Siberian-Husky_av0.webp", huskyCategory, creator);

		// Chó Phú Quốc
		Category phuQuocCategory = categoryService.findAll().stream()
				.filter(c -> "cho-phu-quoc".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Phú Quốc Đen", "Chó Phú Quốc thuần Việt màu đen, 3 tháng tuổi. Giống chó bản địa quý hiếm, thông minh và trung thành.", 
				new BigDecimal("8000000"), new BigDecimal("6000000"), 10, "anh-cho-phu-quoc-922929_den_av0.jpg", phuQuocCategory, creator);
		
		seedProduct("Chó Phú Quốc Nâu", "Chó Phú Quốc màu nâu, 4 tháng tuổi. Khỏe mạnh, thích ứng tốt với khí hậu nhiệt đới.", 
				new BigDecimal("7500000"), new BigDecimal("5500000"), 12, "anh-cho-phu-quoc-nau_av0.jpg", phuQuocCategory, creator);
		
		seedProduct("Chó Phú Quốc Lai", "Chó Phú Quốc lai, 2 tháng tuổi. Giá cả phải chăng, phù hợp làm thú cưng gia đình.", 
				new BigDecimal("4000000"), new BigDecimal("3000000"), 20, "phuquoc_lai_av0.jpg", phuQuocCategory, creator);
		
		seedProduct("Chó Phú Quốc Trắng", "Chó Phú Quốc màu trắng hiếm có, 6 tháng tuổi. Ngoại hình đẹp, tính cách thân thiện.", 
				new BigDecimal("10000000"), new BigDecimal("8000000"), 5, "phuquoc_trang_av0.jpg", phuQuocCategory, creator);

		// Chó Samoyed
		Category samoyedCategory = categoryService.findAll().stream()
				.filter(c -> "cho-samoyed".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Samoyed", "Chó Samoyed lông trắng như tuyết, 4 tháng tuổi. Tính cách vui vẻ, luôn tươi cười, thân thiện với mọi người.", 
				new BigDecimal("35000000"), new BigDecimal("30000000"), 2, "samoyed_av0.webp", samoyedCategory, creator);

		// Chó Collie
		Category collieCategory = categoryService.findAll().stream()
				.filter(c -> "cho-collie".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Chó Collie", "Chó Collie lông dài thuần chủng, 5 tháng tuổi. Thông minh, dễ huấn luyện, phù hợp làm chó chăn cừu.", 
				new BigDecimal("18000000"), new BigDecimal("15000000"), 6, "collie_av0.webp", collieCategory, creator);
	}

	private void seedCatsProducts(User creator) {
		// Mèo Anh Lông Ngắn
		Category alnCategory = categoryService.findAll().stream()
				.filter(c -> "meo-anh-long-ngan".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Anh Lông Ngắn Cinamon", "Mèo Anh lông ngắn màu cinamon, 3 tháng tuổi. Tính cách hiền lành, dễ nuôi, phù hợp với người mới bắt đầu.", 
				new BigDecimal("8000000"), new BigDecimal("6500000"), 15, "1-aln-1567-2048x1365_cinamon_av0.jpg", alnCategory, creator);
		
		seedProduct("Mèo Anh Lông Ngắn Bicolor", "Mèo Anh lông ngắn bicolor chân ngắn, 4 tháng tuổi. Ngoại hình đáng yêu, tính cách thân thiện.", 
				new BigDecimal("12000000"), new BigDecimal("10000000"), 8, "Meo-Anh-Bicinamon-Chân-ngắn-mã-ALN1728-av0.jpg", alnCategory, creator);
		
		seedProduct("Mèo Anh Lông Ngắn Chocolate", "Mèo Anh lông ngắn màu chocolate chân cao, 5 tháng tuổi. Màu sắc hiếm, ngoại hình thanh lịch.", 
				new BigDecimal("15000000"), new BigDecimal("12000000"), 5, "meo-anh-long-ngan-mau-chocolate-chan-cao_av0.jpg", alnCategory, creator);
		
		seedProduct("Mèo Anh Lông Ngắn Bichoco", "Mèo Anh lông ngắn bichoco chân lùn, 2 tháng tuổi. Kích thước nhỏ nhắn, rất đáng yêu.", 
				new BigDecimal("18000000"), new BigDecimal("15000000"), 3, "meo-bichoco-long-ngan-chan-lun_av0.jpg", alnCategory, creator);

		// Mèo Ba Tư
		Category baTuCategory = categoryService.findAll().stream()
				.filter(c -> "meo-ba-tu".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Ba Tư Golden", "Mèo Ba Tư màu golden, 4 tháng tuổi. Lông dài mềm mại, mặt tròn đặc trưng, tính cách hiền lành.", 
				new BigDecimal("20000000"), new BigDecimal("16000000"), 6, "anh-meo-ba-tu-292929_dolden_av0.jpg", baTuCategory, creator);
		
		seedProduct("Mèo Ba Tư Lilac", "Mèo Ba Tư màu lilac hiếm có, 5 tháng tuổi. Màu sắc độc đáo, lông mềm như nhung.", 
				new BigDecimal("25000000"), new BigDecimal("20000000"), 3, "anh-meo-ba-tu-3933030307899_lilac_av0.jpg", baTuCategory, creator);
		
		seedProduct("Mèo Ba Tư Xám", "Mèo Ba Tư màu xám, 3 tháng tuổi. Ngoại hình sang trọng, phù hợp làm mèo cảnh.", 
				new BigDecimal("18000000"), new BigDecimal("15000000"), 8, "anh-meo-ba-tu-3933030309899_xam_av0.jpg", baTuCategory, creator);
		
		seedProduct("Mèo Ba Tư Kem", "Mèo Ba Tư màu kem, 6 tháng tuổi. Lông dài óng ả, đã quen với việc chải lông hàng ngày.", 
				new BigDecimal("22000000"), new BigDecimal("18000000"), 4, "meo-batu_kem_90030303.jpg", baTuCategory, creator);
		
		seedProduct("Mèo Ba Tư Vàng Kem", "Mèo Ba Tư màu vàng kem, 4 tháng tuổi. Màu sắc ấm áp, tính cách dịu dàng.", 
				new BigDecimal("20000000"), new BigDecimal("17000000"), 5, "meo-batu_vangkem_av0.jpg", baTuCategory, creator);

		// Mèo Ragdoll
		Category ragdollCategory = categoryService.findAll().stream()
				.filter(c -> "meo-ragdoll".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Ragdoll Kem", "Mèo Ragdoll màu kem, 4 tháng tuổi. Tính cách hiền lành như búp bê, thích được ôm ấp.", 
				new BigDecimal("25000000"), new BigDecimal("20000000"), 4, "anh-meo-ragdoll-200202008900088_kem.jpg", ragdollCategory, creator);
		
		seedProduct("Mèo Ragdoll Nâu", "Mèo Ragdoll màu nâu, 5 tháng tuổi. Kích thước lớn, lông mềm mại, tính cách dịu dàng.", 
				new BigDecimal("28000000"), new BigDecimal("23000000"), 3, "anh-meo-ragdoll-20020200989023_nau_av0.jpg", ragdollCategory, creator);
		
		seedProduct("Mèo Ragdoll Xám", "Mèo Ragdoll màu xám, 3 tháng tuổi. Mắt xanh đẹp, lông dài mềm mại.", 
				new BigDecimal("26000000"), new BigDecimal("21000000"), 5, "anh-meo-ragdoll-20020200989023_xu_av0.jpg", ragdollCategory, creator);
		
		seedProduct("Mèo Ragdoll Lilac", "Mèo Ragdoll màu lilac, 6 tháng tuổi. Màu sắc hiếm, ngoại hình quý phái.", 
				new BigDecimal("30000000"), new BigDecimal("25000000"), 2, "anh-meo-ragdoll-2002020099003_lilac_av0.jpg", ragdollCategory, creator);
		
		seedProduct("Mèo Ragdoll Blue", "Mèo Ragdoll màu blue, 4 tháng tuổi. Màu xanh xám đặc trưng, mắt xanh trong vắt.", 
				new BigDecimal("27000000"), new BigDecimal("22000000"), 4, "anh-meo-ragdoll-9393939a888_blue_av0.jpg", ragdollCategory, creator);
		
		seedProduct("Mèo Ragdoll Vàng", "Mèo Ragdoll màu vàng, 5 tháng tuổi. Lông dài óng ả, tính cách thân thiện.", 
				new BigDecimal("24000000"), new BigDecimal("19000000"), 6, "ragdoll_vang_av0.jpg", ragdollCategory, creator);

		// Mèo Bengal
		Category bengalCategory = categoryService.findAll().stream()
				.filter(c -> "meo-bengal".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Bengal Đen", "Mèo Bengal màu đen vằn, 3 tháng tuổi. Vằn như báo đen, năng động và thông minh.", 
				new BigDecimal("22000000"), new BigDecimal("18000000"), 5, "bengal_den_av0.jpg", bengalCategory, creator);
		
		seedProduct("Mèo Bengal Tam Thể", "Mèo Bengal tam thể, 4 tháng tuổi. Màu sắc độc đáo, tính cách năng động.", 
				new BigDecimal("25000000"), new BigDecimal("20000000"), 3, "Bengal_tam_the_av0.jpg", bengalCategory, creator);
		
		seedProduct("Mèo Bengal Nâu", "Mèo Bengal màu nâu vằn, 5 tháng tuổi. Vằn đẹp như báo, thích leo trèo.", 
				new BigDecimal("20000000"), new BigDecimal("16000000"), 7, "bengal_tran_av0.jpg", bengalCategory, creator);
		
		seedProduct("Mèo Bengal Vàng", "Mèo Bengal màu vàng, 3 tháng tuổi. Vằn rõ nét, tính cách hoạt bát.", 
				new BigDecimal("23000000"), new BigDecimal("19000000"), 4, "Bengal_vang_av0.jpg", bengalCategory, creator);
		
		seedProduct("Mèo Bengal Bạc", "Mèo Bengal màu bạc, 6 tháng tuổi. Màu sắc hiếm, vằn đẹp như báo tuyết.", 
				new BigDecimal("28000000"), new BigDecimal("23000000"), 2, "bengal_van_av0.png", bengalCategory, creator);

		// Mèo Himalaya
		Category himalayaCategory = categoryService.findAll().stream()
				.filter(c -> "meo-himalaya".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Himalaya Nâu", "Mèo Himalaya màu nâu, 4 tháng tuổi. Lai giữa Ba Tư và Xiêm, mắt xanh đẹp.", 
				new BigDecimal("18000000"), new BigDecimal("15000000"), 6, "anh-meo-himalaya_nau-888838999_av0.jpg", himalayaCategory, creator);
		
		seedProduct("Mèo Himalaya Blue", "Mèo Himalaya màu blue point, 5 tháng tuổi. Mắt xanh trong vắt, lông mềm mại.", 
				new BigDecimal("20000000"), new BigDecimal("16000000"), 4, "meo-himalaya_blue-92002020209890_av0.jpg", himalayaCategory, creator);
		
		seedProduct("Mèo Himalaya Trắng", "Mèo Himalaya màu trắng, 3 tháng tuổi. Lông trắng tinh khôi, mắt xanh đặc trưng.", 
				new BigDecimal("22000000"), new BigDecimal("18000000"), 3, "meo-himalaya_trang-92002020209990_av0.jpg", himalayaCategory, creator);
		
		seedProduct("Mèo Himalaya Xám", "Mèo Himalaya màu xám, 6 tháng tuổi. Màu sắc thanh lịch, tính cách hiền lành.", 
				new BigDecimal("19000000"), new BigDecimal("15500000"), 5, "meo-himalaya_xu-92002020209890_av0.jpg", himalayaCategory, creator);

		// Mèo Xiêm
		Category xiemCategory = categoryService.findAll().stream()
				.filter(c -> "meo-xiem".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Xiêm", "Mèo Xiêm thuần chủng, 4 tháng tuổi. Mảnh mai, mắt xanh, tính cách thông minh và năng động.", 
				new BigDecimal("15000000"), new BigDecimal("12000000"), 8, "MeoXiemAva.webp", xiemCategory, creator);

		// Mèo Mỹ Lông Ngắn
		Category myLongNganCategory = categoryService.findAll().stream()
				.filter(c -> "meo-my-long-ngan".equals(c.getSeo()))
				.findFirst().orElse(null);
		
		seedProduct("Mèo Mỹ Lông Ngắn", "Mèo Mỹ lông ngắn, 3 tháng tuổi. Khỏe mạnh, dễ nuôi, thích hợp với khí hậu Việt Nam.", 
				new BigDecimal("6000000"), new BigDecimal("4500000"), 12, "meo-my-long-ngan-1_ava.webp", myLongNganCategory, creator);
	}

	private void seedProduct(String title, String description, BigDecimal price, BigDecimal salePrice, 
			int quantity, String avatarFileName, Category category, User creator) {
		
		Product product = new Product();
		product.setName(title);
		product.setShortDescription(description);
		product.setPrice(price);
		product.setSalePrice(salePrice);
		// Note: Product model không có trường quantity, chỉ dùng parameter để tham khảo
		product.setStatus(true);
		product.setIsHot(Math.random() < 0.3); // 30% sản phẩm là hot
		product.setCreateDate(new Date());
		product.setUpdateDate(new Date());
		
		// Set avatar path
		if (avatarFileName != null && !avatarFileName.isEmpty()) {
			product.setAvatar("Product/Avatar/" + avatarFileName);
		}
		
		if (category != null) {
			product.setCategory(category);
		}
		
		if (creator != null) {
			product.setUserCreateProduct(creator);
			product.setUserUpdateProduct(creator);
		}
		
		// Tạo SEO từ title
		String seo = title.toLowerCase()
				.replaceAll("[àáạảãâầấậẩẫăằắặẳẵÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴ]", "a")
				.replaceAll("[èéẹẻẽêềếệểễÈÉẸẺẼÊỀẾỆỂỄ]", "e")
				.replaceAll("[ìíịỉĩÌÍỊỈĨ]", "i")
				.replaceAll("[òóọỏõôồốộổỗơờớợởỡÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ]", "o")
				.replaceAll("[ùúụủũưừứựửữÙÚỤỦŨƯỪỨỰỬỮ]", "u")
				.replaceAll("[ỳýỵỷỹỲÝỴỶỸ]", "y")
				.replaceAll("[đĐ]", "d")
				.replaceAll("[^a-z0-9\\s-]", "")
				.replaceAll("\\s+", "-")
				.replaceAll("-+", "-")
				.replaceAll("^-|-$", "")
				.trim();
		product.setSeo(seo);
		
		// Lưu product trước
		productService.saveOrUpdate(product);
		
		// Tạo ProductImage cho avatar
		if (avatarFileName != null && !avatarFileName.isEmpty()) {
			ProductImage avatar = new ProductImage();
			avatar.setTitle(avatarFileName);
			avatar.setPath("Product/Avatar/" + avatarFileName);
			avatar.setStatus(true);
			avatar.setCreateDate(new Date());
			avatar.setUpdateDate(new Date());
			avatar.setProduct(product);
			
			// Thêm avatar vào product
			product.getProductImages().add(avatar);
		}
		
		// Thêm ảnh chi tiết dựa trên tên file avatar
		addDetailImages(product, avatarFileName);
		
		// Lưu lại product với tất cả ảnh
		productService.saveOrUpdate(product);
	}
	
	private void addDetailImages(Product product, String avatarFileName) {
		if (avatarFileName == null || avatarFileName.isEmpty()) {
			return;
		}
		
		// Xử lý các trường hợp đặc biệt
		if ("MeoBaTuAva.jpg".equals(avatarFileName)) {
			// Thêm ảnh chi tiết cho MeoBaTu
			addImageIfExists(product, "MeoBaTu_A1.jpg");
			addImageIfExists(product, "MeoBaTu_A2.jpg");
			addImageIfExists(product, "MeoBaTu_A3.jpg");
			addImageIfExists(product, "MeoBaTu_A4.jpg");
			return;
		}
		
		if ("MeoXiemAva.webp".equals(avatarFileName)) {
			// Thêm ảnh chi tiết cho MeoXiem
			addImageIfExists(product, "MeoXiem_a1.jpg");
			addImageIfExists(product, "MeoXiem_a2.jpg");
			addImageIfExists(product, "MeoXiem_a3.jpg");
			addImageIfExists(product, "MeoXiem_a4.jpg");
			return;
		}
		
		if ("meo-my-long-ngan-1_ava.webp".equals(avatarFileName)) {
			// Thêm ảnh chi tiết cho mèo Mỹ
			addImageIfExists(product, "meo-my-1_a_1.webp");
			addImageIfExists(product, "meo-my-a_2.jpg");
			addImageIfExists(product, "meo-my-1_a_3.webp");
			addImageIfExists(product, "meo-my-1_a_4.webp");
			return;
		}
		
		// Tạo base name từ avatar filename (bỏ đuôi _av0)
		String baseName = avatarFileName.replaceAll("_av0\\.(jpg|jpeg|png|webp)$", "");
		
		// Danh sách các ảnh chi tiết có thể có
		String[] possibleExtensions = {".jpg", ".jpeg", ".png", ".webp"};
		String[] possibleSuffixes = {"_av1", "_av2", "_av3", "_a1", "_a2", "_a3", "_a4", "_A1", "_A2", "_A3", "_A4"};
		
		for (String suffix : possibleSuffixes) {
			for (String ext : possibleExtensions) {
				String detailImageName = baseName + suffix + ext;
				addImageIfExists(product, detailImageName);
			}
		}
	}
	
	private void addImageIfExists(Product product, String imageName) {
		if (isImageExists(imageName)) {
			ProductImage detailImage = new ProductImage();
			detailImage.setTitle(imageName);
			detailImage.setPath("Product/Image/" + imageName);
			detailImage.setStatus(true);
			detailImage.setCreateDate(new Date());
			detailImage.setUpdateDate(new Date());
			detailImage.setProduct(product);
			
			product.getProductImages().add(detailImage);
		}
	}
	
	private boolean isImageExists(String imageName) {
		// Danh sách các ảnh chi tiết có sẵn (từ thư mục Image)
		String[] availableImages = {
			"1-aln-1567-2048x1365_cinamon_av1.jpg", "1-aln-1567-2048x1365_cinamon_av2.jpg", "1-aln-1567-2048x1365_cinamon_av3.jpg",
			"450px-Greenland_Dog_av1.jpg",
			"alaska_malamute_av1.webp", "alaska_malamute_av2.webp", "alaska_malamute_av3.webp",
			"anh-cho-phu-quoc-922929_den_av1.jpg",
			"anh-cho-phu-quoc-nau_av1.jpg", "anh-cho-phu-quoc-nau_av2.jpg",
			"anh-meo-anh-long-ngan-193003_av1.jpg", "anh-meo-anh-long-ngan-193003_av2.jpg", "anh-meo-anh-long-ngan-193003_av3.jpg",
			"anh-meo-ba-tu-292929_dolden_av1.jpg",
			"anh-meo-ba-tu-3933030307899_lilac_av1.jpg",
			"anh-meo-ba-tu-3933030309899_xam_av1.jpg",
			"anh-meo-himalaya_nau-888838999_av1.jpg",
			"anh-meo-ragdoll-20020200989023_nau_av1.jpg", "anh-meo-ragdoll-20020200989023_nau_av2.jpg", "anh-meo-ragdoll-20020200989023_nau_av3.jpg",
			"anh-meo-ragdoll-20020200989023_xu_av1.jpg",
			"anh-meo-ragdoll-2002020099003_lilac_av1.jpg",
			"anh-meo-ragdoll-9393939a888_blue_av1.jpg",
			"becgie_den_av1.webp", "becgie_den_av2.webp",
			"becgie_ngan_av1.jpg", "becgie_ngan_av2.jpg",
			"becgie_sabe_av1.jpg", "becgie_sabe_av2.jpg",
			"becgie_trang_av1.webp", "becgie_trang_av2.webp",
			"becgie-duc_longdai_av1.jpg", "becgie-duc_longdai_av2.jpg",
			"bengal_den_av1.jpg", "bengal_den_av2.jpg", "bengal_den_av3.jpg",
			"Bengal_tam_the_av1.jpg", "Bengal_tam_the_av2.jpg",
			"bengal_tran_av1.jpg", "bengal_tran_av2.jpg", "bengal_tran_av3.jpg",
			"bengal_van_av1.png", "bengal_van_av2.png", "bengal_van_av3.png",
			"Canadian-Eskimo-Dog-overview_av1.jpg", "Canadian-Eskimo-Dog-overview_av2.jpg",
			"cho-toy-poodle_av1.jpg", "cho-toy-poodle_av2.jpg",
			"collie_av1.jpg", "collie_av2.jpg",
			"corgi-cardigan-av1.jpg", "corgi-cardigan-av2.jpg", "corgi-cardigan-av3.jpg",
			"corgi-mixes_av1.jpg", "corgi-mixes_av2.jpg", "corgi-mixes_av3.jpg",
			"Goldendoodle-vs-Poodle_av1.jpg", "Goldendoodle-vs-Poodle_av2.jpg",
			"Meo-Anh-Bicinamon-Chân-ngắn-mã-ALN1728-av1.jpg",
			"meo-anh-long-ngan-mau-chocolate-chan-cao_av1.jpg", "meo-anh-long-ngan-mau-chocolate-chan-cao_av2.jpg",
			"meo-batu_vangkem_av1.jpg",
			"meo-bichoco-long-ngan-chan-lun_av1.jpg", "meo-bichoco-long-ngan-chan-lun_av2.jpg", "meo-bichoco-long-ngan-chan-lun_av3.jpg",
			"meo-himalaya_blue-92002020209890_av1.jpg",
			"meo-himalaya_trang-92002020209990_av1.jpg",
			"meo-himalaya_xu-92002020209890_av1.jpg",
			"meo-himalaya-92002020208888_av1.jpg",
			"meo-my-1_a_1.webp", "meo-my-1_a_3.webp", "meo-my-1_a_4.webp", "meo-my-a_2.jpg",
			"MeoBaTu_A1.jpg", "MeoBaTu_A2.jpg", "MeoBaTu_A3.jpg", "MeoBaTu_A4.jpg",
			"MeoXiem_a1.jpg", "MeoXiem_a2.jpg", "MeoXiem_a3.jpg", "MeoXiem_a4.jpg",
			"Miniature-Poodle_av1.jpg", "Miniature-Poodle_av2.jpg",
			"Pembroke-Welsh-Corgi_av1.webp", "Pembroke-Welsh-Corgi_av2.webp", "Pembroke-Welsh-Corgi_av3.webp",
			"Phantom-Poodle-av1.jpg", "Phantom-Poodle-av2.jpg",
			"phuquoc_lai_av1.jpg", "phuquoc_lai_av2.jpg",
			"phuquoc_trang_av1.jpg",
			"ragdoll_vang_av1.jpg", "ragdoll_vang_av2.jpg",
			"samoyed_av1.webp", "samoyed_av2.webp",
			"Siberian-Husky_av1.webp", "Siberian-Husky_av2.webp",
			"standard_poodie_av1.jpg", "standard_poodie_av2.jpg",
			"swedishvallhunds_av1.jpg"
		};
		
		for (String availableImage : availableImages) {
			if (availableImage.equals(imageName)) {
				return true;
			}
		}
		return false;
	}
}
