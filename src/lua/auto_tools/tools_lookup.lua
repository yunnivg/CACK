require("const_define")
require("define\\sysinfo_define")
require("define\\request_type")
require("define\\object_type_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_static_data")
require("util_functions")
require("share\\server_custom_define")
require("share\\chat_define")
require("auto_tools\\tool_libs")
require("share\\client_custom_define")
require("share\\view_define")
require("form_stage_main\\form_tvt\\define")
require("form_stage_main\\form_task\\task_define")

local THIS_FORM = "auto_tools\\tools_lookup"
local WINEXEC_PATH = "autodata\\tools.exe"

local auto_is_running = false -- Quét cóc
local auto_is_running_rsabduct = false -- Quét, thổi cóc
local auto_is_running_khd = false -- Phát hiện rương KHD
local auto_is_running_player = false -- Quét người chơi
local auto_is_running_offfree = false -- Auto giải cứu cóc
local auto_is_running_trace = false -- Auto đi theo đối tượng
local auto_is_running_attack = false -- Auto đánh
local auto_is_running_hgbc = false -- Auto Q Hoàng Gia Bí Cảnh
local auto_is_running_dddh = false -- Auto Q Dao Đài Đếm Hoa
local auto_is_running_ntlm = false -- Auto Q Nhanh Tay Lẹ Mắt
local auto_is_running_delmail = false -- Auto xóa thư hệ thống
local auto_is_running_catchabduct = false -- Thổi cóc, nhặt cóc và nháy màn hình
local auto_is_running_noterequest = false -- Thông báo có Request
local auto_is_running_acceptrequest = false -- Chấp nhận request
local auto_is_running_spy = false -- Auto do thám
local auto_is_running_vptd = false -- Auto Q vụ phong tầm hiệp
local auto_is_running_capbird = false -- Auto Q bắt chim nội 5

----------------------------------------------------
-- Phát hiện cóc RS, chat cóc, thổi cóc
function auto_run_rsabduct()
    local max_distance_selectauto = 6
    local last_table_coc = {}
    local sound_before = nil -- Am thanh truoc
    local volume_before = nil -- Am luong truoc
    local used_abduct_item = false
	
    -- Xac dinh cau hinh am thanh ban dau
	if sound_before == nil then
		local game_config = nx_value("game_config")
		sound_before = game_config.music_enable
		volume_before = game_config.music_volume
	end

    while auto_is_running_rsabduct == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
                is_vaild_data = false
            end
        end
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end
        
        -- Nếu dữ liệu ok hết
        if is_vaild_data == true then
            local game_scence_objs = game_scence:GetSceneObjList()
            local select_object = 0
            local trigger_music = false
            local current_table_coc = {}
            form.mltbox_content:Clear()
            
            for i = 1, table.getn(game_scence_objs) do
                local obj_type = 0
                if game_scence_objs[i]:FindProp("Type") then
                    obj_type = game_scence_objs[i]:QueryProp("Type")
                end
                local distance = string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, game_scence_objs[i].PosiX, game_scence_objs[i].PosiY, game_scence_objs[i].PosiZ))
                
                if obj_type == 4 and game_scence_objs[i]:QueryProp("ConfigID") == "OffAbductNpc_0" and used_abduct_item and tonumber(distance) <= max_distance_selectauto then --- NPC
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(10)
                    used_abduct_item = false
                    break
                elseif obj_type == 2 and game_scence_objs[i]:QueryProp("OffLineState") == 1 and not game_scence_objs[i]:FindProp("OfflineTypeTvT") then
                    local coc_name = game_scence_objs[i]:QueryProp("Name")
                    local coc_ident = game_scence_objs[i]:QueryProp("Ident")
                    local coc_posX = string.format("%.0f", game_scence_objs[i].PosiX)
                    local coc_posZ = string.format("%.0f", game_scence_objs[i].PosiZ)
                    
                    local pathX = game_scence_objs[i].DestX
                    local pathY = game_scence_objs[i].DestY
                    local pathZ = game_scence_objs[i].DestZ
                    
                    if game_scence_objs[i]:QueryProp("IsAbducted") == 0 then
                        if tonumber(distance) <= max_distance_selectauto then
                            select_object = i
                        end
                        
                        table.insert(current_table_coc, coc_name)
                        
                        if not in_array(coc_name, last_table_coc) then
                            trigger_music = true
                            -- Chat hệ thống thông số cóc
                            local text = nx_function("ext_utf8_to_widestr", "Tên:")
                            text = text .. nx_widestr(coc_name)
                            text = text .. nx_function("ext_utf8_to_widestr", " - Tọa độ:<a href=\"findpath,")
                            text = text .. nx_widestr(get_current_map())
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(pathX)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(pathY)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(pathZ)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(coc_ident)
                            text = text .. nx_widestr("\" style=\"HLStype1\">")
                            text = text .. nx_widestr(coc_posX)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(coc_posZ)
                            text = text .. nx_widestr("</a>")
                            nx_value("form_main_chat"):AddChatInfoEx(text, CHATTYPE_SYSTEM, false)
                        end
                    end
                    
                    -- Ghi lên hệ thống
					if game_scence_objs[i]:QueryProp("IsAbducted") == 1 then
						for j = 1, 20 do
			                if game_scence_objs[i]:FindProp(nx_string("BufferInfo") .. nx_string(j)) and nx_string(util_split_string(game_scence_objs[i]:QueryProp(nx_string("BufferInfo") .. nx_string(j)), ",")[1]) == "buf_abducted" then
			                    local MessageDelay = nx_value("MessageDelay")
			                    if not nx_is_valid(MessageDelay) then
			                      return 0
			                    end
			                    local buff_info = util_split_string(game_scence_objs[i]:QueryProp(nx_string("BufferInfo") .. nx_string(j)), ",")
			                    local buff_time = buff_info[4]

								local server_now_time = MessageDelay:GetServerNowTime()
								local buff_diff_time = nx_int((buff_time - server_now_time) / 1000) -- Unit timesamp
								local buff_remain_h = nx_int(buff_diff_time / 3600) -- Giờ
								local buff_remain_m = nx_int((buff_diff_time - (buff_remain_h * 3600)) / 60) -- Phút
								local buff_remain_s = nx_int(buff_diff_time - (buff_remain_h * 3600) - (buff_remain_m * 60)) -- Giây

                                local text = nx_widestr(coc_name)
                                text = text .. nx_widestr(" (<a href=\"findpath,")
                                text = text .. nx_widestr(get_current_map())
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathX)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathY)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathZ)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(coc_ident)
                                text = text .. nx_widestr("\" style=\"HLStype1\">")
                                text = text .. nx_widestr(coc_posX)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(coc_posZ)
                                text = text .. nx_widestr("</a>) ")
                                text = text .. nx_widestr(buff_remain_h)
                                text = text .. nx_widestr(":")
                                text = text .. nx_widestr(buff_remain_m)
                                text = text .. nx_widestr(":")
                                text = text .. nx_widestr(buff_remain_s)
								form.mltbox_content:AddHtmlText(text, -1)
								break
			                end
			            end
					else
                        local text = nx_widestr("<font color=\"#B71D41\">")
                        text = text .. nx_widestr(coc_name)
                        text = text .. nx_widestr("</font> (<a href=\"findpath,")
                        text = text .. nx_widestr(get_current_map())
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathX)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathY)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathZ)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(coc_ident)
                        text = text .. nx_widestr("\" style=\"HLStype1\">")
                        text = text .. nx_widestr(coc_posX)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(coc_posZ)
                        text = text .. nx_widestr("</a>)")
						form.mltbox_content:AddHtmlText(text, -1)
					end
                end
            end
            
            last_table_coc = current_table_coc
            
            if select_object ~= 0 then
                nx_execute("custom_sender", "custom_select", game_scence_objs[select_object].Ident)
                local form_bag = nx_value("form_stage_main\\form_bag")
                if nx_is_valid(form_bag) then
                    form_bag.rbtn_tool.Checked = true
                end
                nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "offitem_miyao10")
                used_abduct_item = true
            end
            
            if trigger_music then
                local timer = nx_value(GAME_TIMER)
                if nx_is_valid(timer) then
                    timer:UnRegister(nx_current(), "tools_resume_scene_music", nx_value("game_config"))
                end
                nx_function("ext_flash_window")
                tools_play_sound()
            end
        end
        
        -- Dừng một lát trước khi chạy lại
        nx_pause(0.3)
    end
end

--------------------------
-- boxnpc_khd_bx001 -> boxnpc_khd_bx012
function auto_run_khd()
    while auto_is_running_khd == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
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
            local game_scence_objs = game_scence:GetSceneObjList()
            
            for i = 1, table.getn(game_scence_objs) do
                local obj_cfgprefix = string.sub(nx_string(game_scence_objs[i]:QueryProp("ConfigID")), 0, 13)
                
                if obj_cfgprefix == "boxnpc_khd_bx" then
                    local box_name = util_text(game_scence_objs[i]:QueryProp("ConfigID"))
                    local box_ident = game_scence_objs[i]:QueryProp("Ident")
                    local box_posX = string.format("%.0f", game_scence_objs[i].PosiX)
                    local box_posZ = string.format("%.0f", game_scence_objs[i].PosiZ)
                    
                    local pathX = game_scence_objs[i].DestX
                    local pathY = game_scence_objs[i].DestY
                    local pathZ = game_scence_objs[i].DestZ
                    
                    local textchat = box_name
                    textchat = textchat .. nx_widestr(" : <a href=\"findpath,")
                    textchat = textchat .. nx_widestr(get_current_map())
                    textchat = textchat .. nx_widestr(",")
                    textchat = textchat .. nx_widestr(pathX)
                    textchat = textchat .. nx_widestr(",")
                    textchat = textchat .. nx_widestr(pathY)
                    textchat = textchat .. nx_widestr(",")
                    textchat = textchat .. nx_widestr(pathZ)
                    textchat = textchat .. nx_widestr(",")
                    textchat = textchat .. nx_widestr(box_ident)
                    textchat = textchat .. nx_widestr("\" style=\"HLStype1\">")
                    textchat = textchat .. nx_widestr(box_posX)
                    textchat = textchat .. nx_widestr(",")
                    textchat = textchat .. nx_widestr(box_posZ)
                    textchat = textchat .. nx_widestr("</a>")
                    
                    form.mltbox_content:AddHtmlText(textchat, -1)
                end
            end
        end
        
        nx_pause(2)
    end
end

-----------------------------------------
-- Quét cóc
function auto_run()
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
			local game_scence_objs = game_scence:GetSceneObjList()
		    local num_objs = table.getn(game_scence_objs)
			form.mltbox_content:Clear()
		    for i = 1, num_objs do
		        local obj_type = 0
		        if game_scence_objs[i]:FindProp("Type") then
		            obj_type = game_scence_objs[i]:QueryProp("Type")
		        end
		        if obj_type == 2 and game_scence_objs[i]:QueryProp("OffLineState") == 1 and not game_scence_objs[i]:FindProp("OfflineTypeTvT") then
					local coc_name = game_scence_objs[i]:QueryProp("Name")
					local coc_ident = game_scence_objs[i]:QueryProp("Ident")
					local coc_posX = string.format("%.0f", game_scence_objs[i].PosiX)
					local coc_posZ = string.format("%.0f", game_scence_objs[i].PosiZ)

					local pathX = game_scence_objs[i].DestX
					local pathY = game_scence_objs[i].DestY
					local pathZ = game_scence_objs[i].DestZ

					if game_scence_objs[i]:QueryProp("IsAbducted") == 1 then
						for j = 1, 20 do
			                if game_scence_objs[i]:FindProp(nx_string("BufferInfo") .. nx_string(j)) and nx_string(util_split_string(game_scence_objs[i]:QueryProp(nx_string("BufferInfo") .. nx_string(j)), ",")[1]) == "buf_abducted" then
			                    local MessageDelay = nx_value("MessageDelay")
			                    if not nx_is_valid(MessageDelay) then
			                      return 0
			                    end
			                    local buff_info = util_split_string(game_scence_objs[i]:QueryProp(nx_string("BufferInfo") .. nx_string(j)), ",")
			                    local buff_time = buff_info[4]

								local server_now_time = MessageDelay:GetServerNowTime()
								local buff_diff_time = nx_int((buff_time - server_now_time) / 1000) -- Unit timesamp
								local buff_remain_h = nx_int(buff_diff_time / 3600) -- Giờ
								local buff_remain_m = nx_int((buff_diff_time - (buff_remain_h * 3600)) / 60) -- Phút
								local buff_remain_s = nx_int(buff_diff_time - (buff_remain_h * 3600) - (buff_remain_m * 60)) -- Giây

                                local text = nx_widestr(coc_name)
                                text = text .. nx_widestr(" (<a href=\"findpath,")
                                text = text .. nx_widestr(get_current_map())
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathX)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathY)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(pathZ)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(coc_ident)
                                text = text .. nx_widestr("\" style=\"HLStype1\">")
                                text = text .. nx_widestr(coc_posX)
                                text = text .. nx_widestr(",")
                                text = text .. nx_widestr(coc_posZ)
                                text = text .. nx_widestr("</a>) ")
                                text = text .. nx_widestr(buff_remain_h)
                                text = text .. nx_widestr(":")
                                text = text .. nx_widestr(buff_remain_m)
                                text = text .. nx_widestr(":")
                                text = text .. nx_widestr(buff_remain_s)
								form.mltbox_content:AddHtmlText(text, -1)
								break
			                end
			            end
					else
                        local text = nx_widestr("<font color=\"#B71D41\">")
                        text = text .. nx_widestr(coc_name)
                        text = text .. nx_widestr("</font> (<a href=\"findpath,")
                        text = text .. nx_widestr(get_current_map())
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathX)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathY)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(pathZ)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(coc_ident)
                        text = text .. nx_widestr("\" style=\"HLStype1\">")
                        text = text .. nx_widestr(coc_posX)
                        text = text .. nx_widestr(",")
                        text = text .. nx_widestr(coc_posZ)
                        text = text .. nx_widestr("</a>)")
						form.mltbox_content:AddHtmlText(text, -1)
					end
		        end
		    end
		end
		nx_pause(1)
	end
end

