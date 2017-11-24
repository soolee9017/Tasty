<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	width: 500px;
}
</style>

<script src="/Tasty/script/star.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
   $("#menu_layer").on("change",".tasteSel", function(){
      var evtSrc = this;
      $.ajax({
         "url":"/Tasty/review/getAllDegree.do",
         "data":"taste="+$(this).val(),
         "dataType":"json",
         "beforeSend":function(){
            if(evtSrc.selectedIndex == 0){
               alert("맛을 선택하세요");
               /* $(evtSrc).next() 는 $("#menu, #menu_layer").on("change" 액션을 취하고, 다음 tag에 적용하는 것이다.. */ 
               $(evtSrc).next().html("<option>정도를 선택하세요</option>");
               return false;
            }else if(evtSrc.selectedIndex == 8){
               $(evtSrc).next().html("<option>선택불가</option>");
               return false;
            }
         },
         "success":function(list){
            
            var txt="<option>정도를 선택하세요</option>";
            $.each(list, function(){
               txt += "<option>"+this+"</option>"
            });
            $(evtSrc).next().html(txt);
         }
      });      
   });
   $("#plusTaste").on("click",function(){
	   var txt = '<tbody id="tasteSelect">';
	   txt += '<tr>';
	   txt += "<td></td>";
	   txt += '<td>';
	   txt += $("#tasteSell").html();
	   txt += '</td>';
	   txt += '<td>';
	   txt += $("#degreeSell").html();
	   txt += '</td>';
	   txt += '</tr>';
	   txt += '</tbody>';
      
      $("#menu_layer").append(txt)
   });
   
   $("#deleteTaste").on("click",function(){
	 
   });
   
   $("#plusMenu").on("click",function(){
	   var txt = '<tbody>';
	   txt += '<tr>';
	   txt += "<td>ss</td>";
	   txt += "<td>ss</td>";
	   txt += "<td>ss</td>";
	   txt += "</tr>";
	   txt += "</tbody>";
	   
      $("#menu_layer").append(txt);
   });
   
   
   
   $("#plusPhoto").on("click",function(){
       
       $('<input type="file" name="upImage"><button type="button" id="photoDelete">사진삭제</button><br>').appendTo("#photo");
       
   });
   
   
   

   $("#photoDelete").on("click",function(){

       alert('zzzz');
    
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




제목 : <input type="text" name="title"><br>
내용: <textarea name="content" cols="40" rows="8"></textarea><br>

별점 : <span class="star-input">
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

<table border='1' id="menu_layer">
<thead>
	<tr>
		<td>메뉴</td>
		<td>맛</td>
		<td>정도</td>
	</tr>
</thead>
<tbody id="tasteSelect">
	<tr>
 		<td><input type='text' name='menu'></td>
 		<td>
 		<span id="tasteSell">
		<select class='tasteSel'>
		   <option id='option'>맛을 선택하세요.</option>
		   <c:forEach items="${requestScope.tasteList }" var="taste">
		      <option>${taste.tasteName}</option>   
		   </c:forEach>
		</select>
		</span> 		
 		</td>
 		<td>
 		<span id="degreeSell">
 		<select id="degreeSel">
   			<option>정도를 선택하세요</option>
		</select>
		</span>
 		</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td colspan='3'>
		<button id="plusMenu">메뉴 추가</button>
		<button id="deleteMenu">메뉴 삭제</button>
		<button id="plusTaste" type="button">맛추가</button></td>
	</tr>
</tfoot>
</table>


<button id="deleteTaste" type="button">맛삭제</button>


<!-- <button id="plusMenu" type="button">메뉴추가</button>&nbsp; -->





<br><br><br>

----사진---    
<div id="photo">
<input type="file" name="upImage"><button type="button" id="photoDelete">사진삭제</button><br>
</div>

<button id="plusPhoto" type="button">사진 추가</button>


</form>

</body>
</html>