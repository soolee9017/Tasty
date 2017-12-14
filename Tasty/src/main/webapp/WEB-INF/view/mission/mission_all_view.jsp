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
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button id="regBtn" type="submit" onclick="window.location.href='moveToRegister.do'">미션 등록</button>
</sec:authorize><br><br>
<c:forEach var="missions" items="${result }">
<fmt:formatDate var="stD" pattern = "yyyy-MM-dd" value = "${missions.startDate }" />
<fmt:formatDate var="eD" pattern = "yyyy-MM-dd" value = "${missions.endDate }" />

<c:forEach var="missionPhoto" items="${missions.missionPhotoList}">
		<img src="${initParam.rootPath }/photos/mission/${missionPhoto.photo.photoPath }" width="300px">
</c:forEach>
미션이름 : ${missions.missionName }<br>
기간 : ${stD} ~ ${eD}<br>
참여인원 : ${missions.currentPeople }/${missions.maxPeople }<br>
	
	<a href="${initParam.rootPath }/missionCert/getMissionCertByMN.do?missionNum=${missions.missionNum}"><button class="btn" type="button">상세보기</button></a>
	<br><br><p><p>
</c:forEach>

</div>

</body>
</html>