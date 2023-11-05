
CREATE DATABASE QLNX
GO
USE QLNX
GO
CREATE TABLE NHA_CC(
   MaNCC VARCHAR(10) PRIMARY KEY,
   HoTen NVARCHAR(20),
   DienThoai NVARCHAR(20),
   Diachi NVARCHAR(255),
   Email NVARCHAR(255)
)
Go
CREATE TABLE HD_NHAP(
   MaHDN VARCHAR(10) PRIMARY KEY,
   NgayHD DATE,
   MaNCC VARCHAR(10),
   MaK VARCHAR(10),
   MaNV varchar(10),
)
GO
CREATE TABLE KHO(
    MaK VARCHAR(10) PRIMARY KEY,
	TenK NVARCHAR(255),
	DiaChi NVARCHAR(255),
)
GO
CREATE TABLE NHAN_VIEN(
    MaNV VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(255),
	NgaySinh DATE,
	QueQuan NVARCHAR(255),
	SoCMND NVARCHAR(255),
	MaPB VARCHAR(10),
 )
 GO
 CREATE TABLE CT_NHAP(
    MaHDN VARCHAR(10),
	MaMH VARCHAR(10),
	SoLuong INT,
	DonGia INT,
	PRIMARY KEY(MaHDN,MaMH),
 )
 GO
 CREATE TABLE MAT_HANG(
    MaMH VARCHAR(10) PRIMARY KEY,
	TenMH NVARCHAR(255),
	DonViTinh NVARCHAR(255),

 )
 GO
 CREATE TABLE KHACH_HANG(
   MaKH VARCHAR(10) PRIMARY KEY,
   HoTen NVARCHAR(255),
   DienThoai NVARCHAR(255),
   DiaChi NVARCHAR(255),
   Email NVARCHAR(255),
 )
 GO
 CREATE TABLE HD_XUAT(
   MaHDX VARCHAR(10) PRIMARY KEY,
   NgayHD DATE,
   MaNV VARCHAR(10),
   MaK VARCHAR(10),
   MaKH VARCHAR(10)
 )
 GO
 CREATE TABLE PHONG_BAN(
   MaPB VARCHAR(10) PRIMARY KEY,
   TenPB NVARCHAR(255),
   DienThoai NVARCHAR(255),
 )
 GO
 CREATE TABLE CT_XUAT(
   MaHDX VARCHAR(10),
   MaMH VARCHAR(10),
   SoLuong INT,
   DonGia INT,
   PRIMARY KEY(MaHDX,MaMH),
 )
 GO
 CREATE TABLE LOAISANPHAM(
   MaLoaiSP VARCHAR(10) PRIMARY KEY,
   TenLoaiSP NVARCHAR(255),
   DacDiem NVARCHAR(255),
   MaMH VARCHAR(10)
 )
 GO

  ALTER TABLE dbo.HD_NHAP ADD FOREIGN KEY(MaNCC) REFERENCES dbo.NHA_CC(MaNCC);
 ALTER TABLE dbo.HD_NHAP ADD FOREIGN KEY(MaK) REFERENCES dbo.KHO(MaK);
 ALTER TABLE dbo.HD_NHAP ADD FOREIGN KEY(MaNV) REFERENCES dbo.NHAN_VIEN(MaNV);
 ALTER TABLE dbo.CT_NHAP ADD FOREIGN KEY(MaHDN) REFERENCES dbo.HD_NHAP(MaHDN);
 ALTER TABLE dbo.CT_NHAP ADD FOREIGN KEY(MaMH) REFERENCES dbo.MAT_HANG(MaMH);

 ALTER TABLE dbo.NHAN_VIEN ADD FOREIGN KEY(MaPB) REFERENCES dbo.PHONG_BAN(MaPB);

  ALTER TABLE dbo.HD_XUAT ADD FOREIGN KEY(MaNV) REFERENCES dbo.NHAN_VIEN(MaNV);
  ALTER TABLE dbo.HD_XUAT ADD FOREIGN KEY(MaK) REFERENCES dbo.KHO(MaK);
  ALTER TABLE dbo.HD_XUAT ADD FOREIGN KEY(MaKH) REFERENCES dbo.KHACH_HANG(MaKH);

 ALTER TABLE dbo.CT_XUAT ADD FOREIGN KEY(MaHDX) REFERENCES dbo.HD_XUAT(MaHDX);
 ALTER TABLE dbo.CT_XUAT ADD FOREIGN KEY(MaMH) REFERENCES dbo.MAT_HANG(MaMH);


  INSERT INTO dbo.NHA_CC
 VALUES 
 ('01', 'NCC-THV', '0123456', 'Nghe An', '12@gmail.com'),
 ('02', 'Nguyen Van Hoai Bao', '01234567', 'Nghe An', '123@gmail.com'),
 ('03', 'Nguyen Van B', '012345678', 'Da Nang', '123@gmail.com'),
 ('04', 'Nguyen Van A', '0123456789', 'Quang Nam', '123@gmail.com');

 INSERT INTO dbo.NHA_CC
 VALUES ('05','Nhà phân phối C','0302370','Quảng Ngãi','c@gmail.com');
 INSERT INTO dbo.HD_NHAP
 VALUES 
 ('HDN01','2019/03/20','01','K01','NV01'),
 ('HDN02','2014/02/03','02','K04','NV03'),
 ('HDN03','2015/08/10','01','K01','NV01'),
 ('HDN04','2021/09/28','04','K03','NV02');

 INSERT INTO dbo.CT_NHAP
 VALUES
