require("utils")
require("public")
function main_form_init(form)
  form.Fixed = false
  init_custom_property(form)
  return 1
end
function main_form_open(form)
  form.pbar_update.Value = 100
  form.pbar_download.Value = 100
  form.gbox_content.Visible = false
  form.gbox_setting.Visible = false
  form.btn_select.Enabled = false
  form.lbl_tishi_info.Text = nx_widestr("")
  load_url_config()
  form.login_type = get_login_type()
  form.cbtn_default_login_type.Checked = nx_number(form.login_type) ~= 0
  local url_list = nx_value("url_list")
  if not nx_is_valid(url_list) then
    return 1
  end
  if url_list.welcome_isshow == "1" then
    switch_func_page(form, "page_welcome")
  else
    switch_func_page(form, "page_server")
  end
  nx_execute(nx_current(), "run_loadcfg_process", form, "")
  nx_execute(nx_current(), "run_loadset_process", form)
  return 1
end
function btn_close_click(self)
  local form = self.ParentForm
  if form.switch_state == SWITCH_STATE_DOWNLOAD then
    local res = disp_confirm(util_text_0("msg_switch_cancel"))
    if res == "cancel" then
      return 0
    end
  elseif form.switch_state == SWITCH_STATE_APPLY then
    local res = disp_confirm(util_text_0("msg_switch_stop"))
    if res == "cancel" then
      return 0
    end
  end
  if form.close_confirm then
    local res = disp_confirm(util_text_0("msg_updater_close"))
    if res == "cancel" then
      return 0
    end
  end
  form.web_leftup:Disable()
  form.web_leftdown:Disable()
  form.web_rightup:Disable()
  save_system_set(form)
  nx_execute("main", "exit_game")
end
function btn_minimize_click(self)
  local world = nx_value("world")
  world:ShowMinimize()
  return 1
end
function init_custom_property(form)
  form.last_version = VERSION_NUM_UNKNOWN
  form.patch_all_size = 0
  form.patch_cur_size = 0
  form.child_server = nx_null()
  form.area_name = ""
  form.area_addr = ""
  form.area_port = ""
  form.server_id = ""
  form.server_name = ""
  form.server_addr = ""
  form.server_port = ""
  form.server_type = ""
  form.server_stat = ""
  form.server_hot = ""
  form.server_sdo = ""
  form.server_time = ""
  form.real_area_name = ""
  form.close_confirm = false
  form.switch_state = SWITCH_STATE_STOP
  form.content = ""
  form.link = ""
  form.program_sel = ""
  form.system_set_save = false
  form.system_set_change = true
  form.md5_infos = ""
  form.login_type = 0
end
function on_btn_url_click(self)
  local url_list = nx_value("url_list")
  if nx_is_valid(url_list) and nx_find_custom(url_list, self.DataSource) then
    nx_function("ext_open_url", nx_custom(url_list, self.DataSource))
  end
end
function on_btn_url_get_capture(self)
  local form = self.ParentForm
  local ani_ctrl = nx_custom(form, "ani_" .. self.DataSource)
  if nx_is_valid(ani_ctrl) then
    ani_ctrl:Stop()
    ani_ctrl:Play()
  end
end
function on_btn_url_lost_capture(self)
  local form = self.ParentForm
  local ani_ctrl = nx_custom(form, "ani_" .. self.DataSource)
  if nx_is_valid(ani_ctrl) then
    ani_ctrl:Stop()
  end
end
function on_btn_set_click(self)
  switch_func_page(self.ParentForm, "page_setting")
end
function on_btn_new_click(self)
  switch_func_page(self.ParentForm, "page_content")
end
function on_btn_enter_click(self)
  local form = self.ParentForm
  if form.server_type ~= "" and select_one_server(form) == 1 then
    return 1
  end
  switch_func_page(form, "page_server")
end
function on_btn_select_click(self)
  select_one_server(self.ParentForm)
end
function on_btn_server_click(self)
  switch_func_page(self.ParentForm, "page_server")
end
function on_btn_return_click(self)
  switch_func_page(self.ParentForm, "page_update")
end
function on_btn_reset_click(self)
  local form = self.ParentForm
  init_system_set(form)
  show_system_set(form)
end
function on_btn_repair_click(self)
  local world = nx_value("world")
  if not nx_is_valid(world) then
    return 0
  end
  local url_list = nx_value("url_list")
  if not nx_is_valid(url_list) then
    return 0
  end
  if url_list.repair_isopen == "0" then
    disp_error(util_text_0("msg_repair_close"))
    return 0
  end
  if world.mini_client == 1 then
    disp_error(util_text_0("msg_mini_client_confirm"))
    return 0
  end
  nx_execute(nx_current(), "run_repair_process", self.ParentForm, false)
end
function on_btn_showtype_click(self)
  switch_func_page(self.ParentForm, "page_logintype")
end
function on_btn_login_type_click(self)
  local form = self.ParentForm
  form.login_type = nx_number(self.DataSource)
  switch_func_page(form, "page_update")
end
function on_btn_start_click(self)
  local form = self.ParentForm
  if nx_number(form.login_type) == 0 then
    switch_func_page(form, "page_logintype")
    return 0
  end
  run_enter_game(self.ParentForm, false)
end
function run_enter_game(form, is_show_type)
  if not nx_is_valid(form) then
    return 1
  end
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return 1
  end
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local world = nx_value("world")
  if form.server_stat == SERVER_STATUS_UNUSED or form.server_stat == SERVER_STATUS_GETTING or form.server_stat == "" then
    if form.content ~= "" and form.link ~= "" then
      disp_error(util_text_3("msg_start_game_cant_2", utf8_to_widestr(form.content), utf8_to_widestr(form.link), "HLStype1"))
    else
      disp_error(util_text_3("msg_start_game_cant_1"))
    end
    return 1
  end
  nx_execute(nx_current(), "refresh_file_certificate")
  if not check_file_md5(form) then
    disp_error(util_text_0("msg_client_file_bad"))
    return 1
  end
  nx_function("ext_set_environment_string", "wn_jy_check_dll_md5", form.md5_infos)
  local area_name = string.gsub(utf8_to_string(form.real_area_name), " ", "")
  local server_name = string.gsub(utf8_to_string(form.server_name), " ", "")
  local exe_file = root_path .. "bin\\fxgame.exe"
  local exe_para = nx_string(nx_function("ext_get_tickcount_string")) .. " " .. form.server_addr .. " " .. form.server_port .. " " .. area_name .. "-" .. server_name .. " " .. form.area_addr .. " " .. form.area_port .. " " .. form.server_sdo .. " " .. form.login_type .. " " .. world.login_str
  if not nx_file_exists(exe_file) then
    disp_error(util_text_1("msg_run_game_failed", exe_file))
    return 1
  end
  if game_config.Language == "" and check_is_can_sel_language() then
    local res, language = disp_language(get_def_language_path())
    if res == "ok" then
      game_config.Language = language
      form.system_set_save = true
    end
  end
  if world.sb_handle ~= "" then
    nx_function("ext_send_message", world.sb_handle, exe_file .. " " .. exe_para)
  elseif not package_man:ExecuteProgram(exe_file, exe_para) then
    disp_error(util_text_1("msg_run_game_failed", exe_file))
    return 1
  end
  save_system_set(form)
  set_server_last(form.area_addr, form.real_area_name, form.server_id, form.server_name)
  if form.cbtn_default_login_type.Checked == true then
    set_login_type(form.login_type)
  else
    set_login_type(0)
  end
  nx_execute("main", "exit_game")
  return 1
end
function on_btn_language_click(self)
  local form = self.ParentForm
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return 1
  end
  local language = game_config.Language
  if language == "" then
    language = get_def_language_path()
  end
  local res, language = disp_language(language)
  if res == "cancel" then
    return 1
  end
  game_config.Language = language
  form.system_set_save = true
  return 1
end
function on_tree_area_select_changed(self)
  local form = self.ParentForm
  form.area_name = widestr_to_utf8(self.SelectNode.Text)
  show_server_list(form)
  if nx_running(nx_current(), "run_refresh_server_status") then
    nx_kill(nx_current(), "run_refresh_server_status")
  end
  nx_execute(nx_current(), "run_refresh_server_status", form)
end
function on_server_select_changed(self, index)
  local form = self.ParentForm
  if not nx_find_custom(self, "child_server") then
    return 0
  end
  local child_server = self.child_server
  if not nx_is_valid(child_server) then
    return 0
  end
  show_select_server(form, child_server)
end
function on_server_double_click(self)
  select_one_server(self.ParentForm)
end
function on_btn_tjserver_sel_click(self)
  local form = self.ParentForm
  if not nx_find_custom(self, "child_server") or not nx_is_valid(self.child_server) then
    return 0
  end
  local child_server = self.child_server
  show_select_server(form, child_server)
  local sel_area_node = form.tree_area.RootNode:FindNode(utf8_to_widestr(form.area_name))
  if nx_is_valid(sel_area_node) then
    form.tree_area.SelectNode = sel_area_node
  end
  select_one_server(form)
end
function show_area_list(form)
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    return 0
  end
  local gui = nx_value("gui")
  local imagelist = gui:CreateImageList()
  imagelist:AddImage("gui\\form_back\\area_icon_empty.png")
  imagelist:AddImage("gui\\form_back\\area_icon_dx.png")
  imagelist:AddImage("gui\\form_back\\area_icon_wt.png")
  imagelist:AddImage("gui\\form_back\\area_icon_db.png")
  form.tree_area.ImageList = imagelist
  form.tree_area.ItemHeight = 30
  local root_node = form.tree_area:CreateRootNode(nx_widestr(""))
  local area_tab = server_list:GetChildList()
  for i = 1, table.getn(area_tab) do
    local child_area = area_tab[i]
    local area_node = root_node:CreateNode(utf8_to_widestr(child_area.Name))
    if nx_is_valid(area_node) then
      area_node.NodeBackImage = "gui\\button\\btn_area_out.png"
      area_node.NodeFocusImage = "gui\\button\\btn_area_on.png"
      area_node.NodeSelectImage = "gui\\button\\btn_area_down.png"
      area_node.Font = "font_btn"
      area_node.ItemHeight = 57
      area_node.NodeOffsetY = 4
      area_node.TextOffsetX = 5
      area_node.TextOffsetY = 16
      area_node.LevelWidth = 0
      area_node.NodeImageOffsetX = 0
      area_node.NodeImageOffsetY = 0
      area_node.ImageIndex = nx_number(child_area.area_type)
    end
  end
  root_node.Expand = true
  local sel_area_node = root_node:FindNode(utf8_to_widestr(form.area_name))
  if not nx_is_valid(sel_area_node) then
    local area_node_tab = root_node:GetNodeList()
    sel_area_node = area_node_tab[1]
  end
  form.tree_area.SelectNode = sel_area_node
end
function show_server_list(form)
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    return 0
  end
  local all_inc_patch = nx_value("all_inc_patch")
  if not nx_is_valid(all_inc_patch) then
    return 0
  end
  local version_nor = all_inc_patch.last_version
  local version_exp = all_inc_patch.gray_version
  if version_nor == VERSION_NUM_UNKNOWN then
    version_nor = util_text_0("ui_version_unknown")
  end
  if version_exp == VERSION_NUM_UNKNOWN then
    version_exp = util_text_0("ui_version_unknown")
  end
  form.grid_server:ClearRow()
  form.grid_server:ClearSelect()
  if not nx_find_custom(form, "area_name") or form.area_name == "" then
    return 0
  end
  local child_area = server_list:GetChild(form.area_name)
  if not nx_is_valid(child_area) then
    return 0
  end
  local list_tab = child_area:GetChildList()
  local show_count = 1
  for i = 1, table.getn(list_tab) do
    local child_list = list_tab[i]
    local server_tab = child_list:GetChildList()
    for j = 1, table.getn(server_tab) do
      local child_server = server_tab[j]
      if check_double_server_is_show(child_server) then
        local server_hot_icon = get_recommend_image(child_server.server_hot)
        local server_name = child_server.server_name
        local server_stat_icon = get_status_image(child_server.server_stat)
        local server_stat_desc = get_status_desc(child_server.server_stat)
        local server_stat_color = get_status_color(child_server.server_stat)
        local server_ping = nx_widestr(nx_string(child_server.server_ping) .. "ms")
        if nx_number(child_server.server_ping) == SERVER_PING_NOCONNECT and nx_number(child_server.server_stat) ~= SERVER_STATUS_UNUSED then
          child_server.server_ping = SERVER_PING_UNKNOWN
        end
        if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
          server_ping = ""
        elseif nx_number(child_server.server_ping) <= SERVER_PING_NOCONNECT then
          server_ping = util_text_0("ui_server_noconnect")
        end
        local gbox_svr_ctrl = create_grid_ctrl("GroupBox", "ServerGbox")
        local lbl_hoticon_ctrl = create_grid_ctrl("Label", "ServerHotIconLbl")
        local lbl_name_ctrl = create_grid_ctrl("Label", "ServerNameLbl")
        local lbl_ping_ctrl = create_grid_ctrl("Label", "ServerPingLbl")
        local lbl_staticon_ctrl = create_grid_ctrl("Label", "ServerStateIconLbl")
        local lbl_statdesc_ctrl = create_grid_ctrl("Label", "ServerStateDescLbl")
        local cbtn_sel_ctrl = create_grid_ctrl("CheckButton", "ServerSelCbtn")
        if not nx_is_valid(gbox_svr_ctrl) or not nx_is_valid(lbl_name_ctrl) or not nx_is_valid(lbl_hoticon_ctrl) or not nx_is_valid(lbl_ping_ctrl) or not nx_is_valid(lbl_ping_ctrl) or not nx_is_valid(lbl_staticon_ctrl) or not nx_is_valid(lbl_statdesc_ctrl) or not nx_is_valid(cbtn_sel_ctrl) then
          break
        end
        lbl_hoticon_ctrl.BackImage = server_hot_icon
        lbl_name_ctrl.Text = utf8_to_widestr(server_name)
        lbl_ping_ctrl.Text = server_ping
        lbl_staticon_ctrl.BackImage = server_stat_icon
        lbl_statdesc_ctrl.Text = server_stat_desc
        lbl_statdesc_ctrl.ForeColor = server_stat_color
        if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
          lbl_ping_ctrl.BackImage = "getping"
        else
          lbl_ping_ctrl.BackImage = ""
        end
        nx_bind_script(cbtn_sel_ctrl, nx_current())
        nx_callback(cbtn_sel_ctrl, "on_checked_changed", "on_server_select_changed")
        nx_callback(cbtn_sel_ctrl, "on_left_double_click", "on_server_double_click")
        gbox_svr_ctrl.lbl_hoticon_ctrl = lbl_hoticon_ctrl
        gbox_svr_ctrl.lbl_name_ctrl = lbl_name_ctrl
        gbox_svr_ctrl.lbl_ping_ctrl = lbl_ping_ctrl
        gbox_svr_ctrl.lbl_staticon_ctrl = lbl_staticon_ctrl
        gbox_svr_ctrl.lbl_statdesc_ctrl = lbl_statdesc_ctrl
        gbox_svr_ctrl.cbtn_sel_ctrl = cbtn_sel_ctrl
        gbox_svr_ctrl:Add(cbtn_sel_ctrl)
        gbox_svr_ctrl:Add(lbl_hoticon_ctrl)
        gbox_svr_ctrl:Add(lbl_name_ctrl)
        gbox_svr_ctrl:Add(lbl_ping_ctrl)
        gbox_svr_ctrl:Add(lbl_staticon_ctrl)
        gbox_svr_ctrl:Add(lbl_statdesc_ctrl)
        cbtn_sel_ctrl.child_server = child_server
        local row = form.grid_server:InsertRow(-1)
        form.grid_server:SetGridControl(show_count - 1, 0, gbox_svr_ctrl)
        show_count = show_count + 1
        if nx_find_custom(form, "server_name") and form.server_name == child_server.server_name then
          cbtn_sel_ctrl.Checked = true
          show_select_server(form, child_server)
          form.grid_server:SelectRow(row)
        end
      end
    end
  end
