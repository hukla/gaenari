/**
 * 작성: 이수진
 * 수정: 2014-06-06
 * 내용: MFBoardDAO -> MFABoardDAO로 수정
 * 		MissingBoard, FindingBoard, AdpBoard의 모든 DAO기능을 가짐
 */

package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.AdpBoardDTO;
import model.dto.BoardDTO;
import model.dto.FindingBoardDTO;
import model.dto.MissingBoardDTO;
import model.dto.PtBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class MFABoardDAO {
	
	public static MissingBoardDTO getAds() throws SQLException{
		SqlSession session = null;
		return null;
	}
	
	public static int getFCount() throws SQLException{
		SqlSession session = null;
		int fCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			fCount = session.selectOne("mfboard.selectCountF");
			pageCount = fCount/10;
			if(fCount%10 > 0) pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}

	public static List<FindingBoardDTO> getTenF(int pageCount) throws SQLException{
		SqlSession session = null;
		List<FindingBoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("mfboard.selectTenF",pageCount);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
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
	
	public static List<MissingBoardDTO> MselectAll(){
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
	public static MissingBoardDTO MselectOne(int brdno) {
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
	
	//유기견 제보 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
		public static int insertFindingBoard(BoardDTO boardDTO) throws SQLException{
			
			SqlSession session = null;
			boolean result = false;
			int brdno = 0;
			try{
				session = DBUtil.getSqlSession();
				result = session.insert("mfboard.Finsert",boardDTO)>0 ? true:false;
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
		public static boolean insertFinding(FindingBoardDTO mDTO) throws SQLException{
			
			SqlSession session = null;
			boolean result = false;
			try{
				session = DBUtil.getSqlSession();
				result = session.insert("mfboard.insertFinding",mDTO)>0 ? true:false;
			}finally{
				DBUtil.closeSession(session, result);
			}
			return result;
		}
		
		public static List<FindingBoardDTO> FselectAll(){
			SqlSession session = null;
			List<FindingBoardDTO> list = null;
			
			try {
				session = DBUtil.getSqlSession();
				list = session.selectList("mfboard.FselectAll");
			} finally {
				DBUtil.closeSession(session);
			}
			
			return list;
		}
		public static FindingBoardDTO FselectOne(int brdno) {
			SqlSession session = null;
			FindingBoardDTO fdto = null;
			
			try {
				session = DBUtil.getSqlSession();
				fdto = session.selectOne("mfboard.FselectOne", brdno);
			} finally {
				DBUtil.closeSession(session);
			}
			
			return fdto;
		}
		
		//유기견 입양 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
		public static int insertAdpBoard(BoardDTO boardDTO) throws SQLException{
			
			SqlSession session = null;
			boolean result = false;
			int brdno = 0;
			try{
				session = DBUtil.getSqlSession();
				result = session.insert("mfboard.Ainsert",boardDTO)>0 ? true:false;
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
		public static boolean insertAdp(AdpBoardDTO adto) throws SQLException{
			
			SqlSession session = null;
			boolean result = false;
			try{
				session = DBUtil.getSqlSession();
				System.out.println("MFABoardDAO의 brdno="+adto.getBrdno());
				result = session.insert("mfboard.insertAdp",adto)>0 ? true:false;
			}finally{
				DBUtil.closeSession(session, result);
			}
			return result;
		}
		
		public static List<AdpBoardDTO> AselectAll(){
			SqlSession session = null;
			List<AdpBoardDTO> list = null;
			
			try {
				session = DBUtil.getSqlSession();
				list = session.selectList("mfboard.AselectAll");
			} finally {
				DBUtil.closeSession(session);
			}
			
			return list;
		}
		public static AdpBoardDTO AselectOne(int brdno) {
			SqlSession session = null;
			AdpBoardDTO adto = null;
			
			try {
				session = DBUtil.getSqlSession();
				adto = session.selectOne("mfboard.AselectOne", brdno);
			} finally {
				DBUtil.closeSession(session);
			}
			
			return adto;
		}
}