( 'HDN03','MH01',2,	150000),
('HDN02','MH03',	4,	300000),
('HDN02','MH02',	1,	75000),
('HDN05','MH02',	4,	300000),
('HDN04','MH04',	5,	375000),
('HDN01','MH05',	3	,225000);

INSERT INTO dbo.KHO
VALUES
('K01',	'KhoSach',	'Q1'),
('K02',	'KhoDoChoi',	'Q2'),
('K03',	'Kho1',	'Q3'),
('K04',	'Kho2',	'Q4'),
('K05',	'KhoQuanAo','Q5');

INSERT INTO dbo.NHAN_VIEN
VALUES
('NV01',	'Le Van A',	'2002/01/01',	'QN',	'2103',	'P1'),
('NV02',	'Ngo Thi B',	'1999/02/01',	'QT',	'2548',	'P2'),
('NV03',	'Tran Quang C',	'2003/04/03',	'NB',	'5874',	'P3'),
('NV04',	'Pham Van D',	'1990/06/08',	'TB',	'5784',	'P4'),
('NV05','Nguyen Van Hoai E','1987/08/02',	'TN',	'0124',	'P5'),
('NV06','Ngo Thi Huyen','2001/02/19','Q1','03989','P2'),
('NV07', 'LVT','1998/02/02','Q1','21457','P1'),
('NV08','Tran Thi A','2001/02/19','Q3','090809','P3');

INSERT INTO dbo.MAT_HANG
VALUES 
('MH01',	'Sach',	'Dong'),
('MH02'	,'QuanAo'	,'Dong'),
('MH03',	'DoChoi',	'Dong'),
('MH04',	'Vo','Dong'),
('MH05','Truyen','Dong');

INSERT INTO dbo.KHACH_HANG
VALUES
('KH01',	'A',	'987',	'HN',	'987@'),
('KH02',	'B',	'9876',	'QB',	'9876@'),
('KH03',	'C',	'98765',	'HB',	'98765@'),
('KH04',	'D',	'987654',	'CM',	'987654@'),
('KH05',	'E',	'9876543',	'SG',	'98754@');

INSERT INTO dbo.HD_XUAT
VALUES
('HDX01',	'2014/08/22',	'NV03',	'K02',	'KH01'),
('HDX02',	'2012/05/07',	'NV01',	'K02',	'KH04'),
('HDX03',	'2015/02/05',	'NV02',	'K01',	'KH01'),
('HDX04',	'2018/06/15',	'NV04',	'K03',	'KH03'),
('HDX05',	'2018/06/24',	'NV03',	'K04',	'KH02');

