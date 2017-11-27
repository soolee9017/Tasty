<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		/*사진추가 button*/
		$("#addPhoto").on("click",function(){
			var html = '<tr><td>'+ '<input type="file" name="upImage">'+'</td>';
			html += '<td><button type="button" class="deletePhoto">사진삭제</button>';
			html += '</td></tr>';
			$("#photoList").append(html);
		});//end of addPhoto
		
		$("#photoList").on("click",function(){
			$(this).parent(),parent().remove();
		});//end of photoList
		
		$("#misNBtn").on("click",function(){//결과를 가지고와서 뿌려주는 function
			
		});//end of misNBtn
		
		/* $('#regForm').submit(function(e) {
			var startDate = $('#startDate');
			var endDate = $('#endDate');
			startDate.val(startDate.val().replace('-','/'))
		}); */
		
	});//end of document.ready
						
</script>

</head>
<body>
	<h1>response 결과(전체미션)</h1>

	<c:forEach items="${requestScope.result}" var="mission">
		<ul>
			<li>${mission.missionNum}</li>
			<li>${mission.missionName}</li>
			<li>${mission.missionContent}</li>
			<li>${mission.currentPeople}</li>
			<li>${mission.maxPeople}</li>
			<li>${mission.startDate}</li>
			<li>${mission.endDate}</li>
		</ul>
	</c:forEach>




	<h2>mission 조회하기</h2>
	조회할 미션 이름 :
	<form action="${initParam.rootPath }/mission/selectMissionName.do" method="get">
		<input type="text" name="missionName" id="missionName">
		<button id="misNBtn" type="submit">검색</button>
		<div id="result"></div>
	</form>
	<p>
	
	<h2>미션 등록하기</h2>
	<form id="regForm" action="${initParam.rootPath }/mission/insertMission.do" method="post">
		미션명 : <input type="text" name="missionName" id="missionName"><br>
		미션 내용 :<br>
			<textarea name="missionContent" cols="40" rows="8"></textarea><br>
		최대인원 : <input type="number" name="maxPeople" id="maxPeople"><br>
		시작일 : <input type="date" name="startDate" id="startDate"><br>
		종료일 : <input type="date" name="endDate" id="endDate"><br>
		
		<!-- 사진 등록 : 
		<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button><br>
		 -->
		
		<button type="submit">미션 등록</button>
	</form>
	
	
	<a href="${initParam.rootPath }/mission/updateMission.do">미션 수정페이지</a>

</body>
</html>