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
<%
//连接数据库
	Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
	String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=jfree";
	String usr="sa";
	String pwd="";
	Connection conn=DriverManager.getConnection(url,usr,pwd);
	Statement stmt=conn.createStatement();
	String sql="select * from testjfree order by id";
	ResultSet rs=stmt.executeQuery(sql);
	

	TimeSeries timeseries = new TimeSeries("111111111111111111111111111111",Day.class);

	while(rs.next())
	{
		float y0=rs.getFloat("lengthavg");
		java.util.Date ds=rs.getDate("addtime");
		System.out.println(ds);
		//timeseries.add(new Day(1,1,2008),y0);
		timeseries.add(new Day(ds), y0);
		
	}
	
	//连接曲线
	TimeSeriesCollection dataset = new TimeSeriesCollection();
	dataset.addSeries(timeseries);

	dataset.setDomainIsPointsInTime(false);

	//设置曲线图
	XYDataset xydataset = (XYDataset) dataset;
	JFreeChart chart = ChartFactory.createTimeSeriesChart("走势图","时间","值",xydataset,true,true,true);
	chart.setBackgroundPaint(Color.white);//设置曲线图背景色

	XYPlot plot = (XYPlot) chart.getPlot(); 
	
	System.out.println(plot);
	
	DateAxis categoryAxis = (DateAxis) plot.getDomainAxis(); // 取得横轴 
	categoryAxis.setDateFormatOverride(new SimpleDateFormat("yy-MM-dd")); 
 	NumberAxis numberAxis = (NumberAxis) plot.getRangeAxis(); //	 取得纵轴
	numberAxis.setLabelFont(new Font("黑体", Font.BOLD, 22)); 
	numberAxis.setNumberFormatOverride(new DecimalFormat("0.00"));
	
	
	XYLineAndShapeRenderer xylineandshaperenderer = (XYLineAndShapeRenderer)plot.getRenderer();
	plot.setBackgroundPaint(Color.white);//设置网格背景颜色
	plot.setDomainGridlinePaint(Color.pink);//设置网格竖线颜色
	plot.setRangeGridlinePaint(Color.pink);//设置网格横线颜色
	plot.setAxisOffset(new RectangleInsets(0D, 0D, 0D, 10D));//设置曲线图与xy轴的距离
	xylineandshaperenderer.setBaseShapesVisible(true);//设置曲线是否显示数据点

	

	
	String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, null, session);
	System.out.println(filename);
	String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
%>
<img src="<%= graphURL %>" border=0 usemap="#<%= filename %>">



