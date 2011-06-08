<%@ page contentType="text/html;charset=GBK"%>
<%@ page import=" java.awt.*,
java.text.SimpleDateFormat,
javax.swing.JPanel,
org.jfree.chart.ChartFactory,
org.jfree.chart.ChartPanel,
org.jfree.chart.JFreeChart,
org.jfree.chart.axis.DateAxis,
org.jfree.chart.plot.XYPlot,
org.jfree.chart.axis.NumberAxis,
org.jfree.chart.renderer.xy.XYItemRenderer,
org.jfree.chart.renderer.xy.XYLineAndShapeRenderer,
org.jfree.data.time.*,
org.jfree.data.time.TimeSeries,
org.jfree.data.time.TimeSeriesCollection,
org.jfree.data.xy.XYDataset"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat "%>
<%@ page import="org.jfree.ui.RectangleInsets"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.catic.tool.*"%>
<%
//连接数据库
	//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
	//String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=jfree";
	//String usr="sa";
	//String pwd="";
	//Connection conn=DriverManager.getConnection(url,usr,pwd);
	//Statement stmt=conn.createStatement();
	//String sql="select * from testjfree order by id";
	//ResultSet rs=stmt.executeQuery(sql);
	 	SimpleDateFormat dateFormatStart1 = new SimpleDateFormat("yyyy-MM-dd");
	 	java.util.Date dateCurrStart = new java.util.Date();
	 	String startTime1 = dateFormatStart1.format(dateCurrStart);
	 	String action = request.getParameter("action");
	 	String data1 = request.getParameter("BIRTH1");
	 	String data2 = request.getParameter("BIRTH2");
	 	if(!"search".equals(action)){
	 	if (data1 == null || "".equals(data1) || "null".equals(data1)) {
	 		data1 = startTime1;
	 	} else {
	 		//data1=data1;
	 	}
	 	
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = startTime1;
	 	} else {
	 		//data2=data2;
	 	}
	 	}else{
	 	if (data1 == null || "".equals(data1) || "null".equals(data1)) {
	 		data1 = "";
	 	} else {
	 		//data1=data1;
	 	}
	 	
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = "";
	 	} else {
	 		//data2=data2;
	 	}
	 	}
	 	String num1 = "";
	 	String num2 = "";
		String t_date = "";
	 	DataConn conn = new DataConn();
	 	QueryData query = new QueryData(conn);	
	
		String sql1 = "select count(contactemail) num1,to_char(createdate,'yyyy-mm-dd') t_date,sum(logtimes) num2 from unicom.t_logcontact t ";
		sql1+=" where 1=1 ";
		if(!"".equals(data1))
		sql1+=" and to_char(createdate,'yyyy-mm-dd')>='"+data1+"' ";
		if(!"".equals(data2))
		sql1+=" and to_char(createdate,'yyyy-mm-dd')<='"+data2+"' ";
		sql1+=" group by to_char(createdate,'yyyy-mm-dd') order by t_date";
		System.out.println(sql1);
		query.setRecordSet(sql1);
		ResultSet rs3 = query.getResultSet();
		int indexs = 1;
		int numy = 0;
		int numz = 0;
		int numk=0;
																

																	
		TimeSeries timeseries = new TimeSeries("使用人数",Day.class);
		TimeSeries timeseries1 = new TimeSeries("使用次数",Day.class);
		while (rs3.next()) {
		float y0 = rs3.getFloat("num1");
		java.util.Date ds=rs3.getDate("t_date");
		float y1 = rs3.getFloat("num2");
		timeseries.add(new Day(ds), y0);
		timeseries1.add(new Day(ds), y1);
		}
	
	
	//连接曲线
	TimeSeriesCollection dataset = new TimeSeriesCollection();
	dataset.addSeries(timeseries);
	dataset.addSeries(timeseries1);
	dataset.setDomainIsPointsInTime(false);

	//设置曲线图
	XYDataset xydataset = (XYDataset) dataset;
	JFreeChart chart = ChartFactory.createTimeSeriesChart("走势图","时间","值",xydataset,true,true,true);
	chart.setBackgroundPaint(Color.white);//设置曲线图背景色

	XYPlot plot = (XYPlot) chart.getPlot(); 
	
	System.out.println(plot);
	
	DateAxis categoryAxis = (DateAxis) plot.getDomainAxis(); // 取得横轴 
	categoryAxis.setDateFormatOverride(new SimpleDateFormat("yyMMdd")); 
	categoryAxis.setAutoTickUnitSelection(false);
 	NumberAxis numberAxis = (NumberAxis) plot.getRangeAxis(); //	 取得纵轴
	numberAxis.setLabelFont(new Font("黑体", Font.BOLD, 22)); 
	numberAxis.setNumberFormatOverride(new DecimalFormat("0"));
	
	
	
	XYLineAndShapeRenderer xylineandshaperenderer = (XYLineAndShapeRenderer)plot.getRenderer();
	plot.setBackgroundPaint(Color.white);//设置网格背景颜色
	plot.setDomainGridlinePaint(Color.pink);//设置网格竖线颜色
	plot.setRangeGridlinePaint(Color.pink);//设置网格横线颜色
	plot.setAxisOffset(new RectangleInsets(0D, 0D, 0D, 10D));//设置曲线图与xy轴的距离
	xylineandshaperenderer.setBaseShapesVisible(true);//设置曲线是否显示数据点

	

	//out.print(chart);
	String filename = ServletUtilities.saveChartAsPNG(chart, 1500, 770, null, session);
	System.out.println(filename);
	String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
	System.out.println(graphURL);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	
<link rel="stylesheet" type="text/css" href="../css/bbcss.css">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/business.css">

	</head>
<img src="<%= graphURL %>" border=0 usemap="#<%= filename %>"><br/>

<input type="button" name="button" class="button" value="返回" onclick="window.location.href='talkedata.jsp?r_action=search&BIRTH1=<%=data1 %>&BIRTH2=<%=data2 %>'";/>
</html>
