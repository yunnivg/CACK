require("util_gui")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")

local inspect = require("auto_tools\\inspect")

-- Function for scene
function tools_getsceneobj_byid(id)
	local game_client = nx_value("game_client")
	if not nx_is_valid(game_client) then
		return false
	end
	local client_scene_obj = game_client:GetSceneObj(nx_string(id))
	if not nx_is_valid(client_scene_obj) then
		return false
	end
	return client_scene_obj
end
function get_powerlevel(level)
  if nx_number(level) < 6 then
    return "tips_title_0"
  elseif nx_number(level) >= 151 then
    return "tips_title_151"
  elseif nx_number(level) >= 136 then
    return "tips_title_136"
  elseif nx_number(level) >= 121 then
    return "tips_title_121"
  end
  if 6 <= level % 10 then
  elseif 6 == 0 then
  else
  end
  return "tips_title_" .. nx_string(nx_int(level / 10 - 1) * 10 + 1)
end

function tools_show_notice(info, noticetype)
	if noticetype == nil then
		noticetype = 3
	end
	nx_value("SystemCenterInfo"):ShowSystemCenterInfo(info, noticetype)
end
function tools_difftime(t)
	if t == nil then
		return os.time()
	end
	return os.difftime(os.time(), t)
end
function in_array(item, array)
	for _,v in pairs(array) do
		if v == item then
			return true
		end
	end
	return false
end

function console(str, isdebug)
    local file = io.open("D:\\log.txt", "a")
    if file == nil then
        nx_value("SystemCenterInfo"):ShowSystemCenterInfo(nx_widestr("Can't open file D:\\log.txt, please check this file!"), 3)
    else
        file:write(inspect(str))
        if isdebug ~= nil then
            file:write("\n")
            file:write(inspect(getmetatable(str)))
            file:write("\n--------------------------------------")
        end
        file:write("\n")
        file:close()
    end
end

function consoleAttacker(str, isdebug)
    local file = io.open("D:\\logAttacker.txt", "a")
    if file == nil then
        nx_value("SystemCenterInfo"):ShowSystemCenterInfo(nx_widestr("Can't open file D:\\logAttacker.txt, please check this file!"), 3)
    else
        file:write(inspect(str))
        if isdebug ~= nil then
            file:write("\n")
            file:write(inspect(getmetatable(str)))
            file:write("\n--------------------------------------")
        end
        file:write("\n")
        file:close()
    end
end

function tools_move(scene, x, y, z, passtest)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
	end
	if passtest ~= nil and passtest == true then
		tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu tìm đường"))
		nx_value("path_finding"):FindPathScene(scene, x, y, z, 0)
		return true
	end
	local beforeX = string.format("%.3f", game_player.PositionX)
	local beforeY = string.format("%.3f", game_player.PositionY)
	local beforeZ = string.format("%.3f", game_player.PositionZ)
	nx_pause(1)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
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
  	end
end

function tools_move_isArrived(x, y, z, offset)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
	end
	if offset == nil then
		offset = 1
	end

	local px = string.format("%.3f", game_player.PositionX)
	local py = string.format("%.3f", game_player.PositionY)
	local pz = string.format("%.3f", game_player.PositionZ)

	local pxd = px - x
	local pyd = py - y
	local pzd = pz - z

  	local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)

  	if offset >= distance then
  	  return true
  	end
  	return false
end

function tools_move_isArrived2D(x, y, z, offset)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
	end
	if offset == nil then
		offset = 1
	end

	local px = string.format("%.3f", game_player.PositionX)
	local py = string.format("%.3f", game_player.PositionY)
	local pz = string.format("%.3f", game_player.PositionZ)

	local pxd = px - x
	local pyd = py - y
	local pzd = pz - z

  	local distance = math.sqrt(pxd * pxd + pzd * pzd)

  	if offset >= distance then
  	  return true
  	end
  	return false
end

