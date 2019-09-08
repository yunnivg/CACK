require("util_functions")
require("auto_tools\\tool_libs")

--[[
sh_qs ID nghe dan
Kiem tra nghe dan
nx_execute("form_stage_main\\form_life\\form_job_main_new", "find_life_job", "sh_qs")
Kiem tra da hoc bai dan chua
nx_execute("form_stage_main\\form_life\\form_job_qishi", "is_Learned_formula", "ID BAI DAN")
Thuc hien dan
nx_execute("custom_sender", "custom_doqin", formula_item_id)
nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
ID dan
hc_1000054 Noi luc
hc_1000053 Dan mau
hc_1000056 Bao kich
--]]

local array_formula = {
	{"hc_1000054", "đàn hồi nội lực"}, -- Nội lực
	{"hc_1000053", "đàn hồi máu"}, -- Máu
	{"hc_1000056", "đàn bạo kích"} -- Bạo kích
}
-- auto_is_running: 0, 1, 2, 3, 4
local auto_is_running = 0

function auto_init()
	if not nx_execute("form_stage_main\\form_life\\form_job_main_new", "find_life_job", "sh_qs") then
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Chưa học nghề đàn"), 1)
		return 0
	end
	
	auto_is_running = auto_is_running + 1
	if auto_is_running >= 4 then
		auto_is_running = 0
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Dừng auto đàn"))
	end

	if auto_is_running ~= 0 then
		if not nx_execute("form_stage_main\\form_life\\form_job_qishi", "is_Learned_formula", array_formula[auto_is_running][1]) then
			tools_show_notice(nx_function("ext_utf8_to_widestr", "Chưa học bài") .. nx_widestr(" ") .. nx_function("ext_utf8_to_widestr", array_formula[auto_is_running][2]))
			auto_is_running = 0
			return 0
		end
		
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu") .. nx_widestr(" ") .. nx_function("ext_utf8_to_widestr", array_formula[auto_is_running][2]))
		
		while auto_is_running ~= 0 do
			local is_vaild_data = true
			local game_client
			local player_client
			
			game_client = nx_value("game_client")
			if not nx_is_valid(game_client) then
				is_vaild_data = false
			end
			if is_vaild_data == true then
				player_client = game_client:GetPlayer()
				if not nx_is_valid(player_client) then
					is_vaild_data = false
				end
			end

			--[[
			--QueryProp("Dead")
			--QueryProp("Weapon")
			--QueryProp("BattlefieldState")
			--QueryProp("LogicState")
			--QueryProp("GameState") == "QinGameModule"
				0 binh thuong, thu vu khi
				1 dang chien dau
				2 binh thuong, rut vu khi
				10 dang choi dan
				102 dang ngoi thien
				121 trong thuong
				120 chet
				104 dang hai luom (hai thuoc, chat cay dao khoang)
			--QueryProp("FreshManProtect") TAN THU
			--QueryProp("PKMode")
			--]]
			if is_vaild_data == true then
				local logicstate = player_client:QueryProp("LogicState")
				if logicstate ~= 10 and logicstate ~= 102 and logicstate ~= 121 and logicstate ~= 120 and player_client:QueryProp("GameState") ~= "QinGameModule" then
					nx_execute("custom_sender", "custom_doqin", array_formula[auto_is_running][1])
					nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
				end
			end
			nx_pause(1)
		end
	end
end