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
    
    public void init(FilterConfig fConfig) throws ServletException {
        // 初期化処理が必要であればここに記述
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String loginServletURI = httpRequest.getContextPath() + "/C0010";
        String dashboardURI = httpRequest.getContextPath() + "/C0020";
        String cssFilesURI = httpRequest.getContextPath() + "/css/";
        String jsFilesURI = httpRequest.getContextPath() + "/js/";
        String fontFilesURI = httpRequest.getContextPath() + "/font/";
        
        boolean loggedIn = (session != null && session.getAttribute("accountMail") != null);
        
        boolean loginServletRequest = httpRequest.getRequestURI().equals(loginServletURI);
        boolean cssRequest = httpRequest.getRequestURI().startsWith(cssFilesURI);
        boolean jsRequest = httpRequest.getRequestURI().startsWith(jsFilesURI);
        boolean fontRequest = httpRequest.getRequestURI().startsWith(fontFilesURI);
        
        // .jspファイルへの直接アクセスを禁止
        boolean jspRequest = httpRequest.getRequestURI().endsWith(".jsp");

        if (jspRequest) {
            if (loggedIn) {
                httpResponse.sendRedirect(dashboardURI);  // ログイン状態ならダッシュボードにリダイレクト
            } else {
                httpResponse.sendRedirect(loginServletURI);  // 非ログイン状態ならログイン画面にリダイレクト
            }
        } else if (loggedIn || loginServletRequest || cssRequest || jsRequest || fontRequest) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(loginServletURI);
        }
    }

    public void destroy() {
        // 終了処理が必要であればここに記述
    }
}
