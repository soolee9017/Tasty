<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	   
	   $("#testBtn").on("click",function(){
	       if($('input:checkbox[name="tastes"]:checked').length > 3){
	         alert("맛추가안됨다");
	         $('input:checkbox[name="tastes"]').prop("checked", false);
	         return;
	      }
	   });
	   function joinSuccess(){
		   
		   swal("","가입이 완료되었습니다.","success");
	   }

	});

</script>




<h2>회원 가입</h2>
<form action="${initParam.rootPath }/join_member.do" method="post">
   <div class="form-group">
      <label for="id">사용자 ID</label>
      <input type="text" name="email" id="id" class="form-control" required="required">
   </div>
   <div class="form-group">
      <label for="password">패스워드</label>
      <input type="password" name="password" id="password" class="form-control" required="required">
   </div>
   <div class="form-group">
      <label for="name">이름</label>
      <input type="text" name="name" id="name" class="form-control" required="required">
   </div>
   <div class="form-group">
      <label for="nickname">닉네임</label>
      <input type="text" name="nickname" id="nickname" class="form-control" required="required">
   </div>
   <div class="form-group">
      <label for="phoneNum">전화번호</label>
      <input type="text" name="phoneNum" id="phoneNum" class="form-control">
   </div>
      <div class="form-group">
      <label for="gender">성별</label>
      <label><input type='radio' name='gender' value='female'/>여성</label>
      <label><input type='radio' name='gender' value='male'/>남성</label>
   </div>
 
    <div class="form-group">
      <label for="tastes">맛</label><br>
      <span id="tastes">
      <c:forEach items="${requestScope.tasteList}" var='taste'>
            <label><input type="checkbox" name="tastes" id="tastes">${taste.tasteName}</label>
      </c:forEach>
      </span>
   </div>
   
   <button type="submit" id="testBtn" class="btn btn-default">가입</button>
   <sec:csrfInput/><%-- csrf 토큰 --%>
</form>

<%--
 
**ajax 할때는 data에 저렇게 반드시 적어줘야 csrf처리가 된다.
$.ajax({
   url:"aa.do",
   type:"post",
   data:'${_csrf.paramName }=${_csrf.token }&name=abc&age=20'
}); 

--%>










