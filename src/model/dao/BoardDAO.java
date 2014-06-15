package model.dao;

import java.sql.SQLException;

import model.dto.BoardDTO;
import model.dto.PtBoardDTO;
import model.dto.VoluBoardDTO;

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
	
	//BoardDTO의 일정 내용을 delete
	public static void deleteBoard(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.update("delete.deleteBoard", brdno) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정(보드) 삭제에 실패했습니다.");
	}
}
