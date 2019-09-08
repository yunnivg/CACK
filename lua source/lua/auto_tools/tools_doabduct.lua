require("define\\request_type")
require("util_gui")
require("util_functions")
require("auto_tools\\tool_libs")
require("share\\chat_define")
require("share\\client_custom_define")
require("util_move")

local THIS_FORM = "auto_tools\\tools_doabduct"

local auto_is_running_static = false
local auto_is_running_dynamic = false

local max_distance_selectauto = 6
local used_abduct_item = false
local direct_run = false
local current_form_type = "dynamic"

-- Dữ liệu bắt cóc dạo
local WINEXEC_PATH = "autodata\\tools.exe"
local DATA_ABDUCT_PATH = "autodata\\data_abduct.lua"
local HOMEPOINT_INI_FILE = "share\\Rule\\HomePoint.ini"

-- Danh sác tọa độ đi tìm cóc
local dynamic_posmap = {}
-- Dữ liệu NPC đi bán
local dynamic_selldata = {}
-- Dữ liệu đứng đợi đợt sau
local dynamic_waitpos = {}
-- Điểm hồi sinh thần hành về sau khi bắt - Dữ liệu mảng để random
local dynamic_homepoint = {}
-- Tọa độ di chuyển đến để chuẩn bị bày hàng
local dynamic_prestall = false
local dynamic_stoptime = {}

----------------------------------------
-- Lấy danh sách chat cho mấy đứa đánh mình
-- 
getDataChatForAttacker = function()
    local dataDefault = {
        "??", "Gì vậy?", "...!", "Gì thế?", "Chết ng à nghe", "wwtf?", ":'(", "What the hell?",
        "Dụ gì?", "!!??", "?"
    }
    local ini = nx_execute("util_functions", "get_ini", "..\\bin\\autodata\\data_abduct_chat.ini", true)
    if not nx_is_valid(ini) then
        return dataDefault
    end
    local listChats = {}
    local numchats = ini:GetSectionCount()
    local pos = 1
    for i = 0, numchats - 1 do
        listChats[pos] = ini:ReadString(i, "value", "")
        pos = pos + 1
    end
    return listChats
end

-----------------------------------------
-- Bắt cóc cố định
-- 
auto_run = function(map, pos, restabducttime, integrated_qt)
	local abduct_step = 1
	direct_run = true

	while auto_is_running_static == true do
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
			local city = get_current_map()
			if city ~= map then
				stop_type_static()
				return 0
			end
			local data = get_abduct_data(city, pos)
			if not data then
				stop_type_static()
				return 0
			end

			local logicstate = player_client:QueryProp("LogicState")

			-- Nếu bị chết thì phải bắt đầu lại từ đầu
			if logicstate == 120 then
				abduct_step = 1
				nx_execute("custom_sender", "custom_relive", 2, 0)
				nx_pause(15)
			end

			-- Bước 1 là chạy lại chỗ bắt cóc
			if abduct_step == 1 then
				if not tools_move_isArrived(data.waitpoint.x, data.waitpoint.y, data.waitpoint.z) then
					tools_move(city, data.waitpoint.x, data.waitpoint.y, data.waitpoint.z, direct_run)
					direct_run = false
				else
					-- Đến chỗ đợi cóc nếu bị đánh thì xuất chiêu
                    if logicstate == 1 then
                        local form_shortcut = nx_value("form_stage_main\\form_main\\form_main_shortcut")
                        local grid = form_shortcut.grid_shortcut_main
                        local game_shortcut = nx_value("GameShortcut")
                        if nx_is_valid(game_shortcut) then
                            game_shortcut:on_main_shortcut_useitem(grid, 5, true)
                        end
                    else
                        -- Không bị đánh thì chuyển sang bước sau
                        abduct_step = 2
                        -- Đánh dấu chưa thổi cóc
                        used_abduct_item = false
                    end
				end
			-- Đợi cóc ra để bắt
			elseif abduct_step == 2 then
				-- Kiểm tra lại vị trí đứng, nếu bị sai thì quay lại bước 1
				if not tools_move_isArrived(data.waitpoint.x, data.waitpoint.y, data.waitpoint.z) then
					abduct_step = 1
				else
					-- Nhận kỳ ngộ khi đang chờ cóc
					if integrated_qt then
						auto_capture_qt()
					end
					-- Kiểm tra buff bắt cóc còn lại nếu không tồn tại hoặc nhỏ hơn thời gian quy định
					local buff_abduct = get_buff_info("buf_offline_abduct_cd")
					if buff_abduct == nil or buff_abduct < restabducttime then
						-- Kiểm tra nếu đang ôm bao gai thì chuyển sang bước sau
						local buff_abductor = get_buff_info("buf_abductor")
						if buff_abductor ~= nil then
							abduct_step = 3
						else
							local game_scence_objs = game_scence:GetSceneObjList()
							-- Đảo ngược mảng để cái bao gai nằm trước con cóc
							local i = table.getn(game_scence_objs)

							while true do
								local obj_type = 0
								if game_scence_objs[i]:FindProp("Type") then
									obj_type = game_scence_objs[i]:QueryProp("Type")
								end
								local distance = string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, game_scence_objs[i].PosiX, game_scence_objs[i].PosiY, game_scence_objs[i].PosiZ))

								-- Có bao gai ở gần và đã thổi thì nhặt lên
								if obj_type == 4 and game_scence_objs[i]:QueryProp("ConfigID") == "OffAbductNpc_0" and used_abduct_item and tonumber(distance) <= max_distance_selectauto then --- NPC
									-- Nếu thổi thành công xuất hiện bao gai thì nhặt lên
									nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
									nx_pause(0.2)
									nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
									nx_pause(0.2)
									nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
									nx_pause(0.2)
									nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
									nx_pause(10)
                                    -- Kiểm tra lại nếu mà có buff ôm cóc rồi thì mới đánh dấu là hết thổi
                                    local buff_abductor = get_buff_info("buf_abductor")
                                    if buff_abductor ~= nil then
                                        used_abduct_item = false
                                    end
									break
								elseif obj_type == 2 and game_scence_objs[i]:QueryProp("IsAbducted") == 0 and game_scence_objs[i]:QueryProp("OffLineState") == 1 and not game_scence_objs[i]:FindProp("OfflineTypeTvT") and tonumber(distance) <= max_distance_selectauto then
									-- Thổi con cóc
									nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
									local form_bag = nx_value("form_stage_main\\form_bag")
									if nx_is_valid(form_bag) then
										form_bag.rbtn_tool.Checked = true
									end
									-- Nếu không định thân thì thổi cóc sau đó dừng 6s chờ
									--if get_buff_info("buf_offline_abduct_fail") == nil then
										nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "offitem_miyao10")
										--nx_pause(6)
										-- Nếu thổi thành công không bị định thân thì dừng thêm 8s chờ cóc nó biến thành cái bao gai
										--if get_buff_info("buf_offline_abduct_fail") == nil then
											--nx_pause(6)
											used_abduct_item = true
										--end
									--end
									break
								end
								i = i - 1
								if i <= 0 then
									break
								end
							end
						end
					end
				end
			-- Di chuyển đến địa điểm bán con cóc
			elseif abduct_step == 3 then
				-- Nếu mất con cóc thì phải chuyển sang bước 1
				local buff_abductor = get_buff_info("buf_abductor")
				if buff_abductor == nil then
					abduct_step = 1
				else
					local buff_abduct = get_buff_info("buf_offline_abduct_cd")
					-- Nếu định nghĩa ẵm con cóc đi trốn thì ẵm đi trốn nếu thời gian còn lại lớn hơn thời gian thiết đặt
					if data.hidepoint ~= nil and data.hideuntiltime ~= nil and buff_abduct ~= nil and buff_abduct > data.hideuntiltime then
						if not tools_move_isArrived(data.hidepoint.x, data.hidepoint.y, data.hidepoint.z) then
							tools_move(city, data.hidepoint.x, data.hidepoint.y, data.hidepoint.z, direct_run)
							direct_run = false
						end
						-- Dừng lại ở điểm trốn cho đến khi hết thời gian trốn
						-- Nhận kỳ ngộ khi đang ôm cóc trốn
						if integrated_qt then
							auto_capture_qt()
						end
					-- Di chuyển đến chỗ bán con cóc
					elseif not tools_move_isArrived(data.salepoint.x, data.salepoint.y, data.salepoint.z) then
						tools_move(city, data.salepoint.x, data.salepoint.y, data.salepoint.z, direct_run)
						direct_run = false
					else
						-- Đến chỗ bán cóc
						abduct_step = 4
					end
				end
			-- Bán con cóc
			elseif abduct_step == 4 then
				-- Kiểm tra lại đến chỗ bán thật chưa, nếu chưa quay lại bước 3
				if not tools_move_isArrived(data.salepoint.x, data.salepoint.y, data.salepoint.z) then
					abduct_step = 3
				else
					-- Kiểm tra xem còn con cóc hay không nếu mất thì quay lại từ đầu
					local buff_abductor = get_buff_info("buf_abductor")
					if buff_abductor == nil then
						abduct_step = 1
					else
						-- Đợi ở điểm bán cóc cho đến khi hết buff bán cóc
						local buff_abduct = get_buff_info("buf_offline_abduct_cd")
						if buff_abduct == nil then
							local game_scence_objs = game_scence:GetSceneObjList()
							for i = 1, table.getn(game_scence_objs) do
								if game_scence_objs[i]:FindProp("Type") and game_scence_objs[i]:QueryProp("Type") == 4 then
									local npc_id = game_scence_objs[i]:QueryProp("ConfigID")
									if npc_id == data.npc then
										-- Mở cái bảng nói chuyện
										local is_talking = false
										while is_talking == false do
											nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
											nx_pause(0.2)
											local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
											is_talking = form_talk.Visible
										end

										-- Bán con cóc
										nx_pause(0.2)
										nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000000) -- Nhìn xem ta đưa đến
										nx_pause(0.2)
										nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000004) -- Được
										nx_pause(1)

										-- Tắt cái form nói chuyện nếu có
										local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
										if form_talk.Visible == true then
											nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000005) -- Ta biết rồi
											nx_pause(0.2)
											nx_execute("form_stage_main\\form_talk_movie", "menu_select", 600000000) -- Để ta suy nghĩ lại
											nx_pause(0.2)
										end

										-- Tắt cái form nhận đồ
										nx_pause(0.2)
										local form_giveitems = util_get_form("form_stage_main\\form_give_item", true)
										if nx_is_valid(form_giveitems) then
											nx_pause(0.2)
											local form_giveitems1 = nx_value("form_stage_main\\form_give_item")
											if nx_is_valid(form_giveitems1) then
												nx_execute("form_stage_main\\form_give_item", "on_btn_pick_all_click", form_giveitems1.btn_mail)
											end
										end
										break
									end
								end
							end

							-- Quay lại bước 1
							abduct_step = 1
						end
					end
				end
			end

			-- Sau hết các bước này sẽ kiểm tra remove buff nếu tới những điểm bị lỗi map
			if data.removebuff ~= nil then
				for i = 1, table.getn(data.removebuff) do
					-- Bỏ kiểm tra theo phương dọc
					if tools_move_isArrived2D(data.removebuff[i].pos.x, data.removebuff[i].pos.y, data.removebuff[i].pos.z, 2) then
						nx_execute("custom_sender", "custom_remove_buffer", data.removebuff[i].buff)
						direct_run = true
						break
					end
				end
			end
		end
		nx_pause(0.2)
	end
