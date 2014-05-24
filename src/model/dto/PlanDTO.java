/**
 * 작성자 : 최성훈
 * 내용 : planboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 */
package model.dto;

public class PlanDTO extends BoardDTO {
	private int pbrdno;
	private String pdate;
	private String ploc;

	public PlanDTO() {}

	public PlanDTO(int brdno, String ploc, String pdate) {
		super.setBrdno(brdno);
		this.ploc = ploc;
		this.pdate = pdate;
	}

	public int getPbrdno() {
		return pbrdno;
	}

	public void setPbrdno(int pbrdno) {
		this.pbrdno = pbrdno;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPloc() {
		return ploc;
	}

	public void setPloc(String ploc) {
		this.ploc = ploc;
	}

	@Override
	public String toString() {
		return super.toString()+"\nPlanDTO [pbrdno=" + pbrdno + ", pdate=" + pdate + ", ploc="
				+ ploc + "]";
	}
}
