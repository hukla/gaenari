package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InsertService;
import model.TestService;
import model.dto.DogDTO;
import model.dto.UserDTO;

public class DogInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String dogName,dogBirth,dogType=null;
		UserDTO user = null;
		List<DogDTO> dog = null;
		int dogage=0;
		
		try{
			user = (UserDTO)session.getAttribute("user");
			
			dogName = request.getParameter("dogname");
			dogBirth = request.getParameter("dogbirth");
			dogType = request.getParameter("dogtype");
			
			if(dogName.equals(null) || dogName.trim().length() == 0 
					|| dogBirth.equals(null) || dogBirth.trim().length() == 0
					|| dogType.equals(null) || dogType.trim().length() == 0){
				throw new Exception("강아지 정보를 모두 입력해주세요");
			}
			int prmYear = Integer.parseInt(dogBirth.substring(6, 10));
			int nowYear = (int) session.getAttribute("toYear");
			
			int prmMonth = Integer.parseInt(dogBirth.substring(0, 2));
			int nowMonth = (int) session.getAttribute("toMonth");
			
			dogage = nowYear - prmYear + 1;
			if(nowMonth-prmMonth<0){
				dogage = (dogage*12 - Math.abs(nowMonth-prmMonth))/12;
			}
			InsertService.insertDoginfo(new DogDTO(dogName,dogage,dogType,user.getUserno()));
			dog = TestService.getMyDogInfo(user.getUserno());
			request.setAttribute("user", user);
			request.setAttribute("dog", dog);
			url="dogComplete.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