function auto_run_buff()
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
    local gui = nx_value("gui")
    if not nx_is_valid(gui) then
        is_vaild_data = false
    end

    if is_vaild_data == true then
        form.mltbox_content:Clear()
        -- Xóa cái group nếu tồn tại
        local custom_groupbox = form:Find("groupbox_buff")
        if nx_is_valid(custom_groupbox) then
            form:Remove(custom_groupbox)
        end
        local groupbox_compose = gui:Create("GroupBox")

        form:Add(groupbox_compose)

        groupbox_compose.Name = "groupbox_buff"
        groupbox_compose.BackColor = "0,0,0,0"
        groupbox_compose.DrawMode = "ExpandV"
        groupbox_compose.Left = 230
        groupbox_compose.Top = 40
        groupbox_compose.Width = 320
        groupbox_compose.Height = 360
        groupbox_compose.curindex = nil
        groupbox_compose.selected = nil
        groupbox_compose.BackImage = "gui\\common\\form_line\\mibox_1.png"

        local groupbox_buff_list = gui:Create("GroupScrollableBox")

        groupbox_compose:Add(groupbox_buff_list)

        groupbox_buff_list.Name = "groupbox_buff_list"
        groupbox_buff_list.BackColor = "0,0,0,0"
        groupbox_buff_list.DrawMode = "FitWindow"
        groupbox_buff_list.NoFrame = true
        groupbox_buff_list.Left = 0
        groupbox_buff_list.Top = 0
        groupbox_buff_list.Width = 320
        groupbox_buff_list.Height = 360
        groupbox_buff_list:DeleteAll()

        local group_top = 0

        local select_target_ident = player_client:QueryProp("LastObject")
        local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
        if not nx_is_valid(select_target) then
            select_target = player_client
        end
        if nx_is_valid(select_target) then
            for j = 1, 25 do
                local buff = select_target:QueryProp("BufferInfo" .. tostring(j))
                if buff ~= 0 then
                    local buff_info = util_split_string(buff, ",")
                    local buff_name = nx_string(buff_info[1])
                    if buff_name ~= nil and buff_name ~= nx_string("") and buff_name ~= nx_string("nil") then
                        local photo_path = buff_static_query(buff_name, "Photo")
                    
                        local groupbox = gui:Create("GroupBox")
                        groupbox_buff_list:Add(groupbox)
                        groupbox.AutoSize = false
                        groupbox.Name = "groupbox_buff_item_" .. j
                        groupbox.BackColor = "0,0,0,0"
                        groupbox.DrawMode = "FitWindow"
                        groupbox.BackImage = "gui\\common\\form_back\\bg_menu.png"
                        groupbox.NoFrame = true
                        groupbox.Left = 0
                        groupbox.Top = group_top
                        groupbox.Width = 305
                        groupbox.Height = 55
                        groupbox.index = j
                        
                        local imagegrid = gui:Create("ImageControlGrid")
                        groupbox:Add(imagegrid)
                        imagegrid.AutoSize = false
                        imagegrid.Name = "groupbox_buff_item_" .. j .. "_photo"
                        imagegrid.DrawGridBack = "gui\\common\\imagegrid\\icon_item2.png"
                        imagegrid.DrawMode = "Expand"
                        imagegrid.NoFrame = true
                        imagegrid.HasVScroll = false
                        imagegrid.Width = 39
                        imagegrid.Height = 39
                        imagegrid.Left = 15
                        imagegrid.Top = 10
                        imagegrid.RowNum = 1
                        imagegrid.ClomnNum = 1
                        imagegrid.GridWidth = 36
                        imagegrid.GridHeight = 36
                        imagegrid.RoundGrid = false
                        imagegrid.GridBackOffsetX = -4
                        imagegrid.GridBackOffsetY = -3
                        imagegrid.DrawMouseIn = "xuanzekuang"
                        imagegrid.BackColor = "0,0,0,0"
                        imagegrid.SelectColor = "0,0,0,0"
                        imagegrid.MouseInColor = "0,0,0,0"
                        imagegrid.CoverColor = "0,0,0,0"
                        nx_bind_script(imagegrid, nx_current())
                        nx_callback(imagegrid, "on_mousein_grid", "on_buff_imagegrid_mousein_grid")
                        nx_callback(imagegrid, "on_mouseout_grid", "on_buff_imagegrid_mouseout_grid")
                        imagegrid.HasMultiTextBox = true
                        imagegrid.MultiTextBoxCount = 2
                        imagegrid.MultiTextBox1.NoFrame = true
                        imagegrid.MultiTextBox1.Width = 200
                        imagegrid.MultiTextBox1.Height = 58
                        imagegrid.MultiTextBox1.LineHeight = 20
                        imagegrid.MultiTextBox1.ViewRect = "0,0,200,58"
                        imagegrid.MultiTextBox1.TextColor = "255,255,255,255"
                        imagegrid.Font = "FZHKJT20"
                        imagegrid.MultiTextBoxPos = "60,-4"
                        imagegrid.ViewRect = "0,0,67,67"
                        imagegrid:AddItem(0, photo_path, "", 1, -1)
                        imagegrid:SetItemAddInfo(nx_int(0), nx_int(1), nx_widestr(buff_name))

                        -- Hiển thị buff name
                        local buff_name_text = util_text(buff_name)
                        if buff_name_text == nx_widestr("") or buff_name_text == nx_widestr("<s>") or buff_name_text == nx_widestr(buff_name) then
                            buff_name_text = nx_function("ext_utf8_to_widestr", "Buff chưa có tên")
                        end
                        local lbl_buff_name = gui:Create("Label")
                        groupbox:Add(lbl_buff_name)
                        lbl_buff_name.Left = 60
                        lbl_buff_name.Top = 10
                        if nx_is_valid(lbl_buff_name) then
                            local show_name = nx_widestr(buff_name_text)
                            if nx_ws_length(show_name) > 40 then
                                lbl_buff_name.HintText = nx_widestr(buff_name_text)
                                lbl_buff_name.Transparent = false
                                lbl_buff_name.ClickEvent = false
                                show_name = nx_function("ext_ws_substr", show_name, 0, 40) .. nx_widestr("...")
                            else
                                lbl_buff_name.HintText = nx_widestr("")
                            end
                            lbl_buff_name.Text = show_name
                        end
                        lbl_buff_name.ForeColor = "255,255,195,0"
                        lbl_buff_name.Font = "font_treeview"
                        lbl_buff_name.ShadowColor = "0,255,255,255"
                        
                        -- Hiển thị thời gian buff
                        local MessageDelay = nx_value("MessageDelay")
                        if not nx_is_valid(MessageDelay) then
                            return 0
                        end
                        local buff_time = buff_info[4]
                        local server_now_time = MessageDelay:GetServerNowTime()
                        local buff_diff_time = nx_int((buff_time - server_now_time) / 1000) -- Unit timesamp
                        local buff_remain_h = nx_int(buff_diff_time / 3600) -- Giờ
                        local buff_remain_m = nx_int((buff_diff_time - (buff_remain_h * 3600)) / 60) -- Phút
                        local buff_remain_s = nx_int(buff_diff_time - (buff_remain_h * 3600) - (buff_remain_m * 60)) -- Giây

                        local buff_time_text = nx_function("ext_utf8_to_widestr", "Còn lại: ")
                        
                        if tonumber(buff_time) > 0 then
                            buff_time_text = buff_time_text .. nx_widestr(nx_string(buff_remain_h)) .. nx_widestr(":")
                            buff_time_text = buff_time_text .. nx_widestr(nx_string(buff_remain_m)) .. nx_widestr(":")
                            buff_time_text = buff_time_text .. nx_widestr(nx_string(buff_remain_s))
                        else
                            buff_time_text = buff_time_text .. nx_function("ext_utf8_to_widestr", "Không")
                        end
                        
                        local lbl_buff_time = gui:Create("Label")
                        groupbox:Add(lbl_buff_time)
                        lbl_buff_time.Left = 60
                        lbl_buff_time.Top = 30
                        lbl_buff_time.Text = buff_time_text
                        lbl_buff_time.ForeColor = "255,255,240,191"
                        lbl_buff_time.Font = "font_treeview"
                        lbl_buff_time.ShadowColor = "0,255,255,255"
                        
                        -- Hiển thị xếp chồng buff
                        local buff_count = buff_info[5]
                        local buff_count_info = util_split_string(buff_count, "|")
                        local buff_count_text = nx_function("ext_utf8_to_widestr", "Xếp chồng: ")
                        
                        if buff_count_info ~= nil then
                            buff_count_info = buff_count_info[1]
                            if buff_count_info ~= nil and tonumber(buff_count_info) > 0 then
                                buff_count_text = buff_count_text .. nx_widestr(tostring(buff_count_info))
                            else
                                buff_count_text = buff_count_text .. nx_function("ext_utf8_to_widestr", "Không")
                            end
                        end
                        
                        local lbl_buff_count = gui:Create("Label")
                        groupbox:Add(lbl_buff_count)
                        lbl_buff_count.Left = 160
                        lbl_buff_count.Top = 30
                        lbl_buff_count.Text = buff_count_text
                        lbl_buff_count.ForeColor = "255,255,240,191"
                        lbl_buff_count.Font = "font_treeview"
                        lbl_buff_count.ShadowColor = "0,255,255,255"
                        
                        group_top = group_top + 55
                    end
                end
            end
        else
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Hãy nhấp chọn đối tượng cần soi buff trước"))
        end

        groupbox_buff_list.IsEditMode = false
        groupbox_buff_list.HasVScroll = true
        groupbox_buff_list.ScrollSize = 15
        groupbox_buff_list.AlwaysVScroll = true
        groupbox_buff_list.VScrollBar.Value = 0--groupbox_buff_list.VScrollBar.Maximum
        groupbox_buff_list.VScrollBar.BackImage = "gui\\common\\scrollbar\\bg_scrollbar2.png"
        groupbox_buff_list.VScrollBar.DrawMode = "Expand"
        groupbox_buff_list.VScrollBar.DecButton.NormalImage = "gui\\common\\scrollbar\\button_2\\btn_up_out.png"
        groupbox_buff_list.VScrollBar.DecButton.FocusImage = "gui\\common\\scrollbar\\button_2\\btn_up_on.png"
        groupbox_buff_list.VScrollBar.DecButton.PushImage = "gui\\common\\scrollbar\\button_2\\btn_up_down.png"
        groupbox_buff_list.VScrollBar.IncButton.NormalImage = "gui\\common\\scrollbar\\button_2\\btn_down_out.png"
        groupbox_buff_list.VScrollBar.IncButton.FocusImage = "gui\\common\\scrollbar\\button_2\\btn_down_on.png"
        groupbox_buff_list.VScrollBar.IncButton.PushImage = "gui\\common\\scrollbar\\button_2\\btn_down_down.png"
        groupbox_buff_list.VScrollBar.TrackButton.NormalImage = "gui\\common\\scrollbar\\button_2\\btn_trace_out.png"
        groupbox_buff_list.VScrollBar.TrackButton.FocusImage = "gui\\common\\scrollbar\\button_2\\btn_trace_on.png"
        groupbox_buff_list.VScrollBar.TrackButton.PushImage = "gui\\common\\scrollbar\\button_2\\btn_trace_on.png"
        groupbox_buff_list.VScrollBar.TrackButton.DrawMode = "ExpandV"
        groupbox_buff_list.VScrollBar.TrackButton.Width = 15
    end
end

-- Quét người chơi
function auto_run_player()
	while auto_is_running_player == true do
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
			local game_scence_objs = game_scence:GetSceneObjList()
		    local num_objs = table.getn(game_scence_objs)
			form.mltbox_content:Clear()
		    for i = 1, num_objs do
		        local obj_type = 0
		        if game_scence_objs[i]:FindProp("Type") then
		            obj_type = game_scence_objs[i]:QueryProp("Type")
		        end
		        if obj_type == 2 and game_scence_objs[i]:QueryProp("OffLineState") == 0 then
					local coc_name = game_scence_objs[i]:QueryProp("Name")
                    local text = nx_widestr("<font color=\"#FDFFA0\">")
                    text = text .. nx_widestr(coc_name)
                    text = text .. nx_widestr("</font>")
                    form.mltbox_content:AddHtmlText(text, -1)
		        end
		    end
		end
		nx_pause(1)
	end
end

-- Auto giải cứu cóc
function auto_run_offfree()
    local total_coc_free = 0
    local total_money_used = nx_int64(0)
    local array_coc_fred = {}

	while auto_is_running_offfree == true do
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
            local game_scence_objs = game_scence:GetSceneObjList()
            for i = 1, table.getn(game_scence_objs) do
                local obj = game_scence_objs[i]
                local coc_name = obj:QueryProp("Name")
                local coc_ident = obj.Ident
                if not in_array(coc_name, array_coc_fred) then
                    -- Xác định Visual mới chính xác tọa độ
                    local visualobj = game_visual:GetSceneObj(nx_string(coc_ident))
                    if nx_is_valid(visualobj) then
                        local distance = nx_float(string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, visualobj.PositionX, visualobj.PositionY, visualobj.PositionZ)))
                        
                        if distance < nx_float(6) and obj:QueryProp("Type") == 2 and obj:QueryProp("OffLineState") == 1 and not obj:FindProp("OfflineTypeTvT") and obj:QueryProp("IsAbducted") == 1 then
                            local money = nx_execute("form_stage_main\\form_offline\\offline_util", "get_setfree_money_by_level", obj)
                            if nx_int64(money) < nx_int64(500) then
                                -- Nhấp chọn con cóc
                                nx_execute("custom_sender", "custom_select", coc_ident)
                                nx_pause(0.1)
                                
                                -- Đợi một lát sau đó kiểm tra từ server last obj
                                local select_target_ident = player_client:QueryProp("LastObject")
                                local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                if nx_is_valid(select_target) and nx_string(coc_ident) == nx_string(select_target_ident) then
                                    table.insert(array_coc_fred, coc_name)
                                    total_coc_free = total_coc_free + 1
                                    total_money_used = total_money_used + nx_int64(money)
                                    nx_execute("custom_sender", "custom_offline_setfree", nx_int(1))
                                end
                                break
                            end
                        end
                    end
                end
            end
		end
        -- Xuất thông báo
        form.mltbox_content:Clear()
        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đi khắp các nơi, tìm cóc, tiến lại gần nó để tự giải cứu"), -1)
        local text_money = nx_execute("util_functions", "trans_capital_string", total_money_used)
        local text1 = nx_function("ext_utf8_to_widestr", "Số cóc giải cứu: <font color=\"#ff0061\">") .. nx_widestr(total_coc_free) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text1, -1)
        local text2 = nx_function("ext_utf8_to_widestr", "Bạc vụn tốn: <font color=\"#ff0061\">") .. nx_widestr(text_money) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text2, -1)
		nx_pause(0.2)
	end
end

-- Auto đi theo
function auto_run_trace()
	while auto_is_running_trace == true do
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
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn đối tượng để đi theo đối tượng đó"), -1)
            nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
		end
		nx_pause(1)
	end
end

-- Auto đánh
function auto_run_attack()
    local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
    -- Reset lại skill
    resetSkillData()
    while auto_is_running_attack == true do
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
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn đối tượng để đánh"), -1)
            local select_target_ident = player_client:QueryProp("LastObject")
            local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
            if nx_is_valid(select_target) then
                local obj_type = nx_number(select_target:QueryProp("Type"))
                local fight = nx_value("fight")
                if ((obj_type == TYPE_PLAYER and fight:CanAttackPlayer(player_client, select_target)) or (obj_type == TYPE_NPC and fight:CanAttackNpc(player_client, select_target))) and select_target:QueryProp("Dead") == 0 then
                    -- Xử lý đánh
                    local form_shortcut = nx_value(FORM_SHORTCUT_PATH)
                    if nx_is_valid(form_shortcut) then
                        local grid = form_shortcut.grid_shortcut_main
                        local gui = nx_value("gui")
                        if nx_is_valid(grid) and nx_is_valid(gui) and nx_is_valid(select_target) then
                            -- Ô đầu tiên là ô phá def
                            local gindex = 0
                            local readyDestroyParry = false
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                readyDestroyParry = true
                            end
                            if get_buff_info("BuffInParry", select_target) ~= nil and readyDestroyParry then
                                -- Đối thủ đỡ đòn thì phá def
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            else
                                -- Đối thủ không đỡ đòn thì đánh tự do
                                -- Đánh random skill
                                while true do
                                    if not nx_is_valid(grid) then
                                        break
                                    else
                                        local gindex = math.random(0, 7)
                                        local cool_type, cool_team = getSkillData(grid, gindex)
                                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                                            break
                                        end
                                    end
                                    nx_pause(0)
                                end
                            end
                        end
                    end
                end
            end
		end
		nx_pause(0.1)
	end
end

