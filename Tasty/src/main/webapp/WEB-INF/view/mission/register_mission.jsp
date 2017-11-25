<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> mission_register.jsp</h1>
<form action="${initParam.rootPath }/mission/insertMission.do" method="post" 
		enctype="multipart/form-data">
	<input type="hidden" name="missionNum">
	미션명 : <input type="text" name="missionName" id="missionName">
	업로드할 이미지 : <input type="file" name="upImage" id="upImage">
	미션 내용 : <input type="content" name="misisonContent" id="missionContent">
	최대인원 : <input type="number" name="maxPeople" id="maxPeople">
	<input type="hidden" name="currentPeople" id="currentPeople">
	시작일 : <input type="date" name="startDate" id="startDate">
	종료일 : <input type="date" name="endDate" id="endDate">
	<button type="submit">미션 등록</button>
</form>
</body>
</html>