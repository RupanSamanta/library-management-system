package servlet;

import dao.DAO;
import model.Book;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {
        
        DAO dao = new DAO();
        List<Book> bookList = dao.getAllBooks();
        req.setAttribute("bookList", bookList);
        
        RequestDispatcher rd = req.getRequestDispatcher("display.jsp");
        rd.forward(req, res);
    }
}