function auto_run_hgbc()
    local form = nx_value(THIS_FORM)
    if nx_is_valid(form) then
        form.mltbox_content:Clear()
        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Vui lòng không sử dụng bàn phím, chuột và các thao tác khác trong quá trình thực hiện Auto này"), -1)
    end

    -- Kịch bản
    -- Rinh 1 cục 4 bỏ vào 
    -- Rinh 3 cục 3 bỏ vào 
    -- Sau đó rinh cục 2 đến khi nào xong thì thôi

    -- Tọa độ vác đến
    local dropPos = {
        x = -0.185,
        y = 20.536,
        z = 12.399
    }
    local toPos = {
        x = -0.268,
        y = 21.753,
        z = -5.806
    }
    -- Task nhặt - Config ID Box - Buff ôm
    local boxData = {
        [4] = {13067, "npc_6n_lh_wyhs_smxs04", "buf_6n_wyhs_bst010c", 13078}, -- Mảnh IV
        [3] = {13062, "npc_6n_lh_wyhs_smxs03", "buf_6n_wyhs_bst05c", 13077}, -- Mảnh III
        [2] = {13057, "npc_6n_lh_wyhs_smxs02", "buf_6n_wyhs_bst02c", 13076}, -- Mảnh II
        [1] = {13052, "npc_6n_lh_wyhs_smxs01", "buf_6n_wyhs_bst01c", 13075} -- Mảnh I
    }
    local dropConfigID = "npc_6n_lh_wyhs_syc01" -- ID Vứt cục đá
    local buffCountDown = "buf_6n_wyhs_cd_01"
    local map = "adv126"
    local currentType = 4
    local count4complete = 0
    local count3complete = 0
    local isMoving = false

    while auto_is_running_hgbc == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
                is_vaild_data = false
            end
        end
        
        -- Nếu dữ liệu ok hết
        if is_vaild_data == true then
            -- Kiểm tra lại MAP
            local currentMap = game_scence:QueryProp("Resource")
            if currentMap ~= map then
                tools_show_notice(nx_function("ext_utf8_to_widestr", "MAP này không phải MAP chạy nhiệm vụ"))
                reset_all_btns("----")
                return false
            end
            
            -- Nếu đang ôm thì di chuyển
            if get_buff_info(boxData[currentType][3]) ~= nil then
                local moveToPos = {}
                if game_player.PositionZ > (toPos.z - 0.8) then
                    -- Di chuyển đến chỗ thả
                    moveToPos = dropPos
                else
                    -- Di chuyển đến chỗ bắt đầu xuống dốc
                    moveToPos = toPos
                end
                -- Chưa đến nơi thì bắt đầu quay mặt lại để chạy
                if not tools_move_isArrived(moveToPos.x, moveToPos.y, moveToPos.z, 0.8) then
                    -- Đưa camera quay về hướng cục đá
                    local angleY = getAngleForward(game_player.PositionX, game_player.PositionZ, moveToPos.x, moveToPos.z)
                    local scene = nx_value("game_scene")
                    local game_control = nx_execute("create_scene", "create_game_control", scene)
                    local camera_normal = game_control:GetCameraController(0)
                    camera_normal.CurYawAngle = angleY
                    -- Bắt đầu di chuyển
                    isMoving = is_moving(0.15)
                    if not isMoving then
                        startMoveForward()
                        isMoving = true
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu di chuyển"))
                    end
                else
                    if isMoving then
                        stopMoveForward()
                        isMoving = false
                    end
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đến nơi"))
                    -- Nếu đây là điểm vứt
                    if game_player.PositionZ > toPos.z then
                        -- Tìm NPC vứt
                        local dropItent = nil
                        local game_scence_objs = game_scence:GetSceneObjList()
                        for i = 1, table.getn(game_scence_objs) do
                            local obj = game_scence_objs[i]
                            local visualobj = game_visual:GetSceneObj(nx_string(obj.Ident))
                            if nx_is_valid(visualobj) then
                                if obj:QueryProp("ConfigID") == dropConfigID then
                                    dropItent = obj.Ident
                                end
                            end
                        end
                        if dropItent ~= nil then
                            local visualobj = game_visual:GetSceneObj(nx_string(dropItent))
                            if nx_is_valid(visualobj) then
                                -- Kiểm tra xem còn buff không
                                if get_buff_info(boxData[currentType][3]) ~= nil then
                                    -- Nhấp cái lỗ
                                    nx_execute("custom_sender", "custom_select", nx_string(dropItent))
                                    nx_pause(0.15)
                                    nx_execute("custom_sender", "custom_select", nx_string(dropItent))
                                    nx_pause(0.15)
                                    local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
                                    if nx_is_valid(form_talk) and form_talk.Visible == true then
                                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", boxData[currentType][4])
                                        nx_pause(0.3)
                                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Xong một cục"))
                                        if currentType == 4 then
                                            count4complete = count4complete + 1
                                            if count4complete >= 1 then
                                                currentType = 3
                                            end
                                        elseif currentType == 3 then
                                            count3complete = count3complete + 1
                                            if count3complete >= 3 then
                                                currentType = 2
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                -- Nếu không ôm thì tìm cục đá gần toPos nhất rồi chạy đến
                local objID = nil
                local minDistance = nx_float(0)
                local game_scence_objs = game_scence:GetSceneObjList()
                for i = 1, table.getn(game_scence_objs) do
                    local obj = game_scence_objs[i]
                    local visualobj = game_visual:GetSceneObj(nx_string(obj.Ident))
                    if nx_is_valid(visualobj) then
                        local distance = nx_float(string.format("%.0f", distance3d(toPos.x, toPos.y, toPos.z, visualobj.PositionX, visualobj.PositionY, visualobj.PositionZ)))
                        if obj:QueryProp("ConfigID") == boxData[currentType][2] then
                            if minDistance == nx_float(0) or minDistance > distance then
                                minDistance = distance
                                objID = obj.Ident
                            end
                        end
                    end
                end
                if objID ~= nil then
                    local visualobj = game_visual:GetSceneObj(nx_string(objID))
                    if nx_is_valid(visualobj) then
                        local movePos = {visualobj.PositionX, visualobj.PositionY, visualobj.PositionZ}
                        -- Chưa đến nơi thì bắt đầu quay mặt lại để chạy
                        if not tools_move_isArrived(movePos[1], movePos[2], movePos[3], 0.8) then
                            -- Đưa camera quay về hướng cục đá
                            local angleY = getAngleForward(game_player.PositionX, game_player.PositionZ, movePos[1], movePos[3])
                            local scene = nx_value("game_scene")
                            local game_control = nx_execute("create_scene", "create_game_control", scene)
                            local camera_normal = game_control:GetCameraController(0)
                            camera_normal.CurYawAngle = angleY
                            -- Bắt đầu di chuyển
                            isMoving = is_moving(0.15)
                            if not isMoving then
                                startMoveForward()
                                isMoving = true
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu di chuyển đến cục đá"))
                            end
                        else
                            if isMoving then
                                stopMoveForward()
                                isMoving = false
                            end
                            if get_buff_info(buffCountDown) == nil then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đến nơi"))
                                -- Nhấp cục đá
                                nx_execute("custom_sender", "custom_select", nx_string(objID))
                                nx_pause(0.3)
                                nx_execute("custom_sender", "custom_select", nx_string(objID))
                                nx_pause(0.3)
                                local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
                                if nx_is_valid(form_talk) and form_talk.Visible == true then
                                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", boxData[currentType][1])
                                    nx_pause(0.3)
                                end
                            end
                        end
                    end
                end
            end
        end
        nx_pause(0.2)
    end
end

function auto_run_dddh()
    local arrayNPC = {
        "home_mj_qiu",
        "home_mj_dong",
        "home_mj_mei",
        "home_mj_zhu",
        "home_mj_ju",
        "home_mj_chun",
        "home_mj_xia",
        "home_mj_lan"
    }
    local arraySetNPC = {
        "home_mj_qiu_ts",
        "home_mj_dong_ts",
        "home_mj_mei_ts",
        "home_mj_zhu_ts",
        "home_mj_ju_ts",
        "home_mj_chun_ts",
        "home_mj_xia_ts",
        "home_mj_lan_ts"
    }

    local ignoreIdent = {}
    local accessQuestNPC = {"home_mj_yd", 841008077, 840008077}
    local startQuestNPC = {"home_mj_leave", 100061018, 101061018, 102061018}
    local completeQuestNPC = {"home_mj_leave", 200061018, 201061018}
    local leaveQuestNPC = {"home_mj_leave", 841008075, 840008075}
    local MapQuest = "adv128"
    local step = 1
    local lastTimeNoSetNPC = 0

    while auto_is_running_dddh == true do
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
        
        local arrayIdent = {}
        
        if is_vaild_data == true then
            form.mltbox_content:Clear()
            
            -- Chat thông số map
            local currentMap = game_scence:QueryProp("Resource")
            local currentMapText = game_scence:QueryProp("ConfigID")
            currentMapText = util_text(nx_string(currentMapText))

            local text = nx_function("ext_utf8_to_widestr", "MAP hiện tại: ") .. currentMapText
            form.mltbox_content:AddHtmlText(text, -1)
            
            -- Chạy đến chỗ con NPC đối thoại vào MAP
            if step == 1 then
                -- Nếu đang ở trong MAP nhiệm vụ thì chuyển bước mở khiêu chiến
                if currentMap == MapQuest then
                    step = 2
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC vào MAP Dao Đài"), -1)
                    -- Di chuyển lại nói chuyện với con Npc
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving(0.3) then
                            if tools_trace_npc("city02", accessQuestNPC[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC mở nhiệm vụ"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC mở nhiệm vụ không tồn tại"))
                                reset_all_btns("----")
                                return 0
                            end
                            
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", accessQuestNPC[2])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", accessQuestNPC[3])
                        nx_pause(2)
                        step = 2
                    end
                end
            elseif step == 2 then
                -- Chờ MAP nó load xong
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    -- Kiểm tra lại MAP đang thực hiện 
                    if MapQuest ~= currentMap then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP"))
                        reset_all_btns("----")
                        return 0
                    end
                    -- Đối thoại với con NPC mở nhiệm vụ
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang mở nhiệm vụ"), -1)
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving(0.3) then
                            if tools_trace_npc(currentMap, startQuestNPC[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC mở nhiệm vụ"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC mở nhiệm vụ không tồn tại"))
                                reset_all_btns("----")
                                return 0
                            end
                            
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", startQuestNPC[2])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", startQuestNPC[3])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", startQuestNPC[4])
                        nx_pause(2)
                        step = 3
                    end
                end
            elseif step == 3 then
                -- Kiểm tra lại MAP đang thực hiện 
                if MapQuest ~= currentMap then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP"))
                    reset_all_btns("----")
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang thực hiện nhiệm vụ"), -1)
                local numNPCQuest = 0
                local numNPCSetQuest = 0
                local SetNPCQuestKey = 0
                local game_scence_objs = game_scence:GetSceneObjList()
                -- Chờ đủ 16 cái thẻ và một cái đối chứng
                for i = 1, table.getn(game_scence_objs) do
                    local obj = game_scence_objs[i]
                    if nx_is_valid(obj) then
                        if in_array(obj:QueryProp("ConfigID"), arrayNPC) then
                            numNPCQuest = numNPCQuest + 1
                        end
                        for j = 1, table.getn(arraySetNPC) do
                            if arraySetNPC[j] == obj:QueryProp("ConfigID") then
                                numNPCSetQuest = numNPCSetQuest + 1
                                SetNPCQuestKey = j
                                lastTimeNoSetNPC = os.time()
                            end
                        end
                    end
                end
                local text = nx_function("ext_utf8_to_widestr", "Số ITEM đưa ra: ") .. nx_widestr(numNPCSetQuest)
                form.mltbox_content:AddHtmlText(text, -1)
                local text = nx_function("ext_utf8_to_widestr", "Số ITEM bố trí: ") .. nx_widestr(numNPCQuest)
                form.mltbox_content:AddHtmlText(text, -1)
                -- Khi tìm ra con SET Quest thì tìm ra Ident của 2 con quest
                if nx_is_valid(game_scence) and SetNPCQuestKey > 0 then
                    local game_scence_objs = game_scence:GetSceneObjList()
                    -- Chờ đủ 16 cái thẻ và một cái đối chứng
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        if nx_is_valid(obj) and obj:QueryProp("ConfigID") == arrayNPC[SetNPCQuestKey] then
                            table.insert(arrayIdent, obj.Ident)
                        end
                    end
                end
                local text = nx_function("ext_utf8_to_widestr", "Số Item cần mở: ") .. nx_widestr(table.getn(arrayIdent))
                form.mltbox_content:AddHtmlText(text, -1)
                local text = nx_function("ext_utf8_to_widestr", "Số Item đã mở: ") .. nx_widestr(table.getn(ignoreIdent))
                form.mltbox_content:AddHtmlText(text, -1)
                -- Sau khi đủ 
                if numNPCQuest == 16 and numNPCSetQuest == 1 and table.getn(arrayIdent) == 2 and table.getn(ignoreIdent) < 2 then
                    for i = 1, table.getn(arrayIdent) do
                        local Ident = arrayIdent[i]
                        if not in_array(Ident, ignoreIdent) then
                            if nx_is_valid(game_client) then
                                local obj = game_client:GetSceneObj(nx_string(Ident))
                                if nx_is_valid(obj) then
                                    local visualObj = game_visual:GetSceneObj(obj.Ident)
                                    if nx_is_valid(visualObj) then
                                        if not is_moving() then
                                            if not tools_move_isArrived2D(visualObj.PositionX, visualObj.PositionY, visualObj.PositionZ, 0.5) then
                                                tools_move(currentMap, visualObj.PositionX, visualObj.PositionY, visualObj.PositionZ, true)
                                            else
                                                -- Đến nơi
                                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đến nơi"))
                                                nx_pause(1)
                                                nx_execute("custom_sender", "custom_select", nx_string(Ident))
                                                nx_pause(0.2)
                                                nx_execute("custom_sender", "custom_select", nx_string(Ident))
                                                nx_pause(0.2)
                                                nx_execute("custom_sender", "custom_select", nx_string(Ident))
                                                nx_pause(0.2)
                                                table.insert(ignoreIdent, Ident)
                                            end
                                        end
                                    end
                                end
                            end
                            break
                        end
                    end
                else
                    arrayIdent = {}
                    ignoreIdent = {}
                    nx_pause(2.5)
                end
                if tools_difftime(lastTimeNoSetNPC) > 7 and lastTimeNoSetNPC > 0 then
                    step = 4
                end
            elseif step == 4 then
                -- Nếu không trong MAP nhiệm vụ thì kết thúc
                if currentMap ~= MapQuest then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP. Kết thúc"))
                    reset_all_btns("----")
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang rời MAP nhiệm vụ"), -1)
                -- Di chuyển lại nói chuyện với con Npc
                local is_talking = false
                if not is_talking then
                    -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                    if not is_moving(0.3) then
                        if tools_trace_npc(MapQuest, completeQuestNPC[1]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang tìm NPC rời MAP"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC rời MAP không tồn tại"))
                            reset_all_btns("----")
                            return 0
                        end
                        
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", completeQuestNPC[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", completeQuestNPC[3])
                    nx_pause(2)
                    step = 5
                end
            elseif step == 5 then
                -- Nếu không trong MAP nhiệm vụ thì kết thúc
                if currentMap ~= MapQuest then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP. Kết thúc"))
                    reset_all_btns("----")
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang rời MAP nhiệm vụ"), -1)
                -- Di chuyển lại nói chuyện với con Npc
                local is_talking = false
                if not is_talking then
                    -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                    if not is_moving(0.3) then
                        if tools_trace_npc(MapQuest, leaveQuestNPC[1]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang tìm NPC rời MAP"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC rời MAP không tồn tại"))
                            reset_all_btns("----")
                            return 0
                        end
                        
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", leaveQuestNPC[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", leaveQuestNPC[3])
                    nx_pause(2)
                    step = 6
                end
            elseif step == 6 then
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Kết thúc nhiệm vụ"), -1)
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc nhiệm vụ"))
                    reset_all_btns("----")
                    return 0
                end
            end
        end
        nx_pause(0.2)
    end
end

