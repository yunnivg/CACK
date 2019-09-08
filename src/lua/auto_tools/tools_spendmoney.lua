require("const_define")
require("define\\object_type_define")
require("define\\sysinfo_define")
require("define\\request_type")
require("share\\server_custom_define")
require("share\\client_custom_define")
require("share\\chat_define")
require("share\\npc_type_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_functions")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_spendmoney"
local auto_usera_is_running = false
local auto_userb1_is_running = false
local auto_userb2_is_running = false
local auto_userc_is_running = false

function auto_run_usera()
	while auto_usera_is_running == true do
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end
        local map_query = nx_value("MapQuery")
        if not nx_is_valid(map_query) then
            is_vaild_data = false
        end

		if is_vaild_data == true then
            local city = map_query:GetCurrentScene()
            local posX = nx_number(form.ipt_posx.Text)
            local posZ = nx_number(form.ipt_posy.Text)
            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"

            -- Nếu bị chết thì trị thương lân cận
            local logicstate = player_client:QueryProp("LogicState")
            if logicstate == 120 then
                nx_execute("custom_sender", "custom_relive", 2, 0)
                nx_pause(7)
            -- Chưa tới điểm đứng đó thì di chuyển đến
            elseif not tools_move_isArrived2D(posX, -10000, posZ) then
                tools_move(city, posX, -10000, posZ, 0)
            else
                local form_shortcut = nx_value(FORM_SHORTCUT)
                local grid_shortcut = form_shortcut.grid_shortcut_main
                local game_shortcut = nx_value("GameShortcut")
                game_shortcut:on_main_shortcut_useitem(grid_shortcut, 0, true)
            end
        end
        nx_pause(0.2)
    end
end
function auto_run_userb1()
	while auto_userb1_is_running == true do
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end

		if is_vaild_data == true then
            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
            local select_target_ident = player_client:QueryProp("LastObject")
            local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
            if nx_is_valid(select_target) then
                local obj_type = nx_number(select_target:QueryProp("Type"))
                local fight = nx_value("fight")
                local can_attack = fight:CanAttackPlayer(player_client, select_target)
                local logic_state = select_target:QueryProp("LogicState")

                if obj_type == TYPE_PLAYER and can_attack and logic_state ~= 121 and logic_state ~= 120 and logic_state ~= 0 then
                    local form_shortcut = nx_value(FORM_SHORTCUT)
                    local grid_shortcut = form_shortcut.grid_shortcut_main
                    local game_shortcut = nx_value("GameShortcut")
                    game_shortcut:on_main_shortcut_useitem(grid_shortcut, 0, true)
                end
            end
        end
        nx_pause(0.2)
    end
end
function auto_run_userb2()
	while auto_userb2_is_running == true do
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end

		if is_vaild_data == true then
            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
            local select_target_ident = player_client:QueryProp("LastObject")
            local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
            if nx_is_valid(select_target) then
                local obj_type = nx_number(select_target:QueryProp("Type"))
                local fight = nx_value("fight")
                local can_attack = fight:CanAttackPlayer(player_client, select_target)
                local logic_state = select_target:QueryProp("LogicState")

                if obj_type == TYPE_PLAYER and can_attack then
                    local form_shortcut = nx_value(FORM_SHORTCUT)
                    local grid_shortcut = form_shortcut.grid_shortcut_main
                    local game_shortcut = nx_value("GameShortcut")
                    game_shortcut:on_main_shortcut_useitem(grid_shortcut, 0, true)
                    nx_pause(0.2)
                    game_shortcut:on_main_shortcut_useitem(grid_shortcut, 1, true)
                end
            end
        end
        nx_pause(0.2)
    end
