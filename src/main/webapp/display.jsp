<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Book"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Catalog - Library Management System</title>
<link rel="stylesheet" href="css/variables.css" />
<link rel="stylesheet" href="css/displayPage.css" />
</head>
<body>

	<div class="container">
		<header class="page-header">
			<div class="inner-header">
				<div class="logo-badge">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round">
                    <path
							d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20" />
                </svg>
				</div>
				<div>
					<h1>Library Catalog</h1>
					<p>Overview of all registered book records in the database</p>
				</div>
			</div>
			<a href="index.html" class="btn"> 
				<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
  					<line x1="12" y1="5" x2="12" y2="19" />
  					<line x1="5" y1="12" x2="19" y2="12" />
				</svg> Register New Book
			</a>
		</header>

		<div class="card">
			<div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th>Book ID</th>
							<th>Title</th>
							<th>Author</th>
							<th>Publisher</th>
							<th>Category</th>
							<th>Edition</th>
							<th>Year</th>
							<th>Price</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Book> bookList = (List<Book>) request.getAttribute("bookList");
						if (bookList != null && !bookList.isEmpty()) {
							for (Book b : bookList) {
						%>
						<tr>
							<td><strong><%=b.getBookId()%></strong></td>
							<td><%=b.getBookTitle()%></td>
							<td><%=b.getAuthorName()%></td>
							<td><%=b.getPublisherName()%></td>
							<td><span class="badge"><%=b.getCategory()%></span></td>
							<td><%=b.getEdition()%></td>
							<td><%=b.getPublicationYear()%></td>
							<td>₹<%=b.getPrice()%></td>
							<td><%=b.getAvailableQuantity()%></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="9" class="empty-state">No books found in the
								inventory database.</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>