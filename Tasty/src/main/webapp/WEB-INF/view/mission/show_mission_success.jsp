<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>

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
				<a href="${initParam.rootPath }/missionCert/selectMissionNum.do?missionNum=${missionCert.missionNum}">
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

<!-- test -->
<div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm" method="get">
            <div class="input-group">
               <input type="hidden" name="missionNum" value="${mission.missionNum}"/>
               <input type="text" class="form-control" id="title" name="title" placeholder="인증글 제목을 입력하세요"><br>
               <textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
             <!--  사진 등록 :
		<table id="photoList">
			<tr>
				<td><input type="file" name="upImage"></td>
				<td><button type="button" class="deletePhoto">사진삭제</button></td>
			</tr>
		</table>
		<button type="button" id="addPhoto">사진추가</button>
		<br>     -->        
					<span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">인증글 등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>


<!-- 여기까지 test -->




</body>
</html>