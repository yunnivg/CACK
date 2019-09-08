@echo off

set resDir="D:\Games\CACK2\res\"

set cackautoSkinDir="D:\Games\auto-cack-vn\src\skin"
set cackautoSkinDirTarget="D:\Games\auto-cack-vn-compare\src\skin"
set copySkinDir="D:\Games\auto-cack-vn\softs\Un-Package\res\skin"

set cackautoLuaDir="D:\Games\auto-cack-vn\src\lua"
set cackautoLuaDirTarget="D:\Games\auto-cack-vn-compare\src\lua"
set copyLuaDirTarget="D:\Games\auto-cack-vn\softs\Un-Package\lua"

rem chuyển sang thư mục giải nén
cd "Un-Package"

IF EXIST res (
    rmdir /s /q res
)
IF EXIST lua (
    rmdir /s /q lua
)

rem giải nén lua
xcopy %resDir%lua.package
quickbms age_of_wushu.bms lua.package
del lua.package

rem giải nén skin
xcopy %resDir%skin.package
quickbms age_of_wushu.bms skin.package
del skin.package

rem chuyển trở về thư mục gốc
cd ../

rem copy skin sang kho đối chiếu
IF EXIST %cackautoSkinDirTarget% (
    rmdir /s /q %cackautoSkinDirTarget%
)
mkdir %cackautoSkinDirTarget%

php directsync.php %cackautoSkinDir% %cackautoSkinDirTarget% %copySkinDir%

rem quét lua ở kho vn, giải mã các file tương ứng và copy sang kho đối chiếu
IF EXIST %cackautoLuaDirTarget% (
    rmdir /s /q %cackautoLuaDirTarget%
)
mkdir %cackautoLuaDirTarget%

php encodesync.php %cackautoLuaDir% %cackautoLuaDirTarget% %copyLuaDirTarget%

rem cuối cùng xóa hết thư mục tạm
cd "Un-Package"
rmdir /s /q lua
rmdir /s /q res

pause
