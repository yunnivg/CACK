require("const_define")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")

function auto_init()
	local file = assert(loadfile("D:\\code.lua"))
	file()
end
