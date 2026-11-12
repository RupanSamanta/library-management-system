<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Error - Library Management System</title>
<link rel="stylesheet" href="css/variables.css" />
<link rel="stylesheet" href="css/errorPage.css" />
</head>
<body>

	<div class="container">
		<div class="card">

			<div class="icon-wrapper">
				<svg width="32" height="32" viewBox="0 0 24 24" fill="none"
					stroke="currentColor" stroke-width="2" stroke-linecap="round"
					stroke-linejoin="round">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="12" y1="8" x2="12" y2="12"></line>
                    <line x1="12" y1="16" x2="12.01" y2="16"></line>
                </svg>
			</div>

			<h1>Registration Failed</h1>
			<p>We encountered an issue while attempting to save your book
				record to the database. Please verify your details and try again.</p>

			<div class="error-details"><%=(String) request.getAttribute("errorMessage")%></div>

			<div class="btn-group">
				<a href="index.html" class="btn btn-primary"> 
					<svg width="16"
						height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
    					<path d="M21.5 2v6h-6M21.34 15.57a10 10 0 1 1-.57-8.38"></path>
					</svg> Try Again
				</a> 
				<a href="DisplayServlet" class="btn btn-secondary"> 
					<svg
						width="16" height="16" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="3" stroke-linecap="round"
						stroke-linejoin="round">
   						<path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
    					<path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
					</svg>View Catalog
				</a>
			</div>
		</div>
	</div>

</body>
</html>