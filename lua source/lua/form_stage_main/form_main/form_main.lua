require("const_define")
require("util_gui")
require("share\\view_define")
require("share\\itemtype_define")
require("custom_sender")
require("define\\shortcut_key_define")
require("tips_data")
require("form_stage_main\\switch\\switch_define")
require("util_functions")
require("define\\gamehand_type")
require("util_role_prop")
require("menu_game")
FORM_JOB_MAIN_NEW = "form_stage_main\\form_life\\form_job_main_new"
local form_table_from_new_to_old = {
  show = {
    "form_stage_main\\form_task\\form_task_trace"
  },
  hide = {},
  close = {},
  open = {}
}
local form_table_from_old_to_new = {
  show = {
    "form_stage_main\\form_main\\form_main_player",
    "form_stage_main\\form_main\\form_main_func_btns",
    "form_stage_main\\form_main\\form_main_map"
  },
  hide = {
    "form_stage_main\\form_task\\form_task_trace"
  },
  close = {
    "form_stage_main\\form_home\\form_home_enter",
    "form_stage_main\\form_home\\form_home_function",
    "form_stage_main\\form_home\\form_home_model"
  },
  open = {}
}
local log = function(str)
  nx_function("ext_log_testor", str .. "\n")
end
function main_form_init(self)
  self.first = true
  self.clicked_index = -1
  self.clicked_btn = nx_null()
  return 1
end
function main_form_open(self)
  update_newjh_groupbox(self)
  self.no_need_motion_alpha = true
  self.first = true
  on_func_btns_init(self)
  local bIsNewJHModule = is_newjhmodule()
  if not bIsNewJHModule then
  end
  util_show_form("form_stage_main\\form_main\\form_main_chat", true)
  util_show_form("form_stage_main\\form_main\\form_main_sysinfo", true)
  util_show_form("form_stage_main\\form_main\\form_main_team", true)
  util_show_form("form_stage_main\\form_main\\form_main_map", true)
  util_show_form("form_stage_main\\form_main\\form_main_select", true)
  util_show_form("form_stage_main\\form_main\\form_main_trumpet", true, "", true)
  util_show_form("form_stage_main\\form_main\\form_notice_shortcut", true)
  util_show_form("form_stage_main\\form_main\\form_main_func_btns", true)
  util_show_form("form_stage_main\\form_main\\form_main_shortcut_onestep", true)
  util_show_form("form_stage_main\\form_main\\form_main_marry", true)
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_laba_info", true, "", "", true)
  if nx_is_valid(form) then
    form:Show()
    form.Visible = false
  end
  local form_shortcut = util_get_form("form_stage_main\\form_main\\form_main_shortcut", true, false, "", true)
  if nx_is_valid(form_shortcut) then
    form_shortcut:Show()
  end
  local chat_light_form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_chat_system\\form_chat_light", true)
  if nx_is_valid(chat_light_form) then
    chat_light_form:Show()
    chat_light_form.Visible = false
  end
  local form_marry = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_laba_info_marry", true)
  if nx_is_valid(form_marry) then
    form_marry:Show()
    form_marry.Visible = false
  end
  local form_sysinfo = nx_value("form_stage_main\\form_main\\form_main_sysinfo")
  if nx_is_valid(form_sysinfo) then
    local game_config_info = nx_value("game_config_info")
    local visible = false
    visible = nx_is_valid(game_config_info) and nx_find_property(game_config_info, "right_fight_info") and (game_config_info.right_fight_info == 1 and true or false)
    form_sysinfo.info_group.Visible = visible
  end
  util_show_form("form_stage_main\\form_main\\form_main_player", true)
  util_show_form("form_stage_main\\form_main\\form_main_buff", true)
  nx_execute("form_stage_main\\form_tiguan\\form_tiguan_trace", "open_tiguan_trace")
  nx_execute("form_stage_main\\form_main\\form_main_shortcut_extraskill", "open_extra_skill")
  nx_execute("form_stage_main\\form_main\\form_main_shortcut_copyskill", "open_copy_skill")
  local form = self
  local gui = nx_value("gui")
  nx_set_value(GAME_GUI_MAIN, self)
  nx_execute("form_stage_main\\form_main\\form_main_centerinfo", "init_center_info", self)
  form.group_pk_state.Visible = false
  util_get_global_entity("mplayer_view_manager", "MainPlayerView", true)
  nx_execute("tips_game", "init_tip_game", gui.Desktop)
  nx_execute("form_stage_main\\form_main\\form_main_request", "Init", self)
  nx_execute("form_stage_main\\form_main\\form_main_request_right", "Init", self)
  nx_execute("animation", "load_animation_info")
  nx_execute("form_stage_main\\form_outland\\form_outland_war_title", "check_on_off_this")
  local game_config = nx_value("game_config")
  if nx_is_valid(game_config) then
    local ip_address = game_config.login_addr
    local ip_port = game_config.login_port
  end
  local databinder = nx_value("data_binder")
  if nx_is_valid(databinder) then
    databinder:AddRolePropertyBind("Dead", "int", self, "form_stage_main\\form_main\\form_main", "dead_changed")
    databinder:AddRolePropertyBind("OpenLifeJob", "string", form, nx_current(), "on_update_open_life_flag")
    databinder:AddRolePropertyBind("PowerLevel", "int", form, nx_current(), "on_update_power_level")
    databinder:AddRolePropertyBind("DongFangNum", "int", form, nx_current(), "on_show_dongfang")
  end
  check_shortcut_ride(self)
  check_be_shortcut_ride(self)
  check_sable_state(self)
  change_size()
  self.btn_server.Visible = false
  init_form_main_logic()
  self.lbl_life_tip.Visible = false
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  add_bind_btn_life_fight(self)
  form.lbl_sns_news.Visible = false
  bind_rec_npc_relation(self)
  self.btn_need_repair.Visible = false
  set_gm_btn_image(form)
  form.btn_freshman.Visible = false
  form.btn_mutual_end.Visible = false
  if nx_find_custom(form, "web_view_yy") then
    form.web_view_yy.Visible = false
    form.web_view_yy:AddWebCallBack("jy_que_web_close", nx_current(), "web_close_form")
  end
  local switch_manager = nx_value("SwitchManager")
  local is_open = switch_manager:CheckSwitchEnable(ST_NORMAL_YY_GUILD)
  change_switch(ST_NORMAL_YY_GUILD, is_open)
  local mgr = nx_value("SwitchManager")
  if nx_is_valid(mgr) then
    local flag = mgr:CheckSwitchEnable(ST_FUNCTION_BATTLEFIELD)
    if flag then
      form.lbl_bf_text.ForeColor = "255,147,123,99"
      form.lbl_bf_png.BackImage = "gui\\special\\btn_main\\battle_out.png"
    else
      form.lbl_bf_text.ForeColor = "160,128,128,128"
      form.lbl_bf_png.BackImage = "gui\\special\\btn_main\\battle_jin.png"
    end
  end
  local l, t = load_dbomall_location()
  form.groupbox_dbomall.Top = t
  form.groupbox_dbomall.Left = l
  local m, n = load_show_update_location()
  form.groupbox_show_update.Top = n
  form.groupbox_show_update.Left = m
  form:ToFront(form.groupbox_dbomall)
  form:ToFront(form.btn_func_guide)
  form:ToFront(form.groupbox_show_update)
  local game_config = nx_value("game_config")
  if nx_is_valid(game_config) and not game_config.show_activity then
    game_config.show_activity = true
  end
  refesh_happy_miaohui()
  local timer = nx_value(GAME_TIMER)
  local form_main_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_main_logic) then
    return 1
  end
  form_main_logic:refresh_control()
  if nx_is_valid(timer) and not form_main_logic:fit_all_condition() then
    timer:Register(5000, -1, nx_current(), "form_refresh", form, -1, -1)
  end
  form.rbtn_fight.Checked = true
  local jhmgr = nx_value("JianghuExploreModule")
  if not nx_is_valid(jhmgr) then
    return
  end
  show_jh_tour_info()
  is_show_donghai_activity_btn()
  bind_record_call_back(self)
  local need_show_tvt_update = nx_execute("form_stage_main\\form_tvt\\form_tvt_news", "is_need_tips")
  form.btn_news.Visible = need_show_tvt_update
  if nx_is_valid(databinder) then
    databinder:AddRolePropertyBind("CurJHSceneConfigID", "string", form, nx_current(), "update_newjh_groupbox")
  end
  return 1
