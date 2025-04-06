$(document).ready(function(){
	
	var strTypeID = '';
	$('#typeID').val("");
	
	var strSelID = '';
	$('#selID').val("");
	
	$('#DivUserPage').hide();
	$('#DivUserPage').css('display', 'none');
	
		
//	
//	$('#DivUserPageMain').show();
//	var content = document.getElementById('DivUserPageMain');
//    content.classList.toggle('show');
//    $('#DivUserPageMain').css('display', 'block');
    
   // hideFields();
//    function hideFields()
//    {
//    	var content = document.getElementById('DivUserPage');
//        content.classList.toggle('show');
//        
//    	$('#DivUserPage').hide();
//    	
//    	$('#DivUserPage').css('display', 'none');
//    	
//    	$('#DivUserPageMain').show();
//        var content = document.getElementById('DivUserPageMain');
//        content.classList.toggle('show');
//    }
    
    
	$(document).off('click', '#buttonCreateInventory').on('click', '#buttonCreateInventory', function (event)
	{
		//alert("create11");
		strSelID = '';

		strTypeID = '';
		
		clearFields();
		
		showFields();
        
	});
	
	$(document).off('click', '#buttonCancelInventory').on('click', '#buttonCancelInventory', function (event)
			{
////				$('#DivUserPageMain').show();
////				$('#DivUserPage').hide();
//				
//				var content = document.getElementById('DivUserPageMain');
//		        content.classList.toggle('show');
//		        
//		       
//		        
//		        var content = document.getElementById('DivUserPage');
//		        content.classList.toggle('show');
//		        
////		        $('#DivUserPage').hide();
//		        $('#DivUserPageMain').show();
//		        alert('cancel');
				hideFields();
		        
			});
	
	
	
	$(document).off('click', '#buttonSaveInventory').on('click', '#buttonSaveInventory', function (event)
			{
//				alert(123);
				strUserID = '12345';
				
				strSelID = '';
				strTypeID = '';
				
				strTypeID = document.getElementById('typeID');
				
				if((strTypeID.value == null) || (strTypeID.value === ''))
				{
					strTypeID.value = '1';
				}
				
//				alert("strTypeID: " + strTypeID.value);
				
				strSelID = document.getElementById('selID');// $("#itemName").attr('value'));
				var itemName = document.getElementById('itemName');
				var stock = document.getElementById('stock');
				var price = document.getElementById('price');
				var interest = document.getElementById('interest');
				
				if(itemName.value.trim() === '')
				{
//					alert('Item name is mandatory.');
//					$('#promptModal').modal('show');
					
					$('#promptModal').modal('show');
					$('#promptMessage').text('Item name is mandatory.');
					return;
				}
				
				if(stock.value.trim() === '')
				{
//					alert('Stock is mandatory.');
					
					$('#promptModal').modal('show');
					$('#promptMessage').text('Stock is mandatory.');
					return;
				}
				
				if(price.value.trim() === '')
				{
					$('#promptModal').modal('show');
					$('#promptMessage').text('Price per item is mandatory.');
					return;
				}
				
				if(interest.value.trim() === '')
				{
					$('#promptModal').modal('show');
					$('#promptMessage').text('Interest amount per item is mandatory.');
					return;
				}
				
//				alert("wewe");
//				alert(strSelID.value);
				$.ajax({
					url: "InventoryServiceSave",
					type: "POST",
					data: ({
						strType: strTypeID.value.trim(),
						strSelID: strSelID.value.trim(),
						strItemName: itemName.value.trim(),
						strStock: stock.value.trim(),
						strPrice: price.value.trim(),
						strInterest: interest.value.trim(),
						strUserID: strUserID
					}),
					success: function(data)
					{
						
						var jsonData = JSON.parse(JSON.stringify(data));
						var jsonDataLength = jsonData.length;
						var html = '';
//						alert("json" + 	jsonData);
						
						
						//W('#DivUserPageMain').html(data);
						if((jsonData.includes('Error')) || (jsonData.includes('Item is already existing.')))
						{
							
//							alert('54321');
							$('#promptModal').modal('show');
							$('#promptMessage').text('Error: Please report to system administrator.');
							return;
						}
						else
						{
							$('#promptModal').modal('show');
							$('#promptMessage').text('Save successfully.');
							hideFields();
						}
						
					},
					complete : function ()
					{
//						//alert('complete');
//						$('#promptModal').modal('show');
					},
					error: function(xhr, status, error)
					{
						    //alert('Error1:', error + status + xhr);
						    
						    $('#promptModal').modal('show');
							$('#promptMessage').text('Error: Please report to system administrator.');
							return;
				        
					}	
				});
				
			});
	
	
	
	
//	$.ajax({
//		url: "InventoryService",
//		type: "POST",
//		success: function(data)
//		{
//			//alert("daadta" + data);
//			
//			var jsonData = JSON.parse(JSON.stringify(data));
//			var jsonDataLength = jsonData.length;
//			var html = '';
//			//alert("json" + 	jsonData);
//			
//			$('#DivUserPageMain').html(data);//.show(500);
////			for(var i=0; i<jsonDataLength; i++)
////			{
////				var strJSON = JSON.parse(JSON.stringify(jsonData[i]));
////		    	//alert(strJSON);
////				alert(strJSON.ID + '>' + strJSON.Skill);
////				
////			}
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
	
	
});


