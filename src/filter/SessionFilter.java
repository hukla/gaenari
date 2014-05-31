package filter;
/**
 * 작성자: 최성훈
 * 작성일: 2014-04-23
 * 내용  : session필터기능으로서 session의 유효여부를 판단하고
 * 		   session이 유효한 경우엔 url패턴에 의해 서블릿으로 이동할 때
 * 		   user정보인 id와 pwd를 setAttribute해준다.
 * 		   session이 유효하지 않은 경우엔 login.jsp페이지로 redirect해준다.
 * 
 * 수정 : 2014-05-31, 장재희
 * 내용 : logger 추가
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet Filter implementation class SessionFilter
 */
public class SessionFilter implements Filter {
	
	private final static Logger log = Logger.getLogger(SessionFilter.class);

    /**
     * Default constructor. 
     */
    public SessionFilter() { }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() { }

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		String email,username = null;
		email= request.getParameter("email");
		username = request.getParameter("username");
		
		if(session.isNew()){
			log.info("session null임!");
			if(email==null && username==null){
				response.sendRedirect("/gaenari/login.do"); // TODO
			}
		}else{
			String userid = null;
			String pwd = null;
			if(session.getAttribute("userid") == null && session.getAttribute("pwd") == null){
				log.info("session.getAttribute('userid')는 null임!");
				userid = request.getParameter("userid");
				pwd = request.getParameter("pwd");
			}else{
				log.info("session.getAttribute('userid') = "+(String)session.getAttribute("userid"));
				userid = (String) session.getAttribute("userid");
				pwd = (String) session.getAttribute("pwd");
			}
			session.setAttribute("userid",userid);
			session.setAttribute("pwd", pwd);
			
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException { }

}
