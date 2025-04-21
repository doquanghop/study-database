CREATE TABLE Khoa
(
    MaKhoa      VARCHAR(10) PRIMARY KEY,
    TenKhoa     VARCHAR(100) NOT NULL,
    DiaChi      VARCHAR(200),
    SoDienThoai VARCHAR(15)
);
CREATE TABLE GiaoVien
(
    MaGiaoVien  VARCHAR(10) PRIMARY KEY,
    TenGiaoVien VARCHAR(100) NOT NULL,
    SdtGiaoVien VARCHAR(15),
    Email       VARCHAR(100),
    MaKhoa      VARCHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa (MaKhoa)
);
CREATE TABLE TrinhDo
(
    MaTrinhDo  VARCHAR(10) PRIMARY KEY,
    TenTrinhDo VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE MonHoc
(
    MaMonHoc  VARCHAR(10) PRIMARY KEY,
    TenMonHoc VARCHAR(100) NOT NULL,
    SoDvht    INT          NOT NULL,
    MaTrinhDo VARCHAR(10),
    MaKhoa    VARCHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa (MaKhoa),
    FOREIGN KEY (MaTrinhDo) REFERENCES TrinhDo (MaTrinhDo)
);
CREATE TABLE HocPhan
(
    MaHocPhan  VARCHAR(10) PRIMARY KEY,
    MaGiaoVien VARCHAR(10),
    MaMonHoc   VARCHAR(10),
    HocKy      VARCHAR(20) NOT NULL,
    NamHoc     VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien (MaGiaoVien),
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc (MaMonHoc)
);
CREATE TABLE Lop
(
    MaLop        VARCHAR(10) PRIMARY KEY,
    TenLop       VARCHAR(100) NOT NULL,
    SiSoSinhVien INT          NOT NULL,
    MaKhoa       VARCHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa (MaKhoa)
);
CREATE TABLE SinhVien
(
    MaSinhVien VARCHAR(10) PRIMARY KEY,
    HoTen      VARCHAR(100) NOT NULL,
    DiaChi     VARCHAR(200),
    NgaySinh   DATE,
    GioiTinh   ENUM('Nam', 'Nu') NOT NULL,
    MaLop      VARCHAR(10),
    MaTrinhDo  VARCHAR(10),
    FOREIGN KEY (MaLop) REFERENCES Lop (MaLop),
    FOREIGN KEY (MaTrinhDo) REFERENCES TrinhDo (MaTrinhDo)
);
CREATE TABLE KetQuaHocPhan
(
    MaSinhVien VARCHAR(10),
    MaHocPhan  VARCHAR(10),
    DiemChu    ENUM('A', 'B', 'C', 'D', 'F') NOT NULL,
    DiemSo     FLOAT NOT NULL CHECK (DiemSo >= 0 AND DiemSo <= 10),
    PRIMARY KEY (MaSinhVien, MaHocPhan),
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien (MaSinhVien),
    FOREIGN KEY (MaHocPhan) REFERENCES HocPhan (MaHocPhan)
);
CREATE TABLE ChuNhiemLop
(
    MaLop           VARCHAR(10),
    MaGiaoVien      VARCHAR(10),
    ThoiDiemBatDau  DATE NOT NULL,
    ThoiDiemKetThuc DATE,
    PRIMARY KEY (MaLop, MaGiaoVien, ThoiDiemBatDau),
    FOREIGN KEY (MaLop) REFERENCES Lop (MaLop),
    FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien (MaGiaoVien),
    CHECK (ThoiDiemKetThuc IS NULL OR ThoiDiemKetThuc >= ThoiDiemBatDau)
);
CREATE TABLE ChuNhiemKhoa
(
    MaKhoa     VARCHAR(10),
    MaGiaoVien VARCHAR(10),
    PRIMARY KEY (MaKhoa),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa (MaKhoa),
    FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien (MaGiaoVien),
    UNIQUE (MaGiaoVien)
);


CREATE TRIGGER CheckMaxHocPhan
    BEFORE INSERT
    ON HocPhan
    FOR EACH ROW
BEGIN
    DECLARE HocPhanCount INT;
    SELECT COUNT(*)
    INTO HocPhanCount
    FROM HocPhan
    WHERE MaGiaoVien = NEW.MaGiaoVien
      AND HocKy = NEW.HocKy
      AND NamHoc = NEW.NamHoc;
    IF HocPhanCount >= 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giáo viên không được dạy quá 4 học phần trong một học kỳ';
END IF;
END;