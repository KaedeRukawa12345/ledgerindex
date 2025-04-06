$(document).ready(function(){
	
	var strSelID = '';
	$('#selTranID').val("");
	
	var strTypeID = '';
	$('#typeTranID').val("");
	
	//$('#DivUserPage').hide();
	var content = document.getElementById('DivUserPageMain');
    //content.classList.toggle('show');
    
	$('#DivUserPage').hide();
	$('#DivUserPage').css('display', 'none');
	
   
      $('#datepicker').datepicker({
        format: 'mm/dd/yyyy',
        autoclose: true,
        todayHighlight: true
      });
      
      $('#datepickerInvoice').datepicker({
          format: 'mm/dd/yyyy',
          autoclose: true,
          todayHighlight: true
        });
    
    
//	$(document).on('click', '#buttonCreate', function (event)
//	{
//		strSelID = '';
//
//		clearFields();
//		
//		showFields();
//        
//	});
//	
//	$(document).on('click', '#buttonSave', function (event)
//	{
//		strSelID = '';
//		
//		strSelID = document.getElementById('selID');// $("#itemName").attr('value'));
//		
//		
//		var strPlatform = $("#platform").val();
//		
//		var strOthers = document.getElementById('others');
//		
//		var strItemName = document.getElementById('itemName');
//		
//		var strItemCount = document.getElementById('itemCount');
//		
//		var strItemPrice = document.getElementById('itemPrice');
//		
//		var strDateSold = document.getElementById('datepicker');
//		
//		var strTotal = document.getElementById('total');
//		
//		
//		if((strPlatform == '0') || (strPlatform == null))
//		{
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Platform is mandatory.');
//			return;
//		}
//		else
//		{
//			if(strPlatform == '4')
//			{
//				if(strOthers.value.trim() == '');
//				{
//					$('#promptMessage').text('Specify the name of the platform.');
//					$('#promptModal').modal('show');
//					return;
//				}
//			}
//		}
//		
//		if(strItemName.value.trim() == '')
//		{
////			alert('Item name is mandatory.');
////			$('#promptModal').modal('show');
//			
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Item name is mandatory.');
//			return;
//		}
//		
//		if(strItemCount.value.trim() == '')
//		{
////			alert('Stock is mandatory.');
//			
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Count of item purchased is mandatory.');
//			return;
//		}
//		
//		if(strItemPrice.value.trim() == '')
//		{
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Price per item is mandatory.');
//			return;
//		}
//		
//		if((strDateSold == '') || (strDateSold == null))
//		{
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Date when it was sold is mandatory.');
//			return;
//		}
//		
//		
//		if(strTotal.value.trim() == '')
//		{
//			$('#promptModal').modal('show');
//			$('#promptMessage').text('Total is mandatory.');
//			return;
//		}
//		
//		
//		$.ajax({
//			url: "TransactionServiceSave",
//			type: "POST",
//			data: ({
//				strPlatform: strPlatform,
//				strOthers: strOthers,
//				strItemName: strItemName,
//				strItemCount: strItemCount,
//				strItemPrice: strItemPrice,
//				strDateSold: strDateSold,
//				strTotal: strTotal
//			}),
//			success: function(data)
//			{
//				
//				var jsonData = JSON.parse(JSON.stringify(data));
//				var jsonDataLength = jsonData.length;
//				var html = '';
//				alert("json" + 	jsonData);
//				
//				//W('#DivUserPageMain').html(data);
//				hideFields();
//			},
//			complete : function ()
//			{
////				//alert('complete');
////				$('#promptModal').modal('show');
//			},
//			error: function(xhr, status, error)
//			{
//				    alert('Error1:', error + status + xhr);
//				    
//				    $('#promptModal').modal('show');
//					$('#promptMessage').text('Error on Inventory. Please report to system administrator.');
//					return;
//		        
//			}	
//		});
//		
//	});
//	
//	$(document).on('click', '#buttonCancel', function (event)
//	{
//////		$('#DivUserPageMain').show();
//////		$('#DivUserPage').hide();
////		
////		var content = document.getElementById('DivUserPageMain');
////        content.classList.toggle('show');
////        
////       
////        
////        var content = document.getElementById('DivUserPage');
////        content.classList.toggle('show');
////        
//////        $('#DivUserPage').hide();
////        $('#DivUserPageMain').show();
//        
//		hideFields();
//        
//	});

	
	
	$.ajax({
		url: "TransactionService",
		type: "POST",
		success: function(data)
		{
			//alert("daadta" + data);
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			$('#DivUserPageMain').html(data);//.show(500);
//			for(var i=0; i<jsonDataLength; i++)
//			{
//				var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
//		    	//alert(strJSON);
//				alert(strJSON.ID + '>' + strJSON.Skill);
//				
//			}
		},
		complete : function ()
		{
			//alert('complete');
			
		},
		error: function(xhr, status, error)
		{
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error1:', error + status + xhr);
	        
		}	
	});
	
    

	
//<!-- Step 2: Iterate Over the Data with JSTL -->
//<c:forEach var="post" items="${dummyData}">
//    <div>
//        <h2>${post.title}</h2>
//        <p>${post.content}</p>
//    </div>
//</c:forEach>
	
	
//<table class="datatable" id="example" style="width: 100%">
//
//<thead>
//	<tr>				    
//		<th></th>
//		<th></th>
//		<th>Service</th>
//		<th>Description</th>							
//	</tr>
//</thead>
//
//<tbody>
//
//	<c:forEach items="${AllPostLists}" var="items" varStatus="loop">
//		<tr class="odd gradeX">							
//			<td><button id="buttonEdit" onClick="editButton(this)" class="removecheckbox button buttonEdit" value="${items.ID}">EDIT</button></td>
//			<td><button id="buttonDelete" onClick="deleteButton(this)" class="removecheckbox button buttonDelete" value="${items.ID}">DELETE</button></td>						    							
//			<td><div id="service${items.ID}" value="${items.SERVICEID}" class="elipsis">${items.SERVICE}</div></td>
//			<td><div id="description${items.ID}" class="elipsis">${items.DESCRIPTION}</div></td>
//			
//		</tr>
//	</c:forEach>
//</tbody>
//</table>
	
	
	
	
	loadSearch();
	
});


