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

	$('#DivUserPage').hide();
	$('#loadingDiv').show();
	$('.loadingDivClass').show();
	$('#checkboxes').html("");
	$('#selResidence').html("");
	
	
	
     $.ajax( {
			url : 'loadSkills',
			type: "POST",
			dataType: "json",
			success : function(data) {
				var jsonData = JSON.parse(JSON.stringify(data));
				var jsonDataLength = jsonData.length;
				var html = '';
				
				for(var i=0; i<jsonDataLength; i++)
				{
					var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
			    	//alert(strJSON);
					html += '<span style="display: block"><input type="checkbox" id="' + strJSON.ID + '" value="' + strJSON.ID + '" >' +
							'<label for="' + strJSON.ID + '">' + strJSON.Skill + '</label></span>';
					
				}
				
				$('#checkboxes').append(html);
				
				var x = new Date().getFullYear();
				for(var i=0; i<100; i++)
				{
					var test1 = x - i;
					var test = '<option value="' + test1 + '">' + test1 + '</option>';
					$('#selYear').append(test);
				}
				
				
				$.ajax( {
					url : 'loadResidence',
					type: "POST",
					dataType: "json",
					success : function(data) {
						var jsonData = JSON.parse(JSON.stringify(data));
						var jsonDataLength = jsonData.length;
						var html = '';
						
						for(var i=0; i<jsonDataLength; i++)
						{
							var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
					    	//alert(strJSON);
					    	html += '<option value="' + strJSON.ID + '">' + strJSON.Description + '</option>';
					    	
						}
						
						$('#selResidence').append(html);
						
						var strID = window.location.href.substring(window.location.href.indexOf("?")+4, window.location.href.indexOf("&"));
						
						$.ajax( {
							url : 'EditUserIndividual',
							type: "POST",
							dataType: "json",
							data: ({
								strID: strID
							}),
							success : function(data) {
								var jsonData = JSON.parse(JSON.stringify(data));
								var jsonDataLength = jsonData.length;
								var html = '';
								
								for(var i=0; i<jsonDataLength; i++)
								{
									var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
									
									$('#FName').val(strJSON.FName);
									$('#LName').val(strJSON.LName);
									$('#Name').val(strJSON.Name);
									$('#Address').val(strJSON.Address);
									$('#City').val(strJSON.City);
									$('#selResidence').val(strJSON.Residence);
									
									$('#Contact').val(strJSON.Contact);
									$('#selMonth').val(strJSON.Birthdate.substring(5, 7));
									$('#selDay').val(strJSON.Birthdate.substring(8, 10))
									$('#selYear').val(strJSON.Birthdate.substring(0, 4));
									$('#test2').attr('src', strJSON.Pic);
									$('#selGender').val(strJSON.Gender);
									$('#PicID').val(strJSON.Pic);
									//alert(strJSON.Skills);
									var strTest = strJSON.Skills.split(",");
									
									//alert(strTest.length);
									
									for(var i=0; i<strTest.length; i++)
									{
										$("#checkboxes input[type='checkbox']").each(function()
												{
													
														if($(this).val() == strTest[i].trim())
														{
															$(this).prop("checked", true);
														}
													
													
													
												});
									}
									
									
							    	//alert(strJSON);
							    	//html += '<option value="' + strJSON.ID + '">' + strJSON.Description + '</option>';
							    	
								}
								
								//$('#selResidence').append(html);
								
							},
							complete : function ()
							{
								$('.loadingDivClass').hide();
								$('#loadingDiv').hide(500);
								$('#DivUserPage').show();
							},
				     		error : function(xhr, status, error)
				     		{
				     			$('#text').text("Error.");
				     			on();
				     		}
						});
						
					},
					complete : function ()
					{
						
					},
		     		error : function(xhr, status, error)
		     		{
		     			$('#text').text("Error.");
		     			on();
		     		}
				});
				
				
				
				
				
				
				
				
				
				
			},
			complete : function ()
			{
				
			},
     		error : function(xhr, status, error)
     		{
     			$('#text').text("Error.");
     			on();
     		}
		});
			
	$("#test").change(function()
			{
				readTest(this);
			});
	   
	 
});