INSERT INTO dbo.CT_XUAT
VALUES
('HDX01',	'MH03',	2,	100000),
('HDX02',	'MH01',	3,	150000),
('HDX03',	'MH02',	1,	50000),
('HDX04',	'MH01',	4,	200000),
('HDX05',	'MH04',	5,	250000);


INSERT INTO dbo.PHONG_BAN
VALUES
('P1',	'AA',	'32145'),
('P2',	'BB',	'35647'),
('P3',	'CC',	'21458'),
('P4',	'DD',	'24877'),
('P5',	'EE',	'21547');

INSERT INTO dbo.LOAISANPHAM
VALUES
('MLSP1','Giáo Dục','Dùng để học trong trường','MH01'),
('MLSP2','Hoa hoè','Dùng để học trong trường','MH02'),
('MLSP3','Giáo Dục','oẳn từ xì','MH03');

 ALTER TABLE dbo.LOAISANPHAM ADD FOREIGN KEY(MaMH) REFERENCES dbo.MAT_HANG(MaMH);

 --CAU2: Đưa ra danh sách tất cả các nhân viên có mã phòng ban'P1'
SELECT MaNV,HoTen,NgaySinh,QueQuan FROM NHAN_VIEN WHERE MaPB='P1';
--Cau3:Đưa ra danh sách nhân viên, sắp xếp tăng dần theo phòng ban và giảm dần theo ngày sinh 
SELECT MaNV,HoTen,NgaySinh,QueQuan,MaPB FROM NHAN_VIEN 
ORDER BY MaPB ASC, NgaySinh DESC;
--Cau4:Cho biết 3 mặt hàng được bán nhiều nhất trong ngày hôm nay 
SELECT TOP(3) MaMH FROM CT_XUAT ORDER BY SoLuong;

--CAU5:Đưa ra danh sách tất cả các nhà cung cấp và các khách hàng 
SELECT MaNCC,HoTen,DienThoai,DiaChi,Email FROM NHA_CC
UNION
SELECT MaKH,HoTen,DienThoai,DiaChi,Email FROM KHACH_HANG;
--CAu6: Đưa ra danh sách tất cả những cá nhân vừa là nhà cung cấp, vừa là khách hàng 
SELECT MaNCC,HoTen,DienThoai,DiaChi,Email FROM NHA_CC
INTERSECT
SELECT MaKH,HoTen,DienThoai,DiaChi,Email FROM KHACH_HANG;

SELECT*FROM NHA_CC ncc WHERE EXISTS (SELECT*FROM KHACH_HANG kh WHERE )

 SELECT cc.MaNCC,cc.HoTen from NHA_CC cc join KHACH_HANG kh
 ON cc.HoTen = kh.HoTen

SELECT*FROM NHA_CC INNER JOIN KHACH_HANG ON NHA_CC.DienThoai=KHACH_HANG.DienThoai;
--CAU7:Đưa ra danh sách tất cả những cá nhân là nhà cung cấp nhưng không phải là khách hàng 
SELECT MaNCC,HoTen,DienThoai,DiaChi,Email FROM NHA_CC
EXCEPT
SELECT MaKH,HoTen,DienThoai,DiaChi,Email FROM KHACH_HANG;

SELECT NHA_CC.MaNCC,KHACH_HANG.MaKH,KHACH_HANG.HoTen FROM NHA_CC LEFT JOIN KHACH_HANG ON KHACH_HANG.HoTen=NHA_CC.HoTen WHERE KHACH_HANG.HoTen IS NULL;

SELECT * FROM NHA_CC WHERE MaNCC NOT IN(SELECT cc.MaNCC FROM NHA_CC cc JOIN KHACH_HANG kh ON cc.HoTen = kh.HoTen);

--CAu8:Danh sách nhân viên bao gồm thông tin phòng ban 

SELECT NHAN_VIEN.HoTen,PHONG_BAN.DienThoai,PHONG_BAN.MaPB,PHONG_BAN.TenPB FROM NHAN_VIEN
INNER JOIN PHONG_BAN ON NHAN_VIEN.MaPB=PHONG_BAN.MaPB;

--CAU9:Tìm tất cả các nhân viên có cùng ngày sinh :

