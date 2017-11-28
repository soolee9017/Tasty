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
				<input type='text' name='menuList[0].menu'>
				<select class='tasteSel' name="menuList[0].tasteList[0].tastes">
				   <option>맛을 선택하세요.</option>
				      <option>신맛2</option>
				      <option>신맛3</option>
				      <option>신맛4</option>   
				</select>
				<select id="degreeSel" name="menuList[0].tasteList[0].degrees">
  					<option>1</option>
  					<option>2</option>
  					<option>3</option>
				</select>
				<select class='tasteSel' name="menuList[0].tasteList[1].tastes">
				   <option>맛을 선택하세요.</option>
				      <option>신맛2</option>
				      <option>신맛3</option>
				      <option>신맛4</option>   
				</select>
				<select id="degreeSel" name="menuList[0].tasteList[1].degrees">
  					<option>1</option>
  					<option>2</option>
  					<option>3</option>
				</select>
				<hr>
				<input type='text' name='menuList[1].menu'>
				<select class='tasteSel' name="menuList[1].tasteList[0].tastes">
				   <option>맛을 선택하세요.</option>
				      <option>신맛2</option>
				      <option>신맛3</option>
				      <option>신맛4</option>   
				</select>
				<select id="degreeSel" name="menuList[1].tasteList[0].degrees">
  					<option>1</option>
  					<option>2</option>
  					<option>3</option>
				</select>
				<select class='tasteSel' name="menuList[1].tasteList[1].tastes">
				   <option>맛을 선택하세요.</option>
				      <option>신맛2</option>
				      <option>신맛3</option>
				      <option>신맛4</option>   
				</select>
				<select id="degreeSel" name="menuList[1].tasteList[1].degrees">
  					<option>1</option>
  					<option>2</option>
  					<option>3</option>
				</select>
				
				
				<select class='tasteSel' name="menuList[1].tasteList[2].tastes">
				   <option>맛을 선택하세요.</option>
				      <option>신맛2</option>
				      <option>신맛3</option>
				      <option>신맛4</option>   
				</select>
				<select id="degreeSel" name="menuList[1].tasteList[2].degrees">
  					<option>1</option>
  					<option>2</option>
  					<option>3</option>
				</select>
<button type="submit" type="button">제출</button>
</form>

</body>
</html>