package model.dto;
/**
 * 작성자: 최성훈
 * 작성: 2014-04-23
 * 작성 목적: Visitbook 정보 관리
 * 작성 내용: visitinfo 테이블에 해당하는 DTO
 */
public class VisitDTO extends BoardDTO {
	
	private int vbrdno;
	private int brdno;
	
	public VisitDTO(){}
	public VisitDTO(int brdno){
		super.setBrdno(brdno);
	}
	
	public int getVbrdno() {
		return vbrdno;
	}
	public void setVbrdno(int vbrdno) {
		this.vbrdno = vbrdno;
	}
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}
	
	

}
