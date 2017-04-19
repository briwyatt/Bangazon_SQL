-- this table is the SQL representation of the Entity Relationship Diagram shown here:  https://www.draw.io/#G0Bw-gU8RWcRQ-VVhqS2M5eE0tQmc
DROP TABLE if exists Employee
DROP TABLE if exists EmployeeComputer
DROP TABLE if exists Computer
DROP TABLE if exists Department
DROP TABLE if exists EmployeeTrainingProgram
DROP TABLE if exists TrainingProgram
DROP TABLE if exists ProductType
DROP TABLE if exists Product
DROP TABLE if exists Customer
DROP TABLE if exists ProductOrder
DROP TABLE if exists Orders
DROP TABLE if exists Payment

Create Table Employee (
    EmployeeId Integer not null primary key Autoincrement,
    DepartmentId Integer not null,
    Title Text not null,
        FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

Create Table EmployeeComputer (
    EmComId Integer not null primary key autoincrement,
    EmployeeId Integer not null,
    ComputerId Integer not null,
        FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
        FOREIGN KEY (ComputerId) REFERENCES Computer(ComputerId)
);

Create Table Computer(
    ComputerId Integer not null primary key autoincrement,
    PurchaseDate Integer not null,
    DecommissionDate Integer not null,
    EmployeeId Integer not null,
        Foreign Key (EmployeeId) REFERENCES Employee(EmployeeId)
);

Create Table Department(
    DepartmentId Integer not null primary key autoincrement,
    SupervisorId Integer not null,
    ExpenseBudget Integer not null
);

Create Table EmployeeTrainingProgram (
    EmployeeTrainingProgramId Integer not null primary key autoincrement,
    TrainingProgramId integer not null,
    EmployeeId integer not null,
        FOREIGN KEY(TrainingProgramId) references TrainingProgram(TrainingProgramId)
        FOREIGN KEY(EmployeeId) references Employee(EmployeeId)
);

Create Table TrainingProgram (
    TrainingProgramId Integer not null primary key autoincrement,
    StartDate Integer not null,
    EndDate Integer not null,
    MaxAttendance Integer not null
);

Create Table ProductType (
    ProductTypeId Integer not null primary key autoincrement,
    CategoryName Text not null
);

Create Table Product (
    ProductId Integer not null primary key autoincrement,
    Price Integer not null,
    Title Text not null,
    Description Text not null,
    CustomerId Integer not null,
    ProductTypeId Integer not null
        FOREIGN KEY(CustomerId) references Customer(CustomerId)
        FOREIGN KEY(ProductTypeId) references ProductType(ProductTypeId)
);


Create Table Customer (
    CustomerId Integer not null primary key autoincrement,
    FirstName Text not null,
    LastName Text not null,
    UserActive Integer not null
);

Create Table ProductOrder(
    ProductOrderId Integer not null primary key autoincrement,
    ProductId integer not null,
    OrderId integer not null,
        Foreign Key(ProductId) references Product(ProductId)
        Foreign Key(OrderId) references Orders(OrderId)
);

Create Table Orders(
    OrderId Integer not null primary key autoincrement,
    CustomerAccountId Integer not null, 
        Foreign Key(CustomerAccountId) references Payment(CustomerAcccountId)
);

Create Table Payment(
    PaymentTypeId Integer not null primary key autoincrement,
    CustomerId Integer not null,
        Foreign Key(CustomerId) references Customer(CustomerId)
);
