SELECT a.MaNV,a.HoTen,a.NgaySinh,b.MaNV,b.HoTen 
FROM NHAN_VIEN AS a JOIN NHAN_VIEN AS b
ON a.NgaySinh=b.NgaySinh
WHERE a.MaNV<b.MaNV ORDER BY NgaySinh,a.MaNV;

--Cau10:Tính tổng số nhân viên làm việc trong mỗi phòng ban 
SELECT COUNT(MaNV) AS SoNV ,MaPB FROM NHAN_VIEN GROUP BY MaPB;

--Cau11: Đếm số nhân viên theo quê quán làm việc trong mỗi phòng ban
SELECT MaPB,QueQuan,COUNT(MaNV) AS SoNV FROM NHAN_VIEN GROUP BY MaPB,QueQuan;

--Cau12: Đếm số nhân viên có quê quán ‘Q1’ làm việc trong mỗi phòng ban 
SELECT COUNT(MaNV) AS SoNV,MaPB FROM NHAN_VIEN WHERE QueQuan ='Q1' GROUP BY MaPB;

--CAU13:Đếm số ngày sinh của nhân viên trong mỗi phòng ban (loại bỏ sự trùng lặp) 
SELECT MaPB,COUNT(DISTINCT NgaySinh) AS SoNS FROM NHAN_VIEN GROUP BY MaPB;

--Cau14: Đưa ra danh sách các phòng ban có nhiều hơn 3 nhân viên 
SELECT MaPB,COUNT(MaNV) AS SoNV FROM NHAN_VIEN GROUP BY MaPB HAVING COUNT(MaNV)>3;

--Cau15:Tìm các phòng ban có nhiều hơn 2 nhân viên có quê quán ‘Q1’ làm việc 
SELECT MaPB, COUNT(MaNV) AS SoNV FROM NHAN_VIEN WHERE QueQuan='Q1' GROUP BY MaPB HAVING COUNT(MaNV)>2;

--Cau16:Sao kê tất cả các hoá đơn xuất do nhân viên có MaPB = ‘P1’ lập, sắp xếp kết quả giảm dần theo ngày tháng hoá đơn 
SELECT HD_XUAT.MaHDX,HD_XUAT.NgayHD,HD_XUAT.MaNV,HD_XUAT.MaK,HD_XUAT.MaKH FROM HD_XUAT JOIN NHAN_VIEN ON HD_XUAT.MaNV=NHAN_VIEN.MaNV WHERE NHAN_VIEN.MaPB='P1' ORDER BY NgayHD DESC;
  
  
SELECT HD_XUAT.MaHDX,HD_XUAT.NgayHD,HD_XUAT.MaNV,HD_XUAT.MaK,HD_XUAT.MaKH FROM HD_XUAT WHERE MaNV IN (SELECT NHAN_VIEN.MaNV FROM NHAN_VIEN WHERE MaPB='P1') ORDER BY NgayHD DESC;

SELECT HD_XUAT.MaHDX,HD_XUAT.NgayHD,HD_XUAT.MaNV,HD_XUAT.MaK,HD_XUAT.MaKH FROM HD_XUAT WHERE EXISTS (SELECT NHAN_VIEN.MaNV FROM NHAN_VIEN WHERE MaPB='P1') ORDER BY NgayHD DESC;

--Cau17: Liệt kê tất cả các nhân viên chưa có bất kỳ hoá đơn nào trong 3 tháng cuối năm 2016 
SELECT NHAN_VIEN.MaNV,NHAN_VIEN.HoTen FROM NHAN_VIEN 
WHERE  NHAN_VIEN.MaNV NOT IN(SELECT HD_XUAT.MaNV FROM HD_XUAT WHERE NgayHD BETWEEN '2016-10-01' AND '2016-12-31') 
AND NHAN_VIEN.MaNV NOT IN (SELECT HD_NHAP.MaNV FROM HD_NHAP WHERE HD_NHAP.NgayHD BETWEEN '2016-10-01' AND '2016-12-31');

