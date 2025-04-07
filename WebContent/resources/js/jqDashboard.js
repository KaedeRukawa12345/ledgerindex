$(document).ready(function(){
	
//	alert('loadincome1');
//	$.ajax({
//		url: "LoadIncomeExpenseItem",
//		type: "GET",
//		data: ({
//			strUserID: '12345'
//		}),
//		success: function(data)
//		{
//			//alert("daadta" + data);
//			//alert(data);
//			var jsonData = JSON.parse(JSON.stringify(data));
//			var jsonDataLength = jsonData.length;
//			var html = '';
//			//alert("json" + 	jsonData);
////			alert('incomeandexpense:' + data);
//			$('#itemNameIncomeExpense').append(data);//.show(500);
//			//alert('test');
//			onChangeItemIncomeExpense();
//		},
//		complete : function ()
//		{
//			
//			loadSecond();
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
	
	
alert('wew11');
	$.ajax({
		url: "GetPDF",
		type: "POST",
	    xhrFields: {
	        responseType: "blob"  // Ensure we get binary data
	    },
		success: function(data)
		{
			alert("blob12345678");
			let filename = "test.pdf";
			let blob = new Blob([data], {type: "application/pdf" });
			
			
			let link = document.createElement("a");
			link.href = window.URL.createObjectURL(blob);
			link.download = filename;
			document.body.appendChild(link);
			link.click();
			document.body.removeChild(link);
		},
		complete : function ()
		{
			
		},
		error: function(xhr, status, error)
		{
			alert('wew3');
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error1:', error + status + xhr);
	        
		}	
	});
	
	
	
	
//	alert('getting data');
//	//Sample income and expense data for demonstration
//	var incomeData = [1000, 1200, 1500, 1800, 2000];
//	var expenseData = [600, 700, 800, 1000, 1200];
//	var labels = ['January', 'February', 'March', 'April', 'May'];
//
//	var ctx1 = document.getElementById('incomeExpenseChart').getContext('2d');
//
//	var incomeExpenseChart = new Chart(ctx1, {
//	    type: 'bar',
//	    data: {
//	        labels: labels,
//	        datasets: [{
//	            label: 'Income',
//	            data: incomeData,
//	            backgroundColor: 'rgba(54, 162, 235, 0.5)', // Blue color
//	            borderColor: 'rgba(54, 162, 235, 1)',
//	            borderWidth: 1
//	        }, {
//	            label: 'Expense',
//	            data: expenseData,
//	            backgroundColor: 'rgba(255, 99, 132, 0.5)', // Red color
//	            borderColor: 'rgba(255, 99, 132, 1)',
//	            borderWidth: 1
//	        }]
//	    },
//	    options: {
//	        scales: {
//	            yAxes: [{
//	                ticks: {
//	                    beginAtZero: true
//	                }
//	            }]
//	        }
//	    }
//	});
	
	
	
//	// Sample income and expense data for demonstration
//	var incomeData = [1000, 1200, 1500, 1800, 2000];
//	var expenseData = [600, 700, 800, 1000, 1200];
//	//var labels = ['January', 'February', 'March', 'April', 'May'];
//
//	var incomeExpenseChart1 = [ { "label": "Test", "value1": 12, "value2": 120},
//	    { "label": "Test1", "value1": 19, "value2": 190},
//	    { "label": "Test2", "value1": 3, "value2": 30},
//	    { "label": "Test3", "value1": 5, "value2": 50},
//	    { "label": "Test4", "value1": 2, "value2": 20},
//	    { "label": "Test5", "value1": 3, "value2": 30}];
//
//	const labelsincomeExpenseChart1 = incomeExpenseChart1.map(item => item.label);
//	const values1incomeExpenseChart1 = incomeExpenseChart1.map(item => item.value1);
//	const values2incomeExpenseChart1 = incomeExpenseChart1.map(item => item.value2);
//
//	var ctx2 = document.getElementById('incomeExpenseChart1').getContext('2d');
//
//	var incomeExpenseChart = new Chart(ctx2, {
//	    type: 'bar',
//	    data: {
//	        labels: labelsincomeExpenseChart1,
//	        datasets: [{
//	            label: 'Income',
//	            data: values1incomeExpenseChart1,
//	            backgroundColor: 'rgba(54, 162, 235, 0.5)', // Blue color
//	            borderColor: 'rgba(54, 162, 235, 1)',
//	            borderWidth: 1
//	        }, {
//	            label: 'Expense',
//	            data: values2incomeExpenseChart1,
//	            backgroundColor: 'rgba(255, 99, 132, 0.5)', // Red color
//	            borderColor: 'rgba(255, 99, 132, 1)',
//	            borderWidth: 1
//	        }]
//	    },
//	    options: {
//	        scales: {
//	            yAxes: [{
//	                ticks: {
//	                    beginAtZero: true
//	                }
//	            }]
//	        }
//	    }
//	});
	
//	var datapiechart1 = [ { "label": "Test", "value": 100 },
//		{ "label": "Test1", "value": 19 },
//		{ "label": "Test2", "value": 3 },
//		{ "label": "Test3", "value": 5 },
//		{ "label": "Test4", "value": 2 },
//		{ "label": "Test5", "value": 3 }];
//
//	const labels1 = datapiechart1.map(item => item.label);
//	const values1 = datapiechart1.map(item => item.value);
//
//	// Get the canvas element
//	var ctx = document.getElementById('myPieChart').getContext('2d');
//		
//	
//	// Create the pie chart with initial dynamic data
//	var myPieChart = new Chart(ctx, {
//	    type: 'pie',
//	    data: generateDynamicData1(labels1, values1),
//	    options: {
//	        responsive: true,
//	        maintainAspectRatio: false // Adjust aspect ratio as needed
//	    }
//	});
	
	
//	var ctx3 = document.getElementById('myPieChart1').getContext('2d');
//	
//	// Create the pie chart with initial dynamic data
//	var myPieChart1 = new Chart(ctx3, {
//	    type: 'pie',
//	    data: generateDynamicData(),
//	    options: {
//	        responsive: true,
//	        maintainAspectRatio: false // Adjust aspect ratio as needed
//	    }
//	});
	
});



