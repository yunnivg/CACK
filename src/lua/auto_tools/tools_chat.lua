require("const_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_functions")
require("util_static_data")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")

local FORM_MAIN_FACE_CHAT = "form_stage_main\\form_main\\form_main_face_chat"
local FORM_MAIN_FACE = "form_stage_main\\form_main\\form_main_face"
local THIS_FORM = "auto_tools\\tools_chat"

local auto_is_running = false
local data_config_checkbox = {
	[CHATTYPE_VISUALRANGE] = "cbtn_chat_visualrange",
	[CHATTYPE_SCENE] = "cbtn_chat_scene",
	[CHATTYPE_TEAM] = "cbtn_chat_team",
	[CHATTYPE_GUILD] = "cbtn_chat_guild",
	[CHATTYPE_SCHOOL] = "cbtn_chat_school",
	[CHATTYPE_WORLD] = "cbtn_chat_world",
	[CHATTYPE_FORCE] = "cbtn_chat_force",
	[CHATTYPE_NEW_SCHOOL] = "cbtn_chat_new_school"
}
local data_config_time = {
	[CHATTYPE_VISUALRANGE] = "ipt_chat_visualrange",
	[CHATTYPE_SCENE] = "ipt_chat_scene",
	[CHATTYPE_TEAM] = "ipt_chat_team",
	[CHATTYPE_GUILD] = "ipt_chat_guild",
	[CHATTYPE_SCHOOL] = "ipt_chat_school",
	[CHATTYPE_WORLD] = "ipt_chat_world",
	[CHATTYPE_FORCE] = "ipt_chat_force",
	[CHATTYPE_NEW_SCHOOL] = "ipt_chat_new_school"
}
local data_config_count = {
	[CHATTYPE_VISUALRANGE] = "lbl_chat_visualrange_count",
	[CHATTYPE_SCENE] = "lbl_chat_scene_count",
	[CHATTYPE_TEAM] = "lbl_chat_team_count",
	[CHATTYPE_GUILD] = "lbl_chat_guild_count",
	[CHATTYPE_SCHOOL] = "lbl_chat_school_count",
	[CHATTYPE_WORLD] = "lbl_chat_world_count",
	[CHATTYPE_FORCE] = "lbl_chat_force_count",
	[CHATTYPE_NEW_SCHOOL] = "lbl_chat_new_school_count"
}
local array_type = {
	CHATTYPE_VISUALRANGE, CHATTYPE_SCENE, CHATTYPE_TEAM, CHATTYPE_GUILD, CHATTYPE_SCHOOL, CHATTYPE_WORLD, CHATTYPE_FORCE, CHATTYPE_NEW_SCHOOL
}
local market_item_table = {}
local market_search_table = {}
local data_stat_count = {}
local data_last_chat = {}
local chat_step = 0

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
			local chat_content = form.txt_content.Text
			if chat_content == nx_widestr("") then
				tools_show_notice(nx_widestr(util_text("ui_stall_shuru_liuyan")), 2)
			else
				if chat_step <= 0 then
					chat_step = table.getn(array_type)
				end
				local chattype = array_type[chat_step]
				local chattimeout = nx_number(nx_int(form[data_config_time[chattype]].Text))
				if chattimeout <= 0 then
					chattimeout = 20
				end
				-- Kiểm tra
				if form[data_config_checkbox[chattype]].Checked == true and (data_last_chat[chattype] == 0 or tools_difftime(data_last_chat[chattype]) >= chattimeout) then
					data_last_chat[chattype] = os.time()
					data_stat_count[chattype] = data_stat_count[chattype] + 1
					chat_content = nx_function("ext_ws_replace", nx_widestr(chat_content), nx_widestr("<font face=\"font_title_tasktrace\" color=\"#ffffff\" >"), nx_widestr(""))
					chat_content = nx_function("ext_ws_replace", nx_widestr(chat_content), nx_widestr("</font>"), nx_widestr(""))
					nx_execute("custom_sender", "custom_chat", nx_int(chattype), nx_widestr(chat_content))
				end
				build_stat_count()
				chat_step = chat_step - 1
			end
		end
		nx_pause(0.2)
	end
end
function reset_stat()
	data_stat_count = {
		[CHATTYPE_VISUALRANGE] = 0,
		[CHATTYPE_SCENE] = 0,
		[CHATTYPE_TEAM] = 0,
		[CHATTYPE_GUILD] = 0,
		[CHATTYPE_SCHOOL] = 0,
		[CHATTYPE_WORLD] = 0,
		[CHATTYPE_FORCE] = 0,
		[CHATTYPE_NEW_SCHOOL] = 0
	}
	data_last_chat = {
		[CHATTYPE_VISUALRANGE] = 0,
		[CHATTYPE_SCENE] = 0,
		[CHATTYPE_TEAM] = 0,
		[CHATTYPE_GUILD] = 0,
		[CHATTYPE_SCHOOL] = 0,
		[CHATTYPE_WORLD] = 0,
		[CHATTYPE_FORCE] = 0,
		[CHATTYPE_NEW_SCHOOL] = 0
	}
end
function build_stat_count()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	for i = 1, table.getn(array_type) do
		form[data_config_count[array_type[i]]].Text = nx_widestr(data_stat_count[array_type[i]])
	end
end
function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end
function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
	form.ipt_search_key.Text = nx_widestr(util_text("ui_trade_search_key"))
	form.combobox_itemname.config = false
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
	chat_step = table.getn(array_type)
	reset_stat()
	build_stat_count()
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

