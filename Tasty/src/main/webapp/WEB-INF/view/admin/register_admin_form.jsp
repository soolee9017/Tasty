<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
$(document).ready(function() {
	
	var check = 0;
	var check2 = 0;
	var checkemail = null;
	var email = null; 
	$("#duplBtn").on("click",function(){
		check = 1;
		email = $("input[name='email']").val();
		$.ajax({
			"url":"/Tasty/admin/duplicatedCheck.do",
			"data":"email="+email,
			"success":function(result){
				var txt = "";
				if(result == 1){
					checkemail = $("input[name='email']").val(); //중복확인 눌렀을때 email
					check = 1;
					$("input[name='email']").val(checkemail);
					alert("사용가능한 email입니다.");
				}else if(result == 0){
					alert("이미 등록된 email 입니다.");
					$("input[name='email']").val(txt);
					$("input[name='email']").focus();
					return false;
				}
			}
		});
		if(check2 == 1){
			check = 0;
			return false;
		}
		
	});

	
	$("#testBtn").on("click",function(){
		email = $("input[name='email']").val(); //현재 적힌 email
		if(email != checkemail || check == 0){
			alert("email 중복확인 먼저 해주세요.");
			check2 = 1;
			return false;
		}
	});
	
});
</script>
<style>
	.form-group{
		margin-bottom:20px;
	}
</style>
<p class="center-block" style="height:1px; width:800px; background-color:#000;"></p>

<div class="row center-block text-center" style="width: 800px; margin-top: 60px;">
	<div class="text-left">
<h2>관리자 등록</h2>
</div>
<form action="${initParam.rootPath }/admin/register_admin.do" method="post" enctype="multipart/form-data" >
	<div class="form-group">
		<label for="id">Email</label>
		<input type="text" name="email" id="email" class="form-control" required="required">
	</div>
	<button id="duplBtn" class="btn btn-default" type="submit">중복 확인</button><p> 
	
	<div class="form-group">
		<label for="password">비밀번호</label>
		<input type="password" name="password" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="email">닉네임</label>
		<input type="text" name="nickname" id="nickname" class="form-control" required="required">
	</div>
	
	<button id="testBtn" type="submit" class="btn btn-default">등록</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>
</div>

