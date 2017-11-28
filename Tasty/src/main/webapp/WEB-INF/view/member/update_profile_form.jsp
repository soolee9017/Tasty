<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#menu_layer").on("change",".tasteSel", function(){
      $.ajax({
         "url":"/Tasty/review/getAllTaste3.do",
         "dataType":"json",
         "success":function(list){
            var txt="<option value=''>맛을 선택하세요</option>";
            $.each(list, function(){
               txt += "<option>"+this+"</option>"
            });
            $(".tasteSel").html(txt);
         }
      });      
   });
	 
	 $("#menu_layer").on("click",".plusTaste",function(){
	      
	      if($(this).parent().next().children().length == 3){
	         alert('더이상 맛 추가 안됨');
	         return;
	      }
	        
	  });
});
      
</script>

<h2>정보 수정 가입</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/member/update_profile.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">사용자 ID</label>
		<input type="text" name="email" id="id" class="form-control" value='<sec:authentication property="principal.email"/>' readonly="readonly">
	</div>
	<div class="form-group">
		<label for="oldPassword">기존 패스워드</label>
		<input type="password" name="oldPassword" id="oldPassword" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="password">변경할 패스워드</label>
		<input type="password" name="NewPassword" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="name" id="name" class="form-control" value='<sec:authentication property="principal.name"/>' required="required">
	</div>
	<div class="form-group">
		<label for="nickname">닉네임</label>
		<input type="text" name="nickname" id="nickname" class="form-control" value='<sec:authentication property="principal.nickname"/>' required="required">
	</div>
	<div class="form-group">
		<label for="phoneNum">전화번호</label>
		<input type="text" name="phoneNum" id="phoneNum" class="form-control" value='<sec:authentication property="principal.phoneNum"/>' required="required">
	</div>
    <div class="form-group">
      <label for="gender">성별</label>
      <label><input type='radio' name='gender' value='female'/>여성</label>
      <label><input type='radio' name='gender' value='male'/>남성</label>
   </div>
	
	
	<table id="menu_layer" border="1">
		<thead>
		 	<tr>
				<td>맛추가</td>
				<td>맛</td>
			</tr>
		</thead>
		<tbody id="tBody">
			<tr>
				<td><button type='button'class='plusTaste'>맛 추가</button></td>
				<td>
				<select class='tasteSel' name="tastes" required="required">
                   <option>맛을 선택하세요.</option>
                 </select>
                 </td>
			</tr>
		</tbody>
	</table>
	
	<sec:csrfInput/><%-- csrf 토큰 --%>
	<button type="submit" class="btn btn-default">정보수정</button>
</form>




