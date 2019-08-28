$(function(){
		$("form").submit(function(e){
			e.preventDefault();
			
			console.log(CryptoJS);
			
			//CryptoJS를 이용하여 SHA-256 암호화를 진행(비밀번호에)
			var pw = $("input[name=pw]").val();
			var encPw = CryptoJS.SHA256(pw).toString();
			
			//[1] 비밀번호 입력창 값을 encPw로 교체 : 사용자에게 변경과정 노출
			//$("input[name=pw]").val(encPw);
			
			//[2] hidden 전송태그를 만드러 기존의 pw를 제거하고 변경 후 전송
			$("input[name=pw]").attr("name", "");
			var newInput = $("<input/>").attr("type", "hidden")
										.attr("name", "pw").val(encPw);
			$(this).append(newInput);
			this.submit();
			
		});
	});