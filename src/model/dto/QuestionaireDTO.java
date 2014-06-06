/**
 * 작성자 : 이수진
 * 2014-06-06 12:16
 * 내용 : questionaire 테이블에 해당하는 DTO
 * 
 */
package model.dto;

public class QuestionaireDTO {
	
	private int qno;
	private int userno;
	private String q1;
	private String q2;
	private String q3;
	private String q4;
	private String q5;
	
	public QuestionaireDTO(){}
	public QuestionaireDTO(int userno, String q1, String q2, String q3, String q4, String q5){
		this.userno = userno;
		this.q1 = q1;
		this.q2 = q2;
		this.q3 = q3;
		this.q4 = q4;
		this.q5 = q5;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getQ1() {
		return q1;
	}

	public void setQ1(String q1) {
		this.q1 = q1;
	}

	public String getQ2() {
		return q2;
	}

	public void setQ2(String q2) {
		this.q2 = q2;
	}

	public String getQ3() {
		return q3;
	}

	public void setQ3(String q3) {
		this.q3 = q3;
	}

	public String getQ4() {
		return q4;
	}

	public void setQ4(String q4) {
		this.q4 = q4;
	}

	public String getQ5() {
		return q5;
	}

	public void setQ5(String q5) {
		this.q5 = q5;
	}

	@Override
	public String toString() {
		return "QuestionaireDTO [qno=" + qno + ", userno=" + userno + ", q1="
				+ q1 + ", q2=" + q2 + ", q3=" + q3 + ", q4=" + q4 + ", q5="
				+ q5 + "]";
	}

}