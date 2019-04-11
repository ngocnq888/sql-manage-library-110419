use manage_library_brian;
create table SinhVien
(
  maTheSv  varchar(20) not null primary key,
  tenSv    varchar(50) not null,
  ngaySinh date        not null,
  diaChi   varchar(100),
  email    varchar(50) not null,
  sdt      varchar(11) not null,
  anh      varchar(100)
);

create table Sach
(
  maSach       varchar(50)  not null primary key,
  tenSach      varchar(100) not null,
  NXB          varchar(100) not null,
  tacGia       varchar(100) not null,
  namXuatBan   int          not null,
  soLanXuatBan int          not null,
  gia          float        not null,
  anh          varchar(100),
  trangThai    varchar(15),
  soLuong      int
);
create table PhieuMuon
(
  maTheSv  varchar(20) not null,
  maSach   varchar(50) not null,
  ngayMuon date        not null,
  ngayTra  date        not null,
  primary key (maTheSv, maSach, ngayTra),
  foreign key (maTheSv) references SinhVien (maTheSv),
  foreign key (maSach) references Sach (maSach)
);

create table DanhMuc
(
  maDanhMuc varchar(50)  not null primary key,
  tenDanhMuc varchar(100) not null
);

alter table Sach
add column maDanhMuc varchar(50)  not null;

alter table PhieuMuon
add constraint phieumuonFK foreign key (maDanhMuc) references DanhMuc(maDanhMuc);
# input for table Sach

insert into Sach
  value ('s001', '99 phuong an khuyen mai dieu ky trong ban le', 'Lao dong - Xa hoi : Alphabooks',
         'Truong Hao, Lan Huong ', 2018, 1, 210.00, '', 'con trong kho', 1);

insert into Sach
  value ('s002', 'clean code', 'Microsoft', 'Robert Cecil Martin', 2008, 10, 410.00, '', 'con trong kho', 1);

insert into Sach
  value ('s003', 'Code Dao Ki Su', 'Tiki.vn', 'Pham Huy Hoang', 20016, 1, 110.00, '', 'con trong kho', 1);

insert into Sach
  value ('s004', 'Lap trinh va cuoc song', 'Dan tri', 'Ho Sy Hung', 2008, 1, 100.00, '', 'con trong kho', 1);

insert into Sach
  value ('s005', 'Tu hoc lap trinh huong doi tuong', 'Giao Thong Van Tai', 'GTVT', 20011, 1, 90.00, '', 'con trong kho', 1);

select *
from PhieuMuon;

# input for table SinhVien

insert into SinhVien
values ('sv001', 'Ngo quy ngoc', '1986-11-11', 'linh dam, hoang mai,hanoi', 'ngoc.nq.vn@gmail.com', '0981363179', '');

insert into SinhVien
values ('sv002', 'nguyen ba thanh', '1998-1-08', 'duong noi, ha dong,hanoi', 'thanh.nb@codegym.com', '0913837333', '');

insert into SinhVien
values ('sv003', 'Pham Ngoc Khoi', '2000-5-07', 'dinh thon, my dinh,hanoi', 'khoi.pn@codegym.com', '0377373221', '');

insert into SinhVien
values ('sv004', 'Phan Thi My Hanh', '2001-6-08', 'hang trong, hoan kiem,hanoi', 'hanh.ntm@codegym.com', '0986834333', '');

insert into SinhVien
values ('sv005', 'Nguyen Dan Truong', '1985-2-3', 'phung khoang, ha dong,hanoi', 'truong.nd@codegym.com', '0913214333', '');

select *
from SinhVien;

#- Hiển thị sách lập trình trong thư viện
select *
from Sach
where tenSach like '%lap trinh%';

# Hoat dong muon sach
insert into PhieuMuon
values ('sv001','s003','2019-04-10','2019-04-17');
# Thay doi thong tin trong kho
update Sach
set trangThai  = 'da cho muon'
where maSach = 's003';

#
select *
from PhieuMuon;

#- Hiển thị tất cả các sách đang được mượn
select *
from Sach
where trangThai = 'da cho muon';
