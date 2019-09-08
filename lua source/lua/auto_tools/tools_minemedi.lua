require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_minemedi"
local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"
local auto_is_running = false

local DATA_MINEMEDI_PATH = "autodata\\data_minemedi.lua"
local filedataminemedi = nil

function auto_run()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        control_this_form(false)
        return false
    end

			local ids = get_data()
			local ads = get_data2()
			if ids == false then 
				control_this_form(ids, ads)
				return false
			end
    
			local selected_text = form.combobox_ids.Text
			local selected_text2 = form.combobox_ads.Text
			local pos = get_data_pos(selected_text, selected_text2)
			local city = get_current_map()
    
    if pos == false then
        control_this_form(false)
        return false
    end
    
    local step = 1
	local pos_current = 1
	local pos_numbers = 1
	local num_cut = 0
	local wait_for_pickform = false
	
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
                    if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 1) then
                        tools_move(city, pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, true)
                    else
                        -- Đến điểm có cây gỗ thì chuyển sang bước 2
                        step = 2
                        num_cut = 0
                    end
                end
			-- Chờ cho cây hoặc khoáng ra rồi hái, đào
			elseif step == 2 or step == 3 then
				-- Kiểm tra lại chỗ đứng
                if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 1) and step == 2 then
					step = 1
					form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Sai vị trí đứng tìm đường trở lại"), -1)
				else
                    local game_scence_objs = game_scence:GetSceneObjList()
                    local num_objs = table.getn(game_scence_objs)
                    local wood_ident = false
                    local objPos = {}
                    
                    for i = 1, num_objs do
                        local cfg_text = util_text(nx_string(game_scence_objs[i]:QueryProp("ConfigID")))
                        local ident = game_scence_objs[i].Ident
                        if cfg_text == selected_text then
                            objPos.x = game_scence_objs[i].PosiX
                            objPos.y = game_scence_objs[i].PosiY
                            objPos.z = game_scence_objs[i].PosiZ
                            wood_ident = ident
                            step = 3
                            break;
                        end
                    end
                    
                    -- Có khoáng hoặc cây
                    if wood_ident ~= false then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Phát hiện có khoáng, cây"), -1)
                        if not tools_move_isArrived(objPos.x, objPos.y, objPos.z, 0.5) then
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang di chuyển lại vị trí của đối tượng"), -1)
                            if not is_moving() then
                                tools_move(city, objPos.x, objPos.y, objPos.z, true)
                            end
                        else
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang thu thập"), -1)
                            
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
                        end
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đã đào, hái hết. Chuyển sang vị trí khác"), -1)
                        pos_current = pos_current + 1
                        if pos_current > pos_numbers then
                            pos_current = 1
                        end
                        step = 1
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
		nx_pause(0.25)
	end
end

function control_this_form(ids, ads)
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
	local map = get_current_map(true)
	form.lbl_2.Text = util_text(map)
	if ids == false then
		auto_is_running = false
		form.btn_control.Text = nx_widestr("...")
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "WTF WTF")
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
	local combobox_ads = form.combobox_ads
	combobox_ads.DropListBox:ClearString()
	if combobox_ads.DroppedDown then
		combobox_ads.DroppedDown = false
	end
	for i = 1, table.getn(ads) do
		combobox_ads.DropListBox:AddString(util_text(ads[i]))
	end
	combobox_ads.Text = util_text(ads[1])
	form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Able to múa")
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Cởi Quần")
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_MINEMEDI_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file dữ liệu, công cụ này không thể hoạt động được"))
        on_main_form_close(form)
        return 0
    end
    filedataminemedi = assert(loadfile(nx_work_path() .. DATA_MINEMEDI_PATH))
    filedataminemedi()
	local ids = get_data()
	local ads = get_data2()
	control_this_form(ids, ads)
end

function on_main_form_close(form)
	auto_is_running = false
	nx_destroy(form)
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
		btn.Text = nx_function("ext_utf8_to_widestr", "Cởi Quần")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Stop")
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
function on_combobox_ads_selected(combobox)
end