end
function auto_run_userc()
	while auto_userc_is_running == true do
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end
		
        if is_vaild_data == true then
            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
            local select_target_ident = player_client:QueryProp("LastObject")
            local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
            if nx_is_valid(select_target) then
                local obj_type = nx_number(select_target:QueryProp("Type"))
                local fight = nx_value("fight")
                local can_attack = fight:CanAttackPlayer(player_client, select_target)
                local logic_state = select_target:QueryProp("LogicState")
                local myPK = nx_number(player_client:QueryProp("PKValue"))
                if obj_type == TYPE_PLAYER and can_attack and logic_state == 121 and myPK < 1950 then
                    local form_shortcut = nx_value(FORM_SHORTCUT)
                    local grid_shortcut = form_shortcut.grid_shortcut_main
                    local game_shortcut = nx_value("GameShortcut")
                    game_shortcut:on_main_shortcut_useitem(grid_shortcut, 0, true)
                    nx_pause(0.2)
                    game_shortcut:on_main_shortcut_useitem(grid_shortcut, 1, true)
                end
            end
        end
        nx_pause(0.2)
    end
end
function reset_all_user()
    auto_usera_is_running = false
    auto_userb1_is_running = false
    auto_userb2_is_running = false
    auto_userc_is_running = false
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    form.btn_start_user_a.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    form.btn_start_user_b1.Text = nx_function("ext_utf8_to_widestr", "Đánh xỉu")
    form.btn_start_user_b2.Text = nx_function("ext_utf8_to_widestr", "Đánh ngủm")
    form.btn_start_user_c.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end
function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end
function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
    local hintUtf8HtmlText = "Hướng dẫn:<br><s>- Người cần xả bạc hoặc người bị đánh chết để farm hiệp ác gọi là con mồi.<br><s>- Người sẽ xuất chiêu đánh chết người cần xả bạc hoặc đánh trọng thương con mồi gọi là Tự đánh lại.<br><s>- Người cần lên điểm hiệp ác gọi là PK.<br>Xả bạc:<br><s>- Sử dụng con mồi và tự đánh lại.<br><s>- Con mồi tới điểm cần đánh, ấn nút lấy tọa độ, target vào người Tự đánh lại, bật pk (nhớ chọn quần công) và ấn bắt đầu.<br><s>- Tự đánh lại đứng tại chỗ và ấn nút bắt đầu, có thể phải target vào con mồi.<br>Farm hiệp ác:<br><s>- Sử dụng cả ba đối tượng.<br><s>- Con mồi tới điểm cần đánh, ấn nút lấy tọa độ, target vào người Tự đánh lại, bật pk (nhớ chọn quần công) và ấn bắt đầu.<br><s>- Tự đánh lại đứng tại chỗ và ấn nút bắt đầu, có thể phải target vào con mồi.<br><s>- PK bật pk, target vào con mồi và ấn bắt đầu."
    form.mltbox_hint.HtmlText = nx_function("ext_utf8_to_widestr", hintUtf8HtmlText)
end
function on_main_form_close(form)
    reset_all_user()
	nx_destroy(form)
end
function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end
function change_form_size()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	local gui = nx_value("gui")
	--form.Left = (gui.Width - form.Width) / 2
	--form.Top = (gui.Height - form.Height) / 2
	form.Left = 100
	form.Top = 140
end
function on_btn_getpos_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
	end
	local px = string.format("%d", game_player.PositionX)
	local pz = string.format("%d", game_player.PositionZ)
    form.ipt_posx.Text = nx_widestr(px)
    form.ipt_posy.Text = nx_widestr(pz)
end
function on_btn_start_user_a_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	if auto_usera_is_running then
		reset_all_user()
	else
        reset_all_user()
		auto_usera_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_usera()
	end
end
function on_btn_start_user_b1_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	if auto_userb1_is_running then
		reset_all_user()
	else
        reset_all_user()
		auto_userb1_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_userb1()
	end
end
function on_btn_start_user_b2_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	if auto_userb2_is_running then
		reset_all_user()
	else
        reset_all_user()
		auto_userb2_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_userb2()
	end
end
function on_btn_start_user_c_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	if auto_userc_is_running then
		reset_all_user()
	else
        reset_all_user()
		auto_userc_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_userc()
	end
end
