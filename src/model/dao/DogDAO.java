package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.DogDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DogDAO {

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
	
}
