CREATE DATABASE THUCHANH;

EXEC sp_changedbowner 'sa';

CREATE TABLE NHANVIEN(
	MANV VARCHAR(10) NOT NULL,
	HOLOT NVARCHAR(10),
	TENNV NVARCHAR(10),
	PHAI NVARCHAR(10),
	DIACHI NVARCHAR(30),
	DTHOAI VARCHAR(15),
	MAPB VARCHAR(10),
	MACV VARCHAR(10),
	PRIMARY KEY (MANV),
	FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB),
	FOREIGN KEY (MACV) REFERENCES CHUCVU(MACV));


CREATE TABLE PHONGBAN(
	MAPB VARCHAR (10), 
	TENPB NVARCHAR(20), 
	PRIMARY KEY (MAPB));


CREATE TABLE CHUCVU(
	MACV VARCHAR(10),
	TECV NVARCHAR(20),
	HSPC FLOAT,
	PRIMARY KEY (MACV));


CREATE TABLE HSLUONG(
MAHSL VARCHAR(10),
TDHV NVARCHAR(15),
HSL FLOAT,
PRIMARY KEY (MAHSL));


CREATE TABLE LUONG(
	MANV VARCHAR(10),
	MAHSL VARCHAR(10),
	THANG DATE,
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	FOREIGN KEY (MAHSL) REFERENCES HSLUONG(MAHSL));