function auto_run_ntlm()
    local step = 1

    local questResetData = {"npc_6n_cc_sxsl_007", "city03", 842061016} -- Làm mới
    local questStartData = {"npc_6n_cc_sxsl_007", "city03", 100061016, 101061016} -- Mở nhiệm vụ
    local questAccessData = {"npc_6n_cc_sxsl_004", "city03", 841008073, 840008073} -- Vào MAP
    local questCompareData = {"npc_6n_cc_sxsl_boss", -287.764, 82.526, 365.630, 841008072, 840080720} -- Đã chuẩn bị xong
    local questLeaveData = {"npc_6n_cc_sxsl_005", 841008074, 840008074} -- Rời khỏi
    local questStep1Data = {"npc_6n_cc_sxsl_001", 841008079, 841008070, 840080700} -- Mở chí tôn
    local questStep2Data = {"npc_6n_cc_sxsl_001", 841008079, 841008071, 840080710} -- Mở huyền thiết trụ
    local startDoPos = {-305.897, 82.525, 353.404}
    local MapQuest = "adv121"

    local bossID = "npc_6n_cc_sxsl_boss"
    local questNpcID = "npc_6n_cc_sxsl_npc_001"
    local arrayDataBuffBoss = {
        "buf_6n_cc_sxsl_one_001",
        "buf_6n_cc_sxsl_one_002",
        "buf_6n_cc_sxsl_one_003",
        "buf_6n_cc_sxsl_one_004",
        "buf_6n_cc_sxsl_one_005",
        "buf_6n_cc_sxsl_one_006",
        "buf_6n_cc_sxsl_one_007",
        "buf_6n_cc_sxsl_one_008",
        "buf_6n_cc_sxsl_one_009"
    }
    local arrayDataBuffNPCQuest = {
        "buf_6n_cc_sxsl_two_001",
        "buf_6n_cc_sxsl_two_002",
        "buf_6n_cc_sxsl_two_003",
        "buf_6n_cc_sxsl_two_004",
        "buf_6n_cc_sxsl_two_005",
        "buf_6n_cc_sxsl_two_006",
        "buf_6n_cc_sxsl_two_007",
        "buf_6n_cc_sxsl_two_008",
        "buf_6n_cc_sxsl_two_009"
    }
    local arrayIdent = {}
    local offsetIdent = 0
    local isComplete = false

    while auto_is_running_ntlm == true do
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
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
            
            -- Chat thông số map
            local currentMap = game_scence:QueryProp("Resource")
            local currentMapText = game_scence:QueryProp("ConfigID")
            currentMapText = util_text(nx_string(currentMapText))

            local text = nx_function("ext_utf8_to_widestr", "MAP hiện tại: ") .. currentMapText
            form.mltbox_content:AddHtmlText(text, -1)
            
            if step == 1 then
                -- Nếu MAP Q thì chuyển bước 4
                if MapQuest == currentMap then
                    step = 4
                else
                    -- Tìm con NPC
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC nhận nhiệm vụ"), -1)
                    local is_talking = false
                    if not is_talking then
                        if not is_moving(0.3) then
                            if tools_trace_npc(questStartData[2], questStartData[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC nhận nhiệm vụ"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC nhận nhiệm vụ không tồn tại"))
                                auto_is_running_ntlm = false
                                reset_all_btns("----")
                                return 0
                            end
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Nhận nhiệm vụ
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStartData[3])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStartData[4])
                        nx_pause(0.2)
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                        if is_talking then
                            -- Thử reset nhiệm vụ
                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", questResetData[3])
                            nx_pause(0.2)
                            local form_talk = nx_value("form_stage_main\\form_talk_movie")
                            is_talking = form_talk.Visible
                        end
                        if is_talking then
                            auto_is_running_ntlm = false
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Không thể nhận hoặc làm mới nhiệm vụ. Hãy kiểm tra lại bạn đã làm rồi hoặc là chưa đủ điều kiện nhận"), -1)
                            reset_all_btns("----")
                            return 0
                        else
                            step = 2
                        end
                    end
                end
            elseif step == 2 then
                -- Nếu MAP Q thì chuyển bước 4
                if MapQuest == currentMap then
                    step = 4
                else
                    -- Tìm con NPC
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC vào MAP nhiệm vụ"), -1)
                    local is_talking = false
                    if not is_talking then
                        if not is_moving(0.3) then
                            if tools_trace_npc(questAccessData[2], questAccessData[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC vào MAP nhiệm vụ"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC vào MAP nhiệm vụ không tồn tại"))
                                auto_is_running_ntlm = false
                                reset_all_btns("----")
                                return 0
                            end
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", questAccessData[3])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", questAccessData[4])
                        nx_pause(2)
                        step = 3
                    end
                end
            elseif step == 3 then
                -- Chờ MAP nó load xong
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    step = 4
                end
            elseif step == 4 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Mở chí tôn"), -1)
                -- Nói chuyện để mở chí tôn và huyền thiết trụ
                local is_talking = false
                if not is_talking then
                    if not is_moving(0.3) then
                        if tools_trace_npc(MapQuest, questStep1Data[1]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC mở Chí Tôn"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC mở Chí Tôn không tồn tại"))
                            auto_is_running_ntlm = false
                            reset_all_btns("----")
                            return 0
                        end
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep1Data[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep1Data[3])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep1Data[4])
                    nx_pause(2)
                    step = 5
                end
            elseif step == 5 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Mở Huyền Thiết Trụ"), -1)
                -- Nói chuyện để mở chí tôn và huyền thiết trụ
                local is_talking = false
                if not is_talking then
                    if not is_moving(0.3) then
                        if tools_trace_npc(MapQuest, questStep2Data[1]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC mở Huyền Thiết Trụ"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC mở Huyền Thiết Trụ không tồn tại"))
                            auto_is_running_ntlm = false
                            reset_all_btns("----")
                            return 0
                        end
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep2Data[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep2Data[3])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questStep2Data[4])
                    nx_pause(2)
                    step = 6
                end
            elseif step == 6 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Thực hiện nhiệm vụ"), -1)
                local numBoss = 0
                local arrayBuffBoss = {} -- Xác định luôn buff này là của NPC
                local numNPCQuest = 0
                
                -- Tìm ra con boss
                if nx_is_valid(game_scence) then
                    local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        local visualobj = game_visual:GetSceneObj(nx_string(obj.Ident))
                        if nx_is_valid(visualobj) then
                            if obj:QueryProp("ConfigID") == bossID then
                                numBoss = 1
                                for j = 1, 5 do
                                    local buff = obj:QueryProp("BufferInfo" .. tostring(j))
                                    if buff ~= 0 then
                                        local buff_info = util_split_string(buff, ",")
                                        for k = 1, table.getn(arrayDataBuffBoss) do
                                            if arrayDataBuffBoss[k] == buff_info[1] then
                                                table.insert(arrayBuffBoss, arrayDataBuffNPCQuest[k])
                                                break
                                            end
                                        end
                                    end
                                end
                                break
                            end
                        end
                    end
                end
                -- Tìm ra các huyền thiết thạch có buff của con boss
                if nx_is_valid(game_scence) and numBoss == 1 and table.getn(arrayBuffBoss) == 4 then
                    local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        local visualobj = game_visual:GetSceneObj(nx_string(obj.Ident))
                        if nx_is_valid(visualobj) then
                            if obj:QueryProp("ConfigID") == questNpcID then
                                for j = 1, 2 do
                                    local buff = obj:QueryProp("BufferInfo" .. tostring(j))
                                    if buff ~= 0 then
                                        local buff_info = util_split_string(buff, ",")
                                        if in_array(buff_info[1], arrayBuffBoss) then
                                            table.insert(arrayIdent, obj.Ident)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
                local text = nx_function("ext_utf8_to_widestr", "Đã có Chí Tôn: ") .. nx_widestr(numBoss)
                form.mltbox_content:AddHtmlText(text, -1)
                local text = nx_function("ext_utf8_to_widestr", "Đã tìm thấy buff chí tôn: ") .. nx_widestr(table.getn(arrayBuffBoss))
                form.mltbox_content:AddHtmlText(text, -1)
                local text = nx_function("ext_utf8_to_widestr", "Số Huyền Thiết Trụ đã xuất hiện: ") .. nx_widestr(numNPCQuest)
                form.mltbox_content:AddHtmlText(text, -1)
                local text = nx_function("ext_utf8_to_widestr", "Số Huyền Thiết Trụ đã xác định: ") .. nx_widestr(table.getn(arrayIdent))
                form.mltbox_content:AddHtmlText(text, -1)
                
                if table.getn(arrayIdent) == 4 then
                    step = 7
                end
            elseif step == 7 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Di chuyển chống lỗi MAP"), -1)
                if not tools_move_isArrived(startDoPos[1], startDoPos[2], startDoPos[3], 0.8) then
                    if not is_moving() then
                        tools_move(MapQuest, startDoPos[1], startDoPos[2], startDoPos[3], true)
                    end
                else
                    if not isComplete then
                        step = 8
                        offsetIdent = 1
                    else
                        step = 11
                    end
                end
            elseif step == 8 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đi mở huyền thiết thạch"), -1)
                if arrayIdent[offsetIdent] == nil then
                    step = 9
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Mở trụ thứ ") .. nx_widestr(offsetIdent), -1)
                    if nx_is_valid(game_scence) and nx_is_valid(game_visual) then
                        local obj = game_scence:GetSceneObj(nx_string(arrayIdent[offsetIdent]))
                        local visualobj = game_visual:GetSceneObj(nx_string(arrayIdent[offsetIdent]))
                        if not nx_is_valid(obj) or not nx_is_valid(visualobj) then
                            auto_is_running_ntlm = false
                            reset_all_btns("----")
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Các thạch trụ đã bị mất, vui lòng làm lại từ đầu"))
                            return 0
                        end
                        if not tools_move_isArrived(visualobj.PositionX, visualobj.PositionY, visualobj.PositionZ, 1) then
                            if not is_moving() then
                                tools_move(MapQuest, visualobj.PositionX, visualobj.PositionY, visualobj.PositionZ, true)
                            end
                        else
                            nx_pause(1)
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn lần 1"), -1)
                            nx_execute("custom_sender", "custom_select", obj.Ident)
                            nx_pause(0.2)
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn lần 2"), -1)
                            nx_execute("custom_sender", "custom_select", obj.Ident)
                            nx_pause(0.2)
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn lần 3"), -1)
                            nx_execute("custom_sender", "custom_select", obj.Ident)
                            nx_pause(1)
                            offsetIdent = offsetIdent + 1
                        end
                    end
                end
            elseif step == 9 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đi đối chiếu kết quả"), -1)
                local is_talking = false
                if not is_talking then
                    if not is_moving(0.3) then
                        if tools_trace_npc_with_pos(MapQuest, questCompareData[1], questCompareData[2], questCompareData[3], questCompareData[4]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC đối chiếu"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC đối chiếu không tồn tại"))
                            auto_is_running_ntlm = false
                            reset_all_btns("----")
                            return 0
                        end
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questCompareData[5])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questCompareData[6])
                    nx_pause(2)
                    step = 10
                    isComplete = true
                end
            elseif step == 10 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đợi phát Video xong"), -1)
                local bMovie = util_is_form_visible("form_stage_main\\form_movie_new")
                if not bMovie then
                    nx_pause(2)
                    step = 7
                end
            elseif step == 11 then
                if MapQuest ~= currentMap then
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi MAP, kết thúc"))
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đi đối chiếu kết quả"), -1)
                local is_talking = false
                if not is_talking then
                    if not is_moving(0.3) then
                        if tools_trace_npc(MapQuest, questLeaveData[1]) then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC rời MAP"))
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC rời MAP không tồn tại"))
                            auto_is_running_ntlm = false
                            reset_all_btns("----")
                            return 0
                        end
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questLeaveData[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", questLeaveData[3])
                    nx_pause(2)
                    step = 12
                end
            elseif step == 12 then
                -- Chờ MAP nó load xong
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhiệm vụ hoàn thành, Auto đã kết thúc"), -1)
                    auto_is_running_ntlm = false
                    reset_all_btns("----")
                    return 0
                end
            end
        end
        nx_pause(0.2)
    end
end

----------------------------------------------------
-- Auto vụ phong tầm hiệp
--
function auto_run_vptd()
    -- NPC nhận nhiệm vụ
    local receiveQuestNPC = {"jddb_npc_01", 100061017, 101061017}
    -- NPC vào MAP
    local accessMapQuestNPC = {"jddb_npc_01", 841008062, 840008062}
    -- Trả nhiệm vụ
    local completeQuestNPC = {"jddb_npc_03", 500061017}
    -- Rời MAP
    local leaveMapNPC = {"jddb_npc_03", 841008081, 840008081}
    local MapQuest = "adv127"
    local destinationPos = {1552.972, 17.466, 330.350}
    local step = 1

    while auto_is_running_vptd == true do
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
            
            -- Chat thông số map
            local currentMap = game_scence:QueryProp("Resource")
            local currentMapText = game_scence:QueryProp("ConfigID")
            currentMapText = util_text(nx_string(currentMapText))

            local text = nx_function("ext_utf8_to_widestr", "MAP hiện tại: ") .. currentMapText
            form.mltbox_content:AddHtmlText(text, -1)
            
            -- Chạy đến chỗ con NPC đối thoại vào MAP
            if step == 1 then
                -- Nếu đang ở trong MAP nhiệm vụ thì chuyển bước mở khiêu chiến
                if currentMap == MapQuest then
                    step = 3
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC nhận nhiệm vụ"), -1)
                    -- Di chuyển lại nói chuyện với con Npc
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving(0.3) then
                            if tools_trace_npc("city03", receiveQuestNPC[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC nhận nhiệm vụ"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC nhận nhiệm vụ không tồn tại"))
                                reset_all_btns("----")
                                return 0
                            end
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", receiveQuestNPC[2])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", receiveQuestNPC[3])
                        nx_pause(2)
                        step = 2
                    end
                end
            elseif step == 2 then
                -- Nếu đang ở trong MAP nhiệm vụ thì chuyển bước mở khiêu chiến
                if currentMap == MapQuest then
                    step = 3
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC vào MAP Vụ Phong Tầm Hiệp"), -1)
                    -- Di chuyển lại nói chuyện với con Npc
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving(0.3) then
                            if tools_trace_npc("city03", accessMapQuestNPC[1]) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC vào MAP"))
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC vào MAP không tồn tại"))
                                reset_all_btns("----")
                                return 0
                            end
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", accessMapQuestNPC[2])
                        nx_pause(0.2)
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", accessMapQuestNPC[3])
                        nx_pause(10)
                        step = 3
                    end
                end
            elseif step == 3 then
                -- Chờ MAP nó load xong
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang dịch chuyển đến vị trí trả nhiệm vụ"), -1)
                    -- Kiểm tra lại MAP đang thực hiện 
                    if MapQuest ~= currentMap then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP"))
                        reset_all_btns("----")
                        return 0
                    end
                    -- Kiểm tra lại chỗ đứng. Nếu đến vị trí rồi thì chuyển bước 4
                    if tools_move_isArrived(destinationPos[1], destinationPos[2], destinationPos[3], 0.6) then
                        step = 4
                        nx_pause(1)
                    else
                        -- Xuống ngựa trước khi nhảy
                        if get_buff_info("buf_riding_01") ~= nil then
                            nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                            nx_pause(1)
                        else
                            -- Nhảy đến vị trí 
                            local stepJump = 40
                            local pauseStep = 5
                            local fixedY = 25
                            jump_direct_to_pos(destinationPos, stepJump, pauseStep, fixedY)
                            nx_pause(2)
                        end
                    end
                end
            elseif step == 4 then
                -- Kiểm tra lại MAP đang thực hiện 
                if MapQuest ~= currentMap then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP"))
                    reset_all_btns("----")
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang trả Q"), -1)
                -- Kiểm tra lại chỗ đứng. Nếu sai vị trí đứng thì quay lại bước 3
                if not tools_move_isArrived(destinationPos[1], destinationPos[2], destinationPos[3], 0.6) then
                    step = 3
                    nx_pause(1)
                else
                    local is_talking = false
                    if not is_talking then
                        -- Quét MAP tìm con NPC
                        local game_scence_objs = game_scence:GetSceneObjList()
                        for i = 1, table.getn(game_scence_objs) do
                            local npc_id = game_scence_objs[i]:QueryProp("ConfigID")
                            if npc_id == completeQuestNPC[1] then
                                nx_execute("custom_sender", "custom_select", nx_string(game_scence_objs[i].Ident))
                                nx_pause(0.1)
                                break
                            end
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", completeQuestNPC[2])
                        nx_pause(2)
                        step = 5
                    end
                end
            elseif step == 5 then
                -- Nếu không trong MAP nhiệm vụ thì kết thúc
                if currentMap ~= MapQuest then
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Sai MAP. Kết thúc"))
                    reset_all_btns("----")
                    return 0
                end
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang rời MAP"), -1)
                -- Di chuyển lại nói chuyện với con Npc
                local is_talking = false
                if not is_talking then
                    -- Quét MAP tìm con NPC
                    local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local npc_id = game_scence_objs[i]:QueryProp("ConfigID")
                        if npc_id == completeQuestNPC[1] then
                            nx_execute("custom_sender", "custom_select", nx_string(game_scence_objs[i].Ident))
                            nx_pause(0.1)
                            break
                        end
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", leaveMapNPC[2])
                    nx_pause(0.2)
                    nx_execute("form_stage_main\\form_talk_movie", "menu_select", leaveMapNPC[3])
                    nx_pause(2)
                    step = 6
                end
            elseif step == 6 then
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ MAP load"), -1)
                    nx_pause(2)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Kết thúc nhiệm vụ"), -1)
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc nhiệm vụ"))
                    reset_all_btns("----")
                    return 0
                end
            end
        end
        nx_pause(0.2)
    end
end

---------------------------------------
-- Xác định khoảng cách
-- 
function getDistanceWithObj(pos, vobj)
    if not nx_is_valid(vobj) then
        return 0
    end
    local px = string.format("%.3f", vobj.PositionX)
    local py = string.format("%.3f", vobj.PositionY)
    local pz = string.format("%.3f", vobj.PositionZ)

    local pxd = px - pos[1]
    local pyd = py - pos[2]
    local pzd = pz - pos[3]

    return math.sqrt(pxd * pxd + pzd * pzd)
end

----------------------------------------------------
-- Auto bắt chim nội công 5
--
function auto_run_capbird()
    -- Config ID của con chim
    local birdConfigID = {
        "npc_5n_lzj_bird30",
        "npc_5n_lzj_bird31",
        "npc_5n_lzj_bird32",
        "npc_5n_lzj_bird33",
        "npc_5n_lzj_bird34",
        "npc_5n_lzj_bird35",
        "npc_5n_lzj_bird36",
        "npc_5n_lzj_bird37",
        "npc_5n_lzj_bird38",
        "npc_5n_lzj_bird39",
        "npc_5n_lzj_bird40",
        "npc_5n_lzj_bird41",
        "npc_5n_lzj_bird42",
        "npc_5n_lzj_bird43",
        "npc_5n_lzj_bird44",
        "npc_5n_lzj_bird45",
        "npc_5n_lzj_bird46",
        "npc_5n_lzj_bird47",
        "npc_5n_lzj_bird48",
        "npc_5n_lzj_bird49"
    }
    -- Config của Item bắt được
    local birdCaughtConfigID = "Item_5nei_bird02"

    while auto_is_running_capbird == true do
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
            
            -- Tính số con chim đã bắt được
            local GoodsGrid = nx_value("GoodsGrid")
            local numBirdCaught = 0
            if nx_is_valid(GoodsGrid) then
                numBirdCaught = GoodsGrid:GetItemCount(birdCaughtConfigID)
            end
            -- Ghi ra số con chim đã bắt
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số con chim đã bắt: ") .. nx_widestr(numBirdCaught), -1)
            
            if numBirdCaught >= 5 then
                auto_is_running = false
                nx_function("ext_flash_window")
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đã bắt đủ số chim. Auto kết thúc"), -1)
                reset_all_btns("----")
                return false
            else
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang quét chim"), -1)
                local game_scence_objs = game_scence:GetSceneObjList()
                for i = 1, table.getn(game_scence_objs) do
                    local obj = game_scence_objs[i]
                    if nx_is_valid(obj) then
                        local visualObj = game_visual:GetSceneObj(obj.Ident)
                        if nx_is_valid(visualObj) then
                            -- Xác định khoảng cách 3D
                            local pxd = game_player.PositionX - visualObj.PositionX
                            local pyd = game_player.PositionY - visualObj.PositionY
                            local pzd = game_player.PositionZ - visualObj.PositionZ
                            local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
                            local angleY = getAngleForward(game_player.PositionX, game_player.PositionZ, visualObj.PositionX, visualObj.PositionZ)
                            -- Xác định con chim ở gần, ghi ra tọa độ
                            if distance < 8 and obj:QueryProp("Type") == 4 and in_array(obj:QueryProp("ConfigID"), birdConfigID) then
                                local textAngleY = string.format("%.3f", angleY)
                                form.mltbox_content:AddHtmlText(util_text(obj:QueryProp("ConfigID")) .. nx_widestr(" ----> AngleY: ") .. nx_widestr(textAngleY), -1)
                                if angleY > 5.15 and angleY < 5.50 then
                                    local form_shortcut_common = nx_value("form_stage_main\\form_main\\form_main_shortcut_buff_common")
                                    if nx_is_valid(form_shortcut_common) then
                                        local grid = form_shortcut_common.imagegrid_1
                                        if nx_is_valid(grid) then
                                            nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(1))
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
        nx_pause(0.05)
    end
