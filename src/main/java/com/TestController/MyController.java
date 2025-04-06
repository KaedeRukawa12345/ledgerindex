package com.TestController;

import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Model.InventoryLists;
import com.Model.TransactionLists;
import com.sun.jersey.core.header.ContentDisposition;

import ledgerindex.JasperService;
import net.sf.jasperreports.engine.JRException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.QueryParam;

@Controller
public class MyController {
	@RequestMapping("/")
    public ModelAndView inventory() {
        ModelAndView mav = new ModelAndView("inventory");
        //mav.addObject("message", "Hello, Spring MVC!");
        System.out.println("testingwew123");
        return mav;
    }
	
	
	@SuppressWarnings("null")
	@RequestMapping(value="/GetPDF", method = RequestMethod.POST)
	public ResponseEntity<byte[]> generateReport(HttpServletRequest request)
	{
		
		
		System.out.println("start pdf");
		List<String> test = Arrays.asList(new String("a"), new String("b"), new String("c"));
		
		byte[] pdfBytes = null;
		try {
			JasperService jasperService = new JasperService();
			System.out.println("calling");
			pdfBytes = jasperService.generatePDFReport(test);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("application/pdf"));
		headers.add("Content-Disposition", "attachment; filename=test.pdf");
		
		return new ResponseEntity<byte[]>(pdfBytes, headers, HttpStatus.OK);
		
		
	}
	