end
function remove_select_server(form)
  for i = 1, form.grid_server.RowCount do
    local group = form.grid_server:GetGridControl(i - 1, 0)
    if not nx_find_custom(group, "cbtn_sel_ctrl") or not nx_find_custom(group, "lbl_name_ctrl") or not nx_find_custom(group, "lbl_ping_ctrl") then
      break
    end
    local cbtn_sel_ctrl = group.cbtn_sel_ctrl
    local lbl_name_ctrl = group.lbl_name_ctrl
    local lbl_ping_ctrl = group.lbl_ping_ctrl
    if not nx_is_valid(cbtn_sel_ctrl) or not nx_is_valid(lbl_name_ctrl) or not nx_is_valid(lbl_ping_ctrl) then
      break
    end
    if not nx_find_custom(cbtn_sel_ctrl, "child_server") or not nx_is_valid(cbtn_sel_ctrl.child_server) then
      break
    end
    local child_server = cbtn_sel_ctrl.child_server
    if form.server_name ~= child_server.server_name then
      cbtn_sel_ctrl.Enabled = false
      cbtn_sel_ctrl.Checked = false
      cbtn_sel_ctrl.Enabled = true
    else
      cbtn_sel_ctrl.Enabled = false
      cbtn_sel_ctrl.Checked = true
      cbtn_sel_ctrl.Enabled = true
    end
  end
end
function show_server_last(form)
  form.lbl_tjserver_area_0.Text = nx_widestr("")
  form.lbl_tjserver_name_0.Text = nx_widestr("")
  form.lbl_tjserver_stat_ping_0.Text = nx_widestr("")
  form.lbl_tjserver_stat_icon_0.BackImage = ""
  form.lbl_tjserver_stat_desc_0.Text = nx_widestr("")
  form.btn_tjserver_sel_0.child_server = nx_null()
  form.lbl_tjserver_cover_0.Visible = true
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    return 0
  end
  local area_addr_last = get_server_last("area_addr")
  local server_id_last = get_server_last("server_id")
  local area_tab = server_list:GetChildList()
  for i = 1, table.getn(area_tab) do
    local child_area = area_tab[i]
    local child_list = child_area:GetChild(area_addr_last)
    if nx_is_valid(child_list) then
      local child_server = child_list:GetChild(server_id_last)
      if nx_is_valid(child_server) then
        show_select_server(form, child_server)
        form.lbl_tjserver_area_0.Text = utf8_to_widestr(child_server.area_name)
        form.lbl_tjserver_name_0.Text = utf8_to_widestr(child_server.area_name) .. utf8_to_widestr("-") .. utf8_to_widestr(child_server.server_name)
        form.lbl_tjserver_stat_icon_0.BackImage = nx_string(get_status_image(child_server.server_stat))
        local server_ping = nx_widestr(nx_string(child_server.server_ping) .. "ms")
        if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
          server_ping = util_text_0("ui_server_wait")
        elseif nx_number(child_server.server_ping) <= SERVER_PING_NOCONNECT then
          server_ping = util_text_0("ui_server_noconnect")
        end
        form.lbl_tjserver_stat_ping_0.Text = server_ping
        form.lbl_tjserver_stat_desc_0.Text = get_status_desc(child_server.server_stat)
        form.lbl_tjserver_stat_desc_0.ForeColor = get_status_color(child_server.server_stat)
        form.btn_tjserver_sel_0.child_server = child_server
        form.lbl_tjserver_cover_0.Visible = false
      end
      break
    end
  end
end
function show_server_tuijian(form)
  form.lbl_tjserver_area_1.Text = nx_widestr("")
  form.lbl_tjserver_name_1.Text = nx_widestr("")
  form.lbl_tjserver_stat_ping_1.Text = nx_widestr("")
  form.lbl_tjserver_stat_icon_1.BackImage = ""
  form.lbl_tjserver_stat_desc_1.Text = nx_widestr("")
  form.btn_tjserver_sel_1.child_server = nx_null()
  form.lbl_tjserver_cover_1.Visible = true
  form.lbl_tjserver_area_2.Text = nx_widestr("")
  form.lbl_tjserver_name_2.Text = nx_widestr("")
  form.lbl_tjserver_stat_ping_2.Text = nx_widestr("")
  form.lbl_tjserver_stat_icon_2.BackImage = ""
  form.lbl_tjserver_stat_desc_2.Text = nx_widestr("")
  form.btn_tjserver_sel_2.child_server = nx_null()
  form.lbl_tjserver_cover_2.Visible = true
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    return 0
  end
  local new_server_count = 0
  local area_tab = server_list:GetChildList()
  for i = 1, table.getn(area_tab) do
    local child_area = area_tab[i]
    local list_tab = child_area:GetChildList()
    for j = 1, table.getn(list_tab) do
      local child_list = list_tab[j]
      local server_tab = child_list:GetChildList()
      for k = 1, table.getn(server_tab) do
        local child_server = server_tab[k]
        if check_double_server_is_show(child_server) and nx_is_valid(child_server) and (nx_number(child_server.server_hot) == SERVER_RECOMMEND_LOGIN_NEW or nx_number(child_server.server_hot) == SERVER_RECOMMEND_CREATE_FINE) then
          new_server_count = new_server_count + 1
          if new_server_count > 2 then
            return 0
          end
          local btn_sel = form.gbox_tjserver:Find("btn_tjserver_sel_" .. nx_string(new_server_count))
          local lbl_area = form.gbox_tjserver:Find("lbl_tjserver_area_" .. nx_string(new_server_count))
          local lbl_name = form.gbox_tjserver:Find("lbl_tjserver_name_" .. nx_string(new_server_count))
          local lbl_stat_ping = form.gbox_tjserver:Find("lbl_tjserver_stat_ping_" .. nx_string(new_server_count))
          local lbl_stat_icon = form.gbox_tjserver:Find("lbl_tjserver_stat_icon_" .. nx_string(new_server_count))
          local lbl_stat_desc = form.gbox_tjserver:Find("lbl_tjserver_stat_desc_" .. nx_string(new_server_count))
          local lbl_time = form.gbox_tjserver:Find("lbl_tjserver_time_" .. nx_string(new_server_count))
          local lbl_cover = form.gbox_tjserver:Find("lbl_tjserver_cover_" .. nx_string(new_server_count))
          if nx_is_valid(lbl_cover) then
            lbl_cover.Visible = false
          end
          if nx_is_valid(btn_sel) then
            btn_sel.Visible = true
            btn_sel.child_server = child_server
          end
          if nx_is_valid(lbl_time) then
            if child_server.server_time ~= "" then
              lbl_time.Visible = true
              local data_tab = nx_function("ext_split_wstring", utf8_to_widestr(child_server.server_time), nx_widestr("."))
              if table.getn(data_tab) == 2 then
                lbl_time.Text = util_text_2("ui_server_time", data_tab[1], data_tab[2])
              end
            else
              lbl_time.Visible = false
            end
          end
          if nx_is_valid(lbl_area) then
            lbl_area.Visible = true
            lbl_area.Text = utf8_to_widestr(child_server.area_name)
          end
          if nx_is_valid(lbl_name) then
            lbl_name.Visible = true
            lbl_name.Text = utf8_to_widestr(child_server.server_name)
          end
          if nx_is_valid(lbl_stat_ping) then
            lbl_stat_ping.Visible = true
            local server_ping = nx_widestr(nx_string(child_server.server_ping) .. "ms")
            if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
              server_ping = util_text_0("ui_server_wait")
            elseif nx_number(child_server.server_ping) <= SERVER_PING_NOCONNECT then
              server_ping = util_text_0("ui_server_noconnect")
            end
            lbl_stat_ping.Text = server_ping
          end
          if nx_is_valid(lbl_stat_icon) then
            lbl_stat_icon.Visible = true
            lbl_stat_icon.BackImage = nx_string(get_status_image(child_server.server_stat))
          end
          if nx_is_valid(lbl_stat_desc) then
            lbl_stat_desc.Visible = true
            lbl_stat_desc.Text = get_status_desc(child_server.server_stat)
            lbl_stat_desc.ForeColor = get_status_color(child_server.server_stat)
          end
        end
      end
    end
  end
end
function show_version(form)
  if not nx_is_valid(form) then
    return 0
  end
  if not nx_find_custom(form, "server_type") then
    return 0
  end
  local all_inc_patch = nx_value("all_inc_patch")
  if not nx_is_valid(all_inc_patch) then
    return 0
  end
  local cur_version = get_current_version()
  if not check_version_is_valid(cur_version, all_inc_patch.last_version, all_inc_patch.gray_version) then
    cur_version = VERSION_NUM_UNKNOWN
  end
  form.lbl_ver_client_num.Text = nx_widestr(cur_version)
  if cur_version == VERSION_NUM_UNKNOWN then
    form.lbl_ver_client_num.Text = nx_widestr(util_text_0("ui_version_unknown"))
  end
  if form.server_type == SERVER_TYPE_EXP then
    form.lbl_ver_last_title.Text = nx_widestr(util_text_0("ui_version_last_exp"))
    form.lbl_ver_last_num.Text = nx_widestr(all_inc_patch.gray_version)
    if all_inc_patch.gray_version == VERSION_NUM_UNKNOWN then
      form.lbl_ver_client_num.Text = nx_widestr(util_text_0("ui_version_unknown"))
      form.lbl_ver_client_num.Text2 = nx_widestr(util_text_0("ui_version_unknown"))
    end
  else
    form.lbl_ver_last_title.Text = nx_widestr(util_text_0("ui_version_last_nor"))
    form.lbl_ver_last_num.Text = nx_widestr(all_inc_patch.last_version)
    if all_inc_patch.last_version == VERSION_NUM_UNKNOWN then
      form.lbl_ver_client_num.Text = nx_widestr(util_text_0("ui_version_unknown"))
    end
  end
end
function show_select_server(form, child_server)
  if not nx_is_valid(child_server) then
    return 0
  end
  form.child_server = child_server
  form.area_name = child_server.area_name
  form.area_addr = child_server.area_addr
  form.area_port = child_server.area_port
  form.real_area_name = child_server.area_name
  form.server_id = child_server.Name
  form.server_name = child_server.server_name
  form.server_addr = child_server.server_addr
  form.server_port = child_server.server_port
  form.server_type = child_server.server_type
  form.server_stat = child_server.server_stat
  form.server_hot = child_server.server_hot
  form.server_sdo = child_server.server_sdo
  form.server_time = child_server.server_time
  form.lbl_server_name.Text = utf8_to_widestr(child_server.area_name) .. utf8_to_widestr("-") .. utf8_to_widestr(child_server.server_name)
  form.lbl_server_stat.BackImage = nx_string(get_status_image(child_server.server_stat))
  form.btn_select.Enabled = true
  show_version(form)
  remove_select_server(form)
end
function select_one_server(form)
  if not nx_is_valid(form) then
    return 0
  end
  if check_is_need_rukou(form.child_server) then
    local gui = nx_value("gui")
    local dialog = gui.Loader:LoadForm(nx_resource_path(), gui.skin_path .. "form_double_server_select.xml")
    dialog.child_server_dx = form.child_server
    dialog.child_server_wt = form.child_server.double_server
    nx_set_value("form_double_server_select", dialog)
    dialog:ShowModal()
    local res, child_server_sel = nx_wait_event(100000000, dialog, "double_server_select_return")
    local child_server_old = form.child_server
    show_select_server(form, child_server_sel)
    form.child_server = child_server_old
  end
  if form.server_type == "" then
    return 0
  end
  if nx_number(form.server_hot) == SERVER_RECOMMEND_CREATE_FULL then
    disp_error(util_text_0("msg_create_full"))
    return 0
  end
  if nx_number(form.server_hot) == SERVER_RECOMMEND_CREATE_WAIT then
    local res = disp_confirm(util_text_0("msg_create_wait"))
    if res == "cancel" then
      return 0
    end
  end
  if not run_update_process(form) then
    return 0
  end
  switch_func_page(form, "page_update")
  return 1
