/**
 * 작성일: 2014-05-10
 * 작성자: 장재희
 * 내용: 기부 요청 vo 클래스
 * 
 * 수정 2014-05-24
 *   qty 컬럼 추가, 컬럼 이름 변경(targetuser -> targetcntr)
 */
package model.dto;

/**
 * 
 * 작성자 : 장재희
 * 
 * 수정 2014-05-28 장재희
 *  - 수정용 생성자 추가
 */
public class DonReqDTO {
	
	private int drno;
	private int userno;
	private int itemno;
	private int targetcntr;
	private int qty;
	private int price;
	private char sent;
	
	public DonReqDTO(){}
	
	// 기부하기용 생성자
	public DonReqDTO(int userno, int itemno, int targetcntr, int qty, int price, char sent) {
		super();
		this.userno = userno;
		this.itemno = itemno;
		this.targetcntr = targetcntr;
		this.qty = qty;
		this.price = price;
		this.sent = sent;
	}
	
	// 요청하기용 생성자
	public DonReqDTO(int userno, int itemno, int qty) {
		super();
		this.userno = userno;
		this.itemno = itemno;
		this.targetcntr = 0; // targetcntr이 0이면 요청임
		this.qty = qty;
		this.price = 0;
		this.sent = 'N';
	}

	public int getDrno() {
		return drno;
	}

	public void setDrno(int drno) {
		this.drno = drno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getItemno() {
		return itemno;
	}

	public void setItemno(int itemno) {
		this.itemno = itemno;
	}

	public int getTargetcntr() {
		return targetcntr;
	}

	public void setTargetcntr(int targetcntr) {
		this.targetcntr = targetcntr;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public char getSent() {
		return sent;
	}

	public void setSent(char sent) {
		this.sent = sent;
	}
}
