<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html, body {
	height: 96.5%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<button onclick="getArrow();">확인</button>
	${requestScope.list }
	<script type="text/ja vascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9a267072d7a505da79a5cc7df2f5ba7&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);
		var positions = [
		    {
		        title: '카카오', 
		        latlng: new daum.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '생태연못', 
		        latlng: new daum.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '텃밭', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		];
		// 도형 스타일을 변수로 설정합니다
		var strokeColor = '#39f', fillColor = '#cce6ff', fillOpacity = 0.5, hintStrokeStyle = 'dash';

		var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
			map : map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			drawingMode : [daum.maps.drawing.OverlayType.POLYLINE],
			// 사용자에게 제공할 그리기 가이드 툴팁입니다
			// 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
			guideTooltip : [ 'draw', 'drag', 'edit' ],
			polylineOptions: {
		        draggable: true,
		        removable: true,
		        strokeColor: strokeColor,
		        hintStrokeStyle: hintStrokeStyle
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
		    new daum.maps.LatLng(33.45178067090639, 126.5726886938753) 
		];
		
		manager.put(daum.maps.drawing.OverlayType.POLYLINE, path);
	</script>
</body>
</html>