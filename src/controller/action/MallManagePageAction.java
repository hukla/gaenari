/**
 * 작성자 : 장재희
 * 내용 : 기부몰 관리하기 페이지로 이동
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MallManagePageAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("menuno", request.getParameter("menuno")); // 어떤 관리 페이지로 이동할 것인지 결정
		request.getRequestDispatcher("/mall/manage.jsp").forward(request, response);
	}

}
