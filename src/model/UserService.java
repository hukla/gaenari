package model;

import exception.LoginException;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dto.UserDTO;

/**
 * 작성: 2014.04.21
 * 작성 목적: User 정보 관리(DAO와 FrontController 매개역할)
 * 작성 내용: UserDTO내의 정보를 DAO에 전달해 주고, DAO로부터 User정보를
 * 			  다시 Controller로 전달해준다.
 * 
 * @author 최성훈
 */
public class UserService {
/*	public static void insertUser(UserDTO userDTO) throws Exception { 
		int line = UserDAO.insertUser(userDTO); 
		if(line==0){
			throw new Exception("이미 사용중인 닉네임입니다.");
		}else if(line==-1){
			throw new Exception("이미 사용중인 아이디입니다.");
		}
	}*/
	// 14-05-20 성훈 추가: LoginException 추가
	public static UserDTO login(String userid) throws SQLException, LoginException {
		UserDTO user = UserDAO.logCheck(userid);
		if(user==null){
			throw new LoginException("정보 없음");
		}
		return user;
	}
	
	//14-05-28 성훈추가: 이메일로 user정보 받아넘기기
	public static UserDTO fbLogin(String email) throws SQLException, LoginException {
		UserDTO user = UserDAO.emailCheck(email);
		return user;
	}
	
/*	public static void logout(UserDTO user) throws Exception {
		int result = UserDAO.logoutCheck(user);
		if(result==0){
			throw new Exception("로그 아웃 실패");
		}
	}

	public static void deleteUser(UserDTO userDTO) throws Exception{
		int result = UserDAO.deleteUser(userDTO);
		if(result==0){
			throw new Exception("정보 삭제 실패");
		}
	}*/

/*	public static void updateUser(UserDTO userDTO) throws Exception {
		int result = UserDAO.updateUser(userDTO);
		if(result==0){
			throw new Exception("정보 수정 실패");
		}
	}
	public static void updateUserCorrect(UserDTO userDTO) throws Exception{
		int result = UserDAO.updateUserCorrect(userDTO);
		if(result==0){
			throw new Exception("점수 올리기 실패");
		}
	}
	
	public static void updateUserFail(UserDTO userDTO) throws Exception{
		int result = UserDAO.updateUserFail(userDTO);
		if(result==0){
			throw new Exception("점수 깎기 실패");
		}
	}*/

/*	public static UserDTO getOneUser(String nicknm) throws Exception{
		UserDTO result = UserDAO.getOneUser(nicknm);
		if(result==null){
			throw new Exception("회원 정보 가져오기 실패");
		}
		return result;
	}*/
}
