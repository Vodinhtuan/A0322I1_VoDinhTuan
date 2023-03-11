﻿EXEC sp_changedbowner 'sa'

--TH1

CREATE TABLE KHACHHANG(
	MAKH varchar(10),
	HOTEN nvarchar(20),
	DIACHI nvarchar(20),
	SODT varchar(15),
	PRIMARY KEY (MAKH)
	);

CREATE TABLE HOADON(
	MAHD varchar(10),
	NGAYLAP date,
	NGAYGH date,
	MAKH varchar(10),
	PRIMARY KEY (MAHD),
	FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
	);

CREATE TABLE NHACUNGCAP (
	MANCC varchar(10),
    TENNCC nvarchar(20),
    DIACHI nvarchar(20),
	SODT varchar(15),
	PRIMARY KEY (MANCC)
);

CREATE TABLE DMHANG (
    MAHANG varchar(10),
    TENHANG nvarchar(20),
    DVT varchar(10),
	SLNHAP int,
	DGNHAP int,
	MANCC varchar(10),
	PRIMARY KEY (MAHANG),
	FOREIGN KEY (MANCC) references NHACUNGCAP(MANCC)
);

CREATE TABLE CHITIET (
	MAHD varchar(10),
	MAHANG varchar(10),
	SLBAN int,
	DGBAN int,
	PRIMARY KEY (MAHD),
	FOREIGN KEY (MAHD) references HOADON(MAHD),
	FOREIGN KEY (MAHANG) references DMHANG(MAHANG)
	);

INSERT INTO KHACHHANG(MAKH, HOTEN, DIACHI, SODT)
VALUES ('KH01', N'Nguyễn Văn A', N'Đà Nẵng', '01234567891');
INSERT INTO KHACHHANG(MAKH, HOTEN, DIACHI, SODT)
VALUES ('KH02', N'Nguyễn Văn B', N'Quảng Nam', '01234567892');
INSERT INTO KHACHHANG(MAKH, HOTEN, DIACHI, SODT)
VALUES ('KH03', N'Nguyễn Văn C', N'Huế', '01234567893');
INSERT INTO KHACHHANG(MAKH, HOTEN, DIACHI, SODT)
VALUES ('KH04', N'Nguyễn Văn D', N'Quảng Trị', '01234567894');
INSERT INTO KHACHHANG(MAKH, HOTEN, DIACHI, SODT)
VALUES ('KH05', N'Nguyễn Văn E', N'Quảng Bình', '01234567895');

INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH)
VALUES ('HD01', '2023/01/01', '2023/01/01', 'KH01');
INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH)
VALUES ('HD02', '2023/02/02', '2023/02/02', 'KH02');
INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH)
VALUES ('HD03', '2023/03/03', '2023/03/03', 'KH03');
INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH)
VALUES ('HD04', '2023/04/04', '2023/04/04', 'KH04');
INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH)
VALUES ('HD05', '2023/05/05', '2023/05/05', 'KH05');

INSERT INTO NHACUNGCAP(MANCC, TENNCC, DIACHI, SODT)
VALUES ('NCC01', N'Công ty A', N'Đà Nẵng', '09876543211');
INSERT INTO NHACUNGCAP(MANCC, TENNCC, DIACHI, SODT)
VALUES ('NCC02', N'Công ty B', N'Đà Nẵng', '09876543212');
INSERT INTO NHACUNGCAP(MANCC, TENNCC, DIACHI, SODT)
VALUES ('NCC03', N'Công ty C', N'Huế', '09876543213');
INSERT INTO NHACUNGCAP(MANCC, TENNCC, DIACHI, SODT)
VALUES ('NCC04', N'Công ty D', N'Quảng Trị', '09876543214');
INSERT INTO NHACUNGCAP(MANCC, TENNCC, DIACHI, SODT)
VALUES ('NCC05', N'Công ty E', N'Quảng Bình', '09876543215');

