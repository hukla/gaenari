/**
 * 작성자 : 최성훈
 * 내용 : ptboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 */
package model.dto;

public class PtBoardDTO extends BoardDTO {
	
	private int ptbrdno;
	private String worktype;
	private String workloc;
	private String workhour;
	
	public PtBoardDTO() {}
	public PtBoardDTO(String title, String brdcontent, String worktype, String workloc, String workhour, int ptbrdno, int brdno){
		super(brdno,brdcontent,null, title);//null은 wrdate
		this.ptbrdno=ptbrdno;
		this.worktype=worktype;
		this.workloc=workloc;
		this.workhour=workhour;
	}
	public PtBoardDTO(String title, String brdcontent, String userid, String brdtype, String worktype, String workloc, String workhour) {
		super(brdcontent,null,userid,title,brdtype,0);
		this.worktype = worktype;
		this.workloc = workloc;
		this.workhour = workhour;
	}
	public int getPtbrdno() {
		return ptbrdno;
	}
	public void setPtbrdno(int ptbrdno) {
		this.ptbrdno = ptbrdno;
	}
	public String getWorktype() {
		return worktype;
	}
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	public String getWorkloc() {
		return workloc;
	}
	public void setWorkloc(String workloc) {
		this.workloc = workloc;
	}
	public String getWorkhour() {
		return workhour;
	}
	public void setWorkhour(String workhour) {
		this.workhour = workhour;
	}
	@Override
	public String toString() {
		return super.toString()+"\nPtBoardDTO [ptbrdno=" + ptbrdno + ", worktype=" + worktype
				+ ", workloc=" + workloc + ", workhour=" + workhour + "]";
	}
	
	
}