end

auto_run_dynamic = function()
	local st = true
    local step = 1
    local posOffset = 1
    local sellPosOffset = 1
	local sellCount = 1

    local doAbductPos = nil
    local direct_run = false
    local direct_run_sell = false
    local dissMissAbductItent = {}
    local direct_run_count = 0
    local intevalMessage = 0

    local fix_ride_executed = false
    local fix_extautoit_executed = false
    
    local is_suicidal = false
    local lastStackUpTime = 0
    local isReturnedHomePoint = false -- Đã trở về điểm dừng chân
    local isSPRideCalled = false -- Đã gọi các loại ngựa đặc biệt rồi thì không gọi lại tránh việc cứ gọi nhiều lần
    local hide = nil
    -- Nếu bị đánh thì kết thúc hẳn auto cho đến khi chạy lại tùy theo cấu hình
    local isAutoStoped = false
    -- Đã log hoặc chat các đối tượng chưa
    -- Khi đã log rồi thì không log lại nữa
    local isLoggedAttacker = false

    -- Thiết đặt tên cửa sổ
    local ext_set_window_title = "CuuAmChanKinh:Auto" .. tostring(os.time())

    --nx_function("ext_set_window_title", nx_widestr(ext_set_window_title))
    local FORM_STALL_MAIN = "form_stage_main\\form_stall\\form_stall_main"
    local FORM_CONFIRM = "form_common\\form_confirm"
    local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"

    while auto_is_running_dynamic == true do
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

        -- Mở cái túi đồ
        local form_bag = nx_value("form_stage_main\\form_bag")
        local form_bagopen = 0
        while not nx_is_valid(form_bag) or form_bag.Visible == false do
            util_auto_show_hide_form("form_stage_main\\form_bag")
            nx_pause(0.1)
            form_bag = nx_value("form_stage_main\\form_bag")
            form_bagopen = form_bagopen + 1
            if form_bagopen > 10 then
                break
            end
        end
        if not nx_is_valid(form_bag) or not form_bag.Visible then
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Không thể mở cái túi đồ lên được"))
            stop_type_dynamic()
            return false
        end
        
        -- Kích hoạt cái túi vật phẩm
        if not form_bag.rbtn_tool.Checked then
            form_bag.rbtn_tool.Checked = true
        end
        
		if is_vaild_data == true then
            local map = form.map
            --local is_call_exttools = form.cbtn_dynamic_useexe.Checked
            local is_call_exttools = false -- Không xài file ngoài nữa do GOSU đang theo dõi
            local is_receive_qt = form.cbtn_dynamic_integrated_qt.Checked
            local is_autofight = form.cbtn_dynamic_fight.Checked
            local is_stallonline = form.cbtn_dynamic_autoshops.Checked
            local escort_friend = form.combobox_dynamic_escortfriend.Text
            local escort_friend2 = form.combobox_dynamic_escortfriend2.Text
            local isUseSpecialRide = form.cbtn_dynamic_usespride.Checked
            local isReturnHomePoint = form.cbtn_dynamic_returnhomepoint.Checked
            local isStopIfBeattacked = form.cbtn_dynamic_stop_if_beattacked.Checked
            local isChatAttacker = form.cbtn_dynamic_chat_attacker.Checked
            
            -- Thời gian giới hạn
            local limitTimeF = nx_int(-1)
            local limitTimeT = nx_int(-1)
            
            local text_limitTimeF = form.combobox_dynamic_limittime_from.Text
            local text_limitTimeT = form.combobox_dynamic_limittime_to.Text
            if nx_widestr(text_limitTimeF) ~= nx_function("ext_utf8_to_widestr", "Không G.Hạn") then
                limitTimeF = nx_int(nx_string(text_limitTimeF) .. nx_string("04"))
            end
            if nx_widestr(text_limitTimeT) ~= nx_function("ext_utf8_to_widestr", "Không G.Hạn") then
                limitTimeT = nx_int(nx_string(text_limitTimeT) .. nx_string("00"))
            end
        
            -- Xác định trạng thái
            local logicstate = player_client:QueryProp("LogicState")
            local buff_abductor = get_buff_info("buf_abductor")
            local buff_abduct = get_buff_info("buf_offline_abduct_cd")
            local buf_offline_abduct_fail = get_buff_info("buf_offline_abduct_fail")

            local os_h = tonumber(os.date("%H"))
            local os_m = tonumber(os.date("%M"))
            local os_modtime = nx_int(os_h * 100 + os_m)
            local isStopAuto = true
            if (limitTimeF < nx_int(0) or os_modtime > limitTimeF) and (limitTimeT < nx_int(0) or os_modtime < limitTimeT) then
                isStopAuto = false
            end
            
            -- Khống chế phần auto bày hàng
            if logicstate ~= 0 and logicstate ~= 101 then
                is_stallonline = false
            end
            
            
            -- Nếu bị chết thì phải bắt đầu lại từ đầu
            if logicstate == 120 then
                step = 5
                fix_ride_executed = false
                fix_extautoit_executed = false
                nx_execute("custom_sender", "custom_relive", 2, 0)
                intevalMessage = -1
                direct_run_count = 0
                dissMissAbductItent = {}
                direct_run = false
                doAbductPos = nil
                used_abduct_item = false
                posOffset = 1
                is_suicidal = false
                isSPRideCalled = false
                nx_pause(20)
            elseif logicstate == 1 and isStopIfBeattacked and buff_abductor ~= nil then
                -- dừng khi bị đánh
                step = 4
            elseif buf_offline_abduct_fail ~= nil then
                -- Nếu bị định thân thì chờ hết buff
                step = 6
            elseif (buff_abduct ~= nil and buff_abductor ~= nil and buff_abduct > 20) or isAutoStoped then
                -- Còn lại thời gian bắt cóc thì đi đến vị trí đứng để tránh bị theo dõi
                -- Phiên bản mới sẽ thần hành về điểm hồi sinh
                -- Khi thiết đặt
                step = 5
            elseif (buff_abductor ~= nil and buff_abduct == nil) or (buff_abductor ~= nil and buff_abduct < 20) then
                -- Có buff ôm cóc thì đi bán cóc
                step = 2
            elseif doAbductPos ~= nil then
                -- Nếu có xác định tọa độ con cóc rồi thì chạy lại đó đã
                step = 3
            else
                local readyThisStep = true
                -- Nếu đang bày hàng thì hủy bày hàng
                if logicstate == 101 then
                    readyThisStep = false
                    local form_stall = nx_value(FORM_STALL_MAIN)
                    if not nx_is_valid(form_stall) then
                        util_auto_show_hide_form(FORM_STALL_MAIN)
                        nx_pause(0.2)
                    end
                    local form_stall = nx_value(FORM_STALL_MAIN)
                    if nx_is_valid(form_stall) and nx_find_custom(form_stall, "lbl_stall_pos") then
                        local gui = nx_value("gui")
                        if form_stall.lbl_stall_pos.Text == gui.TextManager:GetText("@ui_stall_baitanzhong") then
                            -- Sẵn sàng bày hàng
                            local btn = form_stall.btn_offline_stall
                            nx_execute(FORM_STALL_MAIN, "on_btn_offline_stall_click", btn)
                            nx_pause(0.2)
                            local form_confirm = nx_value(FORM_CONFIRM)
                            if nx_is_valid(form_confirm) then
                                local btn = form_confirm.ok_btn
                                nx_execute(FORM_CONFIRM, "ok_btn_click", btn)
                            end
                            nx_pause(0.4)
                        end
                    end
                end
                -- Nếu đang vận tiêu thì rời đội
                if get_buff_info("buff_yunbiao_escortbuff") ~= nil then
                    readyThisStep = false
                    nx_execute("custom_sender", "custom_leave_team")
                end
                if readyThisStep then
                    -- Lên ngựa nếu như chưa lên
                    if not isSPRideCalled and isUseSpecialRide then
                        callTheSpecialRiding()
                        isSPRideCalled = true
                    end
                    
                    -- Phát hiện con cóc thì chạy lại
                    local game_scence_objs = game_scence:GetSceneObjList()
                    -- Đảo ngược mảng để cái bao gai nằm trước con cóc
                    local i = table.getn(game_scence_objs)

                    while true do
                        local scence_obj = game_scence_objs[i]
                        if nx_is_valid(scence_obj) then
                            local ident = scence_obj.Ident
                            local obj_type = scence_obj:QueryProp("Type")
                            local distance = string.format("%.0f", distance3d(game_player.PositionX, game_player.PositionY, game_player.PositionZ, scence_obj.PosiX, scence_obj.PosiY, scence_obj.PosiZ))
                            -- Có bao gai ở gần và đã thổi thì nhặt lên
                            if obj_type == 4 and scence_obj:QueryProp("ConfigID") == "OffAbductNpc_0" and used_abduct_item and tonumber(distance) <= max_distance_selectauto then
                                -- Nếu thổi thành công xuất hiện bao gai thì nhặt lên
                                nx_execute("custom_sender", "custom_select", ident)
                                nx_pause(0.2)
                                nx_execute("custom_sender", "custom_select", ident)
                                nx_pause(0.2)
                                nx_execute("custom_sender", "custom_select", ident)
                                nx_pause(0.2)
                                nx_execute("custom_sender", "custom_select", ident)
                                nx_pause(10)
                                local buff_abductor = get_buff_info("buf_abductor")
                                if buff_abductor ~= nil then
                                    direct_run_sell = true
                                    used_abduct_item = false
                                    sellPosOffset = 1
									sellCount = 1
                                    is_suicidal = false
                                    direct_run_count = 0
                                    fix_extautoit_executed = false
                                    fix_ride_executed = false
                                    -- Lên ngựa nếu đi bán
                                    if isUseSpecialRide then
                                        callTheSpecialRiding()
                                    end
                                end
                                break
                            elseif obj_type == 2 and scence_obj:QueryProp("IsAbducted") == 0 and scence_obj:QueryProp("OffLineState") == 1 and not scence_obj:FindProp("OfflineTypeTvT") and doAbductPos == nil and not in_array(scence_obj:QueryProp("Name"), dissMissAbductItent) then
                                local ident = nx_string(ident)
                                local ident_name = scence_obj:QueryProp("Name")
                                local abduct = game_visual:GetSceneObj(ident)
                                if nx_is_valid(abduct) then
                                    -- Nếu có người bị định thân thì bỏ qua nó
                                    if tools_have_nearabdut(ident) == -1 then
                                        doAbductPos = {}
                                        doAbductPos.Ident = ident
                                        doAbductPos.Name = ident_name
                                        doAbductPos.x = abduct.PositionX
                                        doAbductPos.y = abduct.PositionY
                                        doAbductPos.z = abduct.PositionZ
                                        -- Dừng 0.4s nếu cóc này không đi lại thì chạy lại chỗ nó
                                        -- Nếu cóc đi lại thì chạy lại trước mặt nó 1 mét chờ nó tới
                                        nx_pause(8)
                                        -- Xác định lại xem con cóc còn không
                                        local abduct = game_visual:GetSceneObj(ident)
                                        if nx_is_valid(abduct) then
                                            local pxd = doAbductPos.x - abduct.PositionX
                                            local pyd = doAbductPos.y - abduct.PositionY
                                            local pzd = doAbductPos.z - abduct.PositionZ
                                            local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
                                            if distance > 0.3 then
                                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Phát hiện có cóc đi lại, chạy lại trước mặt nó 5 mét"))
                                                -- Set lại tọa độ trước mặt cóc
                                                local radian = abduct.AngleY
                                                local angle = radian_to_degree(radian)
                                                local zz = abduct.PositionZ
                                                local xx = abduct.PositionX
                                                local yy = abduct.PositionY
                                                local dst = 5
                                                
                                                -- Trước mặt
                                                if angle <= 90 then
                                                    zz = zz + math.abs(math.sin(math.pi / 2 - radian) * dst)
                                                    xx = xx + math.abs(math.cos(math.pi / 2 - radian) * dst)
                                                elseif angle > 90 and angle <= 180 then
                                                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                                                    xx = xx + math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                                                elseif angle > 180 and angle <= 270 then
                                                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                                                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                                                elseif angle > 270 then
                                                    zz = zz + math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                                                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                                                end
                                                
                                                doAbductPos.x = xx
                                                doAbductPos.y = yy
                                                doAbductPos.z = zz
                                            else
                                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Phát hiện có cóc đứng im, chạy lại chỗ nó"))
                                            end
                                            direct_run = true
                                            direct_run_count = 0
                                            fix_ride_executed = false
                                            fix_extautoit_executed = false
                                            step = 3
                                            break
                                        end
                                    else
                                        table.insert(dissMissAbductItent, scence_obj:QueryProp("Name"))
                                    end
                                end
                            end
                        end
                        i = i - 1
                        if i <= 0 then
                            break
                        end
                    end
                end
            end
            
            -- Bước 1: Chạy đi kiếm cóc
            if step == 1 then
                doAbductPos = nil
                -- Dữ liệu vị trí của map
                local posMap = dynamic_posmap
                if posMap == nil then
                    stop_type_dynamic()
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "MAP này không hỗ trợ bắt cóc"))
                    return false
                end
                -- Tọa độ cần di chuyển hiện tại
                local pos = posMap[posOffset]
                if pos == nil and posOffset == 1 then
                    stop_type_dynamic()
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "MAP này không hỗ trợ bắt cóc"))
                    return false
                end
                if not tools_move_isArrived2D(pos[1], pos[2], pos[3]) then
                    if intevalMessage == 0 then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Di chuyển đến vị trí số " .. tostring(posOffset)))
                    end
                    -- Đang tự tử thì không di chuyển nữa để tránh việc nó lên ngựa
                    if is_suicidal == false then
                        local checkrun = tools_move_new(map, pos[1], pos[2], pos[3], direct_run)
                        direct_run = false
                        if checkrun == false then
                            direct_run_count = direct_run_count + 1
                        end
                    end
                    if direct_run_count >= 20 then
                        -- Tự tử bằng ma tâm, tự đoạn kinh mạch
                        local buff_tmjt = get_buff_info("buf_CS_jh_tmjt06")
                        if buff_tmjt == nil then
                            nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                            nx_pause(0.3)
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Không ăn thua, tự tử thôi"))
                            local form_shortcut = nx_value("form_stage_main\\form_main\\form_main_shortcut")
                            local grid = form_shortcut.grid_shortcut_2
                            local game_shortcut = nx_value("GameShortcut")
                            if nx_is_valid(game_shortcut) then
                                game_shortcut:on_main_shortcut_useitem(grid, 7, true)
                            end
                            nx_pause(0.3)
                            local buff_tmjt = get_buff_info("buf_CS_jh_tmjt06")
                            if buff_tmjt ~= nil then
                                is_suicidal = true
                            end
                        else
                            is_suicidal = true
                        end
                    elseif direct_run_count >= 15 and is_call_exttools then
                        -- Thử gọi file bên ngoài can thiệp để nhảy nhót
                        if fix_extautoit_executed == false then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Xuống ngựa cũng không được, thử nhảy nhót"))
                            fix_extautoit_executed = true
                            nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " FIXFINDPATH " .. ext_set_window_title)
                        end
                    elseif direct_run_count >= 8 then
                        -- Không di chuyển được thì xuống ngựa
                        if fix_ride_executed == false then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Không di chuyển được, thử xuống ngựa"))
                            fix_ride_executed = true
                        end
                        nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                    end
                else
                    -- Dừng một lát chờ load map
                    direct_run_count = 0
                    intevalMessage = -1
                    nx_pause(1)
                    -- Đến vị trí này rồi thì tăng posOffset
                    posOffset = posOffset + 1
                    if posOffset > table.getn(posMap) then
                        posOffset = 1
                    end
                end
            elseif step == 2 then
                isReturnedHomePoint = false
                dissMissAbductItent = {}
                -- Dữ liệu bán cóc
                local sellDataMap = dynamic_selldata
                if sellDataMap == nil then
                    stop_type_dynamic()
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "MAP này không hỗ trợ bắt cóc"))
                    return false
                end
                local sellData = sellDataMap[sellPosOffset]
                if sellData == nil then
                    stop_type_dynamic()
                    tools_show_notice(nx_function("ext_utf8_to_widestr", "MAP này không hỗ trợ bắt cóc"))
                    return false
                end
                -- Đi bán cóc
                -- Nếu mất buff thì thôi
                local buff_abductor = get_buff_info("buf_abductor")
                if buff_abductor == nil then
                    step = 1
                    isSPRideCalled = false
                    sellPosOffset = 1
					sellCount = 1
                else
                    -- Xử lý đi bán cóc nếu bị kẹt
                    if not tools_move_isArrived2D(sellData.x, sellData.y, sellData.z) then
                        -- Đang tự tử thì không di chuyển nữa để tránh việc nó lên ngựa
                        if is_suicidal == false then
                            local checkrun = tools_move_new(map, sellData.x, sellData.y, sellData.z, direct_run_sell)
                            direct_run_sell = false
                            if checkrun == false then
                                direct_run_count = direct_run_count + 1
                            end
                        end
                        if direct_run_count >= 20 then
                            -- Tự tử bằng ma tâm, tự đoạn kinh mạch
                            local buff_tmjt = get_buff_info("buf_CS_jh_tmjt06")
                            if buff_tmjt == nil then
                                nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                                nx_pause(0.3)
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Không ăn thua, tự tử thôi"))
                                local form_shortcut = nx_value("form_stage_main\\form_main\\form_main_shortcut")
                                local grid = form_shortcut.grid_shortcut_2
                                local game_shortcut = nx_value("GameShortcut")
                                if nx_is_valid(game_shortcut) then
                                    game_shortcut:on_main_shortcut_useitem(grid, 7, true)
                                end
                                nx_pause(0.3)
                                local buff_tmjt = get_buff_info("buf_CS_jh_tmjt06")
                                if buff_tmjt ~= nil then
                                    is_suicidal = true
                                end
                            else
                                is_suicidal = true
                            end
                        elseif direct_run_count >= 15 and is_call_exttools then
                            -- Thử gọi file bên ngoài can thiệp để nhảy nhót
                            if fix_extautoit_executed == false then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Xuống ngựa cũng không được, thử nhảy nhót"))
                                fix_extautoit_executed = true
                                nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " FIXFINDPATH " .. ext_set_window_title)
                            end
                        elseif direct_run_count >= 8 then
                            -- Không di chuyển được thì xuống ngựa
                            if fix_ride_executed == false then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Không di chuyển được, thử xuống ngựa"))
                                fix_ride_executed = true
                            end
                            nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                        end
                    else
                        if buff_abduct == nil then
                            local game_scence_objs = game_scence:GetSceneObjList()
                            for i = 1, table.getn(game_scence_objs) do
                                if game_scence_objs[i]:FindProp("Type") and game_scence_objs[i]:QueryProp("Type") == 4 then
                                    local npc_id = game_scence_objs[i]:QueryProp("ConfigID")
                                    if npc_id == sellData.npc then
                                        -- Mở cái bảng nói chuyện
                                        local is_talking = false
                                        while is_talking == false do
                                            nx_execute("custom_sender", "custom_select", game_scence_objs[i].Ident)
                                            nx_pause(0.2)
                                            local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
                                            is_talking = form_talk.Visible
                                        end

                                        -- Bán con cóc
                                        nx_pause(0.2)
                                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000000) -- Nhìn xem ta đưa đến
                                        nx_pause(0.2)
                                        nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000004) -- Được
                                        nx_pause(1)

                                        -- Tắt cái form nói chuyện nếu có
                                        local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
                                        if form_talk.Visible == true then
                                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", 843000005) -- Ta biết rồi
                                            nx_pause(0.2)
                                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", 600000000) -- Để ta suy nghĩ lại
                                            nx_pause(0.2)
                                        end

                                        -- Tắt cái form nhận đồ
                                        nx_pause(0.2)
                                        local form_giveitems = util_get_form("form_stage_main\\form_give_item", true)
                                        if nx_is_valid(form_giveitems) then
                                            nx_pause(0.2)
                                            local form_giveitems1 = nx_value("form_stage_main\\form_give_item")
                                            if nx_is_valid(form_giveitems1) then
                                                nx_execute("form_stage_main\\form_give_item", "on_btn_pick_all_click", form_giveitems1.btn_pick_all)
                                            end
                                        end
                                        st = true
                                        -- Tăng vị trí bán lên: Nếu quay lại mà vẫn còn buff ôm cóc thì đi bán chỗ khác, khi thổi con cóc khác thì sẽ reset
                                        sellPosOffset = sellPosOffset + 1
                                        if sellPosOffset > table.getn(sellDataMap) then
                                            sellPosOffset = 1
                                        end
										sellCount = sellCount + 1
										if sellCount > 4 then
											tools_show_notice(nx_function("ext_utf8_to_widestr", "Méo bán được tiến hành thả nạn nhân"))
											throwAbduct()
											nx_pause(0.2)
										end
                                        
                                        break
                                    end
                                end
                            end

                            -- Quay lại bước 1
                            step = 1
                            isSPRideCalled = false
                        end
                    end
                end
            elseif step == 3 then
			st = true
                -- Di chuyển tới chỗ con cóc
                if doAbductPos ~= nil then
                    if not tools_move_isArrived2D(doAbductPos.x, doAbductPos.y, doAbductPos.z) then
                        local checkrun = tools_move_new(map, doAbductPos.x, doAbductPos.y, doAbductPos.z, direct_run)
                        direct_run = false
                        if checkrun == false then
                            direct_run_count = direct_run_count + 1
                        end
                        if direct_run_count >= 8 then
                            -- Nếu không tự tìm đường được thì bỏ qua con cóc này
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Cóc này không auto tìm đường được nên bỏ qua"))
                            if table.getn(dissMissAbductItent) > 70 then
                                dissMissAbductItent = {}
                            end
                            table.insert(dissMissAbductItent, doAbductPos.Name)
                            doAbductPos = nil
                            step = 1
                            direct_run_count = 0
                            fix_ride_executed = false
                            fix_extautoit_executed = false
                        end
                    else
                        -- Tới chỗ con cóc thì kiểm tra lại
                        local abduct = game_visual:GetSceneObj(nx_string(doAbductPos.Ident))
                        if nx_is_valid(abduct) then
                            -- Xác định khoảng cách 3D
                            local pxd = game_player.PositionX - abduct.PositionX
                            local pyd = game_player.PositionY - abduct.PositionY
                            local pzd = game_player.PositionZ - abduct.PositionZ
                            local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
                            if distance < max_distance_selectauto then
                                -- Kiểm tra xem có ai đang bắt không
                                if tools_have_nearabdut(doAbductPos.Ident) == -1 then
                                    -- Thổi con cóc
                                    used_abduct_item = true
                                    nx_execute("custom_sender", "custom_select", doAbductPos.Ident)
                                    nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "offitem_miyao10")
                                else
                                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Có người đang bắt rồi kiếm con khác không KS"))
                                    table.insert(dissMissAbductItent, doAbductPos.Name)
                                    doAbductPos = nil
                                    step = 1
                                end
                            else
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Quá xa con cóc"))
                                doAbductPos = nil
                                step = 1
                            end
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Không còn con cóc nữa"))
                            doAbductPos = nil
                            step = 5
                        end
                    end
                else
                    step = 5
                end
            elseif step == 4 then
                -- Xuất chiêu đánh khô máu
			local buffbc = get_buff_info("buf_abductor")
                if logicstate == 1 and buffbc ~= nil then
						-- local t = math.random(1, table.getn(dynamic_stoptime))
						-- local stime = dynamic_stoptime[t]
						-- if stime ~= nil then
						-- tools_show_notice(nx_function("ext_utf8_to_widestr", "Bị đánh tạm dừng vài phút"))
						-- nx_pause(stime[1])
						-- step = 1
						-- else
						-- tools_show_notice(nx_function("ext_utf8_to_widestr", "không thiết lập tạm dừng"))
						-- nx_pause(1)
						-- step = 1
						-- end
					throwAbduct()
					tools_show_notice(nx_function("ext_utf8_to_widestr", "Bị đánh tiến hành thả nạn nhân"))
					nx_pause(0.2)
					step = 1
                else
                    step = 1
                end
            elseif step == 5 then
                if 	buff_abductor == nil then
					isSPRideCalled = false
                    step = 1	
				else
					if (buff_abduct ~= nil and buff_abductor ~= nil and buff_abduct > 20) then
					local isMoving = is_moving()
					if isMoving == false then
						if hide == nil and st == true then
							hide = math.random(1, table.getn(dynamic_waitpos))
							local hidedata = dynamic_waitpos[hide]
							tools_move_new(map, hidedata[1], hidedata[2], hidedata[3], true)
							st = false
						else
							if st == true then
							local hidedata = dynamic_waitpos[hide]
							tools_move_new(map, hidedata[1], hidedata[2], hidedata[3], true)
							if intevalMessage == 0 then
							tools_show_notice(nx_function("ext_utf8_to_widestr", "Đi tới điểm chờ"))
							end
							st = false
							else
							if intevalMessage == 0 then
							tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang chờ......"))
							end
							nx_pause(0.1)
							st = false
							end
						end
					end
					------	aaaa
					else
						if (buff_abduct < 20 and buff_abductor ~= nil)then
							-- nếu buff_abuct < 5
							isSPRideCalled = false
							step = 2
						end
					end
				
				end					
            elseif step == 6 then
                if buf_offline_abduct_fail ~= nil then
                    -- Đứng im đây, bi định thân
                else
                    step = 1
                end
            end
            
            intevalMessage = intevalMessage + 1
            if intevalMessage >= 30 then
                intevalMessage = 0
            end
        end
        
        nx_pause(0.2)
    end