end

--------------------------------------------------
-- Xóa thư hệ thống
function auto_run_delmail()
    while auto_is_running_delmail == true do
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
                is_vaild_data = false
            end
        end

        -- Nếu dữ liệu ok hết
        if is_vaild_data == true then
            nx_execute("form_stage_main\\form_mail\\form_mail", "open_form", 1)
            local form = nx_value("form_stage_main\\form_mail\\form_mail")
            if not nx_is_valid(form) then
                return false
            end
            nx_execute("form_stage_main\\form_mail\\form_mail", "system_on_click", form.system)
            local form = nx_value("form_stage_main\\form_mail\\form_mail_accept")
            if not nx_is_valid(form) then
                return false
            end
            local sysnum = nx_execute("form_stage_main\\form_mail\\form_mail_accept", "get_system_num")
            if sysnum > 0 then
                form.select_all.Checked = true
                nx_execute("form_stage_main\\form_mail\\form_mail_accept", "on_select_all_click", form.select_all)
                nx_execute("custom_sender", "custom_del_letter", 0, form.mail_type)
                nx_pause(0.5)
                local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", false, false)
                if nx_is_valid(dialog) then
                    nx_execute("form_common\\form_confirm", "ok_btn_click", dialog.ok_btn)
                end
            end
        end
        
        nx_pause(1)
    end
end

----------------------------------------------------
-- Auto thổi cóc, nhặt lên và thông báo
-- Sau khi thông báo thì thoát luôn cái Form này
function auto_run_catchabduct()
    local max_distance_selectauto = 3
    local used_abduct_item = false

    while auto_is_running_catchabduct == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
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
            
            -- Kiểm tra nếu đang ôm con cóc thì kết thúc tốt đẹp
            if get_buff_info("buf_abductor") ~= nil then
                nx_function("ext_flash_window")
                on_main_form_close(form)
                return false
            end
            
            local game_scence_objs = game_scence:GetSceneObjList()
            local select_object = 0
            
            for i = 1, table.getn(game_scence_objs) do
                local obj_type = 0
                if game_scence_objs[i]:FindProp("Type") then
                    obj_type = game_scence_objs[i]:QueryProp("Type")
                end
                local distance = string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, game_scence_objs[i].PosiX, game_scence_objs[i].PosiY, game_scence_objs[i].PosiZ))
                
                -- Nhặt cái bao gai lên
                if obj_type == 4 and game_scence_objs[i]:QueryProp("ConfigID") == "OffAbductNpc_0" and used_abduct_item and tonumber(distance) <= max_distance_selectauto then --- NPC
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(0.2)
                    nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                    nx_pause(9)
                    used_abduct_item = false
                    break
                elseif obj_type == 2 and game_scence_objs[i]:QueryProp("OffLineState") == 1 and not game_scence_objs[i]:FindProp("OfflineTypeTvT") then
                    if game_scence_objs[i]:QueryProp("IsAbducted") == 0 then
                        if tonumber(distance) <= max_distance_selectauto then
                            select_object = i
                            break
                        end
                    end
                end
            end
            
            if select_object ~= 0 then
                nx_execute("custom_sender", "custom_select", game_scence_objs[select_object].Ident)
                local form_bag = nx_value("form_stage_main\\form_bag")
                if nx_is_valid(form_bag) then
                    form_bag.rbtn_tool.Checked = true
                end
                nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "offitem_miyao10")
                used_abduct_item = true
            end
        end
        
        -- Dừng một lát trước khi chạy lại
        nx_pause(1)
    end
end

----------------------------------------------------
-- Thông báo có Request
-- Sau khi thông báo thì thoát luôn cái Form này
function auto_run_noterequest()
    require("define\\request_type")
    local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"
    while auto_is_running_noterequest == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
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
			local num_request = nx_execute(FORM_MAIN_REQUEST, "get_num_request")
            local isAccepttedRequest = false
			if num_request > 0 then
				for i = 1, num_request do
					local request_type = nx_execute(FORM_MAIN_REQUEST, "get_request_type", i)
					local request_player = nx_execute(FORM_MAIN_REQUEST, "get_request_player", i)
					if request_type == REQUESTTYPE_INVITETEAM or request_type == REQUESTTYPE_EGWAR then
						isAccepttedRequest = true
					end
				end
			end
            if isAccepttedRequest == true then
                nx_function("ext_flash_window")
                on_main_form_close(form)
                return false
            end
        end
        
        -- Dừng một lát trước khi chạy lại
        nx_pause(1)
    end
end

----------------------------------------------------
-- Auto chấp nhận request
-- Sau khi chấp nhận thì KHÔNG thoát luôn cái Form này
function auto_run_acceptrequest()
    require("define\\request_type")
    require("share\\client_custom_define")
    local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"
    while auto_is_running_acceptrequest == true do
        -- Kiểm tra dữ liệu hợp chuẩn
        local is_vaild_data = true
        local game_client
        local game_visual
        local game_player
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
            game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
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
			local num_request = nx_execute(FORM_MAIN_REQUEST, "get_num_request")
            local isAccepttedRequest = false
			if num_request > 0 then
				for i = 1, num_request do
					local request_type = nx_execute(FORM_MAIN_REQUEST, "get_request_type", i)
					local request_player = nx_execute(FORM_MAIN_REQUEST, "get_request_player", i)
					if request_type == REQUESTTYPE_INVITETEAM then
						-- Chấp nhận lời mời tổ đội
						isAccepttedRequest = true
                        nx_execute("custom_sender", "custom_request_answer", request_type, request_player, 1)
                        break
                    elseif request_type == REQUESTTYPE_EGWAR then
						-- Chấp nhận lời mời vào thiên thê
                        local egwar = nx_value("EgWarModule")
                        if nx_is_valid(egwar) then
                            isAccepttedRequest = true
                            nx_execute("custom_sender", "custom_egwar_trans", 1, egwar.CrossServerID, egwar.WarName, egwar.RuleIndex, egwar.WarSceneID, egwar.SubRound, egwar.StartTime)
                            break
                        end
                    elseif request_type == REQUESTTYPE_LIFE_JOB_SHARE then
                        -- Chấp nhận yêu cầu nghề nghiệp
                        isAccepttedRequest = true
                        game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_REQUEST_ANSWER), nx_int(request_type), request_player, nx_int(1))
                        nx_pause(0.4)
                        local formtmp = nx_value("form_stage_main\\form_life\\form_job_share_confirm")
                        if nx_is_valid(formtmp) and formtmp.Visible == true then
                            nx_execute("form_stage_main\\form_life\\form_job_share_confirm", "on_btn_ok_click", formtmp.btn_ok)
                        end
                        break
					end
				end
			end
            if isAccepttedRequest == true then
                nx_execute(FORM_MAIN_REQUEST, "clear_request")
                nx_function("ext_flash_window")
                --on_main_form_close(form)
                --return false
            end
        end
        
        -- Dừng một lát trước khi chạy lại
        nx_pause(1)
    end
end

----------------------------------------------------
-- Auto do thám DATA
local TVT_TYPE_CITAN = 7
local HOMEPOINT_INI_FILE = "share\\Rule\\HomePoint.ini"

local array_spy_task_title = {
    "title_52001", "title_52002", "title_52003", "title_52004", "title_52005", "title_52006", "title_52007", "title_52008",
    "title_52030", "title_52031", "title_52032", "title_52033", "title_52034", "title_52035", "title_52082",
    "title_52009", -- VMP
    "title_52051", -- HDM
    "title_52052", -- TPTC
    "title_52055", -- Niệm La
    "title_52057", -- Cổ Mộ
    "title_52053", -- Hoa Sơn
    "title_52054", -- Ngũ Tiên
    "title_52056", -- Thần Thủy
    "title_52058" -- Đạt Ma
}
local data_map_spy = {}
data_map_spy["specialinfo_578"] = {"school01", "ini\\scene\\scene_school01"}
data_map_spy["specialinfo_579"] = {"school02", "ini\\scene\\scene_school02"}
data_map_spy["specialinfo_580"] = {"school03", "ini\\scene\\scene_school03"}
data_map_spy["specialinfo_581"] = {"school04", "ini\\scene\\scene_school04"}
data_map_spy["specialinfo_582"] = {"school05", "ini\\scene\\scene_school05"}
data_map_spy["specialinfo_583"] = {"school06", "ini\\scene\\scene_school06"}
data_map_spy["specialinfo_584"] = {"school07", "ini\\scene\\scene_school07"}
data_map_spy["specialinfo_585"] = {"school08", "ini\\scene\\scene_school08"}
--data_map_spy["specialinfo_585"] = {"school20", "ini\\scene\\scene_school08"}

-- Điểm dừng chân phái
local array_homepoint_allowed = {}
array_homepoint_allowed["school_shaolin"] = "HomePointschool08D" -- TL
array_homepoint_allowed["school_wudang"] = "HomePointschool07E" -- VD
array_homepoint_allowed["school_gaibang"] = "HomePointschool02B" -- CB
array_homepoint_allowed["school_tangmen"] = "HomePointschool05A" -- DM
array_homepoint_allowed["school_emei"] = "HomePointschool06C" -- NM
array_homepoint_allowed["school_jinyiwei"] = "HomePointschool01A" -- CYV
array_homepoint_allowed["school_jilegu"] = "HomePointschool04A" -- CLC
array_homepoint_allowed["school_junzitang"] = "HomePointschool03A" -- QTD
array_homepoint_allowed["school_mingjiao"] = "HomePointschool20A" -- MG

array_homepoint_allowed["newschool_shenshui"] = "HomePointschool19A" -- Thần Thủy

array_homepoint_allowed["force_xujia"] = "HomePointcity05F" -- Từ Gia Trang

-- Điểm thần hành để đi do thám phái
local array_homepoint_spy = {}
array_homepoint_spy["school01"] = "HomePointschool01B" -- TL
array_homepoint_spy["school02"] = "HomePointschool02A" -- CB
array_homepoint_spy["school03"] = "HomePointschool03B" -- QTD
array_homepoint_spy["school04"] = "HomePointschool04B" -- CLC
array_homepoint_spy["school05"] = "HomePointschool05B" -- DM
array_homepoint_spy["school06"] = "HomePointschool06D" -- NM
array_homepoint_spy["school07"] = "HomePointschool07B" -- VD
array_homepoint_spy["school08"] = "HomePointschool08B" -- TL
array_homepoint_spy["school20"] = "HomePointschool20B" -- MG

-- Phái
local array_unique_school = {}
array_unique_school["school_shaolin"] = "school_shaolin" -- TL
array_unique_school["school_wudang"] = "school_wudang" -- VD
array_unique_school["school_gaibang"] = "school_gaibang" -- CB
array_unique_school["school_tangmen"] = "school_tangmen" -- DM
array_unique_school["school_emei"] = "school_emei" -- NM
array_unique_school["school_jinyiwei"] = "school_jinyiwei" -- CYV
array_unique_school["school_jilegu"] = "school_jilegu" -- CLC
array_unique_school["school_junzitang"] = "school_junzitang" -- QTD
array_unique_school["school_mingjiao"] = "school_mingjiao" -- MG

array_unique_school["newschool_gumu"] = "school_wudang" -- Cổ Mộ -> VĐ
array_unique_school["newschool_xuedao"] = "school_jinyiwei" -- Huyết Đao -> CYV
array_unique_school["newschool_huashan"] = "school_junzitang" -- Hoa Sơn -> QTĐ
array_unique_school["newschool_damo"] = "school_shaolin" -- Đạt Ma -> Thiếu Lâm
array_unique_school["newschool_shenshui"] = "school_emei" -- Thần Thủy -> Nga Mi
array_unique_school["newschool_changfeng"] = "school_gaibang" -- Trường Phong -> Cái Bang
array_unique_school["newschool_nianluo"] = "school_tangmen" -- Niệm La -> ĐM
array_unique_school["newschool_wuxian"] = "school_jilegu" -- Ngũ Tiên -> CLC

array_unique_school["force_xujia"] = "force_xujia" -- Từ Gia Trang

-- Map phái, ẩn thế vẫn là map đại phái
local array_home_map = {}
array_home_map["school_shaolin"] = "school08" -- TL
array_home_map["school_wudang"] = "school07" -- VD
array_home_map["school_gaibang"] = "school02" -- CB
array_home_map["school_tangmen"] = "school05" -- DM
array_home_map["school_emei"] = "school06" -- NM
array_home_map["school_jinyiwei"] = "school01" -- CYV
array_home_map["school_jilegu"] = "school04" -- CLC
array_home_map["school_junzitang"] = "school03" -- QTD
array_home_map["school_mingjiao"] = "school20" -- MG

array_home_map["newschool_gumu"] = "school07" -- Cổ Mộ -> VĐ
array_home_map["newschool_xuedao"] = "school01" -- Huyết Đao -> CYV
array_home_map["newschool_huashan"] = "school03" -- Hoa Sơn -> QTĐ
array_home_map["newschool_damo"] = "school08" -- Đạt Ma -> Thiếu Lâm
array_home_map["newschool_shenshui"] = "school06" -- Thần Thủy -> Nga Mi
array_home_map["newschool_changfeng"] = "school02" -- Trường Phong -> Cái Bang
array_home_map["newschool_nianluo"] = "school05" -- Niệm La -> ĐM
array_home_map["newschool_wuxian"] = "school04" -- Ngũ Tiên -> CLC

array_home_map["force_xujia"] = "city05" -- Từ Gia Trang -> Thành Đô

-- Map phái, ẩn thế vẫn là map đại phái
local array_home_unique_map = {}
array_home_unique_map["school_shaolin"] = "school08" -- TL
array_home_unique_map["school_wudang"] = "school07" -- VD
array_home_unique_map["school_gaibang"] = "school02" -- CB
array_home_unique_map["school_tangmen"] = "school05" -- DM
array_home_unique_map["school_emei"] = "school06" -- NM
array_home_unique_map["school_jinyiwei"] = "school01" -- CYV
array_home_unique_map["school_jilegu"] = "school04" -- CLC
array_home_unique_map["school_junzitang"] = "school03" -- QTD
array_home_unique_map["school_mingjiao"] = "school20" -- MG

array_home_unique_map["newschool_gumu"] = "school14" -- Cổ Mộ -> VĐ
array_home_unique_map["newschool_xuedao"] = "school13" -- Huyết Đao -> CYV
array_home_unique_map["newschool_huashan"] = "school17" -- Hoa Sơn -> QTĐ
array_home_unique_map["newschool_damo"] = "school08" -- Đạt Ma -> Thiếu Lâm
array_home_unique_map["newschool_shenshui"] = "school19" -- Thần Thủy -> Nga Mi
array_home_unique_map["newschool_changfeng"] = "school02" -- Trường Phong -> Cái Bang
array_home_unique_map["newschool_nianluo"] = "school15" -- Niệm La -> ĐM
array_home_unique_map["newschool_wuxian"] = "school04" -- Ngũ Tiên -> CLC

array_home_unique_map["force_xujia"] = "city05" --Từ Gia Trang -> Thành Đô

-- Dữ liệu nói chuyện với chưởng môn
local array_data_task = {}
-- CLC
array_data_task["school_jilegu"] = {
    npc = "WorldNpc03816",
    data = {}
}
array_data_task["school_jilegu"]["data"]["school01"] = {841000706, 841003703, 841003704, 840003704} -- CYV
array_data_task["school_jilegu"]["data"]["school02"] = {841000706, 841003703, 841003705, 840003705} -- CB
array_data_task["school_jilegu"]["data"]["school03"] = {841000706, 841003703, 841003706, 840003706} -- QTD
array_data_task["school_jilegu"]["data"]["school05"] = {841000706, 841003703, 841003707, 840003707} -- DM
array_data_task["school_jilegu"]["data"]["school06"] = {841000706, 841003703, 841003708, 840003708} -- NM
array_data_task["school_jilegu"]["data"]["school07"] = {841000706, 841003703, 841003709, 840003709} -- VD
array_data_task["school_jilegu"]["data"]["school08"] = {841000706, 841003703, 841003710, 840003710} -- TL

-- QTD
array_data_task["school_junzitang"] = {
    npc = "WorldNpc03305",
    data = {}
}
array_data_task["school_junzitang"]["data"]["school01"] = {841003744, 841003695, 841003696, 840003696} -- CYV
array_data_task["school_junzitang"]["data"]["school02"] = {841003744, 841003695, 841003697, 840003697} -- CB
array_data_task["school_junzitang"]["data"]["school04"] = {841003744, 841003695, 841003698, 840003698} -- CLC
array_data_task["school_junzitang"]["data"]["school05"] = {841003744, 841003695, 841003699, 840003699} -- DM
array_data_task["school_junzitang"]["data"]["school06"] = {841003744, 841003695, 841003700, 840003700} -- NM
array_data_task["school_junzitang"]["data"]["school07"] = {841003744, 841003695, 841003701, 840003701} -- VD
array_data_task["school_junzitang"]["data"]["school08"] = {841003744, 841003695, 841003702, 840003702} -- TL

