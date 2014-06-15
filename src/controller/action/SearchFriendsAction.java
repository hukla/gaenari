package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * 
 * 수정: 2014-05-30, 최성훈
 * 내용: 기르는 강아지가 없을 때 검색이 안되는 오류수정
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
		UserDTO user = null;
		try {
			searchType = request.getParameter("searchType");		// 주소,아이디,이름 중에 조건선택
			word = request.getParameter("word");					// 검색어
			if(searchType.equals("unchosen") || word.equals(null)){
				throw new Exception("입력 정보가 불충분합니다.");
			}
			if(searchType!=null || word!=null){
				if(searchType.equals("userid")){
					dog = UserDAO.logIdCheck(word);					//id검색시
					if(dog.isEmpty()){								//강아지 정보가 한 마리도 없을 때
						user = UserDAO.logCheck(word);
						dog = new ArrayList<DogDTO>();
						dog.add(new DogDTO(user.getUsername(),user.getUserid(),user.getEmail(),user.getAddress(),0));
					}
				}
				else if(searchType.equals("username")){
					dog = UserDAO.logNameCheck(word);				//이름검색시
				}
				else if(searchType.equals("address")){
					dog = UserDAO.logAddrCheck(word);				//주소검색시
				}
				result+="<users>";
				for (DogDTO dto : dog) {
					result += "<user>";
					result += "<username>" + dto.getUsername() + "</username>";
					result += "<userid>" + dto.getUserid() + "</userid>";
					result += "<email>" + dto.getEmail() + "</email>";
					result += "<address>" + dto.getAddress() + "</address>";
					result += "<dogage>" + dto.getDogage() + "</dogage>";
					result += "</user>";
				}
				result+="</users>";
			}
			out.print(result);
		} catch (SQLException e) {
			e.printStackTrace();
			out.print(e.getMessage());
		} catch (LoginException e) {
			e.printStackTrace();
			out.print(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			out.print(e.getMessage());
		}
	}
}