end

-- Xem thử bên cạnh có người bị định thân không
-- Nếu có trả về thời gian còn lại
-- Nếu không có trả về -1
tools_have_nearabdut = function(ident)
    -- ident của con cóc
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return -1
    end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return -1
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return -1
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return -1
    end
    local MessageDelay = nx_value("MessageDelay")
    if not nx_is_valid(MessageDelay) then
        return -1
    end
    local abduct = game_visual:GetSceneObj(nx_string(ident))
    if not nx_is_valid(abduct) then
        return -1
    end
    local gui = nx_value("gui")
    -- Xác định tọa độ con cóc
    local objX = abduct.PositionX
    local objY = abduct.PositionY
    local objZ = abduct.PositionZ
    -- Quét bên cạnh
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                if obj:FindProp("Type") and obj:FindProp("Type") and obj:QueryProp("Type") == 2 and player_client:QueryProp("Name") ~= obj:QueryProp("Name") then
                    -- Xác định khoảng cách 3D
                    local pxd = objX - visualObj.PositionX
                    local pyd = objY - visualObj.PositionY
                    local pzd = objZ - visualObj.PositionZ
                    local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
                    if distance < 6 then
                        -- Xem thử có định thân hay không
                        for j = 1, 25 do
                            local buff = obj:QueryProp("BufferInfo" .. tostring(j))
                            if buff ~= 0 then
                                local buff_info = util_split_string(buff, ",")
                                if buff_info[1] == "buf_offline_abduct_fail" then
                                    local server_now_time = MessageDelay:GetServerNowTime()
                                    local buff_diff_time = nx_int((buff_info[4] - server_now_time) / 1000) -- Unit timesamp
                                    return buff_diff_time
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return -1
end

