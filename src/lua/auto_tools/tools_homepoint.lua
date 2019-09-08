require("const_define")
require("define\\sysinfo_define")
require("define\\request_type")
require("share\\server_custom_define")
require("share\\client_custom_define")
require("share\\chat_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_functions")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_homepoint"
local HOMEPOINT_INI_FILE = "share\\Rule\\HomePoint.ini"
local SCENE_INI = "share\\Rule\\scenes.ini"
local IsBusy = false

function send_homepoint_msg_to_server(...)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return
    end
    game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_SET_HOMEPOINT), unpack(arg))
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

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
    
    -- Build hướng dẫn
    form.mltbox_hint.Text = nx_function("ext_utf8_to_widestr", "Ấn vào tên điểm dừng chân để trở về")
    
    local iniHP = nx_execute("util_functions", "get_ini", HOMEPOINT_INI_FILE)
    if not nx_is_valid(iniHP) then
        return false
    end
    local HomePointCount = iniHP:GetSectionCount()

    local iniSC = nx_execute("util_functions", "get_ini", SCENE_INI)
    if not nx_is_valid(iniSC) then
        return false
    end
    local SceneCount = iniSC:GetSectionCount()

    -- Build lại 
    local HomePointLists = {}
    local HomePointListsCount = 0
    local HomePointScene = {}
    local HomePointSceneCount = 0

    for i = 0, HomePointCount - 1 do
        local HP = iniHP:GetSectionByIndex(i)
        local Name = iniHP:ReadString(i, "Name", "")
        local Type = iniHP:ReadInteger(i, "Type", 0)
        local SceneID = iniHP:ReadInteger(i, "SceneID", 0)
        
        if (Type == 0 or Type == 1) and SceneID ~= 0 and Name ~= "" then
            if HomePointLists[SceneID] == nil then
                HomePointLists[SceneID] = {}
                HomePointScene[HomePointSceneCount] = SceneID
                HomePointSceneCount = HomePointSceneCount + 1
                HomePointListsCount = 0
            end
            HomePointLists[SceneID][HomePointListsCount] = {
                HP = HP,
                Name = Name,
                Type = Type,
                SceneID = SceneID
            }
            HomePointListsCount = HomePointListsCount + 1
        end
    end

    local root = form.tree_hp:CreateRootNode(nx_widestr("OBJ TREES"))
    for i = 0, HomePointSceneCount - 1 do
        local scene_id = HomePointScene[i]
        local scene_name = nx_widestr("Unknow Map ") .. nx_widestr(i)
        local scene_index = iniSC:FindSectionIndex(nx_string(scene_id))
        if scene_index >= 0 then
            local name = iniSC:ReadString(scene_index, "Config", "")
            name = util_split_string(name, "\\")
            if table.getn(name) >= 3 then
                name = name[3]
                name = util_split_string(name, "_")
                if string.sub(name[1], 0, 6) == "scene0" then
                    scene_name = util_text("tvt_" .. name[1])
                elseif name[1] == "school09" then
                    scene_name = util_text("ui_yihua")
                elseif name[1] == "school10" then
                    scene_name = util_text("ui_taohua")
                else
                    scene_name = util_text(name[1])
                end
            end
        else
            scene_name = util_text("ui_scene_" .. scene_id)
        end
        
        local gather_type_node = root:CreateNode(scene_name)
        gather_type_node.IsHomePoint = false
        gather_type_node.id = ""
        gather_type_node.DrawMode = "FitWindow"
        gather_type_node.ExpandCloseOffsetX = 0
        gather_type_node.ExpandCloseOffsetY = 2
        gather_type_node.TextOffsetX = 25
        gather_type_node.TextOffsetY = 1
        gather_type_node.NodeOffsetY = 5
        gather_type_node.ForeColor = "255,255,180,0"
        gather_type_node.Font = "font_main"
        gather_type_node.NodeBackImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 2, "out")
        gather_type_node.NodeFocusImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 2, "on")
        gather_type_node.NodeSelectImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 2, "on")
        
        local NumHPIn = table.getn(HomePointLists[scene_id])
        
        for j = 0, NumHPIn do
            local ThisHP = HomePointLists[scene_id][j]
            local subnode
            local node_name = util_text(ThisHP.Name)
            subnode = gather_type_node:CreateNode(nx_widestr(node_name))
            subnode.IsHomePoint = true
            subnode.id = ThisHP.HP
            subnode.TextOffsetX = 25
            subnode.TextOffsetY = 1
            subnode.Font = "font_main"
            subnode.NodeBackImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 3, "out")
            subnode.NodeFocusImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 3, "on")
            subnode.NodeSelectImage = nx_execute("form_stage_main\\form_life\\form_job_gather", "get_treeview_bg", 3, "on")
        end
        
        root.Expand = true
    end
end
function on_main_form_close(form)
	nx_destroy(form)
end
function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end
function on_tree_hp_select_changed(self)
    if IsBusy then
        return false
    end
    local form = self.Parent
    local node = self.SelectNode
    if node.IsHomePoint and node.id ~= "" then
        IsBusy = true
        
        -- Điểm dừng chân cần thêm
        local hp = node.id

        -- Lấy list điểm dừng chân
        local game_client = nx_value("game_client")
        local client_player = game_client:GetPlayer()
        if not nx_is_valid(client_player) then
            IsBusy = false
            return false
        end

        local IsExists = false
        local HomePointCount = client_player:GetRecordRows("HomePointList")
        for i = 0, HomePointCount - 1 do
            if hp == client_player:QueryRecord("HomePointList", i, 0) then
                IsExists = true
                break
            end
        end

        -- Nếu chưa thêm điểm dừng chân
        if not IsExists then
            -- Xác định số điểm dừng chân đã mở
            local Max1 = client_player:QueryProp("JiangHuHomePointCount")
            if Max1 < 2 then
                tools_show_notice(nx_function("ext_utf8_to_widestr", "Hãy mở tối thiểu hai điểm dừng chân giang hồ mới có thể sử dụng chức năng này"), 2)
                IsBusy = false
                return false
            end
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

        send_homepoint_msg_to_server(1, hp, 4) -- 1: Trở về điểm dừng chân 4: Điểm dừng chân giang hồ
        IsBusy = false
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
