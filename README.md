@ -0,0 +1,394 @@
# Online Laundry Management System

A comprehensive web-based laundry management system built with Java Servlets, JSP, and MySQL. This system streamlines laundry service operations by managing customers, employees, orders, inventory, payments, and promotions through an intuitive web interface.

## 📋 Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Modules](#modules)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## ✨ Features

### Core Functionalities

- **User Management**
  - User registration and authentication
  - Role-based access control (Admin, Employee, Customer)
  - Profile management and updates
  - Secure login/logout system

- **Customer Management**
  - Add, view, update, and delete customer records
  - Customer information tracking
  - Customer dashboard

- **Employee Management**
  - Employee registration and management
  - Employee details and role assignment
  - Employee performance tracking

- **Order Management**
  - Create and manage laundry orders
  - Order status tracking
  - Order history and updates
  - Real-time order monitoring

- **Inventory Management**
  - Track laundry supplies and materials
  - Inventory stock management
  - Add, update, and remove inventory items
  - Low stock alerts

- **Payment Management**
  - Process customer payments
  - Payment history tracking
  - Multiple payment methods support
  - Invoice generation

- **Service Management**
  - Define and manage laundry services
  - Service pricing configuration
  - Service details and descriptions

- **Promotion Management**
  - Create and manage promotional offers
  - Discount campaigns
  - Special offers for customers

## 🛠️ Technologies Used

### Backend
- **Java SE 8+** - Core programming language
- **Java Servlets** - Server-side request handling
- **JSP (JavaServer Pages)** - Dynamic web page generation
- **JDBC** - Database connectivity

### Frontend
- **HTML5** - Markup language
- **CSS3** - Styling
- **JavaScript** - Client-side scripting
- **Bootstrap** (implied) - Responsive design

### Database
- **MySQL** - Relational database management system

### Server
- **Apache Tomcat 8.5+** - Servlet container

### Build Tools
- **Maven/Ant** (Recommended for dependency management)

## 💻 System Requirements

### Software Requirements
- **JDK**: Java Development Kit 8 or higher
- **IDE**: Eclipse, IntelliJ IDEA, or NetBeans
- **Web Server**: Apache Tomcat 8.5 or higher
- **Database**: MySQL 5.7 or higher
- **Web Browser**: Chrome, Firefox, Safari, or Edge (latest versions)

### Hardware Requirements
- **Processor**: Intel Core i3 or equivalent
- **RAM**: Minimum 4GB (8GB recommended)
- **Storage**: Minimum 500MB free disk space
- **Internet Connection**: Required for downloading dependencies

## 📦 Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/Ashanisuranga2002/Online-Laundry-Management-System.git
cd Online-Laundry-Management-System
```

### Step 2: Database Setup

1. Install MySQL Server if not already installed
2. Open MySQL Workbench or MySQL Command Line Client
3. Execute the database script:

```bash
mysql -u root -p < database/Online_Laundry_Management_final.sql
```

Or manually import the SQL file through MySQL Workbench:
- Open MySQL Workbench
- Navigate to Server → Data Import
- Select "Import from Self-Contained File"
- Choose `database/Online_Laundry_Management_final.sql`
- Click "Start Import"

### Step 3: Configure Database Connection

Update the database connection settings in `src/main/java/utility/DBConnection.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
private static final String USERNAME = "your_username";
private static final String PASSWORD = "your_password";
```

### Step 4: Configure Apache Tomcat

1. Download and install Apache Tomcat 8.5 or higher
2. Configure Tomcat in your IDE:
   - **Eclipse**: Window → Preferences → Server → Runtime Environments → Add
   - **IntelliJ IDEA**: Run → Edit Configurations → Add New → Tomcat Server
   - **NetBeans**: Tools → Servers → Add Server

### Step 5: Add MySQL JDBC Driver

1. Download MySQL Connector/J (JDBC Driver)
2. Copy the JAR file to `src/main/webapp/WEB-INF/lib/` directory

### Step 6: Build and Deploy

1. Build the project
2. Deploy the WAR file to Tomcat:
   - Copy the WAR file to Tomcat's `webapps` directory
   - Or deploy directly from your IDE

### Step 7: Run the Application

1. Start Apache Tomcat server
2. Access the application in your browser:
   ```
   http://localhost:8080/Online-Laundry-Management-System/
   ```

## 🗄️ Database Setup

The database schema includes the following main tables:

- `users` - System users (admin, employees, customers)
- `customers` - Customer information
- `employees` - Employee records
- `orders` - Laundry orders
- `inventory` - Inventory items and stock
- `payments` - Payment transactions
- `services` - Available laundry services
- `promotions` - Promotional offers

### Default Admin Credentials

After setting up the database, use these credentials to log in as admin:
- **Username**: admin
- **Password**: admin123

*(Note: Change these credentials immediately after first login)*

## ⚙️ Configuration

### Web Application Configuration

The `web.xml` file located in `src/main/webapp/WEB-INF/` contains servlet mappings and configuration.

### Context Parameters

Update context parameters as needed in `web.xml`:

```xml
<context-param>
    <param-name>database</param-name>
    <param-value>laundry_management</param-value>
