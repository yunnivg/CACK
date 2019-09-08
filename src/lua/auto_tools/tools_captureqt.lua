require("const_define")
require("util_gui")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")

-- boxnpc_khd_bx001 -> boxnpc_khd_bx012
local auto_is_running = false
local num_repeated = 0

function auto_init()
	-- Click 1 cai thi chay, click cai nua thi dung
	if not auto_is_running then
		auto_is_running = true
		num_repeated = 0
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu auto nhận kỳ ngộ xịn"))
		
		while auto_is_running == true do
			auto_capture_qt()
			
			num_repeated = num_repeated + 1
			if num_repeated >= 6 then
				num_repeated = 0
				tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang auto nhận kỳ ngộ xịn"))
			end
			nx_pause(2)
		end
	else
		auto_is_running = false
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc auto nhận kỳ ngộ xịn"))
	end
end