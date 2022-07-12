<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수고하셨습니다.</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	
	<style>
		html,
	    body {
	     	width: 100%;
	      	height: 100%;
	    }
	    
	    #intro {
	    	position: absolute;
	    	left: 30%;
	    	top: 30%;
	    	text-align: left;
	    	font-size: 60px;
	    	color: white;
	    }
	
        #textBox{
            position: relative;
            background-color: black;
            z-index: 1;
        }
        
        h1{
        	color: white;
        }
        
        #container{
        	width: 100%;
	      	height: 100%;
        	overflow: hidden;
        	position: absolute;
        	background-color: black;
        	z-index: 1;
        }
        
        img{
        	width: 100%;
	      	height: 100%;
        	position: absolute;
        	opacity: 0;
        	z-index: 100;
        }
	</style>
</head>
<body>
	
	<audio src="<%=request.getContextPath()%>/resources/sound/god.mp3" controls id="myAudio" style="display: none"></audio>

	<div id="container">
	
		<p id="intro"></p>
	
		<div id="textBox">
			<h1>안녕하세요.</h1>
			<br/>
			<h1>찬웅쌤 입니다.</h1>
			<br/>
			<h1>여러분들을 만나게 되어</h1>
			<h1>지우지 못할 추억들을</h1>
			<h1>많이 만들 수 있었습니다.</h1>
			<br/>
			<h1>넥스트IT 교육센터에서의 시간들이</h1>
			<h1>여러분들이 지치고 힘들때</h1>
			<h1>잠시 추억에 잠겨 힐링할 수 있는</h1>
			<h1>좋은 기억으로 남았기를 바랍니다.</h1>
			<br/>
			<br/>
			<br/>
			<br/>
			<h1>찬웅쌤 올림</h1>
		</div>

	</div>
	<img src="<%=request.getContextPath()%>/resources/image/1조.jpg" name="images"/>
	<img src="<%=request.getContextPath()%>/resources/image/2조.jpg" name="images"/>
	<img src="<%=request.getContextPath()%>/resources/image/1조.jpg" name="images"/>
	<img src="<%=request.getContextPath()%>/resources/image/2조.jpg" name="images"/>
	<img src="<%=request.getContextPath()%>/resources/image/1조.jpg" name="images"/>


	<script type="text/javascript">
		var audio = document.getElementById("myAudio");
		var isClick = false;
		
		$("body").click(function(){
			if(!isClick){
				f_fadeOutIntro(1);
				isClick = !isClick;
				
				setTimeout(function(){
					f_mv();
					audio.play();
					setTimeout(f_ci, 40000);
				}, 2000);
			}
		});
		
		var v_box = document.getElementById("textBox");
		var v_mv = 1;
		
		var v_windowHeight = window.innerHeight;
		
        v_box.style.top = v_windowHeight + "px";
        v_box.style.left = "50px";
        
        function f_mv(){
            v_box.style.top = parseInt(v_box.style.top) - v_mv + "px";
            
            if(parseInt(v_box.style.top) < -v_windowHeight){
            	return;
            }
   	        setTimeout(f_mv, 30);
        }
        
        var v_images =  document.getElementsByName("images");
        var v_idx = 0;
        
        console.log(v_images.length);
        
        function f_ci(){
        	console.log("그리기");
        	if(v_idx < v_images.length){
        		f_fadeIn(v_images[v_idx], 0);
	        	// v_images[v_idx].style.visibility = "visible";
    	    	v_idx++;
	        	setTimeout(f_ci, 9000);
        	}
        }
        
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
        
		var v_textArray = ["넥", "스", "트", "I", "T", " ", "교", "육", "센", "터", " ", "<br/>2", "0", "2", "2", "년", " ", "0", "2", "월", " ", "머", "신", "러", "닝", "활", "용", "반", " ", "<br/>수", "료", " ", "성", "공", "적"];
		var v_idxArray = 0;
		
		var v_intro = document.getElementById("intro");
		
		function f_intro(){
			$("#intro").html($("#intro").html() + v_textArray[v_idxArray]);
			
			v_idxArray++;
			
			if(v_idxArray >= v_textArray.length){
				return;
			}
			
			if(v_textArray[v_idxArray] == " "){
				setTimeout(f_intro, 500);
			}else{
				setTimeout(f_intro, 200);
			}
		}
		
		function f_fadeOutIntro(p_op){
			p_op -= 0.1;
			v_intro.style.opacity = p_op;
			
			if(p_op <= 0){
				return;
			}
			
			setTimeout(function(){
				f_fadeOutIntro(p_op);
			}, 200)
		} 
		
		f_intro();
	
	</script>
</body>
</html>