-- Di chuyển tới vị trí
-- Nếu trigger di chuyển thì trả về false
-- Nếu không trigger thì trả về true
tools_move_new = function(scene, x, y, z, passtest)
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

get_abduct_data = function(city, pos)
	-- Thiên đăng trấn
	if city == "born04" then
		-- Cổng Diệp Gia
		if pos == nx_function("ext_utf8_to_widestr", "Cổng Diệp Gia") then
			return {
				-- Điểm đợi cóc
				waitpoint = {
					x = 657.808,
					y = -37.114,
					z = 723.174
				},
				-- Điểm bán cóc
				salepoint = {
					x = 658.321,
					y = -39.261,
					z = 668.219
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = nil,
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = nil,
				-- ID con NPC bán cóc
				npc = "WorldNpc00136",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
	end
	-- Quân tử đường
	if city == "school03" then
		-- Thanh long bảo (1)
		if pos == nx_function("ext_utf8_to_widestr", "Thanh long bảo (1)") then
			return {
				-- Điểm đợi cóc (Thanh long bảo 1)
				waitpoint = {
					x = 431.225,
					y = 23.030,
					z = 1126.233
				},
				-- Điểm bán cóc
				salepoint = {
					x = 223.908,
					y = 30.837,
					z = 1082.381
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 383.726,
					y = -2.838,
					z = 959.805
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc03455",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = {
					{
						pos = {
							x = 338.773,
							y = 30.725,
							z = 1159.034
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 366.108,
							y = 20.298,
							z = 1064.443
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 367.171,
							y = 19.261,
							z = 1065.607
						},
						buff = "buf_riding_01"
					}
				}
			}
		end
		-- Thanh long bảo (2)
		if pos == nx_function("ext_utf8_to_widestr", "Thanh long bảo (2)") then
			return {
				-- Điểm đợi cóc (Thanh long bảo 2)
				waitpoint = {
					x = 431.225,
					y = 23.030,
					z = 1126.233
				},
				-- Điểm bán cóc
				salepoint = {
					x = 223.908,
					y = 30.837,
					z = 1082.381
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 383.726,
					y = -2.838,
					z = 959.805
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc03455",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = {
					{
						pos = {
							x = 338.773,
							y = 30.725,
							z = 1159.034
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 366.108,
							y = 20.298,
							z = 1064.443
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 367.171,
							y = 19.261,
							z = 1065.607
						},
						buff = "buf_riding_01"
					}
				}
			}
		end
		-- Bờ biển đạo tặc doanh trại
		if pos == nx_function("ext_utf8_to_widestr", "Bờ biển đạo tặc doanh trại") then
			return {
				-- Điểm đợi cóc (Bờ biển)
				waitpoint = {
					x = -158.750,
					y = -3.968,
					z = 1454.251
				},
				-- Điểm bán cóc
				salepoint = {
					x = 223.908,
					y = 30.837,
					z = 1082.381
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 355.467,
					y = 37.418,
					z = 1271.692
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc03455",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = {
					{
						pos = {
							x = 338.773,
							y = 30.725,
							z = 1159.034
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 366.108,
							y = 20.298,
							z = 1064.443
						},
						buff = "buf_riding_01"
					}
				}
			}
		end
		-- Thần Mộc Lĩnh (1)
		if pos == nx_function("ext_utf8_to_widestr", "Thần Mộc Lĩnh (1)") then
			return {
				-- Điểm đợi cóc (Thần Mộc Lĩnh (1))
				waitpoint = {
					x = 509.585,
					y = 112.301,
					z = 1580.237
				},
				-- Điểm bán cóc
				salepoint = {
					x = 223.908,
					y = 30.837,
					z = 1082.381
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 355.467,
					y = 37.418,
					z = 1271.692
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc03455",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = {
					{
						pos = {
							x = 338.773,
							y = 30.725,
							z = 1159.034
						},
						buff = "buf_riding_01"
					},
					{
						pos = {
							x = 366.108,
							y = 20.298,
							z = 1064.443
						},
						buff = "buf_riding_01"
					}
				}
			}
		end
	end
	-- Võ Đang
	if city == "school07" then
		-- Ngụy tam Thanh Quan (1)
		if pos == nx_function("ext_utf8_to_widestr", "Ngụy tam Thanh Quan (1)") then
			return {
				-- Điểm đợi cóc Ngụy tam Thanh Quan (1)
				waitpoint = {
					x = 75.639,
					y = 43.894,
					z = 984.784
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Ngụy tam Thanh Quan (2)
		if pos == nx_function("ext_utf8_to_widestr", "Ngụy tam Thanh Quan (2)") then
			return {
				-- Điểm đợi cóc Ngụy tam Thanh Quan (2)
				waitpoint = {
					x = 81.331,
					y = 42.961,
					z = 977.942
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Không Môn Bang
		if pos == nx_function("ext_utf8_to_widestr", "Không Môn Bang") then
			return {
				-- Điểm đợi cóc Không Môn Bang
				waitpoint = {
					x = -116.533,
					y = 55.674,
					z = 75.408
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Núi Võ Đang Môn
		if pos == nx_function("ext_utf8_to_widestr", "Núi Võ Đang Môn") then
			return {
				-- Điểm đợi cóc Núi Võ Đang Môn
				waitpoint = {
					x = 637.099,
					y = 2.248,
					z = 795.524
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Hổ Tiếu Sơn Trang
		if pos == nx_function("ext_utf8_to_widestr", "Hổ Tiếu Sơn Trang") then
			return {
				-- Điểm đợi cóc Hổ Tiếu Sơn Trang
				waitpoint = {
					x = 846.639,
					y = -6.435,
					z = 844.119
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Minh Quân Trị Trọng Doanh
		if pos == nx_function("ext_utf8_to_widestr", "Minh Quân Trị Trọng Doanh") then
			return {
				-- Điểm đợi cóc Minh Quân Trị Trọng Doanh
				waitpoint = {
					x = -21.878,
					y = 44.500,
					z = 434.769
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Nhưỡng Tửu Phường
		if pos == nx_function("ext_utf8_to_widestr", "Nhưỡng Tửu Phường") then
			return {
				-- Điểm đợi cóc Nhưỡng Tửu Phường
				waitpoint = {
					x = -78.327,
					y = 60.369,
					z = 675.423
				},
				-- Điểm bán cóc
				salepoint = {
					x = 439.417,
					y = -4.359,
					z = 803.822
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 769.249,
					y = 31.390,
					z = 1017.251
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc04657",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
	end
	-- Đường Môn
	if city == "school05" then
		-- Tịch Giai Sơn
		if pos == nx_function("ext_utf8_to_widestr", "Tịch Giai Sơn") then
			return {
				-- Điểm đợi cóc Tịch Giai Sơn
				waitpoint = {
					x = 446.886,
					y = 17.867,
					z = 85.224
				},
				-- Điểm bán cóc
				salepoint = {
					--x = 1061.400,
					--y = 45.621,
					--z = 431.200
					x = 879.544,
					y = 34.614,
					z = 852.250
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					--x = 485.215,
					--y = -8.819,
					--z = 343.803
					x = 420.852,
					y = 61.595,
					z = 785.097
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 119,
				-- ID con NPC bán cóc
				--npc = "WorldNpc02248",
				npc = "WorldNpc02358",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
	end
	-- Thiếu Lâm
	if city == "school08" then
		-- Trung Hoa Môn
		if pos == nx_function("ext_utf8_to_widestr", "Trung Hoa Môn") then
			return {
				-- Điểm đợi cóc Trung Hoa Môn
				waitpoint = {
					x = 314.953,
					y = -23.791,
					z = 566.364
				},
				-- Điểm bán cóc
				salepoint = {
					x = 497.169,
					y = -52.077,
					z = 750.014
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 423.354,
					y = -22.657,
					z = 474.909
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc00230",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Thiên Trung Các (1)
		if pos == nx_function("ext_utf8_to_widestr", "Thiên Trung Các (1)") then
			return {
				-- Điểm đợi cóc Thiên Trung Các (1)
				waitpoint = {
					x = 192.565,
					y = -14.680,
					z = 523.840
				},
				-- Điểm bán cóc
				salepoint = {
					x = 497.169,
					y = -52.077,
					z = 750.014
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 423.354,
					y = -22.657,
					z = 474.909
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc00230",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
		-- Thiên Trung Các (2)
		if pos == nx_function("ext_utf8_to_widestr", "Thiên Trung Các (2)") then
			return {
				-- Điểm đợi cóc Thiên Trung Các (2)
				waitpoint = {
					x = 186.299,
					y = -14.680,
					z = 554.176
				},
				-- Điểm bán cóc
				salepoint = {
					x = 497.169,
					y = -52.077,
					z = 750.014
				},
				-- Điểm đi trốn nil thì không đi trốn
				hidepoint = {
					x = 423.354,
					y = -22.657,
					z = 474.909
				},
				-- Trốn cho đến lúc còn lại (giây) thì đi bán
				hideuntiltime = 59,
				-- ID con NPC bán cóc
				npc = "WorldNpc00230",
				-- Dữ liệu tại đây sẽ xóa bỏ 1 số buff do lỗi map
				removebuff = nil
			}
		end
	end
	return false
end

get_abduct_pos = function(map)
	-- Thiên đăng trấn
	if map == "born04" then
		return {
			"Cổng Diệp Gia"
		}
	end
	-- Quân tử đường
	if map == "school03" then
		return {
			"Thanh long bảo (1)",
			"Thanh long bảo (2)",
			"Bờ biển đạo tặc doanh trại",
			"Thần Mộc Lĩnh (1)"
		}
	end
	-- Võ Đang
	if map == "school07" then
		return {
			"Ngụy tam Thanh Quan (1)",
			"Ngụy tam Thanh Quan (2)",
			"Không Môn Bang",
			"Núi Võ Đang Môn",
			"Hổ Tiếu Sơn Trang",
			"Minh Quân Trị Trọng Doanh",
			"Nhưỡng Tửu Phường"
		}
	end
	-- Đường Môn
	if map == "school05" then
		return {
			"Tịch Giai Sơn"
		}
	end
	-- Thiếu Lâm
	if map == "school08" then
		return {
			"Trung Hoa Môn",
			"Thiên Trung Các (1)",
			"Thiên Trung Các (2)"
		}
	end
	return false
end

set_form_type_dynamic = function(form)
    auto_is_running_static = false
    current_form_type = "dynamic"
	
    if not nx_is_valid(form) then
		return 0
	end
	
    form.typestatic.Checked = false
    form.typedynamic.Checked = true
    
    form.GroupTypedynamic.Visible = true
    form.GroupTypestatic.Visible = false
    
    form.cbtn_dynamic_integrated_qt.Checked = false
    form.cbtn_dynamic_fight.Checked = false
    form.cbtn_dynamic_useexe.Checked = true
    form.cbtn_dynamic_useexe.Visible = true
    form.cbtn_dynamic_autoshops.Checked = false
    
    form.cbtn_dynamic_usespride.Checked = false
    form.cbtn_dynamic_returnhomepoint.Checked = false
    form.cbtn_dynamic_stop_if_beattacked.Checked = false
    form.cbtn_dynamic_chat_attacker.Checked = false
    
    local map = get_current_map()
	
    form.btn_dynamic_control.Text = nx_widestr("...")
	form.lbl_dynamic_map.Text = util_text(map)
    
    -- Kiểm tra xem có thể chạy file ngoài không
    if not nx_function("ext_is_file_exist", nx_work_path() .. WINEXEC_PATH) then
        form.cbtn_dynamic_useexe.Checked = false
        form.cbtn_dynamic_useexe.Visible = false
    end
    
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_ABDUCT_PATH) then
        form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
        return 0
    end

    local file = assert(loadfile(nx_work_path() .. DATA_ABDUCT_PATH))
    file()
    local posMap = abductPos[map]
    
    if posMap == nil then
        form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
        return 0
    end

    local sellDataMap = abductSell[map]
    if sellDataMap == nil then
        form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
        return 0
    end
	
    local waitpos = waitPosAfterSell[map]
    if waitpos == nil then
        form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
        return 0
    end

    local homepoint = homePointReturn[map]
    if homepoint == nil or homepoint == {} then
        form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
        return 0
    end
	
	local wtime = stoptime[map]
	
	if wtime ~= nil then
		dynamic_stoptime = wtime
	end

    -- Xuất danh sách bạn, chí hữu, chú ý đang online để ké tiêu
	local game_client = nx_value("game_client")
	local player_client = game_client:GetPlayer()
	-- Xác định bang của người vận tiêu
	local self_guild = player_client:QueryProp("GuildName")
    local allowEscort = true
	if self_guild == "" or self_guild == nil or self_guild == 0 then
		allowEscort = false
	end
	local combobox_des = form.combobox_dynamic_escortfriend
	if combobox_des.DroppedDown then
		combobox_des.DroppedDown = false
	end
    combobox_des.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Không ké tiêu"))
	local combobox_des2 = form.combobox_dynamic_escortfriend2
	if combobox_des2.DroppedDown then
		combobox_des2.DroppedDown = false
	end
    combobox_des2.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Không ké tiêu"))
    if allowEscort then
        local arrayRecordName = {"rec_buddy", "rec_friend", "rec_attention"}
        for j = 1, table.getn(arrayRecordName) do
            local RecordTable = arrayRecordName[j]
            local rows = player_client:GetRecordRows(RecordTable)
            for i = 0, rows - 1 do
                local player_name = player_client:QueryRecord(RecordTable, i, 1)
                local player_guild = player_client:QueryRecord(RecordTable, i, 6)
                -- Chí hữu cùng bang và đang online
                if player_guild == self_guild then
                    combobox_des.DropListBox:AddString(player_name)
                    combobox_des2.DropListBox:AddString(player_name)
                end
            end
        end
    end
	combobox_des.Text = nx_function("ext_utf8_to_widestr", "Không ké tiêu")
	combobox_des2.Text = nx_function("ext_utf8_to_widestr", "Không ké tiêu")
    
    -- Hạn giờ bắt cóc
	local combobox_lt1 = form.combobox_dynamic_limittime_from
	if combobox_lt1.DroppedDown then
		combobox_lt1.DroppedDown = false
	end
    combobox_lt1.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Không G.Hạn"))
	local combobox_lt2 = form.combobox_dynamic_limittime_to
	if combobox_lt2.DroppedDown then
		combobox_lt2.DroppedDown = false
	end
    combobox_lt2.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Không G.Hạn"))
    for j = 1, 24 do
        combobox_lt1.DropListBox:AddString(nx_widestr(j - 1))
        combobox_lt2.DropListBox:AddString(nx_widestr(j - 1))
    end
	combobox_lt1.Text = nx_widestr("0")
	combobox_lt2.Text = nx_widestr("22")
    
    form.map = map
    dynamic_posmap = posMap
    dynamic_selldata = sellDataMap
    dynamic_waitpos = waitpos
    dynamic_homepoint = homepoint
    local prestall = prestallPos[map]
    if prestall ~= nil then
        dynamic_prestall = prestall
    end
    
    form.btn_dynamic_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    form.lbl_dynamic_status.Text = nx_function("ext_utf8_to_widestr", "Có thể thực hiện")
end

set_form_type_static = function(form)
    auto_is_running_dynamic = false
    current_form_type = "static"
	
    if not nx_is_valid(form) then
		return 0
	end
	
    form.typestatic.Checked = true
    form.typedynamic.Checked = false
    
    form.GroupTypedynamic.Visible = false
    form.GroupTypestatic.Visible = true
    
	local map = get_current_map()
	local data_pos = get_abduct_pos(map)
	local combobox_pos = form.combobox_pos
	combobox_pos.Text = nx_widestr("")
	combobox_pos.DropListBox:ClearString()
	if combobox_pos.DroppedDown then
		combobox_pos.DroppedDown = false
	end
	local combobox_time = form.combobox_time
	combobox_time.Text = nx_widestr("20")
	combobox_time.DropListBox:ClearString()
	if combobox_time.DroppedDown then
		combobox_time.DroppedDown = false
	end
	form.btn_control.Text = nx_widestr("...")
	form.lbl_2.Text = util_text(map)
	if data_pos == false then
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
		return 0
	else
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Có thể thực hiện")
	end

	for i = 1, table.getn(data_pos) do
		combobox_pos.DropListBox:AddString(nx_function("ext_utf8_to_widestr", data_pos[i]))
	end
	combobox_pos.Text = nx_function("ext_utf8_to_widestr", data_pos[1])

	for i = 1, 59 do
		combobox_time.DropListBox:AddString(nx_widestr(tostring(i)))
	end

	form.cbtn_integrated_qt.Checked = true
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

stop_type_static = function()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    auto_is_running_static = false
    if form.btn_control.Text ~= nx_widestr("...") then
        form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    end
end

stop_type_dynamic = function()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return
    end
    auto_is_running_dynamic = false
    if form.btn_dynamic_control.Text ~= nx_widestr("...") then
        form.btn_dynamic_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    end
    reset_window_title()
end

on_typedynamic_click = function(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    if current_form_type == "dynamic" then
        return
    end
    stop_type_static()
    set_form_type_dynamic(form)
end

on_typestatic_click = function(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    if current_form_type == "static" then
        return
    end
    stop_type_dynamic()
    set_form_type_static(form)
end

on_form_main_init = function(form)
	form.Fixed = false
	form.is_minimize = false
end

on_main_form_open = function(form)
	change_form_size()
	form.is_minimize = false
	set_form_type_dynamic(form)
end

on_main_form_close = function(form)
	auto_is_running_static = false
	auto_is_running_dynamic = false
    reset_window_title()
	nx_destroy(form)
end

on_btn_close_click = function(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

on_btn_control_click = function(btn)
	if btn.Text == nx_widestr("...") then
		return 0
	end
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running_static then
		stop_type_static()
	else
		auto_is_running_static = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		local map = get_current_map()
		local pos = form.combobox_pos.Text
		local restabducttime = (nx_number(form.combobox_time.Text) * 60)
		local integrated_qt = form.cbtn_integrated_qt.Checked
		auto_run(map, pos, restabducttime, integrated_qt)
	end
end

on_btn_dynamic_control_click = function(btn)
	if btn.Text == nx_widestr("...") then
		return 0
	end
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running_dynamic then
		stop_type_dynamic()
	else
		auto_is_running_dynamic = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_dynamic()
	end
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

on_combobox_pos_selected = function(combobox)
    stop_type_static()
end

on_combobox_time_selected = function(combobox)
    stop_type_static()
end

on_cbtn_integrated_qt_changed = function(cbtn)
    stop_type_static()
end

on_cbtn_dynamic_integrated_qt_changed = function(cbtn)
    stop_type_dynamic()
end

on_cbtn_dynamic_useexe_changed = function(cbtn)
    stop_type_dynamic()
end

on_cbtn_dynamic_fight_changed = function(cbtn)
    stop_type_dynamic()
end

on_cbtn_dynamic_stop_if_beattacked_changed = function(cbtn)
    stop_type_dynamic()
end

on_cbtn_dynamic_chat_attacker_changed = function(cbtn)
    stop_type_dynamic()
end

-- Nhấp nút auto shops
on_cbtn_dynamic_autoshops_changed = function(cbtn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if dynamic_prestall == false then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Map này không hỗ trợ bày shops, bạn không thể bật chức năng này"), 2)
        cbtn.Checked = false
        return
    end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return false
    end    
    if client_player:QueryProp("LogicState") ~= 0 then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Trạng thái xuất vũ khí không thể bày hàng, hãy thu vũ khí trước"), 2)
        cbtn.Checked = false
        return
    end
    stop_type_dynamic()
    -- Thông báo nếu kích hoạt thằng này lên
    if cbtn.Checked == true then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Chú ý: Thiết lập các mặt hàng bày bán cũng như mua trước rồi mới bắt cóc"), 4)
    end
end

-- Thay đổi bạn vận tiêu
on_combobox_dynamic_escortfriend_selected = function(combobox)
    stop_type_static()
end

on_combobox_dynamic_escortfriend2_selected = function(combobox)
    stop_type_static()
end

on_cbtn_dynamic_usespride_changed = function(cbtn)
    stop_type_dynamic()
end

on_cbtn_dynamic_returnhomepoint_changed = function(cbtn)
    stop_type_dynamic()
end

reset_window_title = function()
    local game_config = nx_value("game_config")
    local game_name = nx_widestr(util_text("ui_GameName")) .. nx_widestr("  ") .. nx_widestr(game_config.server_name)
    --nx_function("ext_set_window_title", game_name)
end

get_type_homepoint = function(type_name)
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

send_homepoint_msg_to_server = function(...)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return
    end
    game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_SET_HOMEPOINT), unpack(arg))
end

-- Vứt bỏ con cóc đang ôm
function throwAbduct()
    if get_buff_info("buf_abductor") == nil then
        return false
    end
    local game_visual = nx_value("game_visual")
    if nx_is_valid(game_visual) then
        game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_OFFLINE_GIVEUP_ABDUCT))
    end
    local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_offline\\form_offline_abduct_tip", false, false)
    if nx_is_valid(form) and form.Visible then
        form:Close()
    end
end

-- Lấy danh sách các người đánh mình hoặc đang target vào mình
-- Trả về mảng dạng test thuần
getListAttacker = function()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return {}
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return {}
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return {}
    end
    local fight = nx_value("fight")
    if not nx_is_valid(fight) then
        return {}
    end
    local listAttackersID = {}
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            if (fight:CanAttackPlayer(player_client, obj) and obj:QueryProp("IsAbductor") == 0) or nx_string(player_client.Ident) == nx_string(obj:QueryProp("LastObject")) then
                table.insert(listAttackersID, nx_function("ext_widestr_to_utf8", obj:QueryProp("Name")))
            end
        end
    end
    return listAttackersID
end

