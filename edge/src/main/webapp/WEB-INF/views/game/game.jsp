<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>Insert title here</title>
<%request.setCharacterEncoding("UTF-8") ; %>
	<style type="text/css">
	
		#container {
			position: absolute;
			width: 800px;
			height: 800px;
			z-index: 5;
		}
		
		#introWall {
			position: absolute;
			left: 1%;
			top: 1%;
			width: 98%;
			height: 98%;
			z-index: 10;
			background-color: black;
			opacity: 1;
			display: block;
			pointer-events: none;
		}
		
		#gameBoard {
			border: 2px solid black;
			width: 600px;
			height: 800px;
		}
		
		#gameBoard table{
			width: 598px;
			height: 798px;
		}
		
		#scoreBoard {
			border: 2px solid black;
			width: 200px;
			height: 800px;
			vertical-align: top;
		}
		
		#introWall img {
			position: relative;
			left: 25%;
			top: 15%;
		}
		
		#scoreBoard table{
			width: 198px;
			height: 500px;
			margin-top: 30px;
			vertical-align: top;
		}
		
		td {
			text-align: center;
		}
		
		#countCoupon {
			font-size: x-large;
		}
		
		#lane td {
			vertical-align: top;
			position: relative;
			text-align: center;
		}
		
		.coupons {
			position: absolute;
		}
		
		#stateImage {
			left: 78%;
			top: 45%;
			position: absolute;
		}
	
	</style>
