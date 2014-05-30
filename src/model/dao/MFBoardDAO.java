package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.ItemDTO;
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
			brdno = session.selectOne("test.selectBoard",boardDTO);
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
			result = session.insert("mfboard.insertMissing",mDTO)>0 ? true:false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;
	}
	
	public static List<MissingBoardDTO> selectAll(){
		SqlSession session = null;
		List<MissingBoardDTO> list = null;
		
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("mfboard.MselectAll");
		} finally {
			DBUtil.closeSession(session);
		}
		
		return list;
	}
	public static MissingBoardDTO selectOne(int brdno) {
		SqlSession session = null;
		MissingBoardDTO mdto = null;
		
		try {
			session = DBUtil.getSqlSession();
			mdto = session.selectOne("mfboard.MselectOne", brdno);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return mdto;
	}
}
