<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchAllMissionCertBtn").on("click", function(){
		$.ajax({
			"url":"${initParam.rootPath}/missionCert/getMissionCertByMN.do",//dispatcherServlet을 찾기위한 구분자이다.
			"type":"POST",
			"data":{"missionNum":$("#missionNum").val()},
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
	/* $('input[type="date"]').each(function(i, obj) {
        $(obj).datetimepicker({
            timepicker:false,
            format:'yyyy.MM.dd'
        });
    }); */
	

</script>
</head>
<body>
	<h1>조회된 미션</h1>
		미션번호 : ${mission.missionNum }<br>
		미션이름 : ${mission.missionName }<br>
		미션 내용 :<br> 
		${mission.missionContent }<br>
		현재 인원 : ${mission.currentPeople }<br>
		최대인원 : ${mission.maxPeople }<br>
		미션 시작일 : ${mission.startDate }<br>
		미션 종료일 : ${mission.endDate }<br>
		<c:forEach items="${requestScope.mission.missionPhotoList}" var="missionPhoto">
			<img src="${initParam.rootPath }/photos/mission/${missionPhoto.photoList[0].photoPath}" width="500px">
		</c:forEach>
		
	
	<h2>해당 미션에 회원을 참여시키기</h2>
	<form action="${initParam.rootPath }/mission/enterMissionMember.do" method="get">
		<input type="hidden" id="missionNum" name="missionNum" value="${mission.missionNum }">
		회원 이메일 : <input type="text" id="email" name="email">
		<button type="submit">회원참여</button> 
	</form>
	
	<form action="${initParam.rootPath }/mission/selectMissionNum2.do" method="get">
		<input type="hidden" name="missionNum" value="${mission.missionNum }" />
		<button type="submit">수정하러가기</button>
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
	<div class="main_missionCertform">
	<c:forEach items="${requestScope.list}" var="missionCert">
		<div class="mission_cert_box">
				<a href="${initParam.rootPath }/mission/selectMissionNum.do?missionNum=${missionCert.missionNum}">
				<div class="mission_cert">
					 <div class="mission_cert_img_box">
						인증사진들 들어갈 section
						<img style="width: 200px;" alt="item_img" src=''>
						상품 이미지
					</div> 
					<div class="mission_cert_spec">
						<div class="mission_cert_title">
							인증글제목
							${missionCert.title }
						</div>
					</div>
						<div class="mission_cert_spec">
						<div class="mission_cert_content">
							인증글내용
							${missionCert.content }
						</div>
					</div>
						<div class="mission_cert_spec">
						<div class="email">
							이메일
							${missionCert.email }
						</div>
					</div>
					<div class="item_bar"></div>
				</div>
				</a>
		</div>
	</c:forEach>
</div>



<form action="${initParam.rootPath }/missionCert/getMissionCertByMN.do" method="get">
	<input type="number" value="${mission.missionNum }" name="missionNum" id="missionNum">
	<button type="button" id="searchAllMissionCertBtn">인증글 검색</button>
	</form>
	<table border='1' style="width: 500px;">
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
	<form action="${initParam.rootPath }/mission/registerMissionCert.do" method="post">
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
			<td><input type="text" size="50" name="email" value="${requestScope.member.email}"></td>
		</tr>
		<tr>
			<td>인증 글 내용</td>
			<td><input type="text" size="80" name="content" required="required"></td>
		</tr>
		<!-- <tr>
			<td>사진</td>
			<td><input type="file" name="missionCertPhoto"></td>
		</tr> -->
		<tr>
			<td><input type="submit" value="등록" id="mCBtn"></td>
		</tr>
		
	
	</table>
	<input type="hidden" name="missionNum" value="${reqeustScope.mission.missonNum }">
</form>




</body>
</html>