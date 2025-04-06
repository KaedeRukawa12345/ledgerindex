$(document).ready(function(){
	
	const wrapper = document.getElementById('outputTableWrapper');
    wrapper.innerHTML = '';
    
    
    document.getElementById('outputJSON').value = "";
    document.getElementById('outputJSON').style.display = "none";
    document.getElementById('uploadExcel').value = "";
    
	document.getElementById('uploadExcel').addEventListener('change', (event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = (e) => {
                const data = new Uint8Array(e.target.result);
                const workbook = XLSX.read(data, { type: 'array', cellDates: true, dateNF: 'MM/DD/YYYY' });

                // Assuming the first sheet
                const sheetName = workbook.SheetNames[0];
                const sheet = workbook.Sheets[sheetName];

                alert('test1111');
                
                
                
                const headers = XLSX.utils.sheet_to_json(sheet, { header: 1 });
                const headersVal = headers[0];
                alert("Headers: " + headersVal.join(","));
                
                if(headersVal != 'Platform,Item,BuyerName,BuyerAddress,InvoiceNumber,InvoiceDate,Description,Quantity,PricePerItem,DateSold,TotalAmount')
            	{
                	alert('Header value of the uploaded excel file should be: Platform\nItem\nBuyerName\nBuyerAddress\nInvoiceNumber\nInvoiceDate\nDescription\nQuantity\nPricePerItem\nDateSold\nTotalAmount\nPlease follow the format.');
            	}
                else
            	{
                	// Convert to JSON
                    let json = XLSX.utils.sheet_to_json(sheet, {defval: "", raw: false });

                    json = json.map((row) => {
                        // Ensure `row` is an array, otherwise return it as-is
                        if (!Array.isArray(row)) return row;

                        return row.map((cell) => {
                            if (Object.prototype.toString.call(cell) === "[object Date]") {
                                return cell.toLocaleDateString("en-US", { 
                                    month: "2-digit", 
                                    day: "2-digit", 
                                    year: "numeric" 
                                });
                            } else if (typeof cell === "number" && cell > 10000) { 
                                // Convert Excel serial number to MM/DD/YYYY
                                const date = new Date((cell - 25569) * 86400 * 1000);
                                return date.toLocaleDateString("en-US", { 
                                    month: "2-digit", 
                                    day: "2-digit", 
                                    year: "numeric" 
                                });
                            }
                            return cell;
                        });
                    });

                    
                    // Show the data preview in table
                    displayTable(json);

                    // (Optional) Log JSON
                    console.log(json);
                    const outputJSON = document.getElementById('outputJSON');
                    //outputJSON.style.display = 'block';
                    $("#outputJSON").val(JSON.stringify(json));
                    outputJSON.textContent = JSON.stringify(json, null, 2);
            	}
                
            };

            reader.readAsArrayBuffer(file);
        }
    });
	
});


function displayTable(data) {
    // Clear any existing table
    const wrapper = document.getElementById('outputTableWrapper');
    wrapper.innerHTML = '';

    if (data.length === 0) {
        wrapper.innerHTML = '<p>No data to display!</p>';
        return;
    }

    const table = document.createElement('table');

    // Create table headers
    const thead = document.createElement('thead');
    const headerRow = document.createElement('tr');
    Object.keys(data[0]).forEach((key) => {
        const th = document.createElement('th');
        th.textContent = key;
        headerRow.appendChild(th);
    });
    thead.appendChild(headerRow);
    table.appendChild(thead);

    // Create table body
    const tbody = document.createElement('tbody');
    data.forEach((row) => {
        const tr = document.createElement('tr');
        Object.values(row).forEach((value) => {
            const td = document.createElement('td');
            td.textContent = value;
            tr.appendChild(td);
        });
        tbody.appendChild(tr);
    });
    table.appendChild(tbody);

    // Append table to the wrapper
    wrapper.appendChild(table);
}