end
function main_form_close(form)
  local funcbtns = nx_value("form_main_func_btns")
  if nx_is_valid(funcbtns) then
    nx_destroy(funcbtns)
  end
  form.first = true
  local data_binder = nx_value("data_binder")
  if nx_is_valid(data_binder) then
    data_binder:DelTableBind("job_rec", form)
  end
  local timer = nx_value(GAME_TIMER)
  local game_client = nx_value("game_client")
  local toolbox_view_ids = {
    VIEWPORT_EQUIP_TOOL,
    VIEWPORT_TOOL,
    VIEWPORT_MATERIAL_TOOL,
    VIEWPORT_TASK_TOOL
  }
  for _, view_id in ipairs(toolbox_view_ids) do
    local toolbox_view = game_client:GetView(nx_string(view_id))
    if nx_is_valid(toolbox_view) then
      for i = 1, toolbox_view.Capacity do
        local view_item = toolbox_view:GetViewObj(nx_string(i))
        if nx_is_valid(view_item) then
          local item_type = view_item:QueryProp("ItemType")
          if item_type == ITEMTYPE_ADDBAG then
            timer:UnRegister("form_stage_main\\form_bag", "show_info", view_item)
          end
        end
      end
    end
  end
  local addtoolbox_view_ids = {
    VIEWPORT_EQUIP_TOOL,
    VIEWPORT_TOOL,
    VIEWPORT_MATERIAL_TOOL,
    VIEWPORT_TASK_TOOL
  }
  for _, view_id in ipairs(addtoolbox_view_ids) do
    local addtoolbox_view = game_client:GetView(nx_string(view_id))
    if nx_is_valid(addtoolbox_view) then
      for i = 1, addtoolbox_view.Capacity do
        local view_item = addtoolbox_view:GetViewObj(nx_string(i))
        if nx_is_valid(view_item) then
          timer:UnRegister("form_stage_main\\form_bag", "show_info", view_item)
        end
      end
    end
  end
  nx_execute("form_stage_main\\form_main\\form_main_centerinfo", "clear_center_info", form)
  nx_execute("form_stage_main\\form_main\\form_main_request", "clear_request")
  nx_execute("form_stage_main\\form_main\\form_main_request_right", "clear_request")
  move_over()
  local form_logic = nx_value("form_main_logic")
  if nx_is_valid(form_logic) then
    nx_destroy(form_logic)
  end
  timer:UnRegister(nx_current(), "form_refresh", form)
end
function on_main_form_shut(self, parent)
end
function delete_bag(bag_item, view, index)
  local game_client = nx_value("game_client")
  local toolbox_view_id = ""
  local goods_grid = nx_value("GoodsGrid")
  if nx_is_valid(goods_grid) then
    toolbox_view_id = goods_grid:GetToolBoxViewport(bag_item)
  end
  local beginpos = bag_item:QueryProp("BeginPos")
  local endpos = bag_item:QueryProp("EndPos")
  for i = beginpos, endpos do
    game_client:GetViewObj(nx_string(toolbox_view_id), nx_string(i))
    if nx_is_valid(view_item) then
      return false
    end
  end
  local addtoolbox_view_id = ""
  local goods_grid = nx_value("GoodsGrid")
  if nx_is_valid(goods_grid) then
    addtoolbox_view_id = goods_grid:GetAddToolBoxViewport(bag_item)
  end
  local addtoolbox_view = game_client:GetView(nx_string(addtoolbox_view_id))
  if nx_is_valid(addtoolbox_view) and nx_id_equal(addtoolbox_view, view) then
    nx_execute("custom_sender", "custom_delete_item", addtoolbox_view_id, index, 1)
    return true
  end
  return false
end
function on_click_btn_selfshop(self)
  local game_client = nx_value("game_client")
  local view = game_client:GetView(nx_string(VIEWPORT_SELFSHOP))
  if nx_is_valid(view) then
    nx_execute("custom_sender", "custom_stall_stop_stall")
  else
    nx_execute("custom_sender", "custom_stall_open_stall", util_text("ui_Stallbox"))
  end
  return 1
end
function on_click_btn_zhaomu(self)
  util_auto_show_hide_form("form_stage_main\\form_team\\form_team_recruit")
  return 1
end
function get_force()
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return "0"
  end
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return "0"
  end
  local playerschool = client_player:QueryProp("Force")
  return nx_string(playerschool)
end
function get_new_school()
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return "0"
  end
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return "0"
  end
  local playerschool = client_player:QueryProp("NewSchool")
  return nx_string(playerschool)
end
function on_btn_school_click(self)
  local force = get_force()
  if force ~= "0" and force ~= "" then
    util_auto_show_hide_form("form_stage_main\\form_school_war\\form_new_school_msg_info")
    local form = nx_value("form_stage_main\\form_school_war\\form_new_school_msg_info")
    if nx_is_valid(form) then
      form:Show()
      form.Visible = true
      form.rbtn_m7.Checked = true
    end
    return
  end
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return 0
  end
  local new_school = get_new_school()
  if "0" ~= new_school and "" ~= new_school then
    local SchoolID = nx_int(get_ini_prop("share\\War\\new_school_config.ini", new_school, "ID", ""))
    if SchoolID < nx_int(1) then
      nx_execute("custom_handler", "custom_sysinfo", 0, 0, 0, 2, nx_string("83552"))
      return 0
    end
    util_auto_show_hide_form("form_stage_main\\form_school_war\\form_newschool_school_msg_info")
    local form = nx_value("form_stage_main\\form_school_war\\form_newschool_school_msg_info")
    if nx_is_valid(form) then
      nx_execute("custom_sender", "custom_get_school_msg_info", SchoolID, 0)
      form.SchoolID = SchoolID
      form:Show()
      form.Visible = true
      form.rbtn_m7.Checked = true
    end
    return
  end
  local school = client_player:QueryProp("School")
  local SchoolID = nx_int(get_ini_prop("share\\War\\School_Config.ini", school, "ID", ""))
  if SchoolID < nx_int(1) then
    nx_execute("custom_handler", "custom_sysinfo", 0, 0, 0, 2, nx_string("83552"))
    return 0
  end
  local form = util_get_form("form_stage_main\\form_school_war\\form_school_msg_info", true)
  if form.Visible == false then
    nx_execute("custom_sender", "custom_get_school_msg_info", SchoolID, 0)
    form.SchoolID = SchoolID
    util_show_form("form_stage_main\\form_school_war\\form_school_msg_info", true)
  else
    form:Close()
  end
  return 1
end
function on_show_teamrecruit(self)
  util_auto_show_hide_form("form_stage_main\\form_team\\form_team_recruit")
  return 1
end
function on_show_technique(self)
  util_auto_show_hide_form("form_technique")
  return 1
end
function on_show_pk_list(self)
  local form = self.Parent.Parent
  form.group_pk_state.Visible = not form.group_pk_state.Visible
end
function on_pkstate_change(self)
  local newpkstate = nx_int(self.DataSource)
  local oldpkstate = 1
  local pk_name = nx_string(self.Text)
  local pk_mode = nx_int(self.DataSource)
  nx_execute("custom_sender", "custom_set_pkmode", pk_mode)
  self.Parent.Visible = false
end
function reset_scene()
  local gui = nx_value("gui")
  local shortcut_main_form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
  if nx_is_valid(shortcut_main_form) then
    gui.shortcut_main_page = shortcut_main_form.grid_shortcut_main.page
    gui.shortcut_fix = shortcut_main_form.btn_fix.Visible
  end
  local form = nx_value("form_stage_main\\form_main\\form_main_chat")
  if nx_is_valid(form) then
    gui.chat_type = form.chat_edit.chat_type
    gui.chat_btn_Text = form.chat_channel_btn.Text
    gui.chat_btn_ForeColor = form.chat_channel_btn.ForeColor
    gui.chatlist_Width = form.chat_list.Width
    gui.chatlist_Height = form.chat_list.Height
  end
  gui.Desktop:Close()
  gui.Loader:LoadDesktop(nx_resource_path(), gui.skin_path .. "form_stage_main\\form_main\\form_main.xml")
  gui.Desktop.Left = 0
  gui.Desktop.Top = 0
  gui.Desktop.Width = gui.Width
  gui.Desktop.Height = gui.Height
  gui.Desktop.Transparent = true
  gui.Desktop:ShowModal()
