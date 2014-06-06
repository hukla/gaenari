/**
 * facebook login 작성자 : 장재희 작성일 : 2014-06-06
 */
$(function(){
	$('.fb-login-button').click(function(){
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				FB.api('/me', function(user) {
					if (user) {
	
						var image = 'http://graph.facebook.com/' + user.id
								+ '/picture?type=large';
						var name = user.name;
						var email = user.email;
	
						location.href = "fbLogCheck.do?email=" + email
								+ "&username=" + name + "&image=" + image;
						// 이메일이랑 이름 넘기기
					}
				});
			} else if (response.status == 'not_authorized') {
				var conf = confirm('가입되지 않은 사용자입니다! 가입하실래요?');
				if(conf) {
					var image = 'http://graph.facebook.com/' + user.id
					+ '/picture?type=large';
					var name = user.name;
					var email = user.email;

					location.href = "join.jsp?email=" + email
							+ "&username=" + name + "&image=" + image;
				}
			} else if (response.status == 'unknown') {
				FB.login(function(response){
					if(response.status == 'connected') {
						FB.api('/me', function(user) {
							if (user) {
			
								var image = 'http://graph.facebook.com/' + user.id
										+ '/picture?type=large';
								var name = user.name;
								var email = user.email;
			
								location.href = "fbLogCheck.do?email=" + email
										+ "&username=" + name + "&image=" + image;
								// 이메일이랑 이름 넘기기
							}
						});
					}
				});
			}
		});
	});
		
	
	
});

function fbjoin(){
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', function(user) {
				if (user) {

					var image = 'http://graph.facebook.com/' + user.id
							+ '/picture?type=large';
					var name = user.name;
					var email = user.email;

					location.href = "fbLogCheck.do?email=" + email
							+ "&username=" + name + "&image=" + image;
					// 이메일이랑 이름 넘기기
				}
			});
		} else if (response.status == 'not_authorized') {
			var conf = confirm('가입되지 않은 사용자입니다! 가입하실래요?');
			if(conf) {
				var image = 'http://graph.facebook.com/' + user.id
				+ '/picture?type=large';
				var name = user.name;
				var email = user.email;

				location.href = "join.jsp?email=" + email
						+ "&username=" + name + "&image=" + image;
			}
		} else if (response.status == 'unknown') {
			FB.login(function(response){
				if(response.status == 'connected') {
					FB.api('/me', function(user) {
						if (user) {
		
							var image = 'http://graph.facebook.com/' + user.id
									+ '/picture?type=large';
							var name = user.name;
							var email = user.email;
		
							location.href = "fbLogCheck.do?email=" + email
									+ "&username=" + name + "&image=" + image;
							// 이메일이랑 이름 넘기기
						}
					});
				} else {
					var image = 'http://graph.facebook.com/' + user.id
					+ '/picture?type=large';
					var name = user.name;
					var email = user.email;

					location.href = "join.jsp?email=" + email
							+ "&username=" + name + "&image=" + image;
				}
			});
		}
	});
}

function getUserinfo() {
	var newwindow;
	var url = "/gaenari/userinfo.do";
	
	newwindow = window.open(url, '회원정보', 'height=700,width=660,scrollbars=yes');
	if(window.focus) {
		newwindow.focus;
	}
}
