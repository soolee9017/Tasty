<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Check</title>
</head>
<body>
<h4>중복체크</h4>
<p>
	Email&nbsp;&nbsp;<form action="${initParam.rootPath }/email_check.do" method='get'> 
		<input type="text" name="email" id="email"/>&nbsp;&nbsp;
		<button type="submit" class="btn btn-default">확인</button>
		</form>
</body>
</html>