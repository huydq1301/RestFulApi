USE [ProductStore]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[cart_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](50) NULL,
	[description] [text] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_detail_id] [int] NOT NULL,
	[order_id] [int] NULL,
	[product_size_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[order_date] [datetime] NULL,
	[total_price] [decimal](10, 2) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](100) NULL,
	[price] [decimal](10, 2) NULL,
	[description] [text] NULL,
	[category_id] [int] NULL,
	[image_url] [varchar](200) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[product_size_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[size] [varchar](10) NULL,
	[quantity] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[token_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[token] [varchar](200) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[review_date] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[role_id] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[wishlist_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (0, 1, 0, 0, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (1, 1, 1, 3, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (2, 2, 3, 4, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (3, 3, 2, 3, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (4, 1, 5, 2, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (5, 2, 4, 0, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (6, 4, 1, 0, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (7, 4, 4, 0, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (10, 1, 3, 3, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (11, 1, 4, 1, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (110, 1, 11, 6, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (120, 2, 0, 2147483647, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (1120, 2, 1110, 5, 0)
INSERT [dbo].[Carts] ([cart_id], [user_id], [product_id], [quantity], [IsDeleted]) VALUES (11110, 1, 11110, 3, 0)
GO
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (0, N'null', N'null', 1)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (1, N'Men''s Clothing', N'Clothing designed for men', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (2, N'Women''s Clothing', N'Clothing designed for women', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (3, N'Children''s Clothing', N'Clothing designed for children', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (4, N'Accessories', N'Clothing and other items to complement an outfit', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (5, N'Shoes', N'Footwear for all occasions', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (10, N'11', N'11', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (11, N'xx', N'xxx', 0)
INSERT [dbo].[Categories] ([category_id], [category_name], [description], [IsDeleted]) VALUES (1111, N'aaaa', N'', 0)
GO
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (0, 0, 1, 1, CAST(95.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (1, 0, 5, 10, CAST(490.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (2, 0, 1, 5, CAST(95.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (3, 1, 2, 3, CAST(57.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (4, 1, 3, 4, CAST(76.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (5, 1, 6, 3, CAST(147.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (10, 0, 5, 10, CAST(490.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (51, 3, 3, 5, CAST(76.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_size_id], [quantity], [price], [IsDeleted]) VALUES (90, 3, 3, 4, CAST(76.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_price], [IsDeleted]) VALUES (0, 1, CAST(N'2023-04-21T16:21:56.417' AS DateTime), CAST(15083.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_price], [IsDeleted]) VALUES (1, 2, CAST(N'2023-04-21T16:21:56.417' AS DateTime), CAST(683.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_price], [IsDeleted]) VALUES (3, 1, CAST(N'2023-04-24T03:13:01.257' AS DateTime), CAST(171.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (0, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', 1, N'1', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (1, N'string', CAST(111.00 AS Decimal(10, 2)), N'string', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (2, N'Women''s Dress', CAST(49.99 AS Decimal(10, 2)), N'A stylish and elegant dress for women', 1, N'https://example.com/images/dress.jpg', 1)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (3, N'Children''s Jeans', CAST(29.99 AS Decimal(10, 2)), N'A sturdy and durable pair of jeans for kids', 1, N'https://example.com/images/jeans.jpg', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (4, N'Sunglasses', CAST(14.99 AS Decimal(10, 2)), N'Stylish and practical sunglasses for all occasions', 1, N'https://example.com/images/sunglasses.jpg', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (5, N'Men''s Dress Shoes', CAST(79.99 AS Decimal(10, 2)), N'A classic and sophisticated pair of dress shoes for men', 1, N'https://example.com/images/dressshoes.jpg', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (10, N'string', CAST(5.00 AS Decimal(10, 2)), N'stringstri', 0, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (11, N'aaaaa', CAST(0.00 AS Decimal(10, 2)), N'2222222222222', 0, N'', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (110, N'aaa', CAST(333.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (111, N'aaaa', CAST(3.00 AS Decimal(10, 2)), N'r?t rratas rat', 1, N'avv.com', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (1110, N'aaa', CAST(33333333.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (11110, N'string', CAST(1.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (99999, N'aaaaaaa', CAST(555.00 AS Decimal(10, 2)), N'stringstri', 0, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (111110, N'string', CAST(211.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (1111110, N'string', CAST(222.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [description], [category_id], [image_url], [IsDeleted]) VALUES (11111110, N'string', CAST(333.00 AS Decimal(10, 2)), N'stringstri', 1, N'string', 0)
GO
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (1, 1, CAST(19.99 AS Decimal(10, 2)), N'S', 5, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (2, 1, CAST(19.99 AS Decimal(10, 2)), N'M', 17, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (3, 1, CAST(19.99 AS Decimal(10, 2)), N'L', 2, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (4, 2, CAST(49.99 AS Decimal(10, 2)), N'S', 5, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (5, 2, CAST(49.99 AS Decimal(10, 2)), N'M', 10, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (6, 2, CAST(49.99 AS Decimal(10, 2)), N'XL', 27, 0)
INSERT [dbo].[ProductSize] ([product_size_id], [product_id], [price], [size], [quantity], [IsDeleted]) VALUES (7, 3, CAST(29.99 AS Decimal(10, 2)), N'S', 22, 0)
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (33, 1, N'6X+JsArbBfmoHnciFPsgrGaFU8juTWm4yZ4fZKjb7Jw=', CAST(N'2023-10-21T03:09:21.307' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (34, 1, N'Wwwdpw9jk2lK4iJHZZazFL5GFROM8JxzBQFLittrDBg=', CAST(N'2023-10-21T03:11:33.457' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (35, 1, N'pW0A+tHcmT8NcwNnyV4AgcjIpt1FPmiFidRBqT2BII4=', CAST(N'2023-10-21T03:13:35.397' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (36, 1, N'D9u36iIwPRncecPge4u7IVsxhFCoIJH4uO2Xix05P9E=', CAST(N'2023-10-21T03:16:01.593' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (37, 1, N'Z2b4Kj0W6Jp4JcNvEKAHPAxkELqbLZWy1SWeQUwu/Io=', CAST(N'2023-10-21T03:22:57.963' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (38, 1, N'N0qyt+CF68aAvRi5BHd8E9LoU2i7ciXn8MRaupan6UY=', CAST(N'2023-10-21T03:37:00.073' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (39, 1, N'x2CIEJpVLoZXw8KgqhPPJQ0LuQ0WsawGQCTwR6/l3qY=', CAST(N'2023-10-21T03:37:03.983' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (40, 1, N'topGr9hFYIsmsb1ta52i4+tbDCaCbIhrxhVfcqIc54Q=', CAST(N'2023-10-21T03:38:16.257' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (41, 1, N'xTWZV/XgbPhfqujx5qxZS+qqOSw5Wbge04wYExH0NSg=', CAST(N'2023-10-21T03:40:36.713' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (42, 1, N'GVKmeo7f7XlWUKRRRyb46C2b1nqjTyygy4dUurqBUwE=', CAST(N'2023-10-21T03:41:52.113' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (43, 1, N'HpV5uNI8sgpspbY48ZdWSRB/JnX4bzwKW2Dyjk0cjLk=', CAST(N'2023-10-21T03:41:57.680' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (44, 1, N'NTwlg8iI0OzqoVpqJuWrDGPbWxgxwtpKIUbcRn4KZ84=', CAST(N'2023-10-21T03:42:00.500' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (45, 1, N'34vm8p0Ct2KDhzFXb0Gk6zsh7gwjTWENHYr4MsiE42I=', CAST(N'2023-10-21T03:44:08.463' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (46, 1, N'gYGM29941ZR5dbUce4Nd/3o25GK/5gKQJLG3DDp/248=', CAST(N'2023-10-21T03:46:17.573' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (47, 1, N'jZgTYJO8WaIwy1lC/MKXdeOROlrnUf/BU5dNwwSvZhM=', CAST(N'2023-10-21T04:11:45.840' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (48, 1, N'JWj8HX/+5IQhsMCavDWaN1JYnfiat5dMl2JBdXPdeZo=', CAST(N'2023-10-21T04:22:28.597' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (49, 1, N'yg3wN52Uvb+nWfFKdnjUKmjkbi4jSg5I1MXImqhmMOQ=', CAST(N'2023-10-21T04:32:41.323' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (50, 1, N'1v+JaNLAGwR887SLGx26E//ikytKzE/+8+Q0GAS+aPk=', CAST(N'2023-10-21T04:33:47.337' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (51, 1, N'xDGbkdEFtWc8eOY5h+aJGnXwX5JB1/mabx5CuStfWMc=', CAST(N'2023-10-21T04:35:43.073' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (52, 1, N'6C1CeSSEiJfLx2SiL8fCFnJVTSfRQxcgiHKWy/f03Us=', CAST(N'2023-10-21T04:36:34.223' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (53, 1, N'7Ljl+AWCjc0V2iSc2/PMW0lqpbycxZgTgETRaqbw4a4=', CAST(N'2023-10-21T04:36:54.140' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (54, 1, N'I1njyWinVITs1w+g48bug49e07ERlKIhQKp1J5Kh1RA=', CAST(N'2023-10-21T04:56:21.180' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (55, 1, N'CrcMiyfSjqwN6ENGPm/3bZjp37rrrJnu8Q6zeRiYAjA=', CAST(N'2023-10-21T05:00:28.700' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (56, 1, N'kkojLKnE3iGHozZ9rGq2h4IGPtrN1KwWG6wZLEgkK30=', CAST(N'2023-10-21T05:00:43.360' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (57, 1, N'YN4161VhdsYPKz2ygGhPEJvXjzXUgMA98yp9RAH/Pz4=', CAST(N'2023-10-21T05:04:36.727' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (58, 1, N'gOBe2zDp1bLDIbjRb4iH84klguvcW7fbpoUBomKszjc=', CAST(N'2023-10-21T05:08:46.897' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (59, 1, N'BrPhde//m4bzSlpjh1LOdFk4WzYFlDVcqBL1b3C00b8=', CAST(N'2023-10-21T05:12:03.957' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (60, 1, N'7O8xI6GuH5Zv4PCap1FlXSagpbVhZF3QUMPq9IVA/dM=', CAST(N'2023-10-21T05:14:12.970' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (61, 1, N'NYcmnmRcUx0AIq0JHDRXbUEOPlrS+eUqx/f+Vov/WNc=', CAST(N'2023-10-21T05:22:37.990' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (62, 1, N'l0Y5FHJLfS1Ts5+5KM2ItyVcjlCZ2/7N+CSC18fkGjk=', CAST(N'2023-10-21T05:27:55.173' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (63, 1, N'R9CFyUWnTSL1bzJnW/zw6FcMlnIvN/2KV+7H9lSQ49k=', CAST(N'2023-10-21T05:33:54.513' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (64, 1, N'9IYwx9w5JgniUSZuhfa6fLBlKt4j6QD+A3DwwHqg3ac=', CAST(N'2023-10-21T05:39:20.640' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (65, 1, N'+ySmpkZWCVor2D9nuahH24LV2EX+1gt3e1dEULKRF6Y=', CAST(N'2023-10-21T05:43:43.093' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (66, 1, N'm0BCqeFI1zsSx8ne4ob+JOdkYrEE9+2/5b1B4EBrcIU=', CAST(N'2023-10-21T05:53:14.700' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (67, 1, N'4S9NY9gci/DoSXeCleq5oNS0lVH/Ea9xwS/b1Kj26xE=', CAST(N'2023-10-21T05:59:05.063' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (68, 1, N'Q3ouerMunXr4qiRLabb4gOvuJzRtg92o6uWjA57gunU=', CAST(N'2023-10-21T06:02:53.147' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (69, 2, N'bFp9AlyyaT4fP96LYSmGT5C1D05jBF37ie4S7F3z+mo=', CAST(N'2023-10-21T06:22:47.953' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (70, 2, N'lOX+BOPdYFd5gcCoon4G/8L1bHbEXap9G0jg5PwYja0=', CAST(N'2023-10-21T06:24:54.037' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (71, 1, N'K5boLDIhqF99Ws8nX8gVUuAwyIWOWyD0Lp1Kmyhi4vA=', CAST(N'2023-10-21T07:08:56.150' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (72, 1, N'KhEGtqgutWnO8evmuackk8rrXB1sCTUYybf+uEkJb2Y=', CAST(N'2023-10-21T15:53:29.253' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (73, 1, N'CVnsqa09PVPc03OzuNSdTuvqFSFK9VtHSWb23SURf74=', CAST(N'2023-10-21T15:56:14.250' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (74, 1, N'6ryw4Ic3D/jpZmQKR9O3A19qRLB5LgEm/UgXtzwm520=', CAST(N'2023-10-21T15:59:38.707' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (75, 1, N'mH72YW54f5FmlWjg2rUVPAmFwfO/Ggb7g4Q/H8JNAr0=', CAST(N'2023-10-21T16:02:30.737' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (76, 2, N'Lbigoap9vsU+C707LiWqWeehYlWF5WAHzk46JDHWIEU=', CAST(N'2023-10-21T16:14:23.903' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (77, 1, N'4dNr+vy8tT6oJ0bvzbR+3u2pCY4/8SxFeypbtuCwd0c=', CAST(N'2023-10-21T16:19:29.720' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (78, 1, N'8UW/G53oN39QBhyhmLIx5by9RTYNaMFFcTLRxU9bcLo=', CAST(N'2023-10-21T16:31:25.633' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (79, 1, N'nyLLDI/YC3RTnxO3hzUjSoOyAKei+3vLHX7cM040hDk=', CAST(N'2023-10-21T16:40:50.323' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (80, 1, N'4Qmngg6O2Wp1I400pGSin0bDxha7f6rwI0NfgZDhASs=', CAST(N'2023-10-21T16:48:22.853' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (81, 1, N'pgx67HsGOGBj5ZEdhaJfV2TjEcFNHC4OUfoDPUsNkxs=', CAST(N'2023-10-21T17:03:59.570' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (82, 1, N'j044TFF6uFCr61m+ZUm62vFCssfrK5J2UNPkjPWpP7I=', CAST(N'2023-10-21T17:14:28.607' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (83, 1, N'CW4gYagc3HtKyNtQFV55fuGHxqsk2u0lNox1iE0ZqXs=', CAST(N'2023-10-21T17:25:32.430' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (84, 1, N'cvctEEf57EpI9DOpPNtTobex8u0pBpbg3FfNDYVsd/s=', CAST(N'2023-10-21T17:34:07.463' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (85, 1, N'EGxp+QRHGHj7LAFeHISMOhuYLIE1oJsj8ss7hbE51Qo=', CAST(N'2023-10-22T10:11:58.240' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (86, 1, N'cReKmNJCJ8+6dk+Aj0WSbnzyu0DjtUXh4FjDtryBIXc=', CAST(N'2023-10-22T10:52:48.280' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (87, 1, N'CoBhK4VEsZ6m77DUXWWlUTNXCrbTdnSRrF/jhubYK6s=', CAST(N'2023-10-24T02:01:27.373' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (88, 1, N'94YrgFELuBztbQSYfJ08F997M1fhzw+FeuoR14UOAPE=', CAST(N'2023-10-24T02:14:18.420' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (89, 1, N'Fi7vXJdUqIR3fr5TaorpLB8kZgXMJjWZhNYw3Y52TD0=', CAST(N'2023-10-24T03:03:51.117' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (90, 1, N'H9F8Si0dPN7qnDw94b0gpRAYFapssHEw7QUP6lyhJvw=', CAST(N'2023-10-24T03:04:38.930' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (91, 1, N'CHwzGMjCAuGG5mhkh0Kai/k2z7Kobtq180LTeyyXMEU=', CAST(N'2023-10-24T03:14:55.897' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (92, 2, N'90iLu7pf6gf/HPEqoAipc5jhB9f+N3wpNdgqFgLDJmU=', CAST(N'2023-10-24T03:37:11.787' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (93, 2, N'tf+TaAhO1lrSrasAx2kRSaBBDqUR62ZEG5SJwL28DdI=', CAST(N'2023-10-24T03:57:45.047' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (94, 2, N'1dG9O26yQIELED5Sc3OLNSPHrTuOtMQ0bynce7lXn2Y=', CAST(N'2023-10-24T04:00:03.830' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (95, 2, N'Ck86eOhe9Gp/zR5GYl4oa04OMnpf5PuYthfsfi908bg=', CAST(N'2023-10-24T04:02:40.113' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (96, 1, N'kp5IoiAskoZjBMU4IhOfoBrpgH/apnjNYCdHGGNRDRQ=', CAST(N'2023-10-24T04:54:44.370' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (97, 2, N'FlNIN+Ai+0H+fmBbX9KLd4wUY6ZCwEwiDXQDaisRM+c=', CAST(N'2023-10-24T04:58:53.090' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (98, 1, N'1r0+Pb4QKw9Uc9OlQ5tFdrLQQj3nnQ7dAsxDFf7s/5A=', CAST(N'2023-10-24T04:59:55.967' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (99, 2, N'KHT5wXUh7eUYUCxM8gX+gy10zeFhKUjRE7gA8Pu5cV0=', CAST(N'2023-11-06T00:54:37.320' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (100, 1, N'VUE9hGEndiB4YzOzjslfCEdbELfvTl63XNgFbYmJE/8=', CAST(N'2023-11-06T01:02:16.890' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (101, 1, N'B3cStJk6XWyVhP+3aS6GESpUjr4bnahEr5CetzCG2aU=', CAST(N'2023-11-06T01:07:55.077' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (102, 1, N'j1QA86Flf4aZNbtmMDDiHgI3P4jk0z8xWyI+zgLCyfI=', CAST(N'2023-11-06T01:17:58.913' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (103, 1, N'Uw23/MxP/CjgX3+qalxVLDq4WTWRvzVkAdq95JLFE+k=', CAST(N'2023-11-06T02:15:06.240' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (104, 1, N'fJyHuTvkNLA4QobQqFi4ay39LtcXKeHQo7RBANIPNgY=', CAST(N'2023-11-06T02:16:52.487' AS DateTime))
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (0, 2, 2, 0, N's?n ph?m d?p', CAST(N'2023-04-19T02:55:56.887' AS DateTime), 1)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (1, 2, 4, 4, N'S?n ph?m ch?t lu?ng t?t, tôi r?t hài lòng', CAST(N'2022-03-12T14:23:00.000' AS DateTime), 0)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (2, 1, 5, 5, N'Qu?n áo r?t d?p, dúng nhu mô t?', CAST(N'2022-04-01T09:12:00.000' AS DateTime), 0)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (3, 3, 3, 3, N'Ch?t lu?ng s?n ph?m t?m du?c', CAST(N'2022-05-05T18:45:00.000' AS DateTime), 0)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (4, 4, 1, 2, N'tuy?t v?i', CAST(N'2022-05-25T10:30:00.000' AS DateTime), 0)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (5, 1, 5, 0, N'555', CAST(N'2022-06-15T16:20:00.000' AS DateTime), 0)
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date], [IsDeleted]) VALUES (10, 1, 4, 5, N'string', CAST(N'2023-04-21T17:10:59.093' AS DateTime), 0)
GO
INSERT [dbo].[Roles] ([role_id], [name], [IsDeleted]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Roles] ([role_id], [name], [IsDeleted]) VALUES (2, N'Customer', 0)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (0, N'string', N'string', N'user@example.com', N'string', N'string', 2, 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (1, N'admin', N'123', N'user@example.com', N'111111', N'aaaaa', 1, 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (2, N'abc', N'123', N'customer1@example.com', N'555-1234', N'456 Main Street, Anytown, USA', 2, 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (3, N'customer2', N'123', N'customer2@example.com', N'555-5678', N'789 Main Street, Anytown, USA', 2, 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (4, N'customer3', N'123', N'customer3@example.com', N'555-1111', N'111 Main Street, Anytown, USA', 2, 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (5, N'customer4', N'123', N'customer4example.com', N'555-2222', N'222 Main Street, Anytown, USA', 2, 1)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [phone], [address], [role_id], [IsDeleted]) VALUES (11, N'abc', N'abc', N'111@example.com', N'0388372282', N'aaa ssss', 2, 0)
GO
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (0, 4, 3, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (1, 1, 2, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (2, 1, 5, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (3, 2, 1, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (4, 3, 4, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (5, 3, 3, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (6, 4, 2, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (10, 1, 4, 0)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id], [IsDeleted]) VALUES (11, 1, 3, 0)
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSize] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Wishlist] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_size_id])
REFERENCES [dbo].[ProductSize] ([product_size_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  Trigger [dbo].[TotalPrice]    Script Date: 5/23/2023 5:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[TotalPrice] on [dbo].[OrderDetails]
for insert, update, delete as
begin
	declare @OrderId int, @OrderID1 int, @OrderID2 int, @dongia money, @price1 int, @price2 int
	select @OrderID1=order_id from inserted
	select @OrderID2=order_id, @price2=price from deleted
	select @price1=price from OrderDetails where order_id = @OrderID1
	if @OrderID1 is null 
		set @OrderId=@OrderID2
	else 
		set @OrderId=@OrderID1	
	update Orders set total_price=isnull(total_price,0)+isnull(@price1,0)- isnull(@price2,0) where  order_id=@OrderId
end
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [TotalPrice]
GO
/****** Object:  Trigger [dbo].[updateQuantity]    Script Date: 5/23/2023 5:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[updateQuantity] ON [dbo].[OrderDetails]
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProductSizeId INT, @Quantity INT;

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @ProductSizeId = product_size_id, @Quantity = quantity 
        FROM inserted;
        
        UPDATE ProductSize
        SET quantity = (quantity - @Quantity)
        WHERE product_size_id = @ProductSizeId;
    END
    ELSE
    BEGIN
        SELECT @ProductSizeId = product_size_id, @Quantity = quantity 
        FROM deleted;
        
        UPDATE ProductSize
        SET quantity = (quantity + @Quantity)
        WHERE product_size_id = @ProductSizeId;
    END
END
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [updateQuantity]
GO
/****** Object:  Trigger [dbo].[updatetienban]    Script Date: 5/23/2023 5:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[updatetienban] ON [dbo].[OrderDetails]
FOR Insert, Update
AS
BEGIN
	DECLARE @ProductSizeId int, @Quantity int, @Price int
	SELECT @ProductSizeId = product_size_id, @Quantity=quantity FROM inserted
	select @Price = price from ProductSize where product_size_id = @ProductSizeId
	UPDATE [OrderDetails]
	SET price = (@Quantity*@Price)
	WHERE product_size_id = @ProductSizeId
END
GO
ALTER TABLE [dbo].[OrderDetails] ENABLE TRIGGER [updatetienban]
GO
