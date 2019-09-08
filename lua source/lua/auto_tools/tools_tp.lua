require("const_define")
require("define\\sysinfo_define")
require("define\\request_type")
require("define\\object_type_define")
require("util_gui")
require("util_move") 
require("util_static_data")
require("util_functions")
require("share\\server_custom_define")
require("share\\chat_define")
require("auto_tools\\tool_libs")
require("share\\client_custom_define")
require("share\\view_define")
require("form_stage_main\\form_tvt\\define")
require("form_stage_main\\form_task\\task_define")

local THIS_FORM = "auto_tools\\tools_tp"
local WINEXEC_PATH = "autodata\\tools.exe"
--Set lệnh dừng
local auto_is_running_flycam = false
local auto_is_running_tn = false
local auto_is_running_flycam1 = false
--I wanna fly
on_flycam_control_click = function (btn)
	if findPathBusy then
	   tools_show_notice(nx_function("ext_utf8_to_widestr", "Người dùng khống chế dừng"), 2)
	   findPathBusy = false
	   return false
	end
	local isJumpToPost = false
	local form_map = nx_value("form_stage_main\\form_map\\form_map_scene")
    if nx_is_valid(form_map) and form_map.Visible then
        local btn_trace = form_map.btn_trace
        if nx_find_custom(btn_trace, "scene_id") and btn_trace.scene_id == get_current_map() and btn_trace.Visible then
            isJumpToPost = true
            local lastArrivePos = {btn_trace.x, btn_trace.y, btn_trace.z}
            -- Xác định tọa độ Y của điểm đến cuối cùng
            local walkHeight, maxHeight, waterHeight = getInfoHeightOfPos(lastArrivePos[1], lastArrivePos[3])
            lastArrivePos[2] = walkHeight
            if waterHeight == walkHeight then
                lastArrivePos[2] = lastArrivePos[2] + 5
            end
            
            -- Nếu đến rồi thì dừng
            findPathBusy = true
            while not tools_move_isArrived(lastArrivePos[1], lastArrivePos[2], lastArrivePos[3], 2) and findPathBusy do
                -- Tọa độ của nhân vật đang đứng
                local currentPos = get_current_player_pos()
                if currentPos == nil then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi dữ liệu"), 2)
                    findPathBusy = false
                    return false
                end
                local nextPos = nil
                
                -- Cách nhau 50 mét thì là điểm cuối
                if tools_move_isArrived(lastArrivePos[1], lastArrivePos[2], lastArrivePos[3], 50) then
                    nextPos = lastArrivePos
                else
                    -- Tìm ra điểm tiếp theo
                    -- Cách mỗi 10 mét lấy 1 điểm, tối đa 50 mét
                    -- Nếu tại điểm nào
                    
                    local currentDst = 10
                    local setPos = nil
                    local radian = getAngleForward(currentPos[1], currentPos[3], lastArrivePos[1], lastArrivePos[3])
                    local angle = radian_to_degree(radian)
                    while 1 do
                        local xx = currentPos[1]
                        local zz = currentPos[3]
                        -- Trước mặt
                        if angle <= 90 then
                            zz = zz + math.abs(math.sin(math.pi / 2 - radian) * currentDst)
                            xx = xx + math.abs(math.cos(math.pi / 2 - radian) * currentDst)
                        elseif angle > 90 and angle <= 180 then
                            zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx + math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        elseif angle > 180 and angle <= 270 then
                            zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        elseif angle > 270 then
                            zz = zz + math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        end
                        local posTmp = {xx, -10000, zz}
                        -- Xác định chiều cao của pos này
                        local walkHeight, maxHeight = getInfoHeightOfPos(posTmp[1], posTmp[3])
                        posTmp[2] = maxHeight + 18
                        -- Nếu không vượt quá nhân vật 50 mét thì lấy điểm đó
                        if tools_move_isArrived(posTmp[1], posTmp[2], posTmp[3], 50) then
                            setPos = posTmp
                        else
                            break
                        end
                        currentDst = currentDst + 18
                        if currentDst > 50 then
                            break
                        end
                    end
                    if setPos == nil then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Địa hình này không thể di chuyển giữa hai điểm, thử chọn điểm đến khác"), 2)
                        findPathBusy = false
                        return false
                    end
                    nextPos = setPos
                end
                if nextPos ~= nil then
                    jump_to(nextPos, 50, 3)
                end
                nx_pause(0.0001)
            end
            
            findPathBusy = false
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đến nơi"))
        end
    end
