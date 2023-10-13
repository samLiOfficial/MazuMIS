package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
	 public static Connection conn(){
		 
		 
		 //The "String url", "String userName", and "String userPwd" variables are used to
		 //store the URL, username, and password needed to connect to the database.
		 
		 
		 //The URL (Uniform Resource Locator) specifies the location of the database and 
		 //provides the necessary information for a Java program to connect to it. 
		 //It typically includes the database type (such as MySQL), the IP address of 
		 //the server where the database is hosted, and the port number used to communicate
		 //with the database.
		 String url="jdbc:mysql://localhost:3306/mazudatabase";
	     String userName="root";//User name
	     String userPwd="1234";//Password 
         Connection connection=null;

  try{
      Class.forName("com.mysql.jdbc.Driver");  //
      System.out.println("load driver success"); //Class.forName("com.mysql.jdbc.Driver")
      //is a command that is used to load a special "driver"
      //program that allows a Java program to talk to a MySQL 
      //database.

  }catch(Exception e){

	       e.printStackTrace();
	       System.out.println("failed to create driver");
   }
  
 try{
	connection=DriverManager.getConnection(url,userName,userPwd);  //���Ӳ�login���ݿ�
	System.out.println("connection established");
 }catch(Exception e){
        e.printStackTrace();
        System.out.print("SQL Server connection failed to establish");
  }	
 return connection; // return connection
}
	 

//Basically a method that close the passed in statment and connection fr 
public static void close (Statement state, Connection conn) {//�ر�
	if (state != null) {
		try {
			state.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (conn != null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

//Got damn close the result set, statement and connection fr 
public static void close (ResultSet rs, Statement state, Connection conn) {//�ر�
	if (rs != null) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (state != null) {
		try {
			state.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (conn != null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


}