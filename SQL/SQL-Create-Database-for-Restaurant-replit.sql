-- Create Table
CREATE TABLE Employees (
  employee_id TEXT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  position TEXT,
  hire_date DATE,
  salary REAL,
  contact_number TEXT
);

CREATE TABLE Menu (
  menu_id TEXT PRIMARY KEY,
  menu_name TEXT,
  description TEXT,
  price REAL,
  category TEXT,
  availability BOOLEAN
);

CREATE TABLE Customers (
  customer_id TEXT PRIMARY KEY,
  gender TEXT,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone_number TEXT
);

CREATE TABLE Orders (
  order_id TEXT PRIMARY KEY,
  customer_id TEXT,
  order_date DATETIME,
  total_amount REAL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
  order_detail_id TEXT PRIMARY KEY,
  order_id TEXT,
  menu_id TEXT,
  quantity INTEGER,
  price_each REAL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

-- Insert data into Employees table
INSERT INTO Employees (employee_id, first_name, last_name, position, hire_date, salary, contact_number) VALUES
('E001', 'John', 'Doe', 'Manager', '2020-01-10', 50000.00, '555-1234'),
('E002', 'Jane', 'Smith', 'Chef', '2019-03-15', 45000.00, '555-5678'),
('E003', 'Alice', 'Johnson', 'Waitress', '2021-05-20', 30000.00, '555-8765'),
('E004', 'Bob', 'Brown', 'Dishwasher', '2020-11-01', 25000.00, '555-4321'),
('E005', 'Charlie', 'Davis', 'Chef', '2018-02-25', 46000.00, '555-1111'),
('E006', 'Dana', 'White', 'Waitress', '2019-08-12', 31000.00, '555-2222'),
('E007', 'Eve', 'King', 'Manager', '2017-09-30', 52000.00, '555-3333'),
('E008', 'Frank', 'Taylor', 'Waiter', '2021-06-18', 32000.00, '555-4444'),
('E009', 'Grace', 'Harris', 'Hostess', '2021-07-22', 27000.00, '555-5555'),
('E010', 'Hank', 'Martinez', 'Cook', '2019-10-14', 35000.00, '555-6666'),
('E011', 'Ivy', 'Clark', 'Waitress', '2020-01-25', 31000.00, '555-7777'),
('E012', 'Jack', 'Lewis', 'Cook', '2018-05-05', 34000.00, '555-8888'),
('E013', 'Kelly', 'Lee', 'Waitress', '2019-04-03', 30000.00, '555-9999'),
('E014', 'Liam', 'Walker', 'Bartender', '2021-02-14', 33000.00, '555-0000'),
('E015', 'Mia', 'Scott', 'Hostess', '2020-12-12', 28000.00, '555-1212');

-- Insert data into Menu table
INSERT INTO Menu (menu_id, menu_name, description, price, category, availability) VALUES
('M001', 'Margherita Pizza', 'Classic cheese and tomato pizza', 12.00, 'Main Course', 1),
('M002', 'Pepperoni Pizza', 'Pepperoni, cheese, and tomato pizza', 15.00, 'Main Course', 1),
('M003', 'Caesar Salad', 'Fresh romaine lettuce with Caesar dressing', 10.00, 'Appetizer', 1),
('M004', 'Chicken Wings', 'Spicy chicken wings with dip', 8.00, 'Appetizer', 1),
('M005', 'Chocolate Cake', 'Rich chocolate cake with ganache', 7.00, 'Dessert', 1),
('M006', 'Grilled Salmon', 'Grilled salmon with vegetables', 18.00, 'Main Course', 1),
('M007', 'Beef Burger', 'Beef burger with lettuce and tomato', 12.00, 'Main Course', 1),
('M008', 'French Fries', 'Crispy golden fries', 5.00, 'Side', 1),
('M009', 'Tiramisu', 'Italian coffee-flavored dessert', 8.00, 'Dessert', 1),
('M010', 'Margarita', 'Classic margarita cocktail', 9.00, 'Beverage', 1),
('M011', 'Spaghetti Carbonara', 'Pasta with creamy sauce and bacon', 14.00, 'Main Course', 1),
('M012', 'Garlic Bread', 'Toasted bread with garlic butter', 4.00, 'Appetizer', 1),
('M013', 'Apple Pie', 'Warm apple pie with ice cream', 6.00, 'Dessert', 1),
('M014', 'Mojito', 'Refreshing mint and lime cocktail', 9.00, 'Beverage', 1),
('M015', 'Caesar Wrap', 'Chicken Caesar salad wrap', 10.00, 'Main Course', 1);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, gender, first_name, last_name, email, phone_number) VALUES
('C001', 'female', 'Olivia', 'Garcia', 'olivia@example.com', '555-1010'),
('C002', 'male', 'Emma', 'Rodriguez', 'emma@example.com', '555-2020'),
('C003', 'female', 'Ava', 'Martinez', 'ava@example.com', '555-3030'),
('C004', 'female', 'Sophia', 'Hernandez', 'sophia@example.com', '555-4040'),
('C005', 'female', 'Isabella', 'Lopez', 'isabella@example.com', '555-5050'),
('C006', 'male', 'Mia', 'Gonzalez', 'mia@example.com', '555-6060'),
('C007', 'male', 'Amelia', 'Wilson', 'amelia@example.com', '555-7070'),
('C008', 'female', 'Harper', 'Anderson', 'harper@example.com', '555-8080'),
('C009', 'female', 'Evelyn', 'Thomas', 'evelyn@example.com', '555-9090'),
('C010', 'male', 'Abigail', 'Taylor', 'abigail@example.com', '555-1122'),
('C011', 'female', 'Ella', 'Moore', 'ella@example.com', '555-2233'),
('C012', 'female', 'Luna', 'Jackson', 'luna@example.com', '555-3344'),
('C013', 'male', 'Sofia', 'Martin', 'sofia@example.com', '555-4455'),
('C014', 'female', 'Avery', 'Lee', 'avery@example.com', '555-5566'),
('C015', 'male', 'Charlotte', 'Perez', 'charlotte@example.com', '555-6677');

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
('O001', 'C001', '2023-06-01 12:00:00', 45.00),
('O002', 'C002', '2023-06-02 13:00:00', 30.00),
('O003', 'C003', '2023-06-03 14:00:00', 50.00),
('O004', 'C004', '2023-06-04 15:00:00', 20.00),
('O005', 'C005', '2023-06-05 16:00:00', 40.00),
('O006', 'C006', '2023-06-06 17:00:00', 35.00),
('O007', 'C007', '2023-06-07 18:00:00', 25.00),
('O008', 'C008', '2023-06-08 19:00:00', 55.00),
('O009', 'C009', '2023-06-09 20:00:00', 60.00),
('O010', 'C010', '2023-06-10 21:00:00', 70.00),
('O011', 'C011', '2023-06-11 22:00:00', 80.00),
('O012', 'C012', '2023-06-12 23:00:00', 90.00),
('O013', 'C013', '2023-06-13 12:30:00', 100.00),
('O014', 'C014', '2023-06-14 13:30:00', 110.00),
('O015', 'C015', '2023-06-15 14:30:00', 120.00);

