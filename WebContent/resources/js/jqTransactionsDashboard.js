$(document).ready(function(){
	//alert('called11');
	
	var strTypeID = '';
	$('#typeTranID').val("");
	
	var strSelID = '';
	$('#selTranID').val("");
	//$('#DivUserPage').hide();
	var content = document.getElementById('DivUserPageMain');
    //content.classList.toggle('show');
    
	$('#DivUserPage').hide();
	$('#DivUserPage').css('display', 'none');
	
   
//      $('#datepicker').datepicker({
//        format: 'mm/dd/yyyy',
//        autoclose: true,
//        todayHighlight: true
//      });
    
	$(document).off('click', '#buttonCreateTransaction').on('click', '#buttonCreateTransaction', function (event)
	{
		alert('testing');
		strSelID = '';

		clearFields();
		
		showFields();
        
	});
	
	$(document).off('click', '#buttonUploadTransaction').on('click', '#buttonUploadTransaction', function (event)
	{
		const wrapper = document.getElementById('outputTableWrapper');
	    wrapper.innerHTML = '';
	    
	    
	    document.getElementById('outputJSON').value = "";
	    document.getElementById('outputJSON').style.display = "none";
	    document.getElementById('uploadExcel').value = "";
	    
		alert('testing11');
		strSelID = '';

		clearFields();
		
		showFields2();
        
	});
	
	$(document).off('click', '#buttonSaveUploadTransaction').on('click', '#buttonSaveUploadTransaction', function (event)
	{
		strUserID = '12345';
		
		var strUploadedTransactions = '';
		strUploadedTransactions = $("#outputJSON").val();
		
		if((strUploadedTransactions == null) || (strUploadedTransactions === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Please upload the file.');
			return;
		}
		else
		{
			$.ajax({
				url: "TransactionServiceUploadSave",
				type: "POST",
				data: ({
					strTransactions: strUploadedTransactions,
					strUserID: strUserID
				}),
				success: function(data)
				{
					
					var jsonData = JSON.parse(JSON.stringify(data));
					var jsonDataLength = jsonData.length;
					var html = '';
					//alert("json" + 	jsonData);
					
					$('#promptModal').modal('show');
					
					
					if(jsonData.includes("successfully"))
					{
						$('#promptMessage').text('Save successfully.');
						reloadData();
						hideFields();
					}
					else
					{
						$('#promptMessage').text(jsonData);
					}
					//W('#DivUserPageMain').html(data);
					
				},
				complete : function ()
				{
//					//alert('complete');
//					$('#promptModal').modal('show');
				},
				error: function(xhr, status, error)
				{
					    //alert('Error1:', error + status + xhr);
					    
					    $('#promptModal').modal('show');
						$('#promptMessage').text('Error on Inventory. Please report to system administrator.');
						return;
			        
				}	
			});
		}
	});
	
	$(document).off('click', '#buttonSaveTransaction').on('click', '#buttonSaveTransaction', function (event)
	{
		alert("save transaction");
		
		strUserID = '12345';
		
		strSelID = '';
		strTypeID = '';
		
		strTypeID = $("#typeTranID").val();
//		alert("Testing: " + strTypeID);
		if((strTypeID == null) || (strTypeID === ''))
		{
			strTypeID = '1';
		}
//		alert("Testing2: " + strTypeID);
		
		strSelID = '';
		
		strSelID = $("#selTranID").val();// $("#itemName").attr('value'));
		
		
		var strPlatform = $("#platform").val();
		
		var strOthers = $("#others").val();
		
		var strItemName = $("#itemName").val();
		
		var strItemCount = $("#itemCount").val();
		
		var strActualPrice = $("#actualPrice").val();
		
		var strItemPrice = $("#itemPrice").val();
		
		var strDateSold = $("#datepicker").val();
		
		var strTotal = $("#total").val();
		
		var strBuyerName = $("#buyerName").val();
		
		var strBuyerAddress = $("#buyerAddress").val();

		var strInvoiceNumber = $("#invoiceNumber").val();
		
		var strDateInvoice = $("#datepickerInvoice").val();
		
		var strDescription = $("#description").val();
		
		
		
		if((strPlatform === '0') || (strPlatform == null))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Platform is mandatory.');
			return;
		}
		else
		{
			if(strPlatform === '4')
			{
				alert($("#others").val());
				alert('strOthers1: ' + strOthers);
				if((strOthers == null) || (strOthers.trim() === ''))
				{
					$('#promptMessage').text('Specify the name of the platform.');
					$('#promptModal').modal('show');
					return;
				}
			}
		}
		
		if((strItemName == null) || (strItemName.trim() === ''))
		{
//			alert('Item name is mandatory.');
//			$('#promptModal').modal('show');
			
			$('#promptModal').modal('show');
			$('#promptMessage').text('Item name is mandatory.');
			return;
		}
		
		if((strBuyerName == null) || (strBuyerName.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Buyer\'s Name is mandatory.');
			return;
		}

		if((strBuyerAddress == null) || (strBuyerAddress.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Buyer\'s Address is mandatory.');
			return;
		}
		
		if((strInvoiceNumber == null) || (strInvoiceNumber.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Invoice Number is mandatory.');
			return;
		}
		
		if((strDateInvoice == null) || (strDateInvoice.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Invoice Date is mandatory.');
			return;
		}
		
		var strDescription = $("#description").val();
		if((strItemCount == null) || (strItemCount.trim() === ''))
		{
//			alert('Stock is mandatory.');
			
			$('#promptModal').modal('show');
			$('#promptMessage').text('Quantity is mandatory.');
			return;
		}
		
		
		if((strItemCount == null) || (strItemCount.trim() === ''))
		{
//			alert('Stock is mandatory.');
			
			$('#promptModal').modal('show');
			$('#promptMessage').text('Quantity is mandatory.');
			return;
		}
		
		if((strActualPrice == null) || (strActualPrice.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Actual Price is mandatory.');
			return;
		}
		
		if((strItemPrice == null) || (strItemPrice.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Price per item is mandatory.');
			return;
		}
		
		if((strDateSold == null) || (strDateSold === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Date when it was sold is mandatory.');
			return;
		}
		
		
		if((strTotal == null) || (strTotal.trim() === ''))
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Total is mandatory.');
			return;
		}
		
		
		
		
//		alert(strTypeID);
//		alert(strSelID);
//		alert(strPlatform);
//		alert(strOthers);
//		alert(strItemName);
//		alert(strItemCount);
//		alert(strActualPrice);
//		alert(strItemPrice);
//		alert(strTotal);
//		alert(strDateSold);
//		alert(strUserID);
		
		
		$.ajax({
			url: "TransactionServiceSave",
			type: "POST",
			data: ({
				strTypeID: strTypeID,
				strSelID: strSelID,
				strPlatform: strPlatform,
				strOthers: encodeURIComponent(strOthers),
				strStockID: strItemName,
				strItemCount: strItemCount,
				strActualPrice: strActualPrice,
				strItemPrice: strItemPrice,
				strTotal: strTotal,
				strDateSold: strDateSold,
				strUserID: strUserID,
				strBuyerName: strBuyerName,
				strBuyerAddress: strBuyerAddress,
				strInvoiceNumber: strInvoiceNumber,
				strDateInvoice: strDateInvoice,
				strDescription: strDescription
			}),
			success: function(data)
			{
				
				var jsonData = JSON.parse(JSON.stringify(data));
				var jsonDataLength = jsonData.length;
				var html = '';
				//alert("json" + 	jsonData);
				
				$('#promptModal').modal('show');
				
				
				if(jsonData.includes("successfully"))
				{
					$('#promptMessage').text('Save successfully.');
					reloadData();
					hideFields();
				}
				else
				{
					$('#promptMessage').text(jsonData);
				}
				//W('#DivUserPageMain').html(data);
				
			},
			complete : function ()
			{
//				//alert('complete');
//				$('#promptModal').modal('show');
			},
			error: function(xhr, status, error)
			{
				    //alert('Error1:', error + status + xhr);
				    
				    $('#promptModal').modal('show');
					$('#promptMessage').text('Error on Inventory. Please report to system administrator.');
					return;
		        
			}	
		});
		
	});
	
	$(document).off('click', '#buttonCancelTransaction').on('click', '#buttonCancelTransaction', function (event)
	{
////		$('#DivUserPageMain').show();
////		$('#DivUserPage').hide();
//		
//		var content = document.getElementById('DivUserPageMain');
//        content.classList.toggle('show');
//        
//       
//        
//        var content = document.getElementById('DivUserPage');
//        content.classList.toggle('show');
//        
////        $('#DivUserPage').hide();
//        $('#DivUserPageMain').show();
        
		hideFields();
        
	});

	
	
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

function reloadData()
{
	$.ajax({
		url: "TransactionService",
		type: "POST",
		success: function(data)
		{
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			
			$('#DivUserPageMain').html(data);
		},
		complete : function ()
		{
		},
		error: function(xhr, status, error)
		{
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error1:', error + status + xhr);
	        
		}	
	});
}

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
	
//	$.ajax({
//		url: "LoadItemsForTransactions",
//		type: "GET",
//		success: function(data)
//		{
//			//alert("daadta" + data);
//			alert(data);
//			var jsonData = JSON.parse(JSON.stringify(data));
//			var jsonDataLength = jsonData.length;
//			var html = '';
//			//alert("json" + 	jsonData);
//			
//			$('#itemName').html(data);//.show(500);
//		},
//		complete : function ()
//		{
//			//alert('complete');
//			
//		},
//		error: function(xhr, status, error)
//		{
//				$('#promptModal').modal('show');
//				$('#promptMessage').text('Error1:', error + status + xhr);
//	        
//		}	
//	});
	
	
	
	
	
//	var html = "";
//	html += '<option value="1-50.00">Test1</option>';
//	html += '<option value="2-100.00">Test2</option>';
//	html += '<option value="3-500.00">Test3</option>';
//	$("#itemName").append(html);
		
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


function DELETE()
{
	strSelID = '';
	strSelID = $('#selTranID').val();
	
	
//	strSelID = document.getElementById('selID');// $("#itemName").attr('value'));
	
	
	alert('selID123: ' + strSelID);
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
			alert("Result: " + jsonData);
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
				$('#promptMessage').text('Error1:', error + status + xhr);
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