<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dummy Data Example</title>
<%--     <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" > --%>
    <link rel="stylesheet" href="<c:url value="/resources/css/inventory.css" />" >
    <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
<%-- 	<script src="<c:url value="/resources/js/jqInventory.js" />" ></script> --%>
</head>
<body>
    
    <div id="DivUserPageMain" class="DivUserPageMain fade">
	</div>
	
	<div id="DivUserPage" class="DivUserPage fade" style="min-height: 0px">
		<div class="DivUserPagePallete">
			<div class="DivUserPageSecond">
				<div class="DivUserPageSpace divFloatLeft divPic">
					<div class="DivUserPageLine divPicSpan">
						<span class="SpanUserPageLine">
							<img id="test2" class="imgCard" src="../waveindex/resources/img/selectphoto.png" />
							<input type="button" class="imgCardButton" value="Choose photo" onClick="document.getElementById('test').click();" />
						</span>
						<span><input type="file" id="test" style="display: none" accept="image/*" /></span>
					</div>
				</div>

				<div class="DivUserPageSpace divFloatLeft">
					<div class="DivUserPageLine">
						<span class="SpanUserPageLine">Item Name:</span>
					</div>
					<div class="DivUserPageLine">
						<span><input type="text" id="name" maxlength="50" size="50" placeholder="Item Name"></span>
					</div>
				</div>
<!-- 		Should be the ftCurrentStock and ftAvailableStock + value input here -->
				<div class="DivUserPageSpace divFloatRight">
					<div class="DivUserPageLine">
						<span class="SpanUserPageLine">Stock</span>
					</div>
					<div class="DivUserPageLine">
						<span><input type="text" id="FName" maxlength="50" size="50" placeholder="Stock"></span>
					</div>
				</div>
		
<!-- 		Should be price per stock -->
				<div class="DivUserPageSpace divFloatLeft">
					<div class="DivUserPageLine">
						<span class="SpanUserPageLine">Price</span>
					</div>
					<div class="DivUserPageLine">
						<span><input type="text" id="FName" maxlength="50" size="50" placeholder="Price"></span>
					</div>
				</div>
		
<!-- 		Should be price per stock int -->
				<div class="DivUserPageSpace divFloatRight">
					<div class="DivUserPageLine">
						<span class="SpanUserPageLine">Interest</span>
					</div>
					<div class="DivUserPageLine">
						<span><input type="text" id="LName" maxlength="50" size="50" placeholder="Interest"></span>
					</div>
				</div>
				<div class="DivUserPageLineButton2">
					<button id="buttonUpdate" onclick="SAVE()">SAVE</button>
					<button id="buttonCancel">CANCEL</button>
				</div>
					
			</div>
		</div>	
	</div>
</body>
</html>
