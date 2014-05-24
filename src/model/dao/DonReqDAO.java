/**
 * 작성일 : 2014-05-10
 * 작성자 : 장재희
 * 내용 : 기부 요청 DAO 클래스
 * 
 * 수정 2014-05-24
 * donnate 함수 추가
 */
package model.dao;

import java.util.List;

import model.dto.DonReqDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DonReqDAO {
	public static List<DonReqDTO> selectAll() { // TODO
		SqlSession session = null;
		List<DonReqDTO> list = null;
		
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("donreq.selectAll"); 
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

	public static boolean donnate(DonReqDTO donnation) {
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

	public static int send(int drno) {
		int res = 0;
		SqlSession session = null;
		boolean commit = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = session.update("donreq.sendOne", drno);
			
			commit = res > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, commit);
		}
		
		return res;
	}
	
}
