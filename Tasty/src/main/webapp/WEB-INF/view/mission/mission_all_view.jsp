<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>response 결과(전체미션)</h1>

<ul>
<c:forEach items="${requestScope.result}" var="mission">
	<li>${mission}</li>
</c:forEach>
</ul>

<form action="${initParam.rootPath }/mission/insertMission.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="missionNum">
	미션명 : <input type="text" name="missionName" id="missionName"><br>
	업로드할 이미지 : <input type="file" name="upImage" id="upImage"><br>
	업로드할 이미지 : <input type="file" name="upImage" id="upImage"><br>
	업로드할 이미지 :<br> 
	<input type="file" name="upImage" id="upImage"><br>
	미션 내용 : <textarea name="content" cols="40" rows="8"></textarea><br>
	최대인원 : <input type="number" name="maxPeople" id="maxPeople"><br>
	<input type="hidden" name="currentPeople" id="currentPeople">
	시작일 : <input type="date" name="startDate" id="startDate"><br>
	종료일 : <input type="date" name="endDate" id="endDate"><br>
	<button type="submit">미션 등록</button>
</form>
<a href="${initParam.rootPath }/mission/updateMission.do">미션 수정페이지</a>

</body>
</html>