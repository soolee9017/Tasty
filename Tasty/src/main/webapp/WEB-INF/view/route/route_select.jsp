<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<style>
html, body {
	height: 96.5%;
	margin: 0 auto;
}
</style>
</head>


<script type="text/javascript">
 	

 	</script>



<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<button onclick="getArrow();">확인</button>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9a267072d7a505da79a5cc7df2f5ba7&libraries=services,clusterer,drawing"></script>

	<script type="text/javascript">
   
		
   $(document).ready(function(){
	   

	   		$("#btn").on("click",function(){
	   			 
	   			alert($(".stores").length)
	   		});
	    
   });
   
  
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.524887, 126.9273), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new daum.maps.Map(mapContainer, mapOption);
      
      var txt;
      
	  for(var a=0; a<$(".stores").length ; a++){
		  

	  }
      
      
      var positions = [
    	
    	  
    	  
          {
              title: '텃밭', 
              latlng: new daum.maps.LatLng(33.450879, 126.569940)
          },
          
          
          {
              title: '근린공원',
              latlng: new daum.maps.LatLng(33.451393, 126.570738)
          },
          

   	
          {
              title: '${requestScope.list[0][0]}',
              latlng: new daum.maps.LatLng(${requestScope.list[0][2]}, ${requestScope.list[0][1]})
          }
          

          
          
      ];
      // 도형 스타일을 변수로 설정합니다
      
      
      
		      
      var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
	for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
		var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});
		}

		var strokeColor = '#39f', fillColor = '#cce6ff', fillOpacity = 0.5, hintStrokeStyle = 'dash';

		var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
			map : map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			drawingMode : [ daum.maps.drawing.OverlayType.POLYLINE ],
			// 사용자에게 제공할 그리기 가이드 툴팁입니다
			// 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
			guideTooltip : [ 'draw', 'drag', 'edit' ],
			polylineOptions : {
				draggable : true,
				removable : true,
				strokeColor : strokeColor,
				hintStrokeStyle : hintStrokeStyle
			}
		};

		// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
		var manager = new daum.maps.Drawing.DrawingManager(options);

		// Toolbox를 생성합니다. 
		// Toolbox 생성 시 위에서 생성한 DrawingManager 객체를 설정합니다.
		// DrawingManager 객체를 꼭 설정해야만 그리기 모드와 매니저의 상태를 툴박스에 설정할 수 있습니다.
		var toolbox = new daum.maps.Drawing.Toolbox({
			drawingManager : manager
		});

		// 지도 위에 Toolbox를 표시합니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP은 위 가운데를 의미합니다.
		map.addControl(toolbox.getElement(), daum.maps.ControlPosition.TOP);
		var path = [
				new daum.maps.LatLng(33.452344169439975, 126.56878163224233),
				new daum.maps.LatLng(33.452739313807456, 126.5709308145358),
				new daum.maps.LatLng(33.45178067090639, 126.5726886938753) ];

		manager.put(daum.maps.drawing.OverlayType.POLYLINE, path);
	</script>

	<%--    
   <c:forEach var='review' items="${requestScope.list}" varStatus="cnt">
   
	<c:forEach items= "${review}" var="content">
				${content}<br>
		</c:forEach>			
			끝<br>
	</c:forEach>  --%>

<%-- 
	<div class="XYs" id="totalXYs">

		<c:forEach var='review' items="${requestScope.list}" varStatus="cnt">
			<div class="stores">
				<span class="store_name">${review["storeName"]}</span><br>
				<span class="x">${review["x"]}</span><br> 
				<span class="y">${review["y"]}</span><br>
				-------이 식당 정보 끝 ------<br>
			</div>
		</c:forEach>
	</div> --%>
	
	
	<div class="XYs" id="totalXYs">

		<c:forEach var='review' items="${requestScope.list}" varStatus="cnt">
			<div class="stores">
				<span class="store_name">${review[0]}</span><br>
				<span class="x">${review[1]}</span><br> 
				<span class="y">${review[2]}</span><br>
				-------이 식당 정보 끝 ------<br>
			</div>
		</c:forEach>
	</div>
	


	<button type="button" id="btn">이거클릭</button>

</body>
</html>