INSERT INTO DMHANG(MAHANG, TENHANG, DVT, SLNHAP, DGNHAP, MANCC)
VALUES ('MH01', N'Nước giải khát A', 'nhan', '10', '10000', 'NCC01');
INSERT INTO DMHANG(MAHANG, TENHANG, DVT, SLNHAP, DGNHAP, MANCC)
VALUES ('MH02', N'Nước giải khát B', 'nhan', '10', '10000', 'NCC02');
INSERT INTO DMHANG(MAHANG, TENHANG, DVT, SLNHAP, DGNHAP, MANCC)
VALUES ('MH03', N'Nước giải khát C', 'nhan', '10', '10000', 'NCC03');
INSERT INTO DMHANG(MAHANG, TENHANG, DVT, SLNHAP, DGNHAP, MANCC)
VALUES ('MH04', N'Nước giải khát D', 'nhan', '10', '10000', 'NCC04');
INSERT INTO DMHANG(MAHANG, TENHANG, DVT, SLNHAP, DGNHAP, MANCC)
VALUES ('MH05', N'Nước giải khát E', 'nhan', '10', '10000', 'NCC05');

INSERT INTO CHITIET(MAHD, MAHANG, SLBAN, DGBAN)
VALUES ('HD01', 'MH01', '10', '20000');
INSERT INTO CHITIET(MAHD, MAHANG, SLBAN, DGBAN)
VALUES ('HD02', 'MH02', '10', '20000');
INSERT INTO CHITIET(MAHD, MAHANG, SLBAN, DGBAN)
VALUES ('HD03', 'MH03', '10', '20000');
INSERT INTO CHITIET(MAHD, MAHANG, SLBAN, DGBAN)
VALUES ('HD04', 'MH04', '10', '20000');
INSERT INTO CHITIET(MAHD, MAHANG, SLBAN, DGBAN)
VALUES ('HD05', 'MH05', '10', '20000');

--TH2

SELECT * FROM KHACHHANG WHERE DIACHI LIKE N'Đà Nẵng';
SELECT * FROM KHACHHANG WHERE DIACHI NOT LIKE N'Đà Nẵng';

ALTER TABLE HOADON ADD LOAIHD varchar(5);
INSERT INTO HOADON(MAHD, NGAYLAP, NGAYGH, MAKH, LOAIHD)
VALUES ('HD06', '2023/05/05', '2023/05/05', 'KH05', 'B');

UPDATE HOADON
SET LOAIHD = 'M'
WHERE MAHD LIKE 'HD01';

UPDATE HOADON
SET LOAIHD = 'B'
WHERE MAHD LIKE 'HD02';

UPDATE HOADON
SET LOAIHD = 'M'
WHERE MAHD LIKE 'HD03';

UPDATE HOADON
SET LOAIHD = 'B'
WHERE MAHD LIKE 'HD04';

UPDATE HOADON
SET LOAIHD = 'M'
WHERE MAHD LIKE 'HD05';


SELECT * FROM HOADON WHERE NGAYLAP LIKE '2023-05-05' AND LOAIHD LIKE 'B';

SELECT * FROM KHACHHANG WHERE DIACHI LIKE N'Đà Nẵng';
SELECT * FROM KHACHHANG WHERE DIACHI LIKE N'Quảng Nam';

SELECT * FROM DMHANG WHERE MAHANG LIKE 'MH01';
SELECT * FROM DMHANG WHERE MAHANG LIKE 'MH02';

SELECT * FROM KHACHHANG WHERE DIACHI IS NULL;

SELECT * FROM KHACHHANG WHERE SODT IS NOT NULL;

SELECT * FROM HOADON WHERE NGAYLAP BETWEEN '2023/01/01' AND '2023/05/05';

SELECT * FROM DMHANG WHERE SLNHAP BETWEEN '1' AND '100';

SELECT * FROM KHACHHANG WHERE SODT LIKE '0%' AND SODT LIKE '%5';

SELECT * FROM HOADON WHERE NGAYLAP BETWEEN '2023/05/01' AND '2023/05/31';

SELECT * FROM KHACHHANG WHERE HOTEN NOT LIKE 'N%';

