package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String DRIVERNAME = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/library";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "TSBk1p0sZyYqpks@";

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(DRIVERNAME);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Connection Establisted!");
		} catch (Exception e) {
			System.err.println("Connection not Established!");
		}
		return connection;
	}
}