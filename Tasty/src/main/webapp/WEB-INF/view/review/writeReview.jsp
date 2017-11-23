<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#menu, #menu_layer").on("change",".tasteSel", function(){
		var evtSrc = this;
		$.ajax({
			"url":"/Tasty/review/getAllDegree.do",
			"data":"taste="+$(this).val(),
			"dataType":"json",
			"beforeSend":function(){
				if(evtSrc.selectedIndex == 0){
					alert("맛을 선택하세요");
					$("#degreeSel").html("<option>정도를 선택하세요</option>");
					return false;
				}else if(evtSrc.selectedIndex == 8){
					$("#degreeSel").html("<option>선택불가</option>");
					return false;
				}
			},
			"success":function(list){
				
				var txt="<option>정도를 선택하세요</option>";
				$.each(list, function(){
					txt += "<option>"+this+"</option>"
				});
				
				$("#degreeSel").html(txt);
			}
		});		
	});
	$("#plusMenu").on("click",function(){
		var txt = "메뉴 : <input type='text' name='menu'>";
		txt += "<select class='tasteSel'>";		
		txt += "<option id='option'>맛을 선택하세요.</option>";
		txt += "<c:forEach items='${requestScope.tasteList }' var='taste'>";
		txt += "<option>${taste.tasteName}</option>";	
		txt += "</c:forEach>";
		txt += "</select>";
		txt += "<select id='degreeSel'>";
		txt += "<option>정도를 선택하세요</option>";
		txt += "</select>"+"<br>";
		
		$("#menu").append(txt)
	});
});

</script>
</head>
<body>

<h2>${requestScope.storeName}의 리뷰작성 페이지</h2>

<form action="#" method="post">


제목 : <input type="text" name="title"><br>
내용: <textarea name="content" cols="40" rows="8"></textarea><br>

<div id="menu_layer">
메뉴 : <input type='text' name='menu'>
<select class='tasteSel'>
	<option id='option'>맛을 선택하세요.</option>
	<c:forEach items="${requestScope.tasteList }" var="taste">
		<option>${taste.tasteName}</option>	
	</c:forEach>
</select>
<select id="degreeSel">
	<option>정도를 선택하세요</option>
</select>
</div> 

<div id="menu">
	
</div>

<button id="plusMenu" type="button">메뉴추가</button>

</form>


</body>
</html>