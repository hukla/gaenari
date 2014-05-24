package model.dao;

import java.sql.SQLException;

import model.dto.BoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BoardDAO {
	public static boolean writeContent(BoardDTO bdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		boolean result = false;
		try {
			int count =  session.insert("board.insert", bdto);
			if(count != 0) {
				result =  true;
			}
		}finally{
			DBUtil.closeSession(session, result); //성공하면 commit 실패하면 rollback
		}	
		return result;
	}
}