function loadSecond()
{
//	alert('getdata111511');
	$.ajax({
		url: "DisplayNearOutOfStock",
		type: "POST",
		data: ({
			strUserID: '12345'
		}),
		success: function(data)
		{
			//alert("daadta" + data);
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
		
//			alert('data11: ' + data);
			
			var jsonDataCon = jsonData.split("|");
			
			var labelCon = jsonDataCon[0];
			var dataAvailCon = jsonDataCon[1];
			var dataOverallCon = jsonDataCon[2];
			
			
			var labelsChart1 = [];
			var values1Chart1 = [];
			var values2Chart1 = [];
			
			
			var labels = labelCon.split(",");
			
			for (var i = 0; i < labels.length; i++) {
				labelsChart1.push(labels[i]);
		    }
			
			
			var dataAvail = dataAvailCon.split(",");
			
			for (var i = 0; i < dataAvail.length; i++) {
				values1Chart1.push(dataAvail[i]);
		    }
			
			
			var dataOverall = dataOverallCon.split(",");
			
			for (var i = 0; i < dataOverall.length; i++) {
				values2Chart1.push(dataOverall[i]);
		    }
//			plotDataPie(labelCon, dataCon);
			
//			alert('labelsChart1: ' + labelsChart1);
//			alert('values1Chart1: ' + values1Chart1);
//			alert('values2Chart1: ' + values2Chart1);
			
			plotDisplayNearOutOfStock(labelsChart1, values1Chart1, values2Chart1);
		},
		complete : function ()
		{
			//alert('complete');
			loadThird();
		},
		error: function(xhr, status, error)
		{
				$('#promptModal').modal('show');
				$('#promptMessage').text('Error1:', error + status + xhr);
	        
		}	
	});		
}