SELECT NV.* FROM NHAN_VIEN NV WHERE NOT EXISTS (SELECT HD.MaNV FROM HD_NHAP HD WHERE HD.MaNV=NV.MaNV AND HD.NgayHD BETWEEN '2016-10-01' AND '2016-12-31') 
AND NOT EXISTS (SELECT HH.MaNV FROM HD_XUAT HH WHERE HH.MaNV=NV.MaNV AND HH.NgayHD BETWEEN '2016-10-01' AND '2016-12-31');

SELECT NHAN_VIEN.MaNV,NHAN_VIEN.HoTen,NHAN_VIEN.NgaySinh,NHAN_VIEN.QueQuan,NHAN_VIEN.SoCMND,NHAN_VIEN.MaPB FROM NHAN_VIEN
LEFT JOIN HD_XUAT ON NHAN_VIEN.MaNV=HD_XUAT.MaNV 
LEFT JOIN HD_NHAP ON NHAN_VIEN.MaNV=HD_NHAP.MaNV WHERE HD_NHAP.MaNV IS NULL AND HD_NHAP.NgayHD BETWEEN '2016-10-01' AND '2016-12-31' 
AND HD_XUAT.MaNV IS NULL AND HD_XUAT.NgayHD BETWEEN '2016-10-01' AND '2016-12-31';

SELECT* FROM NHAN_VIEN WHERE MaNV NOT IN(SELECT HD_XUAT.MaNV FROM HD_XUAT WHERE NgayHD BETWEEN '2016-10-01' AND '2016-12-31') ORDER BY MaNV;

--Cau18:Tìm các nhân viên có tuổi bằng tuổi trung bình của tất cả nhân viên 
SELECT * FROM NHAN_VIEN WHERE YEAR(NgaySinh) = ROUND (( SELECT AVG(YEAR(NgaySinh)) FROM NHAN_VIEN),0); 

--Cau19: Tìm các nhân viên phòng ban ‘P1’ có tuổi lớn hơn tất cả các nhân viên phòng ban ‘P2’ 
SELECT* FROM NHAN_VIEN WHERE MaPB='P1' AND NgaySinh < ALL(SELECT NgaySinh FROM NHAN_VIEN WHERE MaPB='P2');

--Cau20:Tìm các nhân viên phòng ban ‘P1’ có tuổi lớn hơn ít nhất một nhân viên phòng ban ‘P2’ 
SELECT * FROM NHAN_VIEN WHERE MaPB='P1' AND NgaySinh <ANY (SELECT NgaySinh FROM NHAN_VIEN WHERE MaPB='P2');

--Cau21: Đưa ra danh sách các nhân viên đã lập ít nhất một hoá đơn xuất 
SELECT DISTINCT(NHAN_VIEN.MaNV),NHAN_VIEN.HoTen,NHAN_VIEN.NgaySinh,NHAN_VIEN.QueQuan FROM NHAN_VIEN INNER JOIN HD_XUAT ON NHAN_VIEN.MaNV=HD_XUAT.MaNV;

