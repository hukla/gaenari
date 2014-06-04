package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.dto.DogDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DogDAO {

	//성훈추가: 주인 userno로 강아지 정보찾기
	public static List<DogDTO> getInfo(DogDTO userno) throws SQLException {
		SqlSession session =null;
		List<DogDTO> list =null;
		try{
			session =  DBUtil.getSqlSession();
			System.out.println("==DogDAO진입==");
			list = session.selectList("dog.getInfo",userno.getUserdto().getUserno());
		}finally{
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	//성훈추가: 강아지 번호와 user번호로 한 강아지 찾기
	public static DogDTO getDogInfo(int userno, int dogno) throws SQLException {
		SqlSession session =null;
		DogDTO dog =null;
		Map<String,Integer> map = null;
		try{
			session =  DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("dogno", dogno);
			map.put("userno", userno);
			dog = session.selectOne("dog.getByIdName",map);
		}finally{
			DBUtil.closeSession(session);
		}
		if(dog==null)	throw new SQLException("강아지 정보가 없습니다.");
		return dog;
	}
	
	//14-06-04 성훈추가: 강아지 정보 수정
	public static void updateDog(DogDTO dog) throws SQLException{
		SqlSession session = null;
		boolean result = false;
		try{ 
			session = DBUtil.getSqlSession();
			result = session.update("dog.updateDog", dog) > 0 ? true : false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("정보 수정에 실패했습니다.");
	}
}