</head>
<body>
	<div id="container">
		<table>
			<tr>
				<td id="gameBoard">
					<table>
						<tr style="height: 100px">
							<td colspan="4">
								<img id="cujImage" alt=""  src="<%=request.getContextPath()%>/resources/image/leftstep.png" width="80" height="100"/>
							</td>
						</tr>
						<tr id="lane" style="height: 600px;">
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="background-color: #79ff79b5; height: 5px"></td>
						</tr>
						<tr style="height: 95px">
							<td>
								<h2>A</h2>
							</td>
							<td>
								<h2>S</h2>
							</td>
							<td>
								<h2>D</h2>
							</td>
							<td>
								<h2>F</h2>
							</td>
						</tr>
					</table>
					
				</td>
				<td id="scoreBoard">
					<table>
						<tr>
							<td>
								<img alt="" src="<%=request.getContextPath()%>/resources/image/coupon.png" width="80" height="40">
								<p id="countCoupon"></p>
							</td>
						</tr>
						<tr>
							<td>
								<img id="stateImage" alt="" src="<%=request.getContextPath()%>/resources/image/good.png" width="180" height="140">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
	
	</div> <!-- End of container -->
	
	<div id="introWall">
		<img alt="" src="<%=request.getContextPath()%>/resources/image/gameIntro.png" width="1000" height="600" >
	</div>
	
	<form action="/" method="get" class="form-horizontal">
		<div class="row">
			<button type="submit" id="goToHome" style="display: none"></button>
		</div>
	</form>

	<script type="text/javascript">
	
		var v_windowHeight = window.innerHeight;
		var v_windowWidth = window.innerWidth;
	
		var v_container = document.getElementById("container");
		
		var v_tblName="coupon";
		var v_datas;
	
		window.onload = function(){
			//v_container.style.left = v_windowWidth/2 - 700 + "px"; 
			//v_container.style.top = v_windowHeight/2 - 400 + "px";
			v_container.style.left = "30%"; 
			v_container.style.top = "5%";
			
			v_datas = JSON.parse(localStorage.getItem(v_tblName));
			if(v_datas == null){
				var v_coupon = {};
				v_coupon.count = 0;
				localStorage.setItem(v_tblName, JSON.stringify(v_coupon));
			}else{
				console.log("쿠폰 수: " + v_datas.count);
				$("#countCoupon").html(v_datas.count);
			}
			
			// 화면 떨림
			f_vibration();
			// 화면 떨림 스킵
			//$("#introWall").css("display", "none");
			// 바로 게임 시작
			//f_gameStart();
			//f_dropCoupon();
	    }
	
		var v_countVib = 0;
		function f_vibration(){
			if(v_countVib > 10){
				// 인트로 끝나고 실행되는 부분들
				setTimeout(function(){
					$("#introWall").css("display", "none");
					f_gameStart();
					f_dropCoupon();
					f_moveCuj();
				}, 1000);
				return;
			}
			
			if(v_countVib % 2 == 0){
				$("#introWall img").css("left", "24%");
			}else{
				$("#introWall img").css("left", "26%");
			}
			
			v_countVib++;
			
			setTimeout(f_vibration, 100);
		}
		
		// 쿠폰 떨어지는 갯수
		var v_count = 40;
		// 쿠폰 생성 속도
		var v_dropSpeed = 4;
		var v_endCheck = false;
		function f_gameStart(){
			var v_randNum = Math.floor(Math.random() * 4);
			
			var v_coupon = "<img class='coupons' alt='' src='<%=request.getContextPath()%>/resources/image/coupon.png' width='80' height='40' style='top:0px; left:23%;'>";
			$("#lane td").eq(v_randNum).prepend(v_coupon);
			
			if(v_count <= 0){
				v_endCheck = true;
				setTimeout(function(){
					$("#goToHome").click();	
				}, 4500);
				
				return;
			}
			
			v_count--;
			
			v_randNum = Math.floor(Math.random() * 4) + v_dropSpeed;
			setTimeout(f_gameStart, (100 * v_randNum));
		}
		
		// 쿠폰 떨어지는 속도 (ms,작을수록 빠름) 
		var v_speed = 10;
		// 쿠폰 떨어지는 거리 (클수록 빠름)
		var v_dist = 3;
		var v_timer;
		
		function f_dropCoupon(){
			var v_allCoupons = document.getElementsByClassName("coupons");	
			
			if(v_endCheck){
				if(v_allCoupons.length){
					clearTimeout(v_timer);
					$("#cujImage").attr("src", "<%=request.getContextPath()%>/resources/image/finish.png");
					clearTimeout(v_cujTimer);
				}
			}
			
			for(var i = 0; i < v_allCoupons.length; i++){
				if(!v_allCoupons[i].style.top){
					v_allCoupons[i].style.top = "0px";
					v_allCoupons[i].style.left = "30%";
				}
				var v_temp = parseInt(v_allCoupons[i].style.top);

				v_allCoupons[i].style.top = (v_temp + v_dist) + "px";
				
				if(v_temp > 660){
					v_allCoupons[i].remove();
					f_minusCoupon();
				}
			}
			
			v_timer = setTimeout(f_dropCoupon, v_speed);
		}
		
		// 찬웅쌤 뒤뚱뒤뚱
		var v_cuj = 0;
		var v_cujTimer;
		function f_moveCuj(){
			if(v_cuj % 2 == 0){
				$("#cujImage").attr("src", "<%=request.getContextPath()%>/resources/image/rightstep.png");
			}else{
				$("#cujImage").attr("src", "<%=request.getContextPath()%>/resources/image/leftstep.png");
			}
			
			v_cuj++;
			v_cujTimer = setTimeout(f_moveCuj, 200);
		}
		
		// 쿠폰 차감
		function f_minusCoupon(){
			if(v_datas.count > 0){
				v_datas.count -= 1;
				$("#countCoupon").html(v_datas.count);
				localStorage.setItem(v_tblName, JSON.stringify(v_datas));
			}
			
			// bad 이미지 띄움
			$("#stateImage").attr("src", "<%=request.getContextPath()%>/resources/image/bad.png").attr("width", "200").attr("height", "160");
			
			setTimeout(function(){
				$("#stateImage").attr("width", "180").attr("height", "140");
			}, 100);
		}
		
		// 쿠폰 증가
		function f_plusCoupon(){
			v_datas.count += 1;
			$("#countCoupon").html(v_datas.count);
			localStorage.setItem(v_tblName, JSON.stringify(v_datas));
			
			// good 이미지 띄움
			$("#stateImage").attr("src", "<%=request.getContextPath()%>/resources/image/good.png").attr("width", "200").attr("height", "160");
			
			setTimeout(function(){
				$("#stateImage").attr("width", "180").attr("height", "140");
			}, 100);
		}
		
		// 클릭 이벤트
        // A: 65
        // S: 83
        // D: 68
        // F: 70
        // 엔터: 13
        // 상호작용 G: 71
        window.addEventListener("keydown", function (event) {
			if(event.keyCode == "65"){
				f_clearLane();
				$("#lane td").eq(0).css("background", "linear-gradient(white, #FF000055)");
				f_checkClick(0);
			}else if(event.keyCode == "83"){
				f_clearLane();
				$("#lane td").eq(1).css("background", "linear-gradient(white, #00FF0055)");
				f_checkClick(1);
			}else if(event.keyCode == "68"){
				f_clearLane();
				$("#lane td").eq(2).css("background", "linear-gradient(white, #0000FF55)");
				f_checkClick(2);
			}else if(event.keyCode == "70"){
				f_clearLane();
				$("#lane td").eq(3).css("background", "linear-gradient(white, #FF7F0055)");
				f_checkClick(3);
            }
        }, true);
		
        window.addEventListener("keyup", function (event) {
            if(event.keyCode == "65" || event.keyCode == "83" || event.keyCode == "68"
        		|| event.keyCode == "70"){
            	f_clearLane();
        	}
        }, true);
        
        
        function f_checkClick(p_lane){
    		var v_array = $("#lane td").eq(p_lane).children(".coupons");
    		
    		for(var i = 0; i < v_array.length; i++){
    			var v_arrayTemp = parseInt(v_array[i].style.top);
    			// top 560이 딱 진입하는 시점, top 600이 딱 끝나는 시점
    			// 최적 라인은 top이 570 ~ 590 (너무 타이트함)
    			if(v_arrayTemp > 540 && v_arrayTemp < 620){

    				// 라인에 쿠폰이 걸쳐있을때 클릭하면 인정
        			if(v_arrayTemp > 560 && v_arrayTemp < 600){
           				v_array[i].remove();
           				f_plusCoupon();
        			}else{
        				// 라인 근처에 쿠폰이 있을때 클릭하면 인정하지 않고 쿠폰은 사라짐
           				v_array[i].remove();
           				f_minusCoupon();
        			}
    			}else{
    				$("#stateImage").attr("src", "<%=request.getContextPath()%>/resources/image/bad.png").attr("width", "200").attr("height", "160");
    				
    				setTimeout(function(){
    					$("#stateImage").attr("width", "180").attr("height", "140");
    				}, 100);
    			}
    		}
        }
        
		function f_clearLane(){
			$("#lane td").css("background", "linear-gradient(white, white)");
		}
		
		
	</script>
</body>
</html>





