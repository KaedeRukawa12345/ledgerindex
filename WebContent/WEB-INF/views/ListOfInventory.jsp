<blockquote id="inventory-blockquote">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<c:url value="/resources/js/jquery.dataTables.min.js" />" /></script>
<script src="<c:url value="/resources/js/datatables.min.js" />" /></script>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/datatables.min.css" />" > --%>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css" rel="stylesheet">

<style>
.elipsis
{
    overflow: auto;
	max-height: 70px;
}

.form-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
.button
{
	font-size: 15px;
    width: 100%;
    display: inline-block;
    overflow: auto;
    white-space: nowrap;
    margin: 0px auto;
    border: 1px #d3dee0 solid;
    height: 38px;
    border-radius: 7px;
    color: white;
    font-weight: normal;
    cursor: pointer;
}

.buttonAdd, .buttonEdit
{
	background-color: #2192dc;
}

.buttonAdd:hover, .buttonEdit:hover
{
	background-color: #3983d0;
}

.buttonDelete
{
	background-color: #c10707;
}

.buttonDelete:hover
{
	background-color: #790606;
}

blockquote
{
	font-size: 15px;
}
.icon-btn {
            border: none;
            background: none;
        }
        .icon-btn:hover {
            color: #0056b3;
        }	
 @media only screen and (max-width: 767px) 
 { 
/*  	.dataTable th, .dataTable td */
/*  	{ */
/* 		max-width: 100px; */
/* 		min-width: 15px; */
/* 		overflow: hidden; */
/* 		text-overflow: ellipsis; */
/* 		white-space: nowrap; */
/* 	} */
	
	.buttonAdd, .buttonEdit, .buttonDelete
	{
		font-size: 2.5vw;
	}
	
	blockquote
	{
/* 		font-size: 2.5vw; */
	}
 } 

</style>
<script type="text/javascript">
      $(document).ready(function () {
    	  
    	  $('#example').DataTable({scrollX: true});
//     	  alert('datatable');
    	  //dataPagination();
//            $('#example').DataTable({
//         	  "columns": [{"width": "5%"},
//         		  {"width": "5%"},
//         		  {"width": "25%"},
//         		  {"width": "65%"}]	
        
//            }); 
    	
         
      });
      
      function editButton(data){
    		
		    var xTest = $(data).attr('value');
// 		    alert(xTest);
// 		    alert($("#itemName" + xTest).attr('value'));
// 		    alert($("#overallStock" + xTest).attr('value'));
// 		    alert($("#currentStock" + xTest).attr('value'));
// 		    alert($("#availableStock" + xTest).attr('value'));
// 		    alert($("#pricePerStock" + xTest).attr('value'));
// 		    alert($("#pricePerStockInt" + xTest).attr('value'));
		    
		    
		    
		    $("#typeID").val("2");
		    $('#selID').val(xTest);
            $("#itemName").val($("#itemName" + xTest).attr('value'));
            $("#stock").val($("#availableStock" + xTest).attr('value')); //in api to save. it should be current stock minus overall stock the new stock + overall stock equals to overallstock
            $("#price").val($("#pricePerStock" + xTest).attr('value'));
            $("#interest").val($("#pricePerStockInt" + xTest).attr('value'));
        	
		    
            openEditUser();
      }
      
      function deleteButton(data){
  		
		    var xTest = $(data).attr('value');
// 		    alert(xTest);
		    $('#selID').val(xTest);
		    
		    openDeleteUser();
    }
      
</script>





	<div class="container">
	    <div class="form-container">
	    
	    
	    <div class="container mt-4">
	    
	    
			<div>
			
			
			
			
			
			
			
			
				<div style="padding-bottom: 25px;">
					<button id="buttonCreateInventory" class="openbtn button buttonAdd">CREATE ITEM</button>
				</div>
				
				<span style="padding-top: 15px">
				    <table  id="example"  class="display nowrap" style="width:100%">
						<thead>
							<tr class="record">				    
								<th></th>
								<th></th>
								<th>Name</th>
								<th>Overall Stock</th>
								<th>Available Stock</th>
								<th>Price per Stock</th>
								<th>Interest</th>						
							</tr>
						</thead>
					
						<tbody>
						
							<c:forEach items="${ListOfInventory}" var="items" varStatus="loop">
								<tr class="odd gradeX">						
									<td><button class="icon-btn edit-btn" onClick="editButton(this)" value="${items.ID}"><i class="fas fa-edit"></i></button></td>
                      				<td><button class="icon-btn delete-btn" onClick="deleteButton(this)" value="${items.ID}"><i class="fas fa-trash-alt"></i></button><td><div id="itemName${items.ID}" class="elipsis" value="${items.NAME}">${items.NAME}</div></td>
									<td><div id="overallStock${items.ID}" class="elipsis" value="${items.OVERALLSTOCK}">${items.OVERALLSTOCK}</div></td>
									<td><div id="availableStock${items.ID}" class="elipsis" value="${items.AVAILABLESTOCK}">${items.AVAILABLESTOCK}</div></td>
									<td><div id="pricePerStock${items.ID}" class="elipsis" value="${items.PRICEPERSTOCK}">${items.PRICEPERSTOCK}</div></td>
									<td><div id="pricePerStockInt${items.ID}" class="elipsis" value="${items.PRICEPERSTOCKINT}">${items.PRICEPERSTOCKINT}</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</span>
			</div>
		 
</div>	
			
 		</div>
	</div>

<script>
        // You can either manually call the function or make it part of an event if necessary
        
    </script>
    
</blockquote>