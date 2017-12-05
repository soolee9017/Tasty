<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


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
	
	
	$("table").on("change",".tasteSel", function(){
    var evtSrc = this;
	    $.ajax({
	       "url":"/Tasty/review/getAllDegree.do",
	       "data":"taste="+$(this).val(),
	       "dataType":"json",
	       "beforeSend":function(){
	          if(evtSrc.selectedIndex == 0){
	             alert("맛을 선택하세요");
	             /* $(evtSrc).next() 는 $("#menu, #menu_layer").on("change" 액션을 취하고, 다음 tag에 적용하는 것이다.. */ 
	             $(evtSrc).next().html("<option value=''>정도를 선택하세요</option>");
	             return false;
	          }else if(evtSrc.selectedIndex == 8){
	             $(evtSrc).next().html("<option value='0'>선택불가</option>");
	             return false;
	          }
	       },
	       "success":function(list){
	          
	          var txt="<option value=''>정도를 선택하세요</option>";
	          $.each(list, function(){
	             txt += "<option>"+this+"</option>"
	          });
	          $(evtSrc).next().html(txt);
	       }
	    });      
	 });
	    
	    
	$("#plusMenu").on("click",function(){
	   var txt = "<tr><td><button  type='button' class='deleteMenu'>메뉴삭제</button></td>";
	   	  txt += "<td class='menuNum'>0</td>"
	      txt += "<td><input type='text' name='menu'></td><td><button type='button' class='plusTaste2'>맛 추가</button></td>";
	      txt += "<td><span><select class='tasteSel' name='tastes' required='required'><option value=''>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList }' var='taste' varStatus='cnt'><option value='${cnt.count}'>${taste.tasteName}</option></c:forEach></select>";
	      txt += "<select id='degreeSel' name='degrees' required='required'><option value=''>정도를 선택하세요</option></select></span></td></tr>";
	      $("#menuTable > tbody").append(txt)
	      
	   });
	
	
	   $("table").on("click",".plusTaste2",function(){
		      if($(this).parent().next().children().length == 3){
		         alert('더이상 맛 추가 안됨');
		         return;
		      }
		        var txt = "<span><select class='tasteSel' name='tastes' required='required'><option value=''>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList }' var='taste' varStatus='cnt'><option value='${cnt.count}'>${taste.tasteName}</option></c:forEach></select><select id='degreeSel' name='degrees' required='required'><option value=''>정도를 선택하세요</option></select><button type='button' class='deleteTaste'>X</button></span>";
		        $(this).parent().next().append(txt);
		   });
	   
	   
	   $("table").on("click", ".deleteMenu", function() { //list안의 btnDel을 선택
	       $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
	   });  
	   
	   $("table").on("click", ".deleteTaste", function() { //list안의 btnDel을 선택
	       $(this).parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
	   }); 
	   
	   
	   
	   $("#sendBtn").on("click", function() { 
		     var totalTr = $('#tBody>tr').length;
		     
		     var name;
		     var sLength;
		     var selVal;
		     var selectedTaste;
		     
		     var num_of_og = 0;
		     var og_menu_num=[]; 

		     var menuName =[];
		     var numOfTaste= [];
		     var listOfTaste = [];
		     var listOfDegree = [];
		 
		  
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
			       } // 여기까지가 맛 중복, 완벽 체크 
		    	 
		    	 
			       
			       // 여기서부터는 DB로 넘겨주려고 하는거 
		    	 if($('tBody>tr:eq('+i+') .menuNum').html() != 0){
		    		
		    		 num_of_og++;
		    		 og_menu_num.push($('tBody>tr:eq('+i+') .menuNum').html());
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


		  $('#numOfOg').val(num_of_og);
		  $('#og_menu_num').val(og_menu_num);
		  
		  $('#listOfMenu').val(menuName);
		  $('#numOfTaste').val(numOfTaste);
		  $('#listOfTaste').val(listOfTaste);
		  $('#listOfDegree').val(listOfDegree);
		  
		   $("#reviewForm").submit(); 
		    
		   });  
		   
	   
	   $("#photolist").on("click", ".deletePhoto", function() { //list안의 btnDel을 선택
	       $(this).parent().parent().remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
	     });  
	   
	   
	   $("#plusPhoto").on("click",function(){
	       var html = '<tr><td>' + '<input type="file" name="upImage">' + '</td>'; //tr, td를 열고 + 문자열로 바꾸고 +td 닫기
	       html += '<td><button type="button" class="deletePhoto">Del</button>'; //html변수에 삭제버튼을 대입
	       html += '</td></tr>';
	       $("#photolist").append(html);
	   });
	   
	   $("body").on("click", ".deleteOgPhotoBtn", function() { //기존에 등록된 사진을 삭제하는 함수
		   
		   var photoNum = $(this).parent().children(".photoNum").html();
	   	
	       			if(confirm("진짜 삭제하시겠습니까? 사진은 삭제하면 되돌릴 수 없음 하모예~.")==true){
			       	 		  /* $.ajax({
			       		       "url":"/Tasty/review/deletePhoto.do",
			       		       "data":"photoNum="+photoNum,
			       		       "dataType":"json",
			       		       "beforeSend":function(){
			       		      
			       		       },
			       		       "success":function(result){
			       		      			alert(result);
			       		       }
			       		    });         */
	       			}else{
	       					return;
	       			}
	     });  
    
 });
</script>


