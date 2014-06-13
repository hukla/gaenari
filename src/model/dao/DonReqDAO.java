/**
 * 작성일 : 2014-05-10
 * 작성자 : 장재희
 * 내용 : 기부 요청 DAO 클래스
 * 
 * 수정 2014-05-24
 * donnate 함수 추가
 */
package model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.dto.CenterDTO;
import model.dto.DonReqDTO;
import model.dto.ItemDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DonReqDAO {
	public static Map<String, String> selectDonAll(int userno, int targetcntr, int itemno) {
		SqlSession session = null;
		Map<String, String> res = new HashMap<String, String>();
		
		try {
			session = DBUtil.getSqlSession();
			UserDTO user = session.selectOne("u.selectOne", userno);
			CenterDTO center = session.selectOne("centerinfo.selectOne", targetcntr);
			ItemDTO item = session.selectOne("iteminfo.selectOne", itemno);
			
			res.put("userid", user.getUserid());
			res.put("targetcntr", center.getCntrname());
			res.put("itemname", item.getItemname());
		} finally {
			DBUtil.closeSession(session);
		}
		
		return res;
	}
	
	/**
	 * donreq에 있는 모든 레코드를 가져옴
	 * @param type(1이면 기부 / 0이면 기부 요청)
	 * @return
	 */
	public static List<DonReqDTO> selectAll(int type) {
		SqlSession session = null;
		List<DonReqDTO> list = null;
		
		try {
			session = DBUtil.getSqlSession();
			if(type == 0) {
				list = session.selectList("donreq.selectReqAll"); 
			} else {
				list = session.selectList("donreq.selectDonAll");
			}
		} finally {
			DBUtil.closeSession(session);
		}
		
		return list;
	}
	
	public static DonReqDTO selectOne(int drno) { // TODO
		SqlSession session = null;
		DonReqDTO donreq = null;
		
		try {
			session = DBUtil.getSqlSession();
			donreq = session.selectOne("donreq.selectOne", drno);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return donreq;
	}
	
	public static int cntByItemno(int itemno) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = DBUtil.getSqlSession();
			res = session.selectOne("donreq.cntByItemno", itemno);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return res;
	}
	
	public static boolean delByItemno(int itemno) {
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = (session.delete("donreq.delByItemno", itemno) > 0 ? true : false);
		} finally {
			DBUtil.closeSession(session, res);
		}
		
		return res;
	}

	public static boolean insertDonReq(DonReqDTO donnation) {
		boolean res = false;
		SqlSession session = null;
		
		try {
			session = DBUtil.getSqlSession();
			res = (session.insert("donreq.insertOne", donnation) > 0) ? true : false;
		} finally {
			DBUtil.closeSession(session, res);
		}
		
		return res;
	}

	public static int send(DonReqDTO dr) {
		int res = 0;
		SqlSession session = null;
		boolean commit = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = session.update("donreq.sendOne", dr.getDrno());
			commit = res > 0 ? true : false;
			if(commit) {
				commit = (session.update("u.updatePoint", dr) > 0)? true : false;
			}
		} finally {
			DBUtil.closeSession(session, commit);
		}
		
		return res;
	}

	public static List<DonReqDTO> selectByUserno(int userno) {
		SqlSession session = null;
		List<DonReqDTO> res = null;
		
		try {
			session = DBUtil.getSqlSession();
			res = session.selectList("donreq.selectByUserno", userno);
		} finally {
			DBUtil.closeSession(session);
		}
				
		return res;
	}
	
}
