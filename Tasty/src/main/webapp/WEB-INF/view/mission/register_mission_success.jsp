<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top:60px;">
<h1>등록을 성공했습니다.</h1>
<h2>등록된 미션</h2>
<fmt:formatDate var="stD" pattern = "yyyy-MM-dd" value = "${mission.startDate }" />
<fmt:formatDate var="eD" pattern = "yyyy-MM-dd" value = "${mission.endDate }" />
<div class="regMission">
	<div>
		<c:forEach var="photoList" items="${requestScope.photos }">
			<img src="${initParam.rootPath }/photos/mission/${photoList }" width="300px">
		</c:forEach>
	</div>
	<div id="misNum">
		<div>미션번호</div>
		<div>${mission.missionNum}</div>
	</div>
	<div id="misTitle">
		<div>미션제목</div>
		<div>${mission.missionName }</div>
	</div>
	<div id="misCont">
		<div>미션내용</div>
		<div>${mission.missionContent }</div>
	</div>
	<div id="curPe">
		<div>현재인원</div>
		<div>${mission.currentPeople }</div>
	</div>
	<div id="maxPe">
		<div>최대인원</div>
		<div>${mission.maxPeople }</div>
	</div>
	<div id="stD">
		<div>시작날짜</div>
		<div>${stD}</div>
	</div>
	<div id="eD">
		<div>마감날짜</div>
		<div>${eD}</div>
	</div>
	<div><button type="submit" id="gotoMissionMain" onclick="window.location.href='getAllMission.do'">미션페이지로 이동하기</button></div>


</div>
</div>
</body>
</html>