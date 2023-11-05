
Create database NHOMCAYCANH;
USE NHOMCAYCANH;

Create table KHACHHANG(
MaKH varchar(25) NOT NULL,
HoTenKH varchar(30),
DiaChiKH varchar(50),
SoDienThoaiKH int Not null,
PRIMARY KEY (MaKH)
);

Create table HOPDONGCHOTHUE(
MaHopDong varchar(25) not null,
MaKH varchar(25) not null,
SoTienDuocGiamGia int ,
SoTienDatCoc int ,
TrangThaiHopDong varchar(30),
PRIMARY KEY (MaHopDong),
FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);
create table CAYCANH(
MaCayCanh varchar(25) not null,
MoTa varchar(50) ,
MaLoaiCC varchar(25),
DonGiaChoThue int,
PRIMARY KEY (MaCayCanh),
);
 create table CHITIETHOPDONG(
 MaHopDong varchar(25) not null,
 MaCayCanh varchar(25) not null,
 SoLuong int,
 MaLoaiDV varchar(25) not null,
 NgayBatDauChoThue datetime,
 NgayKetThucChoThue datetime,
 CONSTRAINT PK_CHITIETHD PRIMARY KEY (MaHopDong ,MaCayCanh) 

 );
 ALTER TABLE CHITIETHOPDONG
ADD CONSTRAINT FK_CTHD FOREIGN KEY (MaHopDong) REFERENCES HOPDONGCHOTHUE(MaHopDong);

ALTER TABLE CHITIETHOPDONG
ADD CONSTRAINT FK_CTCC FOREIGN KEY (MaCayCanh) REFERENCES CAYCANH(MaCayCanh);

ALTER TABLE CHITIETHOPDONG
ADD CONSTRAINT FK_CTDV FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV);

ALTER TABLE CAYCANH 
ADD CONSTRAINT FK_CCLC FOREIGN KEY (MaLoaiCC) REFERENCES LOAICAYCANH(MaLoaiCC);

 create table LOAIDICHVU(
 MaLoaiDV varchar(25) not null,
 MoTaLoaiDV varchar(50),
 PRIMARY KEY (MaLoaiDV)
 );
 create table LOAICAYCANH(
 MaLoaiCC varchar(25) not null,
 MoTaLoaiCC varchar(50),
 PRIMARY KEY (MaLoaiCC)
 );

 INSERT INTO KHACHHANG VALUES ('KH0001','Bui A','Lien Chieu',09012345);
 INSERT INTO KHACHHANG VALUES ('KH0002','Bui B','Thanh Khe',09112345);
 INSERT INTO KHACHHANG VALUES ('KH0003','Nguyen A','Lien Chieu',09112346);
 INSERT INTO KHACHHANG VALUES ('KH0004','Nguyen B','Thanh Khe',09012346);
 INSERT INTO KHACHHANG VALUES ('KH0005','Bui A','Hai Chau',09012347);
 INSERT INTO KHACHHANG VALUES ('KH0006','Nguyen B','Hai Chau',09112347);
 INSERT INTO CAYCANH VALUES ('CC001','Hoa hong','LCC01',10000);
 INSERT INTO CAYCANH VALUES ('CC002','Mai tu quy','LCC01',20000);
 INSERT INTO CAYCANH VALUES ('CC003','Hoa anh dao','LCC01',60000);
 INSERT INTO CAYCANH VALUES ('CC004','Bonsai','LCC03',100000);
 INSERT INTO CAYCANH VALUES ('CC005','Hong tieu muoi','LC002',70000);
 INSERT INTO LOAICAYCANH VALUES ('LCC01','Chung o phong khach');
 INSERT INTO LOAICAYCANH VALUES ('LCC02','Chung o cau thang');
 INSERT INTO LOAICAYCANH VALUES ('LCC03','Chung o ngoai san');
 INSERT INTO HOPDONGCHOTHUE VALUES ('HD0001','KH0002',0,1000000,'Da ket thuc');
 INSERT INTO HOPDONGCHOTHUE (MaHopDong,MaKH,SoTienDuocGiamGia,SoTienDatCoc) VALUES ('HD0002','KH0002',0,0);
 INSERT INTO HOPDONGCHOTHUE VALUES ('HD0003','KH0001',0,0,'Da ket thuc');
 INSERT INTO HOPDONGCHOTHUE VALUES ('HD0004','KH0005',0,0,'Dang cho thue');
  INSERT INTO HOPDONGCHOTHUE VALUES ('HD0005','KH0004',0,0,'Dang cho thue');
   INSERT INTO HOPDONGCHOTHUE VALUES ('HD0006','KH0004',0,0,'Chua bat dau');
    INSERT INTO HOPDONGCHOTHUE VALUES ('HD0007','KH0002',0,0,'Da ket thuc');
	INSERT INTO HOPDONGCHOTHUE (MaHopDong,MaKH,SoTienDuocGiamGia,SoTienDatCoc) VALUES ('HD0008','KH0004',0,0);
	INSERT INTO LOAIDICHVU VALUES ('L01','Chung Tet');
	INSERT INTO LOAIDICHVU VALUES ('L02','Chung nha moi');
	INSERT INTO CHITIETHOPDONG VALUES ('HD0001','CC003',100,'L01','3/7/2016','5/7/2016');
	INSERT INTO CHITIETHOPDONG VALUES ('HD0002','CC001',150,'L01','11/10/2015','22/10/2015');
	INSERT INTO CHITIETHOPDONG VALUES ('HD0003','CC004',20,'L01','23/12/2017','30/12/2017');
