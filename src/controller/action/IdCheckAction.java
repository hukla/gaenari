package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;
import exception.LoginException;
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
		UserDTO user= null;
		
		try {
			if(request.getParameter("id").length()<4){
				result = "4자 이상으로 입력해주세요";
			}
			user = UserDAO.idCheck(request.getParameter("id"));
			if(user!=null){
				result = "현재 사용중인 ID입니다.";
			}
			out.print(result);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
	}
}
