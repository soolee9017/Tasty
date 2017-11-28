<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	

</script>
</head>
<body>
<h1>미션 등록 성공 페이지</h1>
<h2>등록된 내용</h2>
미션번호 : ${reqeustScope.misison.misisonNum }
미션이름 : ${requestScope.mission.missionName }
미션사진 : 
<img src="${initParam.rootPath }/memberImage/${requestScope.user.userImage }" width="350px">
최대 참여인원 : ${requestScope.mission.maxPeople }
시작일 : ${reqeustScope.mission.startDate }
종료일 : ${requestScope.mission.endDate }

<button>미션 메인페이지로 이동하기</button>
<button>미션 수정하기</button>
<button>미션 삭제하기</button>

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
			<td class="header">${requestScope.mission.missionName}</td>
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
			<td><input type="file" name="missionCertPhoto"></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
		</tr>
		
	
	</table>
	<input type="hidden" name="missionNum" value="${reqeustScope.mission.missonNum }">
</form>
</body>
</html>