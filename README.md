<div align="center">
  <img src="anime-profile.svg" alt="Anime profile" width="420">

</div>
  <img src="cat.svg" alt="Cute Shoeskopo cat" width="180" />
  <img src="anime-profile.svg" alt="Anime profile" width="420">

  <h1>SHOESKOPO</h1>
  <p><strong>Online Shoe Store and Inventory Management System</strong></p>
</div>

---


PROJECT OVERVIEW
----------------
Shoeskopo is a PHP and MySQL web application for selling shoes online and managing
store operations. Customers can browse products, view product details, select
sizes, add items to a cart, place orders, view their orders, and manage their
profiles. Administrative pages provide tools for managing products, categories,
users, suppliers, inventory, sales/orders, and reports. Employee pages support
selected store and inventory tasks.

MAIN FEATURES
-------------
Customer features:
- Browse the shoe catalog and browse products by category.
- View product details, images, available sizes, prices, and stock.
- Register and sign in using an email address and password.
- Add products to a shopping cart and proceed to checkout.
- Place orders and view order history/details.
- Manage profile information.
- Submit product reviews where enabled by the application.

Admin features:
- Dashboard and sales/report summaries.
- Create, view, edit, and delete products.
- Manage product categories and product images/sizes.
- Manage user accounts and roles.
- Manage suppliers and inventory.
- Manage sales/orders and payment information.
- View reports and related store records.

Employee features:
- Access employee dashboard and inventory functions.
- Create manual orders where permitted.

TECHNOLOGY
----------
- PHP
- MySQL / MariaDB
- HTML, CSS, and JavaScript
- PDO for database access
- Composer dependency management
- PHPMailer for email-related functionality
- SweetAlert2 may be loaded by the interface for confirmation and status alerts.

REQUIREMENTS
------------
- A local PHP environment such as XAMPP.
- Apache and MySQL/MariaDB.
- PHP with PDO MySQL enabled.
- A MySQL database named: shoeskopo_db
- Composer dependencies included in the project vendor folder, or Composer
  installed to restore them.

INSTALLATION (XAMPP)
--------------------
1. Extract the Shoeskopo project folder into your web server directory, for example:
      C:\xampp\htdocs\Shoeskopo

2. Start Apache and MySQL from the XAMPP Control Panel.

3. Create the MySQL database:
      shoeskopo_db

4. Import the database schema and seed data provided by your project/course.
   IMPORTANT: This ZIP does not contain a complete database export. The file
   database/discounts_migration.sql is a migration for discount-related changes,
   not a full database schema. Import the full project SQL file if you have it.
   The application requires tables used by the source code, including users,
   products, categories, product_images, product_sizes, orders, order_items,
   payments, customer_cart_items, suppliers, inventory_logs, and other
   management tables.

5. Check the database connection in:
      config/db.php

   The default local settings are:
      Host: localhost
      Database: shoeskopo_db
      Username: root
      Password: (blank)

   Change these values to match your local MySQL configuration.

6. If Composer is installed and dependencies need to be restored, open a terminal
   in the project directory and run:
      composer install

7. Open the application in your browser:
      http://localhost/Shoeskopo/

8. Register a customer account to test customer features. To use admin or
   employee pages, use an account whose role has been configured in the database.
   Do not assume a default administrator account exists unless one was supplied
   with your database seed data.

EMAIL CONFIGURATION
-------------------
Email settings are located in:
      config/mail.php

The included settings are configured for a Mailtrap SMTP sandbox. Replace the
host, port, username, password, encryption, and sender details with valid values
for your email provider before using email features. Do not publish real SMTP
credentials or commit them to a public repository.

IMPORTANT SECURITY NOTES
------------------------
- Change default database credentials for any non-local deployment.
- Keep SMTP credentials private and use environment variables or a protected
  configuration file in production.
- Use HTTPS and secure session/cookie settings for a deployed website.
- Back up the database before running migrations or making structural changes.
- Do not expose the vendor folder's development/test files publicly if deploying
  to production; configure the web server to expose only required application
  files.

PROJECT STRUCTURE
-----------------
admin/                  Admin dashboard and management pages
assets/css/             Stylesheets
assets/images/          Product, profile, and review media
config/db.php           Database connection
config/mail.php         Email/SMTP configuration
database/               SQL migration files
employee/               Employee dashboard and inventory/order tools
includes/header.php     Shared page header/navigation
includes/footer.php     Shared footer/scripts
includes/functions.php  Shared session, cart, and helper functions
index.php               Store home page
category.php            Product category listing
product.php             Product detail page
cart.php                Shopping cart
checkout.php            Checkout and order creation
orders.php              Customer order history
receipt.php             Receipt page
login.php               Login page
register.php            Registration page
profile.php              Customer profile page
logout.php               Sign-out handler
composer.json            PHP dependency definition
composer.lock            Locked dependency versions
vendor/                  Installed Composer packages

TROUBLESHOOTING
---------------
- Database connection failed:
  Confirm MySQL is running, the shoeskopo_db database exists, and config/db.php
  contains the correct credentials.

- Missing table or column errors:
  Import the correct full database schema/seed SQL file for this version of
  Shoeskopo. The discount migration alone is not enough.

- Email is not being sent:
  Verify config/mail.php SMTP settings and confirm that your email provider
  accepts the configured credentials and port.

- Login fails:
  Verify the account exists, its email is correct, its password was stored using
  PHP password hashing, and the account is active.

- Images do not appear:
  Confirm the assets/images directories were copied and that the web server can
  read the files.

This README describes the source files in the provided project archive. Actual
available features and behavior may depend on the database schema, seed data,
configuration, and PHP environment used to run the application.
