<!-- WebContent/index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jQueryFunctions.js"></script>
</head>
<body>
    <%@ include file="jsp/header.jsp" %>
    <div class="container mt-5">
        <h1>Welcome to the Home Page</h1>
        <p>This is the home page of the application.</p>
    </div>
    <%@ include file="jsp/footer.jsp" %>
    
    
    
    
    
    <button onclick="callWebService2()">Fetch API Data</button>
    <button onclick="callWebService()">Call Web Service</button>
    <pre id="response"></pre>
	
	
    <script>
//         function fetchData() {
//             fetch('api-data')
//                 .then(response => response.json())
//                 .then(data => {
//                     document.getElementById('response').innerText = JSON.stringify(data, null, 2);
//                 })
//                 .catch(error => {
//                     console.error('Error fetching data:', error);
//                     document.getElementById('response').innerText = 'Error fetching data: ' + error.message;
//                 });
//         }
    
    
    
//     function callWebService() {
//             var xhr = new XMLHttpRequest();
//             xhr.open("GET", "callRestService", true);
//             xhr.onreadystatechange = function() {
//                 if (xhr.readyState == 4 && xhr.status == 200) {
//                     var result = JSON.parse(xhr.responseText);
//                     document.getElementById("result").innerHTML = result;
//                 }
//             };
//             xhr.send();
//         }
    
    </script>
</body>
</html>
