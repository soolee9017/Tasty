<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>