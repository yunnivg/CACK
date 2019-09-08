require("define\\request_type")
require("define\\team_rec_define")
require("util_functions")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_escort"
local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"
local auto_is_running = false

local DATA_ESCORT_PATH = "autodata\\data_escort.lua"
local filedataescort = nil

-- Sửa ở form_stage_main\\form_main\\form_main_request (Thêm 3 hàm để lấy request)

function auto_run(map, friend, mode, data, autodelmail, benefitFriends, MapConfigID)
	local escort_step = 1

    -- Tự xóa thư hệ thống
    if autodelmail == true then
        local form_lookup = nx_value("auto_tools\\tools_lookup")
        if not nx_is_valid(form_lookup) then
            util_auto_show_hide_form("auto_tools\\tools_lookup")
            nx_pause(0.01)
        end
        local form_lookup = nx_value("auto_tools\\tools_lookup")
        if nx_is_valid(form_lookup) and form_lookup.btn_control_delmail.Text ~= nx_function("ext_utf8_to_widestr", "Dừng") then
            nx_execute("auto_tools\\tools_lookup", "on_btn_control_delmail_click", form_lookup.btn_control_delmail)
        end
    end
    
	while auto_is_running == true do
		local is_vaild_data = true
		local game_client
		local game_visual
		local game_player
		local player_client
		local game_scence
		local form

		form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end
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

		if is_vaild_data == true then
            form.mltbox_content:Clear()
			-- Chấp nhận lời mời tổ đội
			local num_request = nx_execute(FORM_MAIN_REQUEST, "get_num_request")
			if num_request > 0 then
				for i = 1, num_request do
					local request_type = nx_execute(FORM_MAIN_REQUEST, "get_request_type", i)
					local request_player = nx_execute(FORM_MAIN_REQUEST, "get_request_player", i)
					if request_type == REQUESTTYPE_INVITETEAM and request_player == friend then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Có lời mời, vào đội"), -1)
						nx_execute("custom_sender", "custom_request_answer", request_type, request_player, 1)
						nx_execute(FORM_MAIN_REQUEST, "clear_request")
						nx_pause(1)
						break
					end
				end
			end
            -- Nếu bị chết thì trị thương lân cận, nếu đang là đội trưởng thì giải tán PT để bỏ vận tiêu
            if player_client:QueryProp("LogicState") == 120 then
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bị chết, trị thương lân cận và hủy vận tiêu"), -1)
                if player_client:QueryProp("Name") == player_client:QueryProp("TeamCaptain") then
                    nx_execute("custom_sender", "custom_team_destroy")
                    nx_pause(0.2)
                end
                nx_execute("custom_sender", "custom_relive", 2, 0)
                escort_step = 5
                nx_pause(20)
            end
			-- Bước 1: Chạy đến điểm nhận tiêu (Cả hai người cùng chạy tới)
			if escort_step == 1 then
				-- Người đứng yên thì không có bước 2 chỉ đứng chấp nhận lời mời tổ đội
				if mode ~= nx_function("ext_utf8_to_widestr", "Người đứng yên") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang di chuyển đến chỗ nhận tiêu"), -1)
                    if not is_moving() then
                        if not tools_move_isArrived(data.npcpos.x, data.npcpos.y, data.npcpos.z, 1) then
                            tools_move(map, data.npcpos.x, data.npcpos.y, data.npcpos.z, true)
                        else
                            -- Đến chỗ nhận tiêu thì chuyển sang bước 2
                            escort_step = 2
                        end
                    end
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đứng yên chờ bạn vận tiêu"), -1)
				end
			-- Bước 2: Xử lý nhóm
			elseif escort_step == 2 then
				-- Kiểm tra lại chỗ đứng nếu sai thì chuyển về bước 1
				if not tools_move_isArrived(data.npcpos.x, data.npcpos.y, data.npcpos.z, 1) then
					escort_step = 1
				else
					-- Nếu vận tiêu 1 mình
					if friend == nx_function("ext_utf8_to_widestr", "Vận tiêu một mình") then
                        if player_client:QueryProp("TeamID") ~= 0 and player_client:QueryProp("Name") ~= player_client:QueryProp("TeamCaptain") then
                            -- Nếu có đội mà không phải là đội trưởng thì mới rời đội
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Rời đội vì không phải là đội trưởng"), -1)
                            nx_execute("custom_sender", "custom_leave_team")
                        elseif player_client:QueryProp("TeamID") == 0 then
                            -- Tạo đội mới nếu không có đội
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Tạo đội mới"), -1)
                            nx_execute("custom_sender", "custom_team_create")
                        else
                            -- Có đội và là đội trưởng thì sẵn sàng vận tiêu
                            escort_step = 3
                        end
					-- Nếu vận tiêu với bạn
					else
						-- Nếu không có nhóm hoặc là đội trưởng và không có người đó trong team
                        -- Thì mời bạn vào vận tiêu
						if (player_client:QueryProp("TeamID") == 0 or player_client:QueryProp("Name") == player_client:QueryProp("TeamCaptain")) and find_player_in_team(friend) == -1 then
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Mời ") .. nx_widestr(friend) .. nx_function("ext_utf8_to_widestr", " vào đội"), -1)
							nx_execute("custom_sender", "custom_team_invite", friend)
							nx_pause(2.5)
						end
						-- Là đội trưởng và có bạn(đang online) trong nhóm thì vận tiêu
						if player_client:QueryProp("Name") == player_client:QueryProp("TeamCaptain") and find_player_in_team(friend) == 1 then
							escort_step = 3
                        else
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ bạn vận tiêu xong"), -1)
						end
					end
                    -- Sau khi tổ độ sẵn sàng rồi thì mời các bạn ké tiêu vào
                    if benefitFriends ~= nx_widestr("") and escort_step == 3 then
                        local isBenefitFriends = false
                        local arrBenefitFriends = util_split_wstring(benefitFriends, ",")
                        for i = 1, table.getn(arrBenefitFriends) do
                            local bfriend = nx_widestr(arrBenefitFriends[i])
                            if bfriend ~= nx_widestr("") and bfriend ~= nx_widestr(friend) and find_player_in_team(bfriend) == -1 then
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Mời ") .. nx_widestr(bfriend) .. nx_function("ext_utf8_to_widestr", " cùng vào"), -1)
                                nx_execute("custom_sender", "custom_team_invite", bfriend)
                                nx_pause(2)
                                isBenefitFriends = true
                            end
                        end
                        if isBenefitFriends then
                            nx_pause(2)
                        end
                    end
				end
			-- Bắt đầu nhận tiêu
			elseif escort_step == 3 then
				-- Kiểm tra lại địa điểm đang đứng
				if not tools_move_isArrived(data.npcpos.x, data.npcpos.y, data.npcpos.z, 1) then
					escort_step = 1
				else
                    -- Chờ có thằng NPC nhận tiêu mới bắt đầu thao tác
                    local escortNpcIsExists = false
                    local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        if nx_is_valid(obj) then
                            local visualObj = game_visual:GetSceneObj(obj.Ident)
                            if nx_is_valid(visualObj) then
                                if obj:QueryProp("Type") == 4 and obj:QueryProp("ConfigID") == data.npc.name then
                                    escortNpcIsExists = true
                                    break
                                end
                            end
                        end
                    end
                    if escortNpcIsExists then
                        local teamReady = true
                        -- Kiểm tra lại tổ đội
                        local rows = player_client:GetRecordRows("team_rec")
                        for i = 0, rows - 1 do
                            local MemIsOffline = player_client:QueryRecord("team_rec", i, TEAM_REC_COL_ISOFFLINE)
                            local MemScene = player_client:QueryRecord("team_rec", i, TEAM_REC_COL_SCENE)
                            local MemName = player_client:QueryRecord("team_rec", i, TEAM_REC_COL_NAME)
                            if nx_string(MapConfigID) ~= nx_string(MemScene) or nx_double(MemIsOffline) > nx_double(0) then
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đá ") .. nx_widestr(MemName) .. nx_function("ext_utf8_to_widestr", " ra khỏi team"), -1)
                                nx_execute("custom_sender", "custom_kickout_team", MemName)
                                teamReady = false
                                break
                            end
                        end
                        if teamReady then
                            -- Nếu chưa nhận tiêu thì bắt đầu nhận tiêu
                            if check_escort_is_valid(data.npc.id) == false then
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhận tiêu"), -1)
                                nx_execute("custom_sender", "custom_request_start_escort", data.npc.name, data.npc.id, 0)
                                nx_pause(2)
                            else
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Di chuyển đến gần xe tiêu"), -1)
                                -- Nếu đã nhận, di chuyển đến chỗ xe tiêu
                                if not tools_move_isArrived(data.escortpos.x, data.escortpos.y, data.escortpos.z, 1) then
                                    if not is_moving() then
                                        tools_move(map, data.escortpos.x, data.escortpos.y, data.escortpos.z, true)
                                    end
                                else
                                    escort_step = 4
                                end
                            end
                        end
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ load map để xuất hiện NPC"), -1)
                    end
				end
			elseif escort_step == 4 then
                -- Kiểm tra, lấy thông tin của cái xe tiêu
                local objCheck = check_escort_is_valid(data.npc.id)
                if objCheck == false or not nx_is_valid(objCheck) then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Không còn xe tiêu, kết thúc chuyến"), -1)
                    escort_step = 5
                else
                    -- Khi cái xe tiêu nó đứng thì tiến hành xử lý
                    if objCheck:QueryProp("State") ~= "walk" or objCheck:QueryProp("HPRatio") <= 0 then
                        local form_escort_path = "form_stage_main\\form_school_war\\form_escortnpc_control_list"
                        local form_escort = nx_value(form_escort_path)
                        local isControlNPC = false
                        if nx_is_valid(form_escort) and form_escort.Visible then
                            if form_escort.btn_stop.Visible == true and form_escort.btn_start.Visible == true then
                                -- Nhấp nút lên xe
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Ngồi lên xe tiêu"), -1)
                                nx_execute(form_escort_path, "on_btn_start_click", form_escort.btn_start)
                                isControlNPC = true
                                nx_pause(1)
                            elseif form_escort.btn_repair.Visible == true then
                                -- Sửa tiêu
                                if form_escort.btn_repair.Text == nx_widestr(util_text("ui_escort_caroperate_tingzhi")) then
                                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Cho xe tiêu dừng lại"), -1)
                                else
                                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang sửa tiêu"), -1)
                                end
                                nx_execute(form_escort_path, "on_btn_repair_click", form_escort.btn_repair)
                                isControlNPC = true
                                nx_pause(1)
                            elseif form_escort.btn_stop.Visible == true and form_escort.btn_stop.Text == nx_widestr(util_text("ui_escort_caroperate_tingzhi")) then
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Cho xe tiêu dừng lại"), -1)
                                nx_execute(form_escort_path, "on_btn_stop_click", form_escort.btn_stop)
                                nx_pause(0.5)
                            end
                        end
                        if not isControlNPC then
                            -- Nhấp chọn xe tiêu và chạy lại để mở bảng
                            local select_target_ident = player_client:QueryProp("LastObject")
                            local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                            if not nx_is_valid(select_target) or nx_string(select_target_ident) ~= nx_string(objCheck.Ident) then
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn xe tiêu"), -1)
                                nx_execute("custom_sender", "custom_select", nx_string(objCheck.Ident))
                            else
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Di chuyển lại điều khiển xe tiêu"), -1)
                                nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
                            end
                        end
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Xe tiêu đang di chuyển"), -1)
                    end
                end
                if not is_moving() then
                end
			elseif escort_step == 5 then
                -- Chuyển giao đội trưởng cho bạn vận nếu luân phiên nhau
                if mode == nx_function("ext_utf8_to_widestr", "Luân phiên nhau vận tiêu") and player_client:QueryProp("Name") == player_client:QueryProp("TeamCaptain") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Chuyển đội trưởng cho ") .. nx_widestr(friend), -1)
                    nx_execute("custom_sender", "custom_caption_change", friend)
                    nx_pause(1)
                end
                -- Bước này là đã hoàn tất và quay trở lại bước 1
                local form_escort_path = "form_stage_main\\form_school_war\\form_escortnpc_control_list"
                local form_escort = nx_value(form_escort_path)
                -- Tắt cái bảng điều khiển xe tiêu nếu vì lý do nào đó nó vẫn hiện
                if nx_is_valid(form_escort) then
                    nx_destroy(form_escort)
                    nx_pause(0.5)
                end
                escort_step = 1
			end
		end
		nx_pause(1)
	end