function loadSearch()
{
//
//	$.ajax( {
//		url : 'loadSearch',
//		type: "POST",
//		dataType: "json",
//		contentType: "application/json",
//		success : function(data) {
//			var jsonDataSearch = JSON.parse(JSON.stringify(data));
//			var jsonDataSearchLength = jsonDataSearch.length;
//			loadDataSearch(jsonDataSearch, jsonDataSearchLength);
//			
//		},
//		complete : function()
//		{
//			loadSearch2('0', '', '', '');
//		}
// 
//	});
	
	loadDataSearch(1, 1)
	var content = document.getElementById('othersDiv');
    content.classList.toggle('show');
    
	$('#othersDiv').hide();
	$('#othersDiv').css('display', 'none');
}


function loadDataSearch(pData, pLength)
{
//	var html = '';
//	var html2 = '';
//	
//	for(var i=0; i<pLength; i++)
//	{
//		var strJSON = JSON.parse(JSON.stringify(pData[i]));
//    	
//		html += '<span style="display: block"><input type="checkbox" id="' + strJSON.ID + '" value="' + strJSON.ID + '" >' +
//				'<label for="' + strJSON.ID + '">' + strJSON.Value + '</label></span>';
//		
//		html2 += '<option value="' + strJSON.ID + '">' + strJSON.Value + '</option>'
//	}
//	
//	$('#checkboxes').append(html);
//	$('#selectSearch').append(html2);
	
	//ID and Actual Price will be the ID and Item Name will be in the Select Field
	
	$.ajax({
		url: "LoadItemsForTransactions",
		type: "GET",
		success: function(data)
		{
			//alert("daadta" + data);
			//alert(data);
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			$('#itemName').append(data);//.show(500);
		},
		complete : function ()
		{
			//alert('complete');
			
		},
		error: function(xhr, status, error)
		{
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error1:', error + status + xhr);
	        
		}	
	});
	
//	
//	var html = "";
//	html += '<option value="1-50.00">Test1</option>';
//	html += '<option value="2-100.00">Test2</option>';
//	html += '<option value="3-500.00">Test3</option>';
//	$("#itemName").append(html);
//		
}


function onChangeItem()
{
	var selectElement = $("#itemName");
	
	var selectedValue = selectElement.val().split("-");
	
	$("#actualPrice").val(selectedValue[1]);

}


