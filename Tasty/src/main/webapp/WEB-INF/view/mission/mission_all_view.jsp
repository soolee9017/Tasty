<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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

<style>
div { 
    display: block;
}
</style>
</head>
<body>
	<h1>미션 등록하기 버튼</h1>
	<button type=button onclick = "location.href='${initParam.rootPath }/mission/moveToRegister.do'">미션 등록페이지로 이동</button>
	<h1>response 결과(전체미션)</h1>

	<div class="main_form"> 
		<c:forEach items="${requestScope.result}" var="mission">
			<div class="mission_box">
				<a href="${initParam.rootPath }/mission/selectMissionNum.do?missionNum=${mission.missionNum}">
					<div class="missions">
						<div class="item_img_box">
							<!-- 상품이미지 경로 설정해야함 -->
							<c:forEach items="${requestScope.mission.missionPhotoList}" var="missionPhoto">
								이미지
								<img src="${initParam.rootPath }/photos/mission/${missionPhoto.photoList[0].photoPath}" width="500px">
							</c:forEach>
													
						</div>
						<div class="mission_spec">
							<div class="mission_name">
								미션명 : ${mission.missionName}
							</div>
						</div>
						<div class="mission_spec">
							<div class="max_people">
								현재인원 / 총인원 : ${mission.currentPeople}/${mission.maxPeople}
							</div>
						</div>
						<div class="mission_spec">
							<div class="start_date">
							</div>
						</div>
						<div class="mission_spec">
							<div class="end_date">
								최종일 : ${mission.endDate}
							</div>
						</div>

					
					</div>

				</a>
			</div>
			<br>
			<br>
		</c:forEach>
	</div>




	<h2>mission 이름으로 조회하기</h2>
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
	<form id="deleteMissionByNumForm" action="${initParam.rootPath }/mission/removeMissionByMissionNum.do" method="get">
		삭제할 미션 번호 : <input type="number" name="missionNum" id="missionNum"><br>
		<button id="deleteMissionByMN" type="submit">삭제</button>
	</form>
	<p>
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