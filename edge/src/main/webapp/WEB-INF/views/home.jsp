<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>EndGame</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	
	<style type="text/css">
		div {
			padding: 0;
			margin: 0;
		}
	
		#container {
			position: absolute;
			width: 1400px;
			height: 800px;
			border: 2px solid black;
			z-index: 200;
		}
		
		#blackWall {
			position: absolute;
			left: 1%;
			top: 1%;
			width: 98%;
			height: 98%;
			z-index: 300;
			background-color: black;
			opacity: 0;
			pointer-events: none;
		}
		
		#leftBox {
			display: inline-block;
			position: relative;
			float: left;
			width: 620px;
			top: 100px;
		}
		
		#rightBox {
			display: inline-block;
			position: relative;
			float: right;
			width: 620px;
			top: 100px;
		}
		
		#upper {
			width: 100%;
			height: 60px;
			margin: 0;
			padding: 0;
		}
		
		.uppers {
			width: 600px;
			background-color: black;
		}
		
		#user {
			display: inline-block;
			position: absolute;
			width: 60px;
			height: 70px;
		}
	
		#coupon {
			display: inline-block;
			position: relative;
			float: right;
			top: 40px;
			right: 40px;
			border: 3px solid black;
			padding: 20px;
		}
		
		#giftWindow {
			display: inline-block;
			position: absolute;
			width: 450px;
			height: 250px;
			left: -5000;
			top: -5000;
			border: 3px solid black;
			background-color: white;
			padding-bottom: 20px;
		}
		
		#thankWindow {
			display: inline-block;
			position: absolute;
			width: 1397px;
			height: 300px;
			left: -5000;
			top: -5000;
			border: 3px solid black;
			background-color: white;
			z-index: 10;
		}
		
		.friend {
			display: inline-block;
			margin-top: 20px;
			margin-left: 2px;
			margin-right: 2px;
			width: 140px;
			height: 190px;
		}
		
		.innerFriend {
			margin: 0 auto;
			width: 100%;
			height: 100%;
			text-align: center;
		}
		
		.greenBar {
			background-color: #3de600;
			display: inline-block;
			top: 30%;
			width: 1%;
			height: 50%;
			position: absolute;
		}
		
		.greyBar {
			background-color: #e1e1e1;
			display: inline-block;
			top: 30%;
			width: 100%;
			height: 50%;
			position: absolute;
		}
		
	</style>