function get_buff_info(buff_id, obj)
	-- Nếu tồn tại buff_id thì trả về thời gian của buff đó, nếu buff không có thời gian thì trả về 0
	-- Nếu không tồn tại buff thì thả về nil
    local objGetBuff = nil
    if obj == nil then
        local game_client = nx_value("game_client")
        if not nx_is_valid(game_client) then
            return nil
        end
        objGetBuff = game_client:GetPlayer()
    else
        objGetBuff = obj
    end
    if not nx_is_valid(objGetBuff) then
        return nil
    end
	for i = 1, 25 do
		local buff = objGetBuff:QueryProp("BufferInfo" .. tostring(i))
        if buff ~= 0 and buff ~= "" then
            local buff_info = util_split_string(buff, ",")
            local buff_name = nx_string(buff_info[1])
            if nx_string(buff_id) == nx_string(buff_name) then
                local buff_time = buff_info[4]
                if nx_int(buff_time) == nx_int(0) then
                    return 0
                end
                local MessageDelay = nx_value("MessageDelay")
                if not nx_is_valid(MessageDelay) then
                    return nil
                end
                local server_now_time = MessageDelay:GetServerNowTime()
                local buff_diff_time = tonumber((buff_time - server_now_time) / 1000) -- Unit timesamp
                return buff_diff_time
            end
        end
	end
	return nil
end

function print_r(t)
	local text_table = ""
	local print_r_cache = {}

	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			text_table = text_table .. indent .. "*" .. tostring(t) .. "\n"
		else
			print_r_cache[tostring(t)] = true

			if (type(t) == "table") then
				for pos, val in pairs(t) do
					if (type(val) == "table") then
						text_table = text_table .. indent.."["..pos.."] => "..tostring(t).." {" .. "\n"
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						text_table = text_table .. indent..string.rep(" ",string.len(pos)+6).."}" .. "\n"
					elseif (type(val)=="string") then
						text_table = text_table .. indent.."["..pos..'] => "'..val..'"' .. "\n"
					else
						text_table = text_table .. indent.."["..pos.."] => "..tostring(val) .. "\n"
					end
				end
			else
				text_table = text_table .. indent..tostring(t) .. "\n"
			end
		end
	end
	if (type(t)=="table") then
		text_table = text_table .. tostring(t).." {" .. "\n"
		sub_print_r(t,"    ")
		text_table = text_table .. "}" .. "\n"
	else
		sub_print_r(t,"    ")
	end
	return text_table
end

function auto_capture_qt(obj_list)
	if obj_list == nil then
		local game_client = nx_value("game_client")
		if not nx_is_valid(game_client) then
			return false
		end
		local game_scence = game_client:GetScene()
		if not nx_is_valid(game_scence) then
			return false
		end
		obj_list = game_scence:GetSceneObjList()
	end

	local obj_num = table.getn(obj_list)
	local has_qt = false
	for i = 1, obj_num do
		if obj_list[i]:FindProp("Type") and obj_list[i]:QueryProp("Type") == 4 and obj_list[i]:FindProp("ConfigID") then
			local npc_id = obj_list[i]:QueryProp("ConfigID")
			local qt_data = get_qt_data(npc_id)
			local npc_ident = nx_property(obj_list[i], "Ident")
			if qt_data ~= false and npc_ident ~= nil then
				-- Mở cái bảng nói chuyện
				local is_talking = false
				local num_select_NPC = 0
				while (is_talking == false and num_select_NPC < 30) do
					num_select_NPC = num_select_NPC + 1
					nx_execute("custom_sender", "custom_select", npc_ident)
					nx_pause(0.2)
					local form_talk = util_get_form("form_stage_main\\form_talk_movie", true)
					is_talking = form_talk.Visible
				end

				-- Cuộc hội thoại nhận kỳ ngộ
				for j = 1, table.getn(qt_data) do
					nx_pause(0.6)
					nx_execute("form_stage_main\\form_talk_movie", "menu_select", qt_data[j])
				end

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
						nx_execute("form_stage_main\\form_give_item", "on_btn_mail_click", form_giveitems1.btn_mail)
					end
				end

				has_qt = true
				break
			end
		end
	end

	if has_qt == true then
		local game_client = nx_value("game_client")
		if not nx_is_valid(game_client) then
			return false
		end
		local game_scence = game_client:GetScene()
		if not nx_is_valid(game_scence) then
			return false
		end
		return game_scence:GetSceneObjList()
	else
		return obj_list
	end
