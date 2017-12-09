<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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

	$("#photoList").on("click",".deletePhoto", function() {
		$(this).parent().parent().remove();
	});//end of photoList
	
	  
	$("#regmisBtn").on("click", function(){
		if("${requestScope.outcome}"==0){
			alert("이미 참여한 미션입니다.");
		}else{
		alert("미션에 참여하셨습니다.");
		}
	});//end of regmisBtn
	
	$("#cancelmisBtn").on("click", function(){
		if("${requestScope.outcome}"==0){
			alert("참여하지 않은 미션입니다.");
		}else{
		alert("미션에 참여를 취소하셨습니다.");
		}
	});//end of regmisBtn
	

					
});//end of document.ready

</script>
</head>
<body>
<div style='margin-top: 70px;'>
<h1>관리자의 미션 상세페이지</h1>

${result.get(0).missionNum }

미션번호 : ${result.get(0).missionNum}<br>
 
미션이름 : ${result.get(0).missionName }<br>
 
참여인원 : ${result.get(0).currentPeople }/${result.get(0).maxPeople }<br>
기간 : ${result.get(0).startDate } ~ ${result.get(0).endDate }<br>

사진 : 
	<c:forEach var="missionPhotoList" items="${result.get(0).missionPhotoList}">
		<c:forEach var="photoList" items="${photoList }">
			<img src="${initParam.rootPath }/photos/mission/${photoList.photoPath }" width="300px">
		</c:forEach> 
	</c:forEach> 
	
	<h2>미션 삭제하기</h2>
	<form id="delMisForm" action="${initParam.rootPath }/mission/removeMissionByMissionNum" method="get">
		<input type="hidden" name="missionNum" value="${result.get(0).missionNum}">
		<button type="submit">${result.get(0).missionNum}번 미션 삭제하기</button>
	</form>
	
	<h2>미션 수정하러가기</h2>
	<form action="${initParam.rootPath }/mission/selectMissionNum2.do">
		<input type="hidden" name="missionNum" value="${result.get(0).missionNum}">
		<button type="submit" id="modMisBtn">해당미션 수정하러가기</button>
	</form>
	
	<br><br><p><p>
	<!-- 미션인증글 작성란 -->
	<div style="width:30%; background-color: pink; text-align: left; margin-left: 10px;"> 
	
	<form action="${initParam.rootPath }/missionCert/registerMissionCert.do" id="content" method="post" enctype="multipart/form-data">
	<sec:csrfInput /> 
	<input type="hidden" name="missionNum" value="${result.get(0).missionNum }">
 	<input type="hidden" name="missionCertNum" value="0">
	제목 : <input type="text" name="title"><br>
	<textarea name="content" rows="5" cols="20" placeholder="인증글을 입력해주세요."></textarea><br>
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
</div>
${result.get(0).missionCertList}
 
<div class="contents">
<!-- 여기에는 등록된 미션들 missionNum으로 select된것 뿌려주기 -->

<br>



<c:forEach var="i" begin="1" end="5" step="1">
	${result.get(0).missionCertList.get(i)}<br>
</c:forEach>

<%-- 
<c:forEach items="${result.get(0).missionCertList.get(2)}" var="missionCert">
	<div class="selectedMission">
		<div>
			<div>미션번호</div>
			<div></div>
		</div>
		<div>
			<div>제목</div>
			<div>${missionCert.title}</div>
		</div>
		<div>
			<div>내용</div>
			<div>${missionCert.content}</div>
		</div>
		<div>
			<div>닉네임</div>
			<div>${missionCert.nickname}</div><!-- 멤버 테이블에서 조인해서 가지고와야함. -->
		</div>
		<div>
			<div>사진</div>
			<div>
			<c:forEach var="missionPhotoList" items="${missionCert.missionPhotoList}">
				<c:forEach var="photoList" items="${missionCertPhotoList.photoList }">
					<img src="${initParam.rootPath }/photos/missionCert/${photoList.photoPath }" width="300px">
				</c:forEach>
			</c:forEach>
			</div>
		</div>
	</div>
</c:forEach> --%>	
	

</div>
</body>
</html>