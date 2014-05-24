package model.dao;

import java.util.List;

import model.dto.ItemDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.DBUtil;

public class ItemDAO {
	
	private static final Logger log = Logger.getLogger(ItemDAO.class);
	
	public static List<ItemDTO> selectAll() {
		SqlSession session = null;
		List<ItemDTO> list = null;
		
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("iteminfo.selectAll");
		} finally {
			DBUtil.closeSession(session);
		}
		
		return list;
	}
	
	public static ItemDTO selectOne(int itemno) {
		SqlSession session = null;
		ItemDTO item = null;
		
		try {
			session = DBUtil.getSqlSession();
			item = session.selectOne("iteminfo.selectOne", itemno);
		} finally {
			DBUtil.closeSession(session);
		}
		
		return item;
	}
	
	public static boolean deleteOne(int itemno) {
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = (session.delete("iteminfo.deleteOne", itemno) > 0)? true : false;
		} finally {
			DBUtil.closeSession(session, res);
		}
		
		return res;
	}

	public static boolean insertOne(ItemDTO item) {
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = (session.insert("iteminfo.insertOne", item) > 0)? true : false;
		} finally {
			DBUtil.closeSession(session, res);
		}
		
		return res;
	}

	public static int getFinalItemNo() {
		SqlSession session = null;
		int finalItemNo = 0;
		
		try {
			session = DBUtil.getSqlSession();
			finalItemNo = session.selectOne("iteminfo.selectMaxItemNo");
			if(finalItemNo < 0) {
				log.error("negative finalItemNo : "+finalItemNo);
			}
		} finally {
			DBUtil.closeSession(session);
		}
		
		return finalItemNo;
	}

	public static boolean updateOne(ItemDTO item) {
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = DBUtil.getSqlSession();
			res = (session.update("iteminfo.updateOne", item) > 0)? true: false;
		} finally {
			DBUtil.closeSession(session, res);
		}
		
		return res;
	}

}