function onChangePlatform()
{
	if($("#platform").val() === '4')
	{
		$('#othersDiv').css('display', 'block');

		$('#othersDiv').show();
	    var content = document.getElementById('othersDiv');
	    content.classList.toggle('show');
	    
	}
	else
	{
		var content = document.getElementById('othersDiv');
	    content.classList.toggle('show');
	    
		$('#othersDiv').hide();
		$('#othersDiv').css('display', 'none');
	}

}



function openEditUser()
{
	showFields();
}

function ConfirmDeleteTransaction()
{
	DeleteTran();
}

function openDeleteUserTran()
{
//	if(confirm('Delete this record???'))
//	{
//		alert($('#selTranID').val());
//		alert('deleted: ' +  $('#selTranID').val());
//		
//		DELETE();
//	}	

	alert('testmodal');
	$('#promptModalDeleteTran').modal('show');
	
}

function showFields()
{
	var content = document.getElementById('DivUserPageMain');
    //content.classList.toggle('show');
    
	$('#DivUserPageMain').hide();
	
	$('#DivUserPage').css('display', 'block');
	
	$('#DivUserPage').show();
    var content = document.getElementById('DivUserPage');
    //content.classList.toggle('show');
}


function showFields2()
{
	var content = document.getElementById('DivUserPageMain');
    //content.classList.toggle('show');
    
	$('#DivUserPageMain').hide();
	
	$('#DivUserPage2').css('display', 'block');
	
	$('#DivUserPage2').show();
    var content = document.getElementById('DivUserPage');
    //content.classList.toggle('show');
}

function hideFields()
{
	var content = document.getElementById('DivUserPage');
    //content.classList.toggle('show');
    
	$('#DivUserPage').hide();
	
	$('#DivUserPage').css('display', 'none');
	
	$('#DivUserPage2').hide();
	
	$('#DivUserPage2').css('display', 'none');
	
	
	$('#DivUserPageMain').show();
    var content = document.getElementById('DivUserPageMain');
    //content.classList.toggle('show');
}

function clearFields()
{
	strSelID = '';

	$("#selTranID").val("");// $("#itemName").attr('value'));
	$("#platform").val("");
	$("#others").val("");
	$("#itemName").val("");
	$("#itemCount").val("");
	$("#actualPrice").val("");
	$("#itemPrice").val("");
	$("#datepicker").val("");
	$("#total").val("");
	$("#buyerName").val("");
	$("#buyerAddress").val("");
	$("#invoiceNumber").val("");
	$("#datepickerInvoice").val("");
	$("#description").val("");
	
}


function DeleteTran()
{
	strSelID = '';
	strSelID = $('#selTranID').val();
	
	
//	strSelID = document.getElementById('selID');// $("#itemName").attr('value'));
	
	
	alert('Delete Tran selID123: ' + strSelID);
	var strUserID = "12345";
	$.ajax({
		url: "TransactionServiceDelete",
		type: "POST",
		data: ({
			strSelID: $('#selTranID').val(),
			strUserID: strUserID
			
		}),
		success: function(data)
		{
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			//W('#DivUserPageMain').html(data);
			reloadData();
			$('#promptModal').modal('show');
			$('#promptMessage').text(jsonData);
//			alert("Result: " + jsonData);
			hideFields();
		},
		complete : function ()
		{
			//alert('complete');
		},
		error: function(xhr, status, error)
		{
//			    alert('Error1:', error + status + xhr);
			$('#promptModal').modal('show');
			$('#promptMessage').text('Error: ', error + status + xhr);
		}	
	});
}
//function SaveInventory()
//{
//	
//	
//	
//	var strID = window.location.href.substring(window.location.href.indexOf("?")+4, window.location.href.indexOf("&"));
//	
//	
//	strSkills = $('#selService').val();
//	strDescription = $('#Description').val();
//	strSelID = $('#selID').val();
//	strType = $('#selType').val();
//
//	//$("#buttonUpdate").attr("disabled", true);
//	$.ajax({
//		url: "SaveInventory",
//		type: "POST",
//		data: ({
//			strUserID: strID,
//			strSkills: strSkills,
//			strDescription: strDescription,
//			strSelID: strSelID,
//			strType: strType
//		}),
//		success: function(response)
//		{
//	//		$("#buttonUpdate").attr("disabled", false);
//		//	$('#text').text(response);
//			//on();
//			alert('success');
//			
//		},
//		error: function(xhr, status, error)
//		{
//	//		$("#buttonUpdate").attr("disabled", false);
//		//	$('#text').text("Error.");
//			//on();
//			alert('error');
//		}
//		
//	});
//}