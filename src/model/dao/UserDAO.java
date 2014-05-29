/**
 * 작성자 : 최성훈
 * 내용 : userdao
 * 
 * 수정 2014-05-24(재희)
 * selectOne함수 추가
 */
package model.dao;

import java.sql.SQLException;

import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import exception.LoginException;
import util.DBUtil;

public class UserDAO {
	
	private static final Logger log = Logger.getLogger(UserDAO.class);

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
		if(user==null)	throw new LoginException("정보 없음");
		return user;
	}
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

}
