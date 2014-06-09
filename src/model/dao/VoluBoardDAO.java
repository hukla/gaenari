package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dto.DiaryDTO;
import model.dto.VoluBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class VoluBoardDAO {
	
	public static String getCntrName(int userno) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		String cntrname = null;
		int usertype = 0;
		try{
			usertype = session.selectOne("voluboard.getUserType",userno);
			cntrname = session.selectOne("voluboard.centerCheck",usertype);
		}finally{
			DBUtil.closeSession(session);
		}
		return cntrname;	
	}
	
	public static boolean deleteContent(int vbrdno) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
	
		boolean result = false;
		boolean result2 = false;
		try{
			int brdno=session.selectOne("voluboard.selectBoard",vbrdno);
			result = session.delete("voluboard.deleteVolu",vbrdno)>0?true:false;
			result2 = session.delete("voluboard.deleteBoard",brdno)>0?true:false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;		
	}

	public static int getVoluCount() throws SQLException{
		SqlSession session = null;
		int voluCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getVoluCount진입==");
			voluCount = session.selectOne("voluboard.selectCountVolu");
			System.out.println("==getVoluCount종료==");
			pageCount = voluCount/10;
			if(voluCount%10 > 0) pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}
	
	public static List<VoluBoardDTO> getTenVolu(int pageCount) throws SQLException{
		SqlSession session = null;
		List<VoluBoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getTenVolu진입==");
			list = session.selectList("voluboard.selectTenVolu",pageCount);
			System.out.println("==getTenVolu종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}

	public static boolean updateContent (VoluBoardDTO vbdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		VoluBoardDTO vbdto2 = null; // vbdto는 brdno를 가져오지 않기 때문에 brdno를 포함한 vbdto2를 만들어서 update
		boolean result = false;
		try{
			int brdno = session.selectOne("voluboard.selectBrdno",vbdto.getVbrdno());
			vbdto2 = new VoluBoardDTO(vbdto.getTitle(),vbdto.getBrdcontent(),vbdto.getVhour(),vbdto.getVbrdno(),brdno);
			int count = session.update("voluboard.update",vbdto2);
			if(count != 0){
				result = true;
			}
		}finally{
			DBUtil.closeSession(session, result);
		}
		return result;
	}
	public static boolean writeContent(VoluBoardDTO vbdto) throws SQLException{
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		boolean result = false;
		try {
			int count =  session.insert("voluboard.insert", vbdto);
			if(count != 0) {
				result =  true;
			}
		}finally{
			DBUtil.closeSession(session, result); //성공하면 commit 실패하면 rollback
		}	
		return result;
	}
	
/*	public static List<VoluBoardDTO> selectAll() throws SQLException {
		SqlSession session =null;
		List<VoluBoardDTO> list =null;
		try{
			session =  DBUtil.getSqlSession();
			list = session.selectList("voluboard.selectAll");
		}finally{
			DBUtil.closeSession(session);
		}
		return list;
	}
*/	public static VoluBoardDTO getContent(int  num, boolean check) throws SQLException{		
		SqlSession session = DBUtil.getSqlSession();
		session.commit();
		VoluBoardDTO vbdto = null;
		boolean result = false;
		System.out.println("num="+num+"  check="+check);
		try {
			vbdto = session.selectOne("voluboard.selectByNum", num);
		}finally{
			DBUtil.closeSession(session, result);
		}
		return vbdto;
	}
}
