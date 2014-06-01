/**
 *  작성일 : 2014-05-02
 *  작성자 : 장재희
 *  
 *  수정 2014-05-31 장재희
 *  reqcntr(요청한 센터 목록) 추가
 */
package model.dto;

public class ItemDTO {
	private int itemno;
	private String itemname;
	private int price;
	private int qty;
	private String itemdetail;
	private String reqcntr;
	
	public ItemDTO(){}

	public ItemDTO(int itemno, String itemname, int price, int qty, String itemdetail) {
		this.itemno = itemno;
		this.itemname = itemname;
		this.price = price;
		this.qty = qty;
		this.itemdetail = itemdetail;
	}

	public int getItemno() {
		return itemno;
	}

	public void setItemno(int itemno) {
		this.itemno = itemno;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getItemdetail() {
		return itemdetail;
	}

	public void setItemdetail(String itemdetail) {
		this.itemdetail = itemdetail;
	}

	public String getReqcntr() {
		return reqcntr;
	}

	public void setReqcntr(String reqcntr) {
		this.reqcntr = reqcntr;
	}

	@Override
	public String toString() {
		return "ItemDTO [itemno=" + itemno + ", itemname=" + itemname
				+ ", price=" + price + ", qty=" + qty + ", itemdetail="
				+ itemdetail + ", reqcntr=" + reqcntr + "]";
	}
	
	
}
