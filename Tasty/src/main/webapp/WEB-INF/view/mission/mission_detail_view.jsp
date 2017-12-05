<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/*사진추가 button*/
	$("#addPhoto").on("click",function() {
		var html = '<tr><td>'
		+ '<input type="file" name="upImage">'
		+ '</td>';
		html += '<td><button type="button" class="deletePhoto">사진삭제</button>';
		html += '</td></tr>';
		$("#photoList").append(html);
		});//end of addPhoto

	$("#photoList").on("click", function() {
		$(this).parent(), parent().remove();
	});//end of photoList
	
	$("#missionCert").on("click",function(){
		alert('클릭');
		//ajax 처리~~~
	});
					
});//end of document.ready

</script>
</head>
<body>
<div style='margin-top: 70px;'>
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
	
	<form name="comment"> 
	제목 : <input type="text" name="title"><br>
	<textarea rows="10" cols="100" placeholder="인증글을 입력해주세요."></textarea><br>
	사진 등록 :
		<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button>
		<br>


		<button id="missionCert" type="submit">미션 인증</button>
	</form>
</div>
</body>
</html>