package dao;

import model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	public void create() {
		Connection con = DBConnection.getConnection();
		String query = "CREATE TABLE IF NOT EXISTS BOOK ("
				+ "    BOOK_ID INT PRIMARY KEY,"
				+ "    BOOK_TITLE VARCHAR(150) NOT NULL,"
				+ "    AUTHOR_NAME VARCHAR(100),"
				+ "    PUBLISHER_NAME VARCHAR(100),"
				+ "    CATEGORY VARCHAR(50),"
				+ "    EDITION VARCHAR(20),"
				+ "    PUBLICATION_YEAR INT,"
				+ "    PRICE DECIMAL(10,2),"
				+ "    QUANTITY INT)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			int result = ps.executeUpdate();
			if (result > 0) {
				System.out.println("Table createion successful.");
			} else {
				System.out.println("Table already exists!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean addBook(Book book) {
	    String query = "INSERT INTO BOOK VALUES(?,?,?,?,?,?,?,?,?)";
	    
	    try (Connection con = DBConnection.getConnection();
		     PreparedStatement ps = con.prepareStatement(query);) {
	    	
	        ps.setInt(1, book.getBookId());
	        ps.setString(2, book.getBookTitle());
	        ps.setString(3, book.getAuthorName());
	        ps.setString(4, book.getPublisherName());
	        ps.setString(5, book.getCategory());
	        ps.setString(6, book.getEdition());
	        ps.setInt(7, book.getPublicationYear());
	        ps.setDouble(8, book.getPrice());
	        ps.setInt(9, book.getAvailableQuantity());

	        int result = ps.executeUpdate();
	        return result > 0;
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public List<Book> getAllBooks() {
		List<Book> bookList = new ArrayList<>();
		String query = "SELECT * FROM BOOK";

		try (Connection conn = DBConnection.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

			System.out.println("Fetched Successfully!");
			while (rs.next()) {
				int id = rs.getInt("BOOK_ID");
				String title = rs.getString("BOOK_TITLE");
				String author = rs.getString("AUTHOR_NAME");
				String publisher = rs.getString("PUBLISHER_NAME");
				String category = rs.getString("CATEGORY");
				String edition = rs.getString("EDITION");
				int year = rs.getInt("PUBLICATION_YEAR");
				double price = rs.getDouble("PRICE");
				int quantity = rs.getInt("QUANTITY");

				Book book = new Book(id, title, author, publisher, category, edition, year, price, quantity);
				bookList.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookList;
	}
}
