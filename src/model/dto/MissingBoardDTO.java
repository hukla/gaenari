/**
 * 작성자 : 최성훈
 * 내용 : mfboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 * 
 * 수정 :
 * 2014-05-24 12:16 이수진
 * -> MissingBoardDTO와 FindingBoardDTO로 분리
 */
package model.dto;

public class MissingBoardDTO extends BoardDTO {
	private int mbrdno;
	private String mloc;//실종장소
	private String mdate;//실종날짜
	private String mcontact;//주인 연락처
	private String mkind;//실종견 종류
	private String mgender;//실종견 성별
	private String mage;//실종견 나이
	private String mname;//실종견 이름
	
	public MissingBoardDTO() {}
	public MissingBoardDTO(int brdno, String mloc, String mdate, String mcontact, String mkind, String mgender,
			String mage, String mname){
		super(brdno);
		this.mloc = mloc;
		this.mdate = mdate;
		this.mcontact = mcontact;
		this.mkind = mkind;
		this.mgender = mgender;
		this.mage = mage;
		this.mname = mname;
	}
	public MissingBoardDTO(String title, String brdcontent, String userid, String brdtype,
			int mbrdno, String mloc, String mdate, String mcontact, String mkind, String mgender,
			String mage, String mname) {
		super(brdcontent,null,userid,title,brdtype,0);
		this.mbrdno = mbrdno;
		this.mloc = mloc;
		this.mdate = mdate;
		this.mcontact = mcontact;
		this.mkind = mkind;
		this.mgender = mgender;
		this.mage = mage;
		this.mname = mname;
	}
	public int getMbrdno() {
		return mbrdno;
	}
	public void setMbrdno(int mbrdno) {
		this.mbrdno = mbrdno;
	}
	public String getMloc() {
		return mloc;
	}
	public void setMloc(String mloc) {
		this.mloc = mloc;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMcontact() {
		return mcontact;
	}
	public void setMcontact(String mcontact) {
		this.mcontact = mcontact;
	}
	public String getMkind() {
		return mkind;
	}
	public void setMkind(String mkind) {
		this.mkind = mkind;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMage() {
		return mage;
	}
	public void setMage(String mage) {
		this.mage = mage;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	@Override
	public String toString() {
		return super.toString()+"\nMissingBoardDTO [mbrdno=" + mbrdno + ", mloc=" + mloc
				+ ", mdate=" + mdate + ", mcontact=" + mcontact + ", mkind="
				+ mkind + ", mgender=" + mgender + ", mage=" + mage
				+ ", mname=" + mname + "]";
	}	
}
