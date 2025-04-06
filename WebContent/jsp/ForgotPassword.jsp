<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%--  <script src="<c:url value="/resources/scripts/jquery-3.4.1.min.js" />" ></script> --%>
<%--  <link rel="stylesheet" href="<c:url value="/resources/css/UserPageLogin.css" />" > --%>

<link rel="stylesheet" href="css/UserPageLogin.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>

$(document).ready(function(){
	
	$('.loadingDivClass').hide();
	$('#loadingDiv').hide(500);
	$('#DivUserPage').show();
	
});



var strPic = '';
var strFName = '';
var strLName = '';
var strName = '';
var strAddress = '';
var strResidence = '';
var strEmailAdd = '';
var strPassword = '';
var strContact = '';
var strBirthdate = '';
var strSkills = '';
var strGender = '';

function closeAddUser2() {
	document.getElementById("DivLoginMain").style.display = "block";
	
	document.getElementById("resultDiv").style.position = "unset";
	document.getElementById("resultDivClass").style.position = "unset";
	
	$('.resultDivClass').html("");
	}
	
function openAddUser2() {

	  document.getElementById("DivUserPage").style.display = "block";
	  document.getElementById("DivUserPage").style.opacity = "1";
	}
	
function closeAddUser() {

	  document.getElementById("DivUserPageMain").style.display = "none";
	  document.getElementById("DivUserPageMain").style.opacity = "0";
	//  document.getElementById("DivUserPageMain").style.position = "absolute";
	 // document.getElementById("DivUserPageMain").style.height = "0";
	  openAddUser2();
	  //alert('te1st');
	  
	  
	  
	}
	
function openAddUser() {

	  document.getElementById("DivUserPageMain").style.display = "block";
	  document.getElementById("DivUserPageMain").style.opacity = "1";
	 // document.getElementById("DivUserPageMain").style.position = "relative";
	  
	}

function SAVE()
{
	strEmailAdd = $('#EmailAdd').val();
	
	if(!checkEmail(strEmailAdd))
	{
		$('#text').text("Invalid Email Address.");
		on();
	}
	else
	{
		$('#DivUserPage').hide();
		$('#loadingDiv').show();
		$('.loadingDivClass').show();
		$("#button").attr("disabled", true);
		$.ajax({
			url: "ResetPassword",
			type: "POST",
			data: ({
				strEmailAdd: strEmailAdd
			}),
			success: function(response)
			{
				$("#button").attr("disabled", false);
				$('#text').text(response);
				on();
			},
			complete : function ()
			{
				$("#button").attr("disabled", false);
				$('.loadingDivClass').hide();
				$('#loadingDiv').hide(500);
				$('#DivUserPage').show();
			},
			error: function(xhr, status, error)
			{
				$("#button").attr("disabled", false);
				$('#text').text("Error.");
				on();
			}
			
		});	
	}
}


function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}

function checkEmail(pID)
{
    const checkTest = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return checkTest.test(String(pID).toLowerCase());
}
</script>

</head>

<body>
<div id="overlay" onclick="off()">
  <div id="text">Overlay Text</div>
</div>
<div id="loadingDiv" style="position: absolute;">
	<div class="loadingDivClass">
		<div style="text-align: center;">
			<img style="width: 125px" class="imgIconLogo" src="../waveindex/resources/img/logofinal.png">
		</div>
		<div style="text-align: center;">
			<img style="width: 125px" class="imgIconLogo" src="../waveindex/resources/img/loading.gif">
		</div>
		<div>
<!-- 			Loading. Please wait. -->
		</div>
    </div>
</div>


<div id="DivUserPageMain" class="DivUserPageMain" style="height: 0!important;">
</div>


<div id="DivUserPage" class="DivUserPage">
<a href="javascript:void(0)" class="closebtn" onclick="closeAddUser2()">&times;</a>
	<div class="DivUserPagePallete">
	<div class="DivUserPageSecond">
	
		<div class="DivUserPageLine DivForgot" style="margin-left: 0px">
			<span style="margin: 15px">Enter your registered Email Address</span>
		</div>
		
		<div class="DivUserPageLine" style="margin-left: 0px">
			<span style="margin: 15px"><input type="text" id="EmailAdd" maxlength="50" size="50"></span>
		</div>
		
		<div class="DivUserPageLineButton" style="margin-top: 1px!important">
			<button id="button" onclick="SAVE()" class="button buttonSave">RESET</button>
		</div>
		
	</div>
	
	</div>
	
	
</div>


</body>
</html>