var strPic = '';
var strFName = '';
var strLName = '';
var strName = '';
var strAddress = '';
var strResidence = '';
var strCity = '';
var strEmailAdd = '';
var strPassword = '';
var strContact = '';
var strBirthdate = '';
var strSkills = '';
var strGender = '';
var iSkillCount = 0;

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

function SAVE()
{
	
	iSkillCount = 0;
	strSkills = "";
	$("#checkboxes input[type='checkbox']:checked").each(function()
			{
				//alert($(this).val());
				
				//strServices = $(this).val() + "," + strServices;
				
				
				if(iSkillCount > 5)
				{
		 			strMsg = "Please select 5 skills only.";
				}
		 		else
		 		{
		 			//alert($(this).val());
		 			
					//strServices = $(this).val() + "," + strServices;
					strSkills = strSkills + $(this).val() + "|";
					
					iSkillCount += 1;
		 		}
			});
	
	var strID = window.location.href.substring(window.location.href.indexOf("?")+4, window.location.href.indexOf("&"));
	
	strFName = $('#FName').val();
	strLName = $('#LName').val();
	strName = $('#Name').val();
	strAddress = $('#Address').val();
	strResidence = $('#selResidence').val();
	strCity = $('#City').val();
	strPassword = $('#Password').val();
	strContact = $('#Contact').val();
	strBirthdate = $('#selMonth').val() + "/" + $('#selDay').val() + "/" + $('#selYear').val();
	strGender = $('#selGender').val();
	
	var strMsg = "";
	
	if(iSkillCount > 5)
	{
		strMsg = "Please select 5 skills only.";
	}
	else if(strPic == '')
	{
		strPic = $('#PicID').val();
	}
	else if(strFName == '')
	{
		strMsg = "First name is required.";
	}
	else if(strLName == '')
	{
		strMsg = "Last name is required.";
	}
	else if(strName == '')
	{
		strMsg = "Nick name is required.";
	}
	else if(strAddress == '')
	{
		strMsg = "Address is required.";
	}
	else if(strResidence == '')
	{
		strMsg = "Residence is required.";
	}
	else if(strCity == '')
	{
		strMsg = "City is required.";
	}
	else if(strContact == '')
	{
		strMsg = "Contact is required.";
	}
	else if(strGender == '')
	{
		strMsg = "Please select your Gender.";
	}
	else if(strSkills == '')
	{
		strMsg = "Please select at least 1 skill.";
	}
	else
	{
		$("#buttonUpdate").attr("disabled", true);
		$.ajax({
			url: "UpdateUsersIndividual",
			type: "POST",
			data: ({
				strFName: strFName,
				strLName: strLName,
				strName : strName,
				strAddress : strAddress,
				strResidence : strResidence,
				strCity: strCity,
				strContact: strContact,
				strBirthdate: strBirthdate,
				strPic: strPic,
				strSkills: strSkills,
				strGender: strGender,
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

function readTest(test)
{
	if(test.files && test.files[0])
	{
		var reader = new FileReader();
		
// 		reader.onload = function (e)
// 		{
// 			$("#test2").attr("src" , e.target.result);
// 			//$(".SpanUserPageLine").text(e.target.result);
// 			strPic = e.target.result;
// 		}
		
		reader.onload = function (e)
		{
			//$("#test2").attr("src" , e.target.result);
			//$(".SpanUserPageLine").text(e.target.result);
			//strPic = e.target.result;
			//alert(strPic.length);
			
			const dataURL = e.target.result;
			
			if(dataURL.length > 500000)
			{
				$('#text').text("Photo came from camera is not yet supported as of the moment. Please upload photo instead.");
				on();
			}
			else
			{
				strPic = dataURL;
				$("#test2").attr("src" , dataURL);
			}
		}
		
		reader.readAsDataURL(test.files[0]);
		
		//alert(test.files[0].type);
	}
}

function logout()
{
	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
	var xx = window.location.href.substring(window.location.href.indexOf("?") + 1)
	window.location = x + "/Logout?" + xx;
}

function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}
</script>

</head>

<body>
<div id="overlay" onclick="off()">
  <div id="text">Overlay Text</div>
</div>
<input type="hidden" id="PicID" name="PicID" value="">
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
				 	<a>My Profile</a>
				 	<a id="ChangePassword">Change Password</a>
				 	<a id="Logout" style="position: absolute; bottom: 100px;">Logout</a>
				  </div>
				</div>
				<div id="openNav" onclick="openNav()" style="font-size:30px; cursor:pointer; padding-top: 15px; padding-left: 25px">&#9776;</div>
			</div>
			
		</div>
        <div class="card2">
			<div id="DivUserPage" class="DivUserPage">
					<div class="DivUserPagePallete">
					<div class="DivUserPageSecond">
					
					
						<div class="DivUserPageSpace divFloatLeft divPic">
							<div class="DivUserPageLine divPicSpan">
								<span class="SpanUserPageLine">
									<img id="test2" class="imgCard" src="#" />
									<input type="button" class="imgCardButton" value="Choose photo" onClick="document.getElementById('test').click();" />
								</span>
								<span><input type="file" id="test" style="display: none" accept="image/*" /></span>
							</div>
						</div>
				
						<div class="DivUserPageSpace divFloatLeft">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">First Name</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="FName" maxlength="50" size="50"></span>
							</div>
							
						</div>
						
						<div class="DivUserPageSpace divFloatRight">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Last Name</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="LName" maxlength="50" size="50"></span>
							</div>
						
						</div>
				
						<div class="DivUserPageSpace divFloatLeft">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Nickname</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="Name" maxlength="15" size="15"></span>
							</div>
						
						</div>
				
						<div class="DivUserPageSpace divFloatRight">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Address</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="Address" maxlength="150" size="150"></span>
							</div>
						
						</div>
						
						<div class="DivUserPageSpace divFloatLeft">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">City</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="City" maxlength="50" size="50"></span>
							</div>
						
						</div>
						
						<div class="DivUserPageSpace divFloatRight">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Region</span>
							</div>
							<div class="DivUserPageLine">
								<span><select id="selResidence"></select></span>
							</div>
						
						</div>
						
						<div class="DivUserPageSpace divFloatLeft">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Contact</span>
							</div>
							<div class="DivUserPageLine">
								<span><input type="text" id="Contact" maxlength="15" size="15"></span>
							</div>
						
						</div>
						
						<div class="DivUserPageSpace divFloatRight">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Birthdate</span>
							</div>
							<div class="DivUserPageLine">
								<span>
									<select id="selMonth">
										<option value="01">Jan</option>
										<option value="02">Feb</option>
										<option value="03">Mar</option>
										<option value="04">Apr</option>
										<option value="05">May</option>
										<option value="06">Jun</option>
										<option value="07">Jul</option>
										<option value="08">Aug</option>
										<option value="09">Sep</option>
										<option value="10">Oct</option>
										<option value="11">Nov</option>
										<option value="12">Dec</option>
									</select>
									<select id="selDay">
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									<select id="selYear">
									</select>
									
								</span>
							</div>
						</div>
						
						<div class="DivUserPageSpace divFloatLeft">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Gender</span>
							</div>
							<div class="DivUserPageLine">
								<span>
									<select id="selGender">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</span>
							</div>
						</div>
						
						<div class="DivUserPageSpace divFloatRight">
							<div class="DivUserPageLine">
								<span class="SpanUserPageLine">Skills</span>
							</div>
							<div class="DivUserPageLine">
								<span><div id="checkboxes">
									    </div></span>
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