-- DM
array_data_task["school_tangmen"] = {
    npc = "WorldNpc02203",
    data = {}
}
array_data_task["school_tangmen"]["data"]["school01"] = {841000941, 841003711, 841003712, 840003712} -- CYV
array_data_task["school_tangmen"]["data"]["school02"] = {841000941, 841003711, 841003713, 840003713} -- CB
array_data_task["school_tangmen"]["data"]["school03"] = {841000941, 841003711, 841003714, 840003714} -- QTD
array_data_task["school_tangmen"]["data"]["school04"] = {841000941, 841003711, 841003715, 840003715} -- CLC
array_data_task["school_tangmen"]["data"]["school06"] = {841000941, 841003711, 841003716, 840003716} -- NM
array_data_task["school_tangmen"]["data"]["school07"] = {841000941, 841003711, 841003717, 840003717} -- VD
array_data_task["school_tangmen"]["data"]["school08"] = {841000941, 841003711, 841003718, 840003718} -- TL

-- CB
array_data_task["school_gaibang"] = {
    npc = "WorldNpc03003",
    data = {}
}
array_data_task["school_gaibang"]["data"]["school01"] = {841002393, 841003687, 841003688, 840003688} -- CYV
array_data_task["school_gaibang"]["data"]["school03"] = {841002393, 841003687, 841003689, 840003689} -- QTD
array_data_task["school_gaibang"]["data"]["school04"] = {841002393, 841003687, 841003690, 840003690} -- CLC
array_data_task["school_gaibang"]["data"]["school05"] = {841002393, 841003687, 841003691, 840003691} -- DM
array_data_task["school_gaibang"]["data"]["school06"] = {841002393, 841003687, 841003692, 840003692} -- NM
array_data_task["school_gaibang"]["data"]["school07"] = {841002393, 841003687, 841003693, 840003693} -- VD
array_data_task["school_gaibang"]["data"]["school08"] = {841002393, 841003687, 841003694, 840003694} -- TL

-- CYV
array_data_task["school_jinyiwei"] = {
    npc = "worldnpc04101",
    data = {}
}
array_data_task["school_jinyiwei"]["data"]["school02"] = {841002210, 841003676, 841003677, 840003677} -- CB
array_data_task["school_jinyiwei"]["data"]["school03"] = {841002210, 841003676, 841003678, 840003678} -- QTD
array_data_task["school_jinyiwei"]["data"]["school04"] = {841002210, 841003676, 841003679, 840003679} -- CLC
array_data_task["school_jinyiwei"]["data"]["school05"] = {841002210, 841003676, 841003680, 840003680} -- DM
array_data_task["school_jinyiwei"]["data"]["school06"] = {841002210, 841003676, 841003681, 840003681} -- NM
array_data_task["school_jinyiwei"]["data"]["school07"] = {841002210, 841003676, 841003682, 840003682} -- VD
array_data_task["school_jinyiwei"]["data"]["school08"] = {841002210, 841003676, 841003683, 840003683} -- TL

-- TL
array_data_task["school_shaolin"] = {
    npc = "WorldNpc00212",
    data = {}
}
array_data_task["school_shaolin"]["data"]["school01"] = {841003369, 841003736, 841003737, 840003737} -- CYV
array_data_task["school_shaolin"]["data"]["school02"] = {841003369, 841003736, 841003738, 840003738} -- CB
array_data_task["school_shaolin"]["data"]["school03"] = {841003369, 841003736, 841003739, 840003739} -- QTD
array_data_task["school_shaolin"]["data"]["school04"] = {841003369, 841003736, 841003740, 840003740} -- CLC
array_data_task["school_shaolin"]["data"]["school05"] = {841003369, 841003736, 841003741, 840003741} -- DM
array_data_task["school_shaolin"]["data"]["school06"] = {841003369, 841003736, 841003742, 840003742} -- NM
array_data_task["school_shaolin"]["data"]["school07"] = {841003369, 841003736, 841003743, 840003743} -- VD

-- MG
array_data_task["school_mingjiao"] = {
    npc = "newmp_mj_001",
    data = {}
}
array_data_task["school_mingjiao"]["data"]["school01"] = {841009273, 841009274, 841009276, 840009276} -- CYV
array_data_task["school_mingjiao"]["data"]["school02"] = {841009273, 841009274, 841009277, 840009277} -- CB
array_data_task["school_mingjiao"]["data"]["school03"] = {841009273, 841009274, 841009278, 840009278} -- QTD
array_data_task["school_mingjiao"]["data"]["school04"] = {841009273, 841009274, 841009279, 840009279} -- CLC
array_data_task["school_mingjiao"]["data"]["school05"] = {841009273, 841009274, 841009280, 840009280} -- DM
array_data_task["school_mingjiao"]["data"]["school06"] = {841009273, 841009274, 841009281, 840009281} -- NM
array_data_task["school_mingjiao"]["data"]["school07"] = {841009273, 841009274, 841009282, 840009282} -- VD
array_data_task["school_mingjiao"]["data"]["school08"] = {841009273, 841009274, 841009283, 840009283} -- TL

-- NM
array_data_task["school_emei"] = {
    npc = "WorldNpc02604",
    data = {}
}
array_data_task["school_emei"]["data"]["school01"] = {841003745, 841003720, 841003721, 840003721} -- CYV
array_data_task["school_emei"]["data"]["school02"] = {841003745, 841003720, 841003722, 840003722} -- CB
array_data_task["school_emei"]["data"]["school03"] = {841003745, 841003720, 841003723, 840003723} -- QTD
array_data_task["school_emei"]["data"]["school04"] = {841003745, 841003720, 841003724, 840003724} -- CLC
array_data_task["school_emei"]["data"]["school05"] = {841003745, 841003720, 841003725, 840003725} -- DM
array_data_task["school_emei"]["data"]["school07"] = {841003745, 841003720, 841003726, 840003726} -- VD
array_data_task["school_emei"]["data"]["school08"] = {841003745, 841003720, 841003727, 840003727} -- TL

-- Từ Gia Trang
array_data_task["force_xujia"] = {
    npc = "WorldNpc09796",
    data = {}
}
array_data_task["force_xujia"]["data"]["school01"] = {841005597, 841005598, 841005599, 840005599} -- CYV
array_data_task["force_xujia"]["data"]["school02"] = {841005597, 841005598, 841005600, 840005600} -- CB
array_data_task["force_xujia"]["data"]["school03"] = {841005597, 841005598, 841005601, 840005601} -- QTD
array_data_task["force_xujia"]["data"]["school04"] = {841005597, 841005598, 841005602, 840005602} -- CLC
array_data_task["force_xujia"]["data"]["school05"] = {841005597, 841005598, 841005603, 840005603} -- DM
array_data_task["force_xujia"]["data"]["school06"] = {841005597, 841005598, 841005604, 840005604} -- NM
array_data_task["force_xujia"]["data"]["school07"] = {841005597, 841005598, 841005605, 840005605} -- VD
array_data_task["force_xujia"]["data"]["school08"] = {841005597, 841005598, 841005606, 840005606} -- TL

-- VD
array_data_task["school_wudang"] = {
    npc = "WorldNpc04401",
    data = {}
}
array_data_task["school_wudang"]["data"]["school01"] = {841003272, 841003728, 841003729, 840003729} -- CYV
array_data_task["school_wudang"]["data"]["school02"] = {841003272, 841003728, 841003730, 840003730} -- CB
array_data_task["school_wudang"]["data"]["school03"] = {841003272, 841003728, 841003731, 840003731} -- QTD
array_data_task["school_wudang"]["data"]["school04"] = {841003272, 841003728, 841003732, 840003732} -- CLC
array_data_task["school_wudang"]["data"]["school05"] = {841003272, 841003728, 841003733, 840003733} -- DM
array_data_task["school_wudang"]["data"]["school06"] = {841003272, 841003728, 841003734, 840003734} -- NM
array_data_task["school_wudang"]["data"]["school08"] = {841003272, 841003728, 841003735, 840003735} -- TL

-- Dữ liệu nói chuyện trả Q
local array_data_complete = {}
-- CLC
array_data_complete["school_jilegu"] = {
    npc = "spynpc_jlg",
    list = {501, 502}
}
-- QTD
array_data_complete["school_junzitang"] = {
    npc = "spynpc_jzt",
    list = {501, 502}
}
-- DM
array_data_complete["school_tangmen"] = {
    npc = "spynpc_tm",
    list = {501, 502}
}
-- DM
array_data_complete["school_gaibang"] = {
    npc = "spynpc_gb",
    list = {501, 502}
}
-- CYV
array_data_complete["school_jinyiwei"] = {
    npc = "spynpc_jyw",
    list = {501, 502}
}
-- TL
array_data_complete["school_shaolin"] = {
    npc = "spynpc_sl",
    list = {501, 502}
}
-- MG
array_data_complete["school_mingjiao"] = {
    npc = "spynpc_mj",
    list = {501, 502}
}
-- NM
array_data_complete["school_emei"] = {
    npc = "spynpc_em",
    list = {501, 502}
}
-- Thần Thủy Cung
array_data_complete["newschool_shenshui"] = {
    npc = "spynpc_ssg",
    list = {501, 502}
}
-- Từ Gia Trang
array_data_complete["force_xujia"] = {
    npc = "spynpc_xjz",
    list = {10022}
}
-- VD
array_data_complete["school_wudang"] = {
    npc = "spynpc_wd",
    list = {501, 502}
}

-- Tọa độ sẽ đi đến để lấy tình báo
local array_pos_spy = {}
array_pos_spy["school01"] = {333, -10000, -61} -- CYV
array_pos_spy["school02"] = {534, -10000, 375} -- CB
array_pos_spy["school03"] = {492, -10000, 487} -- QTD
array_pos_spy["school04"] = {159, -10000, -94} -- CLC
array_pos_spy["school05"] = {1118, -10000, -203} -- DM
array_pos_spy["school06"] = {488, -10000, 194} -- NM
array_pos_spy["school07"] = {479, -10000, 446} -- VD
array_pos_spy["school08"] = {836, -10000, 312} -- TL

-- Dữ liệu nói chuyện để từ ẩn thế về đại phái
local array_data_task_tobaseschool = {}
-- Thần Thủy Cung
array_data_task_tobaseschool["newschool_shenshui"] = {
    npc = "offline_chuansong_ssg01",
    data = {841007890, 840007890}
}

function get_spy_task_id()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local taskmgr = nx_value("TaskManager")
    if not nx_is_valid(taskmgr) then
        return false
    end
    
    local task_index = 2 -- Nhiệm vụ hành tẩu giang hồ
    local table_task = taskmgr:GetTaskByType(task_index, 0)
    local total = table.getn(table_task) -- Total này step = 2 tức ra 4 kết quả thì có 2 nhiệm vụ
    local rpt_level = 1
    local rows = client_player:FindRecordRow("Repute_Record", 0, nx_string("repute_jianghu"), 0)
    if rows >= 0 then
        rpt_level = client_player:QueryRecord("Repute_Record", rows, 2)
    end

    for i = 1, total, 2 do
        local task_id = table_task[i]
        local task_line = table_task[i + 1] -- Loại nhiệm vụ ví dụ nhiệm vụ Sư Môn, Phong Vân Giang Hồ...
        
        local task_row = client_player:FindRecordRow("Task_Accepted", accept_rec_id, nx_int(task_id))
        if task_row < 0 then
            return false
        end
        if nx_number(task_line) == nx_number(task_line_shimen_new) then
            task_line = task_line_wuxue
        end
        
        -- Trạng thái Q: 0 là đang thực hiện, 2 là có thể trả Q, 1 là thất bại
        local state = nx_execute("form_stage_main\\form_task\\form_task_main", "get_task_complete_state", task_id)
        -- Tiêu đề nhiệm vụ
        local title_id = client_player:QueryRecord("Task_Accepted", task_row, accept_rec_title)

        if in_array(title_id, array_spy_task_title) then
            return {task_id, task_row, state, title_id}
        end
    end
    return false
end

-- Nếu là ẩn thế thì trả về phái ẩn thế không thì trả về đại phái
-- Nếu là thế lực thì trả về thế lực
function get_player_realschool()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local sh = client_player:QueryProp("NewSchool")
    if sh == 0 then
        local force = client_player:QueryProp("Force")
        if force == 0 then
            return client_player:QueryProp("School")
        end
        return force
    end
    return sh
end

-- Trả về đại phái, nếu ẩn thế thì trả về đại phái liên quan
-- Nếu là thế lực thì trả về thế lực
function get_player_uniqueschool()
    return array_unique_school[get_player_realschool()]
end

-- Có phải ẩn thế hay không
function is_player_hideschool()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local sh = client_player:QueryProp("NewSchool")
    if sh == 0 then
        return false
    end
    return true
end

-- Hiển thị danh sách các phái cần do thám vào bảng thông tin
function show_spy_task_detail(task_data)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local taskmgr = nx_value("TaskManager")
    if not nx_is_valid(taskmgr) then
        return false
    end
    local task_id = task_data[1]
    local task_row = task_data[2]
    -- Mục tiêu nhiệm vụ
    local desc_short = client_player:QueryRecord("Task_Accepted", task_row, accept_rec_target)
    local str_schedule = taskmgr:GetTaskScheduleInfo(nx_int(task_id), 0)
    local table_schdule = util_split_string(str_schedule, ";")
    for i, schdule in pairs(table_schdule) do
        local table_para = util_split_string(schdule, "|")
        if table.getn(table_para) == 6 then
            local desc_format = nx_widestr("- ") .. nx_widestr(util_text(table_para[1])) .. nx_widestr(" (") .. nx_widestr(table_para[2]) .. nx_widestr("/") .. nx_widestr(table_para[3]) .. nx_widestr(")")
            form.mltbox_content:AddHtmlText(desc_format, -1)
        end
    end
end

-- Xác định phái tiếp theo cần do thám
function get_map_spy(task_data)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local taskmgr = nx_value("TaskManager")
    if not nx_is_valid(taskmgr) then
        return false
    end
    local task_id = task_data[1]
    local task_row = task_data[2]
    local str_schedule = taskmgr:GetTaskScheduleInfo(nx_int(task_id), 0)
    local table_schdule = util_split_string(str_schedule, ";")
    
    for i, schdule in pairs(table_schdule) do
        local table_para = util_split_string(schdule, "|")
        if table.getn(table_para) == 6 then
            if nx_int(table_para[2]) < nx_int(table_para[3]) and data_map_spy[table_para[1]] ~= nil then
                return data_map_spy[table_para[1]]
            end
        end
    end
    return false
end

-- Kiểm tra sắp skill ma khí tung hoành đúng ô
function check_valid_skill_mkth()
    local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
    local grid = form.grid_shortcut_2
    local gindex = 7
    --grid:SetSelectItemIndex(nx_int(gindex))
    --nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_useitem", grid, gindex, true)
    if nx_widestr(grid:GetItemName(gindex)) ~= util_text("cs_jh_tmjt06") then
        return false
    end
    return true
end

-- Kiểm tra hồi thành điều dưỡng ở phái
function check_releave_home()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end
    local form_home_point = nx_value("form_home_point")
    if not nx_is_valid(form_home_point) then
        return false
    end
    local relive_positon_name = "RelivePositon"
    if form_home_point:IsNewTerritoryType() then
        relive_positon_name = "DongHaiRelivePositon"
    end
    if not client_player:FindProp(relive_positon_name) then
        return false
    end
    local rl_pos_info = client_player:QueryProp(relive_positon_name)
    local relive_lst = nx_function("ext_split_string", rl_pos_info, ",")
    if relive_lst[7] == array_homepoint_allowed[get_player_realschool()] then
        return true
    end
    return false
end

-- Lấy số điểm dừng chân giang hồ đã mở
function get_max_JiangHuHomePoint()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return 0
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return 0
    end
    return client_player:QueryProp("JiangHuHomePointCount")
end

function get_type_homepoint(type_name)
    local ini = nx_execute("util_functions", "get_ini", HOMEPOINT_INI_FILE)
    if not nx_is_valid(ini) then
        return "", ""
    end
    local index = ini:FindSectionIndex(nx_string(type_name))
    if index < 0 then
        return "", ""
    end
    local hp = ini:ReadString(index, "Type", "")
    local htext = ini:ReadString(index, "Name", "")
    return hp, htext
end

function send_homepoint_msg_to_server(...)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return
    end
    game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_SET_HOMEPOINT), unpack(arg))
end

