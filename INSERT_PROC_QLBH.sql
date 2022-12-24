﻿USE QL_BANHANG
GO 

--Thêm khách hàng--
GO
CREATE PROC sp_ThemKhachHang
	@MANGUOIDUNG CHAR(10),
	@EMAIL VARCHAR(50),
	@TEN NVARCHAR(50),
	@SDT CHAR(10),
	@NGAYTG DATETIME,
	@HINHANHND  BIT,
	@DIACHIHINHANHND VARCHAR(100),
	@MASTKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@DIACHI NVARCHAR(50),
	@SODUVI INT

AS
BEGIN TRAN
	BEGIN TRY
	INSERT INTO KHACHHANG
	VALUES
		(@MANGUOIDUNG, @EMAIL, @TEN, @SDT, @NGAYTG, @HINHANHND, @DIACHIHINHANHND, @MASTKNGANHANG, @MATK, @DIACHI, @MADIACHI, @SODUVI)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm tài khoản--
CREATE PROC sp_ThemTaiKhoan
	@MATK CHAR(10), 
	@TENTK VARCHAR(50),
	@TINHTRANGTK NVARCHAR(30),
	@MATKHAUTK VARCHAR(50),
	@NGAYTG DATETIME,
	@LOAITK INT
AS
BEGIN TRAN
	

	INSERT INTO TAIKHOAN
	VALUES
		(@MATK, @TENTK, @TINHTRANGTK, @MATKHAUTK,@NGAYTG, @LOAITK)
	IF @@ERROR<>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG KHÔNG TẠO TÀI KHOẢN ĐƯỢC'
		ROLLBACK TRAN
		RETURN 1
	END 
COMMIT TRAN
return 0
GO

--Thêm ngân hàng--
CREATE PROC sp_ThemNganHang
	@MASTKNGANHANG CHAR(10),
	@TENNGANHANG NVARCHAR(50),
	@TENCHINHANH NVARCHAR(50),
	@STK CHAR(13)
AS
BEGIN TRAN
	

	INSERT INTO NGANHANG
	VALUES
		(@MASTKNGANHANG, @TENNGANHANG, @TENCHINHANH, @STK)
	IF @@ERROR<>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
COMMIT TRAN
return 
GO

--Thêm đơn đặt hàng--
CREATE PROC sp_ThemDonDH
	@MADH CHAR(10),
	@TRANGTHAIDH NCHAR(20),
	@HINHTHUCTT NCHAR(20),
	@PHISP int,
	@PHIVANCHUYEN int,
	@MAKH CHAR(10),
	@TENKH NVARCHAR(50),
	@SDTKH CHAR(10),
	@MADCGH CHAR(10),
	@DIACHIGH NVARCHAR(50),
	@MACN CHAR(10),
	@TENCN NCHAR(20),
	@DIACHICN NVARCHAR(50),
	@MADT CHAR(10),
	@PTHH INT,
	@MATX CHAR(10),
	@TENTX NVARCHAR(50),
	@SDTTX CHAR(10),
	@BIENSOXE CHAR(10),
	@MAKHUVUC CHAR(10)

AS
BEGIN TRAN
	BEGIN TRY
	DECLARE @NGAYLAP DATE = GETDATE()
	INSERT INTO DON_DH
	VALUES
		(@MADH, @TRANGTHAIDH, @NGAYLAP, @HINHTHUCTT, @PHISP, @PHIVANCHUYEN, @MAKH, @TENKH, @SDTKH, @MADCGH, @DIACHIGH, @MACN, @TENCN, @DIACHICN, @MADT, @PTHH, @MATX, @TENTX, @SDTTX, @BIENSOXE, @MAKHUVUC)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm đánh giá chi nhánh--
CREATE PROC sp_ThemDanhGiaChiNhanh
	@MADH CHAR(10),
	@RATING FLoat,
	@NOIDUNG NVARCHAR(100),
	@MACN CHAR(10),
	@MADT CHAR(10)

