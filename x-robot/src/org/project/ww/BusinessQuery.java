package org.project.ww;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import net.sf.robot.util.Cache;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.StringHtml;
import net.sf.robot.util.db.TiSqlDao;


import org.apache.commons.codec.binary.Base64; 
import org.apache.commons.codec.binary.Hex;
import org.apache.log4j.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BusinessQuery {
	protected static Logger logger =  Logger.getLogger(BusinessQuery.class);
	
	public final static String INTERFACE_TYPE_IDENTIFIER = "INTERFACE_TYPE_IDENTIFIER";
	public final static String INTERFACE_TYPE_INFORMATION = "INTERFACE_TYPE_INFORMATION";
	public final static String INTERFACE_TYPE_BALANCE = "INTERFACE_TYPE_BALANCE";
	public final static String INTERFACE_TYPE_BILL = "INTERFACE_TYPE_BILL";
	public final static String INTERFACE_TYPE_SERVICE = "INTERFACE_TYPE_SERVICE";
	public final static String INTERFACE_TYPE_VOICE = "INTERFACE_TYPE_VOICE";
	public final static String INTERFACE_TYPE_SMS = "INTERFACE_TYPE_SMS";
	public final static String INTERFACE_TYPE_ADD_VALUE = "INTERFACE_TYPE_ADD_VALUE";
	public final static String INTERFACE_TYPE_TRAFFIC = "INTERFACE_TYPE_TRAFFIC";
	//public final static String INTERFACE_TYPE_POINT = "INTERFACE_TYPE_POINT";
	//public final static String INTERFACE_TYPE_POINT_COST = "INTERFACE_TYPE_POINT_COST";
	//public final static String INTERFACE_TYPE_RELATIVE_PHONE = "INTERFACE_TYPE_RELATIVE_PHONE";
	//public final static String INTERFACE_TYPE_MONTH_POINT = "INTERFACE_TYPE_MONTH_POINT";
	
	public final static String PARAMETER_PHONE = "PHONE";
	public final static String PARAMETER_MONTH = "MONTH";
	public final static String PARAMETER_DATE = "DATE";
	public final static String PARAMETER_START_TIME = "STARTTIME";
	public final static String PARAMETER_END_TIME = "ENDTIME";
	public final static String PARAMETER_PASSWORD = "PWD";
	public final static String PARAMETER_ACCESS_TIME = "ACCESSTIME";
	
	private final String key="PgtFXQTRfd3jUqm+VFP8FT5YyhxaQcc46S84IpR5XO4xmT4274oVC+liV8WaNKi0mbhNGaTXfNsEIDZqR4xNcQ==";
	
	private static TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");
	private static Cache cache = (Cache)SpringInstance.getBean("cache");
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	
	private static Pattern PACKAGE_PATTERN = Pattern.compile("\\d{2,3}元");
	

	public boolean phoneIdentify(String phone, String password)
	{
		try
		{
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			args.put(PARAMETER_PASSWORD, password);
			
			String html = query(INTERFACE_TYPE_IDENTIFIER, args);
			
			JSONObject json = new JSONObject(html);
			
			if (!"00000".equals(json.getString("status")))
				return false;
			
			return "true".equalsIgnoreCase((json.getString("content")));
		}
		catch(Exception ex)
		{
			logger.error(ex, ex);
		}
		
		return false;
	}
	
	public String query3GPackage(String phone)
	{
		String packageName = null;
		try
		{
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			
			String html = query(INTERFACE_TYPE_INFORMATION, args);
			
			JSONObject json = new JSONObject(html);
			
			JSONObject temp = json.getJSONObject("content");
			
			String productName = temp.getString("productname");
			
			Matcher m = PACKAGE_PATTERN.matcher(productName);
			if (!m.find())
				return packageName;
			
			packageName = m.group();
			
		}
		catch(Exception ex)
		{
			logger.error(ex, ex);
		}
		
		return packageName;
	}
	
	public int querySmsCount(String phone, String month)
	{
		int count = 0;
		try
		{
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			args.put(PARAMETER_MONTH, month);
			
			String html = query(INTERFACE_TYPE_SMS, args);
			
			JSONObject json = new JSONObject(html);
			
			if (!"00000".equals(json.getString("status")))
				return count;
			
			JSONArray array = json.getJSONArray("content");
			
			count = array.length();
		}
		catch(Exception ex)
		{
			logger.error(ex, ex);
		}
		
		return count;
	}
	
	public long queryTraffic(String phone, String month)
	{
		long traffic = 0;
		
		try
		{
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			args.put(PARAMETER_MONTH, month);
			
			String html = query(INTERFACE_TYPE_TRAFFIC, args);
			
			JSONObject json = new JSONObject(html);
			
			if (!"00000".equals(json.getString("status")))
				return traffic;
			
			JSONArray array = json.getJSONArray("content");
			
			
			for (int i = 0; i < array.length(); i++)
			{
				JSONObject temp = array.getJSONObject(i);
				
				try
				{
					traffic += (temp.getLong("inceptbytegross") + temp.getLong("sendbytegross"));
				}
				catch(Exception ex)
				{}
			}
		}
		catch(Exception ex)
		{
			logger.error(ex, ex);
		}
		
		return traffic;
	}
	
	
	public float queryBalance(String phone, String month) {
		float b = 0;
		try {
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			args.put(PARAMETER_DATE, month);

			String html = query(INTERFACE_TYPE_BALANCE, args);

			JSONObject json = new JSONObject(html);
			if (!"00000".equals(json.getString("status")))
				return b;

			JSONObject c = (JSONObject) json.get("content");
			b = (float) c.getDouble("feebalance");
		} catch (Exception ex) {
			logger.error(ex, ex);
		}
		return b;
	} 
	
	public float queryCost(String phone, String month)
	{
		float cost = 0;
		
		try
		{
			Map<String, String> args = new HashMap<String, String>();
			args.put(PARAMETER_PHONE, phone);
			args.put(PARAMETER_DATE, month);
			
			String html = query(INTERFACE_TYPE_BILL, args);
			
			JSONObject json = new JSONObject(html);
			
			if (!"00000".equals(json.getString("status")))
				return cost;
			
			JSONArray array = json.getJSONArray("content");
			
			for (int i = 0; i < array.length(); i++)
			{
				JSONObject temp = array.getJSONObject(i);
				
				try
				{
					cost = (float)temp.getDouble("???");
				}
				catch(Exception ex)
				{}
			}
		}
		catch(Exception ex)
		{
			logger.error(ex, ex);
		}
		
		return cost;
	}
	
	
	public String query(String type, Map<String, String> args) throws IOException, InvalidKeyException, NoSuchAlgorithmException
	{
		convertMonthToDate(args);
		
		args.put(PARAMETER_ACCESS_TIME, sdf.format(new Date()));
	    
		String link = getLinkByType(type);
		
		link = replaceParameters(link, args);
		
		int index1 = link.indexOf("?");
		int index2 = link.indexOf("accesstime=");
		int index3 = link.indexOf("&", index2 + 1);
		
		if (index3 == -1)
			index2 = link.length();
		else
			index2 = index3;
		
		String accesscode = link.substring(index1 + 1, index2);
		
		link = link + "&accesscode=" + disgest2(key, accesscode);
		
		logger.info(link);
		
		String html = StringHtml.downloadHtml(link, "UTF-8");
		
		logger.info(html);
		
		return html;
	}
	
	private void convertMonthToDate(Map<String, String> args)
	{
		String value = args.get(PARAMETER_MONTH);
		
		if (value == null)
			return;
		
		int year = Integer.parseInt(value.substring(0, 4));
		int month = Integer.parseInt(value.substring(4));
		
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, month - 1);
		c.set(Calendar.DAY_OF_MONTH, 1);
		
		args.put(PARAMETER_START_TIME, sdf1.format(c.getTime()));
		
		c.add(Calendar.MONTH, 1);
		c.add(Calendar.DAY_OF_YEAR, -1);
		
		args.put(PARAMETER_END_TIME, sdf1.format(c.getTime()));
	}
	
	private String getLinkByType(String type)
	{
		String link = (String)cache.getFromCache(type);
		
		if (link == null)
		{
			List<Map> list = (List<Map>)sqlDao.qryBySQLName("QRY_PROPERTIES_BY_NAME", new Object[]{type});
			
			if (list.size() > 0)
			{
				link = list.get(0).get("VALUE").toString();
				
				cache.putInCache(type, link);
			}
		}
		
		return link;
	}
	
	private String replaceParameters(String link, Map<String, String> args)
	{
		String parameterName;
		int index1, index2;
		
		while ((index1 = link.indexOf("${")) != -1)
		{
			index2 = link.indexOf("}", index1);
			
			parameterName = link.substring(index1 + 2, index2);
			
			link = link.replace("${" + parameterName + "}", args.get(parameterName));
		}
		
		return link;
	}
	
	private String disgest2(String key,String msg) throws InvalidKeyException, NoSuchAlgorithmException
    {
        Mac mac=Mac.getInstance("HmacMD5");
        mac.init(new SecretKeySpec(Base64.decodeBase64(key.getBytes()),"HmacMD5"));

        return new String(Hex.encodeHex(mac.doFinal(msg.getBytes()))); 
    }

}
