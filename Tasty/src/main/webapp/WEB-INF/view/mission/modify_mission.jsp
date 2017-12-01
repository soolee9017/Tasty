<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/mission/modifyMission.do" method="post">
		<input type="hidden" name="missionNum" value="${mission.missionNum }" />
		미션이름 : <input type="text" name="missionName" value="${mission.missionName }" /><br>
		미션 내용 :<br> 
		<textarea name="missionContent" cols="40" rows="8" >${mission.missionContent }</textarea><br>
		<input type="hidden" name="currentPeople" value="${mission.currentPeople }" />
		최대인원 : <input type="number" name="maxPeople" value="${mission.maxPeople }" /> <br>
		미션 시작일 : <input type="date" name="startDate" id="startDate" value="${mission.startDate }" /> <br>
		미션 종료일 : <input type="date" name="endDate" id="endDate" value="${mission.endDate }" /><br>

		<button type="submit">수정하기</button>
	</form>
</body>
</html>