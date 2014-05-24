package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtil {
	
	private static SqlSessionFactory factory = null;
	
	static{
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream("conf/SqlMapConfig.xml");
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			factory = builder.build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			if(inputStream!=null){
				try {
					inputStream.close();
					inputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static SqlSession getSqlSession(){
		return factory.openSession();
	}
	/**
	 * 수정한 사람: 최성훈
	 * 수정: 2014-04-25
	 * 내용: 잘 못 기입한 else문 삭제
	 */
	
	public static void main (String [] args){
		System.out.println("!!!!!!");
	}
	
	public static void closeSession(SqlSession session){
		if(session!=null){
			session.close();
			session = null;
		}
	}
	public static void closeSession(SqlSession session, boolean commit){
		if(session!=null){
			if(commit)	session.commit();
			else session.rollback();
			session.close();
			session = null;
		}
	}
	
}
