<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
<h1>미션 상세페이지</h1>

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
	<br><br><p><p>


</body>
</html>