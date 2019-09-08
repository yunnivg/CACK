@echo off

set exportDir="D:\Share\lua"
set codeDir="D:\Games\auto-cack-vn\src\lua"

set skinDir="D:\Games\auto-cack-vn\src\skin"
set skinExportDir="D:\Share\skin"

rem xóa thư mục export và tạo lại
IF EXIST %exportDir% (
    rmdir /s /q %exportDir%
)
mkdir %exportDir%

php exportencrypt.php %codeDir% %exportDir%

IF EXIST %skinExportDir% (
    rmdir /s /q %skinExportDir%
)
mkdir %skinExportDir%

php directsync.php %skinDir% %skinExportDir% %skinDir% yes

pause