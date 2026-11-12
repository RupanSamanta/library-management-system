package servlet;

import dao.DAO;
import model.Book;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		int bookId = Integer.parseInt(req.getParameter("bookId"));
		String bookTitle = req.getParameter("bookTitle");
		String authorName = req.getParameter("authorName");
		String publisherName = req.getParameter("publisherName");
		String category =  req.getParameter("category");
		String edition = req.getParameter("edition");
		int publicationYear = Integer.parseInt(req.getParameter("publicationYear"));
		double price = Double.parseDouble(req.getParameter("price"));
		int availableQuantity = Integer.parseInt(req.getParameter("availableQuantity"));

		Book book = new Book(
				bookId, bookTitle, authorName, publisherName, category, edition, publicationYear, price, availableQuantity
				);
		try {
			DAO dao = new DAO();

			if (dao.addBook(book)) {
				req.setAttribute("book", book);
				RequestDispatcher rd = req.getRequestDispatcher("success.jsp");
				rd.forward(req, res);
			} else {
				req.setAttribute("errorMessage", "Database insertion failed. Please check if the Book ID already exists.");
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
				rd.forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "System Error: " + e.getMessage());
			RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
			rd.forward(req, res);
		}
	}
}
