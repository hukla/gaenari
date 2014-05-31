/**
 * 작성자: 이수진
 * 내용: findingboardinfo에 해당하는 DTO
 */
package model.dto;

public class FindingBoardDTO extends BoardDTO {
	private int fbrdno;
	private String floc;
	
	public FindingBoardDTO() {}
	public FindingBoardDTO(int brdno,String floc) {
		super.setBrdno(brdno);
		this.floc = floc;
	}
	public int getFbrdno() {
		return fbrdno;
	}
	public void setFbrdno(int fbrdno) {
		this.fbrdno = fbrdno;
	}
	public String getFloc() {
		return floc;
	}
	public void setFloc(String floc) {
		this.floc = floc;
	}
	@Override
	public String toString() {
		return super.toString()+"\nFindingBoardDTO [fbrdno=" + fbrdno + ", floc=" + floc + "]";
	}
	
	
}