function loadThird()
{
//	alert('ItemMostBought');
	$.ajax({
		url: "ItemMostBought",
		type: "POST",
		data: ({
			strUserID: '12345'
		}),
		success: function(data)
		{
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
//		alert('item most bought' + data);
			var jsonDataCon = jsonData.split("|");
			
			var labelCon = jsonDataCon[0];
			var dataAvailCon = jsonDataCon[1];
			
			
			var labelsChart1 = [];
			var values1Chart1 = [];
			
			
			var labels = labelCon.split(",");
			
			for (var i = 0; i < labels.length; i++) {
				labelsChart1.push(labels[i]);
		    }
			
			
			var dataAvail = dataAvailCon.split(",");
			
			for (var i = 0; i < dataAvail.length; i++) {
				values1Chart1.push(dataAvail[i]);
		    }
			
			
//			alert('labelsChart1: ' + labelsChart1);
//			alert('values1Chart1: ' + values1Chart1);
			
			plotItemMostBought(labelsChart1, values1Chart1);
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
}




function plotItemMostBought(labelsChart1, values1Chart1)
{

	// Get the canvas element
	var ctx = document.getElementById('myPieChart').getContext('2d');
		
	
	// Create the pie chart with initial dynamic data
	var myPieChart = new Chart(ctx, {
	    type: 'pie',
	    data: generateDynamicData1(labelsChart1, values1Chart1),
	    options: {
	        responsive: true,
	        maintainAspectRatio: false // Adjust aspect ratio as needed
	    }
	});
	
}

function plotDisplayNearOutOfStock(labelsChart1, values1Chart1, values2Chart1)
{
	var ctx2 = document.getElementById('incomeExpenseChart11').getContext('2d');

	var incomeExpenseChart = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: labelsChart1,
	        datasets: [{
	            label: 'Overall',
	            data: values1Chart1,
	            backgroundColor: 'rgba(54, 162, 235, 0.5)', // Blue color
	            borderColor: 'rgba(54, 162, 235, 1)',
	            borderWidth: 1
	        }, {
	            label: 'Available',
	            data: values2Chart1,
	            backgroundColor: 'rgba(255, 99, 132, 0.5)', // Red color
	            borderColor: 'rgba(255, 99, 132, 1)',
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});	
}



// Function to generate dynamic data
function generateDynamicData1(labels1, values1) {
    // Example dynamic data - replace this with your logic to fetch or generate data dynamically
    var labels = labels1;//['Red', 'Blue', 'Yellow'];
    var data = [];
    var backgroundColors = [];

    // Generate random data values and background colors
    for (var i = 0; i < labels.length; i++) {
//         data.push(i); // Random data value
        backgroundColors.push(getRandomColor()); // Random background color
    }

    return {
        labels: labels,
        datasets: [{
            data: values1,
            backgroundColor: backgroundColors
        }]
    };
}

// Function to generate a random color
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}



// Update chart data every 5 seconds
// setInterval(function() {
//     myPieChart.data = generateDynamicData();
//     myPieChart.update();
// }, 5000); // Adjust the interval time as needed




// Get the canvas element


// Function to generate dynamic data
function generateDynamicData(data) {
    // Example dynamic data - replace this with your logic to fetch or generate data dynamically
	
//	alert("split2: " + label + " and " + data);
//    var labels = label.split(",");
//    var labels2 = ['red', 'blue', 'green'];
//    alert("labels:" + labels + "length:" + labels.length);
//    var data2 = [];
//    var data = data.split(",");
//    alert("data1: " + data + "length: " + data.length);
//    var backgroundColors = [];
//
//    // Generate random data values and background colors
//    for (var i = 0; i < labels.length; i++) {
//        data2.push(Math.floor(Math.random() * 100) + 1); // Random data value
//        backgroundColors.push(getRandomColor()); // Random background color
//    }
//
//    return {
//        labels: labels,
//        datasets: [{
//            data: data,
//            backgroundColor: backgroundColors
//        }]
//    };	
	
	var labels = ['Income', 'Expense'];
    var backgroundColors = [];

    for (var i = 0; i < labels.length; i++) {
        backgroundColors.push(getRandomColor()); // Random background color
    }

    return {
        labels: labels,
        datasets: [{
            data: data,
            backgroundColor: backgroundColors
        }]
    };
}



function getData()
{
	

}

function plotDataPie(data)
{
	
//	var data = [ { "label": "Test", "value": 100 },
//		{ "label": "Test1", "value": 19 },
//		{ "label": "Test2", "value": 3 },
//		{ "label": "Test3", "value": 5 },
//		{ "label": "Test4", "value": 2 },
//		{ "label": "Test5", "value": 3 }];

	var dataOverall = data.split("|");
	var values2Chart1 = [];
	
	for (var i = 0; i < dataOverall.length; i++) {
		values2Chart1.push(dataOverall[i]);
    }
	
	var ctx3 = document.getElementById('myPieChart1').getContext('2d');
	
	// Create the pie chart with initial dynamic data
	var myPieChart1 = new Chart(ctx3, {
	    type: 'pie',
	    data: generateDynamicData(values2Chart1),
	    options: {
	        responsive: true,
	        maintainAspectRatio: false // Adjust aspect ratio as needed
	    }
	});
}


// Function to generate a random color
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}



// // Update chart data every 5 seconds
// setInterval(function() {
//     myPieChart1.data = generateDynamicData();
//     myPieChart1.update();
// }, 5000); // Adjust the interval time as needed



function onChangeItemIncomeExpense()
{
	var selectElement = $("#itemNameIncomeExpense");
	
	var selectedValue = selectElement.val().split("-");
	
//	alert('selectedvalue plotdatafile: ' + selectedValue[0] + "|" + selectedValue[1]);
	
	var chartStatus = Chart.getChart("myPieChart1");
	if(chartStatus != undefined)
	{
		chartStatus.destroy();
	}
	
	
	
	plotDataPie(selectedValue[0] + "|" + selectedValue[1]);

}







function callWebService() {
  document.getElementById("overlay").style.display = "none";
}
