<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body> 
<div style='margin-top: 70px;'>

<h1>미션목록</h1>
<button id="regBtn" type="submit" onclick="window.location.href='moveToRegister.do'">미션 등록</button>
<c:forEach var="missions" items="${result }">

미션번호 : ${missions.missionNum}<br>
미션이름 : ${missions.missionName }<br>
참여인원 : ${missions.currentPeople }/${missions.maxPeople }<br>
기간 : ${missions.startDate } ~ ${missions.endDate }<br>
사진 : 
	<c:forEach var="missionPhotoList" items="${missions.missionPhotoList}">
		<c:forEach var="photoList" items="${missionPhotoList.photoList }">
			<img src="${initParam.rootPath }/photos/mission/${photoList.photoPath }" width="300px">
		</c:forEach>
	</c:forEach>
	<a href="${initParam.rootPath }/missionCert/getMissionCertByMN.do?missionNum=${missions.missionNum}"><button class="btn" type="button">상세보기</button></a>
	<br><br><p><p>
</c:forEach>

</div>

</body>
</html>