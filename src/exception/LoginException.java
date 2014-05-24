package exception;

/**
 * 작성: 2014-05-20
 * 작성자: 최성훈
 * 내용: 로그인할 때 몇 가지 경우 오류들에 해당하는 exception 띄워주기 위함
 *
 */
public class LoginException extends Exception {

	public LoginException(String message) {
		super(message);
	}

}
