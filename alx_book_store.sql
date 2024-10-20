CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT fk_author FOREIGN KEY (author_id)
    REFERENCES Authors(author_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    book_id INT,
    quantity DOUBLE NOT NULL,
    CONSTRAINT fk_order FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_book FOREIGN KEY (book_id)
    REFERENCES Books(book_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
