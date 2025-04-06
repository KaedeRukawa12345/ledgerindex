<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dummy Data Example</title>
<!-- 	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="<c:url value="/resources/css/inventory.css" />" >
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
    <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
<%-- 	<script src="<c:url value="/resources/js/jqInventory.js" />" ></script> --%>

	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    
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
        
        table, th, td {
            border: 1px solid #ddd;
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
          <div id="promptMessage" class="modal-body">
            This is a prompt message. Do you want to proceed?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
          </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" id="promptModalDelete" tabindex="-1" aria-labelledby="promptModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="background-color: aqua">
            <h5 class="modal-title" id="promptModalLabel">Message</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div id="promptMessage" class="modal-body">
            This is a prompt message. Do you want to proceed?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onClick="ConfirmDeleteInventory()" data-dismiss="modal">OK</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    
    <div id="DivUserPageMain" class="DivUserPageMain fade show" style="top: -100px">
	</div>
	
	<input type="hidden" id="typeID" name="typeID" value="">
	<input type="hidden" id="selID" name="selID" value="">
	
	<div id="DivUserPage" class="DivUserPage fade show" style="min-height: 0px; top: -100px">
		<div class="container">
		    <div class="form-container">
		        <div class="form-group">
		            <label for="Item Name" class="form-label">Item Name</label>
		            <input type="text" class="form-control" id="itemName" placeholder="Enter the Item name" maxlength="50">
		        </div>
		        <div class="form-group">
		            <label for="Stock" class="form-label">Stock</label>
		            <input type="number" class="form-control" id="stock" placeholder="Enter number of Stocks" maxlength="5" step="1" />
		        </div>
		        <div class="form-group">
		            <label for="Price" class="form-label">Price</label>
		            <input type="number" class="form-control" id="price" placeholder="Enter price per piece" maxlength="9">
		        </div>
		        <div class="form-group">
		            <label for="Interest" class="form-label">Interest</label>
		            <input type="number" class="form-control" id="interest" placeholder="Enter amount interest per piece" maxlength="9">
		        </div>
		        <div class="btn-group">
		            <button id="buttonSaveInventory" type="button" class="btn btn-primary">Save</button>
		            <button id="buttonCancelInventory" type="button" class="btn btn-secondary">Cancel</button>
		        </div>
		    </div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/jqInventory.js" />" ></script>
</body>
</html>
