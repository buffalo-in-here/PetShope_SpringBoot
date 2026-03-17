package vn.web.pet.configurer;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Filter để tự động chuyển hướng admin/staff từ trang client sang trang admin
 */
public class AdminRedirectFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		String requestPath = request.getRequestURI();
		
		// Check xem user có đang truy cập /index hay không
		if (requestPath.contains("/index") || requestPath.equals("/")) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			// Check xem user đã login và có role ADMIN hoặc STAFF
			if (auth != null && auth.isAuthenticated() && !auth.getAuthorities().isEmpty()) {
				for (GrantedAuthority authority : auth.getAuthorities()) {
					String role = authority.getAuthority();
					if ("ROLE_ADMIN".equals(role) || "ROLE_STAFF".equals(role)) {
						// Redirect admin/staff sang /admin/home
						String contextPath = request.getContextPath();
						response.sendRedirect(contextPath + "/admin/home");
						return;
					}
				}
			}
		}
		
		filterChain.doFilter(request, response);
	}
}
