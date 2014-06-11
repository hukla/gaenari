/**
 * 작성자 : 이수진
 * 작성일 : 2014-06-11
 * 내용 : 입양, 자원봉사, 펫도우미 3가지 요청테이블에 해당하는 DTO
 * 		adpreq, volureq, ptreq 전부에 해당하는 DTO이다.
 * 
 */
package model.dto;

public class BrdReqDTO {
	private int rqno;//요청 테이블에서의 요청 고유 번호(arno, vrno, prno)
	private int brdno;//해당 글에 해당하는 글 번호(abrdno, vbrdno, ptbrdno)
	private int userno;//해당 글에서 요청한 유저의 번호
	private char status;//해당 요청의 상태(수락Y/거절N/완료C/대기중P)
	
	public BrdReqDTO() {}
	public BrdReqDTO(int rqno, int brdno, int userno, char status) {
		this.rqno = rqno;
		this.brdno = brdno;
		this.userno = userno;
		this.status = status;
	}

	public int getRqno() {
		return rqno;
	}
	public void setRqno(int rqno) {
		this.rqno = rqno;
	}
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BrdReqDTO [rqno=" + rqno + ", brdno=" + brdno + ", userno="
				+ userno + ", status=" + status + "]";
	}
		
}