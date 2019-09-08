require("const_define")
require("util_gui")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")
require("define\\team_rec_define")

auto_init = function()	
		local is_vaild_data = true
		local game_client
		local game_visual
		local game_player
		local player_client
		local game_scence
		game_client = nx_value("game_client")
		if not nx_is_valid(game_client) then
			is_vaild_data = false
		end
		game_visual = nx_value("game_visual")
		if not nx_is_valid(game_visual) then
			is_vaild_data = false
		end
		if is_vaild_data == true then
			game_player = game_visual:GetPlayer()
			if not nx_is_valid(game_player) then
				is_vaild_data = false
			end
			player_client = game_client:GetPlayer()
			if not nx_is_valid(player_client) then
				is_vaild_data = false
			end
			game_scence = game_client:GetScene()
			if not nx_is_valid(game_scence) then
				is_vaild_data = false
			end
		end

		if player_client:QueryProp("LogicState") == 121 then
                nx_execute("custom_sender", "custom_relive", 2, 0)
		else
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Trạng thái bất thường"))
		end
end
