$(document).ready(function(){
	
	 
   


// 	setInterval(fadeInSplash, 1000); //4
// 	setInterval(fadeInSplash2, 1000); //5
//	$('#loadingDiv1').hide();
//	$('.loadingDivClass1').hide();
//	
//	
//	$("#callWebService")
//	
//	$("#NewAccount").click(function(){
//		$("#NewAccount").attr("disabled", true);
//		$.ajax({
//			url: "UserPage",
//			type: "GET",
//			success: function(data)
//			{
//				document.getElementById("DivLoginMain").style.display = "none";
//				document.getElementById("resultDiv").style.position = "fixed";
//				document.getElementById("resultDivClass").style.position = "fixed";
//				$("#NewAccount").attr("disabled", false);
//				
//				$('.resultDivClass').html(data)
//			},
//			error: function(xhr, status, error)
//			{
//				$("#NewAccount").attr("disabled", false);
//				$('#text').text("Error.");
//				on();
//			}	
//		});
//	});
//	
//	$("#btnAboutUs").click(function(){
//		$.ajax({
//			url: "AboutUsPage",
//			type: "GET",
//			success: function(data)
//			{
//				document.getElementById("DivLoginMain").style.display = "none";
//				document.getElementById("resultDiv").style.position = "fixed";
//				document.getElementById("resultDivClass").style.position = "fixed";
//				
//				$('.resultDivClass').html(data)
//			},
//			error: function(xhr, status, error)
//			{
//				$('#text').text("Error.");
//				on();
//			}	
//		});
//			
//	});
//	
//	$("#NewBusiness").click(function(){
//		$("#NewBusiness").attr("disabled", true);
//		$.ajax({
//			url: "BusinessPage",
//			type: "GET",
//			success: function(data)
//			{
//				document.getElementById("DivLoginMain").style.display = "none";
//				document.getElementById("resultDiv").style.position = "fixed";
//				document.getElementById("resultDivClass").style.position = "fixed";
//				$("#NewBusiness").attr("disabled", true);
//				
//				$('.resultDivClass').html(data)
//			},
//			error: function(xhr, status, error)
//			{
//				$("#NewBusiness").attr("disabled", true);
//				$('#text').text("Error.");
//				on();
//			}	
//		});
//	});
//	
//	$("#ForgotPassword").click(function()
//	{
//		$.ajax({
//			url: "ForgotPassword",
//			type: "GET",
//			success: function(data)
//			{
//				document.getElementById("DivLoginMain").style.display = "none";
//				document.getElementById("resultDiv").style.position = "fixed";
//				document.getElementById("resultDivClass").style.position = "fixed";
//				
//				$('.resultDivClass').html(data)
//			},
//			error: function(xhr, status, error)
//			{
//				$('#text').text("Error.");
//				on();
//			}
//		});
//	})
//	
//    $('#Password').on("keypress", function(e) {
//    	if(e.keyCode == 13)
//    		{
//    			Login();
//    		}
//    })
});

function callWebService() {
//    var xhr = new XMLHttpRequest();
//    xhr.open("GET", "callRestService", true);
//    xhr.onreadystatechange = function() {
//        if (xhr.readyState == 4 && xhr.status == 200) {
//            var result = xhr.responseText;
//            console.log("tes123t");
//            document.getElementById("response").innerHTML = result;
//            
//var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
////			var currentUrl =x + "/Dashboard.jsp";
////const newUrl = currentUrl.replace('.jsp', '');
////window.location.replace(newUrl);
//
//		 	window.location = x + "/Dashboard.jsp";
//        }
//    };
//    xhr.send();
	
	
	$.ajax({
		url: "callRestService",
		type: "GET",
		dataType: "text",
		success: function(data)
		{
			alert('1');
			var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));

	 	window.location = x + "/PostPageNonBusiness.jsp";
			
		},
		complete : function ()
		{
			alert('complete');
		},
		error: function(xhr, status, error)
		{
			    alert('Error:', error);
	        
		}	
	});
}   

function callWebService2() {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "callRestService", true);
  xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
          var result = xhr.responseText;
          console.log("tes123t");
          alert(result);
          document.getElementById("response").innerHTML = result;
          
//var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
//			var currentUrl =x + "/Dashboard.jsp";
//const newUrl = currentUrl.replace('.jsp', '');
//window.location.replace(newUrl);

	//	 	window.location = x + "/Dashboard.jsp";
      }
  };
  xhr.send();
}   

function fadeInSplash()
{
	var xIndex = document.getElementById('indexPageDiv');
	
	xIndex.style.opacity = 0;
	
	//
}

function fadeInSplash2()
{
	document.getElementById('DivLoginMain').style.zIndex = 15;
	document.getElementById('resultDiv').style.zIndex = 15;
	document.getElementById('divAboutUs').style.zIndex = 15;
	
}

function hideSplash()
{
	//$('#indexPageDiv').hide();
}


function Login()
{
	var strID = $('#UserID').val();
	var strPass = $('#Password').val();
	
	if(strID == '')
	{
		$('#text').text("Please input your email address.");
		on();
		
		//alert("Please input your email address.");
	}
	else if(strPass == '')
	{
		$('#text').text("Please input your password.");
		on();
	}
	else
	{
		
		$('#loadingDiv1').show();
		$('.loadingDivClass1').show();
		$("#Login").attr("disabled", true);
		$.ajax({
			url: "Login",
			type: "POST",
			data: ({
				strUserID: strID,
				strPassword: strPass
			}),
			success: function(data)
			{
				$("#Login").attr("disabled", false);
				if(data == 'User ID does not exist.')
				{
					$('#text').text("User ID does not exist.");
					on();
				}
				else if(data == 'Failed to login.')
				{
					$('#text').text("Failed to login.");
					on();
				}
				else
				{
				 	var x = window.location.href.substring(window.location.href, window.location.href.lastIndexOf("/"));
					
				 	window.location = x + "/Dashboard?id=" + data + "&type=1";
				}
				
			},
			complete : function ()
			{
				$("#Login").attr("disabled", false);
				$('.loadingDivClass1').hide();
				$('#loadingDiv1').hide(500);
			},
			error: function(xhr, status, error)
			{
				$("#Login").attr("disabled", false);
				$('#text').text("Error.");
				on();
			}	
		});	
	}
	
	
// 	var strMonth = $('#selMonth').val()
// 	var strDay = $('#selDay').val();
// 	var strYear = $('#selYear').val();
	
// 	//$.post("deleteStudent");
// 	//alert(${pageContext.request.contextPath});
// 	//alert('test');
// 	var firstname = "test";
// 	var data = encodeURIComponent(firstname);
// 	$.ajax({
// 		url: "UserPage",
// 		type: "GET",
// 		success: function(data)
// 		{
// 			//alert(data);
// 			document.getElementById("DivLoginMain").style.display = "none";
// 			document.getElementById("resultDiv").style.position = "fixed";
// 			document.getElementById("resultDivClass").style.position = "fixed";
// 			$('.resultDivClass').html(data)
// 			//alert(response);
// 			//$.get('MainPage');
// 			//alert('testing');
// 			//$.post("deleteStudent");
// // 			window.location = '/UserPage';
//   			//alert('21-' + data.getResponseHeader("Location"));
 							  
// // 			alert(response);
// //  			alert($.get('redirectUserPage'))

// // 				$.ajax({
// // 					url: "redirectUserPage",
// // 					type: "GET"});
		
// 		},
// 		error: function(xhr, status, error)
// 		{
// 			alert('error');
// 			alert(xhr.responseText);
// 			alert(status);
// 		}
		
// 	});
	
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

function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}