end
function clear_save_chat_info(common_array, form)
  for i = 0, form.new_page_count do
    if common_array:FindArray("chat_list" .. nx_string(i)) then
      common_array:RemoveArray("chat_list" .. nx_string(i))
    end
  end
  common_array.edit_info = nil
end
function save_player_chat_info()
  local form = nx_value("form_stage_main\\form_main\\form_main_chat")
  local common_array = nx_value("common_array")
  if not nx_is_valid(form) or not nx_is_valid(common_array) then
    return
  end
  clear_save_chat_info(common_array, form)
  local list = form.chat_list
  if nx_is_valid(list) then
    save_control_info(common_array, list, "chat_list0")
  end
  for i = 1, form.new_page_count do
    list = form.chat_group:Find("new_chatlist" .. nx_string(nx_int(i)))
    if nx_is_valid(list) then
      save_control_info(common_array, list, "chat_list" .. nx_string(nx_int(i)))
    end
  end
  common_array.edit_info = form.chat_edit.Text
end
function save_fight_system_info()
  local common_array = nx_value("common_array")
  local fight_sys_form = nx_value("form_stage_main\\form_main\\form_main_sysinfo")
  if not nx_is_valid(common_array) or not nx_is_valid(fight_sys_form) then
    return
  end
  if common_array:FindArray("info_list") then
    common_array:RemoveArray("info_list")
  end
  if common_array:FindArray("fight_list") then
    common_array:RemoveArray("fight_list")
  end
  local ctrl_fight = fight_sys_form.fight_list
  local ctrl_sys = fight_sys_form.info_list
  save_control_info(common_array, ctrl_fight, "fight_list")
  save_control_info(common_array, ctrl_sys, "info_list")
end
function save_control_info(common_array, multitext_box, name)
  if not common_array:FindArray(nx_string(name)) then
    common_array:RemoveArray(nx_string(name))
  end
  common_array:AddArray(nx_string(name), common_array, 5000, false)
  if not nx_is_valid(multitext_box) then
    return
  end
  if multitext_box.ItemCount <= 0 then
    return
  end
  for index = 0, multitext_box.ItemCount - 1 do
    common_array:AddChild(name, "info" .. nx_string(index), multitext_box:GetHtmlItemText(index))
    common_array:AddChild(name, "type" .. nx_string(index), multitext_box:GetItemKeyByIndex(index))
  end
end
function dead_changed(form, prop_name, prop_type, prop_value)
  local common_execute = nx_value("common_execute")
  if not nx_is_valid(common_execute) then
    return
  end
  local delay_time = 3
  if nx_number(prop_value) > 0 then
    common_execute:RemoveExecute("show_dead_form_delay", form)
    common_execute:AddExecute("show_dead_form_delay", form, delay_time, form)
    local form = nx_value("form_stage_main\\form_hurt_danger")
    if nx_is_valid(form) then
      nx_execute("form_stage_main\\form_hurt_danger", "close_relive_form")
    end
  else
    common_execute:RemoveExecute("show_dead_form_delay", form)
    nx_execute("form_stage_main\\form_die_util.lua", "close_dead_form")
  end
end
function check_shortcut_ride(self)
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return
  end
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return
  end
  local mount = client_player:QueryProp("Mount")
  if string.len(mount) == 0 or mount == 0 then
    return
  end
  if nx_find_custom(client_player, "mount_name") and 0 < string.len(nx_string(client_player.mount_name)) then
    nx_execute("form_stage_main\\form_main\\form_main_shortcut_ride", "server_up_special_ride", 2, nx_string(client_player.mount_name))
  end
end
function check_be_shortcut_ride(self)
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return
  end
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return
  end
  local ride_state = client_player:QueryProp("RideLinkState")
  if ride_state == 2 then
    nx_execute("form_stage_main\\form_main\\form_main_shortcut_ride", "multi_ride_handle", 1)
  end
end
function check_sable_state(self)
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  local sable = client_player:QueryProp("Sable")
  if string.len(sable) == 0 or sable == 0 then
    return
  end
  if not client_player:FindRecord("sable_rec") then
    return
  end
  local row = client_player:QueryProp("SableCarryID")
  local row_max = client_player:GetRecordRows("sable_rec")
  if row < 0 or row >= row_max then
    return
  end
  local item_config = client_player:QueryRecord("sable_rec", row, 3)
  local sable_state = client_player:QueryProp("SableState")
  if 0 < nx_number(sable_state) then
    local form = nx_execute("util_gui", "util_show_form", "form_stage_main\\form_animalkeep\\form_sable_skill", true)
    nx_execute("form_stage_main\\form_animalkeep\\form_sable_skill", "server_open_sable_skill", form, item_config)
  else
    local gui = nx_value("gui")
    local item_name = gui.TextManager:GetText(item_config)
    local form = nx_execute("util_gui", "util_show_form", "form_stage_main\\form_animalkeep\\form_sable_info", true)
    if nx_is_valid(form) then
      nx_execute("form_stage_main\\form_animalkeep\\form_sable_info", "init_sableinfo", form, item_config, item_name)
    end
  end
end
function on_btn_jianghu_click(self)
  nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
end
function on_btn_life_click(self)
end
function on_btn_fight_click(self)
end
function fix_btn_life_by_job_rec(form)
  local form_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_logic) then
    return
  end
  local gui = nx_value("gui")
  local has_job = is_study_job()
  local show_flag = form_logic:GetShowFlag()
  if show_flag == 1 then
    form.lbl_flag.Visible = false
  elseif show_flag == 2 then
    if not has_job then
      form.rbtn_life.Enabled = false
      form.lbl_flag.Visible = false
    else
      form.rbtn_life.Enabled = true
      form.lbl_3.Text = nx_widestr(gui.TextManager:GetText("ui_mylife"))
      form.lbl_4.BackImage = "gui\\special\\btn_main\\btn_life_out_36.png"
      local count = nx_execute(FORM_JOB_MAIN_NEW, "get_open_life_flag_count")
      if count > 0 and refresh_condition_func(26001) then
        form.lbl_flag.Visible = true
        form.lbl_flag.Text = nx_widestr(nx_string(count))
      else
        form.lbl_flag.Visible = false
      end
    end
  elseif show_flag == 3 then
  end
end
function fix_btn_fight(form)
  local form_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_logic) then
    return
  end
  local gui = nx_value("gui")
  local show_flag = form_logic:GetShowFlag()
  if show_flag == 1 then
    form.lbl_flag.Visible = false
  elseif show_flag == 2 then
  elseif show_flag == 3 then
  end
end
function change_size()
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  local gui = nx_value("gui")
  if not nx_is_valid(gui) then
    return
  end
  if nx_find_custom(form, "groupbox_4") and nx_is_valid(form.groupbox_4) then
    form.groupbox_4.AbsLeft = 0
    form.groupbox_4.AbsTop = gui.Height - form.groupbox_4.Height
  end
  if nx_find_custom(form, "groupbox_show_update") and nx_is_valid(form.groupbox_show_update) and (form.groupbox_show_update.Top + form.groupbox_show_update.Height > gui.Height or form.groupbox_show_update.Left + form.groupbox_show_update.Width > gui.Width) then
    form.groupbox_show_update.Top = 0
    form.groupbox_show_update.Left = 359
  end
  if nx_find_custom(form, "groupbox_dbomall") and nx_is_valid(form.groupbox_dbomall) and (form.groupbox_dbomall.Top + form.groupbox_dbomall.Height > gui.Height or form.groupbox_dbomall.Left + form.groupbox_dbomall.Width > gui.Width) then
    form.groupbox_dbomall.Top = 0
    form.groupbox_dbomall.Left = 359
  end
