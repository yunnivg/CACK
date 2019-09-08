# Auto Cửu Âm Chân Kinh Việt Nam

## Trong auto này có gì?

- Auto bắt cóc
- Auto trồng cây + Nuôi tằm
- Auto hái khoáng, dược, độc
- Auto chặt cây
- Auto câu cá
- Auto nhận kỳ ngộ (tổng hợp các kỳ ngộ xịn)
- Auto rao kênh thế giới, đội, map, gần, bang, thế lực, phái
- Auto check thời gian reset cóc
- Auto phát hiện cóc reset + tự động thổi
- Auto tung hoành tứ hải + Thế lực
- Auto bày shops online
- Auto phát hiện rương trong Khoái Hoạt Đảo (gần 20 loại bảo rương)
- Auto mở rương trong sự kiện Đấu Trường Hoạt Đảo
- Auto mở tạp hóa mọi nơi mà không cần mã tiêu hay lạc đà
- Auto đàn tự động đàn lại
- Auto tự trị thương lân cận khi bị đánh chết
- Auto các nhiệm vụ của Cổ Mộ: Đu dây, song tu, luyện mật ong.
- Auto vận tiêu
- Auto đánh cờ
- Mở khóa giới hạn mở tối đa 3 client
- Mở Map tân thế giới
- Auto luyện công, thụ nghiệp
- Auto nhiệm vụ đốt lửa Từ Gia Trang.
- Tự điền từ "Xóa" vào bảng xác nhận xóa vật phẩm quan trọng
- Auto sử dụng vật phẩm
- Bỏ xác nhận khi nhặt vật phẩm sẽ cố định
- Thần hành đi mọi vị trí
- Auto xả bạc, farm hiệp ác
- Auto nhiệm vụ nội công 6: Hoàng gia bí cảnh, dao đài đếm hoa, nhanh tay lẹ mắt
- Hỗ trợ nhiệm vụ luyện nhãn lực Di Hoa Cung
- Auto giải cứu cóc
- Auto đi theo
- Auto đánh boss cấm địa NMQ Phản Quân
- Công cụ nhập tọa độ để di chuyển trong map (Áp dụng với một số map không cho nhập tọa độ ví dụ như tân thế giới, di hoa cung...)
- Auto soi buff
- Auto quét người chơi
- Auto xóa thư hệ thống
- Auto đào khoáng, chặt cây và gửi thư dự trữ khi đi NMQ Thủ Quân
- Auto xuất chiêu
- Auto thợ săn

### LUA

```
main.lua                                                         Mở khóa MAX CLIENT

form_common\form_confirm_del.lua                                 Điền sẵn từ "Xóa" khi xóa vật phẩm quan trọng

form_stage_main\form_give_item.lua                               Sửa lỗi khi auto nhận ITEM (ví dụ bán cóc xong nhận sửa công cụ)
form_stage_main\form_talk_movie.lua                              Ghi log MESSAGE ID và tên NPC khi nói chuyện (nhằm lấy mã để auto nhận kỳ ngộ, auto đối thoại ....) Log ghi vào D:/log.txt
form_stage_main\form_bag_func.lua                                Sửa khi CTRL+Click vào Item để đưa vào auto chat

form_stage_main\form_main\form_main.lua                          Sửa để thêm nút công cụ vào 3 nút Giang hồ, chiến đấu, cuộc sống
form_stage_main\form_main\form_main_request.lua                  Sửa để xác nhận có REQUSET ví dụ mời tổ đội, mời giao dịch...

form_stage_main\form_pick\form_droppick.lua                      Sửa để auto nhận vật phẩm ví dụ khi trồng cây, nhấp vào nhận, bỏ xác nhận khi nhận vật phẩm sẽ cố định

form_stage_main\form_school_dance\form_school_dance_key.lua      Auto thụ nghiệp

form_stage_main\form_small_game\form_findpic.lua                 Luyện nhãn lực Di Hoa Cung
form_stage_main\form_small_game\form_forgegame.lua               Auto game
form_stage_main\form_small_game\form_game_balance.lua            Không nhớ game gì
form_stage_main\form_small_game\form_game_bee.lua                Không nhớ game gì
form_stage_main\form_small_game\form_game_pick.lua               Không nhớ game gì
form_stage_main\form_small_game\form_game_question.lua           Không nhớ game gì
form_stage_main\form_small_game\form_game_rope_swing.lua         Auto game đu dây Cổ Mộ
form_stage_main\form_small_game\form_game_weiqi.lua              Không nhớ game gì
form_stage_main\form_small_game\form_jia_huo_game.lua            Auto đánh cờ
form_stage_main\form_small_game\form_mini_qingame.lua            Auto đàn buff đội
form_stage_main\form_small_game\form_qingame.lua                 Auto đàn kỹ nghệ nhận tâm đắc

form_stage_main\form_wuxue\form_team_faculty_dance.lua           Auto luyện nhóm
```

