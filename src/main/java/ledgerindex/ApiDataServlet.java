package ledgerindex;

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
//import javax.ws.rs.client.Client;
//import javax.ws.rs.client.ClientBuilder;
//import javax.ws.rs.client.WebTarget;
//import javax.ws.rs.core.MediaType;



@WebServlet("/callRestService")
public class ApiDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create client instance
        String result = "test";

        String url = "http://localhost:8090/TestWebServiceJAXRS/MyController/ctofservice";
        System.out.println("wew"); 
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        
//        try
//        {
//        	URL urlObj = new URL(url);
//            conn = (HttpURLConnection) urlObj.openConnection();
//            conn.setRequestMethod("GET");
//            
//            
//            int responseCode = conn.getResponseCode();
//            if (responseCode == HttpURLConnection.HTTP_OK) {
//                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//                StringBuilder response1 = new StringBuilder();
//                String line;
//                while ((line = reader.readLine()) != null) {
//                	response1.append(line);
//                }
//                
//                System.out.println(response1.toString());
//                response.setContentType("application/json");
//                response.getWriter().write(response1.toString());
//                
//            } else {
//            	System.out.println("testing");
//                response.getWriter().write("Failed to fetch data from the service. HTTP Status: " + responseCode);
//            }
//            
//            
//        }
//        catch(Exception e)
//        {
//        	System.out.println(e.getMessage());
//        }
//        System.out.println("test");
//        // Write the result to the response
//        response.setContentType("text");
//        response.getWriter().write(result);
        
        response.setContentType("application/json");
        
//        JsonObject
    }
}

	