INSERT INTO CHITIETHOPDONG VALUES ('HD0004','CC002',5,'L01','1/1/2014','10/1/2014');


INSERT INTO CHITIETHOPDONG VALUES ('HD0005','CC005',10,'L01','16/10/2016','18/10/2016');


INSERT INTO CHITIETHOPDONG VALUES ('HD0006','CC001',300,'L01','11/12/2017','22/12/2017');


INSERT INTO CHITIETHOPDONG VALUES ('HD0007','CC004',5,'L01','1/2/2016','10/2/2016');


INSERT INTO CHITIETHOPDONG VALUES ('HD0007','CC001',15,'L01','10/2/2016','12/2/2016');

SELECT*FROM CAYCANH
WHERE DonGiaChoThue <50000;
--Câu 4: Liệt kê những khách hàng có địa chỉ ở 'Lien Chieu' mà có số điện thoại bắt đầu bằng '090' và những khách hàng có địa chỉ ở 'Thanh Khe' mà có số điện thoại bắt đầu bằng '091'. (0.5 điểm)
SELECT*FROM KHACHHANG
WHERE DiaChiKH='Lien Chieu' OR SoDienThoaiKH like '090%'
AND DiaChiKH='Thanh Khe' OR SoDienThoaiKH like '091%';
--Câu 5: Liệt kê thông tin của các khách hàng có họ (trong họ tên) là 'Bui
SELECT*FROM KHACHHANG
WHERE HoTenKH like '%Bui%';
--Câu 6: Liệt kê thông tin của toàn bộ các cây cảnh, yêu cầu sắp xếp giảm dần theo MoTa và giảm dần theo DonGiaChoThue
SELECT*FROM CAYCANH
ORDER BY MoTa ,DonGiaChoThue DESC;
--cau7Câu 7: Liệt kê các hợp đồng cho thuê có trạng thái là 'Da ket thuc' hoặc chưa xác định (có giá trị là NULL)
SELECT*FROM HOPDONGCHOTHUE
WHERE TrangThaiHopDong='Da ket thuc' OR TrangThaiHopDong is NULL;
--cau 8
SELECT DISTINCT HoTenKH FROM KHACHHANG;
--cau 9Câu 9: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của tất cả các hợp đồng có trạng thái là 'Dang cho thue'
SELECT dbo.HOPDONGCHOTHUE.MaHopDong, dbo.HOPDONGCHOTHUE.MaKH,dbo.HOPDONGCHOTHUE.TrangThaiHopDong,dbo.CHITIETHOPDONG.MaCayCanh,dbo.CHITIETHOPDONG.SoLuong
FROM dbo.HOPDONGCHOTHUE join dbo.CHITIETHOPDONG on dbo.HOPDONGCHOTHUE.MaHopDong=dbo.CHITIETHOPDONG.MaHopDong
WHERE dbo.HOPDONGCHOTHUE.TrangThaiHopDong='Dang cho thue';
--cau10Câu 10: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của tất cả các hợp đồng với yêu cầu những hợp đồng nào chưa có một chi tiết hợp đồng nào thì cũng phải liệt kê thông tin những hợp đồng đó ra. 

