CREATE DATABASE db_singo;
USE db_singo;

CREATE TABLE tbl_data_outlet (
id_outlet VARCHAR (10) PRIMARY KEY,
nama_outlet VARCHAR (50),
logo_outlet VARCHAR (100),
alamat_outlet VARCHAR (100),
no_telp VARCHAR (15),
stat BOOLEAN
);

CREATE TABLE tbl_jabatan (
id_jabatan VARCHAR (10)PRIMARY KEY,
nama_jabatan VARCHAR (50),
stat BOOLEAN
);

CREATE TABLE tbl_bank(
id_bank VARCHAR (3) PRIMARY KEY,
nama_bank VARCHAR(50),
kode_bank INT(3),
stat BOOLEAN
);

CREATE TABLE tbl_karyawan(
id_karyawan VARCHAR (10) PRIMARY KEY,
id_jabatan VARCHAR (10) UNIQUE,
nik VARCHAR (18) UNIQUE,
nama_karyawan VARCHAR (100),
alamat_karyawan VARCHAR (100),
no_hp VARCHAR (15) UNIQUE,
email VARCHAR (30) UNIQUE,
user_name VARCHAR (20) UNIQUE,
password_karyawan VARCHAR (20),
no_rek VARCHAR (30) UNIQUE,
id_bank VARCHAR (3) UNIQUE,
stat BOOLEAN,
CONSTRAINT FOREIGN KEY (id_jabatan) REFERENCES tbl_jabatan(id_jabatan),
CONSTRAINT FOREIGN KEY (id_bank) REFERENCES tbl_bank(id_bank)
);

CREATE TABLE tbl_satuan(
id_satuan VARCHAR (10) PRIMARY KEY,
nama_satuan VARCHAR (50),
keterangan VARCHAR (20),
stat BOOLEAN
);

CREATE TABLE tbl_produk(
id_produk VARCHAR (10) PRIMARY KEY,
id_satuan VARCHAR (10) UNIQUE,
barcode VARCHAR (20),
nama_produk VARCHAR (50),
harga_produk INT,
stok_produk INT,
CONSTRAINT FOREIGN KEY (id_satuan) REFERENCES tbl_satuan(id_satuan)
);

CREATE TABLE tbl_pos(
id_pos VARCHAR (10) PRIMARY KEY,
nama_pos VARCHAR (50)
);

CREATE TABLE tbl_transaksi(
id_transaksi VARCHAR (30) PRIMARY KEY,
id_pos VARCHAR (10) UNIQUE,
id_karyawan VARCHAR (10) UNIQUE,
tgl_transaksi DATE,
waktu_transaksi TIME,
CONSTRAINT FOREIGN KEY (id_pos) REFERENCES tbl_pos(id_pos),
CONSTRAINT FOREIGN KEY (id_karyawan) REFERENCES tbl_karyawan(id_karyawan)
);

CREATE TABLE tbl_detail_transaksi(
id_dtran VARCHAR (30) PRIMARY KEY,
id_produk VARCHAR (10) UNIQUE,
id_transaksi VARCHAR (30),
jumlah INT,
CONSTRAINT FOREIGN KEY (id_produk) REFERENCES tbl_produk(id_produk),
CONSTRAINT FOREIGN KEY (id_transaksi) REFERENCES tbl_transaksi(id_transaksi)
);