end
function change_state()
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  form.rbtn_fight.Checked = true
end
function move_over()
  local form_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_logic) then
    return
  end
  if nx_find_method(form_logic, "Recover") then
    form_logic:Recover()
    nx_execute("form_stage_main\\form_main\\form_main_shortcut", "change_form_size")
  end
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if nx_is_valid(form) then
    fix_btn_life_by_job_rec(form)
    fix_btn_fight(form)
  end
end
function on_btn_system_click(self)
  util_auto_show_hide_form("form_stage_main\\form_system\\form_system_option")
end
function add_bind_btn_life_fight(form_main)
  local data_binder = nx_value("data_binder")
  if not nx_is_valid(data_binder) then
    return
  end
  form_main.init_has_job_rec = is_study_job()
  data_binder:AddTableBind("job_rec", form_main, nx_current(), "reflash_btn_life_fight")
end
function reflash_btn_life_fight(form_main)
  local gui = nx_value("gui")
  local form_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_logic) then
    return
  end
  local show_step = 0
  if nx_find_method(form_logic, "GetShowFlag") then
    show_step = form_logic:GetShowFlag()
  end
  local has_job = is_study_job()
  if show_step == 1 then
    if not has_job then
      form_main.rbtn_fight.Checked = true
    end
  elseif show_step == 2 or show_step == 3 then
    fix_btn_life_by_job_rec(form_main)
    if has_job and not form_main.init_has_job_rec then
      form_main.init_has_job_rec = true
      local timer_game = nx_value("timer_game")
      if nx_is_valid(timer_game) then
        form_main.lbl_life_tip.Visible = true
        timer_game:Register(3000, 1, nx_current(), "del_btn_life_tip", form_main, -1, 1)
      end
    end
  end
end
function del_btn_life_tip(form_main)
  if not nx_is_valid(form_main) then
    return
  end
  local timer_game = nx_value("timer_game")
  if nx_is_valid(timer_game) then
    form_main.lbl_life_tip.Visible = false
    timer_game:UnRegister(nx_current(), "del_btn_life_tip", form_main)
  end
end
function is_study_job()
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return false
  end
  if not client_player:FindRecord("job_rec") then
    return false
  end
  local job_cnt = client_player:GetRecordRows("job_rec")
  if job_cnt > 0 then
    return true
  end
  return false
end
function init_form_main_logic()
  local form_logic = nx_value("form_main_logic")
  if nx_is_valid(form_logic) then
    nx_destroy(form_logic)
  end
  form_logic = nx_create("form_main")
  nx_set_value("form_main_logic", form_logic)
end
function on_update_open_life_flag(form)
  local form_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_logic) then
    return
  end
  local show_step = 0
  if nx_find_method(form_logic, "GetShowFlag") then
    show_step = form_logic:GetShowFlag()
  end
  if show_step == 2 or show_step == 3 then
    fix_btn_life_by_job_rec(form)
  end
end
function on_btn_battle_click()
  util_auto_show_hide_form("form_stage_main\\form_tvt\\form_tvt_main")
end
function on_update_power_level(form, prop_name, prop_type, prop_value)
  if not nx_is_valid(form) then
    return
  end
  if nx_number(prop_value) > 10 then
    local common_execute = nx_value("common_execute")
    if nx_is_valid(common_execute) then
      form.mltbox_battle.vis_time = 0
      form.mltbox_battle.Visible = true
      form.lbl_battle_ani.Visible = true
      common_execute:AddExecute("HelperTips", form.mltbox_battle, nx_float(0), nx_float(10))
    end
  end
  refresh_battlefield_btn_show(form, false)
end
function on_show_dongfang(form, prop_name, prop_type, prop_value)
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return
  end
  local room_id = client_player:QueryProp("DongFangNum")
  if nx_int(room_id) > nx_int(0) then
    nx_execute("form_stage_main\\form_marry\\form_marry_btns", "show_data", 3, true)
  else
    nx_execute("form_stage_main\\form_marry\\form_marry_btns", "show_data", 3, false)
  end
end
function on_btn_market_click()
  nx_execute("form_stage_main\\form_market\\form_market", "auto_show_hide_form_market")
end
function on_btn_gmhelp_click()
  nx_execute("form_stage_main\\form_gmcc\\form_gmsd_main", "open_gm_form", 3)
end
function on_btn_guild_click(btn)
  local is_in_guild = nx_execute("form_stage_main\\form_relation\\form_relation_guild\\form_guild", "is_in_guild")
  if not is_in_guild then
    local SystemCenterInfo = nx_value("SystemCenterInfo")
    if nx_is_valid(SystemCenterInfo) then
      SystemCenterInfo:ShowSystemCenterInfo(util_text("19025"), 2)
    end
    return
  end
  nx_execute("form_stage_main\\form_relation\\form_relation_guild\\form_guild", "auto_show_hide_form_guild")
end
function on_btn_show_declare_click(btn)
  local form = btn.ParentForm
  form.groupbox_declare.Visible = false
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "declare_timer", form)
  end
  if nx_custom(btn, "time") and nx_int(btn.time) > nx_int(0) then
    local form_guild_domain_map = nx_value("form_stage_main\\form_guild_domain\\form_guild_domain_map")
    if nx_is_valid(form_guild_domain_map) then
      form_guild_domain_map.Visible = true
    end
  end
end
function declare_timer(form)
  if nx_int(form.btn_show_declare.time) > nx_int(0) then
    form.btn_show_declare.time = form.btn_show_declare.time - 1
    form.lbl_declare_timer.Text = nx_widestr(form.btn_show_declare.time)
  else
    local timer = nx_value(GAME_TIMER)
    if nx_is_valid(timer) then
      timer:UnRegister(nx_current(), "declare_timer", form)
    end
    form.groupbox_declare.Visible = false
    local form_guild_domain_map = nx_value("form_stage_main\\form_guild_domain\\form_guild_domain_map")
    if nx_is_valid(form_guild_domain_map) and not form_guild_domain_map.Visible then
      form_guild_domain_map:Close()
    end
  end
end
function show_declare_btn(time)
  local form = nx_value("form_stage_main\\form_main\\form_main")
  local timer = nx_value(GAME_TIMER)
  if not nx_is_valid(form) or not nx_is_valid(timer) then
    return
  end
  if time <= 0 then
    timer:UnRegister(nx_current(), "declare_timer", form)
    form.groupbox_declare.Visible = false
    return
  end
  form.btn_show_declare.time = time
  form.lbl_declare_timer.Text = nx_widestr(time)
  form.groupbox_declare.Left = -300
  form.groupbox_declare.Top = 100
  timer:Register(1000, -1, nx_current(), "declare_timer", form, -1, -1)
  form.groupbox_declare.Visible = true
end
function set_gm_btn_image(form)
  local gui = nx_value("gui")
  local ver_type = nx_call("form_stage_main\\form_gmcc\\form_gmsd_main", "get_version_type")
  if ver_type == "0" then
    form.btn_gmhelp.NormalImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.FocusImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.PushImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.HintText = gui.TextManager:GetText("ui_tips_kefu")
  elseif ver_type == "1" then
    form.btn_gmhelp.NormalImage = "gui\\special\\help_gm\\btn_gmcc_sd.png"
    form.btn_gmhelp.FocusImage = "gui\\special\\help_gm\\btn_gmcc_sd.png"
    form.btn_gmhelp.PushImage = "gui\\special\\help_gm\\btn_gmcc_sd.png"
    form.btn_gmhelp.HintText = gui.TextManager:GetText("ui_tips_caihong")
  elseif ver_type == "2" then
    form.btn_gmhelp.NormalImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.FocusImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.PushImage = "gui\\special\\help_gm\\btn_gmcc.png"
    form.btn_gmhelp.HintText = gui.TextManager:GetText("ui_tips_kefu")
  end
end
function on_btn_server_click(btn)
  util_auto_show_hide_form("form_stage_main\\form_publish_pop_news")
end
function open_btn_freshman(mark_name)
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  if not nx_find_custom(form, "btn_freshman") then
    return
  end
  if not nx_is_valid(form.btn_freshman) then
    return
  end
  if not nx_find_custom(form.btn_freshman, "mark_name") then
    return
  end
  form.btn_freshman.mark_name = mark_name
  form.btn_freshman.Visible = true