<style type="text/css">

 #menuTable tr > *:nth-child(2) {
    display: none;
}


</style>


</head>
<body>




<h2>${requestScope.review.storeName} 리뷰 수정 페이지!!</h2>
   <form action="${initParam.rootPath }/review/updateReview.do" method="post" id="reviewForm" enctype="multipart/form-data">
   <sec:csrfInput/>
    기존 별점 : ${requestScope.review.ratings}<br>
   <input id="s" name="rating" type="text" class="rating rating-loading" value="${requestScope.review.ratings}" data-size="sm" title="" required="required">
    제목 : <input type="text" name="title" required="required" value="${requestScope.review.title}"><br>
      내용: <textarea name="content" cols="40" rows="8" required="required">${requestScope.review.content}</textarea>
     <br><br> 
   <h2>메뉴 수정</h2> 
    
    <table border="1" id="menuTable">
    <thead>
    	<tr>
    		<th>메뉴 삭제</th>
    		<th>메뉴 번호</th>
    		<th>메뉴 이름</th>
    		<th>맛 추가</th>
    		<th>메뉴의 맛과 정도</th>
    		
    	</tr>
    </thead>
    
    <tbody id="tBody">
    	   <c:forEach items="${requestScope.review.menuList }" var="menu">
				<tr>
					<td><button type="button" class="delMenuBtn">메뉴 삭제</button></td>
					<td class="menuNum">${menu.menuNum}</td>
					<td><input type="text" value="${menu.menuName}"> </td>
					<td><button type="button" class="plusTaste2">맛 추가</button></td>
					<td>
					<c:forEach items="${menu.mtList }" var="menuTaste" varStatus="totalCnt">
					
					
						<span>
							  <select class='tasteSel' name="tastes" required="required">
                    				 <option value="">맛을 선택하세요.</option>
                  					 <c:forEach items="${requestScope.tasteList }" var="taste" varStatus="cnt">
                  					 	<c:choose>
                  					 		<c:when test="${cnt.count == menuTaste.allTaste.taste.tasteNum}">
                      					  		<option value="${cnt.count}" selected="selected">${taste.tasteName}</option>
                      					  	</c:when>
                      					  	<c:otherwise>
                      					  		<option value="${cnt.count}">${taste.tasteName}</option>
                      					  	</c:otherwise>
                      					 </c:choose> 
                   				     </c:forEach>
            				   </select> 
               
               					
               
            				   <select id="degreeSel" name="degrees" required="required">
            				   	
            				   	<c:choose>
            				   		<c:when test="${menuTaste.allTaste.degree.degree == 0}">
            				   				<option value="0">선택불가</option>
            				   		</c:when>
            				   		<c:otherwise>
            				   		
            				   		
            				   		<c:forEach items="${requestScope.degreeList}" var="degree" varStatus="cnt">
                  					 	<c:choose>
                  					 		<c:when test="${cnt.count == menuTaste.allTaste.degree.degree}">
                      					  		<option value="${cnt.count}" selected="selected">${degree.degree}</option>
                      					  	</c:when>
                      					  	<c:otherwise>
                      					  		<option value="${cnt.count}">${degree.degree}</option>
                      					  	</c:otherwise>
                      					 </c:choose> 
                   				     </c:forEach>
            				   				
            				   				
            				   				
            				   				
            				   		</c:otherwise>
            				   </c:choose>
            				   
           					   </select>
           					   
           					   <c:if test="${totalCnt.count != 1}" >
           					   <button type='button' class='deleteTaste'>X</button>
           					   </c:if>
           				</span>
			
					</c:forEach>
					</td>
					
				</tr>						
		   </c:forEach>       
    </tbody>
    </table>
    <button type="button" id="plusMenu">메뉴추가</button>
    
    
     
      <br>
      <br>
      <br><br>
      
      <h2>현재 추가되어있는 사진</h2> 
 <c:forEach items="${requestScope.review.reviewPhotoList}" var="reviewPhoto">
 	<div class="reviewPhoto">
	<img src="${initParam.rootPath }/photos/review/${reviewPhoto.photoList[0].photoPath}" width="300px">
	<span style="display:none;" class="photoNum">${reviewPhoto.photoList[0].photoNum}</span>
	<button type="button" class="deleteOgPhotoBtn">이 사진 삭제</button>
	</div>
</c:forEach>
    
<h2>새로 추가할 사진</h2>
      
      
      <table id="photolist">
         <tr>
            <td><input type="file" name="upImage" value="냠냠"></td>
            <td><button type="button" class="deletePhoto">Del</button></td>
         </tr>
      </table>
      <button type="button" id="plusPhoto">사진추가</button>
      <br>
      <br>
      <br>
      <br>
      
      
      
<input type="hidden" id="reviewNum" name="reviewNum" value="${requestScope.review.reviewNum}">      
<input type="hidden" id="numOfOg" name="numOfOg" value="">
<input type="hidden" id="og_menu_num" name="ogMenuNum" value="">

<input type="hidden" id="listOfMenu" name="listOfMenu" value="">
<input type="hidden" id="numOfTaste" name="numOfTaste" value="">
<input type="hidden" id="listOfTaste" name="listOfTaste" value="">
<input type="hidden" id="listOfDegree" name="listOfDegree" value="">





   </form>
   
<button id="sendBtn" type="button">리뷰 수정</button>
<button id="cancelBtn" type="button">취소</button>

</body>
</html>