end
function switch_func_page(form, page_name)
  form.gbox_welcome.Visible = false
  form.gbox_main.Visible = false
  form.gbox_top.Visible = false
  if nx_string(page_name) == "page_server" then
    form.gbox_main.Visible = true
    form.gbox_top.Visible = true
    form.gbox_content.Visible = false
    form.gbox_setting.Visible = false
    form.gbox_server.Visible = true
    form.gbox_logintype.Visible = false
    form.web_leftup:Disable()
    form.web_leftdown:Disable()
    form.web_rightup:Disable()
  elseif nx_string(page_name) == "page_content" then
    form.gbox_main.Visible = true
    form.gbox_top.Visible = true
    form.gbox_content.Visible = true
    form.gbox_setting.Visible = false
    form.gbox_server.Visible = false
    form.gbox_logintype.Visible = false
    form.web_leftup:Disable()
    form.web_leftdown:Disable()
    form.web_rightup:Disable()
  elseif nx_string(page_name) == "page_setting" then
    form.gbox_main.Visible = true
    form.gbox_top.Visible = true
    form.gbox_content.Visible = false
    form.gbox_setting.Visible = true
    form.gbox_server.Visible = false
    form.gbox_logintype.Visible = false
    form.web_leftup:Disable()
    form.web_leftdown:Disable()
    form.web_rightup:Disable()
  elseif nx_string(page_name) == "page_logintype" then
    form.gbox_main.Visible = true
    form.gbox_top.Visible = true
    form.gbox_content.Visible = false
    form.gbox_setting.Visible = false
    form.gbox_server.Visible = false
    form.gbox_logintype.Visible = true
    form.web_leftup:Disable()
    form.web_leftdown:Disable()
    form.web_rightup:Disable()
  elseif nx_string(page_name) == "page_update" then
    form.gbox_main.Visible = true
    form.web_leftup:Enable()
    form.web_leftdown:Enable()
    form.web_rightup:Enable()
  elseif nx_string(page_name) == "page_welcome" then
    form.gbox_welcome.Visible = true
    form.web_leftup:Disable()
    form.web_leftdown:Disable()
    form.web_rightup:Disable()
  end
end
function check_version_is_valid(cur_ver, last_ver, gray_ver)
  if last_ver ~= VERSION_NUM_UNKNOWN and compare_version(cur_ver, last_ver) <= 0 then
    return true
  end
  if gray_ver ~= VERSION_NUM_UNKNOWN and compare_version(cur_ver, gray_ver) <= 0 then
    return true
  end
  return false
end
function create_grid_ctrl(ctrl_name, prop_index)
  local gui = nx_value("gui")
  local ctrl
  if ctrl_name == "CheckButton" then
    ctrl = gui:Create("CheckButton")
    for prop_name, value in pairs(CTRL_PROPERTY[prop_index]) do
      nx_set_property(ctrl, nx_string(prop_name), value)
    end
  elseif ctrl_name == "MultiTextBox" then
    ctrl = gui:Create("MultiTextBox")
    for prop_name, value in pairs(CTRL_PROPERTY[prop_index]) do
      nx_set_property(ctrl, nx_string(prop_name), value)
    end
  elseif ctrl_name == "Label" then
    ctrl = gui:Create("Label")
    for prop_name, value in pairs(CTRL_PROPERTY[prop_index]) do
      nx_set_property(ctrl, nx_string(prop_name), value)
    end
  elseif ctrl_name == "GroupBox" then
    ctrl = gui:Create("GroupBox")
    for prop_name, value in pairs(CTRL_PROPERTY[prop_index]) do
      nx_set_property(ctrl, nx_string(prop_name), value)
    end
  elseif ctrl_name == "Button" then
    ctrl = gui:Create("Button")
    for prop_name, value in pairs(CTRL_PROPERTY[prop_index]) do
      nx_set_property(ctrl, nx_string(prop_name), value)
    end
  end
  return ctrl
end
function check_double_server_is_show(child_server)
  if not nx_is_valid(child_server) then
    return false
  end
  if not nx_find_custom(child_server, "double_server") or not nx_is_valid(child_server.double_server) then
    return true
  end
  if nx_number(child_server.server_net) == SERVER_NET_TELECOM then
    return true
  end
  return false
end
function check_is_need_rukou(child_server)
  if not nx_is_valid(child_server) then
    return false
  end
  if not nx_find_custom(child_server, "double_server") or not nx_is_valid(child_server.double_server) then
    return false
  end
  if nx_number(child_server.server_net) == SERVER_NET_TELECOM then
    return true
  end
  return false
end
function check_is_can_sel_language()
  local ini = nx_create("FxUpdateEx.IniDocument")
  ini.FileName = nx_resource_path() .. "text\\language_list.ini"
  if not ini:LoadFromFile() then
    nx_destroy(ini)
    return false
  end
  local is_can = false
  local section_table = ini:GetSectionList()
  for i = 1, table.getn(section_table) do
    local section = widestr_to_utf8(section_table[i])
    local valid = ini_read_string(ini, section, "Valid", "")
    if utf8_to_string(valid) == "1" then
      is_can = true
      break
    end
  end
  nx_destroy(ini)
  return is_can
end
function run_loadcfg_process(form, program_url)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  set_all_url_btn_enable(form)
  form.lbl_wat_info.Visible = true
  if program_url ~= "" then
    set_button_enable(false, false)
    show_tishi_info(util_text_0("msg_get_old_ver_wait"))
    local remote_file = "version.files.package"
    local cur_version = get_current_version()
    if cur_version ~= VERSION_NUM_UNKNOWN then
      remote_file = "version.files_" .. cur_version .. ".package"
    end
    local temp_file = get_version_files(remote_file, "version_old.files")
    if temp_file == "" then
      disp_error(util_text_0("err_switch_get_version_files"))
      set_button_enable(true, true)
      show_tishi_info(util_text_1("msg_switch_failed", utf8_to_widestr(form.program_sel)))
      return 0
    end
    backup_config()
  end
  if not refresh_update_config(program_url) then
    form.lbl_wat_info.Visible = false
    if program_url ~= "" then
      disp_error(util_text_0("err_switch_update_config"))
      rollback_config()
      set_button_enable(true, true)
      show_tishi_info(util_text_1("msg_switch_failed", utf8_to_widestr(form.program_sel)))
      return 0
    else
      local res = disp_confirm(util_text_0("err_update_config"), false)
      if res == "cancel" then
        nx_execute("main", "exit_game")
        return 0
      end
    end
  end
  if not load_url_config() then
    form.lbl_wat_info.Visible = false
    if program_url ~= "" then
      disp_error(util_text_0("err_switch_load_config"))
      rollback_config()
      set_button_enable(true, true)
      show_tishi_info(util_text_1("msg_switch_failed", utf8_to_widestr(form.program_sel)))
    else
      disp_error(util_text_0("err_load_config"))
    end
    return 0
  end
  local url_list = nx_value("url_list")
  if program_url == "" then
    form.web_leftup.Url = nx_widestr(url_list.leftup_url)
    form.web_leftup:Refresh()
    form.web_leftup:Disable()
    form.web_leftdown.Url = nx_widestr(url_list.leftdown_url)
    form.web_leftdown:Refresh()
    form.web_leftdown:Disable()
    form.web_rightup.Url = nx_widestr(url_list.rightup_url)
    form.web_rightup:Refresh()
    form.web_rightup:Disable()
  end
  refresh_update_notice()
  load_refresh_content(form)
  load_maintain_content(form)
  set_hueren_btn_visible(form)
  set_all_url_btn_enable(form)
  load_server_list()
  load_patch_list()
  show_server_last(form)
  show_area_list(form)
  show_server_tuijian(form)
  if not check_is_can_sel_language() then
    form.btn_language.Visible = false
  end
  form.lbl_wat_info.Visible = false
  local all_inc_patch = nx_value("all_inc_patch")
  form.last_version = all_inc_patch.last_version
  show_version(form)
  if program_url ~= "" then
    nx_execute(nx_current(), "run_repair_process", form, true)
  end
  nx_execute(nx_current(), "run_refresh_server_status", form)
  if program_url ~= "" then
    local url_list = nx_value("url_list")
    form.web_leftup.Url = nx_widestr(url_list.leftup_url)
    form.web_leftup:Refresh()
    form.web_leftdown.Url = nx_widestr(url_list.leftdown_url)
    form.web_leftdown:Refresh()
    form.web_rightup.Url = nx_widestr(url_list.rightup_url)
    form.web_rightup:Refresh()
    if check_web_view_need_enable() or not form.gbox_update.Visible then
      form.web_leftup:Disable()
      form.web_leftdown:Disable()
      form.web_rightup:Disable()
    end
  end
end
function load_url_config()
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local url_list = nx_value("url_list")
  if not nx_is_valid(url_list) then
    url_list = nx_create("ArrayList")
    nx_set_value("url_list", url_list)
  end
  url_list:ClearChild()
  url_list.home_url = ""
  url_list.download_url = ""
  url_list.forum_url = ""
  url_list.help_url = ""
  url_list.full_url = ""
  url_list.ministry_url = ""
  url_list.login_url = ""
  url_list.image_url = ""
  url_list.news_url = ""
  url_list.leftup_url = ""
  url_list.leftdown_url = ""
  url_list.rightup_url = ""
  url_list.huaren_url = ""
  url_list.programid = ""
  url_list.programtitle = ""
  url_list.program_url = ""
  url_list.repair_isopen = ""
  url_list.welcome_isshow = ""
  url_list.graytonor_isopen = ""
  url_list.graytonor_tips = ""
  url_list.graytonor_url = ""
  url_list.nortogray_tips = ""
  url_list.nortogray_url = ""
  local ini = nx_create("FxUpdateEx.IniDocument")
  ini.FileName = root_path .. "updater\\updater_cfg\\url_config.ini"
  if not ini:LoadFromFile() then
    disp_error(util_text_1("err_file_open", ini.FileName))
    nx_destroy(ini)
    return false
  end
  local section = "web"
  local world = nx_value("world")
  if world.partner_id ~= nil and world.partner_id ~= "" then
    section = "web_" .. nx_string(world.partner_id)
  end
  url_list.home_url = ini_read_string(ini, section, "Home", "")
  url_list.download_url = ini_read_string(ini, section, "Download", "")
  url_list.forum_url = ini_read_string(ini, section, "Forum", "")
  url_list.help_url = ini_read_string(ini, section, "Help", "")
  url_list.full_url = ini_read_string(ini, section, "Full", "")
  url_list.ministry_url = ini_read_string(ini, section, "Ministry", "")
  url_list.login_url = ini_read_string(ini, section, "Login", "")
  url_list.image_url = ini_read_string(ini, section, "Image", "")
  url_list.news_url = ini_read_string(ini, section, "News", "")
  url_list.leftup_url = ini_read_string(ini, section, "LeftUp", "")
  url_list.leftdown_url = ini_read_string(ini, section, "LeftDown", "")
  url_list.rightup_url = ini_read_string(ini, section, "RightUp", "")
  url_list.huaren_url = ini_read_string(ini, section, "HuaRen", "")
  url_list.programid = ini_read_string(ini, "version", "ProgramID", "")
  url_list.programtitle = ini_read_string(ini, "version", "Title", "")
  url_list.program_url = standard_url(ini_read_string(ini, "version", "Url", ""))
  url_list.repair_isopen = ini_read_string(ini, "repair", "IsOpenNew", "0")
  url_list.welcome_isshow = ini_read_string(ini, "welcome", "IsShow", "1")
  url_list.graytonor_isopen = ini_read_string(ini, "gray", "GrayToNorIsOpen", "0")
  url_list.graytonor_tips = ini_read_string(ini, "gray", "GrayToNorTips", "")
  url_list.graytonor_url = ini_read_string(ini, "gray", "GrayToNorUrl", "")
  url_list.nortogray_tips = ini_read_string(ini, "gray", "NorToGrayTips", "")
  url_list.nortogray_url = ini_read_string(ini, "gray", "NorToGrayUrl", "")
  if url_list.graytonor_tips == "" then
    url_list.graytonor_tips = util_text_0("msg_updater_gray_to_nor_content")
  end
  if url_list.nortogray_tips == "" then
    url_list.nortogray_tips = util_text_0("msg_updater_nor_to_gray_content")
  end
  local count = ini_read_string(ini, "server", "Count", "0")
  local random = math.random(nx_number(count))
  for i = 1, nx_number(count) do
    local index = nx_number((i + random) % nx_number(count) + 1)
    if index > nx_number(count) then
      index = i
    end
    local priorhttps = ini_read_string(ini, "server_" .. nx_string(i), "PriorHttps", "")
    local torrent = ini_read_string(ini, "server_" .. nx_string(i), "Torrent", "")
    local torrent_url = ini_read_string(ini, "server_" .. nx_string(i), "TorrentUrl", "")
    local child_cfg = url_list:GetChild(DATA_TYPE_CONFIG)
    if not nx_is_valid(child_cfg) then
      child_cfg = url_list:CreateChild(DATA_TYPE_CONFIG)
    end
    local child_cfg_one = child_cfg:CreateChild(nx_string(index))
    if nx_is_valid(child_cfg_one) then
      child_cfg_one.url = standard_url(ini_read_string(ini, "server_" .. nx_string(i), "Config", ""))
      child_cfg_one.priorhttps = priorhttps
      child_cfg_one.torrent = "0"
      child_cfg_one.torrent_url = torrent_url
    end
    local child_ver = url_list:GetChild(DATA_TYPE_VERSION)
    if not nx_is_valid(child_ver) then
      child_ver = url_list:CreateChild(DATA_TYPE_VERSION)
    end
    local child_ver_one = child_ver:CreateChild(nx_string(index))
    if nx_is_valid(child_ver_one) then
      child_ver_one.url = standard_url(ini_read_string(ini, "server_" .. nx_string(i), "Version", ""))
      child_ver_one.priorhttps = priorhttps
      child_ver_one.torrent = "0"
      child_ver_one.torrent_url = torrent_url
    end
    local child_rep = url_list:GetChild(DATA_TYPE_REPAIR)
    if not nx_is_valid(child_rep) then
      child_rep = url_list:CreateChild(DATA_TYPE_REPAIR)
    end
    local child_rep_one = child_rep:CreateChild(nx_string(index))
    if nx_is_valid(child_rep_one) then
      child_rep_one.url = standard_url(ini_read_string(ini, "server_" .. nx_string(i), "Repair", ""))
      child_rep_one.priorhttps = "0"
      child_rep_one.torrent = "0"
      child_rep_one.torrent_url = torrent_url
    end
    local child_pat = url_list:GetChild(DATA_TYPE_PATCH)
    if not nx_is_valid(child_pat) then
      child_pat = url_list:CreateChild(DATA_TYPE_PATCH)
    end
    local child_pat_one = child_pat:CreateChild(nx_string(index))
    if nx_is_valid(child_pat_one) then
      child_pat_one.url = standard_url(ini_read_string(ini, "server_" .. nx_string(i), "Patch", ""))
      child_pat_one.priorhttps = "0"
      child_pat_one.torrent = torrent
      child_pat_one.torrent_url = torrent_url
    end
    local child_not = url_list:GetChild(DATA_TYPE_NOTICE)
    if not nx_is_valid(child_not) then
      child_not = url_list:CreateChild(DATA_TYPE_NOTICE)
    end
    local child_not_one = child_not:CreateChild(nx_string(index))
    if nx_is_valid(child_not_one) then
      child_not_one.url = standard_url(ini_read_string(ini, "server_" .. nx_string(i), "Notice", ""))
      child_not_one.priorhttps = priorhttps
      child_not_one.torrent = "0"
      child_not_one.torrent_url = torrent_url
    end
  end
  nx_destroy(ini)
  return true
