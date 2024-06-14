package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")

public class AccountFilter implements Filter {
	
	public void init(FilterConfig fConfig)throws ServletException{
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		
		String loginServletURI = httpRequest.getContextPath() + "/LoginServlet";
		
		boolean loggedIn = (session != null && session.getAttribute("accountMail") != null);
		
		boolean loginServletRequest = httpRequest.getRequestURI().equals(loginServletURI);
		
		if(loggedIn || loginServletRequest) {
			chain.doFilter(request, response);
		}else {
			httpResponse.sendRedirect(loginServletURI);
		}
	}
}
