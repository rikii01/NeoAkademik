# CampusCore – Flask MySQL CRUD Application

CampusCore is a web-based **Student Data Management System** developed using **Python (Flask Framework)** and **MySQL Database**.  
The application implements **CRUD functionality**, **user authentication**, **role-based access control**, and an **administrative dashboard with data visualization**.

This project was developed for academic and learning purposes.

---

## Application Access

The application runs locally using the Flask development server.

```
http://127.0.0.1:5000/login
```

---

## Demo Accounts

### User Account (Read-Only Access)
This account can only view student data.

```
Username: user1
Password: user123
```

### Admin Account (Full Access)
This account has full access to manage student data and view the dashboard.

```
Username: admin
Password: admin123
```

---

## Technologies Used

- **Python 3**
- **Flask Framework**
  - Routing and Blueprints
  - Authentication using Flask-Login
  - Role-Based Access Control (Admin & User)
- **MySQL Database**
  - Persistent storage for student and user data
- **Tailwind CSS**
  - Modern and responsive user interface
  - Dark theme styling
  - Paginated data tables
- **Chart.js**
  - Data visualization for dashboard monitoring

---

## Application Features

### Authentication and Authorization
- Secure login system
- User roles: Admin and User
- Access control based on user role

### Student Data Management (Admin)
- Create student records
- Read student records
- Update student records
- Delete student records
- Data pagination for better usability

### Dashboard Monitoring (Admin)
- Overview of total students
- Student distribution by study program
- Student distribution by faculty and program

### User View (Read-Only)
- View student data
- Paginated table view
- No access to create, update, or delete data

---

## Database Structure

### Table: mahasiswa
- `id` (Primary Key)
- `nim`
- `nama`
- `fakultas`
- `prodi`

### Table: users
- `id`
- `username`
- `password`
- `role`

---

## Project Structure

```
finalpython/
│
├── app/
│   ├── __init__.py
│   ├── config.py
│   ├── db.py
│   ├── models.py
│   ├── auth_routes.py
│   ├── admin_routes.py
│   ├── user_routes.py
│   ├── templates/
│   │   ├── admin/
│   │   ├── user/
│   │   └── auth/
│   └── static/
│
├── create_admin.py
├── create_user.py
├── run.py
└── README.md
```

---

## How to Run the Application

### 1. Prerequisites
Make sure the following software is installed:
- Python 3.x
- MySQL Server

### 2. Install Dependencies
```bash
pip install flask flask-login mysql-connector-python
```

### 3. Database Configuration
Configure the database connection in the following file:

```python
# app/config.py
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = ""
DB_NAME = "crud_flask"
```

Ensure that the database and required tables have been created.

---

### 4. Create Admin and User Accounts (Optional)
```bash
python create_admin.py
python create_user.py
```

---

### 5. Run the Application
```bash
python run.py
```

Open a browser and access:
```
http://127.0.0.1:5000/login
```

---

## Notes

This application was developed as an academic project with the following objectives:
- Implementing CRUD operations using Flask
- Applying authentication and role-based access control
- Integrating Flask with a MySQL database
- Building a modern and responsive web interface

---

## Author

Developed as part of a web programming learning project using Python and Flask.
