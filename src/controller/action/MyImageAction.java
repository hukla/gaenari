package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;

public class MyImageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String userid = null;
		String image = null;
		UserDTO user = null;
		List<BoardDTO> diaryList = null;
		List<String> imageList = null;
		
		try{
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserDAO.logCheck(userid);
				}
			}
			diaryList = TestDAO.selectDiary(user);
			imageList = new ArrayList<String>();
			for(BoardDTO dto: diaryList){
				image = dto.getBrdcontent().split("!split!")[0];
				
				if(image!=null){
					imageList.add(image);
				}
			}
			for(String img: imageList){
				System.out.println(img);
			}
			request.setAttribute("user", user);
			request.setAttribute("imageList", imageList);
			
			url = "miniHome/myImages.jsp";
		} catch (Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	

}
