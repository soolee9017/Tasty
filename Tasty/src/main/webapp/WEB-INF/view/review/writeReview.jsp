<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
   <link type="text/css" rel="stylesheet"
   href="${initParam.rootPath}/resource/sweetalert/css/sweetalert2.css">
   <script type="text/javascript"
   src="${initParam.rootPath}/resource/sweetalert/js/sweetalert2.min.js"></script>

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
               $(evtSrc).next().html('<option value="">정도를 선택하세요</option>');
               return false;
            }else if(evtSrc.selectedIndex == 8){
               $(evtSrc).next().html("<option value='0'>선택불가</option>");
               return false;
            }
         },
         "success":function(list){
            
            var txt='<option value="">정도를 선택하세요</option>';
            $.each(list, function(){
               txt += "<option>"+this+"</option>"
            });
            $(evtSrc).next().html(txt);
         }
      });      
   });
      
    
      
   $("#plusMenu").on("click",function(){
   var txt = "<tr><td><button  type='button' class='deleteMenu btn btn-danger'>메뉴삭제</button></td>";
      txt += "<td><input type='text' name='menu' class='menu_name' required></td><td><button type='button' class='plusTaste2 btn btn-primary'>맛 추가</button></td>";
      txt += "<td><span><select class='tasteSel' name='tastes' required='required'><option value=''>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList }' var='taste' varStatus='cnt'><option value='${cnt.count}'>${taste.tasteName}</option></c:forEach></select>";
      txt += "<select id='degreeSel' name='degrees' required='required'><option value=''>정도를 선택하세요</option></select></span></td></tr>";
      $("#menu_layer > tbody").append(txt)
      
   });
   
   
    
   
   $("#menu_layer").on("click",".plusTaste2",function(){
      if($(this).parent().next().children().length == 3){
         alert('더이상 맛 추가 안됨');
         return;
      }
        var txt = "<span>&nbsp;&nbsp;<select class='tasteSel' name='tastes' required='required'><option value=''>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList }' var='taste' varStatus='cnt'><option value='${cnt.count}'>${taste.tasteName}</option></c:forEach></select><select id='degreeSel' name='degrees' required='required'><option value=''>정도를 선택하세요</option></select><button type='button' class='deleteTaste btn btn-danger'>X</button></span>";
        $(this).parent().next().append(txt);
   });

   
   $("#plusPhoto").on("click",function(){
       var html = '<tr><td>' + '<input type="file" name="upImage" class="btn btn-default">' + '</td>'; //tr, td를 열고 + 문자열로 바꾸고 +td 닫기
       html += '<td><button type="button" class="deletePhoto btn btn-danger">Del</button>'; //html변수에 삭제버튼을 대입
       html += '</td></tr>';
       $("#photolist").append(html);
   });

   
   $("#photolist").on("click", ".deletePhoto", function() { //list안의 btnDel을 선택
       $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
     });  
   
   
   $("#menu_layer").on("click", ".deleteMenu", function() { //list안의 btnDel을 선택
       $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
   });  
   
   $("#menu_layer").on("click", ".deleteTaste", function() { //list안의 btnDel을 선택
       $(this).parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
   }); 
   

  $("#sendBtn").on("click", function() { 
	  
	  if(document.getElementById('s').value == "" || document.getElementById('title').value == ""
			  || document.getElementById('content').value == ""){
          swal('', '빈칸확인','error');
          return;
	  }
	  
	  if($(".menu_name").val() == "" || $(".tasteSel").val() == "" || $("#degreeSel").val() == ""){
      swal('', '빈칸확인','error');
      return;
 	 }

	  

	  
	  
	   
      var totalTr = $('#tBody>tr').length;
     var menuName =[];
     var numOfTaste= [];
     var listOfTaste = [];
     var listOfDegree = [];
     var name;
     var sLength;
     var selVal;
     var selectedTaste;
     
     for(var i = 0; i<totalTr ; i++){

      
       var tasteSel = $('#tBody>tr:eq('+i+') .tasteSel');
       
	   if(tasteSel.length ==2){
    	   if(tasteSel[0].value == tasteSel[1].value){
    		   alert('중복된 맛');
    		   return;
    	   } else if(tasteSel[0].value == '8' || tasteSel[1].value == '8'){
    		   alert('완벽한 맛은 한가지 맛만 선택가능합니다.');
    		   return;
    	   }
    	   
       }else if(tasteSel.length ==3){
    	   if(tasteSel[0].value == tasteSel[1].value 
    			   || tasteSel[0].value == tasteSel[2].value|| tasteSel[1].value==tasteSel[2].value ){
    		   alert('중복된 맛');
    		   return;
    	   }else if(tasteSel[0].value == '8' || tasteSel[1].value == '8' || tasteSel[2].value == '8'){
    		   alert('완벽한 맛은 한가지 맛만 선택가능합니다.');
    		   return;
    	   }
       }
   
    	name= $('#tBody>tr:eq('+i+') input').val();
   	    sLength = $('#tBody>tr:eq('+i+') select').length;
     menuName.push(name);
     numOfTaste.push(sLength/2);
     
      for(var s=0; s<sLength ; s++){
        
           selVal= $('#tBody>tr:eq('+i+') select:eq('+s+')').val();
             if(s%2 == 0){
                 listOfTaste.push(selVal);      
             }else{
                 listOfDegree.push(selVal);
           }
       }
      
    }
  
  
 
  $('#listOfMenu').val(menuName);
  $('#numOfTaste').val(numOfTaste);
  $('#listOfTaste').val(listOfTaste);
  $('#listOfDegree').val(listOfDegree);
  
   $("#reviewForm").submit();  
    
  });  

  
   
});
   
 


