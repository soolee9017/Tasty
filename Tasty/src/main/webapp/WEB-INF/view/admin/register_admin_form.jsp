<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
$(document).ready(function() {
	
/* 	$(".tastes").on("click", function() {
		if ($('input:checkbox[name="tastes"]:checked').length >= 3) {
			$('input:checkbox[name="tastes"]').attr("disabled",true);
			$('input:checkbox[name="tastes"]:checked').attr("disabled",false);
			return;
		}else{
			$('input:checkbox[name="tastes"]').attr("disabled",false);
		}
	}); */
	
	var check = 0;
	var check2 =0;
	$("#duplBtn").on("click",function(){
		check = 1;
		var email = $("input[name='email']").val();
		$.ajax({
			"url":"/Tasty/admin/duplicatedCheck.do",
			"data":"email="+email,
			"success":function(result){
				var txt = "";
				if(result == 1){
					$("input[name='email']").val(email);
					alert("사용가능한 email 입니다.");
				}else{
					alert("이미 등록된 email 입니다.");
					$("input[name='email']").val(txt);
					$("input[name='email']").focus();
					return false;
				}
			}
		});
		if(check2 == 1){
			check2 = 0;
			return false;
		}
	});

	
});
function formCheck(){
	check2 = 1;
	if(check == 0){
		alert("email 중복확인 먼저 해주세요.");
		return false;
	}
}
</script>
<p class="center-block" style="height:1px; width:800px; background-color:#000;"></p>

<div class="row center-block text-center" style="width: 800px; margin-top: 60px;">
	<div class="text-left">
<h2>관리자 등록</h2>
</div>
<form action="${initParam.rootPath }/admin/register_admin.do" method="post" enctype="multipart/form-data" onsubmit="formCheck();" >
	<div class="form-group">
		<label for="id">Email</label>
		<input type="text" name="email" id="email" class="form-control">
	</div>
	<button id="duplBtn" class="btn btn-default" type="button">중복 확인</button><p> 
	<div class="form-group">
		<label for="password">비밀번호</label>
		<input type="password" name="password" id="password" class="form-control">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" class="form-control">
	</div>
	<div class="form-group">
		<label for="email">닉네임</label>
		<input type="text" name="nickname" id="nickname" class="form-control">
	</div>
	
	<button id="testBtn" type="submit" class="btn btn-default">등록</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>
</div>



