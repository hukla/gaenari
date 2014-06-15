package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class FriendDAO {
	
	//14-05-30 성훈추가: 나와 친구 간의 친구요청상태 확인 (14-06-05 성훈수정)
	public static int amIsender(int sender, int receiver) throws SQLException{
		SqlSession session = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("sender", sender);
			map.put("receiver", receiver);
			if(session.selectOne("test.checkFrndReq",map)!=null){
				return 1;		//sender가 요청한 사실이 맞다.
			}else{
				map = new HashMap<String,Integer>();
				map.put("sender", receiver);
				map.put("receiver", sender);
				if(session.selectOne("test.checkFrndReq",map)!=null){
					return 2;	//sender가 요청을 받은 것이다.
				}
			}
		} finally {
			DBUtil.closeSession(session);
		}
		return 3;	//둘은 서로에게 친구요청을 한 적이 없다.
	}	
	//14-05-30 성훈추가: 나와 친구간의 친구상태 확인
	public static boolean areWeFriends(int sender, int receiver) throws SQLException{
		SqlSession session = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("subuser", sender);
			map.put("prmuser", receiver);	//누가 친구신청했는지 누가 승인했는지 구분없이 쿼리문 돌리려면?
			if(session.selectOne("test.areWeFriends",map)==null){
				map = new HashMap<String,Integer>();
				map.put("subuser", receiver);
				map.put("prmuser", sender);
				if(session.selectOne("test.areWeFriends",map)==null){
					return false;
				}
			}
		} finally {
			DBUtil.closeSession(session);
		}
		return true;
	}	
	
	//14-05-30 성훈추가: 내가 받은 친구요청리스트
	public static List<Integer> checkMyReqinfo(int receiver) throws SQLException{
		SqlSession session = null;
		List<Integer> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.checkMyReqinfo",receiver);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}	
	//14-05-30 성훈추가: 내 친구목록불러오기(selfJoin + Union)
	public static List<Integer> getMyFriends(int userno) throws SQLException{
		SqlSession session = null;
		List<Integer> list = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("subuser", userno);
			map.put("prmuser", userno);
			list = session.selectList("test.getMyFriends",userno);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}	
	
	//14-05-30 성훈추가: 친구요청이 수락되면 요청정보 지우기
	public static void deleteFrndReq(int sender, int receiver) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("receiver", receiver);
			map.put("sender", sender);
			result = session.delete("delete.deleteFrndReq", map) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("친구요청 삭제에 실패했습니다.");
	}
	//14-05-28 성훈추가: 강아지 정보입력
	public static void insertFrndReq(int sender, int receiver) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("sender", sender);
			map.put("receiver", receiver);
			result = session.insert("insert.insertFrndReq", map) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)
			throw new SQLException("친구 요청에 실패했습니다.");
	}
	
	public static void insertFriends(int sender, int receiver) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("subuser", sender);
			map.put("prmuser", receiver);
			result = session.insert("insert.insertFriends", map) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)
			throw new SQLException("친구요청수락에 실패했습니다.");
	}
}
