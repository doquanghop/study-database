-- a. Hiển thị danh sách tên các lớp học thuộc khoa Công Nghệ Thông tin.
SELECT TenLop
FROM Lop
         INNER JOIN Khoa ON Lop.MaKhoa = Khoa.MaKhoa
WHERE TenKhoa = 'Công Nghệ Thông tin';

-- b. Hiển thị danh sách tên các môn học do giáo viên Nguyễn Anh Thư giảng dạy trong học kỳ 2, năm học 2011.
SELECT TenMonHoc
FROM MonHoc
         INNER JOIN HocPhan ON MonHoc.MaMonHoc = HocPhan.MaMonHoc
         INNER JOIN GiaoVien ON HocPhan.MaGiaoVien = GiaoVien.MaGiaoVien
WHERE TenGiaoVien = 'Nguyễn Anh Thư'
  AND HocKy = '2'
  AND NamHoc = '2011';

-- c. Đưa ra danh sách kết quả học tập của những sinh viên đã tham gia học môn CSDL trong học kỳ 1, năm học 2012.
SELECT SinhVien.MaSinhVien, HoTen, TenMonHoc, DiemChu, DiemSo
FROM KetQuaHocPhan
         INNER JOIN SinhVien ON KetQuaHocPhan.MaSinhVien = SinhVien.MaSinhVien
         INNER JOIN HocPhan ON KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan
         INNER JOIN MonHoc ON HocPhan.MaMonHoc = MonHoc.MaMonHoc
WHERE TenMonHoc = 'CSDL'
  AND HocKy = '1'
  AND NamHoc = '2012';

-- d. Đưa ra danh sách các sinh viên lớp 55TH1 và 55TH2 không tham gia học môn học Mạng Máy Tính
-- do giáo viên Hoàng Anh Khôi giảng dạy trong học kỳ 2, năm học 2012.
SELECT SinhVien.MaSinhVien, HoTen
FROM SinhVien
         INNER JOIN Lop ON SinhVien.MaLop = Lop.MaLop
WHERE TenLop IN ('55TH1', '55TH2')
  AND SinhVien.MaSinhVien NOT IN (SELECT KetQuaHocPhan.MaSinhVien
                                  FROM KetQuaHocPhan
                                           INNER JOIN HocPhan ON KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan
                                           INNER JOIN MonHoc ON HocPhan.MaMonHoc = MonHoc.MaMonHoc
                                           INNER JOIN GiaoVien ON HocPhan.MaGiaoVien = GiaoVien.MaGiaoVien
                                  WHERE TenMonHoc = 'Mạng Máy Tính'
                                    AND TenGiaoVien = 'Hoàng Anh Khôi'
                                    AND HocKy = '2'
                                    AND NamHoc = '2012');

-- e. Đưa ra danh sách các giáo viên chưa bao giờ chủ nhiệm lớp.
SELECT MaGiaoVien, TenGiaoVien
FROM GiaoVien
WHERE MaGiaoVien NOT IN (SELECT DISTINCT MaGiaoVien
                         FROM ChuNhiemLop);

-- f. Đưa ra danh sách các sinh viên thuộc khoa Cầu Đường đạt điểm A trong môn Tin Đại Cương, học kỳ 2, năm học 2012.
SELECT SinhVien.MaSinhVien, HoTen
FROM SinhVien
         INNER JOIN Lop ON SinhVien.MaLop = Lop.MaLop
         INNER JOIN Khoa ON Lop.MaKhoa = Khoa.MaKhoa
         INNER JOIN KetQuaHocPhan ON SinhVien.MaSinhVien = KetQuaHocPhan.MaSinhVien
         INNER JOIN HocPhan ON KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan
         INNER JOIN MonHoc ON HocPhan.MaMonHoc = MonHoc.MaMonHoc
WHERE TenKhoa = 'Cầu Đường'
  AND TenMonHoc = 'Tin Đại Cương'
  AND DiemChu = 'A'
  AND HocKy = '2'
  AND NamHoc = '2012';