</script>
<style type="text/css">
	html, body{
		width:100%;
	}
	thead td{
		text-align:center;
		color:black;
		font-size:20px;
		border-bottom:1px #000 solid;
	}
	tbody tr{
		height:65px;
		border-bottom:1px black solid;
	}
	select {
		height:30px;
		margin-top:10px;
	}
</style>

</head>
<body style="background-color:#bebebe;">
<header class="row" style="width:100%; margin-bottom:70px;">
			<tiles:insertAttribute name="headers" />
</header>
<div style="width:1300px; margin-top:70px; margin:0 auto;">
   <h1>${sessionScope.eateryTitle}</h1>
   <p style="width:100%; height:1px; background-color:black;"></p>
   <form action="${initParam.rootPath }/review/registerReview.do" method="post" id="reviewForm"
   enctype="multipart/form-data">
   
   <sec:csrfInput/>
   <input id="s" name="rating" type="text" class="rating rating-loading" value="0" data-size="md" title="" required="required">
    <input placeholder="제목" type="text" name="title" id="title" required="required" size="78" style="margin-bottom:30px; height:40px;"><br>
      <textarea placeholder="내용" name="content" cols="80" rows="8" required="required" id="content" style="overflow:auto;"></textarea>
      <br>
      <table id="menu_layer" style="margin-top:30px;">
         <thead>
            <tr>
               <td>메뉴삭제</td>
               <td>메뉴 이름</td>
               <td>맛 추가</td>
               <td>맛+정도</td>
            </tr>
         </thead>
         <tbody id="tBody">
            <tr>
               <td><button type="button" class="deleteMenu btn btn-danger">메뉴삭제</button></td>
               <td><input type='text' name='menu' class="menu_name" required style="height:30px;"></td>
               <td><button type='button'class='plusTaste2 btn btn-primary'>맛 추가</button></td>
               <td><span><select class='tasteSel' name="tastes" required="required">
                     <option value="">맛을 선택하세요.</option>
                     <c:forEach items="${requestScope.tasteList }" var="taste" varStatus="cnt">
                        <option value="${cnt.count}">${taste.tasteName}</option>
                     </c:forEach>
               </select> <select id="degreeSel" name="degrees" required="required">
                     <option value="">정도를 선택하세요</option>
               </select></span></td>
            </tr>
         </tbody>
      </table>
      <span id="menu"></span>
      <button id="plusMenu" type="button" class="btn btn-primary">메뉴추가</button>
      <br>
      <br>
      <br>
      <span style="color:#000; font-size:30px;">사진 추가</span>
      <table id="photolist">
         <tr>
            <td><input type="file" name="upImage" class="btn btn-default"></td>
            <td><button type="button" class="deletePhoto btn btn-danger">Del</button></td>
         </tr>
      </table>
      <button type="button" id="plusPhoto"  class="btn btn-primary">사진추가</button>
      <br>
      <br>
<input type="hidden" id="listOfMenu" name="listOfMenu" value="">
<input type="hidden" id="numOfTaste" name="numOfTaste" value="">
<input type="hidden" id="listOfTaste" name="listOfTaste" value="">
<input type="hidden" id="listOfDegree" name="listOfDegree" value="">

<br><br>
 <button id="sendBtn" type="button" class="btn btn-success">리뷰 전송</button> 

   </form>
   
   <br><br><br>
</div>
</body>
</html> 