/**
 * 작성자 : 최성훈
 * 내용 : board 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:30 장재희
 * -> toString() 추가
 * 
 * 수정: 2014-05-03, 최성훈
 * 내용: Userno만 받는 생성자 추가()
 */
package model.dto;

public class BoardDTO {
	private int brdno;
	private String brdcontent;
	private String wrdate;
	private String userid;
	private String title;
	private String brdtype;
	private int userno;
	
	public BoardDTO(){}
	
	public BoardDTO(String brdcontent, String wrdate, 
			String userid, String title, String brdtype, int userno){
		this.brdcontent = brdcontent;
		this.brdtype = brdtype;
		this.userid = userid;
		this.wrdate = wrdate;
		this.title = title;
		this.userno = userno;
	}
	public BoardDTO(int brdno, String brdcontent, String wrdate, 
			String userid, String title, String brdtype, int userno){
		this.brdcontent = brdcontent;
		this.brdno = brdno;
		this.brdtype = brdtype;
		this.userid = userid;
		this.wrdate = wrdate;
		this.title = title;
		this.userno = userno;
	}
	//14-05-21 성훈추가: 일정 수정 위한 생성자
	public BoardDTO(int brdno, String brdcontent,String wrdate, String title){
		this.brdno = brdno;
		this.brdcontent = brdcontent;
		this.wrdate = wrdate;
		this.title = title;
	}

	//14-05-13 성훈 추가 방명록 입력을 위한 생성자
	public BoardDTO(String brdcontent, String wrdate, String userid,
			String brdtype, int userno) {
		this.brdcontent = brdcontent;
		this.brdtype = brdtype;
		this.userid = userid;
		this.wrdate = wrdate;
		this.userno = userno;
	}
	
	//14-05-21 성훈추가: 다이어리 수정 위한 생성자
	public BoardDTO(int brdno, String brdcontent, String title) {
		this.brdno = brdno;
		this.brdcontent = brdcontent;
		this.title = title;
	}
	public BoardDTO(int userno){
		this.userno = userno;
	}
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}
	public String getBrdcontent() {
		return brdcontent;
	}
	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}
	public String getWrdate() {
		return wrdate;
	}
	public void setWrdate(String wrdate) {
		this.wrdate = wrdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBrdtype() {
		return brdtype;
	}
	public void setBrdtype(String brdtype) {
		this.brdtype = brdtype;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	@Override
	public String toString() {
		return "BoardDTO [brdno=" + brdno + ", brdcontent=" + brdcontent
				+ ", wrdate=" + wrdate + ", userid=" + userid + ", title="
				+ title + ", brdtype=" + brdtype + ", userno=" + userno + "]";
	}
	
}
