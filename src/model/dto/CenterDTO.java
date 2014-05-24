package model.dto;

public class CenterDTO {
	
	private int cntrno;
	private String cntrname;
	private String cntrloc;
	private String cntrcontact;
	private char cntrsize;
	
	public CenterDTO(){}

	public int getCntrno() {
		return cntrno;
	}
 
	public void setCntrno(int cntrno) {
		this.cntrno = cntrno;
	}

	public String getCntrname() {
		return cntrname;
	}

	public void setCntrname(String cntrname) {
		this.cntrname = cntrname;
	}

	public String getCntrloc() {
		return cntrloc;
	}

	public void setCntrloc(String cntrloc) {
		this.cntrloc = cntrloc;
	}

	public String getCntrcontact() {
		return cntrcontact;
	}

	public void setCntrcontact(String cntrcontact) {
		this.cntrcontact = cntrcontact;
	}

	public char getCntrsize() {
		return cntrsize;
	}

	public void setCntrsize(char cntrsize) {
		this.cntrsize = cntrsize;
	}

}
