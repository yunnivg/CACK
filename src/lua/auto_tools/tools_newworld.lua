require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_newworld"
local FORM_MAP_SCENE = "form_stage_main\\form_map\\form_map_scene"

local auto_is_running = false
-- Danh sách các PNC đã bỏ qua (có phân biệt tọa độ)
local dissmiss_npclist = {}
-- Danh sách các PNC đã bỏ qua (không phân biệt tọa độ)
local dissmiss_npc_byname = {}
-- Trạng thái đánh dấu NPC hiện tại
local current_pointnpc_show = false

-- Hàm chạy quét NPC
function do_scannpc()
	while auto_is_running == true do			
        local form = nx_value(THIS_FORM)
        if not nx_is_valid(form) then
            auto_is_running = false
            return false
        end
        
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
		
		if is_vaild_data == true then
            form.mltbox_scannpc:Clear()
            local game_scence_objs = game_scence:GetSceneObjList()
            for i = 1, table.getn(game_scence_objs) do
                local obj = game_scence_objs[i]
                if nx_is_valid(obj) then
                    local visualObj = game_visual:GetSceneObj(obj.Ident)
                    if nx_is_valid(visualObj) then
                        if obj:QueryProp("Type") == 4 and obj:QueryProp("NpcType") == 533 then
                            local posX = string.format("%.0f", visualObj.PositionX)
                            local posZ = string.format("%.0f", visualObj.PositionZ)
                            local text = nx_widestr(util_text(obj:QueryProp("ConfigID")))
                            text = text .. nx_widestr(" (<a href=\"findpath,")
                            text = text .. nx_widestr(game_scence:QueryProp("Resource"))
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(visualObj.PositionX)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(visualObj.PositionY)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(visualObj.PositionZ)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(obj.Ident)
                            text = text .. nx_widestr("\" style=\"HLStype1\">")
                            text = text .. nx_widestr(posX)
                            text = text .. nx_widestr(",")
                            text = text .. nx_widestr(posZ)
                            text = text .. nx_widestr("</a>)")
                            form.mltbox_scannpc:AddHtmlText(text, -1)
                        end
                    end
                end
            end
        end
		nx_pause(0.5)
	end
end

-- Ấn nút quét NPC
function on_btn_scannpc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running then
		auto_is_running = false
        btn.Text = nx_function("ext_utf8_to_widestr", "Phát hiện NPC")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng phát hiện")
		do_scannpc()
	end
end

-- Ấn nút thêm NPC
function on_btn_add_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return
    end

    -- Kiểm tra đối tượng người dùng nhấp vào
    local select_target_ident = player_client:QueryProp("LastObject")
    local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
    local select_visual = game_visual:GetSceneObj(nx_string(select_target_ident))
    if not nx_is_valid(select_target) or not nx_is_valid(select_visual) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Vui lòng nhấp chọn đối tượng cần thêm"), 2)
        return
    end

    -- Kiểm tra đối tượng phải hợp lệ
    if select_target:QueryProp("Type") ~= 4 or select_target:QueryProp("NpcType") ~= 533 then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Đối tượng không hợp lệ"), 2)
        return
    end

    local scene_id = game_scence:QueryProp("Resource")
    local npc_id = select_target:QueryProp("ConfigID")
    local npc_x = string.format("%.3f", select_visual.PositionX)
    local npc_y = string.format("%.3f", select_visual.PositionY)
    local npc_z = string.format("%.3f", select_visual.PositionZ)

    local section_id = npc_id .. "_" .. string.gsub(string.format("%d", select_visual.PositionX), "-", "_") .. "_" .. string.gsub(string.format("%d", select_visual.PositionZ), "-", "_")

    local ini = nx_create("IniDocument")
    if not nx_is_valid(ini) then
        return
    end
    ini.FileName = "autodata\\newworld_" .. scene_id .. ".ini"
    ini:LoadFromFile()

    ini:DeleteSection(section_id)
    ini:WriteString(section_id, "ConfigID", nx_string(npc_id))
    ini:WriteFloat(section_id, "px", nx_float(npc_x))
    ini:WriteFloat(section_id, "py", nx_float(npc_y))
    ini:WriteFloat(section_id, "pz", nx_float(npc_z))

    ini:SaveToFile()
    nx_destroy(ini)
    
    tools_show_notice(nx_function("ext_utf8_to_widestr", "Thêm vào dữ liệu thành công"))
