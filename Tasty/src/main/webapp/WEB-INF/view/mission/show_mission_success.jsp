<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>조회된 미션</h1>

			미션이름 : ${mission.missionName}<br>
			내용 : ${mission.missionContent}<br>
			현재인원 ${mission.currentPeople}<br>
			최대인원 : ${mission.maxPeople}<br>
			시작일 : ${mission.startDate}<br>
			종료일 : ${mission.endDate}<br>
			<form action="${initParam.rootPath }/mission/selectMissionNum.do" method="get">
				<input type="hidden" name="missionNum" value="${mission.missionNum }"/>				
				<button>미션수정하기</button>
			</form>
			<form action="${initParam.rootPath }/mission/removeMissionByMissionNum.do" method="get">
				<input type="hidden" name="missionNum" value="${mission.missionNum }"/>
				<button type="submit">미션 삭제하기</button>
			</form>
</body>
</html>