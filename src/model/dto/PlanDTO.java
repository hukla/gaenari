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
	private int plandogno;

	public PlanDTO() {}

	public PlanDTO(int brdno, String ploc, String pdate) {
		super.setBrdno(brdno);
		this.ploc = ploc;
		this.pdate = pdate;
	}
	//14-06-06 성훈추가
	public PlanDTO(int brdno, String ploc, String pdate, int plandogno) {
		super.setBrdno(brdno);
		this.ploc = ploc;
		this.pdate = pdate;
		this.plandogno = plandogno;
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

	public int getPlandogno() {
		return plandogno;
	}

	public void setPlandogno(int plandogno) {
		this.plandogno = plandogno;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PlanDTO [pbrdno=").append(pbrdno).append(", pdate=")
				.append(pdate).append(", ploc=").append(ploc)
				.append(", plandogno=").append(plandogno)
				.append(", getBrdno()=").append(getBrdno())
				.append(", getBrdcontent()=").append(getBrdcontent())
				.append(", getWrdate()=").append(getWrdate())
				.append(", getUserid()=").append(getUserid())
				.append(", getTitle()=").append(getTitle())
				.append(", getBrdtype()=").append(getBrdtype())
				.append(", getUserno()=").append(getUserno())
				.append(", toString()=").append(super.toString())
				.append(", getClass()=").append(getClass())
				.append(", hashCode()=").append(hashCode()).append("]");
		return builder.toString();
	}

	

	
}
