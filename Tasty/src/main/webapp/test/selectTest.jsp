<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>select 예제</h1>
<button id="addBtn" type="button">추가</button><br>
<script type="text/javascript" src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addBtn").on("click",function(){
		var txt = $("#aaa").html()+"<br><br>";
		$("#bbb").append(txt)
	});
});

</script>

<form action="${initParam.rootPath }/review/test.do" method="post">
<span id="aaa">
<select name="everymeal">
	<option>아침</option>
	<option>점심</option>
	<option>저녁</option>
</select>
<select name="food">
	<option>가리비</option>
	<option>짬짜면</option>
	<option>오리고기</option>
	<option>콘팡</option>
</select>
</span><br><br>

<span id="bbb">

</span>

<button type="submit" type="button">제출</button>
</form>

</body>
</html>