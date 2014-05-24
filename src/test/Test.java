/**
 * 작성자: 장재희
 * 작성일: 2014-04-22 21:42
 * 내용: discriminator test
 */
package test;

import model.dao.TestDAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.DBUtil;

public class Test {

	
	
	public static void main(String[] args) throws Exception {
		
		
		System.out.println("hello world!");
		
		//TestDAO.selectPlan(); // planboardinfo 데이터 불러옴
		
		//planboardinfo에서 2번 글 지움
		SqlSession session = null;
		boolean res = false;
		
		try {
			session = DBUtil.getSqlSession();
			System.out.println("deletePlan() start");
			res = (session.delete("test.deletePlan") > 0)? true:false;
			System.out.println(res);
		} finally {
			DBUtil.closeSession(session, res);
		}//planboardinfo에서 2번 글 지움 ======> 끝
		
		//TestDAO.selectPlan(); // planboardinfo 데이터 불러옴
	}

}
