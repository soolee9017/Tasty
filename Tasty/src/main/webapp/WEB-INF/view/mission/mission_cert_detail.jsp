<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top:60px;">
<h1> 미션 인증글 상세페이지</h1>

제목 : ${requestScope.missionCert.title}<br>
내용 : ${requestScope.missionCert.content}<br>
사진 : <br><br><br>
${requestScope.missionCert}
</div>
</body>
</html>