-- Thần hành về điểm thần hành XXX
function MoveToMapByHomePoint(hp)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return 0
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return 0
    end
    -- Kiểm tra điểm dừng chân chưa tồn tại thì thêm vào
    local IsExists = false
    local HomePointCount = client_player:GetRecordRows("HomePointList")
    for i = 0, HomePointCount - 1 do
        if hp == client_player:QueryRecord("HomePointList", i, 0) then
            IsExists = true
            break
        end
    end
    if not IsExists then
        -- Xác định số điểm dừng chân đã mở
        local Max1 = client_player:QueryProp("JiangHuHomePointCount")
        if Max1 >= 2 then
            local Max2 = client_player:QueryProp("SchoolHomePointCount")
            local Max = Max1 + Max2
            -- Xác định điểm dừng chân giang hồ cuối cùng
            local LastHomePoint = ""
            local LastHomePointText = nx_widestr("")
            local CountJiangHuHomePoint = 0
            for i = 0, Max do
                local _hp = client_player:QueryRecord("HomePointList", i, 0)
                if _hp == 0 then
                    break
                end
                local typename, htext = get_type_homepoint(_hp)
                if typename == "0" or typename == "1" then
                    LastHomePoint = _hp
                    LastHomePointText = util_text(nx_string(htext))
                    CountJiangHuHomePoint = CountJiangHuHomePoint + 1
                end
            end
            -- Xóa cái điểm dừng chân cuối cùng đi
            if CountJiangHuHomePoint > 1 and LastHomePoint ~= "" then
                tools_show_notice(nx_function("ext_utf8_to_widestr", "Xóa điểm dừng chân: ") .. LastHomePointText)
                send_homepoint_msg_to_server(3, LastHomePoint) -- 3: Xóa điểm dừng chân
                nx_pause(0.5)
            end
            local typename, htext = get_type_homepoint(hp)
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Thêm điểm dừng chân: ") .. util_text(nx_string(htext)))
            send_homepoint_msg_to_server(2, hp) -- 2: Thêm điểm dừng chân
            nx_pause(0.5)
        end
    end

    send_homepoint_msg_to_server(1, hp, 4) -- 1: Trở về điểm dừng chân 4: Điểm dừng chân giang hồ
    return os.time()
end

-- Xác định MAP phái của người chơi
-- Nếu là ẩn thế thì sẽ vẫn cho về đại phái
function get_player_home_map()
    return array_home_map[get_player_realschool()]
end

-- Xác định MAP phái của người chơi
-- Nếu là ẩn thế thì trả về MAP ẩn thế
-- Nếu ko là ẩn thế thì về đại phái
function get_player_home_uniquemap()
    return array_home_unique_map[get_player_realschool()]
end

-- Tự tử
function suicidePlayer()
    if get_buff_info("buf_riding_01") ~= nil then
        nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
        nx_pause(0.2)
    end
    if get_buff_info("buf_CS_jh_tmjt06") == nil then
        local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
        local grid = form.grid_shortcut_2
        local gindex = 7
        
        grid:SetSelectItemIndex(nx_int(gindex))
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_useitem", grid, gindex, true)
        nx_pause(4)
        
        local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
        local grid = form.grid_shortcut_ng

        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_lmouse_click", grid, 0)
        nx_pause(3)
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_lmouse_click", grid, 1)
    end
end

-- Chết
function isPlayerDead()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    if player_client:QueryProp("LogicState") == 120 then
        return true
    end
    return false
end

-- Xác định số tình báo đã lấy được
function get_num_pryed()
    -- Mở túi đồ lên
    local form_bag = nx_value("form_stage_main\\form_bag")
    if not nx_is_valid(form_bag) or form_bag.Visible == false then
        util_auto_show_hide_form("form_stage_main\\form_bag")
        nx_pause(0.1)
        form_bag = nx_value("form_stage_main\\form_bag")
    end
    if not nx_is_valid(form_bag) or not form_bag.Visible then
        return 0
    end
    -- Kích hoạt cái túi nhiệm vụ
    if not form_bag.rbtn_task.Checked then
        form_bag.rbtn_task.Checked = true
    end
    local goods_grid = nx_value("GoodsGrid")
    if not nx_is_valid(goods_grid) then
        return 0
    end
    -- Xác định vị trí Item Tín Vật
    local grid, grid_index = goods_grid:GetToolBoxGridAndPos("pry_item")
    if not nx_is_valid(grid) or grid == nil then
        return 0
    end
    local game_client = nx_value("game_client")
    local toolbox_view = game_client:GetView(nx_string(grid.typeid))
    if not nx_is_valid(toolbox_view) then
        return 0
    end
    local bind_index = grid:GetBindIndex(grid_index)
    local viewobj = toolbox_view:GetViewObj(nx_string(bind_index))
    if not nx_is_valid(viewobj) then
        return 0
    end
    return viewobj:GetRecordRows("InteractList")
end

-- Dữ liệu nói chuyện để đến map spy
function get_data_task()
    return array_data_task[get_player_uniqueschool()]
end

-- Dữ liệu nói chuyện để trả Q
function get_data_complete()
    return array_data_complete[get_player_realschool()]
end

-- Dữ liệu nói chuyện để về Đại Phái từ ẩn thế
function get_data_task_tobaseschool()
    return array_data_task_tobaseschool[get_player_realschool()]
end

-- Xác định MAP phái của người chơi
function get_player_name()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nx_widestr("")
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return nx_widestr("")
    end
    return nx_widestr(client_player:QueryProp("Name"))
end

-- Di chuyển tới vị trí
-- Nếu trigger di chuyển thì trả về false
-- Nếu không trigger thì trả về true
function tools_move_new(scene, x, y, z, passtest)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return true
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return true
	end
	if passtest ~= nil and passtest == true then
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu tìm đường"))
		nx_value("path_finding"):FindPathScene(scene, x, y, z, 0)
		return false
	end
	local beforeX = string.format("%.3f", game_player.PositionX)
	local beforeY = string.format("%.3f", game_player.PositionY)
	local beforeZ = string.format("%.3f", game_player.PositionZ)
	nx_pause(0.4)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return true
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return true
	end    
	local afterX = string.format("%.3f", game_player.PositionX)
	local afterY = string.format("%.3f", game_player.PositionY)
	local afterZ = string.format("%.3f", game_player.PositionZ)

	local pxd = beforeX - afterX
	local pyd = beforeY - afterY
	local pzd = beforeZ - afterZ

  	local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
  	if distance <= 0.6 then
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu tìm đường"))
		nx_value("path_finding"):FindPathScene(scene, x, y, z, 0)
        return false
  	end
    return true
end

local homePointTimeout = 620

-- Thời gian đánh dấu đang load
local last_loading_time = 0
-- Lần sử dụng thần hành cuối
local last_use_homepoint = 0
-- Lần nhận nhiệm vụ do thám cuối
local last_start_spy = 0
-- Số trigger di chuyển từ thời điểm cuối
local start_move_count = 0
-- Tên các con đệ tử tình báo bỏ qua
local ignore_intelligence_npc = {}
-- Thời gian sử dụng skill tình báo cuối
local last_use_skill = 0
-- Đánh dấu tìm thấy NPC mới thì bắt đầu chạy lại
local last_npc_ident = 0

-- Phát hiện con đệ tử tình báo để chạy lại
function detect_intelligence_npc()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false, false
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return false, false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false, false
    end
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                if obj:QueryProp("Type") == 2 and obj:QueryProp("OffLineState") == 1 and obj:QueryProp("OfflineTypeTvT") == 5 and not in_array(obj:QueryProp("Name"), ignore_intelligence_npc) then
                    return obj, visualObj
                end
            end
        end
    end
    return false, false
end

-- Lấy tình báo từ NPC
-- Nếu skill đang hồi trả về false
-- Nếu lấy thành công trả về true
function get_spy_from_npc()
    local mgr = nx_value("InteractManager")
    if not nx_is_valid(mgr) then
        return false
    end
    local tvttype = mgr:GetCurrentTvtType()
    local skill = mgr:GetTvtSkill(tvttype, 0)
    local cooltm = mgr:GetTvtSkillCoolTm(tvttype, 0)
    if tools_difftime(last_use_skill) > (cooltm + 2) then
        send_server_msg(g_msg_useskill, tvttype, nx_string(skill))
        return true
    end
    return false
end

-- Nhấp chọn NPC
-- Trả về true nếu đã chọn
-- Trả về false và tự chọn NPC
function control_select_npc(npc)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    local select_target_ident = player_client:QueryProp("LastObject")
    local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
    if not nx_is_valid(npc) then
        return false
    end
    if nx_is_valid(select_target) and nx_string(npc.Ident) == nx_string(select_target_ident) then
        return true
    end
    nx_execute("custom_sender", "custom_select", npc.Ident)
    return false
end

----------------------------------------------------
-- Auto do thám

function auto_run_spy()
    last_loading_time = 0
    last_use_homepoint = 0
    last_start_spy = 0
    start_move_count = 0
    ignore_intelligence_npc = {}
    last_use_skill = 0
    last_npc_ident = 0
    
    while auto_is_running_spy == true do
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			reset_all_btns("---")
            return false
		end

        form.mltbox_content:Clear()

        -- Xác định dữ liệu nhiệm vụ do thám
        local task_data = get_spy_task_id()
        if task_data == false then
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Chưa có nhiệm vụ tình báo, hãy nhận nhiệm vụ trước rồi mới bắt đầu</font>"), -1)
            reset_all_btns("---")
            return false
        end
        local text = nx_widestr("<font color=\"#12bc00\">") .. util_text(task_data[4]) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "NV: ") .. text, -1)

        -- Hiển thị chi tiết nhiệm vụ tình báo
        show_spy_task_detail(task_data)

        -- Xác định phái tiếp theo cần do thám
        local spy_map = get_map_spy(task_data)
        if spy_map == false then
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Không còn phái nào để do thám nữa, có thể nhiệm vụ đã hoàn thành, hãy trả nhiệm vụ</font>"), -1)
            reset_all_btns("---")
            nx_execute("custom_sender", "custom_chat", nx_int(CHATTYPE_GUILD), get_player_name() .. nx_function("ext_utf8_to_widestr", " đã kết thúc Q do thám"))
            return false
        end
        local text = nx_function("ext_utf8_to_widestr", "MAP sẽ do thám tiếp theo: <font color=\"#12bc00\">") .. util_text(spy_map[2]) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text, -1)
        local text = nx_function("ext_utf8_to_widestr", "MAP hiện tại đang đứng: <font color=\"#12bc00\">") .. util_text(get_current_map(true)) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text, -1)

        local mgr = nx_value("InteractManager")
        if not nx_is_valid(mgr) then
            reset_all_btns("---")
            return false
        end

        -- Lấy số lần đã tham gia
        local tvttype = nx_int(0)
        -- infoSpy[12] chữ Tham gia
        local infoSpy = mgr:GetTvtBaseInfo(tvttype)
        -- base_info[3] là số lần có thể thực hiện
        local base_info = get_interact_base_info(tvttype)
        -- Số lần đã tham gia
        local txttimes = nx_int(mgr:GetInteractTime(tvttype))
        local tvtcount = nx_int(base_info[3])

        local text = nx_function("ext_utf8_to_widestr", "Do thám hôm nay: <font color=\"#12bc00\">") .. nx_widestr(txttimes) .. nx_widestr("/") .. nx_widestr(tvtcount) .. nx_function("ext_utf8_to_widestr", " lần</font>")
        form.mltbox_content:AddHtmlText(text, -1)

        if txttimes >= tvtcount then
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Hôm nay do thám đã đủ, ngày mai lại tiếp tục</font>"), -1)
            reset_all_btns("---")
            nx_execute("custom_sender", "custom_chat", nx_int(CHATTYPE_GUILD), get_player_name() .. nx_function("ext_utf8_to_widestr", " đã do thám ngày xong"))
            return false
        end

        local GoodsGrid = nx_value("GoodsGrid")
        if not nx_is_valid(GoodsGrid) then
            reset_all_btns("---")
            return false
        end

        -- Lấy số thích thám chưởng môn lệnh còn lại
        local numCitanlingItems = GoodsGrid:GetItemCount("citanling_item")
        local text = nx_function("ext_utf8_to_widestr", "Số Chưởng Môn Lệnh còn: <font color=\"#12bc00\">") .. nx_widestr(numCitanlingItems) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text, -1)
        -- Lấy số Trực Đảo Hoàng Long còn lại
        local numQuickSpyItems = GoodsGrid:GetItemCount("item_wfqb01")
        local text = nx_function("ext_utf8_to_widestr", "Số Trực Đảo Hoàng Long còn: <font color=\"#12bc00\">") .. nx_widestr(numQuickSpyItems) .. nx_widestr("</font>")
        form.mltbox_content:AddHtmlText(text, -1)
        
        -- Số Minh Linh Đan
        local num_spy_prize_item = GoodsGrid:GetItemCount("faculty_yanwu_jhdw06")
        if num_spy_prize_item >= 250 then
            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Vui lòng để số Minh Linh Đan trong túi ít hơn 250 cái để đảm bảo do thám thành công</font>")
            form.mltbox_content:AddHtmlText(text, -1)
            reset_all_btns("---")
            return false
        end
        
        -- Kiểm tra tín vật trong túi
        -- Có tín vật tức là đang có nhiệm vụ do thám
        local num_pry_item = GoodsGrid:GetItemCount("pry_item")
        local num_pryed_item = get_num_pryed()

        -- Kiểm tra skill ma khí tung hoành đặt vào đúng vị trí
        if not check_valid_skill_mkth() then
            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Vui lòng đặt skill Ma Khí Tung Hoành vào vị trí số 8 trừ trái sang hàng skill thứ hai</font>")
            form.mltbox_content:AddHtmlText(text, -1)
            reset_all_btns("---")
            return false
        end
        
        -- Kiểm tra hồi thành điều dưỡng ở phái
        if not check_releave_home() then
            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Vui lòng thiết lập điểm hồi thành điều dưỡng ở phái</font>")
            form.mltbox_content:AddHtmlText(text, -1)
            reset_all_btns("---")
            return false
        end
        
        -- Kiểm tra mở 2 điểm dừng chân trở lên mới có thể sử dụng auto
        local MaxJiangHuHomePoint = get_max_JiangHuHomePoint()
        if MaxJiangHuHomePoint < 2 then
            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Hãy mở tối thiểu hai điểm dừng chân giang hồ mới có thể sử dụng chức năng này</font>")
            form.mltbox_content:AddHtmlText(text, -1)
            reset_all_btns("---")
            return false
        end

        -- Nếu đang load thì dừng 15s chờ load
        local stage_main_flag = nx_value("stage_main")
        local loading_flag = nx_value("loading")
        if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
            last_loading_time = os.time()
        end
        if tools_difftime(last_loading_time) > 6 then
            if get_current_map() == spy_map[1] then
                -- Đang đứng ở MAP do thám
                -- Chưa nhận nhiệm vụ thì nhận
                if num_pry_item <= 0 then
                    if tools_difftime(last_start_spy) > 190 then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang nhận Q do thám"), -1)
                        send_server_msg(g_msg_accept, tvttype, 0)
                        nx_pause(2)
                        last_start_spy = os.time()
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ hồi nhiệm vụ do thám, còn ") .. nx_widestr(190 - tools_difftime(last_start_spy)) .. nx_function("ext_utf8_to_widestr", " giây"), -1)
                    end
                elseif num_pryed_item <= 0 then
                    -- Nếu chưa lấy được tình báo nào
                    if numQuickSpyItems > 0 then
                        -- Sử dụng item lấy trực tiếp tình báo
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Sử dụng Item tăng tình báo"), -1)
                        -- Mở túi đồ lên
                        local form_bag = nx_value("form_stage_main\\form_bag")
                        if not nx_is_valid(form_bag) or form_bag.Visible == false then
                            util_auto_show_hide_form("form_stage_main\\form_bag")
                        else
                            if not form_bag.rbtn_tool.Checked then
                                form_bag.rbtn_tool.Checked = true
                            end
                            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "item_wfqb01")
                        end
                    else
                        -- Quét tìm đệ tử tình báo
                        local npc_obj, npc_vobj = detect_intelligence_npc()
                        if nx_is_valid(npc_obj) and nx_is_valid(npc_vobj) then
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Tình báo ") .. nx_widestr(npc_obj:QueryProp("Name")), -1)
                            if control_select_npc(npc_obj) then
                                -- Chưa cách con tình báo 5 mét thì di chuyển lại gần
                                if not tools_move_isArrived(npc_vobj.PositionX, npc_vobj.PositionY, npc_vobj.PositionZ, 5) then
                                    if last_npc_ident ~= npc_obj.Ident or not is_moving() then
                                        if nx_is_valid(npc_obj) then
                                            last_npc_ident = npc_obj.Ident
                                            tools_move(spy_map[1], npc_vobj.PositionX, npc_vobj.PositionY, npc_vobj.PositionZ, true)
                                            start_move_count = start_move_count + 1
                                            if start_move_count > 100 then
                                                start_move_count = 0
                                                suicidePlayer()
                                            end
                                            if isPlayerDead() then
                                                nx_execute("custom_sender", "custom_relive", 2, 0)
                                                nx_pause(10)
                                            end
                                        end
                                    end
                                else
                                    -- Đến gần con NPC thì dùng skill
                                    if get_spy_from_npc() then
                                        last_use_skill = os.time()
                                    end
                                    start_move_count = 0
                                end
                            end
                        else
                            last_npc_ident = 0
                            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi lấy tình báo"), -1)
                            -- Không thấy đệ tử tình báo thì đi chuyển vào MAP
                            if not is_moving() then
                                local pos_to_coming = array_pos_spy[spy_map[1]]
                                if tools_move_isArrived2D(pos_to_coming[1], pos_to_coming[2], pos_to_coming[3]) then
                                    -- Khi đi đến điểm cuối cùng mà không có thu thập được tình báo nào thì bỏ Q do thám làm lại
                                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Không lấy được tình báo nào, đang bỏ nhiệm vụ để làm lại"), -1)
                                    send_server_msg(g_msg_giveup, tvttype, 0)
                                    nx_pause(10)
                                else
                                    tools_move(spy_map[1], pos_to_coming[1], pos_to_coming[2], pos_to_coming[3], true)
                                    start_move_count = start_move_count + 1
                                    if start_move_count > 100 then
                                        start_move_count = 0
                                        suicidePlayer()
                                    end
                                    if isPlayerDead() then
                                        nx_execute("custom_sender", "custom_relive", 2, 0)
                                        nx_pause(10)
                                    end
                                end
                            end
                        end
                    end
                else
                    -- Đã có tình báo
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đã lấy được ") .. nx_widestr(num_pryed_item) .. nx_function("ext_utf8_to_widestr", " tình báo"), -1)
                    if isPlayerDead() then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang về phái"), -1)
                        nx_execute("custom_sender", "custom_relive", 0, 0)
                        nx_pause(3)
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang tự tử để về phái"), -1)
                        suicidePlayer()
                    end
                end
            elseif is_player_hideschool() and get_current_map() == get_player_home_uniquemap() then
                -- Nếu là ẩn thế, đang đứng ở MAP ẩn thế thì nói chuyện để về đại phái
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang về đại phái"), -1)
                local data_task = get_data_task_tobaseschool()
                local is_talking = false
                if not is_talking then
                    -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                    if not is_moving() and not tools_trace_npc(get_player_home_uniquemap(), data_task.npc) then
                        local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">NPC dịch chuyển tới đại phái lỗi</font>")
                        form.mltbox_content:AddHtmlText(text, -1)
                        reset_all_btns("---")
                        return false
                    end
                    local form_talk = nx_value("form_stage_main\\form_talk_movie")
                    is_talking = form_talk.Visible
                end
                if is_talking then
                    for i = 1, table.getn(data_task.data) do
                        -- Đối thoại với NPC để đến đại phái
                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", data_task.data[i])
                        nx_pause(0.4)
                    end
                    nx_pause(4)
                end
            elseif get_current_map() == get_player_home_map() and (num_pryed_item > 0 or numCitanlingItems > 0) then
                if num_pryed_item > 0 then
                    -- Đang đứng ở MAP phái và có số tình báo > 0 thì đi trả Q
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi trả Q"), -1)
                    local data_complete = get_data_complete()
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving() and not tools_trace_npc(get_player_home_map(), data_complete.npc) then
                            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">NPC trả Q lỗi</font>")
                            form.mltbox_content:AddHtmlText(text, -1)
                            reset_all_btns("---")
                            return false
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        for i = 1, table.getn(data_complete.list) do
                            -- Đối thoại với chưởng môn để đi đến MAP
                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", data_complete.list[i])
                            nx_pause(0.4)
                        end
                    end
                else
                    -- Đang đứng ở MAP phái, còn chưởng môn lệnh và chưa nhận Q thì đi gặp chưởng môn
                    local data_task = get_data_task()
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đi gặp chưởng môn để đến ") .. util_text(spy_map[2]), -1)
                    local is_talking = false
                    if not is_talking then
                        -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                        if not is_moving() and not tools_trace_npc(get_player_home_map(), data_task.npc) then
                            local text = nx_function("ext_utf8_to_widestr", "<font color=\"#ff0000\">Chưởng môn lỗi</font>")
                            form.mltbox_content:AddHtmlText(text, -1)
                            reset_all_btns("---")
                            return false
                        end
                        local form_talk = nx_value("form_stage_main\\form_talk_movie")
                        is_talking = form_talk.Visible
                    end
                    if is_talking then
                        for i = 1, table.getn(data_task.data[spy_map[1]]) do
                            -- Đối thoại với chưởng môn để đi đến MAP
                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", data_task.data[spy_map[1]][i])
                            nx_pause(0.4)
                        end
                        nx_pause(4)
                    end
                end
            elseif numCitanlingItems > 0 then
                -- Map khác và còn chưởng môn lệnh
                -- Thì về nhà bằng con đường tự tử
                if isPlayerDead() then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang về phái"), -1)
                    nx_execute("custom_sender", "custom_relive", 0, 0)
                    nx_pause(3)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang tự tử để về phái"), -1)
                    suicidePlayer()
                end
            else
                -- Map khác và hết chưởng môn lệnh
                -- Thì chờ thần hành để đến MAP do thám
                if tools_difftime(last_use_homepoint) > homePointTimeout then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Thần hành đến phái ") .. util_text(spy_map[2]), -1)
                    last_use_homepoint = MoveToMapByHomePoint(array_homepoint_spy[spy_map[1]])
                    nx_pause(8)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ hồi thần hành để đến ") .. util_text(spy_map[2]) .. nx_function("ext_utf8_to_widestr", ". Còn ") .. nx_widestr(homePointTimeout - tools_difftime(last_use_homepoint)) .. nx_function("ext_utf8_to_widestr", " giây."), -1)
                end
            end
        else
            form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ hệ thống sẵn sàng"), -1)
        end
        nx_pause(0.99)
    end
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
end

