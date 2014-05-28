package model.dao;

import java.sql.SQLException;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.MissingBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class MFBoardDAO {
	
	//유기견 신고 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertMissingBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try{
			session = DBUtil.getSqlSession();
			result = session.insert("mfboard.Minsert",boardDTO)>0 ? true:false;
			brdno = session.selectOne("test.selectBoard", boardDTO);
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result){
			throw new SQLException("MF Board 입력실패!");
		}
		return brdno;
	}
	
	//유기견 신고 내용 입력하기 
	public static boolean insertMissing(MissingBoardDTO mDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==Mboard insert 진입==");
			result = session.insert("insert.insertDiary",mDTO)>0 ? true:false;
			System.out.println("==Mboard insert 완료==");
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;
	}

}
