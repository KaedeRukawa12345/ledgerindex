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
	
	$('#DivUserPage').hide();
	$('#loadingDiv').show();
	$('.loadingDivClass').show();
	$('#checkboxes').html("");
	$('#selResidence').html("");
	
	
	$('.buttonSave').prop('disabled', true);
	$('.buttonSave').css('cursor', 'default');
	
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
				
				var dDate = new Date();
				var strMonth = dDate.getMonth() + 1;
				var strDay = dDate.getDate();
				
				if(strMonth.toString().length == 1)
				{
					strMonth = "0" + strMonth;
				}
				
				if(strDay.toString().length == 1)
				{
					strDay = "0" + strDay;
				}
				
				$('#selMonth').val(strMonth);
				$('#selDay').val(strDay);
				$('#selYear').val(dDate.getFullYear());
				
				$.ajax( {
					url : 'loadResidence',
					type: "POST",
					dataType: "json",
					success : function(data) {
						var jsonData = JSON.parse(JSON.stringify(data));
						var jsonDataLength = jsonData.length;
						var html = '<option value="-1">SELECT</option>';
						
						for(var i=0; i<jsonDataLength; i++)
						{
							var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
					    	//alert(strJSON);
					    	html += '<option value="' + strJSON.ID + '">' + strJSON.Description + '</option>';
					    	
						}
						
						$('#selResidence').append(html);
						
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
	strSkills = "";
	iSkillCount = 0;
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
	
	
	
	strFName = $('#FName').val();
	strLName = $('#LName').val();
	strName = $('#Name').val();
	strAddress = $('#Address').val();
	strResidence = $('#selResidence').val();
	strCity = $('#City').val();
	strEmailAdd = $('#EmailAdd').val();
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
		strMsg = "Please upload your picture.";
	}
	else if(strEmailAdd == '')
	{
		strMsg = "Email Address is required.";
	}
	else if(strPassword == '')
	{
		strMsg = "Password is required.";
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
	else if((strResidence == '') || (strResidence == '-1'))
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
	else if((strGender == '') || (strGender == '-1'))
	{
		strMsg = "Please select your Gender.";
	}
	else if(strSkills == '')
	{
		strMsg = "Please select at least 1 skill.";
	}
	else if(!checkEmail(strEmailAdd))
	{
		strMsg = "Invalid Email Address.";
	}
	else
	{
		$('#DivUserPage').hide();
		$('#loadingDiv').show();
		$('.loadingDivClass').show();
		
		$("#buttonUpdate").attr("disabled", true);
		//alert(strFName);
		$.ajax({
			url: "SaveUsers",
			type: "POST",
			data: ({
				strFName: strFName,
				strLName: strLName,
				strName : strName,
				strAddress : strAddress,
				strResidence : strResidence,
				strCity: strCity,
				strEmailAdd: strEmailAdd,
				strPassword: strPassword,
				strContact: strContact,
				strBirthdate: strBirthdate,
				strPic: strPic,
				strSkills: strSkills,
				strGender: strGender
			}),
			success: function(response)
			{
				$("#buttonUpdate").attr("disabled", false);
				$('#text').text(response);
				on();
			},
			complete : function ()
			{
				$("#buttonUpdate").attr("disabled", false);
				$('.loadingDivClass').hide();
				$('#loadingDiv').hide(500);
				$('#DivUserPage').show();
			},
			error: function(xhr, status, error)
			{
				$("#buttonUpdate").attr("disabled", false);
				$('#text').text("Error.");
				//alert(xhr.responseText);
				//alert(status);
				//alert(error);
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

function checkEmail(pID)
{
    const checkTest = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return checkTest.test(String(pID).toLowerCase());
}

function readAgain()
{
	//alert(strPic);
	if(strPic != '')
	{
		strPic = '';
		
		const imgElement = document.getElementById('test2');
		const canvas = document.createElement('canvas');
		const ctx = canvas.getContext('2d');
// 		const ctx = canvas.getContext('3d');

		canvas.width = imgElement.width;
		canvas.height = imgElement.height;
		ctx.drawImage(imgElement, 0, 0, imgElement.width, imgElement.height);

		canvas.toBlob(function (blob) {
		    const reader = new FileReader();
		    reader.onload = function () {
		        const base64Data = reader.result.split(',')[1];
		        // Send the compressed base64 data via AJAX
		        strPic = base64Data;
		        //$("#test3").attr("src" , "data:image/jpg;base64," + strPic);
		        //alert("strPic: " + strPic);
		    };
		    reader.readAsDataURL(blob);
		}, 'image/jpeg', 0.9); //0.8
	}	
	
}
function readTest(test)
{
	if(test.files && test.files[0])
	{
		var reader = new FileReader();
		
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
		
		
		
// var reader = new FileReader();
		
// 		reader.onload = function (e)
// 		{
// 			//$("#test2").attr("src" , e.target.result);
// 			//$(".SpanUserPageLine").text(e.target.result);
// 			//strPic = e.target.result;
// 			//alert("strPic 1: " + strPic);
// 			const byteArray = new Uint8Array(e.target.result);
			
// 			const blob = new Blob([byteArray], {type: "image/png"});
			
// 			const reader2 = new FileReader();
			
// 			reader2.onload = function () {
// 				const dataURL = reader2.result;
			
				
// 				//alert("strPic 2: " + strPic);
// 				//alert(strPic.length);
// 				alert(dataURL.length);
// 				if(dataURL.length > 10000)
// 				{
// 					$('#text').text("Photo came from camera is not yet supported as of the moment. Please upload photo instead.");
// 					on();
// 				}
// 				else
// 				{
// 					strPic = dataURL;
// 					$("#test2").attr("src" , dataURL);
// 				}
				
				
// 				//readAgain();
				
				
				
// 			};
			
// 			reader2.readAsDataURL(blob);
// 		}
		
// 		reader.readAsArrayBuffer(test.files[0]);
		
	
		
	}
}

function resizeImage(file, maxWidth, maxHeight, quality) {
    return new Promise((resolve, reject) => {
        const img = new Image();

        img.onload = () => {
            const canvas = document.createElement('canvas');
            const ctx = canvas.getContext('2d');
            let width = img.width;
            let height = img.height;

            if (width > maxWidth || height > maxHeight) {
                const aspectRatio = width / height;
                if (aspectRatio > 1) {
                    width = maxWidth;
                    height = width / aspectRatio;
                } else {
                    height = maxHeight;
                    width = height * aspectRatio;
                }
            }

            canvas.width = width;
            canvas.height = height;

            ctx.drawImage(img, 0, 0, width, height);

            canvas.toBlob((blob) => {
                resolve(blob);
            }, 'image/jpeg', quality); // Adjust format and quality as needed
        };

        img.src = URL.createObjectURL(file);
    });
}


function PasswordHint()
{
	var strPassword = document.getElementById('Password');

	if(strPassword.type === "password")
	{
		strPassword.type = "text";
	}
	else
	{
		strPassword.type = "password";
	}
}

function CheckedAgree()
{
	if($('#agree').prop('checked'))
	{
		$('.buttonSave').prop('disabled', false);
		$('.buttonSave').css('cursor', 'pointer');
	}
	else
	{
		$('.buttonSave').prop('disabled', true);
		$('.buttonSave').css('cursor', 'default');
	}
}

function CheckedAgree()
{
	if($('#agree').prop('checked'))
	{
		$('.buttonSave').prop('disabled', false);
		$('.buttonSave').css('cursor', 'pointer');
	}
	else
	{
		$('.buttonSave').prop('disabled', true);
		$('.buttonSave').css('cursor', 'default');
	}
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
				<span class="SpanUserPageLine">Email Address</span>
			</div>
			<div class="DivUserPageLine">
				<span><input type="text" id="EmailAdd" maxlength="50" size="50"></span>
			</div>
		
			<div class="DivUserPageLine" style="opacity: 0">
				<span>
					<label class="hint" for="New">Clear</label>
				</span>
			</div>
		</div>
		
		<div class="DivUserPageSpace divFloatRight">
			<div class="DivUserPageLine">
				<span class="SpanUserPageLine">New Password</span>
			</div>
			<div class="DivUserPageLine">
				<span>
					<input type="password" id="Password" maxlength="15" size="15">
				</span>
			</div>
			<div class="DivUserPageLine">
				<span>
					<input type="checkbox" id="New" class="hint" onclick="PasswordHint()">
					<label class="hint" for="New">Show Password</label>
				</span>
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
						<option value="-1">SELECT</option>
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
		
		<div class="DivUserPageSpace divFloatLeft">
			<div class="DivUserPageLine">
				<span>
					<input type="checkbox" id="agree" class="hint" onclick="CheckedAgree()">
					<span class="hint">I have read and agree to the </span><a class="hint" target="_blank" href="PrivacyPolicy">Privacy policy</a><span class="hint"> and </span><a class="hint" target="_blank" href="TermsConditions">Terms and Conditions.</a>
				</span>
			</div>
		
		</div>
		
		<div class="DivUserPageLineButton">
			<button id="buttonUpdate" onclick="SAVE()" class="button buttonSave">SAVE</button>
		</div>
		
	</div>
	
	</div>
	
	
</div>


</body>
</html>

