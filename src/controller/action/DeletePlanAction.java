package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeleteService;
import model.TestService;
/**
 * 작성:2014-05-21
 * 작성자: 최성훈
 * 내용: brdno에 해당하는 일정 정보를 삭제
 */
public class DeletePlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/error.jsp";
		String brdno = null;
		try{
			brdno = request.getParameter("brdno");
			if(brdno.equals(null) || brdno.trim().length()==0)	throw new Exception("정보없습니다.");
			
			DeleteService.deletePlan(Integer.parseInt(brdno));	//foreign key로인해 plan정보부터 삭제
			DeleteService.deleteBoard(Integer.parseInt(brdno));	//plan정보 삭제 후 board정보 삭제
			
			url="control?command=planList";
		}catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