end
-- i wanna fly
on_flycam_control_click1 = function (btn)
	if findPathBusy then
	   tools_show_notice(nx_function("ext_utf8_to_widestr", "Người dùng khống chế dừng"), 2)
	   findPathBusy = false
	   return false
	end
	local isJumpToPost = false
	local form_map = nx_value("form_stage_main\\form_map\\form_map_scene")
    if nx_is_valid(form_map) and form_map.Visible then
        local btn_trace = form_map.btn_trace
        if nx_find_custom(btn_trace, "scene_id") and btn_trace.scene_id == get_current_map() and btn_trace.Visible then
            isJumpToPost = true
            local lastArrivePos = {btn_trace.x, btn_trace.y, btn_trace.z}
            -- Xác định tọa độ Y của điểm đến cuối cùng
            local walkHeight, maxHeight, waterHeight = getInfoHeightOfPos(lastArrivePos[1], lastArrivePos[3])
            lastArrivePos[2] = walkHeight
            if waterHeight == walkHeight then
                lastArrivePos[2] = lastArrivePos[2] + 5
            end
            
            -- Nếu đến rồi thì dừng
            findPathBusy = true
            while not tools_move_isArrived(lastArrivePos[1], lastArrivePos[2], lastArrivePos[3], 2) and findPathBusy do
                -- Tọa độ của nhân vật đang đứng
                local currentPos = get_current_player_pos()
                if currentPos == nil then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi dữ liệu"), 2)
                    findPathBusy = false
                    return false
                end
                local nextPos = nil
                
                -- Cách nhau 50 mét thì là điểm cuối
                if tools_move_isArrived(lastArrivePos[1], lastArrivePos[2], lastArrivePos[3], 50) then
                    nextPos = lastArrivePos
                else
                    -- Tìm ra điểm tiếp theo
                    -- Cách mỗi 10 mét lấy 1 điểm, tối đa 50 mét
                    -- Nếu tại điểm nào
                    
                    local currentDst = 10
                    local setPos = nil
                    local radian = getAngleForward(currentPos[1], currentPos[3], lastArrivePos[1], lastArrivePos[3])
                    local angle = radian_to_degree(radian)
                    while 1 do
                        local xx = currentPos[1]
                        local zz = currentPos[3]
                        -- Trước mặt
                        if angle <= 90 then
                            zz = zz + math.abs(math.sin(math.pi / 2 - radian) * currentDst)
                            xx = xx + math.abs(math.cos(math.pi / 2 - radian) * currentDst)
                        elseif angle > 90 and angle <= 180 then
                            zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx + math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        elseif angle > 180 and angle <= 270 then
                            zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        elseif angle > 270 then
                            zz = zz + math.abs(math.sin(math.pi * 3 / 2 - radian) * currentDst)
                            xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * currentDst)
                        end
                        local posTmp = {xx, -10000, zz}
                        -- Xác định chiều cao của pos này
                        local walkHeight, maxHeight = getInfoHeightOfPos(posTmp[1], posTmp[3])
                        posTmp[2] = maxHeight + 8
                        -- Nếu không vượt quá nhân vật 50 mét thì lấy điểm đó
                        if tools_move_isArrived(posTmp[1], posTmp[2], posTmp[3], 50) then
                            setPos = posTmp
                        else
                            break
                        end
                        currentDst = currentDst + 8
                        if currentDst > 50 then
                            break
                        end
                    end
                    if setPos == nil then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Địa hình này không thể di chuyển giữa hai điểm, thử chọn điểm đến khác"), 2)
                        findPathBusy = false
                        return false
                    end
                    nextPos = setPos
                end
                if nextPos ~= nil then
                    jump_to(nextPos, 50, 3)
                end
                nx_pause(0.0001)
            end
            
            findPathBusy = false
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đến nơi"))
        end
    end
end
-- thu nghiep
auto_run_tn = function()
    while auto_is_running_tn == true do
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
            nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
			nx_pause(10)
			nx_execute("form_stage_main\\form_talk_movie", "menu_select", 898000025) 
        end
        nx_pause(1)
    end
end

on_tn_control_click = function(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if btn.Text == nx_widestr("...") then
		return 0
	end
	if auto_is_running_tn then
		auto_is_running_tn = false
		btn.Text = nx_function("ext_utf8_to_widestr", "Tiếp")
	else
		auto_is_running_tn = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_tn()
	end
end
--Open close form
on_form_main_init = function(form)
    form.Fixed = false
    form.is_minimize = false
end
on_main_form_open = function(form)
    change_form_size()
    form.is_minimize = false
end
on_main_form_close = function(form)
	auto_is_running_flycam = false
	auto_is_running_flycam1 = false
	auto_is_running_tn = false
    nx_destroy(form)
end
on_btn_close_click = function(btn)
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return
    end
    on_main_form_close(form)
end
change_form_size = function()
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



