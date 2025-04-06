$(document).ready(function(){
	
	//$('.loading-container').removeClass('show');
	
	
	$('#sidebarCollapse').on('click', function() {
        $('#sidebar').toggleClass('active');
        $('#content').toggleClass('active');
        
        if ($('#sidebar').hasClass('active')) {
            $('#sidebarCollapse').html('&#9776');
        } else {
            $('#sidebarCollapse').html('&times');
        }
    });
	
	
	$('#dashboardMenu').on('click', function() {
		loadDashboard();
	});
	
	$(document).off('click', '#inventoryMenu').on('click', '#inventoryMenu', function (event)
	{
		
	      // Simulate loading completion after 3 seconds
		$('.loading-container').css('z-index', 9999);
//	        $('.loading-container').css('visibility', 'visible');
		$('.loading-container').addClass('show');
		
		$.ajax({
			url: "InventoryServiceMenu",
			type: "POST",
			success: function(data)
			{
				//alert("data" + data);
				
				var jsonData = JSON.parse(JSON.stringify(data));
				var jsonDataLength = jsonData.length;
				var html = '';
				//alert("json" + 	jsonData);
				
				$('#main-content').html(data);//.show(500);

			},
			complete : function ()
			{
				//alert('complete');
				
				setTimeout(function() {
//			        $('.loading-container').css('visibility', 'hidden');
					$('.loading-container').removeClass('show');
					$('.loading-container').css('z-index', -1);
			      }, 300);
			},
			error: function(xhr, status, error)
			{
				    //alert('Error1:', error + status + xhr);
		        
			}	
		});
	});
	
	
	$('#transactionMenu').on('click', function() {
		
	      // Simulate loading completion after 3 seconds
		$('.loading-container').css('z-index', 9999);
//	        $('.loading-container').css('visibility', 'visible');
		$('.loading-container').addClass('show');
		
		$.ajax({
			url: "TransactionServiceMenu",
			type: "POST",
			success: function(data)
			{
				//alert("data" + data);
				
				var jsonData = JSON.parse(JSON.stringify(data));
				var jsonDataLength = jsonData.length;
				var html = '';
				//alert("json" + 	jsonData);
				
				$('#main-content').html(data);//.show(500);

			},
			complete : function ()
			{
				//alert('complete');
				
				setTimeout(function() {
//			        $('.loading-container').css('visibility', 'hidden');
					$('.loading-container').removeClass('show');
					$('.loading-container').css('z-index', -1);
			      }, 300);
			},
			error: function(xhr, status, error)
			{
				    //alert('Error1:', error + status + xhr);
		        
			}	
		});
	});
	
	loadDashboard();
	
});


function loadDashboard()
{
	$.ajax({
		url: "DashboardServiceMenu",
		type: "POST",
		success: function(data)
		{
			//alert("data1" + data);
			
			var jsonData = JSON.parse(JSON.stringify(data));
			var jsonDataLength = jsonData.length;
			var html = '';
			//alert("json" + 	jsonData);
			
			$('#main-content').html(data);//.show(500);

		},
		complete : function ()
		{
			//alert('complete');
		},
		error: function(xhr, status, error)
		{
			    //alert('Error1:', error + status + xhr);
	        
		}	
	});	
}