end

function get_qt_data(npc_id)
	-- Thành Trường Nghĩa (Đả Cẩu Bổng)
	if npc_id == "gb340" then
		return {"841002737", "841002738", "840027381"}
	end
	-- Thù Di (Tham Hợp Chỉ)
	if npc_id == "Npc_qygp_chz_002" then
		return {"841006739", "840067390"}
	end
	-- Tiêu Dao Sơn Nhân (Thái Cực Quyền)
	if npc_id == "wd004" then
		return {"841001121", "841001122", "841001123", "840011231"}
	end
	-- Từ Lão Hán (Nữ Nhi Hồng x4)
	if npc_id == "npc_qygp_zy_xlh2" then
		return {"841004884", "841004885", "100011213", "101011213"}
	end
	-- Tiểu Mẫn (Thiết 1)
	if npc_id == "npc_qy_luxia_xiaomin_0" then
		return {"841005683", "100012257", "101012257"}
	end
	-- Tô Tú Vân (Thiết 2)
	--if npc_id == "WorldNpc01146" then
	--	return {"841001445", "840014451"}
	--end
	-- Ô Hạ (Nữ Nhi Hồng x4)
	if npc_id == "npc_qygp_cc_wu" then
		return {"841004886", "100018911", "101018911"}
	end
	-- Bốc Man Tài (Gà Nướng Trui)
	if npc_id == "NPC_qygp_bybukuai" then
		return {"841004952", "100018240", "101018240"}
	end
	-- Trần Tiểu Thành (Nghịch Thiên Tà Công)
	if npc_id == "funnpcskill002001" then
		return {"841004298", "841004299", "841004300", "840043000"}
	end
	-- Nhạc Minh Kha (Mảnh Thác Bản)
	if npc_id == "WorldNpc_qywx_007" then
		return {"841006152", "100010345", "101010345"}
	end
	-- Ngô Quỳnh (Kim Ngân Hoa)
	if npc_id == "Npc_qygp_chz_003" then
		return {"841006740", "840067400"}
	end
	-- Chồn con (Điêu nhung)
	--if npc_id == "npc_cwqy_cc_01" then
	--	return {"841004405", "100012222", "101012222"}
	--end
	-- La Sát Nữ (Tàn Dương)
	if npc_id == "qy_ng_cjbook_jh_202" then
		return {"841003673", "840036730"}
	end
	-- La Sát Nữ (Vô Vọng)
	if npc_id == "qy_ng_cjbook_jh_201" then
		return {"841003672", "840036720"}
	end
	-- La Sát Nữ (Tử Hà)
	if npc_id == "qy_ng_cjbook_jh_204" then
		return {"841003675", "840036750"}
	end
	-- Năng Chuyên Đô (Bệ Xảo 2)
	--if npc_id == "WorldNpc09727" then
	--	return {"841001239", "840012391"}
	--end
	-- Thành Bích Quân (Đả Cẩu Bổng)
	if npc_id == "WorldNpc09611" then
		return {"841001143", "841001072", "840010721"}
	end
	-- Tổ Hưng (Long Trảo Thủ)
	if npc_id == "WorldNpc00343" then
		return {"841001465", "841001466", "841001467", "841001517", "841001518", "841001519", "840015191"}
	end
	-- Lư Đại Thúc (Phệ Ma Tán)
	if npc_id == "npc_qygp_dy_wle" then
		return {"841004887", "100018763", "101018763"}
	end
	-- Võ tăng tuần tra (Long Trảo Thủ)
	if npc_id == "sl006" then
		return {"841000819", "841000820", "840008201"}
	end
	-- Dị Hương (Thái Cực Quyền)
	if npc_id == "wd061" then
		return {"841001313", "841001314", "840013141"}
	end
	-- Thanh Pháp (Long Trảo Thủ)
	if npc_id == "FuncNpc00718" then
		return {"841001330", "841001331", "841001332", "840013321"}
	end
	-- Lý Thu Hà (Thái Cực Quyền)
	if npc_id == "wd013" then
		return {"841001715", "840017151"}
	end
	-- Phan Thắng Dịch (Đả Cấu Bổng)
	if npc_id == "WorldNpc08409" then
		return {"841001661", "841001662", "840016621"}
	end
	-- Tằng Thị Lộc (Thái Cực Quyền)
	if npc_id == "WorldNpc10474" then
		return {"841001036", "841001795", "841001183", "840011831"}
	end
	-- Phú Thương Cát Tiền (Du mộc)
	if npc_id == "wd016" then
		return {"841000879", "841000936", "840009361"}
	end
	-- Kiếm Ngô Khu (Phệ Ma Tán)
	if npc_id == "NPC_qygp_tjq_jmy001" then
		return {"841004877", "841004878", "841004879", "841004880", "841004881", "841004882", "841004883", "100010930", "101010930"}
	end
	-- Bành Xương Quý (Đả Cẩu Bổng)
	if npc_id == "WorldNpc04349" then
		return {"841002465", "841002466", "841002467", "841002468", "841002470", "100017404", "101017404"}
	end
	-- Mật Lư - Trị Giang (Yết Chi Thượng Hạng) - Bỏ, rẻ rờ
	--if npc_id == "Npc_qygp_shl_002" then
		--return {"841008048", "841008049", "840080490"}
	--end
    -- Thanh Phục - Long Trảo Thủ
    if npc_id == "FuncNpc00717" then
        return {"841001023", "841001038", "841001041", "841001116", "841001327", "840013271"}
    end
    -- Lão Khất - Đả Cẩu Bổng
    if npc_id == "npc_qygp_x01" then
        return {"841004902", "100056061", "101056061", "102056061"}
    end
	return false
