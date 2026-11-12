<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Successful - Library Management System</title>
<link rel="stylesheet" href="css/variables.css" />
<link rel="stylesheet" href="css/successPage.css" />
</head>
<body>

	<div class="success-container">

		<div class="success-icon-wrapper">
			<svg width="36" height="36" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
		</div>

		<h1>Book Registered Successfully!</h1>
		<p class="subtitle">The book has been securely added to the
			library database.</p>

		<% 
            Book book = (Book) request.getAttribute("book");
        if (book == null) {
            book = new Book();
            book.setBookTitle("N/A");
            book.setBookId(-1);
            book.setCategory("N/A");
            book.setAuthorName("N/A");
            book.setEdition("N/A");
            book.setPublicationYear(0);
            book.setPrice(0.00);
            book.setAvailableQuantity(0);
        }
        %>

		<div class="summary-card">
			<div class="summary-title">Registered Book Overview</div>
			<div class="summary-grid">

				<div class="summary-item full-width">
					<label>Book Title</label> <span><%= book.getBookTitle() %></span>
				</div>

				<div class="summary-item">
					<label>Book ID</label> <span><%= book.getBookId() %></span>
				</div>

				<div class="summary-item">
					<label>Category</label> <span><%= book.getCategory() %></span>
				</div>

				<div class="summary-item">
					<label>Author Name</label> <span><%= book.getAuthorName() %></span>
				</div>

				<div class="summary-item">
					<label>Edition &amp; Year</label> <span><%= book.getEdition() %>
						(<%= book.getPublicationYear() %>)</span>
				</div>

				<div class="summary-item">
					<label>Price</label> <span>₹<%= book.getPrice() %></span>
				</div>

				<div class="summary-item">
					<label>Quantity Added</label> <span><%= book.getAvailableQuantity() %>
						Units</span>
				</div>
			</div>
		</div>

		<div class="action-buttons">
			<a href="index.html" class="btn btn-secondary">
				<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
  					<line x1="12" y1="5" x2="12" y2="19" />
  					<line x1="5" y1="12" x2="19" y2="12" />
				</svg> Register Another Book
			</a> 
			<a href="DisplayServlet" class="btn btn-primary"> 
				<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
					stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
   					<path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
    				<path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
				</svg> View Catalog
			</a>
		</div>
	</div>

</body>
</html>