AS
BEGIN TRAN
	BEGIN TRY
	DECLARE @NGAYLAP DATETIME = GETDATE()
	INSERT INTO DANHGIA
	VALUES
		(@MADH, @NGAYLAP, @RATING, @NOIDUNG, @MACN, @MADT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm đánh giá món ăn--
CREATE PROC sp_ThemDanhGiaMonAn
	@MADH CHAR(10),
	@MAMONAN CHAR(10),
	@RATING FLoat,
	@NOIDUNG NVARCHAR(100)
AS
BEGIN TRAN
	BEGIN TRY
	DECLARE @NGAYLAP DATETIME = GETDATE()
	INSERT INTO DANHGIA
	VALUES
		(@MADH, @MAMONAN, @NGAYLAP, @RATING, @NOIDUNG)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm đánh giá tài xế--
CREATE PROC sp_ThemDanhGiaTaiXe
	@MADH CHAR(10),
	@MATX CHAR(10),
	@RATING FLoat,
	@NOIDUNG NVARCHAR(100)

AS
BEGIN TRAN
	BEGIN TRY
	DECLARE @NGAYLAP DATETIME = GETDATE()
	INSERT INTO DANHGIA
	VALUES
		(@MADH, @MATX, @NGAYLAP, @RATING, @NOIDUNG)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm địa chỉ--
CREATE PROC sp_ThemDiaChi
	@MADIACHI CHAR(10),
	@SONHA VARCHAR(10),
	@MADUONG CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO DIACHI
	VALUES
		(@MADIACHI, @SONHA, @MADUONG)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO	

--Thêm đường--
CREATE PROC sp_ThemDuong
	@MADUONG CHAR(10),
	@TENDUONG NVARCHAR(50),
	@MAHUYEN CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO DUONG
	VALUES
		(@MADUONG, @TENDUONG, @MAHUYEN)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm quận huyện--
CREATE PROC sp_ThemQuanHuyen
	@MAHUYEN CHAR(10),
	@TENHUYEN NVARCHAR(50),
	@MAKHUVUC CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO QUAN_HUYEN
	VALUES
		(@MAHUYEN, @TENHUYEN, @MAKHUVUC)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm khu vực--
CREATE PROC sp_ThemKhuVuc
	@MAKHUVUC CHAR(10),
	@TENKHUVUC NVARCHAR(50),
	@MACUOC CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO KHUVUC
	VALUES
		(@MAKHUVUC, @TENKHUVUC, @MACUOC)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm giá cước--
CREATE PROC sp_ThemGiaCuoc
	@MACUOC CHAR(10),
	@GIACUOC INT,
	@KHOANGCACH INT,
	@THOIGIANHIEULUC DATETIME,
	@DONVITIEN CHAR(10),
	@MAQTV CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY
	DECLARE @NGAYTAO DATE = GETDATE()
	INSERT INTO GIACUOC
	VALUES
		(@MACUOC, @GIACUOC, @KHOANGCACH, @NGAYTAO, @THOIGIANHIEULUC, @DONVITIEN, @MAQTV)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm tài xế--
CREATE PROC sp_ThemTaiXe
	@MATX CHAR(10),
	@EMAIL VARCHAR(50),
	@TEN NVARCHAR(50),
	@NGAYTG DATETIME,
	@SDT CHAR(10),
	@HINHANHND BIT,
	@DIACHIHINHANHND VARCHAR(100),
	@MATKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@BIENSOXE CHAR(10),
	@PHITHECHAN INT,
	@CMND CHAR(12),
	@MAKHUVUCHD CHAR(10),
	@DIACHI NVARCHAR(50)
AS
BEGIN TRAN
	
	

	INSERT INTO TAIXE
	VALUES
		(@MATX, @TEN, @NGAYTG, @HINHANHND, @DIACHIHINHANHND, @SDT, @BIENSOXE, @PHITHECHAN, @MAKHUVUCHD, @MATK)
	IF @@ERROR<>0

	BEGIN 
		PRINT N'LỖI KHÔNG TẠO ĐƯỢC TÀI XẾ'
		ROLLBACK TRAN
		RETURN 0
	END 
	INSERT INTO TAIXE_CHITIET
	VALUES
		(@MATX, @EMAIL,@NGAYTG,  @CMND,  @MATKNGANHANG, @MADIACHI,@DIACHI)
		IF @@ERROR<>0

	BEGIN 
		PRINT N'LỖI KHÔNG TẠO ĐƯỢC TÀI XẾ'
		ROLLBACK TRAN
		RETURN 
	END 
COMMIT TRAN
return 
GO

--Thêm quản trị viên
CREATE PROC sp_ThemQuanTriVien
	@MAQTV CHAR(10),
	@EMAIL VARCHAR(50),
	@TEN NVARCHAR(50),
	@SDT CHAR(10),
	@NGAYTG DATETIME,
	@HINHANHND BIT,
	@DIACHIHINHANHND VARCHAR(100),
	@MATKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@LUONGQTV INT,
	@DIACHI NVARCHAR(50)

AS
BEGIN TRAN
	
	INSERT INTO QUANTRIVIEN
	VALUES
		(@MAQTV, @EMAIL, @MATK, @TEN, @SDT, @NGAYTG, @HINHANHND, @DIACHIHINHANHND, @LUONGQTV, @MATKNGANHANG, @MADIACHI,@DIACHI)
	IF @@ERROR <>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
COMMIT TRAN
return 
GO

--Thêm quyền thao tác--
CREATE PROC sp_ThemQuyenThaoTac
	@MAQTV CHAR(10),
	@MATK CHAR(10),
	@MATHAOTAC CHAR(10),
	@MATHUOCTINH CHAR(10),
	@DUOCPHEP BIT
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO QUYENTHAOTAC
	VALUES
		(@MAQTV, @MATK, @MATHAOTAC, @MATHUOCTINH, @DUOCPHEP)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm thao tác--
CREATE PROC sp_ThemThaoTac
	@MATHAOTAC CHAR(10),
	@TENTHAOTAC NCHAR(20)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO THAOTAC
	VALUES
		(@MATHAOTAC, @TENTHAOTAC)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm thuộc tính--
CREATE PROC sp_ThemThuocTinh
	@MATHUOCTINH CHAR(10),
	@TENTHUOCTINH NCHAR(20),
	@MAPHAMVI CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO THUOCTINH
	VALUES
		(@MATHUOCTINH, @TENTHUOCTINH, @MAPHAMVI)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm phạm vi bảng--
CREATE PROC sp_ThemPhamViBang
	@MAPHAMVI CHAR(10),
	@TENPHAMVI NCHAR(20),
	@IDMAX int
AS
BEGIN TRAN
	BEGIN TRY

	INSERT INTO PHAMVIBANG
	VALUES
		(@MAPHAMVI, @TENPHAMVI, @IDMAX)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm nhân viên--
CREATE PROC sp_ThemNhanVien
	@MANHANVIEN CHAR(10) ,
	@EMAIL VARCHAR(50),
	@TEN NVARCHAR(20),
	@SDT CHAR(10),
	@NGAYTG DATE,
	@HINHANHND BIT,
	@DIACHIHINHANHND VARCHAR(100),
	@MATKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@DIACHI NVARCHAR(50),
	@LUONGNV MONEY
	
AS
BEGIN TRAN 
	
	
	INSERT INTO NHANVIEN
	VALUES
		(@MANHANVIEN, @TEN, @HINHANHND, @DIACHIHINHANHND,@MATK)
	IF @@ERROR<>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
	
	INSERT INTO NHANVIEN_CHITIET
	VALUES
		(@MANHANVIEN, @EMAIL, @SDT, @NGAYTG, @LUONGNV, @MATKNGANHANG, @MADIACHI,@DIACHI)
	IF @@ERROR<>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
COMMIT TRAN
return 0
GO

--Thêm hợp đồng--
CREATE PROC sp_ThemHopDong
	@MAHD CHAR(10),
	@SL_CN_DK INT,
	@PHIKH INT,
	@MADOITAC CHAR(10),
	@MANHANVIEN CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @NGAYLAP DATE = GETDATE()
	INSERT INTO HOPDONG
	VALUES
		(@MAHD, @SL_CN_DK, @NGAYLAP, @PHIKH, @MADOITAC, @MANHANVIEN)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm thông tin hợp đồng--
CREATE PROC sp_ThemThongTinHopDong
	@MAHD CHAR(10),
	@STT int,
	@TGHH DATE,
	@PHTT INT

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @TGBD DATE = GETDATE()
	INSERT INTO THONGTIN_HOPDONG
	VALUES
		(@MAHD, @STT, @TGBD, @TGHH, @PHTT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm đối tác--
CREATE PROC sp_ThemDoiTac
	@MADOITAC CHAR(10),
	@EMAILDT CHAR(50),
	@TENDT NCHAR(50),
	@NGAYTG DATETIME,
	@SDTDT CHAR(10),
	@HINHANHND  BIT,
	@DIACHIHINHANHND CHAR(100),
	@MATKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@MSTHUE CHAR(10),
	@MAIL_NDD VARCHAR(50),
	@SLDUKIENMIN INT,
	@SLDUKIENMAX INT,
	@DIACHI NVARCHAR(50)
	

AS
BEGIN TRAN 

	INSERT INTO DOITAC
	VALUES
		(@MADOITAC, @TENDT, @NGAYTG, @HINHANHND, @DIACHIHINHANHND,  @MATK)
	IF @@ERROR <>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
	INSERT INTO DOITAC_CHITIET
	VALUES
		(@MADOITAC, @EMAILDT, @SDTDT, @MSTHUE,	@MAIL_NDD, @SLDUKIENMIN, @SLDUKIENMAX, @MATKNGANHANG, @MADIACHI, @DIACHI)
	IF @@ERROR <>0
	BEGIN 
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 
	END 
COMMIT TRAN
return 
GO

--Thêm loại ẩm thực - đối tác
CREATE PROC sp_ThemLoaiAmThucDoiTac
	@MALAT CHAR(10), 
	@MADT CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY

	INSERT INTO LOAIAMTHUCDOITAC
	VALUES
		(@MALAT, @MADT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm chi nhánh--
CREATE PROC sp_ThemChiNhanh
	@MACN CHAR(10),
	@SDT_CN CHAR(10),
	@MATKNGANHANG CHAR(10),
	@MATK CHAR(10),
	@MADIACHI CHAR(10),
	@DIACHI NCHAR(50),
	@PTHH INT,
	@MADT CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @NGAYTG DATE = GETDATE()
	INSERT INTO CHINHANH
	VALUES
		(@MACN,	@SDT_CN, @NGAYTG, @MATK, @MATKNGANHANG,	@MADIACHI, @DIACHI, @PTHH, @MADT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm hợp đồng - chi nhánh--
CREATE PROC sp_ThemHopDongChiNhanh
	@MACN CHAR(10),
	@MAHD CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY

	INSERT INTO HOPDONGCHINHANH
	VALUES
		(@MACN, @MAHD)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm cửa hàng--
CREATE PROC sp_ThemCuaHang
	@MACN CHAR(10),
	@TENCH NVARCHAR(20),
	@TG_HD_MO TIME,
	@TG_HD_DONG TIME,
	@TINHTRANGCH NCHAR(20),
	@HINHANHND BIT,
	@DIACHIHINHANHND VARCHAR(100),
	@SLDH INT,
	@DANHGIATB FLOAT

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @TGCAPNHATSOLIEU DATETIME = GETDATE()
	INSERT INTO CUAHANG
	VALUES
		(@MACN,	@TENCH,	@TG_HD_MO, @TG_HD_DONG, @TINHTRANGCH, @HINHANHND, @DIACHIHINHANHND, @TGCAPNHATSOLIEU, @SLDH, @DANHGIATB)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm loại ẩm thực--
CREATE PROC sp_ThemLoaiAmThuc
	@MALAT CHAR(10),
	@TENLAT NCHAR(20)

AS
BEGIN TRAN 
	BEGIN TRY

	INSERT INTO LOAIAMTHUC
	VALUES
		(@MALAT, @TENLAT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm thực đơn--
CREATE PROC sp_ThemThucDon
	@MAMONAN CHAR(10),
	@TENMONAN NVARCHAR(100),
	@MOTA NVARCHAR (80),
	@GIA INT,
	@TINHTRANG NCHAR(20),
	@HINHANHTD BIT,
	@DIACHIHINHANHTD VARCHAR(100),
	@SLDH INT,
	@DANHGIATB FLOAT,
	@MACN CHAR(10),
	@MALAT CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @TGCAPNHATSOLIEU DATETIME = GETDATE()
	INSERT INTO THUCDON
	VALUES
		(@MAMONAN,	@TENMONAN,	@MOTA,	@GIA,	@TINHTRANG,	@HINHANHTD,	@DIACHIHINHANHTD, @TGCAPNHATSOLIEU, @SLDH, @DANHGIATB, @MACN, @MALAT)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm tùy chọn món ăn--
CREATE PROC sp_ThemTuyChonMonAn
	@MATUYCHON CHAR(10),
	@TENTUYCHON NCHAR(20),
	@MUCDO NCHAR(20),
	@MAMONAN CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY

	INSERT INTO TUYCHONMONAN
	VALUES
		(@MATUYCHON, @TENTUYCHON, @MUCDO, @MAMONAN)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm thực đơn đặt hàng--
CREATE PROC sp_ThemThucDonDatHang
	@MAMONAN CHAR(10),
	@TENMONAN NVARCHAR(50),
	@MADH CHAR(10),
	@GIABAN INT,
	@SOLUONG INT

AS
BEGIN TRAN 
	BEGIN TRY
	DECLARE @NGAYLAP DATE = GETDATE()
	INSERT INTO THUCDONDATHANG
	VALUES
		(@MAMONAN, @TENMONAN, @MADH, @NGAYLAP, @GIABAN, @SOLUONG)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO

--Thêm tùy chọn món đặt hàng--
CREATE PROC sp_ThemTuyChonMonDatHang
	@MATUYCHON CHAR(10),
	@MADH CHAR(10)

AS
BEGIN TRAN 
	BEGIN TRY
	IF ((SELECT TD.TINHTRANG
		FROM TUYCHONMONDATHANG TCMDH
		JOIN TUYCHONMONAN TCMA
		ON TCMDH.MATUYCHON = TCMA.MATUYCHON
		JOIN THUCDON TD
		ON TCMA.MAMONAN = TD.MAMONAN) = 'Hết hàng')
	BEGIN
		PRINT N'Món này hiện đã ngừng bán'
		ROLLBACK TRAN
		RETURN 1
	END
	INSERT INTO TUYCHONMONDATHANG
	VALUES
		(@MATUYCHON, @MADH)
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
return 0
GO