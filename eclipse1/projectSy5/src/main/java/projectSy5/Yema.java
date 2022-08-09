package projectSy5;
import java.sql.*;
public class Yema {
	private static String strDBDriver = "com.mysql.jdbc.Driver";   //JDBC驱动
	// private static String strDBDriver = "com.mysql.cj.jdbc.Driver/"; //Mysql8版本 JDBC驱动
	private static String strDBUrl="jdbc:mysql://localhost:3306/store"; //数据库bookstore
	//private static String strDBUrl= "jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT"; // Mysql8版本链接 数据库bookstore
	private static final String USER_NAME="root";
		private static final String PASS_WORD="123456";    
		private Connection conn =null;
		private ResultSet rs = null;	
	    public int intPageSize; //一页显示的记录数
	    public int intRowCount; //记录总数
	    public int intPageCount; //总页数
	    public int intPage; //待显示页码
	    public String strPage;
	    public String queryStr="";
	    public void setintPageSize(int page) {
	    	 intPageSize = page;
	    } //设置一页显示的记录数
	    public void setstrPage(String page) {
	    	 strPage=page;
	    	 if(strPage==null){
	 	        //表明在QueryString中没有page这一个参数，此时显示第一页数据
	 	        intPage = 1;
	 	    } else{
	 	        //将字符串转换成整型
	 	        intPage = java.lang.Integer.parseInt(strPage);
	 	        if(intPage<1) intPage = 1;
	 	    }
	   } //取得待显示页码
	   
	    public ResultSet setqueryStr(String page,String s1,String s2) {
	    	String sql=null;
	    	 queryStr= page;
	    	 try {
	    	 conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);
	    	 Statement stmt = conn.createStatement();
	    	 if(queryStr==null)
	 	    	sql=s1;
	 	    else
	 	    	sql=s2;
	 	    System.out.println(sql);
	 	    rs=stmt.executeQuery(sql);
	    	 }
	    	 catch(SQLException e){
					System.err.println(sql);
	        } 
	    	 return rs;
	    }
	   public void DOit() {
	    try {
			rs.last();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//光标指向查询结果集中最后一条记录
	    try {
			intRowCount = rs.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   //获取记录总数*/
	    public int getintPageCount() {
	    intPageCount = (intRowCount+intPageSize-1) / intPageSize; //记算总页数
	    if(intPage>intPageCount)
	        intPage = intPageCount;//调整待显示的页码
	    if(intPageCount>0){
	        try {
				rs.absolute((intPage-1) * intPageSize + 1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //将记录指针定位到待显示页的第一条记录上
	        //显示数据
	    }
	    return intPageCount;
	    }
	    
}
