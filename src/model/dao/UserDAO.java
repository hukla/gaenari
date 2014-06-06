/**
 * 작성자 : 최성훈
 * 내용 : userdao
 * 
 * 수정 2014-05-24(재희)
 * selectOne함수 추가
 * 
 * 수정: 2014-05-29, 최성훈
 * id,name,addr로 user정보 얻어오기 추가
 */
package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.DogDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.DBUtil;
import exception.LoginException;

public class UserDAO {
	
	private static final Logger log = Logger.getLogger(UserDAO.class);
	
	//userid로 User정보가져가기(UserDTO 타입반환)
	public static UserDTO logCheck(String userid) throws SQLException, LoginException {
		SqlSession session =null;
		UserDTO user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectOne("u.getOneLoginUser",userid);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("User정보 없음");
		return user;
	}
	//14-05-30 성훈추가: 이름으로 user정보검색하기(기르는 강아지 없을경우를 위해서)
	public static UserDTO checkByName(String username) throws SQLException, LoginException {
		SqlSession session =null;
		UserDTO user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectOne("u.checkByName",username);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("User정보 없음");
		return user;
	}
	//14-05-30 성훈추가: 주소로 user정보검색하기(기르는 강아지 없을경우를 위해서)
	public static UserDTO checkByAddr(String address) throws SQLException, LoginException {
		SqlSession session =null;
		UserDTO user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectOne("u.checkByAddr",address);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("User정보 없음");
		return user;
	}
	
	//14-05-29 성훈추가: userid로 User정보가져가기(DogDTO 타입반환)
	public static List<DogDTO> logIdCheck(String userid) throws SQLException, LoginException {
		SqlSession session =null;
		List<DogDTO> user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectList("u.getUserById",userid);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("정보 없음");
		return user;
	}
	public static List<UserDTO> Check(String userid) throws SQLException, LoginException {
		SqlSession session =null;
		List<UserDTO> user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectList("u.userById",userid);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("정보 없음");
		return user;
	}
	//14-05-29 성훈추가: username으로 User정보가져가기(DogDTO 타입반환)
	public static List<DogDTO> logNameCheck(String username) throws SQLException, LoginException {
		SqlSession session =null;
		List<DogDTO> user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectList("u.getUserByname",username);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("정보 없음");
		return user;
	}
	//14-05-29 성훈추가: useraddress로 User정보가져가기(DogDTO 타입반환)
	public static List<DogDTO> logAddrCheck(String addr) throws SQLException, LoginException {
		SqlSession session =null;
		List<DogDTO> user =null;
		try{
			System.out.println("==UserDAO 진입==");
			session = DBUtil.getSqlSession();
			user = session.selectList("u.getUserByAddr",addr);
		}finally{
			DBUtil.closeSession(session);
		}
		if(user==null)	throw new LoginException("정보 없음");
		return user;
	}
	//14-05-29 성훈추가: userid로 user정보가져가기(Exception없음)
	public static UserDTO idCheck(String userid) throws SQLException{
		SqlSession session =null;
		UserDTO user =null;
		try{
			session = DBUtil.getSqlSession();
			user = session.selectOne("u.getOneLoginUser",userid);
		}finally{
			DBUtil.closeSession(session);
		}
		return user;
	}	
	//14-05-28 성훈추가: 이메일로 user정보 받아넘기기
	public static UserDTO emailCheck(String email) throws SQLException {
		SqlSession session =null;
		UserDTO user =null;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==UserDAO 진입==");
			user = session.selectOne("u.getEmailCheck",email);
			System.out.println("==UserDAO 종료==");
		}finally{
			DBUtil.closeSession(session);
		}
		return user;
	}

	/**
	 * userno를 가지고 UserDTO를 가져오는 함수
	 * @param userno
	 * @return userno에 해당하는 UserDTO
	 */
	public static UserDTO selectOne(int userno) {
		UserDTO user = null;
		SqlSession session = null;
		
		try {
			session = DBUtil.getSqlSession();
			
			user = session.selectOne("u.selectOne", userno);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return user;
	}
	
	public static DogDTO searchId(String userid) {
		DogDTO dog = null;
		SqlSession session = null;
		
		try {
			session = DBUtil.getSqlSession();
			dog = session.selectOne("u.searchId", userid);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return dog;
	}
}
