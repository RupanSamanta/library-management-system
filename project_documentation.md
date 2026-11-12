# 📚 Java Web Library Management System

![Java](https://img.shields.io/badge/Java-17%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Jakarta EE](https://img.shields.io/badge/Jakarta_Servlets-5.0%2B-007396?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-10%2B-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)

A full-stack, modern **Library Management System** engineered with **Jakarta Servlets**, **JavaServer Pages (JSP)**, and **JDBC**, strictly following the **Model-View-Controller (MVC)** architectural pattern. Designed with a clean, responsive user interface, automated database initialization, and dynamic exception handling.

---

## ✨ Key Highlights & Features

* **Strict MVC Architecture**: Cleanly decouples business logic (`Servlets`), data persistence (`DAO`), data models (`Book`), and presentation views (`JSP`).
* **Modern, Responsive UI/UX**: Built using clean CSS3 custom properties, fluid layouts, Google Fonts (`Inter`), and inline SVG iconography—no bloated external CSS frameworks required.
* **Resilient Error Handling**: Features a dedicated, custom-styled `error.jsp` page leveraging JSP's `isErrorPage` directive and dynamic exception messaging to handle duplicate keys or database failures gracefully.
* **Zero-Config Schema Setup**: Automatically detects and initializes the required MySQL `BOOK` table upon initial execution via `DAO.create()`.
* **Session-Safe Navigation**: Routes all catalog requests through controller servlets (`DisplayServlet`) rather than direct JSP links to guarantee up-to-date database state.

---

## 🏗️ Architecture & Request Flow

The application enforces a unidirectional MVC request lifecycle:

```text
[ Client Browser ]
       │
       ├──► (POST /RegisterServlet) ──► Validates input ──► DAO.addBook() ──► MySQL DB
       │                                      │
       │                                      ├──► [ Success ] ──► Forwards to success.jsp
       │                                      └──► [ Failure ] ──► Forwards to error.jsp
       │
       └──► (GET /DisplayServlet)   ──► Fetches list    ──► DAO.getAllBooks() ──► MySQL DB
                                              │
                                              └──► Attaches list ──► Forwards to display.jsp
```

---

## 📁 Project Directory Structure

```text
LibraryManagementSystem/
│
├── src/main/java/
│   ├── dao/
│   │   ├── DBConnection.java      # Manages JDBC connection lifecycle
│   │   └── DAO.java               # Executes SQL DDL & CRUD operations safely
│   ├── model/
│   │   └── Book.java              # Encapsulated JavaBean representing a Book entity
│   └── servlet/
│       ├── RegisterServlet.java   # Controller handling form submissions & routing
│       └── DisplayServlet.java    # Controller querying records for catalog display
│
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── lib/                   # Place mysql-connector-j.jar here if not using Maven
│   │   └── web.xml                # Deployment descriptor & global configurations
│   ├── index.html                 # Entry point: Modern book registration form
│   ├── success.jsp                # Confirmation view displaying registered book summary
│   ├── error.jsp                  # Dynamic error view with retry & catalog navigation
│   └── display.jsp                # Responsive table rendering the full book catalog
│
├── .gitignore                     # Ignores compiled classes, IDE metadata, and server logs
└── README.md                      # Project documentation
```

---

## 🛠️ Prerequisites

Before setting up the project locally, ensure you have the following installed:

1. **Java Development Kit (JDK)**: Version 17 or higher.
2. **Eclipse IDE**: *Eclipse IDE for Enterprise Java and Web Developers*.
3. **Web Server**: Apache Tomcat **v10.0 or higher** (Required for `jakarta.servlet.*` namespace compatibility).
4. **Database**: MySQL Server **v8.0+** and MySQL Workbench.
5. **JDBC Driver**: `mysql-connector-j-8.x.x.jar`.

---

## 🚀 Step-by-Step Local Setup Guide

### 1. Clone the Repository
Open your terminal or Git Bash and clone the repository to your local machine:
```bash
git clone https://github.com/your-username/LibraryManagementSystem.git
cd LibraryManagementSystem
```

### 2. Import into Eclipse IDE
1. Launch **Eclipse IDE**.
2. Navigate to **File** $\rightarrow$ **Import...**
3. Expand **Git** and select **Projects from Git (with smart import)**, then click **Next**.
4. Select **Existing local repository** $\rightarrow$ **Add...** and browse to the cloned `LibraryManagementSystem` directory.
5. Complete the import wizard. Eclipse will configure the project as a **Dynamic Web Project**.

### 3. Configure the MySQL Database
1. Start your local **MySQL Server**.
2. Open **MySQL Workbench** and create the target database schema (e.g., `CREATE DATABASE library_db;`) matching the URL configured in `src/main/java/dao/DBConnection.java`.
3. Open `DBConnection.java` and verify that the database URL, username, and password match your local MySQL credentials:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/library_db";
   private static final String USER = "root";
   private static final String PASSWORD = "your_mysql_password";
   ```
4. **Driver Check**: Ensure `mysql-connector-j.jar` is located inside `src/main/webapp/WEB-INF/lib/` and added to your Eclipse **Java Build Path**.

### 4. Configure Apache Tomcat Server
Because server runtime configurations are excluded from version control, link your local Tomcat installation:
1. In Eclipse, locate the **Servers** tab at the bottom of the workbench.
2. Click **"No servers are available. Click this link to create a new server..."**
3. Select **Apache** $\rightarrow$ **Tomcat v10.0 Server** (or v10.1 / v11) and click **Next**.
4. Click **Browse...** and select your local Apache Tomcat installation directory, then click **Finish**.
5. *(Optional)* Double-click the newly created Tomcat server in the **Servers** tab to verify or adjust the HTTP port (e.g., `8080` or `8083`).

### 5. Build and Run the Application
1. Right-click on the `LibraryManagementSystem` project in the **Project Explorer**.
2. Select **Run As** $\rightarrow$ **Run on Server**.
3. Choose your configured Tomcat v10+ server and click **Finish**.
4. Open your preferred web browser and navigate to:
   ```text
   http://localhost:8083/LibraryManagementSystem/
   ```
   *(Replace `8083` with your configured Tomcat HTTP port if different).*

---

## 🗄️ Database Schema Reference

The `BOOK` table is automatically generated when `DAO.create()` runs. For manual inspection or custom indexing, here is the underlying DDL schema:

```sql
CREATE TABLE IF NOT EXISTS BOOK (
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(150) NOT NULL,
    AUTHOR_NAME VARCHAR(100),
    PUBLISHER_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    EDITION VARCHAR(20),
    PUBLICATION_YEAR INT,
    PRICE DECIMAL(10,2),
    QUANTITY INT
);
```

---

## 🔧 Troubleshooting Common Issues

* **`ClassNotFoundException: com.mysql.cj.jdbc.Driver`**:
  * Ensure the MySQL Connector JAR file is placed directly inside `src/main/webapp/WEB-INF/lib/`. Placing it only in Eclipse's external build path will fail at runtime on Tomcat.
* **404 Not Found / Old Servlet URLs Loading**:
  * Right-click your Tomcat server in Eclipse $\rightarrow$ **Clean...**, then **Project** $\rightarrow$ **Clean...**, and restart the server. Perform a hard refresh (`Ctrl + F5`) in your browser.
* **Duplicate Primary Key Errors**:
  * `BOOK_ID` serves as the primary key. Submitting an ID that already exists in MySQL will trigger `error.jsp`. Always supply a unique numeric ID when registering a new title.

---

## 🤝 Contributing

Contributions, bug reports, and feature enhancements are welcome!
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/SearchFunctionality`).
3. Commit your changes (`git commit -m 'Add book search filter'`).
4. Push to the branch (`git push origin feature/SearchFunctionality`).
5. Open a Pull Request.