end
function on_btn_freshman_click(self)
  nx_execute("form_stage_main\\form_main\\form_main_map", "open_form_freshman")
  self.Visible = false
end
function on_btn_chargeshop_click(btn)
  nx_execute("form_stage_main\\form_charge_shop\\form_charge_shop", "open_shop", -1)
end
function on_btn_battlefield_click(btn)
end
function on_btn_open_yy_click(self)
  local form = self.ParentForm
  local game_config = nx_value("game_config")
  local gui = nx_value("gui")
  if not nx_is_valid(game_config) then
    return 1
  end
  form.web_view_yy.Visible = not form.web_view_yy.Visible
  if form.web_view_yy.Visible then
    local server_id = game_config.server_id
    local yy_url = gui.TextManager:GetFormatText("http://9yin.woniu.com/static/act/yy/?area={@0:ID}&server={@0:ID}#", nx_int(server_id), nx_int(server_id))
    form.web_view_yy.Url = yy_url
    form.web_view_yy:Refresh()
    form.web_view_yy:Enable()
  end
end
function web_close_form()
  local form = nx_value(nx_current())
  if nx_is_valid(form) then
    form.web_view_yy.Visible = false
  else
    nx_execute("form_common\\form_queue", "web_close_form")
  end
end
function change_switch(msg_type, is_open)
end
function bind_rec_npc_relation(form)
  local databinder = nx_value("data_binder")
  if nx_is_valid(databinder) then
    databinder:AddTableBind("rec_npc_relation", form, nx_current(), "on_npc_relation_change")
    databinder:AddTableBind("rec_npc_relation_delay", form, nx_current(), "on_npc_relation_change")
  end
end
function on_npc_relation_change(self, recordname, optype, row, clomn)
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  if not nx_is_valid(form.lbl_sns_news) then
    return
  end
  local karmamgr = nx_value("Karma")
  if not nx_is_valid(karmamgr) then
    return
  end
  local npc_list = karmamgr:GetPrizeNpcList()
  local npc_num = table.getn(npc_list)
  if npc_num ~= 0 and refresh_condition_func(26001) then
    form.lbl_sns_news.Visible = true
    form.lbl_sns_news.Text = nx_widestr(npc_num)
  else
    form.lbl_sns_news.Visible = false
  end
end
function show_btn_mutual(vis)
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  if vis then
    form.btn_mutual_end.NormalImage = "jiaohu_close"
    form.btn_mutual_end.FocusImage = "jiaohu_close"
    form.btn_mutual_end.PushImage = "jiaohu_close"
  end
  form.btn_mutual_end.Visible = vis
end
function on_btn_mutual_end_click(btn)
  local gui = nx_value("gui")
  if not nx_is_valid(gui) then
    return true
  end
  local guild_dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", true, false)
  local show_Info = gui.TextManager:GetText("ui_over_mutual")
  nx_execute("form_common\\form_confirm", "show_common_text", guild_dialog, show_Info)
  guild_dialog:ShowModal()
  guild_dialog.Left = (gui.Width - guild_dialog.Width) / 2
  guild_dialog.Top = (gui.Height - guild_dialog.Height) / 2
  local res = nx_wait_event(100000000, guild_dialog, "confirm_return")
  if res == "ok" then
    nx_execute("custom_sender", "custom_over_mutual_action")
  end
end
function on_btn_need_repair_click()
  local form_role_info = nx_value("form_stage_main\\form_role_info\\form_role_info")
  local form_bag = nx_value("form_stage_main\\form_bag")
  if nx_is_valid(form_role_info) and nx_is_valid(form_bag) then
    local vis_form_role = form_role_info.Visible
    local vis_form_bag = form_bag.Visible
    if vis_form_role == false and vis_form_bag == true then
      nx_execute("form_stage_main\\form_role_info\\form_role_info", "auto_show_hide_role_info")
    end
    if vis_form_role == true and vis_form_bag == false then
      nx_execute("form_stage_main\\form_bag", "auto_show_hide_bag")
    end
    if vis_form_role == true and vis_form_bag == true then
      nx_execute("form_stage_main\\form_role_info\\form_role_info", "auto_show_hide_role_info")
      nx_execute("form_stage_main\\form_bag", "auto_show_hide_bag")
    end
    if vis_form_role == false and vis_form_bag == false then
      nx_execute("form_stage_main\\form_role_info\\form_role_info", "auto_show_hide_role_info")
      nx_execute("form_stage_main\\form_bag", "auto_show_hide_bag")
    end
  end
end
function refresh_battlefield_btn_show(form, on_complete)
end
function on_btn_act_0_click(btn)
  local switch_manager = nx_value("SwitchManager")
  if not nx_is_valid(switch_manager) then
    return
  end
  if switch_manager:CheckSwitchEnable(ST_FUNCTION_LOTTERY) then
    nx_execute("form_stage_main\\form_dbomall\\form_dbomall", "open_form", "form_stage_main\\form_lottery\\form_lottery_main")
  end
end
function on_btn_act_1_click(btn)
  local form = nx_value("form_stage_main\\form_act_grouppurchase")
  if nx_is_valid(form) and form.Visible == true then
    form:Close()
    return
  end
  local game_visual = nx_value("game_visual")
  if not nx_is_valid(game_visual) then
    return
  end
  game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_GROUP_PURCHASE), 0)
end
function on_btn_act_2_click(btn)
  nx_execute("form_stage_main\\form_activity\\form_activity_signin", "open_form")
end
function on_btn_act_3_click(btn)
  nx_execute("custom_sender", "custom_get_power_num")
end
function on_btn_act_4_click(btn)
  if happy_baccy_show_hide() then
    util_auto_show_hide_form("form_stage_main\\form_main\\form_main_happy_baccy_help")
  end
end
function on_btn_act_5_click(btn)
  nx_execute("custom_sender", "custom_get_novice_num")
end
function on_btn_oldserver_click(btn)
  nx_execute("custom_sender", "custom_get_old_num")
end
function on_btn_act_6_click(btn)
  local switch_manager = nx_value("SwitchManager")
  if not nx_is_valid(switch_manager) then
    return
  end
  if switch_manager:CheckSwitchEnable(ST_SNDA_ACTIVITY_SERVER_WISH) then
    nx_execute("form_stage_main\\form_dbomall\\form_dbomall", "open_form", "form_stage_main\\form_activity\\form_activity_seven")
  end
end
function on_btn_act_7_click(btn)
  local switch_manager = nx_value("SwitchManager")
  if not nx_is_valid(switch_manager) then
    return
  end
  if switch_manager:CheckSwitchEnable(ST_SNDA_ACTIVITY_SEEK_MINE) then
    nx_execute("form_stage_main\\form_dbomall\\form_dbomall", "open_form", "form_stage_main\\form_task\\form_seek_mine")
  end
end
function on_btn_act_8_click(btn)
  nx_execute("form_stage_main\\form_activity\\form_activity_login", "open_form")
end
function on_btn_act_9_click(btn)
  nx_execute("form_common\\form_bind_yy", "open_form")
end
function on_btn_act_10_click(btn)
  util_show_form("form_stage_main\\form_enthrall\\form_yytaskcode", true)
end
function on_btn_act_11_click(btn)
  nx_execute("form_stage_main\\form_activity\\form_activity_login_safe", "open_form")
end
function on_btn_act_12_click(btn)
  nx_execute("form_stage_main\\form_activity\\form_activity_answer_join", "open_form")
end
function save_active_location()
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return false
  end
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  if not nx_is_valid(ini) then
    return
  end
  ini.FileName = account .. "\\form_main.ini"
  ini:LoadFromFile()
  local groupbox_show_update = form.groupbox_show_update
  ini:WriteInteger("show_update", "Left", nx_int(groupbox_show_update.Left))
  ini:WriteInteger("show_update", "Top", nx_int(groupbox_show_update.Top))
  local groupbox_dbomall = form.groupbox_dbomall
  ini:WriteInteger("dbomall", "Left", nx_int(groupbox_dbomall.Left))
  ini:WriteInteger("dbomall", "Top", nx_int(groupbox_dbomall.Top))
  ini:SaveToFile()
  nx_destroy(ini)
