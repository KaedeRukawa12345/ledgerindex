<blockquote>
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
//           alert('wew11');
          $('#example').DataTable({scrollX: true});
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
		    
		    
		    $("#typeTranID").val("2");
		    $('#selTranID').val(xTest);
// 		    platform
// 		    itemName
// 		    itemCount
// 		    actualPrice
// 		    itemPrice
// 		    datepicker
// 		    total


						alert('testing: ' + $("#itemName" + xTest).attr('value'));
            $("#itemName").val($("#itemName" + xTest).attr('value')); //(get the value of the dropdown to set the vaule - "ID - Actual Price")
			$("#platform").val($("#platform" + xTest).attr('value'));
            $("#itemCount").val($("#itemtotal" + xTest).attr('value'));
            $("#actualPrice").val($("#actualprice" + xTest).attr('value')); //in api to save. it should be current stock minus overall stock the new stock + overall stock equals to overallstock
            $("#itemPrice").val($("#itemsoldprice" + xTest).attr('value'));
            $("#datepicker").val($("#datesold" + xTest).attr('value'));
            $("#total").val($("#totalSold" + xTest).attr('value'));
            $("#others").val($("#others" + xTest).attr('value'));
            
            $("#buyerName").val($("#buyerName" + xTest).attr('value'));
    		$("#buyerAddress").val($("#buyeraddress" + xTest).attr('value'));
    		$("#invoiceNumber").val($("#invoice" + xTest).attr('value'));
    		$("#datepickerInvoice").val($("#dateinvoice" + xTest).attr('value'));
    		$("#description").val($("#description" + xTest).attr('value'));
            
            
        	alert('wew' + xTest);
        	onChangePlatform();
            openEditUser();
      }
      
      function deleteButton(data){
  		
		    var xTest = $(data).attr('value');
		    //alert(xTest);
		    $('#selTranID').val(xTest);
		    
		    openDeleteUserTran();
    }
      
</script>





	<div class="container">
	    <div class="form-container">
			<div>
				<div style="padding-bottom: 25px;">
					<button id="buttonCreateTransaction" class="openbtn button buttonAdd" style="width: 50%; float: left; margin-bottom: 5px">CREATE TRANSACTION</button>
					<button id="buttonUploadTransaction" class="openbtn button buttonUploadTransaction" style="width: 50%; float: left; margin-bottom: 5px; background-color: #2192dc;">UPLOAD TRANSACTION</button>
				</div>
				
				<span style="padding-top: 15px">
				    <table  id="example"  class="display nowrap" style="width:100%">
						<thead>
							<tr>				    
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th style="display: none"></th>
								<th></th>
								<th></th>
								<th>Item Name</th>
								<th>Buyer's Name</th>
								<th>Platform</th>
								<th>Item Total</th>
<!-- 								<th>Actual Price</th> -->
<!-- 								<th>Item Sold Price</th> -->
								<th>Date Sold</th>
								<th>Total Sold</th>						
							</tr>
						</thead>
					
						<tbody>
						
							<c:forEach items="${ListOfTransactions}" var="items" varStatus="loop">
								<tr class="odd gradeX">
									<td style="display: none"><div id="itemName${items.ID}" class="elipsis" value="${items.NAME}">${items.NAME}</div></td>
									<td style="display: none"><div id="platform${items.ID}" class="elipsis" value="${items.PLATFORM}">${items.PLATFORM}</div></td>
									<td style="display: none"><div id="others${items.ID}" class="elipsis" value="${items.OTHERS}">${items.OTHERS}</div></td>
									
									<td style="display: none"><div id="buyeraddress${items.ID}" class="elipsis" value="${items.BUYERADDRESS}">${items.BUYERADDRESS}</div></td>
									<td style="display: none"><div id="invoice${items.ID}" class="elipsis" value="${items.INVOICE}">${items.INVOICE}</div></td>
									<td style="display: none"><div id="dateinvoice${items.ID}" class="elipsis" value="${items.DATEINVOICE}">${items.DATEINVOICE}</div></td>
									<td style="display: none"><div id="description${items.ID}" class="elipsis" value="${items.DESCRIPTION}">${items.DESCRIPTION}</div></td>
									
									<td><button class="icon-btn edit-btn" onClick="editButton(this)" value="${items.ID}"><i class="fas fa-edit"></i></button></td>
                      				<td><button class="icon-btn delete-btn" onClick="deleteButton(this)" value="${items.ID}"><i class="fas fa-trash-alt"></i></button>
                      				<td><div id="itemDisplayName${items.ID}" class="elipsis" value="${items.DISPLAYNAME}">${items.DISPLAYNAME}</div></td>
                      				<td><div id="buyerName${items.ID}" class="elipsis" value="${items.BUYERNAME}">${items.BUYERNAME}</div></td>
									<td><div id="platformDisplayName${items.ID}" class="elipsis" value="${items.PLATFORMDISPLAY}">${items.PLATFORMDISPLAY}</div></td>
									<td><div id="itemtotal${items.ID}" class="elipsis" value="${items.ITEMTOTAL}">${items.ITEMTOTAL}</div></td>
<%-- 									<td><div id="actualprice${items.ID}" class="elipsis" value="${items.ACTUALPRICE}">${items.ACTUALPRICE}</div></td> --%>
<%-- 									<td><div id="itemsoldprice${items.ID}" class="elipsis" value="${items.ITEMSOLDPRICE}">${items.ITEMSOLDPRICE}</div></td> --%>
									<td><div id="datesold${items.ID}" class="elipsis" value="${items.DATESOLD}">${items.DATESOLD}</div></td>
									<td><div id="totalSold${items.ID}" class="elipsis" value="${items.TOTALSOLD}">${items.TOTALSOLD}</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</span>
			</div>
 		</div>
	</div>

</blockquote>