/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-27
 * 내용 : detail.jsp로 이동
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MallDetailPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/mall/detail.jsp").forward(request, response);
	}

}
