package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class MySqlConnection {
	
	public static Connection con=null;
	
	public static Connection getconnectionmysql() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pfe","root","pbshggbg");
		
		
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	return con;
		
	}
	
	public static void main(String[] args) {
		
		getconnectionmysql();
		System.out.println("salamo ");

		
	}
}

