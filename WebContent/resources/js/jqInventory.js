
$(document).ready(function(){
//	alert('inventory1');
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
    
    
//	$(document).off('click', '#inventory-blockquote #buttonCreateInventory').on('click', '#inventory-blockquote #buttonCreateInventory', function (event)
//	{
//		strSelID = '';
//
//		strTypeID = '';
//		
//		clearFields();
//		
//		showFields();
//        
//	});
	
	
	
	

	
	
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
				$('#promptMessage').text('Error: ', error + status + xhr);
	        
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
	
	
});


function dataPagination()
{
    //let allData = []; // Will hold all the records from the JSP page
    
alert('wew123');
    // Populate the allData and filteredData from JSTL rendered records
    
        const records = document.querySelectorAll('.record');
        alert('test' + records);
//        const allData = Array.from(records).map((row) => {
//            return {
//                id: row.cells[0].textContent,
//                field1: row.cells[1].textContent,
//                field2: row.cells[2].textContent,
//                field3: row.cells[3].textContent,
//                field4: row.cells[4].textContent,
//                field5: row.cells[5].textContent,
//                field6: row.cells[6].textContent,
//            };
//        });
//        filteredData = [...allData]; // Initially set filteredData as all data
//        alert('filtereddata' + filteredData);
//        renderData(0); // Render the first page


    

    

}

//Render data based on current page
function renderData(page) {
    currentPage = page;
    const table = document.getElementById('example');
    const pagination = document.getElementById('pagination');
    table.innerHTML = ''; // Clear current table data
    pagination.innerHTML = ''; // Clear pagination

    // Get the data for the current page
    const start = page * pageSize;
    const end = Math.min(start + pageSize, filteredData.length);
    const pageData = filteredData.slice(start, end);

    // Populate table rows with filteredData for the current page
    pageData.forEach((record, index) => {
    	alert('len' + filteredData.length)
    	alert('record' + record.ID);
        table.innerHTML += `
            <tr>
            
            <td><button class="icon-btn edit-btn" onClick="editButton(this)" value="${record.ID}"><i class="fas fa-edit"></i></button></td>
			<td><button class="icon-btn delete-btn" onClick="deleteButton(this)" value="${record.ID}"><i class="fas fa-trash-alt"></i></button><td><div id="itemName${record.ID}" class="elipsis" value="${record.NAME}">${record.NAME}</div></td>
			<td><div id="overallStock${record.ID}" class="elipsis" value="${record.OVERALLSTOCK}">${record.OVERALLSTOCK}</div></td>
			<td><div id="availableStock${record.ID}" class="elipsis" value="${record.AVAILABLESTOCK}">${record.AVAILABLESTOCK}</div></td>
			<td><div id="pricePerStock${record.ID}" class="elipsis" value="${record.PRICEPERSTOCK}">${record.PRICEPERSTOCK}</div></td>
			<td><div id="pricePerStockInt${record.ID}" class="elipsis" value="${record.PRICEPERSTOCKINT}">${record.PRICEPERSTOCKINT}</div></td>
          
            </tr>
        `;
    });

    // Generate pagination links
    const totalPages = Math.ceil(filteredData.length / pageSize);
    for (let i = 0; i < totalPages; i++) {
        const isActive = i === currentPage ? 'active' : '';
        pagination.innerHTML += `
            <li class="page-item ${isActive}">
                <a class="page-link" href="#" onclick="renderData(${i})">${i + 1}</a>
            </li>
        `;
    }
}


//Filter records based on search query
function searchData() {
    const query = document.getElementById('searchQuery').value.toLowerCase();
    filteredData = allData.filter(record =>
        Object.values(record).some(value =>
            value.toLowerCase().includes(query)
        )
    );
    renderData(0); // Render the first page of filtered data
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
//		
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
	//alert('selID123: ' + strSelID + "|" + strUserID);
	
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
			//alert("Result: " + jsonData);
			
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