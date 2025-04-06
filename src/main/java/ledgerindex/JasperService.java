package ledgerindex;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class JasperService {
	public byte[] generatePDFReport(List<String> data) throws JRException
	{
		System.out.println("generatePDFReport");
		InputStream reportStream = getClass().getResourceAsStream("/Blank_A4.jrxml");
		
		
		if(reportStream == null)
		{
			System.out.println("pdf null");
		}
		JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(data);
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
		
		System.out.println("reportstream: " + reportStream.toString());
		return JasperExportManager.exportReportToPdf(jasperPrint);
	}
}