end

function tool_getPickForm()
	local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"
	local waitCount = 0
	local isOkForm = false

	while 1 do
		local form = nx_value(PICK_FORM)
		if not nx_is_valid(form) or not form.Visible then
			return
		end
		waitCount = waitCount + 1
		if nx_find_custom(form, "readyTriggerPick") and form.readyTriggerPick then
			isOkForm = true
			break
		end
		if waitCount >= 20 then
			break
		end
		nx_pause(0.1)
	end

	if isOkForm then
		nx_pause(1)
		local form = nx_value(PICK_FORM)
		if nx_is_valid(form) and form.Visible then
			nx_execute(PICK_FORM, "on_btn_pick_click", form.btn_pick)
			nx_pause(0.1)
		end
	end
end

function is_moving(offset)
	local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return true
	end
	local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return true
	end
    if offset == nil then
        offset = 0.2
    end
	local beforeX = string.format("%.3f", game_player.PositionX)
	local beforeY = string.format("%.3f", game_player.PositionY)
	local beforeZ = string.format("%.3f", game_player.PositionZ)
	nx_pause(0.2)
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
    -- Nếu vẫn bị di chuyển thì giảm số này xuống nhỏ hơn nữa
  	if distance <= offset then
		return false
  	end
    return true
end

function find_npc_pos(scene_id, search_npc_id)
    local mgr = nx_value("SceneCreator")
    if nx_is_valid(mgr) then
        local res = mgr:GetNearestNpcPos(scene_id, search_npc_id)
        if res ~= nil and table.getn(res) == 3 then
            return res[1], res[2], res[3]
        end
    end
    return -10000, -10000, -10000
end