function on_main_form_close(form)
	auto_is_running = false
	auto_is_running_rsabduct = false
	auto_is_running_khd = false
	auto_is_running_player = false
	auto_is_running_offfree = false
	auto_is_running_trace = false
	auto_is_running_attack = false
	auto_is_running_hgbc = false
	auto_is_running_dddh = false
	auto_is_running_ntlm = false
	auto_is_running_delmail = false
    auto_is_running_catchabduct = false
    auto_is_running_noterequest = false
    auto_is_running_acceptrequest = false
    auto_is_running_spy = false
    auto_is_running_vptd = false
    auto_is_running_capbird = false
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
		reset_all_btns("----")
	else
        reset_all_btns("")
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run()
	end
end

function on_btn_control_rsabduct_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_rsabduct then
		reset_all_btns("----")
	else
        reset_all_btns("rsabduct")
		auto_is_running_rsabduct = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_rsabduct()
	end
end

function on_btn_control_khd_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_khd then
		reset_all_btns("----")
	else
        reset_all_btns("khd")
		auto_is_running_khd = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_khd()
	end
end

-- Click vào nút soi buff
function on_btn_control_buff_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    reset_all_btns("buff")
    auto_run_buff()
end

function on_btn_control_player_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_player then
		reset_all_btns("----")
	else
        reset_all_btns("player")
		auto_is_running_player = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_player()
	end
end

local findPathBusy = false

function on_btn_control_findpath_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
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
                    
                    local currentDst = 5
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
                        posTmp[2] = maxHeight + 20
                        -- Nếu không vượt quá nhân vật 50 mét thì lấy điểm đó
                        if tools_move_isArrived(posTmp[1], posTmp[2], posTmp[3], 50) then
                            setPos = posTmp
                        else
                            break
                        end
                        currentDst = currentDst + 5
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
                nx_pause(0.1)
            end
            
            findPathBusy = false
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đến nơi"))
        end
    end
    if not isJumpToPost then
        local x = nx_int(form.ipt_findpath_x.Text)
        local y = nx_int(form.ipt_findpath_y.Text)
        nx_value("path_finding"):FindPathScene(get_current_map(), x, -10000, y, 0)
    end
end

function on_btn_control_offfree_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_offfree then
		reset_all_btns("----")
	else
        reset_all_btns("offfree")
		auto_is_running_offfree = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_offfree()
	end
end

function on_btn_control_trace_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_trace then
		reset_all_btns("----")
	else
        reset_all_btns("trace")
		auto_is_running_trace = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_trace()
	end
end

function on_btn_control_attack_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_attack then
		reset_all_btns("----")
	else
        reset_all_btns("attack")
		auto_is_running_attack = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_attack()
	end
end

function on_btn_control_hgbc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_hgbc then
		reset_all_btns("----")
	else
        reset_all_btns("hgbc")
		auto_is_running_hgbc = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_hgbc()
	end
end

function on_btn_control_dddh_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_dddh then
		reset_all_btns("----")
	else
        reset_all_btns("dddh")
		auto_is_running_dddh = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_dddh()
	end
end

function on_btn_control_ntlm_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_ntlm then
		reset_all_btns("----")
	else
        reset_all_btns("ntlm")
		auto_is_running_ntlm = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_ntlm()
	end
end

function on_btn_control_delmail_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_delmail then
		reset_all_btns("----")
	else
        local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", true, false)
        if nx_is_valid(dialog) then
            dialog.mltbox_info.HtmlText = nx_function("ext_utf8_to_widestr", "Chú ý: Hãy kiểm tra lại nếu dùng auto này bạn có thể sẽ mất các thư quan trọng")
            dialog:ShowModal()
            local res = nx_wait_event(100000000, dialog, "confirm_return")
            if res ~= "ok" then
                return
            else
                reset_all_btns("delmail")
                auto_is_running_delmail = true
                btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
                auto_run_delmail()
            end
        end
	end
end

function on_btn_control_catchabduct_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_catchabduct then
		reset_all_btns("----")
	else
        reset_all_btns("catchabduct")
		auto_is_running_catchabduct = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_catchabduct()
	end
end

function on_btn_control_noterequest_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_noterequest then
		reset_all_btns("----")
	else
        reset_all_btns("noterequest")
		auto_is_running_noterequest = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_noterequest()
	end
end

function on_btn_control_acceptrequest_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_acceptrequest then
		reset_all_btns("----")
	else
        reset_all_btns("acceptrequest")
		auto_is_running_acceptrequest = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_acceptrequest()
	end
end

function on_btn_control_spy_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_spy then
		reset_all_btns("----")
	else
        reset_all_btns("spy")
		auto_is_running_spy = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_spy()
	end
end

function on_btn_control_vptd_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_vptd then
		reset_all_btns("----")
	else
        reset_all_btns("vptd")
		auto_is_running_vptd = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_vptd()
	end
end

function on_btn_control_capbird_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_running_capbird then
		reset_all_btns("----")
	else
        reset_all_btns("capbird")
		auto_is_running_capbird = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_capbird()
	end
end

function reset_all_btns(skip)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if skip ~= "" then
        auto_is_running = false
        form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Quét cóc")
    end
    if skip ~= "rsabduct" then
        auto_is_running_rsabduct = false
        form.btn_control_rsabduct.Text = nx_function("ext_utf8_to_widestr", "Quét, Thổi cóc")
    end
    if skip ~= "khd" then
        auto_is_running_khd = false
        form.btn_control_khd.Text = nx_function("ext_utf8_to_widestr", "Q.Rương KHĐ")
    end
    -- Hủy soi buff
    if skip ~= "buff" then
        local custom_groupbox = form:Find("groupbox_buff")
        if nx_is_valid(custom_groupbox) then
            form:Remove(custom_groupbox)
        end
    end
    if skip ~= "player" then
        auto_is_running_player = false
        form.btn_control_player.Text = nx_function("ext_utf8_to_widestr", "Quét Ng.Chơi")
    end
    if skip ~= "offfree" then
        auto_is_running_offfree = false
        form.btn_control_offfree.Text = nx_function("ext_utf8_to_widestr", "Giải cứu cóc")
    end
    if skip ~= "trace" then
        auto_is_running_trace = false
        form.btn_control_trace.Text = nx_function("ext_utf8_to_widestr", "Đi theo")
    end
    if skip ~= "attack" then
        auto_is_running_attack = false
        form.btn_control_attack.Text = nx_function("ext_utf8_to_widestr", "Xuất chiêu")
    end
    if skip ~= "hgbc" then
        auto_is_running_hgbc = false
        form.btn_control_hgbc.Text = nx_function("ext_utf8_to_widestr", "HG Bí Cảnh")
    end
    if skip ~= "dddh" then
        auto_is_running_dddh = false
        form.btn_control_dddh.Text = nx_function("ext_utf8_to_widestr", "DĐ Đếm Hoa")
    end
    if skip ~= "ntlm" then
        auto_is_running_ntlm = false
        form.btn_control_ntlm.Text = nx_function("ext_utf8_to_widestr", "Q N.Tay Lẹ Mắt")
    end
    if skip ~= "delmail" then
        auto_is_running_delmail = false
        form.btn_control_delmail.Text = nx_function("ext_utf8_to_widestr", "Xóa thư H.Thống")
    end
    if skip ~= "catchabduct" then
        auto_is_running_catchabduct = false
        form.btn_control_catchabduct.Text = nx_function("ext_utf8_to_widestr", "Thổi cóc, T.Báo")
    end
    if skip ~= "noterequest" then
        auto_is_running_noterequest = false
        form.btn_control_noterequest.Text = nx_function("ext_utf8_to_widestr", "T.Báo yêu cầu")
    end
    if skip ~= "acceptrequest" then
        auto_is_running_acceptrequest = false
        form.btn_control_acceptrequest.Text = nx_function("ext_utf8_to_widestr", "C.Nhận Y.Cầu")
    end
    if skip ~= "spy" then
        auto_is_running_spy = false
        form.btn_control_spy.Text = nx_function("ext_utf8_to_widestr", "Q Do thám")
    end
    if skip ~= "vptd" then
        auto_is_running_vptd = false
        form.btn_control_vptd.Text = nx_function("ext_utf8_to_widestr", "V.PhongT.Hiệp")
    end
    if skip ~= "capbird" then
        auto_is_running_capbird = false
        form.btn_control_capbird.Text = nx_function("ext_utf8_to_widestr", "Bắt Chim NC5")
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

function tools_play_sound()
	local role = nx_value("role")
	if not nx_is_valid(role) then
		return
	end
	local scene = role.scene
	if not nx_is_valid(scene) then
		return
	end
	local game_config = nx_value("game_config")
	game_config.music_enable = true
	game_config.music_volume = 1
	nx_execute("form_stage_main\\form_system\\form_system_music_setting", "set_music_enable", game_config.music_enable)
	nx_execute("util_functions", "play_music", scene, "scene", "life_game_win", 0, 0, 0, 1, false)
	
	local timer = nx_value(GAME_TIMER)
	if nx_is_valid(timer) then
		timer:Register(20000, -1, nx_current(), "tools_resume_scene_music", game_config, -1, -1)
	end			
end

function tools_resume_scene_music(cfg)
	local role = nx_value("role")
	if not nx_is_valid(role) then
		return
	end
	local scene = role.scene
	if not nx_is_valid(scene) then
		return
	end
	local game_config = nx_value("game_config")
	local timer = nx_value(GAME_TIMER)
	if nx_is_valid(timer) then
		timer:UnRegister(nx_current(), "tools_resume_scene_music", game_config)
	end			
	game_config.music_enable = sound_before
	game_config.music_volume = 1
	sound_before = nil
	volume_before = nil
	nx_execute("form_stage_main\\form_system\\form_system_music_setting", "set_music_enable", game_config.music_enable)
	local game_client = nx_value("game_client")
	local client_scene = game_client:GetScene()
	if not nx_is_valid(client_scene) then
		return
	end
	local scene_music = client_scene:QueryProp("Resource")
	nx_execute("util_functions", "play_scene_random_music", scene, "scene", scene_music)	
end

-- Để chuột vào icon buff khi quét buff
function on_buff_imagegrid_mousein_grid(grid, index)
    local buff_configID = nx_string(grid:GetItemAddText(index, nx_int(1)))
    local gui = nx_value("gui")
    if buff_configID == nil or nx_string(buff_configID) == "" then
        return
    end
    local text_tips = nx_widestr("")
    local des_info = gui.TextManager:GetText("desc_" .. nx_string(buff_configID) .. "_0")
    if des_info ~= nx_widestr("desc_" .. nx_string(buff_configID) .. "_0") and des_info ~= nx_widestr("") and des_info ~= nx_widestr("<s>") then
        text_tips = des_info
    end
    local des_info1 = gui.TextManager:GetText("desc_" .. nx_string(buff_configID) .. "_1")
    if text_tips == nx_widestr("") and des_info1 ~= nx_widestr("desc_" .. nx_string(buff_configID) .. "_1") and des_info1 ~= nx_widestr("") and des_info1 ~= nx_widestr("<s>") then
        text_tips = des_info1
    end
    if text_tips ~= nx_widestr("") then
        nx_execute("tips_game", "show_text_tip", text_tips, grid:GetMouseInItemLeft() + 5, grid:GetMouseInItemTop() + 5, 0, grid.ParentForm)
    end
end

-- Đưa chuột ra khỏi icon buff khi quét buff
function on_buff_imagegrid_mouseout_grid(grid, index)
    nx_execute("tips_game", "hide_tip", grid.ParentForm)
end

function startMoveForward()
    nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " STARTFORWARD")
end

function stopMoveForward()
    nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " STOPFORWARD")
end