end

-- Xác định danh sách NPC từ file ini
function get_list_npcs()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return false
    end
    local scene_id = game_scence:QueryProp("Resource")
    local ini = nx_execute("util_functions", "get_ini", "..\\bin\\autodata\\newworld_" .. scene_id .. ".ini", true)
    if not nx_is_valid(ini) then
        return false
    end
    local list = {}
    local numnpcs = ini:GetSectionCount()
    local pos = 1
    for i = 0, numnpcs - 1 do
        local npcindex = ini:GetSectionByIndex(i)
        local npccfgid = ini:ReadString(i, "ConfigID", "")
        -- Bỏ qua các npc đã đánh dấu bỏ
        if not in_array(npcindex, dissmiss_npclist) and not in_array(npccfgid, dissmiss_npc_byname) then
            list[pos] = {
                index = npcindex,
                ConfigID = npccfgid,
                px = ini:ReadFloat(i, "px", ""),
                py = ini:ReadFloat(i, "py", ""),
                pz = ini:ReadFloat(i, "pz", "")
            }
            pos = pos + 1
        end
    end
    return list
end

-- Xác định list các NPC đứng gần mình nhất
function get_list_sort_npcs(inputlist)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return false
    end
    
    local list_tmp = inputlist
    local list = {}
    local player_px = game_player.PositionX
    local player_pz = game_player.PositionZ
    
    while table.getn(list_tmp) > 0 do
        local min_distance = 0
        local min_tablekey = 0
        for i = 1, table.getn(list_tmp) do
            local pxd = player_px - list_tmp[i].px
            local pzd = player_pz - list_tmp[i].pz
            local distance = math.sqrt(pxd * pxd + pzd * pzd)
            if min_distance == 0 or distance < min_distance then
                min_distance = distance
                min_tablekey = i
            end
        end
        if min_tablekey > 0 then
            table.insert(list, list_tmp[min_tablekey])
            player_px = list_tmp[min_tablekey].px
            player_pz = list_tmp[min_tablekey].pz
            table.remove(list_tmp, min_tablekey)
        end
    end
    
    return list
end

