<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Check</title>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert(${requestScope.email});
	$("#duplCheckBtn").on("click", function(){
		$.ajax({
			"url":"/Tasty/duplicatedCheck.do",
			//"type":"POST",
			"data":"email="+${requestScope.email},
			//"dataType":"json",
			"success":function(data){
				if(${requestScope.result} == 1){
					var txt = ${requestScope.email};
					$("input[name=email]").html(txt);
					return;
				}
			}
			
		});
	});
});
/* var  ${requestScope.email}

 function emailCheck(){
	var email = document.getElementById('email')
	//opener 객체 : 새창으로 띄운 팝업에서 사용하는 객체 → 자신을 띄운 window 참조
	//	팝업창에서만 사용 가능 */
	

</script>
</head>
<body>
<h4>중복체크</h4>
<p>
	Email&nbsp;&nbsp;<form action="${initParam.rootPath }/duplicatedCheck.do" method='get'> 
		<input type="text" name="email" id="email"/>&nbsp;&nbsp;
		<button id="duplCheckBtn" type="submit" class="btn btn-default">확인</button>
		</form>
</body>
</html>