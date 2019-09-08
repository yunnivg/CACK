@echo off

set resDir="D:\Games\9yinjh\res\"
set tranReadDir="D:\webroot\www\translatecack.my\read"

set cackautoSkinDir="D:\Games\auto-cack-vn\src_china\skin"
set cackautoSkinDirTarget="D:\Games\auto-cack-cn\src_china\skin"
set copySkinDir="D:\Games\auto-cack-vn\softs\Un-Package\res\skin"

set cackautoLuaDir="D:\Games\auto-cack-vn\src_china\lua"
set cackautoLuaDirTarget="D:\Games\auto-cack-cn\src_china\lua"
set copyLuaDirTarget="D:\Games\auto-cack-vn\softs\Un-Package\lua"

set projectTextDir="D:\Games\auto-cack-cn-text\src"

rem chuyển sang thư mục giải nén
cd "Un-Package"

IF EXIST res (
    rmdir /s /q res
)
IF EXIST lua (
    rmdir /s /q lua
)

rem giải nén text
xcopy %resDir%text.package
quickbms age_of_wushu.bms text.package
del text.package

rem giải nén lua
xcopy %resDir%lua.package
quickbms age_of_wushu.bms lua.package
del lua.package

rem giải nén skin
xcopy %resDir%skin.package
quickbms age_of_wushu.bms skin.package
del skin.package

rem sao chép text file để dịch
IF EXIST %tranReadDir% (
    rmdir /s /q %tranReadDir%
)
mkdir %tranReadDir%

xcopy /s res\text\chineses %tranReadDir%

rem sao chép sang project text để đối chiếu
IF EXIST %projectTextDir% (
    rmdir /s /q %projectTextDir%
)
mkdir %projectTextDir%

xcopy /s res\text\chineses %projectTextDir%

rem chuyển trở về thư mục gốc
cd ../

rem copy skin sang kho china
IF EXIST %cackautoSkinDirTarget% (
    rmdir /s /q %cackautoSkinDirTarget%
)
mkdir %cackautoSkinDirTarget%

php directsync.php %cackautoSkinDir% %cackautoSkinDirTarget% %copySkinDir%

rem quét lua ở kho vn, giải mã các file tương ứng và copy sang china
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