-- Insert data into Order_Details table
INSERT INTO Order_Details (order_detail_id, order_id, menu_id, quantity, price_each) VALUES
('OD001', 'O001', 'M001', 2, 12.00),
('OD002', 'O001', 'M005', 1, 7.00),
('OD003', 'O002', 'M003', 3, 10.00),
('OD004', 'O002', 'M008', 2, 5.00),
('OD005', 'O003', 'M006', 1, 18.00),
('OD006', 'O003', 'M011', 2, 14.00),
('OD007', 'O004', 'M002', 1, 15.00),
('OD008', 'O004', 'M009', 1, 8.00),
('OD009', 'O005', 'M007', 2, 12.00),
('OD010', 'O005', 'M013', 1, 6.00),
('OD011', 'O006', 'M010', 3, 9.00),
('OD012', 'O006', 'M014', 2, 9.00),
('OD013', 'O007', 'M001', 1, 12.00),
('OD014', 'O007', 'M004', 2, 8.00),
('OD015', 'O008', 'M012', 3, 4.00),
('OD016', 'O009', 'M006', 1, 18.00),
('OD017', 'O009', 'M002', 2, 15.00),
('OD018', 'O010', 'M001', 3, 12.00),
('OD019', 'O010', 'M010', 1, 9.00),
('OD020', 'O011', 'M007', 2, 12.00),
('OD021', 'O011', 'M004', 1, 8.00),
('OD022', 'O012', 'M005', 3, 7.00),
('OD023', 'O012', 'M013', 2, 6.00),
('OD024', 'O013', 'M011', 4, 14.00),
('OD025', 'O013', 'M009', 1, 8.00),
('OD026', 'O014', 'M006', 2, 18.00),
('OD027', 'O014', 'M002', 1, 15.00),
('OD028', 'O015', 'M001', 1, 12.00),
('OD029', 'O015', 'M003', 3, 10.00),
('OD030', 'O015', 'M014', 2, 9.00);

.mode table
.header on
  
-- I want to see which menu items have been ordered the most, from highest to lowest.
SELECT
    M.menu_id,
    M.menu_name,
    SUM(OD.quantity) AS total_quantity_sold,
    SUM(OD.quantity * OD.price_each) AS total_revenue
FROM Order_Details OD
JOIN Menu M ON OD.menu_id = M.menu_id
GROUP BY M.menu_id, M.menu_name, M.price
ORDER BY total_quantity_sold DESC;

-- I want to see which menu items each gender orders the most, sorted from most to least.
SELECT
    C.gender,
    M.menu_id,
    M.menu_name,
    SUM(OD.quantity) AS total_quantity_ordered
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN Order_Details OD ON O.order_id = OD.order_id
JOIN Menu M ON OD.menu_id = M.menu_id
GROUP BY C.gender, M.menu_id, M.menu_name
ORDER BY C.gender ASC, total_quantity_ordered DESC;

-- I want to see which employees have salaries higher than the average salary of all employees.
WITH Employee_Salary_Average AS (
  SELECT AVG(salary) AS avg_salary
  FROM Employees
)

SELECT 
  employee_id,
  first_name || ' ' || last_name AS fullname,
  position,
  salary
FROM Employees
WHERE salary > (SELECT avg_salary FROM Employee_Salary_Average)
ORDER BY salary DESC;
