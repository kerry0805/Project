CREATE DATABASE SHOPPING;
GO
USE SHOPPING;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tạo bảng category
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng subcategory
CREATE TABLE [dbo].[subcategory](
	[subcategory_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[subcategory_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED 
(
	[subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng brand
CREATE TABLE [dbo].[brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng product
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[subcategory_id] [int] NULL,
	[brand_id] [int] NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Tạo bảng product_color
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

-- Tạo bảng product_memory
CREATE TABLE [dbo].[product_memory](
	[product_id] [varchar](100) NOT NULL,
	[memory] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

-- Tạo bảng users
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng bill
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Tạo bảng bill_detail
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[memory] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tạo bảng cart
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Thêm khóa ngoại cho bảng subcategory
ALTER TABLE [dbo].[subcategory] ADD CONSTRAINT [FK_subcategory_category]
FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([category_id]);
GO

-- Thêm khóa ngoại cho bảng brand
ALTER TABLE [dbo].[brand] ADD CONSTRAINT [FK_brand_category]
FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([category_id]);
GO

-- Thêm khóa ngoại cho bảng product
ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK_product_category]
FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([category_id]);
GO

ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK_product_subcategory]
FOREIGN KEY ([subcategory_id]) REFERENCES [dbo].[subcategory] ([subcategory_id]);
GO

ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK_product_brand]
FOREIGN KEY ([brand_id]) REFERENCES [dbo].[brand] ([brand_id]);
GO

-- Thêm khóa ngoại cho bảng bill
ALTER TABLE [dbo].[bill] ADD CONSTRAINT [FK_bill_users]
FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]);
GO

-- Thêm khóa ngoại cho bảng bill_detail
ALTER TABLE [dbo].[bill_detail] ADD CONSTRAINT [FK_bill_detail_bill]
FOREIGN KEY ([bill_id]) REFERENCES [dbo].[bill] ([bill_id]);
GO

ALTER TABLE [dbo].[bill_detail] ADD CONSTRAINT [FK_bill_detail_product]
FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([product_id]);
GO

-- Thêm khóa ngoại cho bảng cart
ALTER TABLE [dbo].[cart] ADD CONSTRAINT [FK_cart_product]
FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([product_id]);
GO

-- Thêm khóa ngoại cho bảng product_color
ALTER TABLE [dbo].[product_color] ADD CONSTRAINT [FK_product_color_product]
FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([product_id]);
GO

-- Thêm khóa ngoại cho bảng product_memory
ALTER TABLE [dbo].[product_memory] ADD CONSTRAINT [FK_product_memory_product]
FOREIGN KEY ([product_id]) REFERENCES [dbo].[product] ([product_id]);
GO

-- Insert dữ liệu vào bảng category
SET IDENTITY_INSERT [dbo].[category] ON 
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'CAMERA')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'MOBILE')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'CELLPHONE')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'CONSOLE')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'LAPTOP')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'TV')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'TABLET')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (8, N'MONITOR')
SET IDENTITY_INSERT [dbo].[category] OFF
GO

-- Insert dữ liệu vào bảng subcategory
INSERT INTO [dbo].[subcategory] ([category_id], [subcategory_name]) VALUES 
(1, N'DSLR Camera'), 
(1, N'Mirrorless Camera'),  
(4, N'Gaming Console'), 
(4, N'Family Console'),
(5, N'Gaming Laptop'), 
(5, N'Business Laptop');
GO

-- Insert dữ liệu vào bảng brand
-- CAMERA
INSERT INTO [dbo].[brand] ([category_id], [brand_name]) VALUES 
(1, N'Canon'),
(1, N'Nikon'),
(1, N'Sony');

-- MOBILE
INSERT INTO [dbo].[brand] ([category_id], [brand_name]) VALUES 
(2, N'Apple'),
(2, N'Samsung'),
(2, N'Sony');

-- CELLPHONE
INSERT INTO [dbo].[brand] ([category_id], [brand_name]) VALUES 
(3, N'Nokia'),
(3, N'BlackBerry');

-- CONSOLE
INSERT INTO [dbo].[brand] ([category_id], [brand_name]) VALUES 
(4, N'Nintendo'),
(4, N'Sony');

-- LAPTOP
INSERT INTO [dbo].[brand] ([category_id], [brand_name]) VALUES 
(5, N'Acer'),
(5, N'Lenovo'),
(5, N'Asus');
GO

-- Insert dữ liệu vào bảng product
INSERT [dbo].[product] ([product_id], [category_id], [subcategory_id], [brand_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES 
(N'CCR8', 1, 1, 1, N'Canon EOS R8', 27,490,000, N'Máy ảnh mirrorless Canon EOS R8 có cảm biến CMOS 24.2MP kết hợp với bộ xử lý DIGIC X mang đến hiệu suất chụp ảnh tĩnh vượt trội, chất lượng video 4K60p 10bit ấn tượng và lấy nét tự động nhanh. Camera được trang bị kính ngắm điện tử EVF 2.36 triệu điểm, màn hình LCD đa góc 3 inch cùng màn trập điện tử tốc độ 40fps. Canon R8 với khả năng chụp ảnh và quay video mạnh mẽ cùng thiết kế nhỏ gọn thích hợp cho nhiếp ảnh gia và người sáng tạo nội dung.', 10, N'images/canon-eos-r8.jpg')
GO

-- Insert dữ liệu vào bảng product_color
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'CCR8', N'Black')
GO

-- Insert dữ liệu vào bảng product_memory
INSERT [dbo].[product_memory] ([product_id], [memory]) VALUES (N'CCR8', N'none')
GO

-- Insert dữ liệu vào bảng users
SET IDENTITY_INSERT [dbo].[users] ON 
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (1, N'kerry', N'syhuytran2005@gmail.com', N'12345678', N'TRUE')
SET IDENTITY_INSERT [dbo].[users] OFF
GO