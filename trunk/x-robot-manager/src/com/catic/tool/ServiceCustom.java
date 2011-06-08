package com.catic.tool;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

public class ServiceCustom {
	
	public String disgestb(String url,String msg,Map<String, String> maps){

		//ServiceCustom sc = new ServiceCustom();
		// TODO Auto-generated method stub
		// String url="http://110.1.1.21/Command/accept.htm"; tcommand=dingzhi ,tuiding
		// String phone="13258130175";
	    //String tcommand="dingzhi";
	
	    String msg3="";
	    msg3=msg;
	    String key="PgtFXQTRfd3jUqm+VFP8FT5YyhxaQcc46S84IpR5XO4xmT4274oVC+liV8WaNKi0mbhNGaTXfNsEIDZqR4xNcQ==";

	    String accesscode="";
		try { 
			accesscode = this.disgest2(key, msg3);
			  System.out.println(accesscode);
		} catch (InvalidKeyException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {	
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String fanhui="";
	    String i="";
    	try {
    	
    	maps.put("accesscode", accesscode);
    	//maps.put("date", "201001");
    	//System.out.println(phone);
    	//System.out.println(tcommand);
    	//System.out.println(systemid);
    	//System.out.println(acctname);
    	//System.out.println(accesstime);
    	///System.out.println(msg2);
    	//System.out.println(msg3);
        HttpRequester request = new HttpRequester();   
        //HttpRespons hr = request.sendGet("http://www.csdn.net");   
        
		HttpRespons hr =request.sendGet(url,maps);
		fanhui=hr.getContent();

		fanhui=new String(fanhui.getBytes(),"UTF-8");
		System.out.println(fanhui);
		// i=String.valueOf(fanhui.charAt(56));
        	
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		if("1".equals(i)){
			
    		//msg.setText("发送成功");
    		System.out.println("成功");
    	}else if("0".equals(i)){
    		
    		//msg.setText("发送失败");
    		System.out.println("失败");
    	}
		return fanhui;
	}
	public String disgesta(String url,String phone,String tcommand,String prodid,String password){

		//ServiceCustom sc = new ServiceCustom();
		// TODO Auto-generated method stub
		// String url="http://110.1.1.21/Command/accept.htm"; tcommand=dingzhi ,tuiding
		// String phone="13258130175";
	    //String tcommand="dingzhi";
	    String systemid="zhwx";
	    String acctname="10010";
	    String accesstime="";
	    Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    accesstime=sdf.format(d);
	    //System.out.println(sdf.format(d));
	    ///String msg="phone=%s&prodid=%s&tcommand=%s&systemid=%s&acctname=%s&accesstime=%s";
	    //String msg1="phone=%s&tcommand=%s&systemid=%s&acctname=%s&accesstime=%s";
	    //String msg2="phone="+phone+"&tcommand="+tcommand+"&systemid="+systemid+"&acctname="+acctname+"&accesstime="+accesstime+"";
	    String msg3="phone="+phone+"&prodid="+prodid+"&tcommand="+tcommand+"&systemid="+systemid+"&acctname="+acctname+"&accesstime="+accesstime+"";
	    String key="PgtFXQTRfd3jUqm+VFP8FT5YyhxaQcc46S84IpR5XO4xmT4274oVC+liV8WaNKi0mbhNGaTXfNsEIDZqR4xNcQ==";

	    String accesscode="";
		try { 
			accesscode = this.disgest2(key, msg3);
			  System.out.println(accesscode);
		} catch (InvalidKeyException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {	
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String fanhui="";
	    String i="";
    	try {
    	Map<String, String> maps=new HashMap<String, String>();
    	//phone="13258130175";
    	maps.put("phone", phone);
    	maps.put("prodid", prodid);
    	maps.put("tcommand", tcommand);
    	
    	maps.put("systemid", systemid);
    	maps.put("acctname", acctname);
    	maps.put("accesstime", accesstime);
    	maps.put("password", password);
    	maps.put("accesscode", accesscode);
    	//maps.put("date", "201001");
    	//System.out.println(phone);
    	//System.out.println(tcommand);
    	//System.out.println(systemid);
    	//System.out.println(acctname);
    	//System.out.println(accesstime);
    	///System.out.println(msg2);
    	//System.out.println(msg3);
        HttpRequester request = new HttpRequester();   
        //HttpRespons hr = request.sendGet("http://www.csdn.net");   
        
		HttpRespons hr =request.sendGet(url,maps);
		fanhui=hr.getContent();

		fanhui=new String(fanhui.getBytes(),"UTF-8");
		System.out.println(fanhui);
		// i=String.valueOf(fanhui.charAt(56));
        	
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		if("1".equals(i)){
			
    		//msg.setText("发送成功");
    		System.out.println("成功");
    	}else if("0".equals(i)){
    		
    		//msg.setText("发送失败");
    		System.out.println("失败");
    	}
		return fanhui;
	}
	public String disgest(String url,String phone,String tcommand,String prodid){

		//ServiceCustom sc = new ServiceCustom();
		// TODO Auto-generated method stub
		// String url="http://110.1.1.21/Command/accept.htm"; tcommand=dingzhi ,tuiding
		// String phone="13258130175";
	    //String tcommand="dingzhi";
	    String systemid="zhwx";
	    String acctname="10010";
	    String accesstime="";
	    Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    accesstime=sdf.format(d);
	    //System.out.println(sdf.format(d));
	    ///String msg="phone=%s&prodid=%s&tcommand=%s&systemid=%s&acctname=%s&accesstime=%s";
	    //String msg1="phone=%s&tcommand=%s&systemid=%s&acctname=%s&accesstime=%s";
	    //String msg2="phone="+phone+"&tcommand="+tcommand+"&systemid="+systemid+"&acctname="+acctname+"&accesstime="+accesstime+"";
	    String msg3="phone="+phone+"&prodid="+prodid+"&tcommand="+tcommand+"&systemid="+systemid+"&acctname="+acctname+"&accesstime="+accesstime+"";
	    String key="PgtFXQTRfd3jUqm+VFP8FT5YyhxaQcc46S84IpR5XO4xmT4274oVC+liV8WaNKi0mbhNGaTXfNsEIDZqR4xNcQ==";
	    
	    String accesscode="";
		try { 
			accesscode = this.disgest2(key, msg3);
			  System.out.println(accesscode);
		} catch (InvalidKeyException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {	
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String fanhui="";
	    String i="";
    	try {
    	Map<String, String> maps=new HashMap<String, String>();
    	//phone="13258130175";
    	maps.put("phone", phone);
    	maps.put("prodid", prodid);
    	maps.put("tcommand", tcommand);
    	
    	maps.put("systemid", systemid);
    	maps.put("acctname", acctname);
    	maps.put("accesstime", accesstime);
    	maps.put("accesscode", accesscode);
    	//maps.put("date", "201001");
    	//System.out.println(phone);
    	//System.out.println(tcommand);
    	//System.out.println(systemid);
    	//System.out.println(acctname);
    	//System.out.println(accesstime);
    	///System.out.println(msg2);
    	//System.out.println(msg3);
        HttpRequester request = new HttpRequester();   
        //HttpRespons hr = request.sendGet("http://www.csdn.net");   
        
		HttpRespons hr =request.sendGet(url,maps);
		fanhui=hr.getContent();

		fanhui=new String(fanhui.getBytes(),"UTF-8");
		System.out.println(fanhui);
		// i=String.valueOf(fanhui.charAt(56));
        
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		if("1".equals(i)){
    		//msg.setText("发送成功");
    		System.out.println("成功");
    	}else if("0".equals(i)){
    		//msg.setText("发送失败");
    		System.out.println("失败");
    	}
		return fanhui;
	}
	
	private String disgest2(String key,String msg) throws InvalidKeyException, NoSuchAlgorithmException
    {
        Mac mac=Mac.getInstance("HmacMD5");
        mac.init(new SecretKeySpec(Base64.decodeBase64(key.getBytes()),"HmacMD5"));
        return new String(Hex.encodeHex(mac.doFinal(msg.getBytes()))); 
    }
}
