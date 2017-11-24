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
<link rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-fa/theme.css"
   media="all" type="text/css" />
<link rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-svg/theme.css"
   media="all" type="text/css" />
<link rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-uni/theme.css"
   media="all" type="text/css" />
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/star-rating.min.js"></script>
<script
   src="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-fa/theme.js"
   type="text/javascript"></script>
<script
   src="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-svg/theme.js"
   type="text/javascript"></script>
<script
   src="${initParam.rootPath}/resource/bootstrap/js/themes/krajee-uni/theme.js"
   type="text/javascript"></script>
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
	  var txt = "<tbody><tr><td></td><td><select class='tasteSel' name='tastes'><option>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList }' var='taste'><option>${taste.tasteName}</option></c:forEach></select></td><td><select id='degreeSel' name='degrees'><option>정도를 선택하세요</option></select></td></tr></tbody>";
      
      $("#menu").append(txt)
   });
   

   $("#plusPhoto").on("click",function(){
         
       
         var html = '<tr><td>' + '<input type="file" name="upImage">' + '</td>'; //tr, td를 열고 + 문자열로 바꾸고 +td 닫기
       html += '<td><button type="button" class="deletePhoto">Del</button>'; //html변수에 삭제버튼을 대입
       html += '</td></tr>';
       
       $("#photolist").append(html);
   });

   
   $("#photolist").on("click", ".deletePhoto", function() { //list안의 btnDel을 선택
       $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
     });  
   
   
   
  
});




</script>
</head>
<body>

<h2>${requestScope.storeName}의 리뷰작성 페이지</h2>

<form action="#" method="post">
<input type="text" class="rating rating-loading" value="4" data-size="sm" title="">
제목 : <input type="text" name="title"><br>
내용: <textarea name="content" cols="40" rows="8"></textarea><br>

<table id="menu_layer">
	<thead>
		<tr>
			<td>메뉴</td>
			<td>맛</td>
			<td>정도</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<input type='text' name='menu'>
			</td>
			<td>
				<select class='tasteSel' name="tastes">
				   <option>맛을 선택하세요.</option>
				   <c:forEach items="${requestScope.tasteList }" var="taste">
				      <option>${taste.tasteName}</option>   
				   </c:forEach>
				</select>
			</td>
			<td>
				<select id="degreeSel" name="degrees">
  					<option>정도를 선택하세요</option>
				</select>
			</td>
		</tr>
	</tbody>
</table>



<%-- <div id="menu_layer">
메뉴 : <input type='text' name='menu'>
<select class='tasteSel' name="tastes">
   <option>맛을 선택하세요.</option>
   <c:forEach items="${requestScope.tasteList }" var="taste">
      <option>${taste.tasteName}</option>   
   </c:forEach>
</select>

<select id="degreeSel" name="degrees">
   <option>정도를 선택하세요</option>
</select>
</div> 
 --%>

<span id="menu">
</span>

<button id="plusMenu" type="button">메뉴추가</button>&nbsp;
<button id="plusTaste" type="button">맛추가</button>
<button id="deleteTaste" type="button">맛삭제</button>

<br><br><br>


----사진---<br>


<table id="photolist">
<tr>
   <td><input type="file" name="upImage"></td>
   <td><button type="button" class="deletePhoto">Del</button></td>
</tr>
</table>
<button type="button" id="plusPhoto">사진추가  </button><br>


</form>
</body>
</html>