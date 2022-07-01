<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.div1{
 border:1px solid #F0F0F0;
            border-radius:20px;
            padding-left:140px;
            padding-top:20px;
            padding-bottom:20px;
            width:1200px;
            margin:40px;
            margin-bottom:10px;

}

.div2{
  border:1px solid #F0F0F0;
            border-radius:20px;
            padding-top:20px;
            padding-left:140px;
            padding-right:30px;
            padding-bottom:20px;
            width:1200px;
            margin-left:40px;
            margin-bottom:20px;
            margin-top:5px;
            
}

	.fixed1	{
				position:fixed;
				width:400px;				
				bottom:120px;
				right:0;
				}
				
				
 #qrcode{
 text-align:center;
 padding:auto;
 }
 
 
</style>
</head>
<body>
<div class="div1">
    <h4>常見問題 FAQ</h4>
    <div class="row justify-content-right">
<div class="col-10">
            <ul class="list-group">
 
  <li class="list-group-item list-group-item-dark">Q1 : 想變更或取消訂單</li>
  <li class="list-group-item list-group-item-light">門市尚未接單，可直接至訂單明細取消訂單， 門市已接單，請直接撥打電話給門市，才能即時變更訂單</li>
  <li class="list-group-item list-group-item-dark">Q2 : 有綁定信用卡，但門市無法使用</li>
  <li class="list-group-item list-group-item-light">很抱歉，各門市有不同的付款方式設定。若您有信用卡需求，歡迎填寫意見回饋，我們會為您向門市爭取</li>
  <li class="list-group-item list-group-item-dark">Q3 : 無法使用電子載具</li>
  <li class="list-group-item list-group-item-light">很抱歉，各門市有不同的開立發票設定。若您有電子載具需求，歡迎填寫意見回饋，飲君子會為您向門市爭取</li>
  <li class="list-group-item list-group-item-dark">Q4 :收到的商品有誤</li>
  <li class="list-group-item list-group-item-light">如有任何商品內容的錯誤，最即時的方式請直接聯絡門市，也可在訂單下評價或給予回饋</li>
  <li class="list-group-item list-group-item-dark">Q5 :訂單有符合活動，但沒收到折價券</li>
  <li class="list-group-item list-group-item-light">請確認該筆訂單的狀態是否為完成狀態。 非完成狀態時，可聯絡門市進行訂單狀態變更。 完成狀態時，請聯絡客服</li>
  <li class="list-group-item list-group-item-dark">Q6 : 點擊按鈕無反應</li>
  <li class="list-group-item list-group-item-light">1. 請確認是否使用 Chrome, Safari, Firefox 瀏覽器，以及是否為正常狀態 (非私密瀏覽、非無痕視窗)
2. 請確認網路訊號狀態，是否有設定任何阻擋
3. 請確認是否有關閉cookie存取的設定
4. 可嘗試重新整理頁面</li>
  
</ul>
</div>
</div>
</div>


<div class="div2">
 <div class="row justify-content-right">
 <h4>官方客服</h4>
 </div>
 <div class="row justify-content-left">
<div class="col-7">
  <img src="<c:url value="/images/QRCODE.png"/>" alt="QRCODE圖片顯示有誤" title="LINE QRCODE" width="200">
  <br/><br/>
  ID : @198qvjif
  <br/><br/>
1. 手機登入LINE，點選「加入好友」<br/>
2. 掃描上方行動條碼或輸入ID「@198qvjif」<br/>
3. 將飲君子加入好友獲得更即時的服務<br/>
<br/>
<!-- <button class="btn btn-lg btn-success">快登入LINE加我好友</button> -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#linebtn">
  快登入LINE加入好友
</button>

<!-- Modal -->
<div class="modal fade" id="linebtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">掃描行動條碼即可將官方帳號加入好友</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="qrcode">
        請先點選LINE程式搜尋欄位旁的掃描圖示，再掃描此行動條碼。
        <img src="<c:url value="/images/QRCODE.png"/>" alt="QRCODE圖片顯示有誤" title="LINE QRCODE" width="250" id="qrcode">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉視窗</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>


</div>
</div>
</div>

<div class="fixed1">
			<span style="background-color:#9999CC;"></span><br><iframe width="350" height="500" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/1db68bad-fcf7-404b-9dea-6dc6b52894b7"></iframe><br>
			<span style="background-color:#9999CC;"></span>
		</div>
</body>
</html>

<jsp:include page="layout/footer.jsp" />