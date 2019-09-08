require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_woodcut"
local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"
local auto_is_running = false

local DATA_WOODCUT_PATH = "autodata\\data_woodcut.lua"
local filedatacut = nil

function auto_run()
	local step = 1
	local pos_current = 1
	local pos_numbers = 1
	local num_cut = 0

    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        auto_is_running = false
        return false
    end
    
    local ids = get_data()
    if ids == false then 
        control_this_form(form, ids)
        return false
    end
    
    local selected_text = form.combobox_ids.Text
    local pos = get_data_pos(selected_text)
    local city = get_current_map()
    
    if pos == false then
        control_this_form(form, false)
        return false
    end
	
	while auto_is_running == true do			
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
            form.mltbox_content:Clear()
			local logicstate = player_client:QueryProp("LogicState")
			
			-- Nếu bị chết thì phải bắt đầu lại từ đầu
			if logicstate == 120 then
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bị chết, trị thương lân cận để bắt đầu lại"), -1)
				step = 1
				pos_current = 1
				nx_execute("custom_sender", "custom_relive", 2, 0)
				nx_pause(15)
			end

			pos_numbers = table.getn(pos)
			if pos_current > pos_numbers then
				pos_current = 1
			end
			
			-- Đến điểm pos[pos_current]
			if step == 1 then
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Di chuyển đến điểm thứ ") .. nx_widestr(tostring(pos_current)), -1)
                if not is_moving() then
                    if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 0.5) then
                        tools_move(city, pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, true)
                    else
                        -- Đến điểm có cây gỗ thì chuyển sang bước 2
                        step = 2
                        num_cut = 0
                    end
                end
			-- Chờ cho cái cây gỗ nó ra rồi chặt
			elseif step == 2 then
				-- Nếu sai vị trí đứng thì quay về bước 1
                if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 0.5) then
					step = 1
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Sai vị trí đứng tìm đường trở lại"), -1)
				else
                    local game_scence_objs = game_scence:GetSceneObjList()
                    local num_objs = table.getn(game_scence_objs)
                    local wood_ident = false
                    
                    for i = 1, num_objs do
                        local cfg_text = util_text(nx_string(game_scence_objs[i]:QueryProp("ConfigID")))
                        local ident = game_scence_objs[i].Ident
                        if cfg_text == selected_text then
                            -- Nếu có nhiều thì lấy cái cục nào gần mình để hái được
                            local distance = tonumber(string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, game_scence_objs[i].PosiX, game_scence_objs[i].PosiY, game_scence_objs[i].PosiZ)))
                            if distance < 2 then
                                wood_ident = ident
                                break;
                            else
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Phát hiện đối tượng tuy nhiên quá xa"), -1)
                            end
                        end
                    end
                    
                    -- Chặt cây
                    if wood_ident ~= false then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Phát hiện có cây bắt đầu thu thập"), -1)

                        -- Nếu có cái form nhặt đồ thì nhặt rồi mới hái
                        local pickform = nx_value(PICK_FORM)
                        if nx_is_valid(pickform) and pickform.Visible then
                            tool_getPickForm()
                            num_cut = num_cut + 1
                        else
                            nx_execute("custom_sender", "custom_select", wood_ident)
                            nx_pause(0.2)
                            nx_execute("custom_sender", "custom_select", wood_ident)
                        end    
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ cây ra"), -1)
                    end
                    
                    -- Chặt hết cây
                    if wood_ident == false and num_cut ~= 0 then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đã đào, hái hết. Chuyển sang vị trí khác"), -1)
                        pos_current = pos_current + 1
                        if pos_current > pos_numbers then
                            pos_current = 1
                        end
                        step = 1
                        nx_pause(1)
                        -- Đến cuối cùng kiểm tra xem có cái form nhặt đồ không nếu có thì nhặt
                        local pickform = nx_value(PICK_FORM)
                        if nx_is_valid(pickform) and pickform.Visible then
                            tool_getPickForm()
                        end    
                    end
				end
			end
		end
		nx_pause(1)
	end
end

function control_this_form(form, ids)
	local map = get_current_map(true)
	form.lbl_2.Text = util_text(map)
	if ids == false then
		auto_is_running = false
		form.btn_control.Text = nx_widestr("...")
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
		return false
	end
	local combobox_ids = form.combobox_ids
	combobox_ids.DropListBox:ClearString()
	if combobox_ids.DroppedDown then
		combobox_ids.DroppedDown = false
	end
	for i = 1, table.getn(ids) do
		combobox_ids.DropListBox:AddString(util_text(ids[i]))
	end
	combobox_ids.Text = util_text(ids[1])
	form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Có thể thực hiện")
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_close(form)
	auto_is_running = false
	nx_destroy(form)
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_WOODCUT_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file dữ liệu, công cụ này không thể hoạt động được"))
        on_main_form_close(form)
        return 0
    end
    filedatacut = assert(loadfile(nx_work_path() .. DATA_WOODCUT_PATH))
    filedatacut()
	local ids = get_data()
	control_this_form(form, ids)
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

function on_btn_control_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if btn.Text == nx_widestr("...") then
		return 0
	end
	if auto_is_running then
		auto_is_running = false
		btn.Text = nx_function("ext_utf8_to_widestr", "Chạy")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run()
	end
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

function on_combobox_ids_selected(combobox)
end
