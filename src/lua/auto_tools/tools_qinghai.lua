require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_qinghai"
local mapqinghai = 1 -- 1 Bồng Lai, 2 Hiệp Khách, 3 Vô Cực

function load_list_quest(maptype)
    local ini = nx_execute("util_functions", "get_ini", "..\\bin\\autodata\\data_qinghai.ini", true)
    if not nx_is_valid(ini) then
        return false
    end
    local list = {}
    local numquests = ini:GetSectionCount()
    local pos = 1
    for i = 0, numquests - 1 do
        local q_id = ini:GetSectionByIndex(i)
        local q_type = ini:ReadInteger(i, "type", 0)
        local q_name = ini:ReadString(i, "name", "")
        local q_text = ini:ReadString(i, "text", "")
        if q_type == maptype then
            list[pos] = {
                qid = q_id,
                qtype = q_type,
                qname = q_name,
                qtext = q_text
            }
            pos = pos + 1
        end
    end
    return list
end

function creat_quest_item(quest)
    local gui = nx_value("gui")
    local groupbox = gui:Create("GroupBox")
    if not nx_is_valid(groupbox) then
        return nx_null()
    end
    
    local btn_view = gui:Create("Button")
    local lbl_name = gui:Create("Label")
    
    groupbox:Add(btn_view)
    groupbox:Add(lbl_name)
    
    groupbox.Left = 0
    groupbox.Top = 0
    groupbox.Width = 360
    groupbox.Height = 32
    groupbox.BackColor = "0,255,255,255"
    groupbox.NoFrame = true
    groupbox.BackImage = "gui\\common\\form_back\\bg_donghai1.png"
    groupbox.DrawMode = "Expand"
    groupbox.AutoSize = false
    
    if nx_is_valid(lbl_name) then
        lbl_name.Left = 30
        lbl_name.Top = 8
        lbl_name.Width = 320
        lbl_name.Height = 16
        lbl_name.ForeColor = "255,216,203,55"
        lbl_name.Font = "font_main"
        lbl_name.Align = "Left"
        lbl_name.Text = nx_function("ext_utf8_to_widestr", quest.qname)
        lbl_name.Name = "lbl_quest_" .. quest.qid
    end
    if nx_is_valid(btn_view) then
        btn_view.NormalImage = "gui\\common\\button\\btn_right\\btn_left4_out.png"
        btn_view.FocusImage = "gui\\common\\button\\btn_right\\btn_left4_on.png"
        btn_view.CheckedImage = "gui\\common\\button\\btn_right\\btn_left4_down.png"
        btn_view.Width = 18
        btn_view.Height = 20
        btn_view.Left = 7
        btn_view.Top = 7
        btn_view.Name = "btn_view_" .. quest.qid
        btn_view.qtext = nx_function("ext_utf8_to_widestr", quest.qtext)
        btn_view.Text = nx_widestr("")
        btn_view.DrawMode = "FixWindow"
        btn_view.ForeColor = "255,246,255,181"
        nx_bind_script(btn_view, nx_current())
        nx_callback(btn_view, "on_click", "on_btn_view_click")
    end
    
    return groupbox
end

function on_btn_view_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    form.mltbox_quest_detail:Clear()
    form.mltbox_quest_detail:AddHtmlText(btn.qtext, -1)
end

function write_quest_list()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    local listQuests = load_list_quest(mapqinghai)
    if listQuests == false then
        return
    end
    local group = form.GroupListQuest
    group:DeleteAll()
    
    for i = 1, table.getn(listQuests) do
        local groupbox = creat_quest_item(listQuests[i])
        if nx_is_valid(groupbox) then
            group:Add(groupbox)
        end
    end
    
    group:ResetChildrenYPos()
end

function reset_form_data()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    form.mltbox_quest_detail:Clear()
    write_quest_list()
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_close(form)
	nx_destroy(form)
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
    mapqinghai = 1
    form.typeBLD.Checked = true
    form.typeHKD.Checked = false
    form.typeVCD.Checked = false
    reset_form_data()
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

function on_typeBLD_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    mapqinghai = 1
    form.typeBLD.Checked = true
    form.typeHKD.Checked = false
    form.typeVCD.Checked = false
    reset_form_data()
end

function on_typeHKD_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    mapqinghai = 2
    form.typeBLD.Checked = false
    form.typeHKD.Checked = true
    form.typeVCD.Checked = false
    reset_form_data()
end

function on_typeVCD_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    mapqinghai = 3
    form.typeBLD.Checked = false
    form.typeHKD.Checked = false
    form.typeVCD.Checked = true
    reset_form_data()
end
