require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_hunter"
local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"

local auto_is_running = false

local DATA_HUNTER_PATH = "autodata\\data_hunter.lua"
local filedatahunter = nil

function auto_run()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        control_this_form(false)
        return false
    end
    -- Xác định danh sách các con thú trong MAP này
    local ids = get_data()
    if ids == false then 
        control_this_form(false)
        return false
    end
    
    -- Xác định MAP thực hiện
    local map = get_current_map()
    
    -- Xác định chi tiết các dữ liệu
    local selected_text = form.combobox_ids.Text
    local selectdata = get_detail_data(map, selected_text)
    
    if selectdata == false then
        control_this_form(false)
        return false
    end
    
    -- Vị trí trung tâm, vượt ra khỏi thì không tính
    local centerPOS = selectdata.centerPOS
    -- ID con thú 
    local objectConfigID = selectdata.objectConfigID
    -- Số lượt click vào xác con thú để nhặt đồ vì có con thú sẽ phải nhặt 1 lần, lột da 1 lần
    local numberGather = selectdata.numberGather
    -- Tính theo vòng tròn, vượt ra ngoài thì bỏ
    local maxAllowedDistance = selectdata.maxAllowedDistance
    -- Không quan tâm đến các OBJ này
    local lastArrayOBJ = {}
    local step = 1
    local currentObj = ""
    local currentGather = 0
    local lastStartPick = 0

    while auto_is_running == true do
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
        local game_scence
        local player_client
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
                is_vaild_data = false
            end
            player_client = game_client:GetPlayer()
            if not nx_is_valid(player_client) then
                is_vaild_data = false
            end
        end
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end

        -- Nếu dữ liệu ok hết
        if is_vaild_data == true then
            form.mltbox_content:Clear()
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "<font color=\"#EDC92A\">Vui lòng sắp skill xung phong vào ô skill thứ 2 để đánh con thú chuẩn xác nhất</font>"), -1)
            
            -- Duyệt bảng các con thú, nếu không còn nữa thì xóa khỏi bảng
            for i, v in ipairs(lastArrayOBJ) do
                local visualObj = game_visual:GetSceneObj(nx_string(v))
                if not nx_is_valid(visualObj) then
                    table.remove(lastArrayOBJ, i)
                end
            end
            
            if step == 1 then
                -- Bước 1 tìm thấy con thú sẽ giết
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Xác định con thú sẽ xử lý"), -1)
                if get_buff_info("buf_riding_01") ~= nil then
                    nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                end
                currentObj = ""
                -- Tìm con thú và chạy lại
                local game_scence_objs = game_scence:GetSceneObjList()
                for i = 1, table.getn(game_scence_objs) do
                    local obj = game_scence_objs[i]
                    if nx_is_valid(obj) then
                        local visualObj = game_visual:GetSceneObj(obj.Ident)
                        if nx_is_valid(visualObj) then
                            -- Xác định khoảng cách 3D
                            local pxd = centerPOS[1] - visualObj.PositionX
                            local pzd = centerPOS[3] - visualObj.PositionZ
                            local distance = math.sqrt(pxd * pxd + pzd * pzd)
                            if distance <= maxAllowedDistance and obj:QueryProp("ConfigID") == objectConfigID then
                                -- Con thú chưa chết hoặc con thú đã chết do mình giết và chưa lột da
                                if not in_array(obj.Ident, lastArrayOBJ) and (obj:QueryProp("Dead") == 0 or obj:QueryProp("PickMember") == player_client:QueryProp("Name")) then
                                    if obj:QueryProp("Dead") == 0 then
                                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Có con thú, đang chạy lại"), -1)
                                        nx_execute("custom_sender", "custom_select", obj.Ident)
                                        nx_pause(0.1)
                                        -- Đợi một lát sau đó kiểm tra từ server last obj
                                        local select_target_ident = player_client:QueryProp("LastObject")
                                        local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                        if nx_is_valid(select_target) and nx_string(obj.Ident) == nx_string(select_target_ident) then
                                            currentObj = obj.Ident
                                            nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
                                            step = 2
                                        end
                                    else
                                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Có xác con thú chưa lột da, tiến hành lột"), -1)
                                        currentObj = obj.Ident
                                        currentGather = 0
                                        lastStartPick = os.time()
                                        step = 3
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
                if currentObj == "" then
                    -- Không còn con thú nào nữa thì reset
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Không còn con thú nào, chờ nó reset"), -1)
                end
            elseif step == 2 then
                -- Khi dừng chạy thì kiểm tra xem cách con thú 3 mét thì quay lại bước 1
                -- LastObject không bằng con thú cũng quay bước 1
                local select_target_ident = player_client:QueryProp("LastObject")
                local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                if nx_is_valid(select_target) and nx_string(currentObj) == nx_string(select_target_ident) then
                    local visualObj = game_visual:GetSceneObj(nx_string(currentObj))
                    if nx_is_valid(visualObj) then
                        if tools_move_isArrived2D(visualObj.PositionX, visualObj.PositionY, visualObj.PositionZ, 3) then
                            -- Đến chỗ con thú thì đánh con thú
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đánh chết con thú"), -1)
                            killOBJ()
                            currentGather = 0
                            lastStartPick = os.time()
                            step = 3
                        else
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chạy lại chỗ con thú"), -1)
                            if not is_moving() then
                                -- Nếu dừng chạy mà chưa tới chỗ con thú thì quay lại bước 1
                                step = 1
                            end
                        end
                    else
                        step = 1
                    end
                else
                    step = 1
                end
            elseif step == 3 then
                if tools_difftime(lastStartPick) > 30 then
                    -- 20 giây mà không nhặt xong thì bỏ
                    table.insert(lastArrayOBJ, currentObj)
                    step = 1
                else
                    -- Nếu có con thú target mình
                    local animalTargetMe = isAnimalTargetMe(objectConfigID)
                    if animalTargetMe ~= false and nx_is_valid(animalTargetMe) then
                        -- Đợi con thú lại gần 2 mét và mình target vào nó thì xử trảm
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Ngưng lột da, chờ đánh con thú khác"), -1)
                        local select_target_ident = player_client:QueryProp("LastObject")
                        if nx_string(select_target_ident) == nx_string(animalTargetMe.Ident) and getDistanceBetweenMeAndAnimal(animalTargetMe) < 3 then
                            killOBJ()
                            nx_pause(0.2)
                        else
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ con thú cắn"), -1)
                            -- Nhấp chọn con thú, chủ động chạy lại chỗ nó 
                            if nx_string(select_target_ident) ~= nx_string(animalTargetMe.Ident) then
                                nx_execute("custom_sender", "custom_select", nx_string(animalTargetMe.Ident))
                            elseif not is_moving() then
                                nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
                            end
                        end
                    else
                        local visualObj = game_visual:GetSceneObj(nx_string(currentObj))
                        -- Kiểm tra lại xác con thú còn ở đó
                        if nx_is_valid(visualObj) then
                            local select_target_ident = player_client:QueryProp("LastObject")
                            if nx_string(select_target_ident) ~= nx_string(currentObj) then
                                -- Nếu đang target vào chỗ khác thì target lại xác con thú ban đầu
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Chọn lại mục tiêu"), -1)
                                nx_execute("custom_sender", "custom_select", nx_string(currentObj))
                            else
                                local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                if nx_is_valid(select_target) and nx_string(currentObj) == nx_string(select_target_ident) then
                                    local visualObj = game_visual:GetSceneObj(nx_string(currentObj))
                                    if nx_is_valid(visualObj) then
                                        if tools_move_isArrived2D(visualObj.PositionX, visualObj.PositionY, visualObj.PositionZ, 1.2) then
                                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang nhặt đồ - lột da"), -1)
                                            -- Chờ dừng di chuyển
                                            if not is_moving() then
                                                local pickform = nx_value(PICK_FORM)
                                                if nx_is_valid(pickform) and pickform.Visible then
                                                    tool_getPickForm()
                                                    currentGather = currentGather + 1
                                                else
                                                    nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
                                                    nx_pause(0.4)
                                                    if player_client:QueryProp("LogicState") == 1 then
                                                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bị đối tượng khác đánh, đánh lại"), -1)
                                                        killOBJ()
                                                    end
                                                end
                                                if currentGather >= numberGather then
                                                    table.insert(lastArrayOBJ, currentObj)
                                                    step = 1
                                                end
                                            end
                                        else
                                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Di chuyển lại chỗ xác con thú"), -1)
                                            if not is_moving() then
                                                -- Cách xa xác con thú 1.2 mét thì di chuyển lại
                                                local visualObj = game_visual:GetSceneObj(nx_string(currentObj))
                                                if nx_is_valid(visualObj) then
                                                    tools_move(game_scence:QueryProp("Resource"), visualObj.PositionX, visualObj.PositionY, visualObj.PositionZ, true)
                                                end
                                            end
                                        end
                                    else
                                        step = 1
                                    end
                                else
                                    step = 1
                                end
                            end
                        else
                            step = 1
                        end
                    end
                end
            end
        end
        
        nx_pause(0.2)
    end
