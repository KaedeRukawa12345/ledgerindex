<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/inventory.css" rel="stylesheet"> -->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" >
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/inventory.css" />" > --%>
    <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
<%-- 	<script src="<c:url value="/resources/js/jqInventory.js" />" ></script> --%>
<script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
       <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<%--   <script src="<c:url value="/resources/js/jqInventory.js" />" ></script> --%>
<%--   <script src="<c:url value="/resources/js/jqTransactions.js" />" ></script> --%>
  
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    
    <style>
        body {
            display: flex;
            font-family: Arial, sans-serif;
        }
        #sidebar {
            width: 250px;
            height: 100vh;
            background: #343a40;
            color: #fff;
            transition: all 0.3s;
            position: fixed;
            padding-top: 15px;
        }
        #sidebar.active {
            margin-left: -250px;
        }
        #sidebar .nav-link {
            color: #fff;
        }
        #content {
            flex-grow: 1;
            margin-left: 250px;
            transition: all 0.3s;
        }
        #content.active {
            margin-left: 0;
        }
        .navbar {
            z-index: 1;
        }
        #sidebarCollapse
        {
        	visibility: hidden;
        }
        
        @media only screen and (max-width: 1024px)
		{
			#sidebarCollapse
	        {
	        	visibility: visible;
	        }
		}
		
		
		
		
		.loading-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: rgba(248, 249, 250, 0.9); /* Slightly transparent background */
      opacity: 0; /* Initially hidden */
      transition: opacity 0.5s ease; /* Smooth transition */
      z-index: -1;
    }
    .loading-container.show {
      opacity: 1; /* Show */
    }
    .loading-text {
      font-size: 2rem;
      font-weight: bold;
      color: #007bff; /* Color of the text */
    }
    .dot {
      animation: blink 1.5s infinite;
    }
    .dot:nth-child(2) {
      animation-delay: 0.5s;
    }
    .dot:nth-child(3) {
      animation-delay: 1s;
    }
    @keyframes blink {
      0%, 100% {
        opacity: 0;
      }
      50% {
        opacity: 1;
      }
    }
    
    </style>
</head>
<body>
<div class="loading-container" id="loading">
    <div class="loading-text">
      Loading<span class="dot">.</span><span class="dot">.</span><span class="dot">.</span>
    </div>
  </div>
    <div id="sidebar" class="bg-dark">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link load-content" id="dashboardMenu">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link load-content" id="transactionMenu">Transactions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link load-content" id="inventoryMenu">Inventory</a>
            </li>
            <li class="nav-item">
                <a class="nav-link load-content" href="#">Change Password - display the user id in the page to not set an editable page for edit. only changing of password is available as the required fields to register is the email address and name</a>
            </li>
        </ul>
    </div>
    <div id="content">
<!--         <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!--             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--                 <span class="navbar-toggler-icon"></span> -->
<!--             </button> -->
<!--             <a class="navbar-brand" href="#">Navbar</a> -->
<!--             <div class="collapse navbar-collapse" id="navbarNav"> -->
<!--                 <ul class="navbar-nav"> -->
<!--                     <li class="nav-item active"> -->
<!--                         <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> -->
<!--                     </li> -->
<!--                     <li class="nav-item"> -->
<!--                         <a class="nav-link load-content" href="Dashboard.jsp">Features</a> -->
<!--                     </li> -->
<!--                     <li class="nav-item"> -->
<!--                         <a class="nav-link" href="#">Pricing</a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </nav> -->
        <div class="container-fluid mt-3">
<!--             <button class="btn btn-primary" id="sidebarCollapse">Toggle Sidebar</button> -->
            <a id="sidebarCollapse" href="javascript:void(0)" class="closebtn btn btn-primary">&times;</a>
            <div class="container mt-3" id="main-content" style="margin-left: 0">
            <h2>Main Content</h2>
            <p>This is the main content area.</p>
            </div>
        </div>
    </div>

<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script> -->
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<!--     <script> -->
<!-- //         $(document).ready(function() { -->
            
            
<!-- // //             $('.load-content').on('click', function(event) { -->
<!-- // //                 event.preventDefault(); -->
<!-- // //                 var pageUrl = $(this).attr('href'); -->
<!-- // //                 $('#main-content').load(pageUrl); -->
<!-- // //             }); -->
<!-- //         }); -->
<!--     </script> -->
    
    
	<script src="<c:url value="/resources/js/jqInventoryDashboard.js" />" ></script>
	<script src="<c:url value="/resources/js/jqTransactionsDashboard.js" />" ></script>
	<script src="<c:url value="/resources/js/jqMain.js" />" ></script>
<%-- 	<script src="<c:url value="/resources/js/jqInventory.js" />" ></script> --%>
</body>
</html>