package model;
/**
 * 작성: 2014.04.21
 * 작성 목적: 강아지 정보 관리(DAO와 FrontController 매개역할)
 * 작성 내용: DogDTO내의 user정보를 DAO에 전달하고 DAO로부터 그에 해당하는 강아지
 * 			  정보를 FrontController로 전달해 준다.
 * 
 * @author 최성훈
 */
import java.sql.SQLException;
import java.util.List;

import model.dao.DogDAO;
import model.dto.DogDTO;

public class DogService {

	public static List<DogDTO> getInfo(DogDTO userno) throws SQLException {
		List<DogDTO> list = DogDAO.getInfo(userno);
/*		if(list.isEmpty()){
			throw new SQLException("기르는 강아지 정보가 없습니다.");
		}*/
		return list;
	}
	
}