function create_item_npc(npcinfo)
    local gui = nx_value("gui")
    local groupbox = gui:Create("GroupBox")
    if not nx_is_valid(groupbox) then
        return nx_null()
    end
    
    local btn_go = gui:Create("Button")
    local btn_skip = gui:Create("Button")
    local btn_skipall = gui:Create("Button")
    local btn_delete = gui:Create("Button")
    local lbl_name = gui:Create("Label")
    
    groupbox:Add(btn_go)
    groupbox:Add(btn_skip)
    groupbox:Add(btn_skipall)
    groupbox:Add(btn_delete)
    groupbox:Add(lbl_name)
    
    groupbox.Left = 0
    groupbox.Top = 0
    groupbox.Width = 257
    groupbox.Height = 32
    groupbox.BackColor = "0,255,255,255"
    groupbox.NoFrame = true
    groupbox.BackImage = "gui\\common\\form_back\\bg_donghai1.png"
    groupbox.DrawMode = "Expand"
    groupbox.AutoSize = false
    
    if nx_is_valid(lbl_name) then
        lbl_name.Left = 30
        lbl_name.Top = 8
        lbl_name.Width = 245
        lbl_name.Height = 16
        lbl_name.ForeColor = "255,216,203,55"
        lbl_name.Font = "font_main"
        lbl_name.Align = "Left"
        lbl_name.Text = util_text(npcinfo.ConfigID)
    end
    if nx_is_valid(btn_go) then
        btn_go.NormalImage = "gui\\common\\button\\btn_right\\btn_right_out.png"
        btn_go.FocusImage = "gui\\common\\button\\btn_right\\btn_right_on.png"
        btn_go.CheckedImage = "gui\\common\\button\\btn_right\\btn_right_down.png"
        btn_go.Width = 18
        btn_go.Height = 20
        btn_go.Left = 7
        btn_go.Top = 7
        btn_go.Name = npcinfo.index
        btn_go.px = npcinfo.px
        btn_go.py = npcinfo.py
        btn_go.pz = npcinfo.pz
        btn_go.Text = nx_widestr("")
        btn_go.DrawMode = "FixWindow"
        btn_go.ForeColor = "255,246,255,181"
        nx_bind_script(btn_go, nx_current())
        nx_callback(btn_go, "on_click", "on_btn_go_click")
    end
    if nx_is_valid(btn_skip) then
        btn_skip.NormalImage = "gui\\common\\button\\btn_unlock_out_6.png"
        btn_skip.FocusImage = "gui\\common\\button\\btn_unlock_on_6.png"
        btn_skip.CheckedImage = "gui\\common\\button\\btn_unlock_down_6.png"
        btn_skip.Width = 18
        btn_skip.Height = 18
        btn_skip.Left = 198
        btn_skip.Top = 7
        btn_skip.Name = npcinfo.index
        btn_skip.Text = nx_widestr("")
        btn_skip.DrawMode = "FixWindow"
        btn_skip.ForeColor = "255,246,255,181"
        nx_bind_script(btn_skip, nx_current())
        nx_callback(btn_skip, "on_click", "on_btn_skip_click")
    end
    if nx_is_valid(btn_skipall) then
        btn_skipall.NormalImage = "gui\\common\\button\\btn_minimum_out_9.png"
        btn_skipall.FocusImage = "gui\\common\\button\\btn_minimum_on_9.png"
        btn_skipall.CheckedImage = "gui\\common\\button\\btn_minimum_down_9.png"
        btn_skipall.Width = 18
        btn_skipall.Height = 18
        btn_skipall.Left = 217
        btn_skipall.Top = 7
        btn_skipall.Name = npcinfo.index
        btn_skipall.ConfigID = npcinfo.ConfigID
        btn_skipall.Text = nx_widestr("")
        btn_skipall.DrawMode = "FixWindow"
        btn_skipall.ForeColor = "255,246,255,181"
        nx_bind_script(btn_skipall, nx_current())
        nx_callback(btn_skipall, "on_click", "on_btn_skipall_click")
    end
    if nx_is_valid(btn_delete) then
        btn_delete.NormalImage = "gui\\common\\button\\btn_del_out.png"
        btn_delete.FocusImage = "gui\\common\\button\\btn_del_on.png"
        btn_delete.CheckedImage = "gui\\common\\button\\btn_del_down.png"
        btn_delete.Width = 14
        btn_delete.Height = 14
        btn_delete.Left = 236
        btn_delete.Top = 9
        btn_delete.Name = npcinfo.index
        btn_delete.Text = nx_widestr("")
        btn_delete.DrawMode = "FixWindow"
        btn_delete.ForeColor = "255,246,255,181"
        nx_bind_script(btn_delete, nx_current())
        nx_callback(btn_delete, "on_click", "on_btn_delete_click")
    end
    
    return groupbox
end

-- Viết danh sách Npc
function build_list_npc()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    -- Xác định danh sách NPC
    local list_npcs = get_list_npcs()
    if list_npcs == false then
        return
    end

    -- Tính toán ra list theo thứ tự khoảng cách gần nhất so với người chơi
    local list_sort_npcs = get_list_sort_npcs(list_npcs)
    if list_sort_npcs == false then
        return
    end

    local group = form.GroupListNPC
    group:DeleteAll()

    for i = 1, table.getn(list_sort_npcs) do
        local groupbox = create_item_npc(list_sort_npcs[i])
        if nx_is_valid(groupbox) then
            group:Add(groupbox)
        end
    end

    group:ResetChildrenYPos()
end