SELECT*FROM NHAN_VIEN WHERE EXISTS ( SELECT * FROM HD_XUAT WHERE MaNV=NHAN_VIEN.MaNV);
--CAu22: Đưa ra tuổi của nhân viên, tuổi trung bình của các nhân viên và 
--chênh lệch tuổi của nhân viên hiện tại với độ tuổi trung bình của tất cả nhân viên 
SELECT MaNV,HoTen,(YEAR(getdate())-YEAR(NgaySinh)) AS TuoiNV, (YEAR(getdate())-(SELECT AVG(Year(NgaySinh))FROM NHAN_VIEN)) AS TuoiTB,
(YEAR(NgaySinh)-(SELECT AVG(YEAR(NgaySinh)) FROM NHAN_VIEN)) AS ChenhLech FROM NHAN_VIEN;
--Cau23:Tìm tất cả các nhân viên có độ tuổi cao hơn độ tuổi trung bình của tất cả nhân viên trong phòng ban mà nhân viên đó làm việc
SELECT p.MaPB,TenPB,MaNV,HoTen FROM NHAN_VIEN AS n JOIN PHONG_BAN AS p ON n.MaPB=p.MaPB
WHERE YEAR(NgaySinh)<ROUND ((SELECT AVG(YEAR(NgaySinh)) FROM NHAN_VIEN WHERE MaPB=n.MaPB),0);
--CAu24:
--Cau25: Tạo khung nhìn cung cấp thông tin tổng số lượng mỗi mặt hàng đã nhập cho đến 30/08/2015 
CREATE VIEW view_tongnhap AS SELECT MaMH,SUM(SoLuong) AS TongNhap FROM HD_NHAP JOIN CT_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN
WHERE NgayHD < '2015-08-30' GROUP BY MaMH;
--Cau26: Tạo khung nhìn cung cấp thông tin tổng số lượng mỗi mặt hàng đã xuất cho đến 30/08/2015 
CREATE VIEW view_tongxuat AS SELECT MaMH, SUM(SoLuong) AS TongXuat FROM HD_XUAT JOIN CT_XUAT ON HD_XUAT.MaHDX=CT_XUAT.MaHDX 
WHERE NgayHD <'2015-08-30' GROUP BY MaMH;
--Cau27: Tính tổng số lượng đã nhập, đã xuất, còn lại cho mỗi mặt hàng cho đến ngày 30/08/2015 
SElECT m.MaMH, TenMH, TongNhap, ISNULL(TongXuat,0) AS TongXuat,(TongNhap- ISNULL(TongXuat,0)) AS TongCon,DonViTinh
FROM MAT_HANG AS m JOIN view_tongnhap AS n ON m.MaMH=n.MaMH
LEFT OUTER JOIN view_tongxuat AS x ON m.MaMH=x.MaMH;
--CAU28: Thực hiện tăng 15% số tiền trong tháng 12/2014 cho tất cả các nhân viên thuộc phòng ban có mã P1 
SELECT MaNV, Luong*1.5 AS 'Luong15%'
FROM NHAN_VIEN
WHERE MaPB='P1' AND NgayLuong BETWEEN '2014-12-01' AND '2014-12-31';

 --Bài thực hành 1-BỔ SUNG
--b) Liệt kê những khách hàng có địa chỉ ở ‘Đà Nẵng’.
SELECT*FROM KHACH_HANG WHERE DiaChi='Đà Nẵng';
--c) Liệt kê tên của những sản phẩm có đơn vị tính là ‘thùng’ với nơi sản xuất là ‘Thái Lan’ và những sản phẩm có đơn vị tính là ‘két’ với nơi sản xuất là ‘Hàn Quốc’
SELECT MAT_HANG.MaMH,MAT_HANG.TenMH,MAT_HANG.DonViTinh, KHO.DiaChi FROM MAT_HANG JOIN CT_XUAT ON MAT_HANG.MaMH=CT_XUAT.MaMH
JOIN HD_XUAT ON CT_XUAT.MaHDX=HD_XUAT.MaHDX JOIN KHO ON KHO.MaK=HD_XUAT.MaK WHERE MAT_HANG.DonViTinh='thùng' AND KHO.DiaChi='Thái Lan' OR  MAT_HANG.DonViTinh='két' AND KHO.DiaChi='Hàn Quốc';

--d) Liệt kê tên của các nhà cung cấp có tên bắt đầu bằng ‘Nhà phân phối’.
SELECT HoTen FROM NHA_CC WHERE HoTen LIKE 'Nhà phân phối%';

--e) Liệt kê thông tin của toàn bộ hóa đơn nhập, yêu cầu sắp xếp giảm dần theo Ngày nhập.
SELECT* FROM HD_NHAP ORDER BY NgayHD DESC;

--f) Đếm số hóa đơn của khách hàng ‘Nguyễn Tùng Minh’ có ngày giao là ngày hiện tại.
SELECT COUNT(MaHDX) AS SoHD, KHACH_HANG.HoTen FROM HD_XUAT JOIN KHACH_HANG ON HD_XUAT.MaKH=KHACH_HANG.MaKH
WHERE KHACH_HANG.HoTen='Nguyễn Tùng Minh' AND HD_XUAT.NgayHD-GETDATE()=0 GROUP BY KHACH_HANG.HoTen;
--g) Liệt kê địa chỉ của toàn bộ nhân viên với yêu cầu mỗi địa chỉ được liệt kê một lần duy nhất
SELECT DISTINCT QueQuan FROM NHAN_VIEN;

