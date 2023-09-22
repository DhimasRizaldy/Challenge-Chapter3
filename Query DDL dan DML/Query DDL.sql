-- Create Database 
create database create_and_insert;

-- Table Nasabah
create table Nasabah (
    nasabah_id bigserial primary key,
    nama varchar(50) not null ,
    jenis_kelamin varchar(25) not null ,
    alamat text not null ,
    no_telpon varchar(15) not null,
    email varchar(50) not null unique
);

-- Table Akun
create table Akun (
    akun_id bigserial primary key ,
    jenis_akun varchar(50) not null ,
    pin integer not null unique ,
    saldo integer not null,
    nasabah_id integer not null
);


-- Table Transaksi
create table Transaksi (
    transaksi_id bigserial primary key ,
    tanggal_transaksi date not null ,
    jenis_transaksi varchar(50) not null ,
    jumlah_transaksi integer,
    akun_id integer not null
);