Các file thêm:

```
auto_tools/form_func_btns_tools.lua   Code xử lý khi để chuột vào nút Công Cụ
auto_tools/inspect.lua                Thư viện xử lý export một biến
auto_tools/tool_libs.lua              Thư viện các hàm dùng trong các chức năng Auto
auto_tools/tools_captureqt.lua        Auto nhận kỳ ngộ
auto_tools/tools_crop.lua             Auto trồng cây nuôi tằm
auto_tools/tools_chat.lua             Auto rao
auto_tools/tools_doabduct.lua         Auto bắt cóc
auto_tools/tools_dofile.lua           Thực thi file code.lua nằm tại D:/code.lua nhằm mục đích phát triển
auto_tools/tools_escort.lua           Auto vận tiêu
auto_tools/tools_fish.lua             Auto câu cá
auto_tools/tools_grocery.lua          Auto mở tạp hóa ở bất kỳ đâu
auto_tools/tools_lookup.lua           Auto quét MAP, check buff (Check cóc, thổi cóc, soi buff)
auto_tools/tools_minemedi.lua         Auto đào khoáng, hái thuốc dược + độc
auto_tools/tools_qingame.lua          Auto đàn tự đàn lại
auto_tools/tools_stallonline.lua      Auto bày shops online
auto_tools/tools_test.lua             Gọi lệnh DEBUG (có thể check được sát thủ cấm địa là ai)
auto_tools/tools_woodcut.lua          Auto chặt cây
auto_tools/tools_useitems.lua         Auto dùng vật phẩm
auto_tools/tools_homepoint.lua        Thần hành mọi vị trí trong game
```

## Các phần mềm và hướng dẫn

- So sánh các file thay đổi sử dụng Winmerge: http://winmerge.org/
- Tạo project ảo dùng Visual SVN: https://www.visualsvn.com/server/

### Cách giải nén file .package

- Trong thư mục `softs/Un-Package` khởi chạy file `quickbms.exe`
- Chọn file age_of_wushu.bms
- Chọn file .package cần giải nén
- Chọn thư mục sẽ giải nén
- Nhấp OK

### Cách nén lại file .package

Sửa dụng phần mềm trong `Unpack - Has Viruts - Warning.rar`

> Chú ý: Phần mềm này chạy trên XP, window khác sẽ báo lỗi có virut, cần cài máy ảo để chạy.

Hướng dẫn phần mềm xem: https://www.youtube.com/watch?v=pUCpXrNDrJM

### Cách giải mã toàn bộ file lua.package

Yêu cầu: 
- Máy cài PHP
- Máy cài Java SDK hoặc Java JRE
- Đặt toàn bộ nội dung trong thư mục softs vào `D:\Games\1.Vooc CACK\CACK_TDHL_DEVELOP` nếu đường dẫn khác cần mở các file BAT, PHP lên để thay
- Đường dẫn JAVA phải là `C:\Program Files (x86)\Java\jre1.8.0_121\bin\java.exe`. Nếu khác cần mở các file PHP lên để thay.
- Máy cài LUA: https://www.lua.org/download.html

Cách thực hiện:

- Đặt toàn bộ các file đã giải nén được vào thư mục `D:\Games\1.Vooc CACK\CACK\lua`
- Chạy `Lua-Decode/3.execute.bat`
- File được giải mã nằm trong thư mục `lua` ngang hàng file `3.execute.bat`

### Cách mã hóa một file lua

Yêu cầu: 
- Máy cài PHP
- Máy cài Java SDK hoặc Java JRE
- Đặt toàn bộ nội dung trong thư mục softs vào `D:\Games\1.Vooc CACK\CACK_TDHL_DEVELOP` nếu đường dẫn khác cần mở các file BAT, PHP lên để thay
- Đường dẫn JAVA phải là `C:\Program Files (x86)\Java\jre1.8.0_121\bin\java.exe`. Nếu khác cần mở các file PHP lên để thay.
- Máy cài LUA: https://www.lua.org/download.html

Cách thực hiện:

- Đặt file chưa mã hóa vào decoded_files
- Chạy 1.enlua.bat
- File mã hóa nằm trong thư mục encoded_files

### Cách giải mã một file lua

Yêu cầu: 
- Máy cài PHP
- Máy cài Java SDK hoặc Java JRE
- Đặt toàn bộ nội dung trong thư mục softs vào `D:\Games\1.Vooc CACK\CACK_TDHL_DEVELOP` nếu đường dẫn khác cần mở các file BAT, PHP lên để thay
- Đường dẫn JAVA phải là `C:\Program Files (x86)\Java\jre1.8.0_121\bin\java.exe`. Nếu khác cần mở các file PHP lên để thay.
- Máy cài LUA: https://www.lua.org/download.html

Cách thực hiện:

- Đặt file đã mã hóa vào encoded_files
- Chạy 2.unlua.bat
- File đã giải mã nằm trong thư mục decoded_files
