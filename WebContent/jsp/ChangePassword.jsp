<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- <script src="<c:url value="/resources/scripts/jquery-3.4.1.min.js" />" ></script> --%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/UserPage.css" />" > --%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/Animation.css" />" > --%>

<%-- <link rel="stylesheet" href="<c:url value="/resources/css/MainIndividual.css" />" > --%>


<link rel="stylesheet" href="css/UserPageLogin.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script>

$(document).ready(function(){
	
	$('#DivUserPage').show();
	$('#loadingDiv').hide();
	$('.loadingDivClass').hide();
	 
	$(document).on('click', '#Home', function (event)
	{
		home();
	});

	$(document).on('click', '#MyApplication', function (event)
	{
		myApplication();
	});

	$(document).on('click', '#MyProfile', function (event)
	{
		myProfile();
	});

	$(document).on('click', '#ChangePassword', function (event)
	{
		updatePassword();
	});
	
	$(document).on('click', '#Logout', function (event)
	{
		logout();
	});
});



var strCurrentPassword = '';
var strNewPassword = '';

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
	
	var strID = window.location.href.substring(window.location.href.indexOf("?")+4, window.location.href.indexOf("&"));
	
	strCurrentPassword = $('#CPassword').val();
	strNewPassword = $('#NPassword').val();
	
	var strMsg = "";
	
	if(strCurrentPassword == '')
	{
		strMsg = "Current password is required.";
	}
	else if(strNewPassword == '')
	{
		strMsg = "New password is required.";
	}
	else
	{
		$("#buttonUpdate").attr("disabled", true);
		$.ajax({
			url: "UpdateUsersPassword",
			type: "POST",
			data: ({
				strCurrentPassword: strCurrentPassword,
				strNewPassword: strNewPassword,
				strID: strID
			}),
			success: function(response)
			{
				$("#buttonUpdate").attr("disabled", false);
				$('#text').text(response);
				on();
				
			},
			error: function(xhr, status, error)
			{
				$("#buttonUpdate").attr("disabled", false);
				$('#text').text("Error.");
				on();
			}
			
		});	
	}
	
	if(strMsg != '')
	{
		$('#text').text(strMsg);
		on();
	}
}

function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}

function openNav()
	{
		if(screen.width >= 768)
		{
			document.getElementById("mySidenav").style.width = "25%";
		}
		else
		{
			document.getElementById("mySidenav").style.width = "50%";
		}
}

	
function closeNav()
{
  document.getElementById("mySidenav").style.width = "0";
}

function home()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/Dashboard?" + xx;
}

function myApplication()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/MyApplication?" + xx;
}

function myProfile()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/UserPageChange?" + xx;
}

function updatePassword()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/UpdatePassword?" + xx;
}

function PasswordHint(value)
{
	var strPassword;
	
	if(value == '1')
	{
		strPassword = document.getElementById('CPassword');
	}
	else if(value == '2')
	{
		strPassword = document.getElementById('NPassword');
	}
	

	if(strPassword.type === "password")
	{
		strPassword.type = "text";
	}
	else
	{
		strPassword.type = "password";
	}
}

function logout()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/Logout?" + xx;
}
</script>

</head>

<body>
<div id="overlay" onclick="off()">
  <div id="text">Overlay Text</div>
</div>

<div id="loadingDiv">
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
	<div>
		<div class="headerClass">
			<div class="leftHeaderClass">
				<div id="mySidenav" class="sidenav">
				  <a id="closeNav" href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				  <div id="mySidenavValue">
				  	<a id="Home">Home</a>
				  	<a id="MyApplication">My Application</a>
				 	<a id="MyProfile">My Profile</a>
				 	<a>Change Password</a>
				 	<a id="Logout" style="position: absolute; bottom: 100px;">Logout</a>
				  </div>
				</div>
				<div id="openNav" onclick="openNav()" style="font-size:30px; cursor:pointer; padding-top: 15px; padding-left: 25px">&#9776;</div>
			</div>
			<div class="searchNav1">
		    	<div id="searchTextDiv" style="display: none">SEARCH</div>
			</div>
			<div id="searchDiv" class="searchNav">
			    <div class="searchResultDiv">
			    	<span class="searchResultLabel">Test:</span>
					<div class="searchResultValue dropDownValue" >
					    <div id="checkboxes">
					    </div>
			  		</div>
				</div>
				<div class="searchResultDiv">
			    	<span class="searchResultLabel">Test:</span>
					<span class="searchResultValue">
						<select id="selectSearch" name="uname">
							<option value="--SELECT--">--SELECT--</option>
						</select>
					</span>
				</div>
				<div class="searchResultDiv">
			    	<span class="searchResultLabel">Test:</span>
					<span class="searchResultValue">
						<input class="searchText" type="text" name="uname">
					</span>
				</div>
				<div class="searchResultDiv">
					<div class="searchButton buttonStyle">
						<span>SEARCH</span>
					</div>
				</div>			
			</div>
		</div>
        <div class="card3">
        	
			<div id="DivUserPage" class="DivUserPage" style="min-height: 0px">
				<div class="DivUserPagePallete">
				<div class="DivUserPageSecond">
				
				
			
					<div class="DivUserPageSpace divFloatLeft">
						<div class="DivUserPageLine">
							<span>
								<input type="password" id="CPassword" maxlength="15" size="15" placeholder="Current password">
							</span>
						</div>
						<div class="DivUserPageLine">
							<span>
								<input type="checkbox" id="Current" class="hint" onclick="PasswordHint('1')">
								<label class="hint" for="Current">Show Password</label>
							</span>
						</div>
					</div>
					
					<div class="DivUserPageSpace divFloatRight">
						<div class="DivUserPageLine">
							<span>
								<input type="password" id="NPassword" maxlength="15" size="15" placeholder="New password">
							</span>
						</div>
						<div class="DivUserPageLine">
							<span>
								<input type="checkbox" id="New" class="hint" onclick="PasswordHint('2')">
								<label class="hint" for="New">Show Password</label>
							</span>
						</div>
					</div>
			
					<div class="DivUserPageLineButtonUpdate">
						<button id="buttonUpdate" onclick="SAVE()" class="button">SAVE</button>
					</div>
					
				</div>
				
				</div>
				
				
			</div>
        </div>
	</div> 
	

</body>
</html>

