@echo off

set exportDir="D:\Share\lua"
set codeDir="D:\Games\auto-cack-vn\src_china\lua"

set exportDirA="D:\Share\lua\auto_tools"
set codeDirA="D:\Games\auto-cack-vn\src\lua\auto_tools"

set skinDir="D:\Games\auto-cack-vn\src\res\skin\auto_tools"
set skinExportDir="D:\Share\skin\auto_tools"

rem xóa thư mục export và tạo lại
IF EXIST %exportDir% (
    rmdir /s /q %exportDir%
)
mkdir %exportDir%

php exportencrypt.php %codeDir% %exportDir%

IF EXIST %exportDirA% (
    rmdir /s /q %exportDirA%
)
mkdir %exportDirA%

php exportencrypt.php %codeDirA% %exportDirA%

IF EXIST %skinExportDir% (
    rmdir /s /q %skinExportDir%
)
mkdir %skinExportDir%

php directsync.php %skinDir% %skinExportDir% %skinDir%

pause