<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>Insert title here</title>

<script src="/Tasty/script/jquery-3.2.1.min.js"></script>
<script src="/Tasty/script/star.js"></script>
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



<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/Tasty/img/grade_img2.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}

.star-input>.input>label[for="p0.5"]{width:15px;z-index:10;}
.star-input>.input>label[for="p1"]{width:30px;z-index:9;}
.star-input>.input>label[for="p1.5"]{width:45px;z-index:8;}
.star-input>.input>label[for="p2"]{width:60px;z-index:7;}
.star-input>.input>label[for="p2.5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p3"]{width:90px;z-index:5;}
.star-input>.input>label[for="p3.5"]{width:105px;z-index:4;}
.star-input>.input>label[for="p4"]{width:120px;z-index:3;}
.star-input>.input>label[for="p4.5"]{width:135px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>



</head>
<body>

<h2>${requestScope.storeName}의 리뷰작성 페이지</h2>

<form action="#" method="post">

별점:
<span class="star-input">
	<span class="input">
		<input type="radio" name="star-input" value="0.5" id="p0.5">
    	<label for="p0.5">0.5</label>
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="1.5" id="p1.5">
    	<label for="p1.5">1.5</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="2.5" id="p2.5">
    	<label for="p2.5">2.5</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="3.5" id="p3.5">
    	<label for="p3.5">3.5</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="4.5" id="p4.5">
    	<label for="p4.5">4.5</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
  	</span>
  	<output for="star-input"><b>0</b>점</output>						
</span>
<br>




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