-- Ấn nút quét NPC
function on_btn_scannpc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running then
		auto_is_running = false
        btn.Text = nx_function("ext_utf8_to_widestr", "Phát hiện NPC")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng phát hiện")
		do_scannpc()
	end
end

-- Ấn nút danh sách NPC
function on_btn_listnpc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    build_list_npc()
end

-- Ấn nút Reset danh sách NPC
-- Tức xóa đi các NPC đã ẩn
function on_btn_reload_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    dissmiss_npclist = {}
    dissmiss_npc_byname = {}
    build_list_npc()
end

-- Ấn nút bỏ che map: Che và bỏ che
function on_btn_hidemask_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    local form_map = nx_value("form_stage_main\\form_map\\form_map_scene")
    if not nx_is_valid(form_map) then
		return
	end
    if form_map.pic_mask.Visible == true then
        form_map.pic_mask.Visible = false
    else
        form_map.pic_mask.Visible = true
    end
end

-- Ấn nút di chuyển đến
function on_btn_go_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    tools_move(get_current_map(), btn.px, btn.py, btn.pz, true)
end

-- Ấn nút ẩn NPC theo tọa độ
function on_btn_skip_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    table.insert(dissmiss_npclist, btn.Name)
    build_list_npc()
end

-- Ấn nút ẩn NPC bằng tên NPC
function on_btn_skipall_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    table.insert(dissmiss_npc_byname, btn.ConfigID)
    build_list_npc()
end

-- Ấn nút xóa NPC
function on_btn_delete_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", true, false)
    if nx_is_valid(dialog) then
        dialog.mltbox_info.HtmlText = nx_function("ext_utf8_to_widestr", "Xóa NPC bạn sẽ mất thông tin của NPC và không thể khôi phục lại. Sau khi xóa bạn phải tự tìm NPC và thêm lại. Bạn có chắc chắn xóa không?")
        dialog:ShowModal()
        local res = nx_wait_event(100000000, dialog, "confirm_return")
        if res ~= "ok" then
            return
        else
            -- Thực hiện code xóa
            local game_client = nx_value("game_client")
            if not nx_is_valid(game_client) then
                return
            end
            local game_scence = game_client:GetScene()
            if not nx_is_valid(game_scence) then
                return
            end

            local scene_id = game_scence:QueryProp("Resource")

            local ini = nx_create("IniDocument")
            if not nx_is_valid(ini) then
                return
            end
            ini.FileName = "autodata\\newworld_" .. scene_id .. ".ini"
            ini:LoadFromFile()
            ini:DeleteSection(btn.Name)
            ini:SaveToFile()
            nx_destroy(ini)
            
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã xóa NPC ra khỏi danh sách"))

            -- Sau khi xóa thì build lại list có ẩn
            build_list_npc()
        end
    end
end

-- Ấn nút đánh dấu npc
function on_btn_pointpnc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    local formMap = nx_value(FORM_MAP_SCENE)
    if not nx_is_valid(formMap) or formMap.Visible == false then
        nx_execute(FORM_MAP_SCENE, "open_form")
    end
    local formMap = nx_value(FORM_MAP_SCENE)
    if not nx_is_valid(formMap) or formMap.Visible == false then
        return false
    end
    if current_pointnpc_show == true then
        local newword_groupbox = formMap:Find("newword_groupbox")
        if nx_is_valid(newword_groupbox) then
            formMap:Remove(newword_groupbox)
        end
        current_pointnpc_show = false
        return true
    end

    -- Thu nhỏ tối đa cái bản đồ
    local ratio = 1
    formMap.tbar_zoom.Value = formMap.tbar_zoom.Minimum + (formMap.tbar_zoom.Maximum - formMap.tbar_zoom.Minimum) * ratio
    nx_execute("form_stage_main\\form_map\\form_map_scene", "set_map_zoom", formMap, formMap.pic_map.min_zoom_width, formMap.pic_map.min_zoom_height)

    -- Thêm cái mặt che vào cho bản đồ
    local gui = nx_value("gui")
    local pic_map = formMap.pic_map
    local newword_groupbox = gui:Create("GroupBox")
    formMap:Add(newword_groupbox)
    if nx_is_valid(newword_groupbox) then
        newword_groupbox.NoFrame = true
        newword_groupbox.Transparent = false
        newword_groupbox.BackColor = "0,255,255,255"
        newword_groupbox.LineColor = "0,0,255,0"
        newword_groupbox.ShadowColor = "0,0,0,0"
        newword_groupbox.Name = "newword_groupbox"
        newword_groupbox.Width = pic_map.Width
        newword_groupbox.Height = pic_map.Height
        newword_groupbox.Top = formMap.groupbox_map.Top
        newword_groupbox.Left = formMap.groupbox_map.Left
    end

    -- Ẩn mũi tên của map đi
    formMap.btn_trace.Visible = false
    nx_execute(FORM_MAP_SCENE, "set_trace_npc_id", nil, 0, 0, 0, nil, false)
    current_pointnpc_show = true

    local list_npcs = get_list_npcs()
    if list_npcs == false then
        return false
    end
    for i = 1, table.getn(list_npcs) do
        creat_pointpnc_list(newword_groupbox, pic_map, list_npcs[i])
    end
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

