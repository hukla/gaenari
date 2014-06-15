package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.BrdReqDTO;
import model.dto.VoluBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BrdReqDAO {
	
	public static boolean deleteReq(BrdReqDTO brdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		boolean result = false;
		try {
			int count =  session.insert("brdreq.deleteBrdReq", brdto);
			if(count != 0) {
				result =  true;
			}
		}finally{
			DBUtil.closeSession(session, result); //성공하면 commit 실패하면 rollback
		}	
		return result;
	}
	
	public static List<BrdReqDTO> selectReqByBrdno(int brdno) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		List<BrdReqDTO> brdtoList = null;
		try{
			brdtoList = new ArrayList<BrdReqDTO>();
			brdtoList = session.selectList("brdreq.selectBrdReqByBrdno",brdno);	
		}finally{
			DBUtil.closeSession(session); //성공하면 commit 실패하면 rollback
		}
		return brdtoList;
	}
	
	public static boolean insertReq(BrdReqDTO brdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		boolean result = false;
		try {
			int count =  session.insert("brdreq.insertBrdReq", brdto);
			if(count != 0) {
				result =  true;
			}
		}finally{
			DBUtil.closeSession(session, result); //성공하면 commit 실패하면 rollback
		}	
		return result;
	}

}
