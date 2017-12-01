<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLTY50:관리자:회원관리</title>
</head>
<body>
<h2>YOLTY50 회원관리</h2>
회원 조회<br>
회원 수정<br>
회원 삭제<br>
권한 수정<br>
ajax^.ㅠ,,,
<p>
<p>

		회원 전체 조회&nbsp;&nbsp;<a href="${initParam.rootPath }/admin/get_member_all.do" class="btn btn-default">조회</a>
		<p>
		Email 조회&nbsp;&nbsp;<form action="${initParam.rootPath }/admin/get_member_email.do" method='get'> 
		<input type="text" name="email" id="email"/>&nbsp;&nbsp;
		<button type="submit" class="btn btn-default">조회</button>
		<p>
		</form>
		인증여부 조회&nbsp;&nbsp;<form action="${initParam.rootPath }/admin/get_memberCert.do" method='get'>
		<input type="number" name="memberCert" id="memberCert"/>&nbsp;&nbsp;
		<button type="submit" class="btn btn-default">조회</button><p></form>
			회원 삭제&nbsp;&nbsp;<form action="${initParam.rootPath }/admin/remove_member.do" method="get">
			<input type="text" name="email" id="email"/>&nbsp;&nbsp;
			<button type="submit" class="btn btn-default">삭제</button></form>
			
		<%-- 	<a href="${initParam.rootPath }/admin/remove_member.do" class="btn btn-default">삭제</a> --%>
	<p>
	<p>
</body>
</html>