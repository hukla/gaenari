package model;

import java.sql.SQLException;
import java.util.List;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardService {
	
	public static List<VoluBoardDTO> selectAll(VoluBoardDTO mfbrdno) throws SQLException {
		List<VoluBoardDTO> list = VoluBoardDAO.selectAll();
		if(list.isEmpty()){
			throw new SQLException("VoluBoard 글 목록이 없습니다.");
		}
		return list;
	}

}