end

function reset_this_form(form)
	form.combobox_friends.DropListBox:ClearString()
	form.combobox_friends.Text = nx_widestr("")
	form.combobox_mode.DropListBox:ClearString()
	form.combobox_mode.Text = nx_widestr("")
	form.btn_control.Visible = false
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

function control_this_form(form)
	reset_this_form(form)
    
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_ESCORT_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file dữ liệu, công cụ này không thể hoạt động được"))
        on_main_form_close(form)
        return 0
    end
    filedataescort = assert(loadfile(nx_work_path() .. DATA_ESCORT_PATH))
    filedataescort()
    
	local map = get_current_map()
	form.lbl_2.Text = util_text(get_current_map(true))
	local data = get_escort_data(map)
	if data == false then
		auto_is_running = false
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
		return false
	end
	local game_client = nx_value("game_client")
	local player_client = game_client:GetPlayer()
	-- Xác định bang của người vận tiêu
	local self_guild = player_client:QueryProp("GuildName")
	if self_guild == "" or self_guild == nil or self_guild == 0 then
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Không có bang không thể vận tiêu"))
		return false
	end
	-- Viết danh sách bạn bè
	local combobox_friends = form.combobox_friends
	if combobox_friends.DroppedDown then
		combobox_friends.DroppedDown = false
	end
	local combobox_fbenefits = form.combobox_fbenefits
	if combobox_fbenefits.DroppedDown then
		combobox_fbenefits.DroppedDown = false
	end
	combobox_friends.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Vận tiêu một mình"))
    local arrayRecordName = {"rec_buddy", "rec_friend", "rec_attention"}
    local firstFriend = nx_widestr("")
    for j = 1, table.getn(arrayRecordName) do
        local RecordTable = arrayRecordName[j]
        local rows = player_client:GetRecordRows(RecordTable)
        for i = 0, rows - 1 do
            local player_name = player_client:QueryRecord(RecordTable, i, 1)
            local player_guild = player_client:QueryRecord(RecordTable, i, 6)
            local player_status = player_client:QueryRecord(RecordTable, i, 8)
            -- player_status == 0 => Online
            -- Chí hữu cùng bang và đang online
            if player_guild == self_guild then
                combobox_friends.DropListBox:AddString(player_name)
            end
            -- Chỉ cần cùng bang thì mời ké tiêu được
            if player_guild == self_guild then
                combobox_fbenefits.DropListBox:AddString(player_name)
                if firstFriend == nx_widestr("") then
                    firstFriend = nx_widestr(player_name)
                end
            end
        end
    end
	combobox_friends.Text = nx_function("ext_utf8_to_widestr", "Vận tiêu một mình")
	combobox_fbenefits.Text = firstFriend
	-- Viết kiểu vận
	local combobox_mode = form.combobox_mode
	if combobox_mode.DroppedDown then
		combobox_mode.DroppedDown = false
	end
	local escort_mode = {
		"Người chủ động vận",
		"Người đứng yên",
		"Luân phiên nhau vận tiêu"
	}
	for i = 1, table.getn(escort_mode) do
		combobox_mode.DropListBox:AddString(nx_function("ext_utf8_to_widestr", escort_mode[i]))
	end
	combobox_mode.Text = nx_function("ext_utf8_to_widestr", escort_mode[1])
	form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Có thể thực hiện")
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
	form.btn_control.Visible = true
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
	control_this_form(form)
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
	if auto_is_running then
		auto_is_running = false
		btn.Text = nx_function("ext_utf8_to_widestr", "Chạy")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		local map = get_current_map()
		local MapConfigID = get_current_map(true)
		auto_run(map, form.combobox_friends.Text, form.combobox_mode.Text, get_escort_data(map), form.cbtn_autodel_sysmail.Checked, form.ipt_fbenefits.Text, MapConfigID)
	end
