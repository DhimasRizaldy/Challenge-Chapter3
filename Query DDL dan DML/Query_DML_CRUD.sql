-- =====================================================================================
-- CRUD Table Nasabah
-- =====================================================================================

-- (CREATE) Insert Data Nasabah
insert into nasabah (nasabah_id, nama, jenis_kelamin, alamat, no_telpon, email)
values ('1', 'Dhimas Rizaldy','Pria', 'jln.marga no.128 Bandar Lampung',  '089521937647', 'dimas@gmail.com'),
       ('2', 'Aldi Anggara', 'Pria', 'jln.nangka no.89 Bandar Lampung',  '08928827712', 'aldi@gmail.com'),
       ('3','Toni Andara','Pria', 'jln.merpati no.70 Bandung',  '08587362771', 'toni@gmail.com'),
       ('4','Santi Kartika', 'Wanita',  'jln.mawar no.17 Bandar Lampung',  '08927728812', 'santi@gmail.com'),
       ('5','Surya Abidin', 'Pria', 'jln.batu bara no.96 Jakarta',  '087672886882', 'surya@gmail.com'),
       ('6','Tama Agustono', 'Pria', 'jln.anggur no.67 Batam',  '08256618828', 'tama@gmail.com'),
       ('7','Suryanti',  'Wanita', 'jln.pisang no.89 Batam', '088993772993', 'suryanti@gmail.com'),
       ('8','Santi Putri Ayu', 'Wanita', 'jln.taman mata air no.56 Bandar Lampung',  '082771667923', 'santiputri@gmail.com'),
       ('9','Wawan Gunawan', 'Pria', 'jln.pepaya no.02 Jawa Timur',  '0837727838343', 'wawan@gmail.com'),
       ('10','Bela Agustin',  'Wanita', 'jln.taman bunga no.23 Medan',  '086277288393', 'bela@gmail.com');


-- (READ) Read Data Nasabah
select * from nasabah;

-- (UPDATE) Update Data Nasabah
update nasabah
    set nama = 'Tantri Kotak', email = 'tantrikotak@gmail.com'
where nasabah_id = 7;

-- (DELETE) Delete Data Nasabah
delete from nasabah where nasabah_id = 10;

-- =====================================================================================
-- CRUD Table Akun
-- =====================================================================================

-- (CREATE) Insert Data Akun
insert into Akun (akun_id, jenis_akun, pin, saldo, nasabah_id)
values ('1', 'Tabungan', '020102', '2500000','1'),
       ('2', 'Giro', '030203', '1500000','2'),
       ('3', 'Tabungan', '090292', '500000','3'),
       ('4', 'Giro', '010392', '1000000','4'),
       ('5', 'Tabungan', '067282', '3000000','5'),
       ('6', 'Giro', '234323', '100000','6'),
       ('7', 'Tabungan', '089273', '5000000','7'),
       ('8', 'Giro', '123453', '7500000','8'),
       ('9', 'Tabungan', '928839', '850000','9'),
       ('10', 'Giro', '234342', '3500000','10');


-- (READ) Read Data Akun
select * from akun;

-- (UPDATE) Update Data Akun
update akun
    set jenis_akun = 'Tabungan', pin = 129834
where akun_id = 4;

-- (DELETE) Delete Data Akun
delete from akun where akun_id = 10;

-- =====================================================================================
-- CRUD Table Transaksi
-- =====================================================================================

-- (CREATE) Insert Data Transaksi
insert into Transaksi (transaksi_id, tanggal_transaksi, jenis_transaksi, jumlah_transaksi,akun_id)
values   ('1','2023-9-22','Withdraw','150000','1'),
            ('2','2023-9-22','Withdraw','150000','1'),
            ('3','2023-9-22','Deposit','250000','1'),
            ('4','2023-9-22','Withdraw','150000','2'),
            ('5','2023-9-22','Withdraw','150000','2'),
            ('6','2023-9-22','Deposit','250000','3'),
            ('7','2023-9-22','Withdraw','150000','3'),
            ('8','2023-9-22','Withdraw','150000','4'),
            ('9','2023-9-22','Deposit','250000','4'),
            ('10','2023-9-22','Withdraw','150000','5'),
            ('11','2023-9-22','Withdraw','150000','5'),
            ('12','2023-9-22','Deposit','250000','6'),
            ('13','2023-9-22','Withdraw','150000','6'),
            ('14','2023-9-22','Withdraw','150000','7'),
            ('15','2023-9-22','Deposit','250000','7'),
            ('16','2023-9-22','Withdraw','150000','8'),
            ('17','2023-9-22','Withdraw','150000','8'),
            ('18','2023-9-22','Deposit','250000','9'),
            ('19','2023-9-22','Withdraw','150000','9'),
            ('20','2023-9-22','Withdraw','150000','5'),
            ('21','2023-9-22','Deposit','250000','6'),
            ('22','2023-9-22','Withdraw','150000','7'),
            ('23','2023-9-22','Withdraw','150000','3'),
            ('24','2023-9-22','Deposit','250000','5');