function creat_pointpnc_list(newword_groupbox, pic_map, npcinfo)
    if not nx_is_valid(newword_groupbox) then
        return false
    end
    if not nx_is_valid(pic_map) then
        return false
    end
        
    local leftPer = (pic_map.TerrainStartX + pic_map.TerrainWidth - npcinfo["px"]) / pic_map.TerrainWidth
    local topPer = (npcinfo["pz"] - pic_map.TerrainStartZ) / pic_map.TerrainHeight

    local gui = nx_value("gui")
    local btn = gui:Create("Button")
    btn.NormalImage = "track_arrow"
    btn.name = "custombtn_" .. npcinfo["index"]
    btn.Name = "custombtn_" .. npcinfo["index"]
    btn.ConfigID = npcinfo["ConfigID"]
    btn.x = npcinfo["px"]
    btn.y = npcinfo["py"]
    btn.z = npcinfo["pz"]
    btn.Left = nx_int(leftPer * newword_groupbox.Width) - nx_int(12)
    btn.Top = nx_int(topPer * newword_groupbox.Height) - nx_int(44)
    nx_bind_script(btn, nx_current())
    nx_callback(btn, "on_click", "on_btncustom_click")
    nx_callback(btn, "on_get_capture", "on_btncustom_get_capture")
    nx_callback(btn, "on_lost_capture", "on_btncustom_lost_capture")
    nx_callback(btn, "on_right_click", "on_btncustom_right_click")
    newword_groupbox:Add(btn)
end

function on_btncustom_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    tools_move(get_current_map(), btn.x, btn.y, btn.z, true)
end

function on_btncustom_get_capture(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    local formMap = nx_value(FORM_MAP_SCENE)
	if not nx_is_valid(formMap) then
		return
	end
    local gui = nx_value("gui")
    local text = nx_widestr("<font color=\"#E07700\">(") .. nx_widestr(nx_int(btn.x)) .. nx_widestr(",") .. nx_widestr(nx_int(btn.z)) .. nx_widestr(")</font>")
    text = gui.TextManager:GetText(btn.ConfigID) .. nx_widestr("<br>") .. text
    nx_execute("tips_game", "show_text_tip", text, btn.AbsLeft, btn.AbsTop, 0, formMap)
end

function on_btncustom_lost_capture(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    local formMap = nx_value(FORM_MAP_SCENE)
	if not nx_is_valid(formMap) then
		return
	end
    nx_execute("tips_game", "hide_tip", formMap)
end

function on_btncustom_right_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    local formMap = nx_value(FORM_MAP_SCENE)
	if not nx_is_valid(formMap) then
		return
	end
    local newword_groupbox = formMap:Find("newword_groupbox")
    if not nx_is_valid(newword_groupbox) then
        return
    end
    local removeBtn = newword_groupbox:Find(btn.name)
    if nx_is_valid(removeBtn) then
        newword_groupbox:Remove(removeBtn)
    end
end

