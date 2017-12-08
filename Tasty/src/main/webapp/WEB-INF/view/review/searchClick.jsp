<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
html, body {
	height: 96.5%;
	margin: 0 auto;
}
.plus {
   color: blue;
   font-weight: bold; 
}
.minus{
   color: red;
   font-weight: bold;
}

.review{
margin-top:30px;
border: 1px solid black;
width : 80%;
margin-left:100px;
}

.writer{
border: 1px solid red;

}

.writer{
float : left;
}

.reviewNum{
display:none;
}

</style>

<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   var address = '<%=(String)session.getAttribute("eateryJibun") %>';
   var ajaxCon;
   
   alert($(".loginCheck").html()==1);
   
   var atxt="";
   if($(".loginCheck").html()==1){
      ajaxCon = "getReviewByAddress2.do"; //로그인 안한 사람
   }else{
      ajaxCon = "getAllReviewByAddress.do"; //로그인 한 사람
   }
   
   $.ajax({
      "url":"/Tasty/review/"+ajaxCon,
      "data":"address="+address,
      "dataType":"json",
      "error":function(a, b,c){
         alert(c);
         alert("리뷰들 불러오는게 에러");
      },
      "success":function(list){
         var txt = "";
         //로그인 한 사람만 '입맛맞춰 보기'누를 수 있게 하기
         if($(".loginCheck").html()==0){
            txt += "<button id='mtTasteBtn' type='button'>입맛맞춰 보기</button>";
         }
         var total;
         $.each(list, function(){

            
         
       
             total = this.member.totalUps + this.member.totalDowns;
             pos = (this.member.totalUps / total) * 100;
            
            
            txt += "<div class='review'>";
            txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
            txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
            txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
            txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
            txt += "<div class='title'>제목 : " + this.title + "</div>";
            txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
            txt += "<div class='content'>내용 : " + this.content + "</div>";
            txt += "이 리뷰를 추천/비추천?<button class='plus'>추천</button>";
            txt += "<button class='minus'>비추천</button><br>";
            txt += "<span class='ups'>추천수 : " + this.ups + "     </span>"; 
            txt += "<span class='downs'>비추천수 : " + this.downs + "  </span><br>";
            txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
            txt += "</div><br>";
         });
         $("#reviews").html(txt); 
      }
   });
   
   
   
   
   
   $.ajax({
      "url":"/Tasty/review/getAverageRating.do",
      "data":"address="+address,
      "dataType":"json",
      "error":function(a, b,c){
         alert("평균평점 에러");
      },
      "success":function(avg){
         $("#ratings").append('평균 평점 : '+avg + '점 / 5점'); 
      }
   });
   
   
   
   
   
   
   $("body").on("click", ".rvBtn", function(){
      
      var num = $(this).parent().children('.reviewNum').html();
   
      $('#reviewNumber').val(num);
       $("#reviewDetail").submit(); 
      
      
   });
   
   
 /*    $("table").on("click", ".plus", function(){
       var evtSrc = this;
      $.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
         "url":"/Tasty/review/updateReviewUps.do",
         "data":"reviewNum="+$(evtSrc).parent().parent().children().eq(0).html(),
         "dataType":"json",
         "success":function(review){
            if(review == -1){
               alert("이미 선택하셨습니다.");
            }else{
            var txt = review;
            $(evtSrc).parent().next().next().html(txt);
            }
         }
      });
   }); */
   
   
    $("body").on("click", ".plus", function(){
       var evtSrc = this;
       var num = $(this).parent().children('.reviewNum').html();
       
       $.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
         "url":"/Tasty/review/updateReviewUps.do",
         "data":"reviewNum="+num,
         "dataType":"json",
         "success":function(review){
            if(review == -1){
               alert("이미 선택하셨습니다.");
            }else{
            var txt = "추천수 : "+ review ;
            $(evtSrc).parent().children('.ups').html(txt);
            }
         }
      }); 
   });
    