-- (READ) Read Data Transaksi
select * from transaksi;

-- (UPDATE) Update Data Transaksi
update transaksi
    set jenis_transaksi = 'Transfer'
where transaksi_id = 5;

-- (DELETE) Delete Data Transaksi
delete from transaksi where transaksi_id = 3;


-- =====================================================================================
-- Buat CTE untuk melakukan pengecekan penarikan (withdraw)
-- =====================================================================================

WITH TransaksiWithdraw AS (
    SELECT
        T.transaksi_id,
        T.tanggal_transaksi,
        T.jenis_transaksi,
        T.jumlah_transaksi,
        T.akun_id,
        A.saldo AS saldo_awal,
        A.saldo - ABS(T.jumlah_transaksi) AS saldo_setelah_withdraw
    FROM
        Transaksi T
    INNER JOIN
        Akun A
    ON
        T.akun_id = A.akun_id
    WHERE
        T.jenis_transaksi = 'Withdraw'
)
SELECT
    tw.transaksi_id,
    tw.tanggal_transaksi,
    tw.jenis_transaksi,
    tw.jumlah_transaksi,
    tw.akun_id,
    tw.saldo_awal,
    tw.saldo_setelah_withdraw
FROM
    TransaksiWithdraw tw
order by tw.transaksi_id;


-- =====================================================================================
-- Buat CTE untuk melakukan pengecekan Deposit
-- =====================================================================================

WITH TransaksiTransfer AS (
    SELECT
        T.transaksi_id,
        T.tanggal_transaksi,
        T.jenis_transaksi,
        T.jumlah_transaksi,
        T.akun_id AS akun_sumber_id,
        A.saldo AS saldo_sumber,
        TA.akun_id AS akun_tujuan_id,
        TA.jumlah_transaksi AS saldo_tujuan
    FROM
        Transaksi T
    INNER JOIN
        Akun A
    ON
        T.akun_id = A.akun_id
    LEFT JOIN
        Transaksi TA
    ON
        T.transaksi_id = TA.transaksi_id
    WHERE
        T.jenis_transaksi = 'Transfer'
)
SELECT
    tt.transaksi_id,
    tt.tanggal_transaksi,
    tt.jenis_transaksi,
    tt.jumlah_transaksi,
    tt.akun_sumber_id,
    tt.saldo_sumber,
    tt.akun_tujuan_id,
    tt.saldo_tujuan
FROM
    TransaksiTransfer tt
order by tt.transaksi_id;


-- =====================================================================================
-- Buat CTE untuk melakukan pengecekan Deposit
-- =====================================================================================

WITH TransaksiDeposit AS (
    SELECT
        T.transaksi_id,
        T.tanggal_transaksi,
        T.jenis_transaksi,
        T.jumlah_transaksi,
        T.akun_id AS akun_tujuan_id,
        A.saldo AS saldo_awal,
        A.saldo + T.jumlah_transaksi AS saldo_setelah_deposit
    FROM
        Transaksi T
    INNER JOIN
        Akun A
    ON
        T.akun_id = A.akun_id
    WHERE
        T.jenis_transaksi = 'Deposit'
)
SELECT
    td.transaksi_id,
    td.tanggal_transaksi,
    td.jenis_transaksi,
    td.jumlah_transaksi,
    td.akun_tujuan_id,
    td.saldo_awal,
    td.saldo_setelah_deposit
FROM
    TransaksiDeposit td
order by td.transaksi_id;
