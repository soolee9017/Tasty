<%@ page contentType="text/html;charset=utf-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 -->
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
 
<!-- test -->
<script type="text/javascript">
var missionNum = '${mission.missionNum}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        "url" : '/Tasty/missionCert/getMissionCertByMN.do',
        "type" : 'get',
        "data" : {'missionNum':missionNum},
        "dataType":"json",
        "success" : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+mission.missionNum+'">'+'댓글번호 : '+missionCert.missionCertNum+' / 닉네임 : '+member.email;
                a += '<a onclick="commentUpdate('+value.missionCertNum+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.missionCertNum+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.missionCertNum+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
    	 "url" : '${initParam.rootPath}/missionCert/registerMissionCert.do',
         "type" : 'post',
         "data" : insertData,
         "dataType":"json",
         "success" : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+missionCertNum+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+missionCertNum+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+missionCertNum).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(missionCertNum){
    var updateContent = $('[name=content_'+missionCertNum+']').val();
    
    $.ajax({
        url : '${initParam.rootPath}/missionCert/modifyMissionCertByMCN',
        type : 'post',
        data : {'content' : updateContent, 'missionCertNum' : missionCertNum},
        success : function(data){
            if(data == 1) commentList(missionNum); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(missionCertNum){
    $.ajax({
        url : '${initParam.rootPath}/missionCert/removeMissionCertByMCN/'+missionCertNum,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(missionCertNum); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


<!--  여기까지 test -->

<!-- </body>
</html> -->