function tools_trace_npc(scene_id, npc_id)
    local x, y, z = find_npc_pos(scene_id, npc_id)
    local path_finding = nx_value("path_finding")
    if not nx_is_valid(path_finding) then
        return false
    end
    local trace_flag = path_finding.AutoTraceFlag
    if -10000 < nx_number(x) then
        if trace_flag == 1 then
            path_finding:TraceTargetByID(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
        else
            path_finding:DrawToTarget(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
        end
    else
        return false
    end
    return true
end

function tools_trace_npc_with_pos(scene_id, npc_id, x, y, z)
    local path_finding = nx_value("path_finding")
    if not nx_is_valid(path_finding) then
        return false
    end
    local trace_flag = path_finding.AutoTraceFlag
    if trace_flag == 1 then
        path_finding:TraceTargetByID(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
    else
        path_finding:DrawToTarget(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
    end
    return true
end

function get_current_map(showtext)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nx_string("")
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return nx_string("")
    end
    if showtext == nil then
        return game_scence:QueryProp("Resource")
    else
        return game_scence:QueryProp("ConfigID")
    end
end

-- Lên các loại tọa kỵ đặc biệt
function callTheSpecialRiding()
    -- Đang cưỡi thì kết thúc
    if get_buff_info("buf_riding_01") ~= nil then
        return true
    end
    local goods_grid = nx_value("GoodsGrid")
    if not nx_is_valid(goods_grid) then
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
    local rideArray = {
        "newyear_mount_1", -- Tam Dương Liên (30 ngày)
        "newyear_mount_2", -- Tam Dương Liên (7 ngày)
        "mount_2_001" -- Lạc Đà
    }
    for j = 1, table.getn(rideArray) do
        local rideID = rideArray[j]
        if goods_grid:GetItemCount(rideID) > 0 then
            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", rideID)
            nx_pause(8)
            local game_scence_objs = game_scence:GetSceneObjList()
            for i = 1, table.getn(game_scence_objs) do
                local obj = game_scence_objs[i]
                if nx_is_valid(obj) then
                    local visualObj = game_visual:GetSceneObj(obj.Ident)
                    if nx_is_valid(visualObj) then
                        if obj:QueryProp("Type") == 4 and obj:QueryProp("RideName") == rideID and obj:QueryProp("HostName") == client_player:QueryProp("Name") then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Lên tọa kỵ"))
                            local ident = obj.Ident
                            nx_execute("custom_sender", "custom_select", nx_string(ident))
                            nx_pause(0.2)
                            nx_execute("custom_sender", "custom_select", nx_string(ident))
                            nx_pause(3)
                            return true
                        end
                    end
                end
            end
        end
    end
end

-- Phục vụ việc đánh đấm

-- Biến này lưu tạm để đỡ phải query nhiều
local skillSetData = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = nil,
    [5] = nil,
    [6] = nil
}

-- Trả về collType và CollGroupType của skill thứ index
function getSkillData(grid, index)
    local setIndex = index + 1
    if skillSetData[setIndex] ~= nil then
        return skillSetData[setIndex].stype, skillSetData[setIndex].gtype
    end
    if not nx_is_valid(grid) then
        return -1, -1
    end
    local itemName = grid:GetItemName(index)
    if nx_widestr(itemName) == nx_widestr("") then
        return -1, -1
    end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return -1, -1
    end
    local view = game_client:GetView(nx_string(40))
    if not nx_is_valid(view) then
        return -1, -1
    end
    local viewobj_list = view:GetViewObjList()
    for i = 1, table.getn(viewobj_list) do
        local configID = viewobj_list[i]:QueryProp("ConfigID")
        if util_text(configID) == itemName then
            local cool_type = skill_static_query_by_id(configID, "CoolDownCategory")
            local cool_team = skill_static_query_by_id(configID, "CoolDownTeam")
            skillSetData[setIndex] = {
                stype = cool_type,
                gtype = cool_team
            }
            return cool_type, cool_team
        end
    end
    return -1, -1
end

-- Reset lại dữ liệu skill
function resetSkillData()
    skillSetData = {
        [1] = nil,
        [2] = nil,
        [3] = nil,
        [4] = nil,
        [5] = nil,
        [6] = nil
    }
end

-- Xuất skill đánh tới tấp
function killCompetitor(obj)
    local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
    local form = nx_value(FORM_SHORTCUT_PATH)
    if not nx_is_valid(form) then
        return false
    end
    local grid = form.grid_shortcut_main
    if not nx_is_valid(grid) then
        return false
    end
    local gui = nx_value("gui")
    if not nx_is_valid(gui) then
        return false
    end
    if not nx_is_valid(obj) then
        return false
    end
    -- Ô đầu tiên là ô phá def
    local gindex = 0
    local readyDestroyParry = false
    local cool_type, cool_team = getSkillData(grid, gindex)
    if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
        readyDestroyParry = true
    end
    if get_buff_info("BuffInParry", obj) ~= nil and readyDestroyParry then
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

-- Lấy tọa độ hiện tại của nhân vật
function get_current_player_pos()
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return nil
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return nil
    end
    return {game_player.PositionX, game_player.PositionY, game_player.PositionZ}
end

-- Nhảy 1 phát đến tọa độ nào đó
-- Khoảng cách nhảy không quá lớn
function jump_to(pos, stepDistance, stepPause)
    if stepDistance == nil then
        stepDistance = 50
    end
    if stepPause == nil then
        stepPause = 2
    end
    if not tools_move_isArrived(pos[1], pos[2], pos[3], 0.5) then
        local x = nx_float(pos[1])
        local y = nx_float(pos[2])
        local z = nx_float(pos[3])
        local px = string.format("%.3f", nx_string(x))
        local py = string.format("%.3f", nx_string(y))
        local pz = string.format("%.3f", nx_string(z))

        local game_visual = nx_value("game_visual")
        if not nx_is_valid(game_visual) then
            return false
        end
        local role = nx_value("role")
        if not nx_is_valid(role) then
            return false
        end
        local scene_obj = nx_value("scene_obj")
        if not nx_is_valid(scene_obj) then
            return false
        end
        scene_obj:SceneObjAdjustAngle(role, x, z)
        role.move_dest_orient = role.AngleY
        role.server_pos_can_accept = true
        -- game_visual:SwitchPlayerState(role, 1, 5)
        -- game_visual:SwitchPlayerState(role, 1, 6)
        -- game_visual:SwitchPlayerState(role, 1, 7)
        -- if y > role.PositionY then
          role:SetPosition(role.PositionX, y, role.PositionZ)
        -- end
        game_visual:SetRoleMoveDestX(role, x)
        game_visual:SetRoleMoveDestY(role, y)
        game_visual:SetRoleMoveDestZ(role, z)
        game_visual:SetRoleMoveDistance(role, stepDistance)
        --game_visual:SetRoleMaxMoveDistance(role, 1)
        game_visual:SetRoleMaxMoveDistance(role, stepDistance)
        game_visual:SwitchPlayerState(role, 1, 103)
        nx_pause(stepPause)
    end
end

-- Kiểm tra có đang dịch chuyển không để nhảy
function jump_to_pos(pos, stepDistance, stepPause)
    local form_map = nx_value("form_stage_main\\form_map\\form_map_scene")
    local game_visual = nx_value("game_visual")
    if pos == nil or pos[1] == nil or pos[2] == nil or pos[3] == nil or not nx_is_valid(game_visual) or nx_is_valid(nx_value("form_common\\form_loading")) then
        return nil
    end
    
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) or game_player == nil or not nx_is_valid(nx_value("path_finding")) or form_map == nil or not nx_is_valid(form_map) or form_map.current_map == nil then
        return nil
    end
    
    local x, y, z = nx_float(pos[1]), nx_float(pos[2]), nx_float(pos[3])
    local fx, fy, fz = nx_string(x),nx_string(y), nx_string(z)
    fx, fy, fz = string.format("%.3f", fx), string.format("%.3f", fy), string.format("%.3f", fz)

    local beforeX = string.format("%.3f", game_player.PositionX)
    local beforeY = string.format("%.3f", game_player.PositionY)
    local beforeZ = string.format("%.3f", game_player.PositionZ)
    nx_pause(1)
    if nx_is_valid(nx_value("form_common\\form_loading")) then 
        return nil 
    end
    local afterX = string.format("%.3f", game_player.PositionX)
    local afterY = string.format("%.3f", game_player.PositionY)
    local afterZ = string.format("%.3f", game_player.PositionZ)

    local pxd = beforeX - afterX
    local pyd = beforeY - afterY
    local pzd = beforeZ - afterZ

    local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
    if distance <= 0.6 then
        -- Kiểm tra nếu không di chuyển thì mới bắt dầu dịch chuyển
        local game_client = nx_value("game_client")
        if not nx_is_valid(game_client) then
            return false
        end
        local player = game_client:GetPlayer()
        if not nx_is_valid(player) then
            return false
        end
        local state = player:QueryProp("State")
        if nx_string(state) == "" or state == nil or state == 0 then
            jump_to(pos, stepDistance, stepPause)
        end
    end
    return true
end

-- Xác định tọa độ Y (độ cao) từ X và Z
-- Dữ liệu trả về có Y lớn hơn 20m so với thực tế để đảm bảo nhảy trên không trung
function get_pos_y_from_xz(terrain, x, z)
    if not nx_is_valid(terrain) then
        return 0, 0
    end
    local floor_index = 0
    local y = terrain:GetPosiY(x, z)
    if terrain:GetWalkWaterExists(x, z) and y < terrain:GetWalkWaterHeight(x, z) then
        -- Nếu có nước và độ cao ở dưới nước thì thiết đặt Y trên mặt nước 15 mét
        y = terrain:GetWalkWaterHeight(x, z) + 15
    else
        -- Hàm get_pos_floor_index nằm ở util_move
        -- Xác định tầng và độ cao của tầng
        local floor, floor_y = get_pos_floor_index(terrain, x, y, z)
        if floor > -1 then
            y = floor_y
            floor_index = floor
        end
    end
    
    return y + 20, floor_index
end

--[[
Bug tới tọa độ trong MAP
    dest: Mảng tọa độ
    stepDistance: Khoảng cách mỗi step nên là 40 - 50, tùy khu vực mà có thể nên thu nhỏ xuống
    stepPause: Thời gian mỗi bước nhảy. Mặc định là 2
    fixedY: Cố định phương cao nhảy, mặc định là không: Một số MAP có thể xác định sai Y do đó cần thiết cố định chiều cao nhảy
]]--
function jump_direct_to_pos(dest, stepDistance, stepPause, fixedY)
    if stepDistance == nil then
        stepDistance = 45
    end
    local currentPos = get_current_player_pos()
    if currentPos == nil then
        return false
    end
    -- Xác đinh khoảng cách theo phương X và phương Z
    local dx = dest[1] - currentPos[1]
    local dz = dest[3] - currentPos[3]
    
    local a = dz / dx
    local b = dest[3] - a * dest[1]
    
    -- Xác định khoảng cách 2D điểm đứng và điểm đến để tính ra số lần dịch chuyển
    local distance = math.sqrt(dx * dx + dz * dz)
    local steps = math.ceil(distance / stepDistance)
    
    -- Mỗi bước dịch chuyển bằng
    local dxStepDistance = dx / steps
    
    local current_step = 1
    while current_step <= steps and not nx_value("loading") do
        nx_pause(0)
        local scene = nx_value("game_scene")
        if not nx_is_valid(scene) then
            return false
        end
        local terrain = scene.terrain
        if not nx_is_valid(terrain) then
            return false
        end
        tools_show_notice(nx_widestr(current_step .. "/" .. steps))
        local x = currentPos[1] + dxStepDistance * current_step
        local z = a * x + b
        local y, floor_index = get_pos_y_from_xz(terrain, x, z)
        if current_step == steps then
            x = dest[1]
            z = dest[3]
            y = y - 20
            floor_index = nil
        end
        local pos = {x, y, z}
        -- Xử lý khi cố định chiều cao
        if fixedY ~= nil then
            -- Ở bước nhảy cuối cùng
            if current_step == steps then
                if dest[2] > -1000 then
                    -- Nếu thiết lập chiều cao nhảy thì chiều cao nhảy là giá trị thiết lập
                    pos[2] = dest[2] + 0.5
                    -- Nếu không thiết lập thì 
                end
            else
                -- Ở các bước nhảy khác thì 
                -- Chiều cao nhảy là chiều cao cố định
                pos[2] = fixedY
            end 
        end
        jump_to_pos(pos, stepDistance, stepPause)
        current_step = current_step + 1
    end
end

-----------------------
-- Hàm phụ
-- 
function normalize_angle(angle)
    local value = math.fmod(angle, math.pi * 2)
    if value < 0 then
        value = value + math.pi * 2
    end
    return value
end

--------------------------
-- Hàm phụ tính Radian thành độ
-- 
function radian_to_degree(radian)
  return math.floor(normalize_angle(radian) * 3600 / (math.pi * 2)) * 0.1
end

-------------------------------
-- Xác định AngleY giữa hai điểm
function getAngleForward(myposx, myposz, toposx, toposz)
    -- x tương ứng trục y. z tương ứng trục x trong mặt phẳng tọa độ
    local x1 = myposz
    local x2 = toposz
    local y1 = myposx
    local y2 = toposx
    if x2 == x1 then
        return 0
    end
    local tana = math.abs(y2 - y1) / math.abs(x2 - x1)
    local radian = math.atan(tana)
    if x2 > x1 and y2 > y1 then
        radian = radian
    elseif x2 < x1 and y2 > y1 then
        radian = math.pi - radian
    elseif x2 < x1 and y2 < y1 then
        radian = math.pi + radian
    elseif x2 > x1 and y2 < y1 then
        radian = (2 * math.pi) - radian
    end
    return radian
end

--------------------------
-- Cho nhân vật đi thẳng tới
-- 
function setPlayerHackMove()
    local role = nx_value("role")
    if not nx_is_valid(role) then
        return false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    game_visual:SwitchPlayerState(role, 1, 3)
end

----------------------------
-- Cho nhân vật dừng lại
-- 
function stopPlayerHackMove()
    local role = nx_value("role")
    if not nx_is_valid(role) then
        return false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    game_visual:SwitchPlayerState(role, "static", 1)
end

------------------------------
-- Xóa nội dung log trong form
-- 
function clearLogForm()
    local formName = "auto_tools\\tools_logform"
    local form = util_show_form(formName, true)
    if nx_is_valid(form) then
        form.mltbox_content:Clear()
    end
end

-----------------------------------
-- Log vào form
-- 
function logToForm(text, wided)
    if text == nil then
        return
    end
    if wided == nil or not wided then
        text = nx_function("ext_utf8_to_widestr", text)
    else
        text = nx_widestr(text)
    end
    local formName = "auto_tools\\tools_logform"
    local form = util_show_form(formName, true)
    if nx_is_valid(form) then
        form.mltbox_content:AddHtmlText(text, -1)
    end
end

--------------------------------
-- Xác định chiều cao của điểm trên MAP
-- trả về 1 là chiều cao đứng
-- 2 là chiều cao cao nhất
-- 
function getInfoHeightOfPos(x, z)
    local scene = nx_value("game_scene")
    if not nx_is_valid(scene) then
        return nil
    end
    local terrain = scene.terrain
    if not nx_is_valid(terrain) then
        return nil
    end
    -- Chiều cao thực tế tại một điểm
    local posY = terrain:GetPosiY(x, z)
    -- Chiều cao nhân vật sẽ đứng trên mặt đất tại một điểm
    local walkHeight = terrain:GetWalkHeight(x, z)
    -- Chiều cao tối đa tại một điểm
    local maxHeight = walkHeight
    local floorHeightTable = {}
    local floor_count = terrain:GetFloorCount(x, z)
    for i = floor_count - 1, 0, -1 do
        local floor_height = terrain:GetFloorHeight(x, z, i)
        if floor_height ~= posY then
            table.insert(floorHeightTable, floor_height)
        end
        if floor_height > maxHeight then
            maxHeight = floor_height
        end
    end
    -- Kiểm tra chiều cao mặt nước
    local waterHeight = -10000
    if terrain:GetWalkWaterExists(x, z) then
        waterHeight = terrain:GetWalkWaterHeight(x, z)
    end
    -- Nếu chiều cao của nước hơn chiều cao lầu thì trả về chiều cao nước
    if waterHeight > maxHeight then
        maxHeight = waterHeight
    end
    -- Nếu chiều cao của nước hơn chiều cao đứng thì trả về chiều cao nước
    if waterHeight > walkHeight then
        walkHeight = waterHeight
    end
    return walkHeight, maxHeight, waterHeight
end