</head>
<body>
	<div id="container">
		<div id="upper">
	        <table style="height: 100%; width: 100%;">
	            <tr style="font-size: 20px;">
	                <td class="uppers"></td>
	                <td style="text-align: center;">
	                	???
	                	<br/>
	                	?????????
	                </td>
	                <td class="uppers"></td>
	            </tr>
	        </table>
		</div>
		
		<div id="user">
			<img id="userImage" alt=""  src="<%=request.getContextPath()%>/resources/image/down.png" width="80" height="100"/>
		</div>
		
		<div id="coupon">
			<table style="font-size: 20pt">
				<tr>
					<td>
						<img alt="" src="<%=request.getContextPath()%>/resources/image/coupon.png" width="80" height="40">
					</td>
					<td><span>&nbsp;x&nbsp;</span></td>
					<td id="countCoupon"></td>
				</tr>
			</table>
		</div>
		
		<div id="leftBox">
			<c:forEach items="${friendList }" var="friend" varStatus="status">
				<c:if test="${status.count < '13'}">
					<div class="friend" id="${friend.friName}|${friend.friNo}" onclick="f_getNo(this)">
						<table class="innerFriend">
							<tr>
								<td>
									<img alt="" src="<%=request.getContextPath()%>/resources/image/heart.png" width="20" height="20">
								</td>
								<td style="width: 70%; text-align: left; position: relative;">
									<div class="greyBar"></div>
									<c:if test="${friend.friLove >= '10'}">
										<div id="${friend.friNo}" class="greenBar" style="width: 100%"></div>
									</c:if>
									<c:if test="${friend.friLove < '10'}">
										<div id="${friend.friNo}" class="greenBar" style="width: ${friend.friLove}0%"></div>
									</c:if>
								</td>
							</tr>
							<c:if test="${friend.friGender eq 'M'}">
								<tr><td colspan="2"><img alt="" src="<%=request.getContextPath()%>/resources/image/male.png" width="130" height="150"></td></tr>
							</c:if>
							<c:if test="${friend.friGender eq 'F'}">
								<tr><td colspan="2"><img alt="" src="<%=request.getContextPath()%>/resources/image/female.png" width="130" height="150"></td></tr>
							</c:if>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="rightBox">
			<c:forEach items="${friendList }" var="friend" varStatus="status">
				<c:if test="${status.count >= '13'}">
					<div class="friend" id="${friend.friName}|${friend.friNo}" onclick="f_getNo(this)">
						<table class="innerFriend">
							<tr>
								<td>
									<img alt="" src="<%=request.getContextPath()%>/resources/image/heart.png" width="20" height="20">
								</td>
								<td style="width: 70%; text-align: left; position: relative;">
									<div class="greyBar"></div>
									<c:if test="${friend.friLove >= '10'}">
										<div id="${friend.friNo}" class="greenBar" style="width: 100%"></div>
									</c:if>
									<c:if test="${friend.friLove < '10'}">
										<div id="${friend.friNo}" class="greenBar" style="width: ${friend.friLove}0%"></div>
									</c:if>
								</td>
							</tr>
							<c:if test="${friend.friGender eq 'M'}">
								<tr><td colspan="2"><img alt="" src="<%=request.getContextPath()%>/resources/image/male.png" width="130" height="150"></td></tr>
							</c:if>
							<c:if test="${friend.friGender eq 'F'}">
								<tr><td colspan="2"><img alt="" src="<%=request.getContextPath()%>/resources/image/female.png" width="130" height="150"></td></tr>
							</c:if>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div id="giftWindow">
			<table class="innerfriend">
				<tr>
					<td>
						<h2 id="giftName"></h2>
					</td>
				</tr>
				<tr>
					<td>
						<h2 id="giftCount">0</h2>
						<input id="giftRange" value="0" type="range" min="0" max="10" step="1" oninput="f_cgCount(this)">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" onclick="f_gift()" value="??????" width="90" height="60">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="thankWindow">
			<table>
				<tr>
					<td>
						<img id="profile" alt="" src="" width="240" height="295">
					</td>
					<td style="width: 70%; padding-left: 20px">
						<h2 id="thank"></h2>
					</td>
				</tr>
			</table>
		</div>
		
	</div> <!-- container End -->
	
	<div id="blackWall">
	
	</div>

	<form action="/end" method="post" class="form-horizontal">
		<div class="row">
			<button type="submit" id="goToEnd" style="display: none"></button>
		</div>
	</form>
	
	<form action="/game" method="post" class="form-horizontal">
		<div class="row">
			<button type="submit" id="goToGame" style="display: none"></button>
		</div>
	</form>

	<script type="text/javascript">
	
		var v_windowHeight = window.innerHeight;
		var v_windowWidth = window.innerWidth;
	
		var v_container = document.getElementById("container");
		var v_user = document.getElementById("user");
		
		var v_datas;
		var v_tblName="coupon";
		
        window.onload = function(){
    		v_container.style.left = v_windowWidth/2 - 700 + "px"; 
    		v_container.style.top = v_windowHeight/2 - 400 + "px";
    		
    		// ?????? ?????? ??????
    		v_user.style.top = "148px";
    		v_user.style.left = "672px";
    		
    		v_datas = JSON.parse(localStorage.getItem(v_tblName));
    		if(v_datas == null){
    			var v_coupon = {};
    			v_coupon.count = 0;
    			localStorage.setItem(v_tblName, JSON.stringify(v_coupon));
    		}else{
    			console.log("?????? ???: " + v_datas.count);
    			$("#countCoupon").html(v_datas.count);
    		}
        }

        window.onresize = function(){
        	// ??????????????? ????????? ??? ????????????
    		v_container.style.left = v_windowWidth/2 - 700 + "px"; 
    		v_container.style.top = v_windowHeight/2 - 400 + "px"; 
        }
        
       
		var v_speed = 10;	// ????????????
		var v_length = 4;	// ????????????
		var v_timer;
		var v_toggle = false;
		var v_state = "";
		
		var v_temp = 0;
		
		// ?????? ??????
		function f_move(){
			if(v_state == "left"){
				$("#userImage").attr("src", "<%=request.getContextPath()%>/resources/image/left.png");
				v_temp = parseInt(v_user.style.left);
				if(v_temp > v_length){
					v_user.style.left = parseInt(v_user.style.left) - v_length + "px";
				}
			}else if(v_state == "right"){
				$("#userImage").attr("src", "<%=request.getContextPath()%>/resources/image/right.png");
				v_temp = parseInt(v_user.style.left);
				if(v_temp < 1400 - v_length - 60){ // ??????(width) ?????? ????????? ?????? 60 ???
					v_user.style.left = parseInt(v_user.style.left) + v_length + "px";
				}
			}else if(v_state == "up"){
				$("#userImage").attr("src", "<%=request.getContextPath()%>/resources/image/up.png");
				v_temp = parseInt(v_user.style.top);	// ??? ??????(top)
				if(v_temp > v_length + 60){		// ?????? ??????
					v_user.style.top = parseInt(v_user.style.top) - v_length + "px";
				}else{	
					v_temp = parseInt(v_user.style.left);
					if(v_temp > 600 && v_temp < 800){ 	// ?????? ?????? ??????
						v_temp = parseInt(v_user.style.top);
						if(v_temp > v_length){	
							v_user.style.top = parseInt(v_user.style.top) - v_length + "px";
							
							// ?????????
							if(v_temp < 20){
								$("#goToGame").click();
								return;
							}
						}
					}
				}
			}else if(v_state == "down"){
				$("#userImage").attr("src", "<%=request.getContextPath()%>/resources/image/down.png");
				v_temp = parseInt(v_user.style.top);
				if(v_temp < 800 - v_length - 70){ // ??????(height) 800?????? ????????? ?????? 70 ??? 
					v_user.style.top = parseInt(v_user.style.top) + v_length + "px";
				}
			}
			
			v_timer = setTimeout(f_move, v_speed);
		}
		
        // ??????
        // A: 65, ArrowLeft: 37
        // D: 68, ArrowRight: 39
        // W: 87, ArrowUp: 38
        // S: 83, ArrowDown: 40
        
        // ??????: 13
        
        // ???????????? G: 71
        window.addEventListener("keydown", function (event) {
        	if(event.keyCode == "71"){
        		if(v_toggleThankWindow){
        			// ???????????? ???????????? G?????? ????????? ??????
        			f_toggleThank();
                	// ?????? ?????? ?????? ??????
                	f_checkLove();
        		}else if(v_toggleGiftWindow){
        			// ???????????? ???????????? G?????? ????????? ??????
        			f_toggleWindow();
        		}else{
        			// ???????????? ??????????????? G?????? friend ??????
	        		f_friendClick();
        		}
        			
        	}else{
        		if(v_toggle){
        			return;
        		}
                if(event.keyCode == "37"){
                	v_state = "left";
                	f_move();
                	v_toggle = true;
                }else if(event.keyCode == "39"){
                	v_state = "right";
                	f_move();
                	v_toggle = true;
                }else if(event.keyCode == "38"){
                	if(v_toggleGiftWindow){
                		$("#giftRange").val(parseInt($("#giftRange").val()) + 1);
                		$("#giftCount").html(parseInt($("#giftRange").val()));
                	}else{
	                	v_state = "up";
	                	f_move();
	                	v_toggle = true;
                	}
                	
                }else if(event.keyCode == "40"){
      				if(v_toggleGiftWindow){
      					// ????????????(-)??? parseInt ????????? ????????? ?????????(+) ????????? ????????? ?????? ?????? ???
                		$("#giftRange").val($("#giftRange").val() - 1);
                		$("#giftCount").html(parseInt($("#giftRange").val()));
                	}else{
	                	v_state = "down";
	                	f_move();
	                	v_toggle = true;
                	}
                }else if(event.keyCode == "13"){
      				if(v_toggleGiftWindow){
      					// ???????????? ???????????? ???????????? ???????????? 
      					f_gift();
                	}
      				
            		if(v_toggleThankWindow){
            			// ???????????? ???????????? ???????????? ????????? ??????
            			f_toggleThank();
                    	// ?????? ?????? ?????? ??????
                    	f_checkLove();
            		}
                }
        		
        	}
        }, true);
		
        window.addEventListener("keyup", function (event) {
            if(event.keyCode == "37" || event.keyCode == "39" || event.keyCode == "38"
            		|| event.keyCode == "40"){
            	v_toggle = false;
            	clearTimeout(v_timer);
            }
        }, true);
        
        
        // ???????????? ???
        var v_giftWindow = document.getElementById("giftWindow");
        
        // input range ?????????????????? ????????? ?????????
        function f_cgCount(p_value){
        	$("#giftCount").html(p_value.value);
        }
        
        // ????????? ?????? ??????
        var v_toggleGiftWindow = false;
        
        function f_toggleWindow(){
        	if(v_toggleGiftWindow){
        		v_toggleGiftWindow = false;
        		v_giftWindow.style.left = "-5000px";
        		v_giftWindow.style.top = "-5000px";
        	}else{
        		v_toggleGiftWindow = true;
        		var f_this = document.getElementById(v_friNo);
        		var f_thisLove = parseInt(f_this.style.width) / 10;
        		console.log(f_thisLove);
        		if(v_datas.count < 10){
        			if(v_datas.count + f_thisLove < 10){
		        		$("#giftRange").attr("max", v_datas.count);
        			}else{
        				$("#giftRange").attr("max", (10 - f_thisLove));
        			}
        		}else{
        			$("#giftRange").attr("max", (10 - f_thisLove));
        		}
        		$("#giftName").html(v_friName + "?????? ????????? ?????? ??????????");
        		$("#giftRange").val(0);
        		$("#giftCount").html(0);
        		v_giftWindow.style.left = "35%";
        		v_giftWindow.style.top = "25%";
        	}
        }
        
        // ?????? ???????????? ????????? ?????? ?????? ??????
        var v_friNo = 0;
        var v_friName = "";
        
        // ?????? ?????? ??????
        function f_gift(){
        	// ?????? ?????????
        	var v_valGiftRange = $("#giftRange").val();
        	// ?????? 0?????? ??????????????? ????????? ?????? x
        	if(v_valGiftRange == 0){
        		f_checkLove();
        		return;
        	}
			v_datas.count -= v_valGiftRange;
			$("#countCoupon").html(v_datas.count);
			localStorage.setItem(v_tblName, JSON.stringify(v_datas));
			
        	$.ajax({
                type:"post", 
                url:'<c:url value="/gift" />',
        		dataType : 'json', 
                data:"friNo=" + v_friNo + "&giftCount=" + v_valGiftRange,
                success:function(p_result){
                	f_getFriend();
                }
                , error : function(req, st, err) {
    				console.log('----------------------------');
    				console.log('request', req);
    				console.log('status', st);
    				console.log('errors', err);
    				console.log('----------------------------');
    			}
        	});
        }

		
        // g??? ????????? ?????? ??? ????????? ?????? ????????? ?????? ?????????(f_getNo ??????)
        function f_friendClick(){
        	
        	// ????????? ?????? ?????? (style.left ??? style.top??? ?????? ????????? ????????? ??????)
       		var v_userLeft = window.pageXOffset + v_user.getBoundingClientRect().left;
       		var v_userTop = window.pageYOffset + v_user.getBoundingClientRect().top;
       		
       		// ????????? ????????? ?????? ?????? ???????????? ?????????(v_user)??? ????????? ??????
       		v_userLeft += 30;
       		v_userTop += 35;
       		
       		// ????????? ?????? ?????? ????????? ?????? ?????? 1
       		document.elementFromPoint(v_userLeft, v_userTop).click();
       		
/*      	// ????????? ?????? ?????? ????????? ?????? ?????? 2
			var evt = document.createEvent("MouseEvents");
    		evt.initMouseEvent("click", true, true, window, 0,0,0,0,0, false, false, false, 0, null);
    		var cb = document.elementFromPoint(v_userLeft, v_userTop);
    		cb.dispatchEvent(evt);  */
        }
        
        // ?????? ?????? ?????? ????????? ?????? ?????? ?????? v_friNo, f_friName??? ????????? ??? f_toggleWindow() ??????
        function f_getNo(thisNo){
        	v_friName = thisNo.id.split("|")[0];
        	v_friNo = thisNo.id.split("|")[1];
        	
        	f_toggleWindow();
        }
        
     	// ????????? ?????? ??????
     	var v_thankWindow = document.getElementById("thankWindow");
        var v_toggleThankWindow = false;
        
        function f_toggleThank(){
        	if(v_toggleThankWindow){
        		// ?????? ??????
        		v_toggleThankWindow = false;
        		v_thankWindow.style.left = "-5000px";
        		v_thankWindow.style.top = "-5000px";
        	}else{
        		// ?????? ??????
        		v_toggleThankWindow = true;
        		v_thankWindow.style.left = "0%";
        		v_thankWindow.style.top = "62%";
        	}
        }
        
        var v_aniIdx = 0;
        var v_aniText = "";
        
        // v_friNo??? ???????????? DB?????? ?????? ????????? ????????? ?????????
        function f_getFriend(){
        	$("#profile").attr("src", "");
        	$.ajax({
                type:"post", 
                url:'<c:url value="/friend" />',
        		dataType : 'json', 
                data:"friNo="+v_friNo,
                success:function(p_result){
                	// ??? ??????
                	f_toggleWindow();
                	
                	// ????????? ????????? ??? UI??? ??????
                	if(p_result.friend.friLove >= 10){
	                	$('#' + v_friNo).css("width", "100%");
                	}else{
                		$('#' + v_friNo).css("width", p_result.friend.friLove + "0%");
                	}
                	
                	$("#profile").attr("src", p_result.friend.friImage);
                	f_toggleThank();
                	
                	// ?????? ????????????
                	v_aniIdx = 0;
                	v_aniText = p_result.friend.friThanks;
                	$("#thank").html("");
                	f_animation();
                }
                , error : function(req, st, err) {
    				console.log('----------------------------');
    				console.log('request', req);
    				console.log('status', st);
    				console.log('errors', err);
    				console.log('----------------------------');
    			}
        	});
        }
        
        // ?????? ?????? ???????????? ??????
        function f_animation(){
			$("#thank").html($("#thank").html() + v_aniText[v_aniIdx]);
			
			v_aniIdx++;
			
			if(v_aniIdx >= v_aniText.length){
				return;
			}
			
			if(v_aniText[v_aniIdx] == " "){
				// ???????????? ????????? ?????? ?????? ???, ?????? 500 (?????????????????? ??????)
				setTimeout(f_animation, 300);
			}else{
				// ?????? ?????? ?????? 200 (?????????????????? ??????)
				setTimeout(f_animation, 150);
			}
        }
        
        // ????????? ???????????? 10 ????????? ???????????? ?????? ??? ?????????????????? ??????
        function f_checkLove(){
        	var v_allLove = document.getElementsByClassName("greenBar");
        	
        	var v_isNotLove = true;
        	for(var i = 0; i < v_allLove.length; i++){
        		var v_tempWidth = parseInt(v_allLove[i].style.width);
        		if(v_tempWidth < 100){
        			v_isNotLove = false;
        		}
        	}
        	
        	if(v_isNotLove){
        		var v_blackWall = document.getElementById("blackWall");
        		f_fadeIn(v_blackWall, 0);
        		setTimeout(function(){
		        	$("#goToEnd").click();
        		}, 2000);
        	}
        }
        
        // ?????? ???????????? ???????????? ??? ?????? ?????? ??????
		function f_fadeIn(p_image, p_op){
			p_op += 0.1;
			p_image.style.opacity = p_op;
			
			if(p_op >= 1){
				return;
			}
			
			setTimeout(function(){
				f_fadeIn(p_image, p_op);
			}, 200)
		}   
        
	</script>
</body>
</html>
