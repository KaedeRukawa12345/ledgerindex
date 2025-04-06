<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Dummy Data Example</title>
<!-- 	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="<c:url value="/resources/css/inventory.css" />" >
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

    <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
  <!-- Bootstrap Datepicker JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	
	<script>
    
  </script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            color: #495057;
            font-weight: bold;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
        .form-group {
        	padding-bottom: 25px
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f4f4f4;
        }

        #outputTableWrapper {
            margin-top: 20px;
        }
    </style>
</head>
<body>
	 <div class="container mt-5">
    
    <div class="modal fade" id="promptModal" tabindex="-1" aria-labelledby="promptModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color: aqua">
            <h5 class="modal-title" id="promptModalLabel">Message</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div id="promptMessage" class="modal-body" style="white-space: pre-wrap">
            This is a prompt message. Do you want to proceed?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
          </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" id="promptModalDeleteTran" tabindex="-1" aria-labelledby="promptModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color: aqua">
            <h5 class="modal-title" id="promptModalLabel">Message</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div id="promptMessageTran" class="modal-body" style="white-space: pre-wrap">
            This is a prompt message. Do you want to proceed?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onClick="ConfirmDeleteTransaction()" data-dismiss="modal">OK</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    
    <div id="DivUserPageMain" class="DivUserPageMain fade show" style="top: -100px">
	</div>
	
	<input type="hidden" id="typeTranID" name="typeTranID" value="">
	<input type="hidden" id="selTranID" name="selTranID" value="">
	
	<div id="DivUserPage" class="DivUserPage fade show" style="min-height: 0px; top: -100px">
		<div class="container">
		    <div class="form-container">
		    	<div class="form-group">
		            <label for="Platform" class="form-label">Platform</label>
		            <select class="form-control" id="platform" onchange="onChangePlatform()">
		            	<option value="0" disabled selected>Select Platform</option>
		            	<option value="1">Testing 1</option>
		            	<option value="2">Testing 2</option>
		            	<option value="3">Testing 3</option>
		            	<option value="4">Others</option>
		            </select>
		        </div>
		        <div class="form-group" id="othersDiv">
		            <label for="Item Name" class="form-label">Others</label>
		            <input type="text" class="form-control" id="others" placeholder="Enter the platform" maxlength="50">
		        </div>
		        <div class="form-group">
<!-- 		        //get from inventory. Actual price and the item should be get from db -->
		            <label for="Platform" class="form-label">Item Name</label> 
		            <select class="form-control" id="itemName" onchange="onChangeItem()">
		            	<option value="" disabled selected>Select item</option>
<!-- 		            	<option value="1">Lazada</option> -->
<!-- 		            	<option value="2">Shopee</option> -->
<!-- 		            	<option value="3">Tiktok</option> -->
		            </select>
		        </div>
		        <div class="form-group">
		            <label for="Item Name" class="form-label">Buyer's Name</label>
		            <input type="text" class="form-control" id="buyerName" placeholder="Enter the name of the buyer" maxlength="100">
		        </div>
		        <div class="form-group">
		            <label for="Item Name" class="form-label">Buyer's Address</label>
		            <input type="text" class="form-control" id="buyerAddress" placeholder="Enter the address of the buyer" maxlength="150">
		        </div>
				<div class="form-group">
		            <label for="Item Name" class="form-label">Invoice Number</label>
		            <input type="text" class="form-control" id="invoiceNumber" placeholder="Enter the Invoice number" maxlength="5">
		        </div>
		        <div class="form-group">
				    <label for="datepicker" class="form-label">Invoice Date</label>
				    <input type="text" class="form-control" id="datepickerInvoice" placeholder="Choose a date">
				</div>
		        <div class="form-group">
		            <label for="Item Name" class="form-label">Description</label>
		            <input type="text" class="form-control" id="description" placeholder="Enter the description" maxlength="150">
		        </div>
		        <div class="form-group">
		            <label for="Item Name" class="form-label">Quantity</label>
		            <input type="number" class="form-control" id="itemCount" placeholder="Enter the count of the Item purchased" maxlength="5">
		        </div>
		        <div class="form-group">
<!-- 		        //get from inventory but disable. Actual price and the item should be get from db -->
		            <label for="Item Name" class="form-label">Actual Price</label>
		            <input type="number" class="form-control" id="actualPrice" maxlength="5">
		        </div>
		        <div class="form-group">
<!-- 		        //price of the item per sold -->
		            <label for="Item Name" class="form-label">Price per Item</label>
		            <input type="text" class="form-control" id="itemPrice" placeholder="Enter price per item" maxlength="5">
		        </div>
		        <div class="form-group" class="form-label">
				    <label for="datepicker">Date Sold</label>
				    <input type="text" class="form-control" id="datepicker" placeholder="Choose a date">
				</div>
		        <div class="form-group">
<!-- 		        //auto compute in price per item but can be manual input -->
		            <label for="Price" class="form-label">Total Amount</label>
		            <input type="number" class="form-control" id="total" placeholder="Total amount" maxlength="9">
		        </div>
		        <div class="btn-group">
		            <button id="buttonSaveTransaction" type="button" class="btn btn-primary">Save</button>
		            <button id="buttonCancelTransaction" type="button" class="btn btn-secondary">Cancel</button>
		        </div>
		    </div>
		</div>
	</div>
	
	
	<div id="DivUserPage2" class="DivUserPage fade show" style="min-height: 0px; top: -100px">
		<div class="container">
		    <div class="form-container">
		    	<div class="form-group" style="overflow-x: scroll;">
		            <input type="file" id="uploadExcel" />
   					<div id="outputTableWrapper"></div>
    				<pre id="outputJSON" style="display: none; background: #f9f9f9; padding: 10px;"></pre>

    
		        </div>
		        
		        <div class="btn-group">
		            <button id="buttonSaveUploadTransaction" type="button" class="btn-primary openbtn button">Upload</button>
		            <button id="buttonCancelTransaction" type="button" class="btn-secondary openbtn button">Cancel</button>
		        </div>
		    </div>
		</div>
	</div>
	
 <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
 <script src="<c:url value="/resources/js/jqTransactions.js" />" ></script>
 <script src="<c:url value="/resources/js/jqTransactionsUploader.js" />" ></script>
  
</body>
</html>