/*     
    $("div").on("click", ".minus", function(){
       var evtSrc = this;
       
      $.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
         "url":"/Tasty/review/updateReviewDowns.do",
         "data":"reviewNum="+$(evtSrc).parent().parent().children().eq(0).html(),
         "dataType":"json",
         "success":function(review){
            if(review == -1){
               alert("이미 선택하셨습니다.");
            }else{
            var txt = review;
            $(evtSrc).parent().next().next().html("-"+txt);
            }
         }
      });
   }); */
    
    
     $("body").on("click", ".minus", function(){
       var evtSrc = this;
       var num = $(this).parent().children('.reviewNum').html();
      $.ajax({//추천수를 DB에 저장해서 Controller에 가져와서 뿌려주기
         "url":"/Tasty/review/updateReviewDowns.do",
         "data":"reviewNum="+num,
         "dataType":"json",
         "success":function(review){
            if(review == -1){
               alert("이미 선택하셨습니다.");
            }else{
            var txt = "비추천수 : " + review;
            $(evtSrc).parent().children('.downs').html(txt);
            }
         }
      });
   }); 
   
   //로그인 후, 입맛맞춰보기.
   $("body").on("click","#mtTasteBtn",function(){
     $.ajax({
         "url":"/Tasty/review/getReviewByAddress.do",
         "data":"address="+address,
         "dataType":"json",
         "error":function(a, b,c){
            alert(c);
         },
         "success":function(list){
            var txt = "";
            txt += "<button id='moreBtn' type='button'>리뷰 더 보기</button>";
            var total;
            $.each(list, function(){
                total = this.member.totalUps + this.member.totalDowns;
                pos = (this.member.totalUps / total) * 100;
               
               txt += "<div class='review'>";
               txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
               txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
               txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
               txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
               txt +=    "<div class='title'>제목 : " + this.title + "</div>";
               txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
               txt += "<div class='content'>내용 : " + this.content + "</div>";
               txt += "이 리뷰를 추천/비추천?<button class='plus'>추천</button>";
               txt += "<button class='minus'>비추천</button><br>";
               txt += "<span class='ups'>추천수 : " + this.ups + "     </span>"; 
               txt += "<span class='downs'>비추천수 : " + this.downs + "  </span><br>";
               txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
               txt += "</div><br>";
            });
            $("#reviews").html(txt); 
         }
      });
     
   });
    
   //로그인 후, 전체 리뷰보기
   $("body").on("click","#moreBtn",function(){
      $.ajax({
            "url":"/Tasty/review/getAllReviewByAddress.do",
            "data":"address="+address,
            "dataType":"json",
            "error":function(a, b,c){
               alert(c);
            },
            "success":function(list){
               var txt = "";
               txt += "<button id='mtTasteBtn' type='button'>입맛맞춰 보기</button>";
               var total;
               $.each(list, function(){
             
                   total = this.member.totalUps + this.member.totalDowns;
                   pos = (this.member.totalUps / total) * 100;
                  
                  
                  txt += "<div class='review'>";
                  txt += "<div class='reviewNum'>" + this.reviewNum + "</div>";
                  txt += "<div class='writer'>리뷰 쓴사람 정보<br>글쓴이 : " + this.email + "<br>";
                  txt += "신뢰도 <br> 받은 총 평가수" + total + "<br>";
                  txt += "긍정평가률 : " + pos.toFixed(2) + "%</div>";
                  txt +=    "<div class='title'>제목 : " + this.title + "</div>";
                  txt += "<div class='ratings'>별점 : " + this.ratings + "/5.0</div>";
                  txt += "<div class='content'>내용 : " + this.content + "</div>";
                  txt += "이 리뷰를 추천/비추천?<button class='plus'>추천</button>";
                  txt += "<button class='minus'>비추천</button><br>";
                  txt += "<span class='ups'>추천수 : " + this.ups + "     </span>"; 
                  txt += "<span class='downs'>비추천수 : " + this.downs + "  </span><br>";
                  txt += "<button type='button' class='rvBtn'>리뷰 상세보기</button>";
                  txt += "</div><br>";
               });
               $("#reviews").html(txt); 
            }
         });
   });

   
});

</script>

<body>
<div style="margin-top:55px;">
<h2> 식당명: ${sessionScope.eateryTitle}</h2>
<h3>식당 주소: ${sessionScope.eateryJibun}</h3>
<h3>식당 전화번호: ${sessionScope.eateryTel }</h3>
<h4 id="ratings"></h4>


<a href="/Tasty/review/getAllTaste.do"><button type="button">리뷰 작성하기</button></a>
<p>
<p>
<p>

<!-- <table border="1">
   <thead>
      <tr>
         <td>번호</td>
         <td>제목</td>
         <td>평점</td>
         <td>이 리뷰 도움 됨</td>
         <td>이 리뷰 별로</td>
         <td>Total 추천수</td>
         <td>Total 비추천수</td>
         <td>리뷰 상세보기</td>
      </tr>
   </thead>
   <tbody id="tBody">
      
   </tbody>
</table> -->


<div id="reviews" style="overflow-x:hidden;overflow-y:auto; width:45%;">
</div>
<div id="routeReviews" style="overflow-x:hidden;overflow-y:auto;width:45%;">

</div>


<sec:authorize access="isAnonymous()">
   <span class="loginCheck" style="display:none;">1</span>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
   <span class="loginCheck" style="display:none;">0</span>
</sec:authorize>





<form action="${initParam.rootPath }/review/selectReviewByNum.do" id="reviewDetail" method="post">
 <sec:csrfInput/>
<input type="hidden" id="reviewNumber" name="reviewNum" value="">
</form>
</div>
</body>
</html>