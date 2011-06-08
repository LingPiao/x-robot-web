package com.catic.bean;

import com.catic.tool.*;

import java.sql.*;
import java.util.*;

/**
* <p>Title: </p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2009</p>
* <p>Company: </p>
* @version 1.0
*/

public class BCManagerAction {
	String sTable = "BC_INFO";
	String sField = "";
	String sCond = "";
	String ErrorStr="";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData =null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public BCManagerAction() {
		dataConn = new DataConn();
	}
	//�������ݿ���ڵ����Ϣ
	public List getRootInfo() {
		queryData = new QueryData(dataConn);
		String sql="select CLASSID,CLASSNAME,CHILD, (SELECT ClassID FROM  (SELECT * FROM BC_INFO ORDER BY ClassID desc) WHERE ROWNUM <= 1) as lastid from BC_INFO where Depth=0 order by ClassID";
		java.util.List list = new ArrayList();
		try{
			
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("CLASSID",rs.getInt("CLASSID"));
				map.put("CLASSNAME",rs.getString("CLASSNAME"));
				map.put("CHILD",rs.getInt("CHILD"));
				map.put("lastid",rs.getInt("lastid"));
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
	
	//���ݸ��ڵ��г����иø��ڵ�������ӽڵ�
	//sql="select *,(select top 1 ClassID from ArticleClass where ParentID="& id &" order by OrderID desc) as lastid from ArticleClass where ParentID="& id &" order by OrderID"
	public List getChildInfoByParentId(String nParentid) {
		queryData = new QueryData(dataConn);
		String sql="select CLASSID,CLASSNAME,CHILD, (SELECT ClassID FROM  (SELECT * FROM BC_INFO ORDER BY ClassID desc) WHERE ParentID='"+ nParentid +"' and ROWNUM <= 1) as lastid from BC_INFO where  ParentID='"+ nParentid +"' order by ClassID";
		java.util.List list = new ArrayList();
		try{
			
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("CLASSID",rs.getInt("CLASSID"));
				map.put("CLASSNAME",rs.getString("CLASSNAME"));
				map.put("CHILD",rs.getInt("CHILD"));
				map.put("lastid",rs.getInt("lastid"));
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
	
	
	//��������id��ȡ�����������
	public List getInfoByClassid(String nclass) {
		queryData = new QueryData(dataConn);
		String sql="select * from BC_INFO where ClassID="+nclass;
		//System.out.println(sql);
		java.util.List list = new ArrayList();
		String content="";
		try{
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
		
			if (rs.next())
			{
				Map map = new HashMap();
				map.put("CLASSID",rs.getInt("CLASSID"));
				map.put("CLASSNAME",rs.getString("CLASSNAME"));
				map.put("PARENTID",rs.getInt("PARENTID"));
				map.put("PARENTPATH",rs.getString("PARENTPATH"));
				map.put("DEPTH",rs.getInt("DEPTH"));
				map.put("ROOTID",rs.getInt("ROOTID"));
				map.put("CHILD",rs.getInt("CHILD"));
				map.put("ORDERID",rs.getInt("ORDERID"));
				map.put("CODES",rs.getString("CODES"));
				if(rs.getString("INFOCONTENT")==null)
					content="";
				else
					content = rs.getString("INFOCONTENT");
				map.put("INFOCONTENT",content);
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
	public String FAddCheck(String nParentID, String sClassName,String codes) throws Exception { 
		//'�����Ӽ�麯�������Ϊ0��ʾͨ����飬Ϊ1��ʾ�д��������д�����ʱ�˳���������������Ϣд��������ErrorStr
		queryData = new QueryData(dataConn);
		String FAddCheck="0";
		String sql="";
		if (sClassName.equals(""))
		{
			//'����Ϊ��
			FAddCheck="1";
			ErrorStr="��������Ϊ�գ�";
		}
		else
		{
			if (nParentID.equals(""))
			{
				//'��idΪ��
				FAddCheck="1";
				ErrorStr="��id����Ϊ�գ�";
			}
			else
			{
				try
				{
					if (!nParentID.equals("0"))
					{
						sql="select ClassID From BC_INFO where ClassID=" +nParentID;
						//'����𲻴���
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if (!rs.next())
						{
							FAddCheck="1";
							ErrorStr="������𲻴��ڻ��Ѿ���ɾ����";
							rs.close();
						}
						else
						{
							sql="select ClassID from BC_INFO where ClassName='"+ sClassName +"' and ParentID="+ nParentID;	//	'�����ظ�
							queryData.setRecordSet(sql);
							rs = queryData.getResultSet();
							if(rs.next())
							{
								FAddCheck="1";
								ErrorStr="�����ظ���";
							}
							rs.close();
							sql="select ClassID from BC_INFO where CODES='"+ codes +"'";	//	'ָ���ظ�
							queryData.setRecordSet(sql);
							rs = queryData.getResultSet();
							if(rs.next())
							{
								FAddCheck="1";
								ErrorStr="ָ���ظ���";
							}
							rs.close();
						}
					}
					else
					{
						sql="select ClassID from BC_INFO where ClassName='"+sClassName+"' and ParentID="+nParentID	;//	'�����ظ�
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if(rs.next())
						{
							FAddCheck="1";
							ErrorStr="�����ظ���";
						}
						rs.close();
						sql="select ClassID from BC_INFO where CODES='"+ codes +"'";	//	'ָ���ظ�
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if(rs.next())
						{
							FAddCheck="1";
							ErrorStr="ָ���ظ���";
						}
						rs.close();
					}
					
					dataConn.close();
					queryData.close();
				}
				catch (Exception e) { 
					throw e; 
				}
			}
		}
		return ErrorStr;
	}
	
	public boolean ClassAdd(String classid,String classname,String infocon,String codes) {
		queryData = new QueryData(dataConn);
		insertData = new InsertData(dataConn);
		updateData = new UpdateData(dataConn);
		boolean flag = false;
		int maxClassID=0,maxRootID=0,nClassID=0,nRootID=0,nDepth=0,nOrderID=0,nChild=0;
		int prevOrderID =0;
		String nParentID = classid;
		String sParentPath="";
		String sql="";
		try {
			sql="select Max(ClassID) from BC_INFO";//	'���ҵ�ǰ���ݿ����������id�����û������������Ϊ0��Ҫ��������idΪ��ǰ���id��1
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
			if(rs.next())
				maxClassID=rs.getInt(1);
			rs.close();		
			nClassID=maxClassID+1;
			//System.out.println("nClassID"+nClassID);
			sql="select max(rootid) From BC_INFO";	//'���ҵ�ǰ���ݿ������ĸ�id�����û������������Ϊ0��Ҫ����ĸ�idΪ��ǰ����id��1
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
			if(rs.next())
				maxRootID=rs.getInt(1);
			rs.close();
			nRootID=maxRootID+1;
			//System.out.println("nrootid"+nRootID);
			sql="select RootID,Depth,ParentPath,Child,OrderID From BC_INFO where ClassID="+ nParentID;//	'���Ҹ������Ӧ��Ϣ
			queryData.setRecordSet(sql);
			rs = queryData.getResultSet();
			if(rs.next())
			{
				nRootID=rs.getInt("Rootid");//		'��id�븸����id��ͬ
				sParentPath=rs.getString("ParentPath")+ "," +nParentID;
				if (Integer.parseInt((nParentID))>0)//	'��id����0���и���𣬹�Ҫ�����������ȸ�������ȼ�1����id������0��ǰҪ��������Ϊ����������Ϊ0
					nDepth=rs.getInt("Depth")+1;
				else
					nDepth=0;
				
				
				if (rs.getInt("Child")>0)
				{
					//�õ��뱾��Ŀͬ�������һ����Ŀ��OrderID
					ResultSet rsPrevOrderID=null;
					sql="select Max(OrderID) From BC_INFO where ParentID=" + nParentID;
					queryData.setRecordSet(sql);
					rsPrevOrderID = queryData.getResultSet();
					if(rsPrevOrderID.next())
						prevOrderID=rsPrevOrderID.getInt(1);
					rsPrevOrderID.close();
					//�õ�ͬһ����Ŀ���ȱ���Ŀ�����������Ŀ�����OrderID�������ǰһ��ֵ����������ֵ��
					sql="select Max(OrderID) From BC_INFO where ParentPath like '" + sParentPath + ",%'";
					queryData.setRecordSet(sql);
					rsPrevOrderID = queryData.getResultSet();
					if (rsPrevOrderID.next())
					{
						int temp = rsPrevOrderID.getInt(1);
					 	if (temp>prevOrderID) 
							prevOrderID=temp;			
					}
					rsPrevOrderID.close();
				}
				nOrderID=prevOrderID+1;
			}
			else
			{
				nOrderID=0;
				sParentPath="0";
				nDepth=0;
			}
			rs.close();
			nChild=0;
			String sta = "BC_INFO";
			String sfi = "ClassID,ClassName,ParentID,ParentPath,Depth,RootID,Child,OrderID,INFOCONTENT,CODES";
			String sva = ""+ nClassID+",'"+ classname+"',"+ nParentID+",'"+ sParentPath+"',"+ nDepth+","+ nRootID +","+ nChild +","+ nOrderID +",'"+ infocon+"','"+codes+"'";		    
		    int iReturn = insertData.insert(sta, sfi, sva);
		    //�����丸�������Ŀ��
		    int iReturn1=0;
		    if (Integer.parseInt(nParentID)>0 )
		    {
		    	
		    	sfi = "child=child+1";
				sva = "ClassID='"+nParentID+"'";
				iReturn1 = updateData.update(sta, sfi, sva);
		    }
			//���¸���Ŀ�����Լ����ڱ���Ҫ��ͬ�ڱ������µ���Ŀ�������
		    int iReturn2=0;
			if (prevOrderID!=0)
			{
				sfi = "OrderID=OrderID+1";
				sva = "rootid=" +nRootID+ " and OrderID>"+prevOrderID+" and ClassID<>"+nClassID;
				iReturn2 = updateData.update(sta, sfi, sva);    
			}
			if(iReturn == 0 && iReturn1==0 &&iReturn2==0)
		    	flag =true;
		    dataConn.close();
		    queryData.close();
		    insertData.close();
		    updateData.close();
		}
		catch (java.sql.SQLException e ) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return flag;
	}
	public String FEditCheck(String nClassID,String nParentID, String sClassName,String codes) throws Exception { 
		//'����޸ļ�麯�������Ϊ0��ʾͨ����飬Ϊ1��ʾ�д��������д�����ʱ�˳���������������Ϣд��������ErrorStr
		queryData = new QueryData(dataConn);
		String FEditCheck="0";
		String sql="";
		if (nClassID.equals(""))
		{
			//'���idΪ��
			FEditCheck="1";
			ErrorStr="���id����Ϊ�գ�";
		}
		else				
		{
			try
			{
				if(sClassName.equals(""))
				{
					//'����Ϊ��
					FEditCheck="1";
					ErrorStr="��������Ϊ�գ�";
				}
				else
				{
					if (!nParentID.equals("0"))
					{
						sql="select ClassID From BC_INFO where ClassID="+nParentID;//		'����𲻴���
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if (!rs.next())
						{
							FEditCheck="1";
							ErrorStr="������𲻴��ڻ��Ѿ���ɾ����";
							rs.close();
						}
						else
						{
							sql="select ClassID from BC_INFO where ClassName='"+ sClassName +"' and ClassID<>"+ nClassID +" and ParentID="+ nParentID;	
							queryData.setRecordSet(sql);
							rs = queryData.getResultSet();
							if(rs.next())
							{
								//'�����ظ�
								FEditCheck="1";
								ErrorStr="�����ظ���";
								rs.close();
							}
							sql="select ClassID from BC_INFO where CODES='"+ codes +"' and ClassID<>"+ nClassID ;	
							queryData.setRecordSet(sql);
							rs = queryData.getResultSet();
							if(rs.next())
							{
								//'�����ظ�
								FEditCheck="1";
								ErrorStr="ָ���ظ���";
								rs.close();
							}
						}
					}
					else
					{
						sql="select ClassID from BC_INFO where ClassName='"+ sClassName +"' and ClassID<>"+ nClassID +" and ParentID="+ nParentID;	
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if(rs.next())
						{
							//'�����ظ�
							FEditCheck="1";
							ErrorStr="�����ظ���";
							rs.close();
						}
						sql="select ClassID from BC_INFO where CODES='"+ codes +"' and ClassID<>"+ nClassID ;	
						queryData.setRecordSet(sql);
						rs = queryData.getResultSet();
						if(rs.next())
						{
							//'�����ظ�
							FEditCheck="1";
							ErrorStr="ָ���ظ���";
							rs.close();
						}
					}
				}
				dataConn.close();
				queryData.close();
			}
			catch (Exception e) { 
				throw e; 
			}
		}
		return ErrorStr;
	}

	public boolean ClassEdit(String classid,String classname,String infocon,String codes) throws Exception { 
		updateData = new UpdateData(dataConn);
		boolean flag = false;
		String sta = "BC_INFO";
		String sfi = "ClassName='"+classname+"',INFOCONTENT='"+infocon+"',CODES='"+codes+"'";
		String sva = " ClassID='"+ classid+"'";
		try {
			int iReturn = updateData.update(sta, sfi, sva); 
			if(iReturn == 0)
		    	flag =true; 
			dataConn.close();
			updateData.close();
		} 
		catch (Exception e) { 
			throw e; 
		}
		return flag;
	}
	
	public String FDeleteCheck(String nClassID) throws Exception { 
		//'���ɾ����麯�������Ϊ0��ʾͨ����飬Ϊ1��ʾ�д��������д�����ʱ�˳���������������Ϣд��������ErrorStr
		//'����ɾ��û��д����ɾ�����²��ֵĴ��룬ɾ��ʱӦ�ü���ɾ��
		queryData = new QueryData(dataConn);
		
		String FDeleteCheck="0";
		String sql="";
				
		if (nClassID.equals(""))
		{
			FDeleteCheck="1";
			ErrorStr="Ҫɾ�������id����Ϊ�գ�";
		}
		else
		{
			sql="select Child from BC_INFO where ClassID="+ nClassID;
			queryData.setRecordSet(sql);
			rs=queryData.getResultSet();
			try {
				if (rs.next())
				{
					if ((rs.getInt(1))>0)
					{
						FDeleteCheck="1";
						ErrorStr="��������������ɾ�����������ٽ���ɾ�������Ĳ�����";
					}
				}
				else
				{
					FDeleteCheck="1";
					ErrorStr="��𲻴��ڻ����Ѿ���ɾ����";
				}
				dataConn.close();
				queryData.close();
			}
			catch (Exception e) { 
				throw e; 
			}
		}

		return ErrorStr;
	}


	public boolean ClassDel(String classid,String nParentID,String nDepth) throws Exception { 
		boolean flag = false;
		int iReturn = 0 ;
		int iReturn1 = 0;
		String sta="";
		String sfi="";
		String sva="";
		sta = "BC_INFO";
		deleteData = new DeleteData(dataConn);
		if (Integer.parseInt(nDepth)>0){//			'�޸ĸ�id������
			sfi = "child=child-1";
			sva = "child>0 and ClassID=" + nParentID;
			try {
					iReturn = updateData.update(sta, sfi, sva); 
					sva = "ClassID="+ classid;
					iReturn1 = deleteData.delete(sta, sva);
			} 
			catch (Exception e) { 
				throw e; 
			}
		}
		else
		{
			try { 
				sva = "ClassID="+ classid;	
				iReturn1 = deleteData.delete(sta, sva);
			}catch (Exception e) { 
				throw e; 
			} 
		}
		if(iReturn1 == 0)
		    flag =true;
		dataConn.close();		
		deleteData.close();
		return flag;
	}
	public void close() {
		 dataConn.close();
	}
}