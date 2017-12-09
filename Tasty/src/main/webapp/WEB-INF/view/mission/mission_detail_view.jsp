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
		/* if("${requestScope.outcome}"==0){
			alert("이미 참여한 미션입니다.");
		}else{ */
		alert("미션에 참여하셨습니다.");
		/* } */
	});//end of regmisBtn
	
	$("#cancelmisBtn").on("click", function(){
		/* if("${requestScope.outcome}"==0){
			alert("참여하지 않은 미션입니다.");
		}else{ */
		alert("미션에 참여를 취소하셨습니다.");
		/* } */
	});//end of regmisBtn

   
});//end of document.ready

</script>
</head>
<body>
<div style="margin-top:60px;">
	<h1>미션 상세페이지</h1>
	<br> 미션번호 : ${requestScope.result.missionNum}
	<br> 미션이름 : ${requestScope.result.missionName}
	<br> 참여인원 : ${requestScope.result.currentPeople }/${requestScope.result.maxPeople }
	<br> 기간 : ${requestScope.result.startDate } ~
	${requestScope.result.endDate }
	<br> 사진 :
	<c:forEach var="missionPhotoList"
		items="${requestScope.result.missionPhotoList}">
		<c:forEach var="photoList" items="${photoList}">
			<img
				src="${initParam.rootPath }/photos/mission/${photoList.photoPath}"
				width="300px">
		</c:forEach>
	</c:forEach>

	<!--  미션 참여/ 취소 button -->
	<form action="${initParam.rootPath }/mission/enterMissionMember.do"
		method="get">
		<input type="hidden" name="missionNum"
			value="${requestScope.result.missionNum}"> <input type="hidden"
			name="email" value="<sec:authentication property="principal.email"/>">
		<button type="submit" id="regmisBtn">미션에 참여하기</button>
	</form>
	이거 --> ${requestScope.outcome }
	<form action="${initParam.rootPath }/mission/cancelMissionMember.do"
		method="get">
		<input type="hidden" name="missionNum"
			value="${requestScope.result.missionNum}"> <input type="hidden"
			name="email" value="<sec:authentication property="principal.email"/>">
		<button type="submit" id="cancelmisBtn">참여한 미션 취소하기</button>
	</form>

	<br>
	<br>
	<p>
	<p>
		<!-- 미션인증글 작성란 -->
	<div
		style="width: 30%; background-color: pink; text-align: left; margin-left: 10px;">

		<form
			action="${initParam.rootPath }/missionCert/registerMissionCert.do"
			id="content" method="post" enctype="multipart/form-data">
			<sec:csrfInput />
			<input type="hidden" name="missionNum"
				value="${requestScope.result.missionNum }"> <input
				type="hidden" name="email"
				value='<sec:authentication property="principal.email"/>'> <input
				type="hidden" name="missionCertNum" value="0"> 제목 : <input
				type="text" name="title"><br> 인증 내용 :
			<textarea name="content" rows="5" cols="20"
				placeholder="인증글을 입력해주세요."></textarea>
			<br> 사진 등록 :
			<table id="photoList">
				<tr>
					<td><input type="file" name="upImage"></td>
					<td><button type="button" class="deletePhoto">사진삭제</button></td>
				</tr>
			</table>
			<button type="button" id="addPhoto">사진추가</button>
			<br>
			<br>

			<button id="missionCert" type="submit">미션 인증 완료</button>
		</form>
	</div>

	<br>
	<br>인증글 게시판
	<br>

	<table class="table" style="width: 50%;">
		<thead>
			<tr>
				<th>인증번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="missionCert" items="${requestScope.certList}">
				<tr>
					<td>${missionCert.missionCertNum}</td>
					<td><a
						href='${initParam.rootPath}/missionCert/getMissionCertByNum.do?missionCertNum=${missionCert.missionCertNum}'>${missionCert.title}</a></td>
					<td>${missionCert.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>