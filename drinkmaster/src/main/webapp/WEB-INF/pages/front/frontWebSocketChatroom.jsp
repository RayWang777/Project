<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    	

<jsp:include page="layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<title>客服中心-線上客服</title>
<link  rel='stylesheet' href="<c:url value='/css/websocket/chatStyle.css' />" />
<!-- <script src="/websocket/webjars/sockjs-client/sockjs.min.js"></script> -->
<!-- <script src="/websocket/webjars/stomp-websocket/stomp.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
<script src="<c:url value="/js/websocket/sockjs.min.js"/>"></script>
<script src="<c:url value="/js/websocket/stomp.min.js"/>"></script>

<script type="text/javascript">
let stompClient = null;
let url = "http://" + window.location.host + '/drinkmaster/chatting' ;
let chatId = null ;				// 聊天代號
let to = null ;					// 
let responseArea = null ;		// 聊天訊息顯示區
let inputMessageArea = null ;	// 聊天訊息輸入區
let btnConnect = null ;		
let btnDisconnect = null ;
let promptArea = null ;			// 系統訊息提示區	

let btnSendToChatRoom2 = null ;


window.addEventListener('load', function() {
	btnConnect 		= document.getElementById('btnConnect');
	btnDisconnect 	= document.getElementById('btnDisconnect');
	chatId 			= document.getElementById('chatId');
	responseArea 	= document.getElementById('responseArea');
	promptArea 		= document.getElementById('promptArea');
	inputMessageArea = document.getElementById('inputMessageArea');
	
	btnSendToChatRoom2 = document.getElementById('sendToChatRoom2');
	
	
	
	btnConnect.onclick = function() {
		let chatIdValue = chatId.value;
		if (chatIdValue == null || chatIdValue == "" ) {
			promptArea.innerHTML = "<font size='-1' color='red'>必須先輸入聊天代號才能加入聊天室</font>";
			return;
		} else {
			promptArea.innerHTML = "";
		}
		
		var socket = new SockJS(url);
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {
			setConnected(true);
			inputMessageArea.focus();
			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/messages', function(messageOutput) {
// 				showMessageOutput(JSON.parse(messageOutput.body));
           
             var result = JSON.parse(messageOutput.body);  //設全域變數
            showMessageOutput(''+'(發送訊息時間:'+ result.time+')'+ result.from +' 說 : '+ result.text);   //更改此處
			});
		});
	};
	btnDisconnect.onclick = function() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		setConnected(false);
		chatId.value = "";
		console.log("Disconnected");
		
	};
	
	inputMessageArea.onkeyup = function(){
		if (event.keyCode === 13) {
			let text = inputMessageArea.value;
			if (text.length > 0)  {
				console.log(text.length);
				stompClient.send("/app/chat", {}, JSON.stringify({
					'from' : chatId.value,
					'text' : text
				}));
			}
		}
	}
	
	btnSendToChatRoom2.onclick = function(){
		let text = inputMessageArea.value;
		if (text.length > 0)  {
			console.log(text.length);
			stompClient.send("/app/chat", {}, JSON.stringify({
				'from' : chatId.value,
				'text' : text
			}));
		}
		}
	

	setConnected(false);
	chatId.focus();
}) 
	function setConnected(connected) {
// 		btnConnect = document.getElementById('connect');
		btnDisconnect.disabled = !connected;
		btnConnect.disabled = connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible'
				: 'hidden';
		document.getElementById('responseArea').innerHTML = '';
	}


	function showMessageOutput(messageOutput) {
		let line = "";
		console.log(JSON.stringify(messageOutput));
// 		line += JSON.stringify(messageOutput) + "\n";   //註解掉避免轉成JSON格式字串，改成下列文字
        line += messageOutput + "\n";   
       
        /* 更新聊天訊息顯示區 */
        responseArea.value += "" + line;
		
		
// 		var p = document.createElement('p');
// 		p.style.wordWrap = 'break-word';
// 		p.appendChild(document.createTextNode(messageOutput.from + ": "
// 				+ messageOutput.text + " (" + messageOutput.time + ")"));
// 		response.appendChild(p);
	}
	
</script>
</head>
<body>
<div  id="chat1" class="card border-primary mb-3" style="max-width: 18rem;">
<div align='center'>
 <div class="card-header">飲君子線上客服</div>
<!--     <h2>飲君子聊天室</h2> -->
<div class="card-body text-primary">
    <h5 class="card-title">	聊天名稱：</h5>
    <div>
		<input type="text" id="chatId" placeholder="請輸入名稱：" />
		</div>   
		<div style="height: 30px;" id='promptArea'>&nbsp;</div>

  </div>
</div>
   
	<div>
<!-- 		<div> -->
<!-- 		<input type="text" id="chatId" placeholder="請輸入一個代號：" /> -->
<!-- 		</div> -->
<!--        <div style="height: 30px;" id='promptArea'>&nbsp;</div> -->
		
		
		<div>
			<button id="btnConnect" class="btn btn-outline-success">加入聊天室</button>
			<button id="btnDisconnect" disabled="disabled" class="btn btn-outline-danger" >
				退出聊天室</button>
		</div>
		</div>
		<br />
		<div id="conversationDiv">
			<input type="text" id="inputMessageArea" placeholder="輸入聊天訊息..."  />
			<button id="sendToChatRoom2"  class="btn btn-outline-warning">傳送</button>
			<hr>
			
			</div>
			</div>
			<div id=chat2>
		    <textarea id="responseArea" cols="70" rows="10" readonly></textarea>
		    </div>
		
		


<br/><br/><br/><br/><br/>
</body>
</html>

<jsp:include page="layout/footer.jsp" />