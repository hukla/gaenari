package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
/**
 * 작성: 최성훈
 * 작성일: 2014-05-28
 * 내용: 아이디 중복체크 ajax
 */
public class IdCheckAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String result = "사용 가능한 ID입니다.";
		
		try {
			if(UserDAO.logCheck(request.getParameter("id"))!=null){
				result = "현재 사용중인 ID입니다.";
			}
			out.print(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