	@RequestMapping(value = "/DisplayNearOutOfStock", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String displayNearOutofStock(HttpServletRequest request, ModelMap model, @RequestParam("strUserID") String RequestUserID)
	{
		String html = "";
		String data = "";
		String label = "";
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/DisplayNearOutOfStock?" +
						"&user=" + RequestUserID.trim();
		
//		String url = "http://86.38.204.10:8080/TestWebServiceJAXRS/MyController/ctofservice/DisplayInventory";
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            String strIDCon = "";
    		String strPriceCon = "";
    		String strNameCon = "";
    		
    		
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		
//                		System.out.println(jsonObject1.getString("ID"));
//                		System.out.println(jsonObject1.getString("OverallStock"));
//                		System.out.println(jsonObject1.getString("Name"));
                		
                		strIDCon += jsonObject1.getString("Name") + ",";
                		strPriceCon += jsonObject1.getString("OverallStock") + ",";
                		strNameCon += jsonObject1.getString("AvailableStock") + ",";
                		
//                		String strIDCon = jsonObject1.getString("Name");
//                		String strPriceCon = jsonObject1.getString("OverallStock");
//                		String strNameCon = jsonObject1.getString("AvailableStock");
                		
                		
//                		data += strIDCon + "," + strPriceCon + "," + strNameCon + "|";
                		
                		
                		
//                		var incomeExpenseChart1 = [ { "label": "Test", "value1": 12, "value2": 120},
//                		                    	    { "label": "Test1", "value1": 19, "value2": 190},
//                		                    	    { "label": "Test2", "value1": 3, "value2": 30},
//                		                    	    { "label": "Test3", "value1": 5, "value2": 50},
//                		                    	    { "label": "Test4", "value1": 2, "value2": 20},
//                		                    	    { "label": "Test5", "value1": 3, "value2": 30}];
                		
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                html = strIDCon.substring(0, strIDCon.length() - 1) + "|" + strPriceCon.substring(0, strPriceCon.length() - 1) + "|" + strNameCon.substring(0, strNameCon.length() - 1);
                
                System.out.println(response1.toString());
                System.out.println("Result:" + html);
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
        
		
		model.addAttribute("Message", html);
		
		return "Success";
	}
	
	@RequestMapping(value = "/ItemMostBought", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String itemMostBought(HttpServletRequest request, ModelMap model, @RequestParam("strUserID") String RequestUserID)
	{
		String html = "";
		String data = "";
		String label = "";
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/ItemMostBought?" +
						"&user=" + RequestUserID.trim();
		
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            String strIDCon = "";
    		String strPriceCon = "";
    		String strNameCon = "";
    		
    		
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		System.out.println("jsonObject1: " + jsonObject1);
                		String strNameCheck = jsonObject1.getString("Name");
                		String strIncomeCheck = jsonObject1.getString("Income");
                		
                		if((strIncomeCheck.equals("NULL")) || (strIncomeCheck == null))
                		{
                			
                		}
                		else
                		{
                			strIDCon += strNameCheck + ",";
                			strPriceCon += strIncomeCheck + ",";
                		}
                		
                		
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                html = strIDCon.substring(0, strIDCon.length() - 1) + "|" + strPriceCon.substring(0, strPriceCon.length() - 1);
                
                System.out.println(response1.toString());
                System.out.println("Result:" + html);
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
        
		
		model.addAttribute("Message", html);
		
		return "Success";
	}
	
	
	@RequestMapping(value = "/LoadItemsForTransactions", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String loadItemsForTransactions(HttpServletRequest request, ModelMap model) 
	{
		
		String html = "";
//		html += "<option value=\"1-50.00\">Test11</option>";
//		html += "<option value=\"2-100.00\">Test21</option>";
//		html += "<option value=\"3-500.00\">Test31</option>";
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/LoadItemsForTransactions";
        
//		String url = "http://86.38.204.10:8080/TestWebServiceJAXRS/MyController/ctofservice/DisplayInventory";
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		
//                		System.out.println(jsonObject1.getString("ID"));
//                		System.out.println(jsonObject1.getString("OverallStock"));
//                		System.out.println(jsonObject1.getString("Name"));
                		
                		String strIDCon = jsonObject1.getString("ID");
                		String strPriceCon = jsonObject1.getString("PricePerStock");
                		String strNameCon = jsonObject1.getString("Name");
                		
                		html += "<option value=\"" + strIDCon + "-" + strPriceCon + "\">" + strNameCon + "</option>";
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                System.out.println(response1.toString());
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
        
		
		model.addAttribute("Message", html);
		
		return "Success";
	}
	
	
	
	@RequestMapping(value = "/LoadIncomeExpenseItem", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String loadIncomeExpenseItem(HttpServletRequest request, ModelMap model, @RequestParam("strUserID") String RequestUserID) 
	{
		System.out.println("Load Income");
		String html = "";
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/LoadIncomeExpenseItem?&UserID=" + RequestUserID.trim();
        
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		
//                		
                		String strNameCon = jsonObject1.getString("Name");
                		String strExpenseCon = (jsonObject1.getString("Expense") == null) ? "0" : jsonObject1.getString("Expense");
                		String strIncomeCon = (jsonObject1.getString("Income") == null) ? "0" : jsonObject1.getString("Income");
                		
                		html += "<option value=\"" + strIncomeCon + "-" + strExpenseCon + "\">" + strNameCon + "</option>";
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                System.out.println(response1.toString());
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
        
		
		model.addAttribute("Message", html);
		
		return "Success";
	}
	
	
	
	
	@RequestMapping(value = "/InventoryService", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String inventoryService(HttpServletRequest request, ModelMap model) {
//        ModelAndView mav = new ModelAndView("inventory");
//        mav.addObject("message", "Hello, Spring MVC!");

		JSONArray jsonArray = new JSONArray();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("ID", "1");
		jsonObject.put("Skill", "Skill1");
		
		jsonArray.put(jsonObject);
		
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("ID", "2");
		jsonObject2.put("Skill", "Skill2");
		
		jsonArray.put(jsonObject2);
		
		
		System.out.println("testingwew");
        //jsonArray.toString();
        
		System.out.println(jsonArray);
		
		ArrayList<InventoryLists> ListOfInventory = new ArrayList<InventoryLists>();
		
		
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/DisplayInventory";
        
//		String url = "http://86.38.204.10:8080/TestWebServiceJAXRS/MyController/ctofservice/DisplayInventory";
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		
                		System.out.println(jsonObject1.getString("ID"));
                		System.out.println(jsonObject1.getString("OverallStock"));
                		System.out.println(jsonObject1.getString("Name"));
                		
                		
                		InventoryLists lInventory = new InventoryLists();
                		
                		lInventory.setID(jsonObject1.getString("ID"));
                		lInventory.setNAME(jsonObject1.getString("Name"));
                		lInventory.setOVERALLSTOCK(jsonObject1.getString("OverallStock"));
                		lInventory.setAVAILABLESTOCK(jsonObject1.getString("AvailableStock"));
                		lInventory.setPRICEPERSTOCK(jsonObject1.getString("PricePerStock"));
                		lInventory.setPRICEPERSTOCKINT(jsonObject1.getString("PricePerStockInt"));
                		lInventory.setCREATEDBY(jsonObject1.getString("CreatedBy"));
//                		lInventory.setDATECREATED("DATECREATED1");
                		lInventory.setUPDATEDBY(jsonObject1.getString("UpdatedBy"));
//                		lInventory.setDATEUPDATED("DATEUPDATED1");
                		
                		ListOfInventory.add(lInventory);
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                System.out.println(response1.toString());
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");

        
//		InventoryLists lInventory = new InventoryLists();
//		
//		lInventory.setID("1");
//		lInventory.setNAME("NAME1");
//		lInventory.setOVERALLSTOCK("OVERALLSTOCK1");
//		lInventory.setCURRENTSTOCK("CURRENTSTOCK1");
//		lInventory.setAVAILABLESTOCK("AVAILABLESTOCK1");
//		lInventory.setPRICEPERSTOCK("PRICEPERSTOCK1");
//		lInventory.setPRICEPERSTOCKINT("PRICEPERSTOCKINT1");
//		lInventory.setCREATEDBY("CREATEDBY1");
//		lInventory.setDATECREATED("DATECREATED1");
//		lInventory.setUPDATEDBY("UPDATEDBY1");
//		lInventory.setDATEUPDATED("DATEUPDATED1");
//		
//		ListOfInventory.add(lInventory);
//		
//		InventoryLists lInventory2 = new InventoryLists();
//		
//		lInventory2.setID("2");
//		lInventory2.setNAME("NAME2");
//		lInventory2.setOVERALLSTOCK("OVERALLSTOCK2");
//		lInventory2.setCURRENTSTOCK("CURRENTSTOCK2");
//		lInventory2.setAVAILABLESTOCK("AVAILABLESTOCK2");
//		lInventory2.setPRICEPERSTOCK("PRICEPERSTOCK2");
//		lInventory2.setPRICEPERSTOCKINT("PRICEPERSTOCKINT2");
//		lInventory2.setCREATEDBY("CREATEDBY2");
//		lInventory2.setDATECREATED("DATECREATED2");
//		lInventory2.setUPDATEDBY("UPDATEDBY2");
//		lInventory2.setDATEUPDATED("DATEUPDATED2");
//		
//		ListOfInventory.add(lInventory2);
		
		
		model.addAttribute("ListOfInventory", ListOfInventory);

		
        
		return "ListOfInventory";
        
    }
	
	@RequestMapping(value = "/TransactionService", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String transactionService(HttpServletRequest request, ModelMap model) {
//        ModelAndView mav = new ModelAndView("inventory");
//        mav.addObject("message", "Hello, Spring MVC!");

		JSONArray jsonArray = new JSONArray();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("ID", "1");
		jsonObject.put("Skill", "Skill1");
		
		jsonArray.put(jsonObject);
		
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("ID", "2");
		jsonObject2.put("Skill", "Skill2");
		
		jsonArray.put(jsonObject2);
		
		
		System.out.println("testingwew");
        //jsonArray.toString();
        
		System.out.println(jsonArray);
		
		ArrayList<TransactionLists> ListOfTransaction = new ArrayList<TransactionLists>();
		
		
//		TransactionLists lTransaction = new TransactionLists();
//		
//		lTransaction.setID("1");
//		lTransaction.setNAME("NAME1");
//		lTransaction.setOVERALLSTOCK("OVERALLSTOCK1");
//		lTransaction.setCURRENTSTOCK("CURRENTSTOCK1");
//		lTransaction.setAVAILABLESTOCK("AVAILABLESTOCK1");
//		lTransaction.setPRICEPERSTOCK("PRICEPERSTOCK1");
//		lTransaction.setPRICEPERSTOCKINT("PRICEPERSTOCKINT1");
//		lTransaction.setCREATEDBY("CREATEDBY1");
//		lTransaction.setDATECREATED("DATECREATED1");
//		lTransaction.setUPDATEDBY("UPDATEDBY1");
//		lTransaction.setDATEUPDATED("DATEUPDATED1");
//		
//		ListOfTransaction.add(lTransaction);
//		
//		TransactionLists lTransaction2 = new TransactionLists();
//		
//		lTransaction2.setID("2");
//		lTransaction2.setNAME("NAME2");
//		lTransaction2.setOVERALLSTOCK("OVERALLSTOCK2");
//		lTransaction2.setCURRENTSTOCK("CURRENTSTOCK2");
//		lTransaction2.setAVAILABLESTOCK("AVAILABLESTOCK2");
//		lTransaction2.setPRICEPERSTOCK("PRICEPERSTOCK2");
//		lTransaction2.setPRICEPERSTOCKINT("PRICEPERSTOCKINT2");
//		lTransaction2.setCREATEDBY("CREATEDBY2");
//		lTransaction2.setDATECREATED("DATECREATED2");
//		lTransaction2.setUPDATEDBY("UPDATEDBY2");
//		lTransaction2.setDATEUPDATED("DATEUPDATED2");
//		
//		ListOfTransaction.add(lTransaction2);
		
		
		
		
		
		
String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/DisplayTransaction/12345";
        
//		String url = "http://86.38.204.10:8080/TestWebServiceJAXRS/MyController/ctofservice/DisplayInventory";
		System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response1 = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
                	System.out.println(strCon[1].toString());
                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
                	for(int i = 0; i <jsonArray1.length(); i++)
                	{
                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
                		
//                		System.out.println(jsonObject1.getString("ID"));
//                		System.out.println(jsonObject1.getString("OverallStock"));
//                		System.out.println(jsonObject1.getString("Name"));
                		
                		
                		TransactionLists lTransaction3 = new TransactionLists();
//                		
//                		<td><div id="currentStock${items.ID}" class="elipsis" value="${items.ITEMTOTAL}">${items.ITEMTOTAL}</div></td>
//						<td><div id="availableStock${items.ID}" class="elipsis" value="${items.ACTUALPRICE}">${items.ACTUALPRICE}</div></td>
//						<td><div id="pricePerStock${items.ID}" class="elipsis" value="${items.ITEMSOLDPRICE}">${items.ITEMSOLDPRICE}</div></td>
//						<td><div id="pricePerStockInt${items.ID}" class="elipsis" value="${items.DATESOLD}">${items.DATESOLD}</div></td>
//						<td><div id="totalSold${items.ID}" class="elipsis" value="${items.TOTALSOLD}">${items.TOTALSOLD}</div></td>
//					</tr
//                		
                		lTransaction3.setID(jsonObject1.getString("ID"));
                		lTransaction3.setNAME(jsonObject1.getString("Name"));
                		lTransaction3.setOTHERS(jsonObject1.getString("Others"));
                		System.out.println("wew-" + jsonObject1.getString("Others"));
                		lTransaction3.setDISPLAYNAME(jsonObject1.getString("DisplayName"));
                		lTransaction3.setPLATFORM(jsonObject1.getString("Platform"));
                		lTransaction3.setPLATFORMDISPLAY(jsonObject1.getString("PlatformDisplay"));
                		lTransaction3.setITEMTOTAL(jsonObject1.getString("ItemTotal"));
                		lTransaction3.setACTUALPRICE(jsonObject1.getString("ActualPrice"));
                		lTransaction3.setITEMSOLDPRICE(jsonObject1.getString("ItemSoldPrice"));
                		lTransaction3.setDATESOLD(jsonObject1.getString("DateSold"));
                		lTransaction3.setTOTALSOLD(jsonObject1.getString("TotalSold"));
                		
                		
                		lTransaction3.setBUYERADDRESS(jsonObject1.getString("BuyerAddress"));
                		lTransaction3.setINVOICE(jsonObject1.getString("Invoice"));
                		lTransaction3.setDATEINVOICE(jsonObject1.getString("DateInvoice"));
                		lTransaction3.setDESCRIPTION(jsonObject1.getString("Description"));
                		lTransaction3.setBUYERNAME(jsonObject1.getString("BuyerName"));
                		System.out.println("testing1:" + jsonObject1.getString("BuyerName"));
                		ListOfTransaction.add(lTransaction3);
                		
                	}
                	
                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                System.out.println(response1.toString());
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
            System.out.println("errro");
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		model.addAttribute("ListOfTransactions", ListOfTransaction);

		
        
		return "ListOfTransactions";
        
    }
	
	
	@RequestMapping(value = "/DashboardServiceMenu", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String dashboardServiceMenu(HttpServletRequest request, ModelMap model) {
        
		System.out.println("wew");
		return "dashboard";
        
    }
	
	
	@RequestMapping(value = "/TransactionServiceMenu", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String transactionServiceMenu(HttpServletRequest request, ModelMap model) {
        
		return "transaction";
        
    }
	
	
	@RequestMapping(value = "/InventoryServiceMenu", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String inventoryServiceMenu(HttpServletRequest request, ModelMap model) {
        
		return "inventory";
        
    }
	
	
	@RequestMapping(value = "/InventoryServiceSave", method = RequestMethod.POST)
	public String inventoryServiceSave(HttpServletRequest request, ModelMap model,
			@RequestParam("strType") String RequestType,
			@RequestParam("strSelID") String RequestSelID,
			@RequestParam("strItemName") String RequestItemName,
			@RequestParam("strStock") String RequestStock,
			@RequestParam("strPrice") String RequestPrice,
			@RequestParam("strInterest") String RequestInterest,
			@RequestParam("strUserID") String RequestUserID)
	{
		System.out.println("ID: " + RequestSelID + "Value: " + RequestItemName + RequestStock + RequestPrice + RequestInterest);
		
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/SaveInventory?" +
						"Type=" + RequestType.trim() +
						"&SelID=" + RequestSelID.trim() +
						"&ItemName=" + RequestItemName.trim() +
						"&StockCount=" + RequestStock.trim() +
						"&Price=" + RequestPrice.trim() +
						"&Interest=" + RequestInterest.trim() +
						"&UserID=" + RequestUserID.trim();
        
		
//			String url = "http://86.38.204.10:8080/TestWebServiceJAXRS/MyController/ctofservice/SaveInventory?" +
//					"Type=" + RequestType.trim() +
//					"&SelID=" + RequestSelID.trim() +
//					"&ItemName=" + RequestItemName.trim() +
//					"&StockCount=" + RequestStock.trim() +
//					"&Price=" + RequestPrice.trim() +
//					"&Interest=" + RequestInterest.trim() +
//					"&UserID=" + RequestUserID.trim();
			
			
		System.out.println("wew12345"); 
		
		System.out.println("URL " + url);
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        StringBuilder response1 = new StringBuilder();
        
        try
        {
        	URL urlObj = new URL(url);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("POST");
            
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                	response1.append(line);
                	
                	String strCon[] = line.split("Output: ");
                	
//                	System.out.println(strCon[1].toString());
//                	JSONArray jsonArray1 = new JSONArray(strCon[1].toString());
//                	for(int i = 0; i <jsonArray1.length(); i++)
//                	{
//                		JSONObject jsonObject1 = jsonArray1.getJSONObject(i);
//                		
//                		System.out.println(jsonObject1.getString("ID"));
//                		System.out.println(jsonObject1.getString("OverallStock"));
//                		System.out.println(jsonObject1.getString("Name"));
//                		
//                		
//                		InventoryLists lInventory = new InventoryLists();
//                		
//                		lInventory.setID(jsonObject1.getString("ID"));
//                		lInventory.setNAME(jsonObject1.getString("Name"));
//                		lInventory.setOVERALLSTOCK(jsonObject1.getString("OverallStock"));
//                		lInventory.setAVAILABLESTOCK(jsonObject1.getString("AvailableStock"));
//                		lInventory.setPRICEPERSTOCK(jsonObject1.getString("PricePerStock"));
//                		lInventory.setPRICEPERSTOCKINT(jsonObject1.getString("PricePerStockInt"));
//                		lInventory.setCREATEDBY(jsonObject1.getString("CreatedBy"));
////                		lInventory.setDATECREATED("DATECREATED1");
//                		lInventory.setUPDATEDBY(jsonObject1.getString("UpdatedBy"));
////                		lInventory.setDATEUPDATED("DATEUPDATED1");
//                		
//                		ListOfInventory.add(lInventory);
//                		
//                	}
//                	
//                	System.out.println("JSON Array: " + jsonArray1);
                	
                	
                }
                
                System.out.println(response1.toString());
                
                
                
            } else {
            	System.out.println("testing");
            }
            
            
        }
        catch(Exception e)
        {
        	System.out.println(e.getMessage());
        }
        System.out.println("test");
        
        
		
		model.addAttribute("Message", response1.toString());
		
		return "Success";
		
	}
	
	@RequestMapping(value = "/TransactionServiceUploadSave", method = RequestMethod.POST)
	public String TransactionServiceUploadSave(HttpServletRequest request, ModelMap model, 
			@RequestParam("strTransactions") String RequestTypeTransactions,
			@RequestParam("strUserID") String RequestUserID)
	
	{
		
		String strMsg = "";
		
		//System.out.println(RequestTypeTransactions);
		//System.out.println(RequestUserID);
		
		RequestTypeTransactions = RequestTypeTransactions.replace("[", "").replace("]", "");
		
		String splitCon[] = RequestTypeTransactions.split("},");

		StringBuilder sbTest = new StringBuilder();
		
		//System.out.println(splitCon.length);
		for(int i=0; i<splitCon.length; i++)
		{
			System.out.println("wew: " + splitCon[i].trim());
			
			String strConOne = splitCon[i].trim().replace("{", "");
			String strConOneCon[] = strConOne.split("\n");
			
			for(int j=0; j<strConOneCon.length; j++)
			{
				String test = strConOneCon[j].trim().replace("\n", "");
				if((!test.trim().equals("")) || (!test.trim().equals("}")))
				{
					System.out.println("data: " + test.trim());
					
					String strConTwo = test.replace("{", "").replace("}", "");
					String strConTwoCon[] = strConTwo.split(",");
					
					
					String strPlatform = "";
					String strItem = "";
					String strBuyerName = "";
					String strBuyerAddress = "";
					String strInvoiceNumber = "";
					String strInvoiceDate = "";
					String strDescription = "";
					String strQuantity = "";
					String strPricePerItem = "";
					String strDateSold = "";
					String strTotalAmount = "";
					
					strPlatform = strConTwoCon[0].split(":")[1].toString().replaceAll("\"", "");
					strItem = strConTwoCon[1].split(":")[1].toString().replaceAll("\"", "");
					strBuyerName = strConTwoCon[2].split(":")[1].toString().replaceAll("\"", "");
					strBuyerAddress = strConTwoCon[3].split(":")[1].toString().replaceAll("\"", "");
					strInvoiceNumber = strConTwoCon[4].split(":")[1].toString().replaceAll("\"", "");
					strInvoiceDate = strConTwoCon[5].split(":")[1].toString().replaceAll("\"", "");
					strDescription = strConTwoCon[6].split(":")[1].toString().replaceAll("\"", "");
					strQuantity = strConTwoCon[7].split(":")[1].toString().replaceAll("\"", "");
					strPricePerItem = strConTwoCon[8].split(":")[1].toString().replaceAll("\"", "");
					strDateSold = strConTwoCon[9].split(":")[1].toString().replaceAll("\"", "");
					System.out.println("strDateSold: " + strDateSold);
					strTotalAmount = strConTwoCon[10].split(":")[1].toString().replaceAll("\"", "");
					
//					System.out.println("test2:" + strPlatform);
//					System.out.println("test2:" + strItem);
//					System.out.println("test2:" + strBuyerName);
//					System.out.println("test2:" + strBuyerAddress);
//					System.out.println("test2:" + strInvoiceNumber);
//					System.out.println("test2:" + strInvoiceDate);
//					System.out.println("test2:" + strDescription);
//					System.out.println("test2:" + strQuantity);
//					System.out.println("test2:" + strPricePerItem);
//					System.out.println("test2:" + strDateSold);
//					System.out.println("test2:" + strTotalAmount);
					
					String strMsgUpload = "";
					strMsgUpload = SaveUploadTransaction(strPlatform,
							strItem,
							strQuantity,
							strPricePerItem,
							strTotalAmount,
							strDateSold,
							RequestUserID,
							strBuyerName,
							strBuyerAddress,
							strInvoiceNumber,
							strInvoiceDate,
							strDescription);
					System.out.println("testing123: " + strMsgUpload);
					if(!strMsgUpload.trim().equals(""))
					{
						sbTest.append("Invoice Number: " + strInvoiceNumber + " has an error: " + strMsgUpload);
						sbTest.append("\n");
						sbTest.append("\n");
					}
					
				}
				
				
				
				
			}
		}
		
		
		
		
		System.out.println("done");
		
		model.addAttribute("Message", sbTest);
		
		return "Success";
		
	}
	
	private String SaveUploadTransaction(String pPlatform,
			String pStockID,
			String pItemCount,
			String pPricePerItem,
			String pTotal,
			String pDateSold,
			String pUserID,
			String pBuyerName,
			String pBuyerAddress,
			String pInvoiceNumber,
			String pDateInvoice,
			String pDescription)
	{
		String strMsg = "";
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/SaveUploadTransaction?" +
				"Platform=" + pPlatform.trim() +
				"&StockID=" + pStockID.trim() +
				"&ItemCount=" + pItemCount.trim() +
				"&PricePerItem=" + pPricePerItem.trim() +
				"&Total=" + pTotal.trim() +
				"&DateSold=" + pDateSold.trim() +
				"&UserID=" + pUserID.trim() +
				"&BuyerName=" + pBuyerName.trim() +
				"&BuyerAddress=" + pBuyerAddress.trim() +
				"&InvoiceNumber=" + pInvoiceNumber.trim() +
				"&DateInvoice=" + pDateInvoice.trim() +
				"&Description=" + pDescription.trim();



		System.out.println("wew12345"); 
		
		System.out.println("URL " + url);
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		
		StringBuilder response1 = new StringBuilder();
		
		try
		{
			URL urlObj = new URL(url);
		    conn = (HttpURLConnection) urlObj.openConnection();
		    conn.setRequestMethod("POST");
		    
		    
		    int responseCode = conn.getResponseCode();
		    if (responseCode == HttpURLConnection.HTTP_OK) {
		        reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line;
		        while ((line = reader.readLine()) != null) {
		        	response1.append(line);
		        	
		        	String strCon[] = line.split("Message");
		        	strMsg = strCon[1].trim().toString().substring(3, strCon[1].trim().toString().length() - 2);
		        	
		        }
		        
//		        strMsg = response1.toString();
		        System.out.println(response1.toString());
		        
		        
		        
		    } else {
		    	System.out.println("responseCode:" + responseCode);
		    }
		    
		    
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return strMsg;
	}
	
	@RequestMapping(value = "/TransactionServiceSave", method = RequestMethod.POST)
	public String transactionServiceSave(HttpServletRequest request, ModelMap model, 
			@RequestParam("strTypeID") String RequestType,
			@RequestParam("strSelID") String RequestSelID,
			@RequestParam("strPlatform") String RequestPlatform,
			@RequestParam("strOthers") String RequestOthers,
			@RequestParam("strStockID") String RequestStockID,
			@RequestParam("strItemCount") String RequestItemCount,
			@RequestParam("strActualPrice") String RequestActualPrice,
			@RequestParam("strItemPrice") String RequestItemPrice,
			@RequestParam("strTotal") String RequestTotal,
			@RequestParam("strDateSold") String RequestDateSold,
			@RequestParam("strUserID") String RequestUserID,
			@RequestParam("strBuyerName") String RequestBuyerName,
			@RequestParam("strBuyerAddress") String RequestBuyerAddress,
			@RequestParam("strInvoiceNumber") String RequestInvoiceNumber,
			@RequestParam("strDateInvoice") String RequestDateInvoice,
			@RequestParam("strDescription") String RequestDescription)
	
	{
		
		System.out.println(RequestType);
		System.out.println(RequestSelID);
		System.out.println(RequestPlatform);
		System.out.println(RequestOthers);
		System.out.println(RequestOthers);
		System.out.println(RequestStockID);
		System.out.println(RequestItemCount);
		System.out.println(RequestActualPrice);
		System.out.println(RequestItemPrice);
		System.out.println(RequestTotal);
		System.out.println(RequestDateSold);
		System.out.println(RequestUserID);
		
//		@QueryParam("Type") String pType,
//		@QueryParam("SelID") String pSelID,
//		@QueryParam("Platform") String pPlatform,
//		@QueryParam("StockID") String pStockID,
//		@QueryParam("ItemCount") String pItemCount,
//		@QueryParam("ActualPrice") String pActualPrice,
//		@QueryParam("PricePerItem") String pPricePerItem,
//		@QueryParam("Total") String pTotal,
//		@QueryParam("DateSold") String pDateSold,
//		@QueryParam("UserID") String pUserID)
//
//
//		
		String strPlatForm = "";
		if(!RequestOthers.trim().equals(""))
		{
			strPlatForm = RequestOthers.trim();
		}
		else
		{
			strPlatForm = RequestPlatform.trim();
		}
		
		String strStockIDSplit[] = RequestStockID.trim().split("-");
		String strStockIDNum = strStockIDSplit[0].trim();
		
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/SaveTransaction?" +
				"Type=" + RequestType.trim() +
				"&SelID=" + RequestSelID.trim() +
				"&Platform=" + RequestPlatform.trim() +
				"&Others=" + RequestOthers.trim() +
				"&StockID=" + strStockIDNum.trim() +
				"&ItemCount=" + RequestItemCount.trim() +
				"&ActualPrice=" + RequestActualPrice.trim() +
				"&PricePerItem=" + RequestItemPrice.trim() +
				"&Total=" + RequestTotal.trim() +
				"&DateSold=" + RequestDateSold.trim() +
				"&UserID=" + RequestUserID.trim() +
				"&BuyerName=" + RequestBuyerName.trim() +
				"&BuyerAddress=" + RequestBuyerAddress.trim() +
				"&InvoiceNumber=" + RequestInvoiceNumber.trim() +
				"&DateInvoice=" + RequestDateInvoice.trim() +
				"&Description=" + RequestDescription.trim();


		System.out.println("wew12345"); 
		
		System.out.println("URL " + url);
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		
		StringBuilder response1 = new StringBuilder();
		
		try
		{
			URL urlObj = new URL(url);
		    conn = (HttpURLConnection) urlObj.openConnection();
		    conn.setRequestMethod("POST");
		    
		    
		    int responseCode = conn.getResponseCode();
		    if (responseCode == HttpURLConnection.HTTP_OK) {
		        reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line;
		        while ((line = reader.readLine()) != null) {
		        	response1.append(line);
		        	
		        	String strCon[] = line.split("Output: ");
		        	
		        }
		        
		        System.out.println(response1.toString());
		        
		        
		        
		    } else {
		    	System.out.println("testing");
		    }
		    
		    
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		System.out.println("test");
		
		
		
		model.addAttribute("Message", response1.toString());
		
		return "Success";
		
	}
	
	
	@RequestMapping(value = "/TransactionServiceDelete", method = RequestMethod.POST)
	public String transactionServiceDelete(HttpServletRequest request, ModelMap model,
			@RequestParam("strSelID") String RequestSelID,
			@RequestParam("strUserID") String RequestUserID)
	{
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/DeleteTransaction?" +
				"&SelID=" + RequestSelID.trim() +
				"&UserID=" + RequestUserID.trim();


		System.out.println("wew12345"); 
		
		System.out.println("URL " + url);
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		
		StringBuilder response1 = new StringBuilder();
		
		try
		{
			URL urlObj = new URL(url);
		    conn = (HttpURLConnection) urlObj.openConnection();
		    conn.setRequestMethod("POST");
		    
		    
		    int responseCode = conn.getResponseCode();
		    if (responseCode == HttpURLConnection.HTTP_OK) {
		        reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line;
		        while ((line = reader.readLine()) != null) {
		        	response1.append(line);
		        	
		        	String strCon[] = line.split("Output: ");
		        	
		        }
		        
		        System.out.println(response1.toString());
		        
		        
		        
		    } else {
		    	System.out.println("testing");
		    }
		    
		    
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		System.out.println("test");
		
		
		
		model.addAttribute("Message", response1.toString());
		
		return "Success";
	}
	
	@RequestMapping(value = "/InventoryServiceDelete", method = RequestMethod.POST)
	public String inventoryServiceDelete(HttpServletRequest request, ModelMap model, 
			@RequestParam("strSelID") String RequestSelID,
			@RequestParam("strUserID") String RequestUserID)
	{
		String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice/DeleteInventory?" +
				"&SelID=" + RequestSelID.trim() +
				"&UserID=" + RequestUserID.trim();


		System.out.println("wew12345"); 
		
		System.out.println("URL " + url);
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		
		StringBuilder response1 = new StringBuilder();
		
		try
		{
			URL urlObj = new URL(url);
		    conn = (HttpURLConnection) urlObj.openConnection();
		    conn.setRequestMethod("POST");
		    
		    
		    int responseCode = conn.getResponseCode();
		    if (responseCode == HttpURLConnection.HTTP_OK) {
		        reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line;
		        while ((line = reader.readLine()) != null) {
		        	response1.append(line);
		        	
		        	String strCon[] = line.split("Output: ");
		        	
		        }
		        
		        System.out.println(response1.toString());
		        
		        
		        
		    } else {
		    	System.out.println("testing");
		    }
		    
		    
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		System.out.println("test");
		
		
		
		model.addAttribute("Message", response1.toString());
		
		return "Success";
	}
	
	
	@RequestMapping(value = "/wew", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String wew(HttpServletRequest request, ModelMap model) {
        
		System.out.println("dashboard11");
		return "dashboard";
        
    }
}
