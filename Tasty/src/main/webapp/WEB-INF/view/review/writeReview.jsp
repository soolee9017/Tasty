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
	$("#tasteSel").on("change",function(){
		$.ajax({
			"url":"/Tasty/review/getAllDegree.do",
			"data":"taste="+$(this).val(),
			"dataType":"json",
			"beforeSend":function(){
				if($("#tasteSel").get(0).selectedIndex == 0){
					alert("맛을 선택하세요");
					$("#degreeSel").html("<option>정도를 선택하세요</option>");
					return false;
				}
			},
			"success":function(degreeList){
				
				var txt =""
					if($("#tasteSel").get(0).selectedIndex == 7){
					txt = "<option>선택불가</option>";
				}else{
					txt="<option>정도를 선택하세요</option> ";
	
					$.each(degreeList, function(){
						txt += "<option>"+this+"</option>"
					});
				
				}
				
				
				$("#degreeSel").html(txt);
			}
		});		
	});
	$("#plusMenu").on("click",function(){
		$("#menu_layer").prependTo("#menu");	
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

<select id='tasteSel'>
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