-- SELECT * FROM KHACHHANG WHERE HOTEN LIKE 'N%';

SELECT * FROM DMHANG WHERE DVT LIKE 'nhan';
SELECT * FROM DMHANG WHERE DVT LIKE 'thung';
SELECT * FROM DMHANG WHERE DVT LIKE 'kg';

SELECT * FROM KHACHHANG WHERE HOTEN LIKE 'N%' ORDER BY HOTEN;

--TH3

SELECT HOADON.MAHD, NGAYLAP, SLBAN, DGBAN, (SLBAN*DGBAN) AS THANHTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD GROUP BY HOADON.MAHD, NGAYLAP, CHITIET.SLBAN, CHITIET.DGBAN;

SELECT HOADON.MAHD, NGAYLAP, NGAYGH, COUNT(MAHANG) AS SOMATHANG FROM CHITIET, HOADON WHERE HOADON.MAHD = CHITIET.MAHD GROUP BY HOADON.MAHD, HOADON.NGAYLAP, HOADON.NGAYGH;

SELECT HOADON.MAHD, NGAYLAP, NGAYGH, (SLBAN*DGBAN) AS TONGTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD GROUP BY HOADON.MAHD, HOADON.NGAYLAP, HOADON.NGAYGH, SLBAN, DGBAN;

SELECT HOADON.MAHD, NGAYLAP, SLBAN, DGBAN, (SLBAN*DGBAN) AS THANHTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD AND NGAYGH BETWEEN '2023/05/01' AND '2023/05/31' GROUP BY HOADON.MAHD, NGAYLAP, CHITIET.SLBAN, CHITIET.DGBAN;

SELECT TOP (3) HOADON.MAHD, NGAYLAP, SLBAN, DGBAN, (SLBAN*DGBAN) AS THANHTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD GROUP BY HOADON.MAHD, NGAYLAP, CHITIET.SLBAN, CHITIET.DGBAN ORDER BY THANHTIEN Desc;

SELECT HOADON.MAHD, NGAYLAP, NGAYGH, (SLBAN*DGBAN) AS TONGTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD GROUP BY HOADON.MAHD, HOADON.NGAYLAP, HOADON.NGAYGH, SLBAN, DGBAN HAVING (SLBAN*DGBAN)>=10000 ORDER BY MAHD Asc; --ORDER BY TONGTIEN Desc;

SELECT NHACUNGCAP.MANCC, TENNCC, TENHANG, SLNHAP, DGNHAP, (SLNHAP*DGNHAP) AS THANHTIEN FROM NHACUNGCAP, DMHANG WHERE NHACUNGCAP.MANCC = DMHANG.MANCC AND NHACUNGCAP.MANCC LIKE 'NCC01' GROUP BY NHACUNGCAP.MANCC, TENNCC, TENHANG, SLNHAP, DGNHAP HAVING SLNHAP>=10;

SELECT TOP (3) NHACUNGCAP.MANCC, TENNCC, SLNHAP FROM NHACUNGCAP, DMHANG WHERE NHACUNGCAP.MANCC = DMHANG.MANCC GROUP BY NHACUNGCAP.MANCC, TENNCC, SLNHAP ORDER BY SLNHAP Desc;

SELECT HOADON.MAHD, NGAYLAP, NGAYGH, SLBAN, DGBAN, (SLBAN*DGBAN) AS THANHTIEN FROM HOADON, CHITIET WHERE HOADON.MAHD = CHITIET.MAHD AND NGAYLAP BETWEEN '2000/01/01' AND '2023/05/31'  GROUP BY HOADON.MAHD, NGAYLAP, NGAYGH, CHITIET.SLBAN, CHITIET.DGBAN ORDER BY THANHTIEN Desc;

--TH4

GO
CREATE PROCEDURE MHANG_DVT_X
AS
BEGIN 
	SELECT MAHANG, TENHANG, DVT
	FROM DMHANG
	WHERE DVT LIKE 'nhan'
END;
EXEC MHANG_DVT_X;

DROP PROC MHANG_DVT_X;