end

function on_btn_fbenefits_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	local friendText = nx_widestr(form.ipt_fbenefits.Text)
    local friend = nx_widestr(form.combobox_fbenefits.Text)
    if friend ~= nx_widestr("") then
        if friendText == nx_widestr("") then
            friendText = friend
        else
            friendText = friendText .. nx_widestr(",") .. friend
        end
        form.ipt_fbenefits.Text = friendText
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

function on_combobox_mode_selected(combobox)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if auto_is_running == true then
        on_btn_control_click(form.btn_control)
    end
end

function on_combobox_friends_selected(combobox)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if auto_is_running == true then
        on_btn_control_click(form.btn_control)
    end
end

function on_combobox_fbenefits_selected(combobox)
end

function on_cbtn_autodel_sysmail_changed(cbtn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if auto_is_running == true then
        on_btn_control_click(form.btn_control)
    end
end

-- Tìm thành viên trong tổ đội, nếu có thì trả về trạng thái online(1)/offline(0) của thành viên đó
-- Nếu không có trả về -1
function find_player_in_team(player_name)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return -1
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return -1
    end
    local row = client_player:FindRecordRow("team_rec", TEAM_REC_COL_NAME, player_name)
    if row >= 0 then
        local ifoffline = client_player:QueryRecord("team_rec", row, TEAM_REC_COL_ISOFFLINE)
        if nx_double(ifoffline) > nx_double(0) then
            return 0
        else
            return 1
        end
    end
    return -1
end

-- Kiểm tra xem còn vận tiêu không
-- Nếu còn trả về thằng OBJ của xe tiêu, nếu không trả về false
function check_escort_is_valid(id)
    if get_buff_info("buff_yunbiao_escortbuff") == nil then
        return false
    end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local EscortNpc = "EscortNpc0" .. nx_string(id)
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                if obj:QueryProp("Type") == 4 and obj:QueryProp("ConfigID") == EscortNpc and obj:QueryProp("GoodsNum") > 0 and obj:QueryProp("EscortName") == client_player:QueryProp("Name") then
                    return obj
                end
            end
        end
    end
    return false
end