end
function save_int_prop_value(section, prop, value)
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return
  end
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  if not nx_is_valid(ini) then
    return
  end
  ini.FileName = account .. "\\form_main.ini"
  ini:LoadFromFile()
  ini:WriteInteger(nx_string(section), nx_string(prop), nx_int(value))
  ini:SaveToFile()
  nx_destroy(ini)
end
function get_int_prop_value(section, prop)
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return
  end
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  local rst = 0
  if nx_is_valid(ini) then
    ini.FileName = account .. "\\form_main.ini"
    if ini:LoadFromFile() then
      rst = ini:ReadInteger(nx_string(section), nx_string(prop), 0)
    end
  end
  nx_destroy(ini)
  return rst
end
function load_active_location()
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  local gui = nx_value("gui")
  local left = 379
  top = 23
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    nx_destroy(ini)
    return left, top
  end
  if nx_is_valid(ini) then
    ini.FileName = account .. "\\form_main.ini"
    if ini:LoadFromFile() then
      left = ini:ReadInteger("active", "Left", left)
      top = ini:ReadInteger("active", "Top", top)
    end
  end
  nx_destroy(ini)
  return left, top
end
function load_update_location()
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  local gui = nx_value("gui")
  local left = 437
  top = 23
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    nx_destroy(ini)
    return left, top
  end
  if nx_is_valid(ini) then
    ini.FileName = account .. "\\form_main.ini"
    if ini:LoadFromFile() then
      left = ini:ReadInteger("update", "Left", left)
      top = ini:ReadInteger("update", "Top", top)
    end
  end
  nx_destroy(ini)
  return left, top
end
function load_show_update_location()
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  local gui = nx_value("gui")
  local left = 400
  local top = 3
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    nx_destroy(ini)
    return left, top
  end
  if nx_is_valid(ini) then
    ini.FileName = account .. "\\form_main.ini"
    if ini:LoadFromFile() then
      left = ini:ReadInteger("show_update", "Left", left)
      top = ini:ReadInteger("show_update", "Top", top)
    end
  end
  nx_destroy(ini)
  return left, top
end
function on_btn_update_drag_move(btn, x, y)
  local new_x = btn.Left + x
  local new_y = btn.Top + y
  local gui = nx_value("gui")
  if new_x < 0 or new_x > gui.Width or new_y < 0 or new_y > gui.Height then
  end
  btn.Top = new_y
  btn.Left = new_x
end
function on_btn_update_click(btn)
  util_auto_show_hide_form("form_stage_main\\form_main\\form_main_update")
end
function on_btn_weaponandorigin_click(btn)
  local form = nx_value("form_stage_main\\form_advanced_weapon_and_origin")
  if not nx_is_valid(form) or not form.Visible then
    nx_execute("util_gui", "util_auto_show_hide_form", "form_stage_main\\form_advanced_weapon_and_origin")
  end
end
function on_btn_act_4_click(btn)
  if happy_baccy_show_hide() then
    util_auto_show_hide_form("form_stage_main\\form_main\\form_main_happy_baccy_help")
  end
end
function happy_baccy_show_hide()
  local mgr = nx_value("SwitchManager")
  if not nx_is_valid(mgr) then
    return false
  end
  return mgr:CheckSwitchEnable(ST_SNDA_HAPPY_BACCY)
end
function refesh_happy_miaohui()
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if nx_is_valid(form) and nx_is_valid(form.groupbox_6) then
    form.groupbox_6.Visible = happy_baccy_show_hide()
  end
end
function on_btn_smahing_egg_click(btn)
  local switch_manager = nx_value("SwitchManager")
  if not nx_is_valid(switch_manager) then
    return
  end
  if switch_manager:CheckSwitchEnable(ST_SNDA_GEM_EGG_GAME) then
    nx_execute("form_stage_main\\form_dbomall\\form_dbomall", "open_form", "form_stage_main\\puzzle_quest\\form_select_egg")
  end
end
function form_refresh(form)
  local form_main_logic = nx_value("form_main_logic")
  if not nx_is_valid(form_main_logic) then
    return
  end
  if form_main_logic:fit_all_condition() then
    form_refresh_cancel(form)
  end
  form_main_logic:refresh_control()
end
function form_refresh_cancel(form)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "form_refresh", form)
  end
end
function refresh_condition_func(nid)
  local condition_manager = nx_value("ConditionManager")
  if not nx_is_valid(condition_manager) then
    return false
  end
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  return condition_manager:CanSatisfyCondition(client_player, client_player, nx_int(nid))
end
function on_func_btns_init(form)
  if not nx_is_valid(form) then
    return
  end
  form.lbl_animation_0.Visible = false
  form.lbl_text_0.Visible = false
  form.lbl_animation_1.Visible = false
  form.lbl_text_1.Visible = false
  form.lbl_animation_2.Visible = false
  form.lbl_text_2.Visible = false
  local funcbtns = nx_value("form_main_func_btns")
  if nx_is_valid(funcbtns) then
    return
  end
  funcbtns = nx_create("form_main_func_btns")
  if not nx_is_valid(funcbtns) then
    return false
  end
  nx_set_value("form_main_func_btns", funcbtns)
  local ini = nx_resource_path() .. "ini\\func_btns.ini"
  funcbtns:LoadDefaultBtnInfo(ini)
  ini = nx_resource_path() .. "ini\\func_btns_ex.ini"
  funcbtns:LoadAddFuncBtnInfo(ini)
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local file = account .. "\\func_" .. nx_string(game_config.server_name) .. ".ini"
  funcbtns:LoadCustomBtnInfo(file)
  return true
end
function on_show_func_btns_list(btn, index)
  if not nx_is_valid(btn) then
    return
  end
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  if index < 0 or index > 2 then
    return
  end
  on_del_hide_func_timer(form_main)
  on_hide_funcbtns_list(form_main)
  form_main.clicked_index = index
  form_main.clicked_btn = btn
  util_show_form("form_stage_main\\form_main\\form_main_func_btns_ex", true)
end
function on_rbtn_fight_checked_changed(rbtn)
  if rbtn.Checked ~= true then
    return
  end
  local gui = nx_value("gui")
  local form = rbtn.ParentForm
  local form_logic = nx_value("form_main_logic")
  if nx_is_valid(form_logic) then
    form_logic:SwitchToFight()
  end
  fix_btn_life_by_job_rec(form)
  fix_btn_fight(form)
  on_del_hide_func_timer(form)
  on_hide_funcbtns_list(form)
end
function on_rbtn_fight_lost_capture(rbtn)
  on_hide_func_timer(rbtn)
end
function on_rbtn_fight_get_capture(rbtn)
  on_hide_text_tip(rbtn.ParentForm, 0)
  on_show_func_btns_list(rbtn, 0)
end
function on_rbtn_jianghu_checked_changed(rbtn)
  if rbtn.Checked ~= true then
    return
  end
  local bIsNewJHModule = is_newjhmodule()
  if bIsNewJHModule then
    return
  end
  local helper_form = nx_value("helper_form")
  if helper_form then
    return
  end
  local form_main = rbtn.ParentForm
  on_del_hide_func_timer(form_main)
  on_hide_funcbtns_list(form_main)
  local form = nx_value("form_stage_main\\form_relationship")
  if not nx_is_valid(form) or not form.Visible then
    local form_logic = nx_value("form_main_logic")
    if nx_is_valid(form_logic) then
      form_logic:SwitchToSns()
    end
    nx_execute("util_gui", "util_auto_show_hide_form", "form_stage_main\\form_relationship")
  end
  nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
end
function on_rbtn_jianghu_lost_capture(rbtn)
  local helper_form = nx_value("helper_form")
  if helper_form then
    return
  end
  on_hide_func_timer(rbtn)
end
function on_rbtn_jianghu_get_capture(rbtn)
  on_hide_text_tip(rbtn.ParentForm, 2)
  on_show_func_btns_list(rbtn, 2)
  local helper_form = nx_value("helper_form")
  if helper_form then
    nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
  end