function on_combobox_itemname_selected(self)
  local form = self.ParentForm
  if not nx_is_valid(form) then
    return
  end
  local index = form.combobox_itemname.DropListBox.SelectIndex
  if index < table.getn(market_item_table) then
    form.combobox_itemname.config = market_item_table[index + 1]
    form.btn_search_key.Enabled = true
  end
  form.ipt_search_key.Text = form.combobox_itemname.Text
  form.combobox_itemname.Text = nx_widestr("")
end
function on_ipt_search_key_get_focus(self)
  local gui = nx_value("gui")
  gui.hyperfocused = self
  if nx_string(self.Text) == nx_string(util_text("ui_trade_search_key")) then
    self.Text = ""
  end
end
function on_ipt_search_key_lost_focus(self)
  local form = self.ParentForm
  if not nx_is_valid(form) then
    return
  end
  if nx_string(self.Text) == nx_string("") then
    self.Text = nx_widestr(util_text("ui_trade_search_key"))
  end
end
function on_ipt_search_key_changed(self)
  local form = self.ParentForm
  if not nx_is_valid(form) then
    return
  end
  if nx_string(self.Text) == nx_string("") then
    show_search_item(form)
    return
  end
  if nx_string(self.Text) == nx_string(util_text("ui_trade_search_key")) then
    return
  end
  local gui = nx_value("gui")
  local ItemQuery = nx_value("ItemQuery")
  if not nx_is_valid(ItemQuery) then
    return
  end
  form.combobox_itemname.DropListBox:ClearString()
  local search_table = ItemQuery:FindItemsByName(nx_widestr(self.Text))
  market_item_table = {}
  for i = 1, nx_number(table.getn(search_table)) do
    local item_config = search_table[i]
    local bExist = ItemQuery:FindItemByConfigID(nx_string(item_config))
    if bExist == true then
      local IsMarketItem = ItemQuery:GetItemPropByConfigID(nx_string(item_config), nx_string("IsMarketItem"))
      if nx_int(IsMarketItem) == nx_int(1) then
        local static_data = ItemQuery:GetItemPropByConfigID(nx_string(item_config), nx_string("LogicPack"))
        local bind_type = item_static_query(nx_int(static_data), "BindType", STATIC_DATA_ITEM_LOGIC)
        if nx_int(bind_type) ~= nx_int(1) and gui.TextManager:IsIDName(search_table[i]) then
          form.combobox_itemname.DropListBox:AddString(nx_widestr(util_text(search_table[i])))
          table.insert(market_item_table, search_table[i])
        end
      end
    end
  end
  if not form.combobox_itemname.DroppedDown then
    form.combobox_itemname.DroppedDown = true
  end
end
function show_search_item(form)
  if not nx_is_valid(form) then
    return
  end
  if nx_int(table.getn(market_search_table)) <= nx_int(0) then
    return
  end
  form.combobox_itemname.DropListBox:ClearString()
  market_item_table = {}
  for i = table.getn(market_search_table), 1, -1 do
    form.combobox_itemname.DropListBox:AddString(nx_widestr(util_text(market_search_table[i])))
    table.insert(market_item_table, market_search_table[i])
  end
  if not form.combobox_itemname.DroppedDown then
    form.combobox_itemname.DroppedDown = true
  end
end
function on_btn_chat_face_click(btn)
  local gui = nx_value("gui")
  local form = btn.ParentForm
  gui.Focused = form.txt_content
  local face_form = nx_value(FORM_MAIN_FACE_CHAT)
  if nx_is_valid(face_form) then
    nx_gen_event(face_form, "selectface_return", "cancel", "")
  else
    local form_main_face = nx_execute("util_gui", "util_get_form", FORM_MAIN_FACE, true, false, "", true)
    nx_set_value(FORM_MAIN_FACE_CHAT, form_main_face)
    form_main_face.AbsLeft = btn.AbsLeft + btn.Width
    form_main_face.AbsTop = btn.AbsTop
    form_main_face.type = 1
    form_main_face.vip_face_type = 2
    form_main_face.Visible = true
    form_main_face:Show()
    local res, html = nx_wait_event(100000000, form_main_face, "selectface_return")
    local form_auto_chat = nx_value(THIS_FORM)
    if res == "ok" and nx_is_valid(form_auto_chat) then
      add_item_to_chatedit(form, html)
    end
    form_main_face:Close()
  end
  nx_set_value(FORM_MAIN_FACE_CHAT, nil)
end
function add_item_to_chatedit(form, html)
  form.txt_content:Append(html, -1)
  local gui = nx_value("gui")
  gui.Focused = form.txt_content
end
function add_hyperlink(html)
  local form = nx_value(THIS_FORM)
  if not nx_is_valid(form) then
    return
  end
  console(nx_string(html))
  add_item_to_chatedit(form, html)
end
function on_txt_content_get_focus(redit)
  local gui = nx_value("gui")
  gui.hyperfocused = redit
end
function on_txt_content_enter(redit)
  local form = redit.ParentForm
end
function on_btn_search_key_click(self)
  local form = self.ParentForm
  if not nx_is_valid(form) then
    return
  end
  local item_config = form.combobox_itemname.config
  if item_config ~= false then
    local html = nx_widestr("<a href=\"item,") .. nx_widestr(item_config) .. nx_widestr("\" style=\"HLChatItem\">") .. nx_widestr("<") .. util_text(item_config) .. nx_widestr(">") .. nx_widestr("</a>")
	add_item_to_chatedit(form, html)
  end
end