</context-param>
```

## 📁 Project Structure

```
Online-Laundry-Management-System/
├── src/main/java/
│   ├── models/              # Data models (POJOs)
│   │   ├── CustomerModel.java
│   │   ├── EmployeeModel.java
│   │   ├── Order.java
│   │   ├── PaymentModel.java
│   │   ├── PromotionModel.java
│   │   └── Service.java
│   ├── services/            # Business logic layer
│   │   ├── CustomerController.java
│   │   ├── EmployeeController.java
│   │   ├── OrderService.java
│   │   ├── PaymentController.java
│   │   └── PromotionController.java
│   ├── servlets/            # Request handlers
│   │   ├── common/          # Common servlets (login, logout, etc.)
│   │   ├── customer/        # Customer operations
│   │   ├── employee/        # Employee operations
│   │   ├── inventory/       # Inventory operations
│   │   ├── order/           # Order operations
│   │   ├── payment/         # Payment operations
│   │   ├── promotion/       # Promotion operations
│   │   └── service/         # Service operations
│   └── utility/             # Utility classes
│       └── DBConnection.java
├── src/main/webapp/
│   ├── common/              # Common JSP pages
│   ├── customer/            # Customer views
│   ├── employee/            # Employee views
│   ├── inventory/           # Inventory views
│   ├── order/               # Order views
│   ├── payment/             # Payment views
│   ├── promotion/           # Promotion views
│   ├── service/             # Service views
│   ├── css/                 # Stylesheets
│   ├── img/                 # Images
│   └── WEB-INF/
│       ├── web.xml          # Deployment descriptor
│       └── lib/             # External libraries
├── database/
│   └── Online_Laundry_Management_final.sql
└── README.md
```

## 🚀 Usage

### For Administrators

1. **Login** with admin credentials
2. **Manage Users**: Add, update, or remove employees and customers
3. **Manage Services**: Define laundry services and pricing
4. **Monitor Orders**: Track all orders and their status
5. **Manage Inventory**: Monitor stock levels and update inventory
6. **View Reports**: Generate payment and order reports
7. **Create Promotions**: Set up promotional offers

### For Employees

1. **Login** with employee credentials
2. **Process Orders**: Create and update customer orders
3. **Manage Customers**: Add and update customer information
4. **Update Order Status**: Mark orders as in-progress, completed, etc.
5. **Record Payments**: Process customer payments

### For Customers

1. **Register/Login** to the system
2. **Place Orders**: Create new laundry service orders
3. **Track Orders**: Monitor order status
4. **View History**: Check previous orders and payments
5. **Update Profile**: Manage personal information

## 📊 Modules

### 1. Authentication Module
- User login and logout
- Session management
- Password encryption (recommended enhancement)

### 2. Customer Module
- CRUD operations for customers
- Customer search and filtering
- Customer order history

### 3. Employee Module
- Employee registration
- Role assignment
- Employee activity tracking

### 4. Order Module
- Order creation and processing
- Order status management
- Order tracking and updates

### 5. Inventory Module
- Stock management
- Item tracking
- Inventory reports

### 6. Payment Module
- Payment processing
- Transaction history
- Payment method management

### 7. Service Module
- Service catalog
- Pricing management
- Service descriptions

### 8. Promotion Module
- Discount campaigns
- Promotional offers
- Coupon management

## 📸 Screenshots

*(Add screenshots of your application here)*

- Login Page
- Dashboard
- Customer Management
- Order Management
- Inventory Management
- Payment Processing

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

### Coding Standards

- Follow Java naming conventions
- Add comments for complex logic
- Write clean and maintainable code
- Test thoroughly before submitting

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🐛 Known Issues

- Session timeout needs configuration
- Input validation can be enhanced
- Password encryption not implemented (security enhancement needed)

## 🔮 Future Enhancements

- [ ] SMS/Email notifications for order status
- [ ] Online payment gateway integration
- [ ] Mobile application
- [ ] QR code for order tracking
- [ ] Analytics dashboard
- [ ] Customer feedback system
- [ ] Multi-language support
- [ ] Export reports to PDF/Excel

## 📞 Contact

**Developer**: Ashani Suranga  
**GitHub**: [@Ashanisuranga2002](https://github.com/Ashanisuranga2002)  
**Project Link**: [https://github.com/Ashanisuranga2002/Online-Laundry-Management-System](https://github.com/Ashanisuranga2002/Online-Laundry-Management-System)

---

## 🙏 Acknowledgments

- Thanks to all contributors who have helped with this project
- Inspiration from modern laundry management solutions
- Open source community for various tools and libraries

---

**Made with ❤️ by Ashani Suranga**

*Last Updated: January 2026*