end
function on_rbtn_life_checked_changed(rbtn)
  if rbtn.Checked ~= true then
    return
  end
  local bIsNewJHModule = is_newjhmodule()
  if bIsNewJHModule then
    return
  end
  local gui = nx_value("gui")
  local form = rbtn.ParentForm
  local form_logic = nx_value("form_main_logic")
  if nx_is_valid(form_logic) then
    form_logic:SwitchToLife()
  end
  fix_btn_life_by_job_rec(form)
  fix_btn_fight(form)
  on_del_hide_func_timer(form)
  on_hide_funcbtns_list(form)
end
function on_rbtn_life_lost_capture(rbtn)
  on_hide_func_timer(rbtn)
end
function on_rbtn_life_get_capture(rbtn)
  on_hide_text_tip(rbtn.ParentForm, 1)
  on_show_func_btns_list(rbtn, 1)
  local helper_form = nx_value("helper_form")
  if helper_form then
    nx_execute("form_stage_main\\form_helper\\form_main_helper_manager", "next_helper_form")
  end
end
function on_hide_func_timer(rbtn)
  local form = rbtn.ParentForm
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:Register(1000, 1, nx_current(), "on_hide_funcbtns_list", form, -1, -1)
  end
end
function on_del_hide_func_timer(form)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "on_hide_funcbtns_list", form)
  end
end
function on_hide_funcbtns_list(form_main)
  local form_btn_ex = nx_value("form_stage_main\\form_main\\form_main_func_btns_ex")
  if nx_is_valid(form_btn_ex) then
    form_btn_ex.Visible = false
    form_btn_ex:Close()
  end
end
function on_btn_lead_info(index)
  if index < 0 or index > 2 then
    return
  end
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  local groupbox = form_main.groupbox_4
  local rbtn = nx_null()
  if index == 0 then
    rbtn = form_main.rbtn_fight
  elseif index == 1 then
    rbtn = form_main.rbtn_life
  elseif index == 2 then
    rbtn = form_main.rbtn_jianghu
  end
  if not nx_is_valid(rbtn) or not nx_is_valid(groupbox) then
    return
  end
  if rbtn.Visible == false then
    return
  end
  local lbl_ani = groupbox:Find("lbl_animation_" .. nx_string(index))
  local lbl_text = groupbox:Find("lbl_text_" .. nx_string(index))
  if not nx_is_valid(lbl_ani) or not nx_is_valid(lbl_text) then
    return
  end
  if lbl_ani.Visible == true or lbl_text.Visible == true then
    return
  end
  lbl_ani.Top = rbtn.Top - 5
  lbl_ani.Visible = true
  lbl_text.Top = lbl_ani.Top - lbl_text.Height + 4
  lbl_text.Visible = true
end
function on_hide_text_tip(form, index)
  if not nx_is_valid(form) then
    return
  end
  if index < 0 or index > 2 then
    return
  end
  local groupbox = form.groupbox_4
  if not nx_is_valid(groupbox) then
    return
  end
  local lbl_text = groupbox:Find("lbl_text_" .. nx_string(index))
  if nx_is_valid(lbl_text) then
    lbl_text.Visible = false
  end
end
function on_btn_ad_click(btn)
  util_auto_show_hide_form("form_stage_main\\form_main\\form_main_ad")
end
function on_groupbox_ad_get_capture(groupbox)
  groupbox.BackImage = "gui\\common\\form_line\\mibox_1.png"
end
function on_groupbox_ad_lost_capture(groupbox)
  groupbox.BackImage = ""
end
function update_newjh_groupbox(form)
  if not nx_is_valid(form) then
    return
  end
  if not nx_is_valid(form.groupbox_4) then
    return
  end
  local bIsNewJHModule = is_newjhmodule()
  if bIsNewJHModule then
    form.groupbox_4.Visible = false
    form.btn_ad.Visible = false
    form.groupbox_ad.Visible = false
    form.btn_open_yy.Visible = false
    form.mltbox_battle.Visible = false
    form.groupbox_jhtsmini.Visible = true
    form.btn_func_guide.Visible = false
    form.groupbox_show_update.Visible = true
    form.groupbox_dbomall.Visible = true
    show_hide_filter_form(form_table_from_old_to_new.hide, false)
    show_hide_filter_form(form_table_from_old_to_new.show, true)
    close_filter_form(form_table_from_old_to_new.close, false)
  else
    form.groupbox_4.Visible = true
    form.btn_ad.Visible = true
    form.groupbox_ad.Visible = true
    form.btn_open_yy.Visible = true
    form.mltbox_battle.Visible = true
    form.groupbox_jhtsmini.Visible = false
    form.btn_func_guide.Visible = true
    form.groupbox_show_update.Visible = true
    form.groupbox_dbomall.Visible = true
    show_hide_filter_form(form_table_from_new_to_old.show, true)
  end
  return
end
function on_btn_func_guide_click(self)
  util_auto_show_hide_form("form_stage_main\\form_func_guide")
end
function show_jh_tour_info()
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    return
  end
  if not nx_is_valid(form.pbar_1) then
    return
  end
  if not nx_is_valid(form.pbar_2) then
    return
  end
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return
  end
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return
  end
  local gui = nx_value("gui")
  local cur_scene_id = get_scene_id()
  local jhmgr = nx_value("JianghuExploreModule")
  if not nx_is_valid(jhmgr) then
    return
  end
  local tab_scene_info = jhmgr:GetTourRenownConfig(cur_scene_id)
  local tour_config = tab_scene_info[1]
  local renown_config = tab_scene_info[2]
  local row = 0
  local tour_point = 0
  local tour_level = 0
  if client_player:FindRecord("JHTour_Record") then
    row = client_player:FindRecordRow("JHTour_Record", 0, nx_string(tour_config))
    if row >= 0 then
      tour_point = client_player:QueryRecord("JHTour_Record", row, 1)
      tour_level = client_player:QueryRecord("JHTour_Record", row, 2)
    end
  end
  if nx_int(tour_level) == nx_int(0) then
    tour_level = 1
  end
  local tab_tour_need_point = jhmgr:GetJhTourMaxPoint(nx_int(tour_level + 1))
  form.pbar_1.Maximum = nx_int(tab_tour_need_point[1])
  form.pbar_1.Value = nx_int(tour_point)
  form.pbar_1.Visible = true
  form.pbar_1.HintText = nx_widestr(gui.TextManager:GetFormatText("ui_jh_jhts_72", nx_widestr(util_text("ui_youli_" .. nx_string(nx_int(tour_level)))), nx_widestr(tour_point)))
  local renown_point = 0
  local renown_level = 0
  if client_player:FindRecord("JHRenown_Record") then
    row = client_player:FindRecordRow("JHRenown_Record", 0, nx_string(renown_config))
    if row >= 0 then
      renown_point = client_player:QueryRecord("JHRenown_Record", row, 1)
      renown_level = client_player:QueryRecord("JHRenown_Record", row, 2)
    end
  end
  if nx_int(renown_level) == nx_int(0) then
    renown_level = 1
  end
  local renown_need_point = jhmgr:GetJhRenownMaxPoint(nx_int(renown_level + 1))
  form.pbar_2.Maximum = nx_int(renown_need_point[1])
  form.pbar_2.Value = nx_int(renown_point)
  form.pbar_2.HintText = nx_widestr(gui.TextManager:GetFormatText("ui_jh_jhts_73", nx_widestr(util_text("ui_" .. nx_string(renown_config) .. "_" .. nx_string(renown_level))), nx_widestr(renown_point)))
end
function bind_record_call_back(form)
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return 0
  end
  local databinder = nx_value("data_binder")
  if nx_is_valid(databinder) then
    databinder:AddTableBind("JHTour_Record", form, "form_stage_main\\form_main\\form_main", "on_jhtour_record_change")
    databinder:AddTableBind("JHRenown_Record", form, "form_stage_main\\form_main\\form_main", "on_jhrenown_record_change")
  end
end
function on_jhtour_record_change(self, recordname, optype, row, clomn)
  if not is_jh_scene() then
    return
  end
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return 0
  end
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_main", true, false)
  if not nx_is_valid(form) then
    return 0
  end
  if not client_player:FindRecord("JHTour_Record") then
    return 0
  end
  if optype == "add" or optype == "update" or optype == "del" or optype == "clear" then
    show_jh_tour_info()
  end
