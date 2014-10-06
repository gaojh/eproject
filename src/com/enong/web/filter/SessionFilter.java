package com.enong.web.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nutz.mvc.Mvcs;
import org.nutz.mvc.RequestPath;

public class SessionFilter implements Filter {
	private static final String IGNORE = "^.+\\.(jsp|png|gif|jpg|js|css|jspx|jpeg|swf|ico|json)$";
	private Pattern ignorePtn = Pattern.compile(IGNORE, 2);;
	private List<String> ignoreList = new ArrayList<String>();
	private static final String LOGIN_USERNAME = "YINONG_USER";

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse rep = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
		RequestPath path = Mvcs.getRequestPathObject(req);
		if ((session.getAttribute(LOGIN_USERNAME) == null) && (!checkIgnoreList(path.getPath())) && (!ignorePtn.matcher(path.getUrl()).find())) {
			rd.forward(req, rep);
			return;
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig cfg) throws ServletException {
		ignoreList.add("/login");
		ignoreList.add("/openLogin");
		ignoreList.add("/openRegister");
		ignoreList.add("/register/*");
		ignoreList.add("/return");
		ignoreList.add("/notify");
		ignoreList.add("/logout");
		ignoreList.add("/check/*");
	}
	
	public boolean checkIgnoreList(String path){
		boolean rtn = false;
		for(String s : ignoreList){
			if(s.endsWith("/*")){
				String str = s.substring(0, s.length()-2);
				if(path.startsWith(str)){
					rtn = true;
					break;
				}
			}else{
				if(path.equals(s)){
					rtn = true;
					break;
				}
			}
		}
		return rtn;
	}
}
