package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.DogDTO;
import model.dto.UserDTO;
import exception.LoginException;
/**
 * 작성: 2014-05-29
 * 작성자: 최성훈
 * 내용: ajax비동기화 통신으로 조건에 해당하는 친구 검색결과 보내기
 */
public class SearchFriendsAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String searchType = null;
		String word = null;
		String result = "";
		List<DogDTO> dog = null;
		try {
			
			searchType = request.getParameter("searchType");
			word = request.getParameter("word");
			System.out.println("검색구분:"+searchType+", 검색단어:"+word);
			
			if(searchType!=null || word!=null){
				if(searchType.equals("userid"))	dog = UserDAO.logIdCheck(word);
				else if(searchType.equals("username"))	dog = UserDAO.logNameCheck(word);
				else if(searchType.equals("address"))	dog = UserDAO.logAddrCheck(word);
				result+="<users>";
				for (DogDTO dto : dog) {
					result += "<user>";
					result += "<username>" + dto.getUsername() + "</username>";
					result += "<userid>" + dto.getUserid() + "</userid>";
					result += "<dogname>" + dto.getDogname() + "</dogname>";
					result += "<dogkind>" + dto.getDogkind() + "</dogkind>";
					result += "<address>" + dto.getAddress() + "</address>";
					result += "</user>";
				}
				result+="</users>";
			}else{
				result+="<users>";
				result+="<user>";
				result+="<userid>"+"없다"+"</userid>";
				result+="<username>"+"없다"+"</username>";
				result+="<address>"+"없다"+"</address>";
				result+="</user>";
				result+="</users>";
			}
			
			out.print(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		} catch (LoginException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			out.print(e.getMessage());
		}
	}
}
