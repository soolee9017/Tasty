<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/*사진추가 button*/
						$("#addPhoto")
								.on(
										"click",
										function() {
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
						
					
						
					});//end of document.ready
</script>

</head>
<body>
<form action="${initParam.rootPath }/mission/modifyMission.do" method="get">
		<input type="hidden" name="missionNum" value="${mission.missionNum }" />
		미션이름 : <input type="text" name="missionName" value="${mission.missionName }" /><br>
		미션 내용 :<br> 
		<textarea name="missionContent" cols="40" rows="8" >${mission.missionContent }</textarea><br>
		<input type="hidden" name="currentPeople" value="${mission.currentPeople }" />
		최대인원 : <input type="number" name="maxPeople" value="${mission.maxPeople }" /> <br>
		미션 시작일 : <input type="date" name="startDate" id="startDate" value="${mission.startDate }" /> <br>
		미션 종료일 : <input type="date" name="endDate" id="endDate" value="${mission.endDate }" /><br>
		사진 등록 :
		<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button>
		<br>


		<button type="submit">미션 등록</button>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>