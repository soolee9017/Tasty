<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>미션 등록하기</h2>
	<form id="regForm" action="${initParam.rootPath }/mission/insertMission.do" method="get" enctype="multipart/form-data">
	<sec:csrfInput/>
		미션명 : <input type="text" name="missionName" id="missionName"><br>
		미션 내용 :<br>
			<textarea name="missionContent" cols="40" rows="8"></textarea><br>
		최대인원 : <input type="number" name="maxPeople" id="maxPeople"><br>
		시작일 : <input type="date" name="startDate" id="startDate"><br>
		종료일 : <input type="date" name="endDate" id="endDate"><br>
		
		사진 등록 : 
		<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button><br>
		
		
		<button type="submit">미션 등록</button>
	</form>
</body>
</html>