end
function on_jhrenown_record_change(self, recordname, optype, row, clomn)
  if not is_jh_scene() then
    return
  end
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return 0
  end
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_main", true, false)
  if not nx_is_valid(form) then
    return 0
  end
  if not client_player:FindRecord("JHRenown_Record") then
    return 0
  end
  if optype == "add" or optype == "update" or optype == "del" or optype == "clear" then
    show_jh_tour_info()
  end
end
function is_jh_scene()
  local game_client = nx_value("game_client")
  local player = game_client:GetPlayer()
  if not player:FindProp("CurJHSceneConfigID") then
    return false
  end
  local jh_scene = player:QueryProp("CurJHSceneConfigID")
  if jh_scene == nil or jh_scene == "" then
    return false
  end
  return true
end
function on_btn_news_click(btn)
  btn.Visible = false
  nx_execute("util_gui", "util_show_form", "form_stage_main\\form_tvt\\form_tvt_news", true)
end
function on_btn_changfeng_ying_click(btn)
  nx_execute("form_stage_main\\form_force\\form_force_longmen_ying_response", "show_or_hide")
end
function on_btn_changfeng_jiu_click(btn)
  nx_execute("form_stage_main\\form_force\\form_force_longmen_jiu_response", "show_or_hide")
end
function on_btn_changfeng_dajian_click(btn)
  nx_execute("form_stage_main\\form_force\\form_force_longmen_dajian", "show_or_hide")
end
function show_changfeng_ying_btn(vis)
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_main", false)
  if not nx_is_valid(form) then
    return
  end
  form.groupbox_changfeng_ying.Visible = vis
end
function show_changfeng_jiu_btn(vis)
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_main", false)
  if not nx_is_valid(form) then
    return
  end
  form.groupbox_changfeng_jiu.Visible = vis
end
function show_changfeng_dajian_btn(vis)
  local form = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_main\\form_main", false)
  if not nx_is_valid(form) then
    return
  end
  form.groupbox_changfeng_dajian.Visible = vis
end
function on_btn_weixin_click(btn)
  util_auto_show_hide_form("form_common\\form_gzwx")
end
function load_dbomall_location()
  local gui = nx_value("gui")
  local game_config = nx_value("game_config")
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  local left = 482
  local top = 23
  local form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form) then
    nx_destroy(ini)
    return left, top
  end
  if nx_is_valid(ini) then
    ini.FileName = account .. "\\form_main.ini"
    if ini:LoadFromFile() then
      left = ini:ReadInteger("dbomall", "Left", left)
      top = ini:ReadInteger("dbomall", "Top", top)
    end
  end
  nx_destroy(ini)
  return left, top
end
function on_groupbox_dbomall_get_capture(groupbox)
  groupbox.BackImage = "gui\\common\\form_line\\mibox_1.png"
end
function on_groupbox_dbomall_lost_capture(groupbox)
  groupbox.BackImage = ""
end
function on_btn_dbomall_click(groupbox)
  local form_dbomall = nx_value("form_stage_main\\form_dbomall\\form_dbomall")
  if nx_is_valid(form_dbomall) then
    form_dbomall:Close()
  else
    local dbomall_manager = nx_value("dbomall_manager")
    if nx_is_valid(dbomall_manager) and dbomall_manager:IsAllConditionClosed() then
      nx_execute("custom_handler", "custom_sysinfo", 0, 0, 0, 2, nx_string("96088"))
      return
    end
    util_show_form("form_stage_main\\form_dbomall\\form_dbomall", true)
  end
end
function on_btn_donghai_activity_click(self)
  util_auto_show_hide_form("form_stage_main\\form_activity\\form_activity_donghai")
end
function is_show_donghai_activity_btn()
  local scene_xaikedao = "scene17"
  local scene_penglaidao = "scene16"
  local scene_wujidao = "scene19"
  local main_form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(main_form) then
    return
  end
  local grp = main_form.groupbox_donghai_activity
  if not nx_is_valid(grp) then
    return
  end
  grp.Visible = false
  grp.Fixed = true
  local game_client = nx_value("game_client")
  if not nx_is_valid(game_client) then
    return
  end
  local client_scene = game_client:GetScene()
  if not nx_is_valid(client_scene) then
    return
  end
  local resource = client_scene:QueryProp("Resource")
  local scene = nx_string(resource)
  if scene == nx_string(scene_xaikedao) or scene == nx_string(scene_penglaidao) or scene == nx_string(scene_wujidao) then
    grp.Visible = true
    grp.Fixed = false
  else
    grp.Visible = false
    grp.Fixed = true
  end
end
function on_btn_new_version_click(btn)
  util_auto_show_hide_form("form_stage_main\\form_main\\form_main_show_update")
  new_version_btn_clicked()
  local main_form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(main_form) then
    return
  end
  local grp = main_form.groupbox_new_version
  if nx_is_valid(grp) then
    grp.Visible = false
    grp.Fixed = true
  end
end
function is_show_new_version_btn()
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return
  end
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  if not nx_is_valid(ini) then
    nx_destroy(ini)
    return
  end
  local main_form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(main_form) then
    return
  end
  local grp = main_form.groupbox_new_version
  if not nx_is_valid(grp) then
    return
  end
  ini.FileName = account .. "\\form_main.ini"
  if not ini:LoadFromFile() then
    grp.Visible = true
    grp.Fixed = false
    nx_destroy(ini)
    return
  end
  local res = nx_boolean(ini:ReadString("login", "first_time_login", "false"))
  if res == false then
    grp.Visible = true
    grp.Fixed = false
  else
    grp.Visible = false
    grp.Fixed = true
  end
  nx_destroy(ini)
end
function new_version_btn_clicked()
  local game_config = nx_value("game_config")
  if not nx_is_valid(game_config) then
    return
  end
  local account = game_config.login_account
  local ini = nx_create("IniDocument")
  if not nx_is_valid(ini) then
    nx_destroy(ini)
    return
  end
  ini.FileName = account .. "\\form_main.ini"
  if not ini:LoadFromFile() then
    nx_destroy(ini)
    return
  end
  ini:WriteString("login", "first_time_login", "true")
  ini:SaveToFile()
  nx_destroy(ini)
end
function on_groupbox_show_update_get_capture(groupbox)
  groupbox.BackImage = "gui\\common\\form_line\\mibox_1.png"
end
function on_groupbox_show_update_lost_capture(groupbox)
  groupbox.BackImage = ""
end
function on_btn_show_update_click(btn)
  util_auto_show_hide_form("form_stage_main\\form_main\\form_main_show_update")
  local main_form = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(main_form) then
    return
  end
  local grp = main_form.groupbox_show_update
  if not nx_is_valid(grp) then
    return
  end
  grp.Fixed = false
end
function on_del_hide_tools_func_timer(form)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "on_hide_funcbtns_tools", form)
  end
end
function on_rbtn_tools_lost_capture(rbtn)
  local form = rbtn.ParentForm
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:Register(400, 1, nx_current(), "on_hide_funcbtns_tools", form, -1, -1)
  end
end
function on_rbtn_tools_get_capture(rbtn)
  on_hide_text_tip(rbtn.ParentForm, 0)
  on_hide_text_tip(rbtn.ParentForm, 1)
  on_hide_text_tip(rbtn.ParentForm, 2)
  on_show_func_btns_tools(rbtn)
end
function on_hide_funcbtns_tools(form_main)
  local form_btn_tools = nx_value("auto_tools\\form_func_btns_tools")
  if nx_is_valid(form_btn_tools) then
    form_btn_tools.Visible = false
    form_btn_tools:Close()
  end
end
function on_show_func_btns_tools(btn)
  local form = btn.ParentForm
  if not nx_is_valid(btn) then
    return
  end
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  on_del_hide_func_timer(form_main)
  on_hide_funcbtns_list(form_main)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "on_hide_funcbtns_tools", form)
  end
  on_hide_funcbtns_tools(form_main)
  form_main.clicked_btn = btn
  util_show_form("auto_tools\\form_func_btns_tools", true)
end