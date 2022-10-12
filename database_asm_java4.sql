USE MASTER
GO

IF DB_ID('quanlybanhang') IS NOT NULL BEGIN
DROP DATABASE quanlybanhang
END
GO

CREATE DATABASE quanlybanhang;
GO

USE quanlybanhang
GO

CREATE TABLE danhmuc
(
	madm			nvarchar(50)	PRIMARY KEY NOT NULL,
	tendanhmuc		nvarchar(255)	NULL,
	ghichu			ntext			NULL
)	
GO

CREATE TABLE sanpham
(
	masp			nvarchar(50)	PRIMARY KEY NOT NULL,
	tensp			nvarchar(255)	NULL,
	giasp			decimal(12,3)	NULL,
	mota			ntext			NULL,
	hinh			nvarchar(255)	NULL,
	soluong			int				NULL,
	madm			nvarchar(50)	FOREIGN KEY REFERENCES danhmuc(madm)
)
GO

CREATE TABLE [user]
(
	id				int				PRIMARY KEY IDENTITY(1,1) NOT NULL,
	username		nvarchar(50)	NOT NULL,
	[password]		nvarchar(50)	NULL,
	fullname		nvarchar(50)	NULL,
	email			nvarchar(50)	NULL,
	phone			nchar(10)		NULL,
	[role]			int				NULL,
)
GO

CREATE TABLE hoadon
(
	id				int				PRIMARY KEY IDENTITY(1,1) NOT NULL,
	userId			int				FOREIGN KEY REFERENCES [user](id),
	tongtien		decimal(12,3)	NOT NULL,
	dienthoai		varchar(11)		NOT NULL,
	diachi			nvarchar(255)	NOT NULL
)
GO

CREATE TABLE hoadonchitiet
(
	id				int				PRIMARY KEY IDENTITY(1,1) NOT NULL,
	mahd			int				FOREIGN KEY REFERENCES hoadon(id),
	masp			nvarchar(50)	FOREIGN KEY REFERENCES sanpham(masp),
	soluong			int				NOT NULL,
	gia				decimal(12,3)	NOT NULL
)	
GO

INSERT INTO danhmuc(madm, tendanhmuc, ghichu) VALUES 
('dm01', N'Laptop', N'Gaming và Văn phòng'),
('dm02', N'Tai nghe', N'Phục vụ Game và Nhạc'),
('dm03', N'Thiết bị di động', N'Điện thoại, Máy tính bảng'),
('dm04', N'Máy ảnh', N'Chụp hình, Quay phim')
GO

INSERT INTO sanpham(masp, tensp, giasp, mota, hinh, soluong, madm) VALUES 
('sp01', N'MacBook Air M1', 5000000, N'RAM 16 GB', 'product01.png', 10, 'dm01'),
('sp02', N'Tai nghe Gaming', 100000, N'Âm thanh chất lượng cao', 'product02.png', 10, 'dm02'),
('sp03', N'MacBook Pro M1', 345676, N'SSD 256 GB', 'product03.png', 10, 'dm01'),
('sp04', N'Máy tính bảng', 888800, N'Màn hình Full-HD', 'product04.png', 10, 'dm03'),
('sp05', N'Tai nghe nhạc', 678445, N'Âm thanh chất lượng cao', 'product05.png', 10, 'dm02'),
('sp06', N'Laptop MSI', 566655, N'i7, 10750H, 2.6GHz', 'product06.png', 10, 'dm01'),
('sp07', N'Điện thoại Samsung', 435365, N'Cực mượt', 'product07.png', 10, 'dm03'),
('sp08', N'Laptop ASUS', 324334, N'15.6", Full HD', 'product08.png', 10, 'dm01'),
('sp09', N'Máy ảnh Rekam', 453545, N'Độ phân giải lớn', 'product09.png', 10, 'dm04')
GO

INSERT INTO [user](username, [password], fullname, email, phone, [role]) VALUES
('dang', '111', N'Đào Hồng Đăng', 'dang@fpt.edu.vn', '0961045424', 1),
('user', '222', N'Người Dùng', 'user@fpt.edu.vn', '0123456789', 0)
GO