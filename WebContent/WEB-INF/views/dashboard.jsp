<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Pie Chart Example</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" >
    <link rel="stylesheet" href="<c:url value="/resources/css/dashboard.css" />" >
    
    
    
    <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
	<script src="<c:url value="/resources/js/jqDashboard.js" />" ></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<div class="chart-container">


<div style="text-align: center">
	<div>
	Item most bought
	</div>

	<div>
	    <canvas id="myPieChart" style="max-height: 300px; max-width: 300px"></canvas>
	</div>

</div>


<div style="text-align: center">
	<div>
		<div>
		Item Income and Expense Chart
		</div>
		<div>
			
			<select class="form-control" id="itemNameIncomeExpense" onchange="onChangeItemIncomeExpense()">
	<!--        		<option value="" disabled selected>Select item</option> -->
	       	</select>
		</div>
	</div>
	<div>
    <canvas id="myPieChart1" style="max-height: 300px; max-width: 300px"></canvas>
	</div>	
</div>
	
	<div>
	<canvas id="incomeExpenseChart11" style="max-height: 300px; max-width: 300px;width: 500px;"></canvas>
	</div>
</div>
</body>
</html>