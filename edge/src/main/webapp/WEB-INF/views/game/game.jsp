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
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
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
								<img alt="" src="<%=request.getContextPath()%>/resources/image/good.png" width="180" height="140">
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
	
	<form action="/" method="post" class="form-horizontal">
		<div class="row">
			<button type="submit" id="goToHome" style="display: none"></button>
		</div>
	</form>

	<script type="text/javascript">
	
		var v_windowHeight = window.innerHeight;
		var v_windowWidth = window.innerWidth;
	
		var v_container = document.getElementById("container");
		
		var v_datas;
	
		window.onload = function(){
			//v_container.style.left = v_windowWidth/2 - 700 + "px"; 
			//v_container.style.top = v_windowHeight/2 - 400 + "px";
			v_container.style.left = "30%"; 
			v_container.style.top = "5%";
			
			var v_tblName="coupon";
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
			//f_vibration();
			$("#introWall").css("display", "none");
	    }
	
		var v_count = 0;
		function f_vibration(){
			if(v_count > 10){
				setTimeout(function(){
					$("#introWall").css("display", "none");
				}, 1000);
				return;
			}
			
			if(v_count % 2 == 0){
				$("#introWall img").css("left", "24%");
			}else{
				$("#introWall img").css("left", "26%");
			}
			
			v_count++;
			
			setTimeout(f_vibration, 100);
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
				f_clickLane();
				$("#lane td").eq(0).css("background", "linear-gradient(white, red)");
			}else if(event.keyCode == "83"){
				f_clickLane();
				$("#lane td").eq(1).css("background", "linear-gradient(white, green)");
			}else if(event.keyCode == "68"){
				f_clickLane();
				$("#lane td").eq(2).css("background", "linear-gradient(white, blue)");
			}else if(event.keyCode == "70"){
				f_clickLane();
				$("#lane td").eq(3).css("background", "linear-gradient(white, orange)");
            }
        }, true);
		
		function f_clickLane(){
			$("#lane td").css("background", "linear-gradient(white, white)");
		}
		
		
	</script>
</body>
</html>





