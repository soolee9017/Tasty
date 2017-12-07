<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	$("form[name=content]").on("click","#missionCert",function(){
		alert('클릭');
		var insertData = $("form[name=content]").serialize();
		$.ajax({
			"url":"/Tasty/missionCert/registerMissionCert.do",
			"method":"post",
			"contentType": 'multipart/form-data', 
			"data":insertData,
			"error":function(a,b,c){
				alert(c);
			},
			"success":function(){
				alert('insert 성공');
			}
		});
		
 		var num = ${missions.missionNum};
 		alert(num);
		$.ajax({
			"url":"/Tasty/missionCert/getMissionCertByMN.do",
			"data":"missionNum="+num,
			//"dataType":"json",
			"error":function(a,b,c){
			
				alert(c);
			},
			"success":function(list){
				alert(list);
				var txt="";
				$.each(list,function(){
					txt += this.title+'<br>';
				});
				$(".contents").html(txt);
			}
		});
		
		//댓글 목록 
		function commentList(){
		    $.ajax({
		        url : '/Tasty/missionCert/selectMissionCertByMN.do',
		        type : 'get',
		        data : {'missionNum':num},
		        success : function(data){
		            var a =''; 
		            $.each(data, function(key, value){ 
		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+member.nickName;
		                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
		                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
		                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
		                a += '</div></div>';
		            });
		            
		            $(".commentList").html(a);
		        }
		    });
		}


	});
					
});//end of document.ready

</script>
</head>
<body>
<div style='margin-top: 70px;'>
<h1>미션 상세페이지</h1>

미션번호 : ${missions.missionNum}<br>
미션이름 : ${missions.missionName }<br>
참여인원 : ${missions.currentPeople }/${missions.maxPeople }<br>
기간 : ${missions.startDate } ~ ${missions.endDate }<br>
사진 : 
	<c:forEach var="missionPhotoList" items="${missions.missionPhotoList}">
		<c:forEach var="photoList" items="${missionPhotoList.photoList }">
			<img src="${initParam.rootPath }/photos/mission/${photoList.photoPath }" width="300px">
		</c:forEach>
	</c:forEach>
	<br><br><p><p>
	
	<div style="width:30%; background-color: pink; text-align: left; margin-left: 10px;"> 
	
	<form name="content" method="post" enctype="multipart/form-data"> 
	<input type="hidden" name="missionNum" value="${missions.missionNum }">
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

		<button id="missionCert" type="button">미션 인증</button>
	</form>
	
	</div>
</div>

<div class="contents">
<!-- 여기에는 등록된 미션들 missionNum으로 select된것 뿌려주기 -->
	<div class="selectedMission">
	<c:forEach items="${result }" var="missionCerts" >
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td>
					미션글 번호 : ${missionCerts.missionNum }
				</td>
			</tr>
			<tr>
				<td>
					인증글 제목 : ${missionCerts.title }
				</td>
			</tr>
			<tr>
				<td>
					인증글 내용 : ${missionCerts.content }
				</td>
			</tr>
			<tr>
				<td>
					인증글 닉네임 : ${member.nickname }<!-- 인증글 닉네임 수정하기. -->
				</td>
			</tr>
			<tr>
				<td>
					인증 사진<!-- 인증사진하기 -->
				</td>
			</tr>
			
		</tbody>
		<tfoot></tfoot>
	</table>
	
	
	</c:forEach>
	
	</div>


</div>
</body>
</html>