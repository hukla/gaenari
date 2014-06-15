package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.PtBoardDTO;
import model.dto.VoluBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class PtBoardDAO {
	
	public static boolean deleteContent(int ptbrdno) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
	
		boolean result = false;
		boolean result2 = false;
		try{
			int brdno=session.selectOne("ptboard.selectBoard",ptbrdno);
			result = session.delete("ptboard.deletePt",ptbrdno)>0?true:false;
			result2 = session.delete("ptboard.deleteBoard",brdno)>0?true:false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;		
	}
	
	public static int getPtCount() throws SQLException{
		SqlSession session = null;
		int ptCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			ptCount = session.selectOne("ptboard.selectCountPt");
			pageCount = ptCount/10;
			if(ptCount%10 > 0) pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}
	
	public static List<PtBoardDTO> getTenPt(int pageCount) throws SQLException{
		SqlSession session = null;
		List<PtBoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("ptboard.selectTenPt",pageCount);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}

	public static boolean updateContent (PtBoardDTO ptbdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		PtBoardDTO ptbdto2 = null; // ptbdto는 brdno를 가져오지 않기 때문에 brdno를 포함한 ptbdto2를 만들어서 update
		boolean result = false;
		try{
			int brdno = session.selectOne("ptboard.selectBrdno",ptbdto.getPtbrdno());
			ptbdto2 = new PtBoardDTO(ptbdto.getTitle(),ptbdto.getBrdcontent(),ptbdto.getWorktype(),ptbdto.getWorkloc(), ptbdto.getWorkhour(),ptbdto.getPtbrdno(),brdno);
			int count = session.update("ptboard.update",ptbdto2);
			if(count != 0){
				result = true;
			}
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;
	}

	public static boolean writeContent(PtBoardDTO pbdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		boolean result = false;
		try {
			int count =  session.insert("ptboard.insert", pbdto);
			
			if(count != 0) {
				result =  true;
			}
		}finally{
			DBUtil.closeSession(session, result); //성공하면 commit 실패하면 rollback
		}	
		return result;
	}
	
/*	public static List<PtBoardDTO> selectAll() throws SQLException {
		SqlSession session =null;
		List<PtBoardDTO> list =null;
		try{
			session =  DBUtil.getSqlSession();
			list = session.selectList("ptboard.selectAll");
		}finally{
			DBUtil.closeSession(session);
		}
		return list;
	}
*/	public static PtBoardDTO getContent(int  num, boolean check) throws SQLException{		
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		PtBoardDTO pbdto = null;
		boolean result = false;
		try {
			pbdto = session.selectOne("ptboard.selectByNum", num);
			pbdto.setUserid(pbdto.getUserid().trim());
		}finally{
			DBUtil.closeSession(session, result);
		}
		return pbdto;
	}
}