end

function control_this_form(ids)
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
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

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_HUNTER_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file dữ liệu, công cụ này không thể hoạt động được"))
        on_main_form_close(form)
        return 0
    end
    filedatahunter = assert(loadfile(nx_work_path() .. DATA_HUNTER_PATH))
    filedatahunter()
	local ids = get_data()
	control_this_form(ids)
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

function killOBJ()
    local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
    local form_shortcut = nx_value(FORM_SHORTCUT_PATH)
    if nx_is_valid(form_shortcut) then
        local grid_shortcut = form_shortcut.grid_shortcut_main
        if nx_is_valid(grid_shortcut) then
            local game_shortcut = nx_value("GameShortcut")
            if nx_is_valid(game_shortcut) then
                game_shortcut:on_main_shortcut_useitem(grid_shortcut, 1, true)
            end
        end
    end
end

-- Xác định con thú target mình
function isAnimalTargetMe(cfgID)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                if obj:QueryProp("ConfigID") == cfgID and nx_string(obj:QueryProp("LastObject")) == nx_string(player_client.Ident) and obj:QueryProp("HPRatio") > 0 then
                    return obj
                end
            end
        end
    end
    return false
end

-- Xác định khoảng cách con thú với mình
function getDistanceBetweenMeAndAnimal(obj)
    if not nx_is_valid(obj) then
        return 9999
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return 9999
    end
    local visualObj = game_visual:GetSceneObj(obj.Ident)
    if not nx_is_valid(visualObj) then
        return 9999
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return 9999
    end
    local pxd = game_player.PositionX - visualObj.PositionX
    local pzd = game_player.PositionZ - visualObj.PositionZ
    local distance = math.sqrt(pxd * pxd + pzd * pzd)
    return distance
end