function ReloadData()
{
	//alert('reload inventory');
	$.ajax({
		url: "InventoryService",
		type: "POST",
		success: function(data)
		{
			//alert("daadta" + data);
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			$('#DivUserPageMain').html(data);//.show(500);

		},
		complete : function ()
		{
			//alert('complete');
			
		},
		error: function(xhr, status, error)
		{
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error: ', error + status + xhr);
	        
		}	
	});
}
function openEditUser()
{
	showFields();
}

function ConfirmDeleteInventory()
{
	DELETE();
}

function openDeleteUser()
{
//	if(confirm('Delete this record???'))
//	{
//		alert($('#selID').val());
//		alert('deleted: ' +  $('#selID').val());
//		
//		//DELETE();
//	}	

	alert('testmodal');
	$('#promptModalDelete').modal('show');
}

function showFields()
{
	var content = document.getElementById('DivUserPageMain');
   // content.classList.toggle('show');
    
	$('#DivUserPageMain').hide();
	
	$('#DivUserPage').css('display', 'block');
	
	$('#DivUserPage').show();
    var content = document.getElementById('DivUserPage');
   // content.classList.toggle('show');
}

function hideFields()
{
	ReloadData();
	var content = document.getElementById('DivUserPage');
   // content.classList.toggle('show');
    
	$('#DivUserPage').hide();
	
	$('#DivUserPage').css('display', 'none');
	
	$('#DivUserPageMain').show();
    var content = document.getElementById('DivUserPageMain');
   // content.classList.toggle('show');
}

function clearFields()
{
	strSelID = '';
	$('#selID').val("");
	$('#itemName').val("");
	$('#stock').val("");
	$('#price').val("");
	$('#interest').val("");
}


function DELETE()
{
	strSelID = '';
	strSelID = $('#selID').val();
	
	
//	strSelID = document.getElementById('selID');// $("#itemName").attr('value'));
	
	var strUserID = "12345";
	alert('selID123: ' + strSelID + "|" + strUserID);
	
	$.ajax({
		url: "InventoryServiceDelete",
		type: "POST",
		data: ({
			strSelID: strSelID,
			strUserID: strUserID
			
		}),
		success: function(data)
		{
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			//W('#DivUserPageMain').html(data);
//			alert("Result: " + jsonData);
			$('#promptModal').modal('show');
			$('#promptMessage').text(jsonData);

			hideFields();
		},
		complete : function ()
		{
			//alert('complete');
		},
		error: function(xhr, status, error)
		{
			$('#promptModal').modal('show');
			$('#promptMessage').text('Error: ', error + status + xhr);
		}	
	});
}