GO
CREATE PROCEDURE HOADON_THANG_X
AS
BEGIN 
	SELECT CHITIET.MAHD, NGAYLAP, NGAYGH, LOAIHD, SLNHAP, DGNHAP, (SLNHAP*DGNHAP) AS THANHTIENNHAP
	FROM HOADON, CHITIET, DMHANG
	WHERE CHITIET.MAHD = HOADON.MAHD AND CHITIET.MAHANG = DMHANG.MAHANG AND NGAYLAP BETWEEN '2023-05-01' AND '2023-05-31'
END;
EXEC HOADON_THANG_X;
DROP PROC HOADON_THANG_X;

GO
CREATE PROCEDURE HOADON_MAHD
(@PARAM_MAHD varchar(10))
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, HOADON.LOAIHD, SLNHAP, DGNHAP, (SLNHAP*DGNHAP) AS THANHTIENNHAP
	FROM HOADON, CHITIET, DMHANG
	WHERE HOADON.MAHD LIKE CHITIET.MAHD AND CHITIET.MAHANG = DMHANG.MAHANG AND HOADON.MAHD LIKE @PARAM_MAHD
END;
EXEC HOADON_MAHD @PARAM_MAHD='HD01';
DROP PROC HOADON_MAHD;

GO
CREATE PROCEDURE HOADON_CHITIET
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, COUNT(MAHANG) AS SOMATHANG
	FROM HOADON, CHITIET
	WHERE HOADON.MAHD LIKE HOADON.MAHD
	GROUP BY HOADON.MAHD, NGAYLAP, NGAYGH
END;
EXEC HOADON_CHITIET;
DROP PROC HOADON_CHITIET;

GO
CREATE PROCEDURE HOADON_CHITIET_MAHD
(@PARAM_CHITIET_MAHD varchar(10))
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, COUNT(MAHANG) AS SOMATHANG
	FROM HOADON, CHITIET
	WHERE HOADON.MAHD = CHITIET.MAHD AND HOADON.MAHD LIKE @PARAM_CHITIET_MAHD
	GROUP BY HOADON.MAHD, NGAYLAP, NGAYGH
END;
EXEC HOADON_CHITIET_MAHD @PARAM_CHITIET_MAHD='HD01';
DROP PROC HOADON_CHITIET_MAHD;

GO
CREATE PROCEDURE HOADON_TONGTIEN
(@PARAM_TONGTIEN_MAHD varchar(10))
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, (SLBAN*DGBAN) AS TONGTIENNHAP
	FROM HOADON, CHITIET
	WHERE HOADON.MAHD LIKE CHITIET.MAHD AND HOADON.MAHD LIKE @PARAM_TONGTIEN_MAHD
END;
EXEC HOADON_TONGTIEN @PARAM_TONGTIEN_MAHD = 'HD01';
DROP PROC HOADON_TONGTIEN;

GO
CREATE PROCEDURE HOADON_LOAIHD
(@PARAM_KHACHHANG_LOAIHD varchar(5))
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, HOTEN, DIACHI, SODT
	FROM HOADON, KHACHHANG
	WHERE HOADON.MAKH = KHACHHANG.MAKH AND LOAIHD LIKE @PARAM_KHACHHANG_LOAIHD
END;
EXEC HOADON_LOAIHD @PARAM_KHACHHANG_LOAIHD = 'M';
DROP PROC HOADON_LOAIHD;

GO
CREATE PROCEDURE HOADON_THANHTIEN
(@PARAM_THANHTIEN_MAHD varchar(10))
AS
BEGIN 
	SELECT HOADON.MAHD, NGAYLAP, NGAYGH, LOAIHD, SLBAN, DGBAN, (SLBAN*DGBAN) AS THANHTIEN
	FROM HOADON, CHITIET
	WHERE HOADON.MAHD = CHITIET.MAHD AND HOADON.MAHD LIKE @PARAM_THANHTIEN_MAHD
END;
EXEC HOADON_THANHTIEN @PARAM_THANHTIEN_MAHD='HD01';
DROP PROC HOADON_THANHTIEN;