SELECT dbo.HOPDONGCHOTHUE.MaHopDong, dbo.HOPDONGCHOTHUE.MaKH,dbo.HOPDONGCHOTHUE.TrangThaiHopDong,dbo.CHITIETHOPDONG.MaCayCanh,dbo.CHITIETHOPDONG.SoLuong
FROM dbo.HOPDONGCHOTHUE full outer join dbo.CHITIETHOPDONG on dbo.HOPDONGCHOTHUE.MaHopDong=dbo.CHITIETHOPDONG.MaHopDong
ORDER BY dbo.HOPDONGCHOTHUE.TrangThaiHopDong;

 --cau12:Câu 12: Liệt kê thông tin của các khách hàng chưa từng thuê cây cảnh một lần nào cả

 SELECT kh.* FROM KHACHHANG kh
where kh.MaKH not in (select kh.MaKH from KHACHHANG kh inner join HOPDONGCHOTHUE hd on kh.MaKH = hd.MaKH);

--13.Câu 13: Liệt kê thông tin của các khách hàng đã từng thuê loại cây cảnh được mô tả là 'Chung o phong khach' và đã từng thuê cây cảnh vào tháng 12 năm 2017 (gợi ý: dựa theo ngày bắt đầu thuê

SELECT kh.* FROM KHACHHANG kh join HOPDONGCHOTHUE hd 
ON kh.MaKH = hd.MaKH
WHERE hd.MaHopDong IN (SELECT ct.MaHopDong FROM CHITIETHOPDONG ct join CAYCANH cc
ON cc.MaCayCanh = ct.MaCayCanh
WHERE cc.MaLoaiCC = 'LCC01')and kh.DiaChiKH = 'Hai Chau' or hd.MaHopDong IN (SELECT ct.MaHopDong FROM CHITIETHOPDONG ct 
WHERE ct.NgayBatDauChoThue = '20171211')
--Câu 15: Hiển thị MaCayCanh, MaLoaiCC của những cây cảnh từng được thuê với số lượng lớn hơn 10 trong một hợp đồng bất kỳ nào đó. Kết quả hiển thị cần được xóa bớt dữ liệu bị trùng lặp.


SELECT DISTINCT dbo.CAYCANH.MaCayCanh,dbo.CAYCANH.MaLoaiCC 
FROM dbo.CAYCANH
Join dbo.CHITIETHOPDONG on dbo.CAYCANH.MaCayCanh=dbo.CHITIETHOPDONG.MaCayCanh
WHERE dbo.CHITIETHOPDONG.SoLuong >10;
--.Câu 16: Đếm tổng số khách hàng đã thuê cây cảnh trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những khách hàng đã từng thuê ít nhất 2 lần (có từ 2 hợp đồng khác nhau với công ty trở lên) vào năm 2016
-- cau 17:Liệt kê những khách hàng chỉ mới thuê 1 lần duy nhất (chỉ có 1 hợp đồng duy nhất với công ty) và chỉ thuê 1 nhóm cây cảnh duy nhất trong năm 2017, kết quả được sắp xếp giảm dần theo MaKhachHang.
--Câu 18: Cập nhật cột TrangThaiHopDong trong bảng HOPDONGCHOTHUE thành giá trị 'Bi huy' đối với những hợp đồng có TrangThaiHopDong là 'Chua bat dau' và có SoTienDatCoc là 0 VND. (0.5 điểm
UPDATE HOPDONGCHOTHUE SET TrangThaiHopDong='Bi huy' 
WHERE TrangThaiHopDong='Chua bat dau' AND SoTienDatCoc = 0;
--19.Câu 19: Cập nhật cột NgayKetThucChoThue trong bảng CHITIETHOPDONG thành NULL cho những cây cảnh đã từng được cho thuê từ 2 lần trở lên
UPDATE CHITIETHOPDONG SET NgayKetThucChoThue is null 
WHERE 
--Câu 20: Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào. (0.5 điểm
