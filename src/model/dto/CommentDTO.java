package model.dto;
/**
 * 작성: 프로젝트시작 당시
 * 작성자: 최성훈
 * 내용: 댓글 DTO
 * 
 * 수정: 2014-06-03, 최성훈
 * 내용: BoardDTO를 상속하고 댓글의 게시판번호 컬럼을 추가
 *
 */
public class CommentDTO extends BoardDTO {
	
	private int cmtno;
	private int prmno;
	
	public CommentDTO(){}
	public CommentDTO(int brdno, int prmno){
		super.setBrdno(brdno);
		this.prmno = prmno;
	}
	public int getPrmno() {
		return prmno;
	}
	public void setPrmno(int prmno) {
		this.prmno = prmno;
	}
	public int getCmtno() {
		return cmtno;
	}
	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}
	
}
