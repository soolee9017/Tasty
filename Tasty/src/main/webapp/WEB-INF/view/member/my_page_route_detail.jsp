<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.tasty.vo.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>



<br><br><br><br>




<h1>Route 상세정보</h1>
루트제목 : ${requestScope.route.routeName }<br>
루트내용 : ${requestScope.route.content }<br>

<a href="${initParam.rootPath}/review/backToList.do?storeName=${sessionScope.eateryTitle}&posX=${sessionScope.lng}&posY=${sessionScope.lat}">
<button>목록으로 돌아가기</button>
</a>

<sec:authorize access="isAuthenticated()">
	<%
		String email = ((Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail();
		pageContext.setAttribute("email", email);
	%>

	<c:if test="${requestScope.email==email}">
		<a href="${initParam.rootPath}/route/getXYByEmail.do?routeNum=${requestScope.route.routeNum}&email=${requestScope.email}"><button>내용
				수정</button></a>
	</c:if>
</sec:authorize>


<div id="map"
      style="width: 1000px; height: 700px; margin-top: 50px;"></div>





 <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9a267072d7a505da79a5cc7df2f5ba7&libraries=services,clusterer,drawing"></script>

   <script type="text/javascript">
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.524887, 126.9273), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new daum.maps.Map(mapContainer, mapOption);
      var zoomControl = new daum.maps.ZoomControl();
      map.addControl(zoomControl, daum.maps.ControlPosition.TOPRIGHT);
      
      var strokeColor = 'tomato', fillColor = '#cce6ff', fillOpacity = 0.5, hintStrokeStyle = 'dash';

      var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
         map : map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
         drawingMode : [ daum.maps.drawing.OverlayType.POLYLINE ],
         // 사용자에게 제공할 그리기 가이드 툴팁입니다
         // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
         polylineOptions : {
            draggable : false,
            removable : false,
            strokeColor : strokeColor,
            hintStrokeStyle : hintStrokeStyle
         }
      };
      // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
      var manager = new daum.maps.Drawing.DrawingManager(options);
      var txt;
      var markers = [];
      var positions = [];
      var points = [];
      var t = eval('${requestScope.list}');
      for (var i = 0; i < t.length; i++) {
         var obj = {};
         var x, y;
         for (var j = 0; j < t[i].length; j++) {
            if (j == 0) {
               obj.reviewNum = t[i][j];
            } else if (j == 1) {
               obj.title = t[i][j];
            } else if (j == 2) {
               y = t[i][j];
            } else {
               x = t[i][j];
            }
         }
         obj.latlng = new daum.maps.LatLng(x, y);
         positions.push(obj);
         points.push(obj.latlng);
      }
      console.log(positions)
      console.log(points)
      // 도형 스타일을 변수로 설정합니다
	  
      var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      var bounds = new daum.maps.LatLngBounds();
      var path = [];
      var index = 1;
      for (var idx = 0; idx < positions.length; idx++) {

         // 마커 이미지의 이미지 크기 입니다
         var imageSize = new daum.maps.Size(24, 35);

         // 마커 이미지를 생성합니다    
         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
         var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[idx].latlng, // 마커를 표시할 위치
            title : positions[idx].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage,
            clickable : true,
            zIndex : 4
         // 마커 이미지 
         });
         var infowindow = new daum.maps.InfoWindow({
            content : '<div style="width:150px; height:30px; overflow:auto;z-index:10;">'+ index +'&nbsp'
                  + positions[idx].title + '</div>',
         // 인포윈도우에 표시할 내용
         });
         infowindow.open(map, marker);
         index++;
         bounds.extend(points[idx]);
         markers.push(marker);
      }
      map.setBounds(bounds);
      manager.put(daum.maps.drawing.OverlayType.POLYLINE, points);
   </script>
   
   
  

</body>
</html>