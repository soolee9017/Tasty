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
		
		
		$("#searchByMNBtn").on("click", function(){
			$.ajax({
				"url":"${initParam.rootPath}/mission/selectMissionName.do",//dispatcherServlet을 찾기위한 구분자이다.
				"type":"POST",
				"data":{"missionName":$("#missionName").val()},
				"dataType":"json",
				"success":function(obj){
					var txt = "";
					$(obj).each(function(){
						var mission = this;
						txt += "<tr><td>"+this.missionNum+"</td><td>"+this.missionName+"</td><td>"+this.missionContent+"</td><td>"+this.maxPeople+"</td><td>"+this.currentPeople+"</td><td>"+this.startDate+"</td><td>"+this.endDate+"</td></tr>";
					});
					
					$("#listTbody").html(txt);
					
					
					//var txt = obj.missionNum+","+obj.missionName+","+obj.missionContent+","+obj.currentPeople","+obj.maxPeople+","+obj.startDate+","+obj.endDate;
					//$("#result").append(txt);
				},
				"beforeSend":function(){
					if(!$("#missionName").val()){
						alert("조회할 미션이름을 입력하시오.");
						$("#missionName").focus();
						return false;
					}
				},
				"error":function(){
					alert("오류 발생");
				}
			});
		});
		
		
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
		<button id="searchByMNBtn" type="button">검색</button>
		<div id="result"></div>
	</form>
	<table border='1' style="width: 500px;">
	<thead>
		<tr>
			<td>미션번호</td>
			<td>미션이름</td>
			<td>미션 내용</td>
			<td>최대인원</td>
			<td>현재인원</td>
			<td>시작날짜</td>
			<td>끝나는 날짜</td>
		</tr>
	</thead>
	<tbody id="listTbody">
	</tbody>
</table>
	<p>
	
	
	<h2>미션 삭제하기</h2>
	<form id="deleteMissionByNumForm" action="${initParam.rootPath }/mission/removeMissionByMissionNum.do" method="post">
		삭제할 미션 번호 : <input type="number" name="missionNum" id="missionNum"><br>
		<button id="deleteMissionByMN" type="submit">삭제</button>
	
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
	
	<h2>미션에 회원을 참여시키기</h2>
	<form action="${initParam.rootPath }/mission/addMissionMember.do" method="post">
		미션 번호 : <input type="number" id="missionNum" name="missionNum">
		회원 이메일 : <input type="text" id="email" name="email">
		<button type="submit">회원참여</button> 
	</form>
	<p>
	<!-- 미션 수정하기 -->
	<h2>미션 수정</h2>
	<form action="${initParam.rootPath }/mission/selectMissionNum.do">
		수정할 미션 번호 : <input type="number" id="missionNum" name="missionNum"><button type="submit" id="updateBtn"> 수정하기</button>
	</form>
	<p>
	<p>
	<p>
	<p>
	
	
	

</body>
</html>