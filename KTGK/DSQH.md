# Đại số quan hệ

## Giải thích các ký hiệu:
- π[...]: Phép chiếu (projection) - chọn các cột được chỉ định
- σ[...]: Phép chọn (selection) - lọc các hàng theo điều kiện
- ⋈[...]: Phép kết nối (join) - kết hợp hai bảng theo điều kiện
- ∧: Phép AND logic - kết hợp các điều kiện (tất cả điều kiện phải đúng)
- ∨: Phép OR logic - kết hợp các điều kiện (ít nhất một điều kiện đúng)
- -: Phép trừ (difference) - loại bỏ các dòng từ tập kết quả thứ nhất nếu xuất hiện trong tập kết quả thứ hai

## a. Hiển thị danh sách tên các lớp học thuộc khoa Công Nghệ Thông tin.
```
π[TenLop] (σ[TenKhoa = 'Công Nghệ Thông tin'] (Lop ⋈[Lop.MaKhoa = Khoa.MaKhoa] Khoa))
```

## b. Hiển thị danh sách tên các môn học do giáo viên Nguyễn Anh Thư giảng dạy trong học kỳ 2, năm học 2011.
```
π[TenMonHoc] (σ[TenGiaoVien = 'Nguyễn Anh Thư' ∧ HocKy = '2' ∧ NamHoc = '2011'] (MonHoc ⋈[MonHoc.MaMonHoc = HocPhan.MaMonHoc] (HocPhan ⋈[HocPhan.MaGiaoVien = GiaoVien.MaGiaoVien] GiaoVien)))
```

## c. Đưa ra danh sách kết quả học tập của những sinh viên đã tham gia học môn CSDL trong học kỳ 1, năm học 2012.
```
π[MaSinhVien, HoTen, TenMonHoc, DiemChu, DiemSo] (σ[TenMonHoc = 'CSDL' ∧ HocKy = '1' ∧ NamHoc = '2012'] ((KetQuaHocPhan ⋈[KetQuaHocPhan.MaSinhVien = SinhVien.MaSinhVien] SinhVien) ⋈[KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan] (HocPhan ⋈[HocPhan.MaMonHoc = MonHoc.MaMonHoc] MonHoc)))
```

## d. Đưa ra danh sách các sinh viên lớp 55TH1 và 55TH2 không tham gia học môn học Mạng Máy Tính do giáo viên Hoàng Anh Khôi giảng dạy trong học kỳ 2, năm học 2012.
```
π[MaSinhVien, HoTen] (σ[TenLop = '55TH1' ∨ TenLop = '55TH2'] (SinhVien ⋈[SinhVien.MaLop = Lop.MaLop] Lop)) - π[MaSinhVien, HoTen] (σ[TenMonHoc = 'Mạng Máy Tính' ∧ TenGiaoVien = 'Hoàng Anh Khôi' ∧ HocKy = '2' ∧ NamHoc = '2012'] ((KetQuaHocPhan ⋈[KetQuaHocPhan.MaSinhVien = SinhVien.MaSinhVien] SinhVien) ⋈[KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan] ((HocPhan ⋈[HocPhan.MaMonHoc = MonHoc.MaMonHoc] MonHoc) ⋈[HocPhan.MaGiaoVien = GiaoVien.MaGiaoVien] GiaoVien)))
```

## e. Đưa ra danh sách các giáo viên chưa bao giờ chủ nhiệm lớp.
```
π[MaGiaoVien, TenGiaoVien] (GiaoVien) - π[MaGiaoVien, TenGiaoVien] (GiaoVien ⋈[GiaoVien.MaGiaoVien = ChuNhiemLop.MaGiaoVien] ChuNhiemLop)
```

## f. Đưa ra danh sách các sinh viên thuộc khoa Cầu Đường đạt điểm A trong môn Tin Đại Cương, học kỳ 2, năm học 2012.
```
π[MaSinhVien, HoTen] (σ[TenKhoa = 'Cầu Đường' ∧ TenMonHoc = 'Tin Đại Cương' ∧ DiemChu = 'A' ∧ HocKy = '2' ∧ NamHoc = '2012'] ((((SinhVien ⋈[SinhVien.MaLop = Lop.MaLop] Lop) ⋈[Lop.MaKhoa = Khoa.MaKhoa] Khoa) ⋈[SinhVien.MaSinhVien = KetQuaHocPhan.MaSinhVien] KetQuaHocPhan) ⋈[KetQuaHocPhan.MaHocPhan = HocPhan.MaHocPhan] (HocPhan ⋈[HocPhan.MaMonHoc = MonHoc.MaMonHoc] MonHoc)))
```