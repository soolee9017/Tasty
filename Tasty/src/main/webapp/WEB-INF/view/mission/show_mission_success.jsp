<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchByMNBtn").on("click", function(){
		$.ajax({
			"url":"${initParam.rootPath}/mission/selectAllMissionCert.do",//dispatcherServlet을 찾기위한 구분자이다.
			"type":"POST",
			//"data":{"missionName":$("#missionName").val()},
			"dataType":"json",
			"success":function(obj){
				var txt = "";
				$(obj).each(function(){
					var mission = this;
					txt += "<tr><td>"+this.missionCertNum+"</td><td>"+this.email+"</td><td>"+this.title+"</td><td>"+this.content+"</td><td>"+this.missionNum+"</td></tr>";
				});
				
				$("#listTbody").html(txt);
				
			},
			
			"error":function(){
				alert("오류 발생");
			}
		});
	});

});
	

</script>
</head>
<body>
	<h1>조회된 미션</h1>
	<form action="${initParam.rootPath }/mission/modifyMission.do" method="post">
		<input type="hidden" name="missionNum" value="${mission.missionNum }" />
		미션이름 : <input type="text" name="missionName" value="${mission.missionName }" /><br>
		미션 내용 :<br> 
		<textarea name="missionContent" cols="40" rows="8" placeholder="${mission.missionContent }"></textarea><br>
		<input type="hidden" name="currentPeople" value="${mission.currentPeople }" />
		최대인원 : <input type="number" name="maxPeople" value="${mission.maxPeople }" /> <br>
		미션 시작일 : <input type="date" name="startDate" value="${mission.startDate }" /> <br>
		미션 종료일 : <input type="date" name="endDate" value="${mission.endDate }" /><br>

		<button type="submit">수정하기</button>
	</form>




	<form
		action="${initParam.rootPath }/mission/removeMissionByMissionNum.do"
		method="get">
		<input type="hidden" name="missionNum" value="${mission.missionNum }" />
		<button type="submit">미션 삭제하기</button>
	</form>
	<p>
	<p>
<h2>미션 인증글 보기</h2>
<form action="${initParam.rootPath }/missionCert/getAllMissionCert.do" method="get">
	<button type="button" id="searchAllMissionCertBtn">인증글 검색</button>
		<div id="result"></div>
	</form><table border='1' style="width: 500px;">
	<thead>
		<tr>
			<td>미션인증번호</td>
			<td>email</td>
			<td>title</td>
			<td>content</td>
			<td>missionNum</td>
			<td>등록된 사진</td>
		</tr>
	</thead>
	<tbody id="listTbody">
	</tbody>
</table>

	<form action="${initParam.rootPath }/mission/insertMissionCert.do" method="post">
	<table>
		<tr>
			<td class="header">참여한 미션 : ${requestScope.mission.missionName}</td>
		</tr>
		<tr>
			<td>인증 글 제목</td>
			<td><input type="text" size="50" name="title" required="required"></td>
		</tr>
		<tr>
			<td>등록자 닉네임</td>
			<td><input type="text" size="50" name="nickname" value="${requestScope.member.nickname }"></td>
		</tr>
		<tr>
			<td>인증 글 내용</td>
			<td><input type="text" size="80" name="content" required="required"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="missionCertPhoto" required="required"></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
		</tr>
		
	
	</table>
	<input type="hidden" name="missionNum" value="${reqeustScope.mission.missonNum }">
</form>




</body>
</html>