--h) Liệt kê MaHDNhap, TenNhaCC, TenSP, NoiSX của tất cả các hóa đơn nhập có đơn giá mỗi sản phẩm dưới 1 triệu và ngày áp dụng chơ đơn giá này là trước 30/04/2018.

SELECT HD_NHAP.MaHDN,NHA_CC.HoTen,MAT_HANG.TenMH,KHO.DiaChi FROM MAT_HANG JOIN CT_XUAT ON CT_XUAT.MaMH=MAT_HANG.MaMH
JOIN HD_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN JOIN NHA_CC ON NHA_CC.MaNCC=HD_NHAP.MaNCC JOIN KHO ON KHO.MaK=HD_NHAP.MaK
WHERE CT_NHAP.DonGia <1000000 AND HD_NHAP.NgayHD <'2018/04/30';

--i) Liệt kê MaNV, TenNV, NgaySinh, SoDT của tất cả các nhân viên thực hiện lập hóa đơn xuất với yêu cầu những nhân viên nào chưa từng lập thì cũng liệt kê thông tin của nhân viên đó.
SELECT NHAN_VIEN.MaNV,NHAN_VIEN.HoTen,NHAN_VIEN.NgaySinh,NHAN_VIEN.SoCMND FROM NHAN_VIEN  LEFT JOIN HD_XUAT ON NHAN_VIEN.MaNV=HD_XUAT.MaNV;

--j) Liệt kê thông tin của toàn bộ khách hàng đã từng đặt mua tổng số lượng sản phẩm là trên 100 hoặc tổng giá trị tiền là hơn 30 triệu.

SELECT KHACH_HANG.HoTen,KHACH_HANG.MaKH,KHACH_HANG.DiaChi FROM KHACH_HANG JOIN HD_XUAT ON HD_XUAT.MaKH=KHACH_HANG.MaKH
JOIN CT_XUAT ON CT_XUAT.MaHDX=CT_XUAT.MaHDX GROUP BY KHACH_HANG.MaKH,KHACH_HANG.HoTen,KHACH_HANG.DiaChi HAVING SUM(SoLuong)>100 AND SUM(DonGia) >30000000;

--k) Liệt kê tên của những nhân viên chưa từng lập hóa đơn nhập lần nào.
--C1:
  SELECT NHAN_VIEN.MaNV,NHAN_VIEN.HoTen FROM NHAN_VIEN WHERE  NHAN_VIEN.MaNV NOT IN(SELECT HD_NHAP.MaNV FROM HD_NHAP);
--C2:
  SELECT NHAN_VIEN.MaNV,NHAN_VIEN.HoTen FROM NHAN_VIEN LEFT JOIN HD_NHAP ON NHAN_VIEN.MaNV=HD_NHAP.MaNV WHERE HD_NHAP.MaNV IS NULL;

