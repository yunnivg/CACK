require("const_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_useitems"
local auto_is_running = false

function auto_run()
	while auto_is_running == true do
        local form = nx_value(THIS_FORM)
        local use_interval = nx_number(form.use_interval.Text)
        if use_interval < nx_number(0.1) then
            set_stop()
            return false
        end
        local form_bag = nx_value("form_stage_main\\form_bag")
        while not nx_is_valid(form_bag) or form_bag.Visible == false do
            util_auto_show_hide_form("form_stage_main\\form_bag")
            nx_pause(0.1)
            form_bag = nx_value("form_stage_main\\form_bag")
        end
        if not nx_is_valid(form_bag) or not form_bag.Visible then
            set_stop()
            return false
        end
        -- Chọn tab
        local tab = form.combobox_tab.Text
        local grid
        if tab == util_text("ui_toolbox_equip") then
            form_bag.rbtn_equip.Checked = true
            grid = form_bag.imagegrid_equip
        elseif tab == util_text("ui_toolbox_goods") then
            form_bag.rbtn_tool.Checked = true
            grid = form_bag.imagegrid_tool
        elseif tab == util_text("ui_toolbox_mater") then
            form_bag.rbtn_material.Checked = true
            grid = form_bag.imagegrid_material
        else
            form_bag.rbtn_task.Checked = true
            grid = form_bag.imagegrid_task
        end
        nx_execute("form_stage_main\\form_bag_func", "on_bag_right_click", grid, 0)
        nx_pause(use_interval)
	end
end
function set_stop()
    auto_is_running = false
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    local btn = form.btn_control
    btn.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end
function set_start()
    auto_is_running = true
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    local btn = form.btn_control
    btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
end
function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end
function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
    -- Build Tab túi đồ
	local combobox_tab = form.combobox_tab
	combobox_tab.Text = util_text("ui_toolbox_goods")
	combobox_tab.DropListBox:ClearString()
	if combobox_tab.DroppedDown then
		combobox_tab.DroppedDown = false
	end
    combobox_tab.DropListBox:AddString(util_text("ui_toolbox_equip"))
    combobox_tab.DropListBox:AddString(util_text("ui_toolbox_goods"))
    combobox_tab.DropListBox:AddString(util_text("ui_toolbox_mater"))
    combobox_tab.DropListBox:AddString(util_text("ui_toolbox_task"))
	auto_is_running = false
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
		set_stop()
	else
		set_start()
		auto_run()
	end
end
function on_use_interval_changed()
    set_stop()
end
function on_combobox_tab_selected()
    set_stop()
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
