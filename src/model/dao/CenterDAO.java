/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-24
 * 내용 : CenterDAO
 */
package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.CenterDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class CenterDAO {

	public static List<CenterDTO> selectAll() {
		List<CenterDTO> centerList = new ArrayList<CenterDTO>();
		SqlSession session = null;
		
		try {
			session = DBUtil.getSqlSession();
			centerList = session.selectList("centerinfo.selectAll");
		} finally {
			DBUtil.closeSession(session);
		}
		
		return centerList;
	}

	public static CenterDTO selectOne(int targetcntr) {
		CenterDTO center = null;
		SqlSession session = null;
		
		try {
			session = DBUtil.getSqlSession();
			center = session.selectOne("centerinfo.selectOne", targetcntr);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return center;
	}
	public static int insertCntrUser(CenterDTO cntr) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		int cntrno = 0;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertCntrUser", cntr) > 0 ? true : false;
			if(!result)	throw new SQLException("센터정보 입력에 실패했습니다.");
			cntrno = session.selectOne("test.getCntrNo",cntr);
		} finally {
			DBUtil.closeSession(session, result);
		}
		return cntrno;
	}
	
}