-- l)Liệt kê tên của những nhà cung cấp đã từng cung cấp sản phẩm có mã là ‘SP-DM2309’ mà chưa từng cung cấp sản phẩm có mã là ‘SP-GD4538’.
  SELECT NHA_CC.HoTen,NHA_CC.MaNCC FROM NHA_CC JOIN HD_NHAP ON NHA_CC.MaNCC=HD_NHAP.MaNCC JOIN CT_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN JOIN MAT_HANG ON CT_NHAP.MaMH=MAT_HANG.MaMH WHERE MAT_HANG.MaMH='MH01'
  EXCEPT
  SELECT NHA_CC.HoTen,NHA_CC.MaNCC FROM NHA_CC JOIN HD_NHAP ON NHA_CC.MaNCC=HD_NHAP.MaNCC JOIN CT_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN JOIN MAT_HANG ON CT_NHAP.MaMH=MAT_HANG.MaMH WHERE MAT_HANG.MaMH='MH02';

  --m) Hiển thị thông tin của những sản phẩm(mặt hàng) được khách hàng mua nhiều nhất tính từ đầu năm 2018 đến  cuối năm 2018. 
 
  SELECT MAT_HANG.MaMH,MAT_HANG.TenMH,MAT_HANG.DonViTinh FROM MAT_HANG WHERE MAT_HANG.MaMH IN( SELECT TOP(1) CT_XUAT.MaMH FROM CT_XUAT JOIN HD_XUAT ON CT_XUAT.MaHDX=HD_XUAT.MaHDX WHERE HD_XUAT.NgayHD BETWEEN '2018-01-01' AND '2018-12-31' ORDER BY SoLuong DESC);
  --o) Đếm tổng số loại sản phẩm đã được nhập trong năm 2018 với yêu cầu chỉ thống kê những loại sản phẩm do nhà cung cấp có là là ‘NCC-THV’ cung cấp. 
  SELECT COUNT(MaLoaiSP) AS SoLoaiSP FROM LOAISANPHAM WHERE LOAISANPHAM.MaMH IN (SELECT MAT_HANG.MaMH FROM MAT_HANG JOIN CT_NHAP ON MAT_HANG.MaMH=CT_NHAP.MaMH JOIN HD_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN JOIN NHA_CC ON NHA_CC.MaNCC=HD_NHAP.MaNCC
  WHERE NHA_CC.HoTen='NCC-THV' AND HD_NHAP.NgayHD BETWEEN '2018-01-01' AND '2018-12-31');

--p) Liệt kê tên của những khách hàng chỉ mua hàng 01 lần duy nhất, sắp xếp tăng dần theo tên khách hàng
 SELECT KHACH_HANG.HoTen,KHACH_HANG.DiaChi FROM KHACH_HANG WHERE KHACH_HANG.MaKH IN(SELECT MaKH FROM HD_XUAT  GROUP BY HD_XUAT.MaKH HAVING COUNT(MaHDX)=1) ORDER BY KHACH_HANG.HoTen;

 --t) Tính tổng số lượng nhập, xuất và còn lại cho từng sản phẩm. Thông tin cần thiết bao gồm: Mã loại sản phẩm, tên loại sản phẩm, mã sản phẩm, tên sản phẩm, số lượng nhập, số lượng xuất, số lượng còn, đơn vị tính.
 CREATE VIEW view_tongnhap AS SELECT MaMH,SUM(SoLuong) AS TongNhap FROM HD_NHAP JOIN CT_NHAP ON HD_NHAP.MaHDN=CT_NHAP.MaHDN GROUP BY MaMH;
 CREATE VIEW view_tongxuat AS SELECT MaMH, SUM(SoLuong) AS TongXuat FROM HD_XUAT JOIN CT_XUAT ON HD_XUAT.MaHDX=CT_XUAT.MaHDX GROUP BY MaMH;
 SElECT m.MaMH, TenMH, TongNhap, ISNULL(TongXuat,0) AS TongXuat,(TongNhap- ISNULL(TongXuat,0)) AS TongCon,DonViTinh FROM MAT_HANG AS m JOIN view_tongnhap AS n ON m.MaMH=n.MaMH
LEFT OUTER JOIN view_tongxuat AS x ON m.MaMH=x.MaMH;
--u) Cập nhật cột tên loại sản phẩm của bảng LOAISANPHAM thành giá trị ‘Loại đặc biệt’ đối với những mã sản phẩm bắt đầu bằng ‘SP-DB’
UPDATE LOAISANPHAM SET TenLoaiSP='Loại đặc biệt' WHERE MaLoaiSP LIKE 'SP-DB%';    
--v) Cập nhật cột đặc điểm của bảng LOAISANPHAM thành giá trị ‘Bán chạy nhất’ đối với những loại sản phẩm được khách hàng mua từ 50 lần trở lên trong tháng hiện tại.
UPDATE LOAISANPHAM SET DacDiem='Bán chạy nhất';
-- w) Xóa những hóa đơn nhập có ngày nhập trước năm 2010.
DELETE FROM HD_NHAP WHERE NgayHD <'2010-01-01';