end
function refresh_update_config(program_url)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  local temp_file = ""
  if program_url ~= "" then
    temp_file = get_list_file_by_url(program_url, "config.files", patch_path, false)
  else
    temp_file = get_list_file(DATA_TYPE_CONFIG, "config.files", patch_path, false)
  end
  if temp_file == "" then
    return false
  end
  local config_list = nx_create("StringList")
  if not config_list:LoadFromFile(temp_file) then
    disp_error(util_text_1("err_file_open", "config.files"))
    nx_destroy(config_list)
    nx_file_delete(temp_file)
    return false
  end
  local config_info = config_list:GetStringByIndex(0)
  local s1, file_num = package_man:SplitString(config_info, "|")
  if nx_number(file_num) ~= nx_number(config_list:GetStringCount() - 1) then
    disp_error(util_text_1("err_file_check", "config.files"))
    nx_destroy(config_list)
    nx_file_delete(temp_file)
    return false
  end
  local succeed = true
  local temp_name = patch_path .. "temp_file.repair"
  for i = 1, nx_number(file_num) do
    local file_info = config_list:GetStringByIndex(i)
    local file_name, file_pack = package_man:SplitString(file_info, "|")
    if file_name == nil then
      disp_error(util_text_1("err_file_read", "config.files"))
      succeed = false
      break
    end
    if program_url ~= "" then
      if not download_file_by_url(program_url, file_name, temp_name, "", 0, false) then
        succeed = false
        break
      end
    elseif not download_file(DATA_TYPE_CONFIG, file_name, temp_name, "", 0, false) then
      succeed = false
      break
    end
    if file_pack ~= nil then
      local pack_name = root_path .. file_pack
      local write_pack = get_write_package(pack_name)
      if write_pack ~= nil then
        if write_pack:FindFile(file_name) then
          write_pack:RemoveFile(file_name)
        end
        if not write_pack:AddFile(file_name, temp_name) then
          disp_error(util_text_1("err_file_apply", file_name))
          succeed = false
          break
        end
      else
        succeed = false
        break
      end
    else
      local full_name = root_path .. file_name
      local path, name = package_man:SplitFilePath(full_name)
      if not nx_path_exists(path) then
        nx_path_create(path)
      end
      nx_function("ext_set_file_Attribute_Nor", full_name)
      if not package_man:CloneFile(temp_name, full_name) then
        disp_error(util_text_1("err_file_apply", file_name))
        succeed = false
        break
      end
    end
  end
  get_write_package("")
  nx_destroy(config_list)
  nx_file_delete(temp_file)
  nx_file_delete(temp_name)
  return succeed
end
function refresh_update_notice()
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  local temp_file = get_list_file(DATA_TYPE_NOTICE, "notice.files", patch_path, false)
  if temp_file == "" then
    return false
  end
  local notice_list = nx_create("StringList")
  if not notice_list:LoadFromFile(temp_file) then
    disp_error(util_text_1("err_file_open", "notice.files"))
    nx_destroy(notice_list)
    nx_file_delete(temp_file)
    return false
  end
  local notice_info = notice_list:GetStringByIndex(0)
  local s1, file_num = package_man:SplitString(notice_info, "|")
  if nx_number(file_num) ~= nx_number(notice_list:GetStringCount() - 1) then
    disp_error(util_text_1("err_file_check", "notice.files"))
    nx_destroy(notice_list)
    nx_file_delete(temp_file)
    return false
  end
  local succeed = true
  local temp_name = patch_path .. "temp_file.repair"
  for i = 1, nx_number(file_num) do
    local file_info = notice_list:GetStringByIndex(i)
    local file_name, file_pack = package_man:SplitString(file_info, "|")
    if file_name == nil then
      disp_error(util_text_1("err_file_read", "notice.files"))
      succeed = false
      break
    end
    if not download_file(DATA_TYPE_NOTICE, file_name, temp_name, "", 0, false) then
      succeed = false
      break
    end
    if file_pack ~= nil then
      local pack_name = root_path .. file_pack
      local write_pack = get_write_package(pack_name)
      if write_pack ~= nil then
        if write_pack:FindFile(file_name) then
          write_pack:RemoveFile(file_name)
        end
        if not write_pack:AddFile(file_name, temp_name) then
          disp_error(util_text_1("err_file_apply", file_name))
          succeed = false
          break
        end
      else
        succeed = false
        break
      end
    else
      local full_name = root_path .. file_name
      local path, name = package_man:SplitFilePath(full_name)
      if not nx_path_exists(path) then
        nx_path_create(path)
      end
      nx_function("ext_set_file_Attribute_Nor", full_name)
      if not package_man:CloneFile(temp_name, full_name) then
        disp_error(util_text_1("err_file_apply", file_name))
        succeed = false
        break
      end
    end
  end
  get_write_package("")
  nx_destroy(notice_list)
  nx_file_delete(temp_file)
  nx_file_delete(temp_name)
  return succeed
