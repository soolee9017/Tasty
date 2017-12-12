<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>미션 인증글 수정 페이지</h1>
<div>
<form action="${initParam.rootPath }/missionCert/modifyMissionCertByMCN.do" method="get">
	<input type="hidden" name="missionCertNum" value="${requestScope.missionCert.missionCertNum }">
	제목 : <input type="text" name="title" value="${requestScope.missionCert.title}"><br>
	내용 : <textarea name="content">${requestScope.missionCert.content}</textarea> <br>
	<button type="submit" id="modMCBtn">미션 수정하기 --> 미션 수정된 페이지로 이동 (전체보기 x)</button>
</form>
사진 : 사진수정 구현하기<!--  사진 수정할 부분 구현하기 -->
<br><br><br>
<c:forEach items="${requestScope.missionCert.missionCertPhotoList}" var="photoList">
	<img src="${initParam.rootPath }/photos/missionCert/${photoList }" width="300px">
</c:forEach>

</div>
</body>
</html>