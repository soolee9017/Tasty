<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
   href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
   href="${initParam.rootPath}/resource/sweetalert/css/sweetalert2.css">
<script type="text/javascript"
   src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="${initParam.rootPath}/resource/sweetalert/js/sweetalert2.min.js"></script>
<style>
* {
   list-style: none;
   text-decoration: none;
}

html, body {
   height: 96.5%;
   margin: 0 auto;
}
.selRouteList{
   width:100%;
   height:45px;
   margin-bottom:20px;
   border-bottom:1px #000 solid;
}
.routeNum{
   width:20%;
   height:100%;
   float:left;
   font-size:30px;
}
.storeName{
   width:60%;
   height:100%;
   float:right;
   font-size:14px;
   line-height:40px;
}
</style>
</head>


<script type="text/javascript">
   
</script>



<body>
   <header class="row"> <tiles:insertAttribute name="headers" />
   </header>
   <div id="map"
      style="width: 75%; height: 70%; margin-top: 50px; float: left;"></div>
   <div id="list"
      style="width: 25%; height: 70%; margin-top: 50px; background-color: #FFDC61; float: left; border: 5px #FF6600 solid;">
      <div style="text-align: center; color: black;">
         <div>
            <h3 style="color: #000033;">선택한 가게 목록</h3>
            <h6>(루트는 5개까지 선택 가능합니다)</h6> 
         </div>
         <div>
            <button class="btn btn-default" onclick="makeRoute();">선택한
               루트 선 이어주기</button>
            <button class="btn btn-default" onclick="delRoute();">루트 선택
               취소</button>
         </div>
      </div>
      <p style="width: 100%; height: 5px; background-color: #FF6600;"></p>
      <div style="width: 100%; overflow: hidden;">
         <div>
            <form style="width: 100%;"
               action="${initParam.rootPath }/route/insertRoute.do" id="list_form">
               <ul id="selectRoute">

               </ul>
               <div style="position:absolute; z-index:10; left:3%;top:74%;height:100px;">
                  <span>루트 제목 :  <input id="routeName" type="text" required="required" name="routeName"></span><br><br>
                  <textarea id="content" rows="6" cols="70" required="required" name="content"></textarea>
               </div>
            </form>
         </div>
      </div>
   </div>

   <div style="width: 300px; float: right; margin-top: 150px;">
      <button class="btn btn-default" type="submit" style="width: 45%;"
         onclick="formSubmit();">글 등록</button>
         <a href="${initParam.rootPath}/main.do" onclick="return confirm('작성을 취소하시겠습니까?');"><button class="btn btn-danger" type='button' style="width:45%;">작성 취소</button></a>
   </div>


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
      // 마커 클러스터러를 생성합니다 
      var clusterer = new daum.maps.MarkerClusterer({
         map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
         averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
         minLevel : 3
      // 클러스터 할 최소 지도 레벨 
      });
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
            clickable : true
         // 마커 이미지 
         });
         var infowindow = new daum.maps.InfoWindow({
            content : '<div style="width:200px; height:40px;">'
                  + positions[idx].title + '</div>'
         // 인포윈도우에 표시할 내용
         });

         // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
         // 이벤트 리스너로는 클로저를 만들어 등록합니다 
         // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
         (function(num) {
            daum.maps.event.addListener(marker, 'mouseover',
                  makeOverListener(map, marker, infowindow));
            daum.maps.event.addListener(marker, 'mouseout',
                  makeOutListener(infowindow));
            daum.maps.event
                  .addListener(
                        marker,
                        'click',
                        function() {
                           if (path.indexOf(positions[num].latlng) == -1) {
                              if(path.length >= 5){
                                 swal('', '루트는 5개까지 등록 가능합니다.', 'info');
                              }else{
                              path.push(positions[num].latlng);
                              $('#selectRoute')
                                    .append(
                                          "<li class='selRouteList'><div class='routeNum'>"
                                                + index
                                                + "</div><div class='storeName'>"
                                                + positions[num].title
                                                + "</div><input type='hidden' name='reviewNum' value='"+ positions[num].reviewNum +"'><input type='hidden' name='storeName' value='"+ positions[num].title +"'></li>");
                              index++;
                              }
                           }else{
                              swal('', '중복 선택 되었습니다.', 'error');
                           }
                        });
         })(idx)
         bounds.extend(points[idx]);
         markers.push(marker);
      }
      clusterer.addMarkers(markers);
      map.setBounds(bounds);

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
      function makeRoute() {
         if (path == '' || path.length == 1) {
            swal('', '가게를 먼저 선택해주세요.', 'error');
         } else {
            manager.put(daum.maps.drawing.OverlayType.POLYLINE, path);
         }
      }
      function delRoute() {
         if (path != '') {
            path = [];
            var overlays = manager.getOverlays();
            overlays['polyline'].forEach(function(polyline) {
               manager.remove(polyline);
            });
            $('.selRouteList').remove();
            index = 1;
            swal('', '선택이 해제되었습니다.', 'success');
         } else {
            swal('', '이미 선택을 해제하였습니다.', 'error');
         }
      }

      function makeOverListener(map, marker, infowindow) {
         return function() {
            infowindow.open(map, marker);
         };
      }

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
      function formSubmit() {
         if (path == '' || path.length == 1) {
            swal('', '선택하지 않았거나 한개만 선택하였습니다.', 'error');
            return;
         } else if(document.getElementById('routeName').value == "" || document.getElementById('content').value == ""){
            swal('', '루트 제목과 내용을 입력해주세요','error');
            return;
         }else{
            document.getElementById('list_form').submit();
         }

      }
   </script>
</body>
</html>