end
function load_refresh_content(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  form.mltbox_content:Clear()
  local ini = nx_create("FxUpdateEx.IniDocument")
  ini.FileName = root_path .. "updater\\updater_cfg\\content.ini"
  if not ini:LoadFromFile() then
    form.mltbox_content:AddHtmlText(util_text_0("ui_content_unknown"), -1)
    nx_destroy(ini)
    return false
  end
  local photo = nx_widestr("<img src=\"" .. "gui\\form_back\\logo_update.png" .. "\"" .. "/>")
  local sec_tab = ini:GetSectionList()
  for i = 1, table.getn(sec_tab) do
    local section = widestr_to_utf8(sec_tab[i])
    local date = ini_read_string(ini, section, "Date", "")
    local version = ini_read_string(ini, section, "Version", "")
    form.mltbox_content:AddHtmlText(photo .. util_text_2("ui_content_date", utf8_to_widestr(date), utf8_to_widestr(version)), -1)
    local add_tab = ini:GetItemValueList(utf8_to_widestr(section), utf8_to_widestr("Add"))
    for j = 1, table.getn(add_tab) do
      form.mltbox_content:AddHtmlText(util_text_1("ui_content_add", nx_int(j)), -1)
      form.mltbox_content:AddHtmlText(add_tab[j], -1)
    end
    local chg_tab = ini:GetItemValueList(utf8_to_widestr(section), utf8_to_widestr("Change"))
    for j = 1, table.getn(chg_tab) do
      form.mltbox_content:AddHtmlText(util_text_1("ui_content_change", nx_int(j)), -1)
      form.mltbox_content:AddHtmlText(chg_tab[j], -1)
    end
  end
  nx_destroy(ini)
  return true
end
function load_maintain_content(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local ini = nx_create("FxUpdateEx.IniDocument")
  ini.FileName = root_path .. "updater\\updater_cfg\\maintain.ini"
  if not ini:LoadFromFile() then
    nx_destroy(ini)
    return false
  end
  form.content = ini_read_string(ini, "maintain", "Content", "")
  form.link = ini_read_string(ini, "maintain", "URL", "")
  nx_destroy(ini)
  return true
end
function set_all_url_btn_enable(form)
  set_one_url_btn_enable(form.btn_home)
  set_one_url_btn_enable(form.btn_download)
  set_one_url_btn_enable(form.btn_forum)
  set_one_url_btn_enable(form.btn_help)
  set_one_url_btn_enable(form.btn_full)
  set_one_url_btn_enable(form.btn_ministry)
  set_one_url_btn_enable(form.btn_login)
end
function set_one_url_btn_enable(btn)
  local url_list = nx_value("url_list")
  if not nx_is_valid(btn) then
    return false
  end
  if nx_is_valid(url_list) and nx_find_custom(url_list, btn.DataSource) and nx_custom(url_list, btn.DataSource) ~= "" then
    btn.Enabled = true
  else
    btn.Enabled = false
  end
end
function set_hueren_btn_visible(form)
  local url_list = nx_value("url_list")
  if not nx_is_valid(url_list) then
    form.btn_huaren.Visible = false
    return 0
  end
  if url_list.huaren_url == "" then
    form.btn_huaren.Visible = false
  else
    form.btn_huaren.Visible = true
  end
  return 0
end
function load_server_list()
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    server_list = nx_create("ArrayList", "server_list")
    nx_set_value("server_list", server_list)
  end
  server_list:ClearChild()
  local ini = nx_create("FxUpdateEx.IniDocument")
  ini.FileName = root_path .. "updater\\updater_cfg\\server_list.ini"
  if not ini:LoadFromFile() then
    disp_error(util_text_1("err_file_open", ini.FileName))
    nx_destroy(ini)
    return false
  end
  local sec_tab = ini:GetSectionList()
  for i = 1, table.getn(sec_tab) do
    local section = widestr_to_utf8(sec_tab[i])
    local area_name = ini_read_string(ini, section, "AreaName", "")
    local area_addr = ini_read_string(ini, section, "AreaAddr", "")
    local area_port = ini_read_string(ini, section, "AreaPort", "")
    local area_net = ini_read_string(ini, section, "AreaNet", "")
    local area_type = ini_read_string(ini, section, "AreaType", "0")
    local child_area = server_list:GetChild(area_name)
    if not nx_is_valid(child_area) then
      child_area = server_list:CreateChild(area_name)
    end
    child_area.area_type = area_type
    local child_list = child_area:CreateChild(area_addr)
    child_list.area_port = area_port
    child_list.text_sock = create_text_sock()
    child_list.refresh_time = 0
    child_list.retry_count = 0
    local svr_tab = ini:GetItemValueList(utf8_to_widestr(section), utf8_to_widestr("Server"))
    for j = 1, table.getn(svr_tab) do
      local data_tab = nx_function("ext_split_wstring", svr_tab[j], nx_widestr("/"))
      if table.getn(data_tab) >= 5 then
        local child_server = child_list:CreateChild(widestr_to_utf8(data_tab[5]))
        child_server.child_area = child_area
        child_server.child_list = child_list
        child_server.area_name = area_name
        child_server.area_addr = child_list.Name
        child_server.area_port = child_list.area_port
        child_server.server_name = widestr_to_utf8(data_tab[1])
        child_server.server_addr = ""
        child_server.server_port = ""
        child_server.server_type = widestr_to_utf8(data_tab[4])
        child_server.server_stat = SERVER_STATUS_GETTING
        child_server.server_ping = SERVER_PING_UNKNOWN
        child_server.server_net = area_net
        if table.getn(data_tab) >= 6 then
          child_server.server_hot = widestr_to_utf8(data_tab[6])
        else
          child_server.server_hot = SERVER_RECOMMEND_NORMAL
        end
        if table.getn(data_tab) >= 7 then
          child_server.server_fast = widestr_to_utf8(data_tab[7])
        else
          child_server.server_fast = 0
        end
        if table.getn(data_tab) >= 8 then
          child_server.server_sdo = widestr_to_utf8(data_tab[8])
        else
          child_server.server_sdo = 0
        end
        if table.getn(data_tab) >= 9 then
          child_server.server_time = widestr_to_utf8(data_tab[9])
        else
          child_server.server_time = ""
        end
        set_double_server(server_list, area_name, child_server)
      end
    end
  end
  nx_destroy(ini)
  return true
end
function set_double_server(server_list, area_name, cur_child_server)
  if not nx_is_valid(server_list) then
    return false
  end
  if nx_number(cur_child_server.server_net) ~= SERVER_NET_NETCOM and nx_number(cur_child_server.server_net) ~= SERVER_NET_TELECOM then
    return false
  end
  local child_area = server_list:GetChild(area_name)
  if not nx_is_valid(child_area) then
    return false
  end
  local list_tab = child_area:GetChildList()
  for i = 1, table.getn(list_tab) do
    local child_list = list_tab[i]
    local server_tab = child_list:GetChildList()
    for j = 1, table.getn(server_tab) do
      local child_server = server_tab[j]
      if not nx_id_equal(child_server, cur_child_server) and child_server.server_name == cur_child_server.server_name then
        if nx_number(child_server.server_net) == SERVER_NET_TELECOM and nx_number(cur_child_server.server_net) == SERVER_NET_NETCOM then
          child_server.double_server = cur_child_server
          cur_child_server.double_server = child_server
        elseif nx_number(child_server.server_net) == SERVER_NET_NETCOM and nx_number(cur_child_server.server_net) == SERVER_NET_TELECOM then
          child_server.double_server = cur_child_server
          cur_child_server.double_server = child_server
        end
      end
    end
  end
end
function refresh_all_area_status(form)
  local server_list = nx_value("server_list")
  if not nx_is_valid(server_list) then
    return false
  end
  local child_area = server_list:GetChild(form.area_name)
  for i = 0, TUIJIAN_SERVER_COUNT do
    local btn_sel = form.gbox_tjserver:Find("btn_tjserver_sel_" .. nx_string(i))
    if nx_is_valid(btn_sel) and nx_find_custom(btn_sel, "child_server") and nx_is_valid(btn_sel.child_server) then
      local child_server = btn_sel.child_server
      local child_area_hot = child_server.child_area
      local child_list_hot = child_server.child_list
      if nx_is_valid(child_area_hot) and nx_is_valid(child_list_hot) and not nx_id_equal(child_area, child_area_hot) then
        nx_execute(nx_current(), "refresh_one_list_status", form, child_area_hot, child_list_hot)
      end
      refresh_double_server_status(form, child_area, child_server)
    end
  end
  if nx_is_valid(child_area) then
    local list_tab = child_area:GetChildList()
    for i = 1, table.getn(list_tab) do
      nx_execute(nx_current(), "refresh_one_list_status", form, child_area, list_tab[i])
    end
  end
  return true
end
function refresh_double_server_status(form, cur_child_area, child_server)
  if not nx_find_custom(child_server, "double_server") then
    return true
  end
  local child_server = child_server.double_server
  if not nx_is_valid(child_server) then
    return true
  end
  local child_area = child_server.child_area
  local child_list = child_server.child_list
  if not nx_is_valid(child_area) or not nx_is_valid(child_list) then
    return false
  end
  if not nx_id_equal(cur_child_area, child_area) then
    nx_execute(nx_current(), "refresh_one_list_status", form, child_area, child_list)
  end
end
function refresh_one_list_status(form, child_area, child_list)
  if not nx_is_valid(form) then
    return false
  end
  if not nx_is_valid(child_list) then
    return false
  end
  local cur_time = nx_function("ext_get_tickcount")
  if nx_number(cur_time - child_list.refresh_time) <= 30000 and nx_number(child_list.refresh_time) ~= 0 then
    return false
  end
  child_list.refresh_time = cur_time
  local res, status_tab = get_server_status(child_list.text_sock, child_list.Name, child_list.area_port)
  nx_pause(0)
  if not nx_is_valid(child_list) then
    return false
  end
  if not res then
    child_list.retry_count = child_list.retry_count + 1
    if nx_number(child_list.retry_count) >= 3 then
      local server_tab = child_list:GetChildList()
      for i = 1, table.getn(server_tab) do
        local child_server = server_tab[i]
        child_server.server_stat = SERVER_STATUS_UNUSED
        child_server.server_ping = SERVER_PING_NOCONNECT
      end
      show_server_list(form)
      child_list.retry_count = 0
    end
    return false
  end
  if not nx_is_valid(child_list) then
    return false
  end
  child_list.retry_count = 0
  local server_tab = child_list:GetChildList()
  for i = 1, table.getn(server_tab) do
    local child_server = server_tab[i]
    local is_reset = true
    for j = 1, table.getn(status_tab) / 4 do
      if widestr_to_utf8(nx_widestr(status_tab[i * 4 - 3])) == child_server.Name then
        is_reset = false
      end
    end
    if is_reset then
      child_server.server_stat = SERVER_STATUS_UNUSED
      child_server.server_ping = SERVER_PING_NOCONNECT
    end
  end
  for i = 1, table.getn(status_tab) / 4 do
    local server_id = widestr_to_utf8(nx_widestr(status_tab[i * 4 - 3]))
    local server_addr = nx_string(status_tab[i * 4 - 2])
    local server_port = nx_string(status_tab[i * 4 - 1])
    local server_stat = nx_string(status_tab[i * 4 - 0])
    local child_server = child_list:GetChild(server_id)
    if not nx_is_valid(child_server) then
      child_server = child_list:CreateChild(server_id)
      child_server.child_area = child_area
      child_server.child_list = child_list
      child_server.area_name = child_area.Name
      child_server.area_addr = child_list.Name
      child_server.area_port = child_list.area_port
      child_server.server_name = server_id
      child_server.server_type = SERVER_TYPE_NOR
      child_server.server_ping = SERVER_PING_UNKNOWN
      child_server.server_hot = SERVER_RECOMMEND_NORMAL
      child_server.server_fast = 0
      child_server.server_sdo = 0
      child_server.server_time = ""
    end
    child_server.server_addr = server_addr
    child_server.server_port = server_port
    child_server.server_stat = server_stat
    if nx_number(child_server.server_stat) == SERVER_STATUS_UNUSED then
      child_server.server_ping = SERVER_PING_NOCONNECT
    end
    refresh_server_last_and_new(form, child_server)
    show_server_list(form)
    nx_execute(nx_current(), "get_server_ping", form, child_server)
  end
end
function get_server_status(text_sock, addr, port)
  if not nx_is_valid(text_sock) then
    return false
  end
  if nx_find_custom(text_sock, "is_busy") and text_sock.is_busy then
    nx_log("get_server_status<text_sock is getting info>")
    return false
  end
  text_sock.is_busy = true
  if text_sock.Connected then
    text_sock:Disconnect()
  end
  if not text_sock:Connect(nx_string(addr), nx_int(port)) then
    text_sock:Disconnect()
    text_sock.is_busy = false
    nx_log("get_server_status<text_sock connect failed>")
    return false
  end
  local res = nx_wait_event(100000000, text_sock, "event_connect")
  if res == nil or res == "failed" or res == "closed" then
    text_sock:Disconnect()
    text_sock.is_busy = false
    nx_log("get_server_status<text_sock connect time out>")
    return false
  end
  text_sock:Send("svrlist")
  local res = nx_wait_event(100000000, text_sock, "event_svr_info")
  if res == nil then
    text_sock:Disconnect()
    text_sock.is_busy = false
    nx_log("get_server_status<text_sock wait info time out>")
    return false
  end
  local data = text_sock:DecodeText(nx_string(res))
  table.remove(data, 1)
  text_sock:Disconnect()
  text_sock.is_busy = false
  return true, data
end
function get_server_ping(form, child_server)
  if not nx_is_valid(child_server) then
    return 0
  end
  if nx_string(child_server.server_addr) == "" then
    return 0
  end
  if nx_number(child_server.server_stat) == SERVER_STATUS_UNUSED then
    return 0
  end
  local GetAvPing = nx_create("GetAvPing")
  if not nx_is_valid(GetAvPing) then
    return 0
  end
  if not GetAvPing:StartCmdPing(child_server.server_addr) then
    nx_destroy(GetAvPing)
    return 0
  end
  local server_ping = SERVER_PING_NOCONNECT
  for i = 1, 3 do
    local wait_time = 0
    while true do
      wait_time = wait_time + nx_pause(0)
      if nx_number(wait_time) >= 5 then
        break
      end
      if not nx_is_valid(GetAvPing) or not nx_is_valid(child_server) then
        return 0
      end
    end
    if not nx_is_valid(GetAvPing) or not nx_is_valid(child_server) then
      return 0
    end
    server_ping = nx_number(GetAvPing:ReadCmdPingData())
    if nx_number(server_ping) ~= SERVER_PING_NOCONNECT then
      break
    end
  end
  GetAvPing:EndCmdPing()
  if nx_is_valid(child_server) and nx_number(server_ping) ~= SERVER_PING_NOCONNECT then
    child_server.server_ping = server_ping
    if nx_is_valid(form) and nx_is_valid(child_server) and form.area_name == child_server.area_name then
      show_server_list(form)
    end
  end
  for i = 0, TUIJIAN_SERVER_COUNT do
    local btn_sel = form.gbox_tjserver:Find("btn_tjserver_sel_" .. nx_string(i))
    local lbl_ping = form.gbox_tjserver:Find("lbl_tjserver_stat_ping_" .. nx_string(i))
    if nx_is_valid(btn_sel) and nx_is_valid(lbl_ping) and nx_find_custom(btn_sel, "child_server") and nx_id_equal(child_server, btn_sel.child_server) then
      local server_ping = nx_widestr(nx_string(child_server.server_ping) .. "ms")
      if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
        server_ping = util_text_0("ui_server_wait")
      elseif nx_number(child_server.server_ping) <= SERVER_PING_NOCONNECT then
        server_ping = util_text_0("ui_server_noconnect")
      end
      lbl_ping.Text = server_ping
    end
  end
  nx_execute("form_double_server_select", "refresh_server_status", child_server)
  if nx_is_valid(GetAvPing) then
    nx_destroy(GetAvPing)
  end
  return 0
end
function run_refresh_server_status(form)
  local escape_time = 0
  refresh_all_area_status(form)
  while true do
    if not nx_is_valid(form) then
      break
    end
    escape_time = escape_time + nx_pause(0)
    if nx_number(escape_time) >= 30 then
      refresh_all_area_status(form)
      escape_time = 0
    end
  end
end
function refresh_server_last_and_new(form, child_server)
  if not nx_is_valid(form) or not nx_is_valid(child_server) then
    return 0
  end
  for i = 0, TUIJIAN_SERVER_COUNT do
    local btn_sel = form.gbox_tjserver:Find("btn_tjserver_sel_" .. nx_string(i))
    local lbl_stat_ping = form.gbox_tjserver:Find("lbl_tjserver_stat_ping_" .. nx_string(i))
    local lbl_stat_icon = form.gbox_tjserver:Find("lbl_tjserver_stat_icon_" .. nx_string(i))
    local lbl_stat_desc = form.gbox_tjserver:Find("lbl_tjserver_stat_desc_" .. nx_string(i))
    if nx_is_valid(btn_sel) and nx_is_valid(lbl_stat_ping) and nx_is_valid(lbl_stat_icon) and nx_is_valid(lbl_stat_desc) and nx_find_custom(btn_sel, "child_server") and nx_id_equal(child_server, btn_sel.child_server) then
      local server_ping = nx_widestr(nx_string(child_server.server_ping) .. "ms")
      if nx_number(child_server.server_ping) <= SERVER_PING_UNKNOWN then
        server_ping = util_text_0("ui_server_wait")
      elseif nx_number(child_server.server_ping) <= SERVER_PING_NOCONNECT then
        server_ping = util_text_0("ui_server_noconnect")
      end
      lbl_stat_ping.Text = server_ping
      lbl_stat_icon.BackImage = nx_string(get_status_image(child_server.server_stat))
      lbl_stat_desc.Text = get_status_desc(child_server.server_stat)
      lbl_stat_desc.ForeColor = get_status_color(child_server.server_stat)
    end
  end
end
function create_text_sock()
  local text_sock = nx_create("TextSock")
  nx_bind_script(text_sock, "game_textsock", "game_textsock_init")
  return text_sock
end
function run_loadset_process(form)
  init_system_set(form)
  load_system_set(form)
  show_system_set(form)
end
function init_system_set(form)
  local game_config = nx_create("ArrayList")
  nx_set_value("game_config", game_config)
  local size_cur = nx_function("ext_get_cur_system_size")
  if table.getn(size_cur) == 2 then
    game_config.win_width = size_cur[1]
    game_config.win_height = size_cur[2]
  else
    game_config.win_height = 768
    game_config.win_width = 1024
  end
  game_config.windowed = true
  game_config.music_enable = true
  game_config.music_volume = 1
  game_config.sound_enable = true
  game_config.sound_volume = 1
  game_config.area_music_enable = true
  game_config.area_music_volume = 1
  game_config.level = "simple"
  game_config.Language = ""
end
function load_system_set(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return false
  end
  local ini = nx_create("FxTool.IniDocument")
  ini.FileName = root_path .. "bin\\system_set.ini"
  if not ini:LoadFromFile() then
    nx_destroy(ini)
    return true
  end
  local prop_tab = nx_custom_list(game_config)
  for i = 1, table.getn(prop_tab) do
    nx_set_custom(game_config, prop_tab[i], ini:ReadString("main", prop_tab[i], nx_custom(game_config, prop_tab[i])))
  end
  if nx_number(game_config.win_width) <= 0 or 0 >= nx_number(game_config.win_height) then
    local size_cur = nx_function("ext_get_cur_system_size")
    if table.getn(size_cur) == 2 then
      game_config.win_width = size_cur[1]
      game_config.win_height = size_cur[2]
    else
      game_config.win_height = 768
      game_config.win_width = 1024
    end
  end
  nx_destroy(ini)
  return true
end
function show_system_set(form)
  local game_config = nx_value("game_config")
  form.system_set_change = false
  form.cbox_videolvl.DropListBox:ClearString()
  for i = 1, table.getn(CONFIG_LEVEL_ID) do
    form.cbox_videolvl.DropListBox:AddString(util_text_0(CONFIG_LEVEL_ID[i][2]))
  end
  local item_height = form.cbox_videolvl.DropListBox.ItemHeight
  form.cbox_videolvl.DropDownHeight = nx_int(math.min(102, item_height * table.getn(CONFIG_LEVEL_ID) + 2))
  form.cbox_screensize.Text = nx_widestr(game_config.win_width .. "x" .. game_config.win_height)
  local frequency = nx_function("ext_get_cur_system_frequency")
  local size_list = nx_function("ext_enum_screen_size_byfrequency", nx_int(800), nx_int(600), nx_int(frequency))
  local size_tab = nx_function("ext_split_string", size_list, ",")
  local add_tab = {}
  local add_count = 0
  form.cbox_screensize.DropListBox:ClearString()
  for i = 1, table.getn(size_tab) / 2 do
    local w = size_tab[i * 2 - 1]
    local h = size_tab[i * 2]
    if add_tab[w .. "x" .. h] == nil then
      form.cbox_screensize.DropListBox:AddString(nx_widestr(w .. "x" .. h))
      if nx_number(game_config.win_width) == nx_number(w) and nx_number(game_config.win_height) == nx_number(h) then
        form.cbox_screensize.Text = nx_widestr(w .. "x" .. h)
      end
      add_tab[w .. "x" .. h] = w .. "x" .. h
      add_count = add_count + 1
    end
  end
  local item_height = form.cbox_screensize.DropListBox.ItemHeight
  form.cbox_screensize.DropDownHeight = nx_int(math.min(180, item_height * add_count + 2))
  form.cbtn_window.Checked = nx_boolean(game_config.windowed)
  form.cbtn_music.Checked = nx_boolean(game_config.music_enable)
  form.cbtn_sound.Checked = nx_boolean(game_config.sound_enable)
  form.cbtn_environment.Checked = nx_boolean(game_config.area_music_enable)
  form.tbar_music.Value = nx_int(nx_number(game_config.music_volume) * 100)
  form.tbar_sound.Value = nx_int(nx_number(game_config.sound_volume) * 100)
  form.tbar_environment.Value = nx_int(nx_number(game_config.area_music_volume) * 100)
  form.pbar_music.Value = nx_int(nx_number(game_config.music_volume) * 100)
  form.pbar_sound.Value = nx_int(nx_number(game_config.sound_volume) * 100)
  form.pbar_environment.Value = nx_int(nx_number(game_config.area_music_volume) * 100)
  for i = 1, table.getn(CONFIG_LEVEL_ID) do
    if game_config.level == CONFIG_LEVEL_ID[i][1] then
      form.cbox_videolvl.Text = nx_widestr(util_text_0(CONFIG_LEVEL_ID[i][2]))
      form.cbox_videolvl.DropListBox.SelectIndex = nx_int(i - 1)
      break
    end
  end
  form.system_set_change = true
end
function save_system_set(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  if not form.system_set_save then
    return 0
  end
  local game_config = nx_value("game_config")
  local w, h = package_man:SplitString(nx_string(form.cbox_screensize.Text), "x")
  game_config.win_width = nx_int(w)
  game_config.win_height = nx_int(h)
  local index = form.cbox_videolvl.DropListBox.SelectIndex
  if 0 <= nx_number(index) and nx_number(index) < table.getn(CONFIG_LEVEL_ID) then
    game_config.level = CONFIG_LEVEL_ID[nx_number(index) + 1][1]
  end
  game_config.windowed = form.cbtn_window.Checked
  game_config.music_volume = form.tbar_music.Value * 0.01
  game_config.sound_volume = form.tbar_sound.Value * 0.01
  game_config.area_music_volume = form.tbar_environment.Value * 0.01
  game_config.music_enable = form.cbtn_music.Checked
  game_config.sound_enable = form.cbtn_sound.Checked
  game_config.area_music_enable = form.cbtn_environment.Checked
  local ini = nx_create("FxTool.IniDocument")
  ini.FileName = root_path .. "bin\\system_set.ini"
  ini:LoadFromFile()
  local prop_tab = nx_custom_list(game_config)
  for i = 1, table.getn(prop_tab) do
    ini:WriteString("main", prop_tab[i], nx_string(nx_custom(game_config, prop_tab[i])))
  end
  ini:SaveToFile()
  nx_destroy(ini)
end
function on_game_set_changed(self)
  local form = self.ParentForm
  if form.system_set_change then
    form.system_set_save = true
  end
  form.pbar_music.Value = form.tbar_music.Value
  form.pbar_sound.Value = form.tbar_sound.Value
  form.pbar_environment.Value = form.tbar_environment.Value
end
function run_repair_process(form, is_switch)
  if not is_switch then
    set_web_view_enable(false)
    local res = disp_confirm(util_text_0("msg_repair_tishi"), false)
    if res == "cancel" then
      set_web_view_enable(true)
      return 0
    end
    local info = util_text_0("msg_repair_client_running")
    while true do
      if not check_client_running() then
        break
      end
      if disp_confirm(info, false) == "cancel" then
        set_web_view_enable(true)
        return 0
      end
    end
    local info_space = util_text_1("err_repair_disk_no_enough", nx_int(100))
    while true do
      if check_disk_space_enough(104857600) then
        break
      end
      if disp_confirm(info_space, false) == "cancel" then
        set_web_view_enable(true)
        return 0
      end
    end
    set_web_view_enable(true)
  end
  if is_switch then
    nx_execute(nx_current(), "switch_version", form)
  else
    nx_execute(nx_current(), "repair_version", form)
  end
end
function repair_version(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  set_button_enable(false, false)
  form.close_confirm = true
  local repair_file_list = nx_create("ArrayList")
  repair_file_list.download_result = true
  form.patch_all_size = 0
  form.patch_cur_size = 0
  show_tishi_info(util_text_0("msg_repair_wait"))
  if not get_repair_file_list(form, repair_file_list) then
    show_tishi_info(util_text_0("msg_repair_failed"))
    set_button_enable(true, false)
    form.close_confirm = false
    return false
  end
  show_tishi_info(util_text_0("msg_repair_start"))
  calculate_repair_size(form, repair_file_list)
  nx_execute(nx_current(), "download_all_repair", form, repair_file_list, patch_path)
  local version = repair_file_list.version
  local file_num = repair_file_list.file_num
  local file_cur = 0
  local succeed = true
  local pack_tab = repair_file_list:GetChildList()
  for i = 1, table.getn(pack_tab) do
    local pack_child = pack_tab[i]
    local patch_file = wait_repair_finish(repair_file_list, pack_child, patch_path)
    if patch_file == "" then
      succeed = false
      break
    end
    get_read_package("")
    local read_pack = get_read_package(patch_file)
    if not nx_is_valid(read_pack) then
      disp_error(util_text_1("err_file_open", patch_file))
      succeed = false
      break
    end
    local file_tab = pack_child:GetChildList()
    for j = 1, table.getn(file_tab) do
      local file_child = file_tab[j]
      local file_name = file_child.Name
      local file_pack = file_child.pack
      if file_pack ~= "" then
        local pack_name = root_path .. file_pack
        local write_pack = get_write_package(pack_name)
        if write_pack ~= nil then
          if write_pack:FindFile(file_name) then
            write_pack:RemoveFile(file_name)
          end
          if not write_pack:CopyForPatch(read_pack, file_name, file_name, "") then
            disp_error(util_text_1("err_file_apply", file_name))
            succeed = false
            break
          end
        else
          succeed = false
          break
        end
      else
        local full_name = root_path .. file_name
        local path, name = package_man:SplitFilePath(full_name)
        if not nx_path_exists(path) then
          nx_path_create(path)
        end
        nx_function("ext_set_file_Attribute_Nor", full_name)
        if not read_pack:GetFile(file_name, full_name) then
          disp_error(util_text_1("err_file_apply", file_name))
          succeed = false
          break
        end
      end
      file_cur = file_cur + 1
    end
    show_progress(file_cur, file_num)
  end
  if nx_running(nx_current(), "download_all_repair") then
    nx_kill(nx_current(), "download_all_repair")
  end
  if succeed then
    set_current_version(version)
    show_tishi_info(util_text_0("msg_repair_succeed"))
    disp_error(util_text_0("msg_repair_finish"))
    switch_func_page(form, "page_server")
  else
    show_tishi_info(util_text_0("msg_repair_failed"))
  end
  show_version(form)
  set_button_enable(true, get_current_version() == form.last_version)
  get_read_package("")
  get_write_package("")
  nx_destroy(repair_file_list)
  show_main_window(9)
  form.close_confirm = false
  return succeed
end
function switch_version(form)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  set_button_enable(false, false)
  form.switch_state = SWITCH_STATE_DOWNLOAD
  local repair_file_list = nx_create("ArrayList")
  repair_file_list.download_result = true
  form.patch_all_size = 0
  form.patch_cur_size = 0
  show_tishi_info(util_text_0("msg_get_new_ver_wait"))
  if not get_switch_file_list(form, repair_file_list) then
    disp_error(util_text_1("err_switch_download_failed", utf8_to_widestr(form.program_sel)))
    set_button_enable(true, false)
    rollback_config()
    form.switch_state = SWITCH_STATE_STOP
    nx_execute("main", "exit_game")
    return false
  end
  show_tishi_info(util_text_1("msg_switch_start", utf8_to_widestr(form.program_sel)))
  calculate_repair_size(form, repair_file_list)
  nx_execute(nx_current(), "download_all_repair", form, repair_file_list, patch_path)
  local version = repair_file_list.version
  local file_num = repair_file_list.file_num
  local file_cur = 0
  local succeed = true
  local pack_tab = repair_file_list:GetChildList()
  for i = 1, table.getn(pack_tab) do
    local pack_child = pack_tab[i]
    local patch_file = wait_repair_finish(repair_file_list, pack_child, patch_path)
    if patch_file == "" then
      succeed = false
      break
    end
    get_read_package("")
    local read_pack = get_read_package(patch_file)
    if not nx_is_valid(read_pack) then
      disp_error(util_text_1("err_file_open", patch_file))
      succeed = false
      break
    end
    file_cur = file_cur + nx_number(pack_child:GetChildCount())
    show_progress(file_cur, file_num * 2)
    nx_pause(0)
  end
  local is_rollback = not succeed
  if succeed then
    form.switch_state = SWITCH_STATE_APPLY
    set_current_version(version)
    show_version(form)
    nx_function("ext_remove_full_directory", root_path .. "updater\\updater_cfg_")
    for i = 1, table.getn(pack_tab) do
      local pack_child = pack_tab[i]
      local patch_file = wait_repair_finish(repair_file_list, pack_child, patch_path)
      if patch_file == "" then
        succeed = false
        break
      end
      get_read_package("")
      local read_pack = get_read_package(patch_file)
      if not nx_is_valid(read_pack) then
        disp_error(util_text_1("err_file_open", patch_file))
        succeed = false
        break
      end
      local file_tab = pack_child:GetChildList()
      for j = 1, table.getn(file_tab) do
        local file_name = file_tab[j].Name
        local file_pack = file_tab[j].pack
        if file_pack ~= "" then
          local pack_name = root_path .. file_pack
          local write_pack = get_write_package(pack_name)
          if write_pack ~= nil then
            if write_pack:FindFile(file_name) then
              write_pack:RemoveFile(file_name)
            end
            if not write_pack:CopyForPatch(read_pack, file_name, file_name, "") then
              nx_log("marge file failed<" .. file_name .. ">")
              succeed = false
            end
          else
            succeed = false
            break
          end
        else
          local full_name = root_path .. file_name
          local path, name = package_man:SplitFilePath(full_name)
          if not nx_path_exists(path) then
            nx_path_create(path)
          end
          nx_function("ext_set_file_Attribute_Nor", full_name)
          if not read_pack:GetFile(file_name, full_name) then
            succeed = false
            nx_log("marge file failed<" .. file_name .. ">")
          end
        end
        file_cur = file_cur + 1
        show_progress(file_cur, file_num * 2)
        nx_pause(0)
      end
    end
  end
  if nx_running(nx_current(), "download_all_repair") then
    nx_kill(nx_current(), "download_all_repair")
  end
  if succeed then
    show_tishi_info(util_text_1("msg_switch_succeed", utf8_to_widestr(form.program_sel)))
    disp_error(util_text_1("msg_switch_finish", utf8_to_widestr(form.program_sel)))
    switch_func_page(form, "page_server")
  else
    show_tishi_info(util_text_1("msg_switch_failed", utf8_to_widestr(form.program_sel)))
  end
  set_button_enable(true, get_current_version() == form.last_version)
  nx_destroy(repair_file_list)
  get_read_package("")
  get_write_package("")
  show_main_window(9)
  form.switch_state = SWITCH_STATE_STOP
  if is_rollback then
    disp_error(util_text_1("msg_switch_once_try", utf8_to_widestr(form.program_sel)))
    rollback_config()
    nx_execute("main", "exit_game")
  elseif not succeed then
    disp_error(util_text_1("msg_switch_need_repair", utf8_to_widestr(form.program_sel)))
  end
  return succeed
end
function wait_repair_finish(repair_file_list, pack_child, patch_path)
  local package_man = nx_value("package_man")
  if not nx_is_valid(pack_child) then
    return ""
  end
  local local_file = patch_path .. pack_child.Name
  while true do
    nx_pause(0)
    if nx_file_exists(local_file) then
      local local_md5 = package_man:GetFileMD5String(local_file)
      if local_md5 == pack_child.md5 then
        return local_file
      end
    end
    if not nx_running(nx_current(), "download_all_repair") then
      return ""
    end
    if repair_file_list.download_result == false then
      return ""
    end
  end
  return ""
end
function download_all_repair(form, repair_file_list, patch_path)
  local package_man = nx_value("package_man")
  local succeed = true
  form.patch_cur_size = 0
  local pack_tab = repair_file_list:GetChildList()
  for i = 1, table.getn(pack_tab) do
    local pack_child = pack_tab[i]
    local remote_file = pack_child.Name
    local local_file = patch_path .. pack_child.Name
    if nx_file_exists(local_file) and package_man:GetFileMD5String(local_file) ~= pack_child.md5 then
      nx_file_delete(local_file)
    end
    if not nx_file_exists(local_file) then
      show_tishi_info(util_text_1("msg_repair_download_ready", remote_file))
      if not download_file(DATA_TYPE_REPAIR, remote_file, local_file, "BreakAndContinue", 0) then
        repair_file_list.download_result = false
        succeed = false
        break
      end
      if package_man:GetFileMD5String(local_file) ~= pack_child.md5 then
        disp_error(util_text_1("err_file_check", remote_file))
        nx_file_delete(local_file)
        repair_file_list.download_result = false
        succeed = false
        break
      end
      form.patch_cur_size = form.patch_cur_size + nx_number(pack_child.size)
    end
    nx_pause(0)
  end
  if succeed then
    show_tishi_info(util_text_0("msg_switch_download_finish"))
  end
end
function calculate_repair_size(form, repair_file_list)
  local package_man = nx_value("package_man")
  local patch_path = get_patch_path()
  if patch_path == "" then
    return 0
  end
  form.patch_all_size = 0
  local pack_tab = repair_file_list:GetChildList()
  for i = 1, table.getn(pack_tab) do
    local pack_child = pack_tab[i]
    local local_file = patch_path .. pack_child.Name
    if not nx_file_exists(local_file) or package_man:GetFileMD5String(local_file) ~= pack_child.md5 then
      form.patch_all_size = nx_number(form.patch_all_size) + nx_number(pack_child.size)
    end
  end
end
function get_repair_file_list(form, repair_file_list)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  if not nx_is_valid(repair_file_list) then
    return false
  end
  local remote_file = "version.files.package"
  if form.last_version ~= VERSION_NUM_UNKNOWN then
    remote_file = "version.files_" .. form.last_version .. ".package"
  end
  local temp_file = get_version_files(remote_file, "version.files")
  if temp_file == "" then
    return false
  end
  local file_list = nx_create("StringList")
  if not file_list:LoadFromFile(temp_file) then
    disp_error(util_text_1("err_file_open", "version.files"))
    nx_destroy(file_list)
    nx_file_delete(temp_file)
    return false
  end
  local version_info = file_list:GetStringByIndex(0)
  local s1, version, s2, file_num = package_man:SplitString(version_info, "|")
  if nx_number(file_num) ~= nx_number(file_list:GetStringCount() - 1) then
    disp_error(util_text_1("err_file_check", "version.files"))
    nx_destroy(file_list)
    nx_file_delete(temp_file)
    return false
  end
  repair_file_list.version = version
  repair_file_list.file_num = 0
  local succeed = true
  for i = 1, nx_number(file_num) do
    local file_info = file_list:GetStringByIndex(i)
    local fname, fsize, ftime, fmd5, fpack, pname, psize, ptime, pmd5 = package_man:SplitString(file_info, "|")
    if pmd5 == nil then
      disp_error(util_text_1("err_file_read", "version.files"))
      succeed = false
      break
    end
    local need_update = false
    if fpack == "" then
      local rname = root_path .. fname
      local rsize = package_man:GetFileSizeString(rname)
      local rtime = package_man:GetFileTimeString(rname)
      if rsize ~= fsize then
        need_update = true
      elseif rtime ~= ftime then
        local rmd5 = package_man:GetFileMD5String(rname)
        if rmd5 ~= fmd5 then
          need_update = true
        end
      end
    else
      local read_pack = get_read_package(root_path .. fpack)
      if read_pack == nil then
        local package_repair = nx_value("package_repair")
        if nx_is_valid(package_repair) and package_repair:RepairPackageFile(root_path .. fpack) then
          read_pack = get_read_package(root_path .. fpack)
        end
      end
      if read_pack ~= nil and read_pack:FindFile(fname) then
        local rsize = nx_string(read_pack:GetFileOriginSize(fname))
        local rtime = read_pack:GetFileTimeString(fname)
        if rsize ~= fsize then
          need_update = true
        elseif rtime ~= ftime then
          local rmd5 = nx_string(read_pack:GetFileMD5(fname))
          if rmd5 ~= fmd5 then
            need_update = true
          end
        end
      else
        need_update = true
      end
    end
    if need_update then
      local pack_child = repair_file_list:GetChild(pname)
      if not nx_is_valid(pack_child) then
        pack_child = repair_file_list:CreateChild(pname)
        pack_child.size = psize
        pack_child.md5 = pmd5
      end
      if nx_is_valid(pack_child) then
        local file_child = pack_child:CreateChild(fname)
        file_child.pack = fpack
      end
      repair_file_list.file_num = repair_file_list.file_num + 1
    end
    show_progress(i, file_num)
    if i % 100 == 0 then
      nx_pause(0)
    end
  end
  nx_destroy(file_list)
  nx_file_delete(temp_file)
  get_read_package("")
  return succeed
end
function get_switch_file_list(form, repair_file_list)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  local remote_file = "version.files.package"
  if form.last_version ~= VERSION_NUM_UNKNOWN then
    remote_file = "version.files_" .. form.last_version .. ".package"
  end
  local temp_file_new = get_version_files(remote_file, "version_new.files")
  if temp_file_new == "" then
    return false
  end
  local temp_file_old = patch_path .. "version_old.files"
  if not nx_file_exists(temp_file_old) then
    return false
  end
  local file_list_new = nx_create("StringList")
  local file_list_old = nx_create("StringList")
  if not file_list_new:LoadFromFile(temp_file_new) then
    disp_error(util_text_1("err_file_open", "version_new.files"))
    nx_destroy(file_list_new)
    nx_file_delete(temp_file_new)
    nx_destroy(file_list_old)
    nx_file_delete(temp_file_old)
    return false
  end
  if not file_list_old:LoadFromFile(temp_file_old) then
    disp_error(util_text_1("err_file_open", "version_old.files"))
    nx_destroy(file_list_new)
    nx_file_delete(temp_file_new)
    nx_destroy(file_list_old)
    nx_file_delete(temp_file_old)
    return false
  end
  local version_info_new = file_list_new:GetStringByIndex(0)
  local s1, version_new, s2, file_num_new = package_man:SplitString(version_info_new, "|")
  if nx_number(file_num_new) ~= nx_number(file_list_new:GetStringCount() - 1) then
    disp_error(util_text_1("err_file_check", "version_new.files"))
    nx_destroy(file_list_new)
    nx_file_delete(temp_file_new)
    nx_destroy(file_list_old)
    nx_file_delete(temp_file_old)
    return false
  end
  local version_info_old = file_list_old:GetStringByIndex(0)
  local s3, version_old, s4, file_num_old = package_man:SplitString(version_info_old, "|")
  if nx_number(file_num_old) ~= nx_number(file_list_old:GetStringCount() - 1) then
    disp_error(util_text_1("err_file_check", "version_old.files"))
    nx_destroy(file_list_new)
    nx_file_delete(temp_file_new)
    nx_destroy(file_list_old)
    nx_file_delete(temp_file_old)
    return false
  end
  local file_new_tab = convert_to_table(file_list_new)
  local file_old_tab = convert_to_table(file_list_old)
  repair_file_list.version = version_new
  repair_file_list.file_num = 0
  local current_count = 1
  for fname, info_tab in pairs(file_new_tab) do
    local fsize = info_tab[1]
    local ftime = info_tab[2]
    local fmd5 = info_tab[3]
    local fpack = info_tab[4]
    local pname = info_tab[5]
    local psize = info_tab[6]
    local ptime = info_tab[7]
    local pmd5 = info_tab[8]
    current_count = current_count + 1
    local need_update = false
    if file_old_tab[fname] == nil then
      need_update = true
    elseif file_old_tab[fname][3] ~= fmd5 then
      need_update = true
    end
    if need_update then
      local pack_child = repair_file_list:GetChild(pname)
      if not nx_is_valid(pack_child) then
        pack_child = repair_file_list:CreateChild(pname)
        pack_child.size = psize
        pack_child.md5 = pmd5
      end
      if nx_is_valid(pack_child) then
        local file_child = pack_child:CreateChild(fname)
        file_child.pack = fpack
      end
      repair_file_list.file_num = repair_file_list.file_num + 1
    end
    show_progress(current_count, file_num_new)
    if current_count % 100 == 0 then
      nx_pause(0)
    end
  end
  nx_destroy(file_list_new)
  nx_file_delete(temp_file_new)
  nx_destroy(file_list_old)
  nx_file_delete(temp_file_old)
  return true
end
function get_version_files(remote_file, local_file)
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local patch_path = get_patch_path()
  if patch_path == "" then
    return ""
  end
  local temp_file = get_list_file(DATA_TYPE_REPAIR, remote_file, patch_path, false)
  if temp_file == "" then
    return ""
  end
  local read_pack = package_man:Create("", "", temp_file)
  if not read_pack:LoadFromFile() then
    disp_error(util_text_1("err_file_open", remote_file))
    package_man:Delete(read_pack)
    nx_file_delete(temp_file)
    return ""
  end
  local full_name = patch_path .. local_file
  if not read_pack:GetFile("version.files", full_name) then
    disp_error(util_text_1("err_file_open", remote_file))
    package_man:Delete(read_pack)
    nx_file_delete(temp_file)
    return ""
  end
  package_man:Delete(read_pack)
  nx_file_delete(temp_file)
  return full_name
end
function convert_to_table(list)
  local package_man = nx_value("package_man")
  local file_tab = {}
  local file_num = list:GetStringCount() - 1
  for i = 1, file_num do
    local file_info = list:GetStringByIndex(i)
    if file_info ~= "" then
      local fname, fsize, ftime, fmd5, fpack, pname, psize, ptime, pmd5 = package_man:SplitString(file_info, "|")
      if pmd5 ~= nil and pmd5 ~= "" then
        file_tab[fname] = {
          fsize,
          ftime,
          fmd5,
          fpack,
          pname,
          psize,
          ptime,
          pmd5
        }
      end
    end
  end
  return file_tab
end
function run_update_process(form)
  local patch_path = get_patch_path()
  if patch_path == "" then
    return false
  end
  local url_list = nx_value("url_list")
  if not nx_is_valid(url_list) then
    return false
  end
  set_button_enable(false, false)
  local cur_version = get_current_version()
  local all_inc_patch = nx_value("all_inc_patch")
  local all_dec_patch = nx_value("all_dec_patch")
  all_inc_patch.download_result = true
  all_dec_patch.download_result = true
  if form.server_type == SERVER_TYPE_NOR then
    last_version = all_inc_patch.last_version
  elseif form.server_type == SERVER_TYPE_EXP then
    last_version = all_inc_patch.gray_version
  end
  last_version = "0.0.1.151"
  if cur_version == last_version then
    show_tishi_info(util_text_0("msg_version_lastest"))
    set_button_enable(true, true)
    return true
  end
  
  local is_roll_back = compare_version(cur_version, last_version) < 0
  if is_roll_back then
    calculate_patch_size(form, all_inc_patch, last_version)
  else
    calculate_patch_size(form, all_dec_patch, last_version)
  end
  local need_space = nx_number(form.patch_all_size) * 2.5
  set_web_view_enable(false)
  local info_client = util_text_2("msg_update_client_running", last_version, cur_version)
  while true do
    if not check_client_running() then
      break
    end
    if disp_confirm(info_client, false) == "cancel" then
      set_web_view_enable(true)
      return false
    end
  end
  local info_space = util_text_1("err_update_disk_no_enough", nx_int(need_space / 1024 / 1024 + 1))
  while true do
    if check_disk_space_enough(need_space) then
      break
    end
    if disp_confirm(info_space, false) == "cancel" then
      set_web_view_enable(true)
      return false
    end
  end
  set_web_view_enable(true)
  del_eff_obj()
  switch_func_page(form, "page_content")
  if is_roll_back then
    nx_execute(nx_current(), "download_all_patch", form, all_inc_patch, cur_version, last_version, patch_path)
    nx_execute(nx_current(), "inc_ver_update", form, all_inc_patch, cur_version, last_version, patch_path)
  else
    nx_execute(nx_current(), "download_all_patch", form, all_dec_patch, cur_version, last_version, patch_path)
    nx_execute(nx_current(), "dec_ver_update", form, all_dec_patch, cur_version, last_version, patch_path)
  end
  return true
end
function dec_ver_update(form, patch_list, cur_version, last_version, patch_path)
  local package_man = nx_value("package_man")
  local start_version = cur_version
  form.close_confirm = true
  show_tishi_info(util_text_0("msg_update_start"))
  local succeed = true
  while true do
    if cur_version == VERSION_NUM_UNKNOWN then
      succeed = false
      break
    end
    if cur_version == last_version then
      succeed = true
      break
    end
    local patch_file = wait_patch_finish(patch_list, cur_version, patch_path)
    if patch_file == "" then
      succeed = false
      break
    end
    if start_version ~= cur_version and check_is_need_restart(patch_file) then
      nx_execute("main", "exit_game")
      return true
    end
    if not apply_patch_package(patch_file) then
      disp_error(util_text_1("err_file_apply", patch_file))
      succeed = false
      break
    end
    local new_version = get_current_version()
    if compare_version(new_version, cur_version) == 0 then
      succeed = false
      break
    end
    cur_version = new_version
    show_version(form)
  end
  if nx_running(nx_current(), "download_all_patch") then
    nx_kill(nx_current(), "download_all_patch")
  end
  if succeed then
    show_tishi_info(util_text_0("msg_update_succeed"))
  else
    show_tishi_info(util_text_0("msg_update_failed"))
  end
  set_button_enable(true, succeed)
  show_main_window(9)
  form.close_confirm = false
  return succeed
end
function inc_ver_update(form, patch_list, cur_version, last_version, patch_path)
  local package_man = nx_value("package_man")
  local start_version = cur_version
  form.close_confirm = true
  show_tishi_info(util_text_0("msg_update_start"))
  local succeed = true
  while true do
    if cur_version == VERSION_NUM_UNKNOWN then
      succeed = false
      break
    end
    if cur_version == last_version then
      succeed = true
      break
    end
    local patch_file = wait_patch_finish(patch_list, cur_version, patch_path)
	if cur_version == "0.0.1.144" then
		patch_file = patch_path .. "jyzj-0.0.1.144-0.0.1.145.patch"
	elseif cur_version == "0.0.1.145" then 
		patch_file = patch_path .. "jyzj-0.0.1.145-0.0.1.146.patch"
	elseif cur_version == "0.0.1.146" then 
		patch_file = patch_path .. "jyzj-0.0.1.146-0.0.1.147.patch"
	elseif cur_version == "0.0.1.147" then 
		patch_file = patch_path .. "jyzj-0.0.1.147-0.0.1.148.patch"
	elseif cur_version == "0.0.1.148" then 
		patch_file = patch_path .. "jyzj-0.0.1.148-0.0.1.149.patch"
	elseif cur_version == "0.0.1.149" then 
		patch_file = patch_path .. "jyzj-0.0.1.149-0.0.1.150.patch"
	elseif cur_version == "0.0.1.150" then 
		patch_file = patch_path .. "jyzj-0.0.1.150-0.0.1.151.patch"
	end
	
    if patch_file == "" then
      succeed = false
      break
    end
    if start_version ~= cur_version and check_is_need_restart(patch_file) then
      nx_execute("main", "exit_game")
      return true
    end
    if not apply_patch_package(patch_file) then
      disp_error(util_text_1("err_file_apply", patch_file))
      succeed = false
      break
    end
    local new_version = get_current_version()
    if compare_version(new_version, cur_version) == 0 then
      succeed = false
      break
    end
    cur_version = new_version
    show_version(form)
  end
  if nx_running(nx_current(), "download_all_patch") then
    nx_kill(nx_current(), "download_all_patch")
  end
  if succeed then
    show_tishi_info(util_text_0("msg_update_succeed"))
  else
    show_tishi_info(util_text_0("msg_update_failed"))
  end
  set_button_enable(true, succeed)
  show_main_window(9)
  form.close_confirm = false
  return succeed
end
function check_is_need_restart(pack_name)
  local package_man = nx_value("package_man")
  local package = package_man:Create("", "", pack_name)
  if not package:LoadFromFile() then
    package_man:Delete(package)
    return false
  end
  if package:FindFile("splitfile.ini") then
    package_man:Delete(package)
    disp_error(util_text_0("msg_updater_restart"))
    return true
  end
  package_man:Delete(package)
  return false
end
function wait_patch_finish(patch_list, cur_version, patch_path)
  local package_man = nx_value("package_man")
  local patch = get_avail_patch(patch_list, cur_version)
  if not nx_is_valid(patch) then
    return ""
  end
  local local_file = patch_path .. patch.Name
  while true do
    nx_pause(0)
    if nx_file_exists(local_file) then
      local local_md5 = package_man:GetFileMD5String(local_file)
      if local_md5 == patch.md5 then
        return local_file
      end
    end
    if not nx_running(nx_current(), "download_all_patch") then
      return ""
    end
    if patch_list.download_result == false then
      return ""
    end
  end
  return ""
end
function download_all_patch(form, patch_list, cur_version, last_version, patch_path)
  local package_man = nx_value("package_man")
  local succeed = true
  form.patch_cur_size = 0
  local failed_count = 0
  while true do
    if cur_version == last_version then
      break
    end
    local patch = get_avail_patch(patch_list, cur_version)
    if not nx_is_valid(patch) then
      break
    end
    local remote_file = patch.Name
    local local_file = patch_path .. patch.Name
    local file_size = patch.size
    if nx_file_exists(local_file) and package_man:GetFileMD5String(local_file) ~= patch.md5 then
      nx_file_delete(local_file)
    end
    if not nx_file_exists(local_file) then
      show_tishi_info(util_text_1("msg_download_ready", remote_file))
      if not download_file(DATA_TYPE_PATCH, remote_file, local_file, "BreakAndContinue", file_size) then
        patch_list.download_result = false
        succeed = false
        break
      end
      if package_man:GetFileMD5String(local_file) ~= patch.md5 then
        nx_file_delete(local_file)
        failed_count = failed_count + 1
        if failed_count >= 3 then
          disp_error(util_text_1("err_file_check", remote_file))
          patch_list.download_result = false
          break
        end
        succeed = false
      end
      if succeed then
        form.patch_cur_size = form.patch_cur_size + nx_number(patch.size)
      end
    end
    if succeed then
      local beg_ver, end_ver = get_all_version(patch.Name, PATCH_PREFIX, PATCH_SUFFIX)
      if nx_string(beg_ver) == nx_string(end_ver) then
        break
      end
      cur_version = end_ver
      failed_count = 0
    end
  end
  if succeed then
    show_tishi_info(util_text_0("msg_download_finish"))
  end
end
function load_patch_list()
  local all_inc_patch = nx_create("ArrayList")
  local all_dec_patch = nx_create("ArrayList")
  nx_set_value("all_inc_patch", all_inc_patch)
  nx_set_value("all_dec_patch", all_dec_patch)
  local cur_version = get_current_version()
  all_inc_patch.last_version = cur_version
  all_inc_patch.gray_version = cur_version
  all_dec_patch.last_version = cur_version
  all_dec_patch.gray_version = cur_version
  all_inc_patch.download_result = true
  all_dec_patch.download_result = true
  local patch_path = get_patch_path()
  if patch_path == "" then
    return 0
  end
  local temp_file = get_list_file(DATA_TYPE_VERSION, "patchlist.ini", patch_path, false)
  if temp_file == "" then
    return 0
  end
  load_inc_ver_patch_list(temp_file, all_inc_patch)
  load_dec_ver_patch_list(temp_file, all_dec_patch)
  nx_file_delete(temp_file)
end
function calculate_patch_size(form, patch_list, last_version)
  local package_man = nx_value("package_man")
  local patch_path = get_patch_path()
  if patch_path == "" then
    return 0
  end
  local cur_version = get_current_version()
  form.patch_all_size = 0
  while true do
    if cur_version == last_version then
      break
    end
    local patch = get_avail_patch(patch_list, cur_version)
    if not nx_is_valid(patch) then
      break
    end
    local local_file = patch_path .. patch.Name
    if not nx_file_exists(local_file) or package_man:GetFileMD5String(local_file) ~= patch.md5 then
      form.patch_all_size = nx_number(form.patch_all_size) + nx_number(patch.size)
    end
    local beg_ver, end_ver = get_all_version(patch.Name, PATCH_PREFIX, PATCH_SUFFIX)
    cur_version = end_ver
  end
end
function load_inc_ver_patch_list(file_path, list)
  local ini = nx_create("FxTool.IniDocument")
  ini.FileName = file_path
  if not ini:LoadFromFile() then
    disp_error(util_text_1("err_file_open", "patchlist.ini"))
    nx_destroy(ini)
    return false
  end
  local temp_list = nx_create("ArrayList")
  temp_list.last_version = ini:ReadString("main", "last_version", VERSION_NUM_UNKNOWN)
  temp_list.gray_version = ini:ReadString("main", "gray_version", VERSION_NUM_UNKNOWN)
  local section_table = ini:GetSectionList()
  for i = 1, table.getn(section_table) do
    local section = section_table[i]
    local file_name = ini:ReadString(section, "patch", "")
    local file_md5 = ini:ReadString(section, "md5", "")
    local file_size = ini:ReadString(section, "size", "0")
    local beg_ver, end_ver = get_all_version(file_name, PATCH_PREFIX, PATCH_SUFFIX)
    if beg_ver ~= "" and end_ver ~= "" and compare_version(beg_ver, end_ver) < 0 then
      local child = temp_list:CreateChild(file_name)
      child.beg_ver = beg_ver
      child.end_ver = end_ver
      child.md5 = file_md5
      child.size = file_size
      child.index = -1
    end
  end
  nx_destroy(ini)
  local patch_num = temp_list:GetChildCount()
  for i = 1, patch_num do
    sort_patch_by_index(temp_list, i)
  end
  list.last_version = temp_list.last_version
  list.gray_version = temp_list.gray_version
  for i = 1, patch_num do
    local child_old = get_patch_by_index(temp_list, i)
    local child_new = list:CreateChild(child_old.Name)
    child_new.beg_ver = child_old.beg_ver
    child_new.end_ver = child_old.end_ver
    child_new.md5 = child_old.md5
    child_new.size = child_old.size
  end
  nx_destroy(temp_list)
  return true
end
function load_dec_ver_patch_list(file_path, list)
  local ini = nx_create("FxTool.IniDocument")
  ini.FileName = file_path
  if not ini:LoadFromFile() then
    disp_error(util_text_1("err_file_open", "patchlist.ini"))
    nx_destroy(ini)
    return false
  end
  local temp_list = nx_create("ArrayList")
  temp_list.last_version = ini:ReadString("main", "last_version", VERSION_NUM_UNKNOWN)
  temp_list.gray_version = ini:ReadString("main", "gray_version", VERSION_NUM_UNKNOWN)
  local section_table = ini:GetSectionList()
  for i = 1, table.getn(section_table) do
    local section = section_table[i]
    local file_name = ini:ReadString(section, "patchh", "")
    local file_md5 = ini:ReadString(section, "md5h", "")
    local file_size = ini:ReadString(section, "size", "0")
    local beg_ver, end_ver = get_all_version(file_name, PATCH_PREFIX, PATCH_SUFFIX)
    if beg_ver ~= "" and end_ver ~= "" and compare_version(beg_ver, end_ver) > 0 then
      local child = temp_list:CreateChild(file_name)
      child.beg_ver = beg_ver
      child.end_ver = end_ver
      child.md5 = file_md5
      child.size = file_size
      child.index = -1
    end
  end
  nx_destroy(ini)
  local patch_num = temp_list:GetChildCount()
  for i = 1, patch_num do
    sort_patch_by_index(temp_list, patch_num - i + 1)
  end
  list.last_version = temp_list.last_version
  list.gray_version = temp_list.gray_version
  for i = 1, patch_num do
    local child_old = get_patch_by_index(temp_list, i)
    local child_new = list:CreateChild(child_old.Name)
    child_new.beg_ver = child_old.beg_ver
    child_new.end_ver = child_old.end_ver
    child_new.md5 = child_old.md5
    child_new.size = child_old.size
  end
  nx_destroy(temp_list)
  return true
end
function refresh_file_certificate()
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local read_pack = get_read_package(root_path .. "res\\cfc.package")
  if not nx_is_valid(read_pack) then
    return true
  end
  local file_table = read_pack:GetFileList()
  local file_num = table.getn(file_table)
  for i = 1, file_num do
    local file_name = file_table[i]
    local path, name = nx_function("ext_split_file_path", file_name)
    local bin_file = root_path .. "bin\\" .. name
    if not nx_function("ext_check_file_certificate", bin_file) then
      nx_function("ext_set_file_Attribute_Nor", bin_file)
      read_pack:GetFile(file_name, bin_file)
    end
  end
  get_read_package("")
  return true
end
function check_file_md5(form)
  if not nx_is_valid(form) then
    return false
  end
  local package_man = nx_value("package_man")
  local root_path = package_man:GetParentPath(nx_work_path())
  local read_pack = get_read_package(root_path .. "updater\\updater_res.package")
  if not nx_is_valid(read_pack) then
    return false
  end
  local file_name = "updater_res\\md5_list.ini"
  if not read_pack:FindFile(file_name) then
    get_read_package("")
    return false
  end
  local temp_file = root_path .. "patch\\temp_md5_list.ini"
  local path, name = package_man:SplitFilePath(temp_file)
  if not nx_path_exists(path) then
    nx_path_create(path)
  end
  if not read_pack:GetFile(file_name, temp_file) then
    get_read_package("")
    return false
  end
  local md5_list = nx_create("StringList")
  if not md5_list:LoadFromFile(temp_file) then
    get_read_package("")
    nx_destroy(md5_list)
    nx_file_delete(temp_file)
    return false
  end
  read_pack = get_read_package(root_path .. "res\\cfc.package")
  local md5_infos = ""
  local succeed = true
  for i = 1, nx_number(md5_list:GetStringCount()) do
    local file_info = md5_list:GetStringByIndex(i)
    if file_info ~= "" then
      local file_name, file_md5 = package_man:SplitString(file_info, "|")
      local path, name = nx_function("ext_split_file_path", file_name)
      if md5_infos ~= "" then
        md5_infos = md5_infos .. "|"
      end
      md5_infos = md5_infos .. name .. "|" .. file_md5
      if package_man:GetFileMD5String(root_path .. file_name) ~= file_md5 then
        if not nx_is_valid(read_pack) then
          succeed = false
          break
        end
        if not read_pack:FindFile("res\\cfc\\" .. name) then
          succeed = false
          break
        end
        nx_function("ext_set_file_Attribute_Nor", root_path .. file_name)
        if not read_pack:GetFile("res\\cfc\\" .. name, root_path .. file_name) then
          succeed = false
          break
        end
      end
    end
  end
  form.md5_infos = md5_infos
  get_read_package("")
  nx_destroy(md5_list)
  nx_file_delete(temp_file)
  return succeed
end
