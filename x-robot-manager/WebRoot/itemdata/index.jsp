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
//�������ݿ�
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
	
	//��������
	TimeSeriesCollection dataset = new TimeSeriesCollection();
	dataset.addSeries(timeseries);

	dataset.setDomainIsPointsInTime(false);

	//��������ͼ
	XYDataset xydataset = (XYDataset) dataset;
	JFreeChart chart = ChartFactory.createTimeSeriesChart("����ͼ","ʱ��","ֵ",xydataset,true,true,true);
	chart.setBackgroundPaint(Color.white);//��������ͼ����ɫ

	XYPlot plot = (XYPlot) chart.getPlot(); 
	
	System.out.println(plot);
	
	DateAxis categoryAxis = (DateAxis) plot.getDomainAxis(); // ȡ�ú��� 
	categoryAxis.setDateFormatOverride(new SimpleDateFormat("yy-MM-dd")); 
 	NumberAxis numberAxis = (NumberAxis) plot.getRangeAxis(); //	 ȡ������
	numberAxis.setLabelFont(new Font("����", Font.BOLD, 22)); 
	numberAxis.setNumberFormatOverride(new DecimalFormat("0.00"));
	
	
	XYLineAndShapeRenderer xylineandshaperenderer = (XYLineAndShapeRenderer)plot.getRenderer();
	plot.setBackgroundPaint(Color.white);//�������񱳾���ɫ
	plot.setDomainGridlinePaint(Color.pink);//��������������ɫ
	plot.setRangeGridlinePaint(Color.pink);//�������������ɫ
	plot.setAxisOffset(new RectangleInsets(0D, 0D, 0D, 10D));//��������ͼ��xy��ľ���
	xylineandshaperenderer.setBaseShapesVisible(true);//���������Ƿ���ʾ���ݵ�

	

	
	String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, null, session);
	System.out.println(filename);
	String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
%>
<img src="<%= graphURL %>" border=0 usemap="#<%= filename %>">



