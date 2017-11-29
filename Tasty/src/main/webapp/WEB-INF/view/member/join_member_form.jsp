<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#menu_layer").on("click",".plusTaste",function(){
      if($(this).parent().next().children().length == 3){
         alert("더이상 맛 추가 안됨");
         return;
      }
      
      var txt = "<span><select class='tasteSel' name='tastes' required='required'><option>맛을 선택하세요.</option><c:forEach items='${requestScope.tasteList}' var='taste'><option>${taste.tasteName}</option></c:forEach></select><button type='button' class='deleteTaste'>X</button></span>";
      $(this).parent().next().append(txt);

   });
   
   $("#menu_layer").on("click",".deleteTaste",function(){
      $(this).parent().remove();
   });
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
   
   <table id="menu_layer" border="1">
      <thead>
          <tr>
            <td>맛추가</td>
            <td>맛</td>
         </tr>
      </thead>
      <tbody id="tBody">
         <tr>
            <td><button type='button' class='plusTaste'>맛 추가</button></td>
            <td>
            <select class='tasteSel' name="tastes" required="required">
                   <option>맛을 선택하세요.</option>
                      <c:forEach items="${requestScope.tasteList}" var='taste'>
                     <option>${taste.tasteName}</option>
                  </c:forEach>
                 </select>
                 </td>
         </tr>
      </tbody>
   </table>
   
   
   <button type="submit" class="btn btn-default">가입</button>
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










