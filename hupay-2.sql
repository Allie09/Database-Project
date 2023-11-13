CREATE TABLE [Vendors] (
	vendorId int NOT NULL,
	name varchar NOT NULL,
	email varchar NOT NULL,
	password varchar NOT NULL,
	cnic numeric NOT NULL,
	isActive boolean NOT NULL,
	balance money NOT NULL,
	location varchar NOT NULL,
  CONSTRAINT [PK_VENDORS] PRIMARY KEY CLUSTERED
  (
  [vendorId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Students] (
	studentId int NOT NULL,
	name varchar NOT NULL,
	email varchar NOT NULL,
	password varchar NOT NULL,
	balance money NOT NULL,
	isActive boolean NOT NULL,
  CONSTRAINT [PK_STUDENTS] PRIMARY KEY CLUSTERED
  (
  [studentId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Codes] (
	codeId varchar NOT NULL,
	amount money NOT NULL,
  CONSTRAINT [PK_CODES] PRIMARY KEY CLUSTERED
  (
  [codeId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Orders] (
	orderId int NOT NULL,
	studentId int NOT NULL,
	vendorId int NOT NULL,
	totalPrice money NOT NULL,
	isAccepted boolean NOT NULL,
	date date NOT NULL,
  CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED
  (
  [orderId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [OrderDetails] (
	orderId int NOT NULL,
	productId int NOT NULL,
	unitPrice money NOT NULL,
	quantity int NOT NULL,
  CONSTRAINT [PK_ORDERDETAILS] PRIMARY KEY CLUSTERED
  (
  [orderId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Products] (
	productId int NOT NULL,
	vendorId int NOT NULL,
	categoryId int NOT NULL,
	description varchar NOT NULL,
	unitPrice money NOT NULL,
	in_stock boolean NOT NULL,
	picUrl text NOT NULL,
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED
  (
  [productId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ProductDays] (
	productId int NOT NULL,
	day date NOT NULL,
  CONSTRAINT [PK_PRODUCTDAYS] PRIMARY KEY CLUSTERED
  (
  [productId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Categories] (
	categoryId int NOT NULL,
	categoryName varchar NOT NULL,
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [categoryId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO



ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk0] FOREIGN KEY ([studentId]) REFERENCES [Students]([studentId])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk0]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk1] FOREIGN KEY ([vendorId]) REFERENCES [Vendors]([vendorId])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk1]
GO

ALTER TABLE [OrderDetails] WITH CHECK ADD CONSTRAINT [OrderDetails_fk0] FOREIGN KEY ([orderId]) REFERENCES [Orders]([orderId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [OrderDetails_fk0]
GO

ALTER TABLE [Products] WITH CHECK ADD CONSTRAINT [Products_fk0] FOREIGN KEY ([vendorId]) REFERENCES [Vendors]([vendorId])
ON UPDATE CASCADE
GO
ALTER TABLE [Products] CHECK CONSTRAINT [Products_fk0]
GO
ALTER TABLE [Products] WITH CHECK ADD CONSTRAINT [Products_fk1] FOREIGN KEY ([categoryId]) REFERENCES [Categories]([categoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [Products] CHECK CONSTRAINT [Products_fk1]
GO

ALTER TABLE [ProductDays] WITH CHECK ADD CONSTRAINT [ProductDays_fk0] FOREIGN KEY ([productId]) REFERENCES [Products]([productId])
ON UPDATE CASCADE
GO
ALTER TABLE [ProductDays] CHECK CONSTRAINT [ProductDays_fk0]
GO


