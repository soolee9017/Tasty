<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>미션수정페이지</h1>
<form action="${initParam.rootPath }/mission/modifyMission.do">
	<input type="text" name="missionNum" value="${mission.missionNum }"/>
	<input type="text" name="missionName" value="${mission.missionName }"/>
	<input type="text" name="missionContent" value="${mission.missionContent }"/>
	<input type="text" name="maxPeople" value="${mission.maxPeople }"/>
	<input type="text" name="startDate" value="${mission.startDate }"/>
	<input type="text" name="endDate" value="${mission.endDate }"/>
	
	<button type="submit">수정하기</button>
</form>

</body>
</html>