<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="all"
   href="${initParam.rootPath}/resource/bootstrap/css/star-rating.css">
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/star-rating.js"></script>

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
      var txt = "<select class='tasteSel'>";
      txt += "<option id='option'>맛을 선택하세요.</option>";
      txt += "<c:forEach items='${requestScope.tasteList }' var='taste'>";
      txt += "<option>${taste.tasteName}</option>";   
      txt += "</c:forEach>";
      txt += "</select>";
      txt += "<select id='degreeSel'>";
      txt += "<option>정도를 선택하세요</option>";
      txt += "</select>"+"&nbsp;";
      
      $("#menu").append(txt)
   });
   $("#deleteTaste").on("click",function(){
     var txt = "";
     $("#")
   });
   $("#plusMenu").on("click",function(){
      var txt = "메뉴 : <input type='text' name='menu'>"+"&nbsp;";
      txt += "<select class='tasteSel'>";      
      txt += "<option id='option'>맛을 선택하세요.</option>";
      txt += "<c:forEach items='${requestScope.tasteList }' var='taste'>";
      txt += "<option>${taste.tasteName}</option>";   
      txt += "</c:forEach>";
      txt += "</select>";
      txt += "<select id='degreeSel'>";
      txt += "<option>정도를 선택하세요</option>";
      txt += "</select>"+"&nbsp;"+"</br>";
      
      $("#menu").append(txt)
   });
   $("#plusPhoto").on("click",function(){
       $('<input type="file" name="upImage"><button type="button" id="photoDelete">사진삭제</button><br>').appendTo("#photo");
   });
   $("#photoDelete").on("click",function(){
       alert('zzzz');
   });
});
</script>
</head>
<body>

<h2>${requestScope.storeName}의 리뷰작성 페이지</h2>

<form action="#" method="post">
<input type="text" class="rating rating-loading" value="0" data-size="sm" title="">
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
<button id="plusTaste" type="button">맛추가</button>
<button id="deleteTaste" type="button">맛삭제</button>
</div> 
<div id="menu">
</div>
<button id="plusMenu" type="button">메뉴추가</button>&nbsp;

<br><br><br>

----사진---    
<div id="photo">
<input type="file" name="upImage"><button type="button" id="photoDelete">사진삭제</button><br>
</div>

<button id="plusPhoto" type="button">사진 추가</button>
</form>
</body>
</html>