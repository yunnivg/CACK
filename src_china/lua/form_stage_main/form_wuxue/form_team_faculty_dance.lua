require("util_gui")
require("util_functions")
local SUB_CLIENT_PLAY_SUCCESS = 20
local SUB_CLIENT_PLAY_FAILED = 21
local gb_back_image = "gui\\special\\xiulian\\team_scroll.png"
local gb_back_image_0 = "gui\\special\\xiulian\\team_scroll_y.png"
local gb_back_image_1 = "gui\\special\\xiulian\\team_scroll_r.png"
function main_form_init(self)
  self.key_str = ""
  self.time = 0
  self.cur_par = 0
  self.max_par = 0
  self.speed = 0
  self.view_left = 0
  self.back_image_type = -1
  self.skill_time = 0
end
function on_main_form_open(self)
  self.groupbox_key.Visible = true
  change_form_size()
  self.pbar_time.Maximum = 100
  self.pbar_time.Value = 0
  self.speed = nx_number(self.pbar_time.Maximum / (self.time / 0.03))
  local form_name = "form_stage_main\\form_wuxue\\form_team_faculty_dance"
  local common_execute = nx_value("common_execute")
  if nx_is_valid(common_execute) then
    common_execute:AddExecute("TeamDance", self, nx_float(0.03), form_name)
  end
  local form_chat = util_get_form("form_stage_main\\form_main\\form_main_chat", false)
  if nx_is_valid(form_chat) then
    nx_execute("form_stage_main\\form_main\\form_main_chat", "hide_chat_edit", form_chat)
  end
  nx_execute("custom_sender", "custom_team_faculty", SUB_CLIENT_PLAY_SUCCESS)
  nx_execute("custom_sender", "custom_send_transQte_result", SUB_CLIENT_PLAY_SUCCESS)
  nx_execute("custom_sender", "custom_send_jumpgame_result", SUB_CLIENT_PLAY_SUCCESS)
  nx_execute("custom_sender", "custom_send_skill_general_result", SUB_CLIENT_PLAY_SUCCESS)
end
function on_main_form_close(self)
  nx_destroy(self)
end
function on_main_form_shut(self)
  local form = self.ParentForm
  if not nx_is_valid(form) then
    return
  end
end
function change_form_size()
  local form = util_get_form("form_stage_main\\form_wuxue\\form_team_faculty_dance", false)
  if not nx_is_valid(form) then
    return
  end
  local gui = nx_value("gui")
  form.Left = (gui.Width - form.Width) / 2
  form.Top = gui.Height / 3 * 2
end
function on_refresh_picture(form)
  if not nx_is_valid(form) then
    return
  end
  form.imagegrid_key:Clear()
  local pic_num = string.len(form.key_str)
  form.imagegrid_key.ClomnNum = pic_num
  local view_left = (form.imagegrid_key.Width - form.imagegrid_key.GridWidth * pic_num) / 2
  local view_right = view_left + form.imagegrid_key.GridWidth * pic_num
  form.imagegrid_key.ViewRect = nx_string(view_left) .. ",8," .. nx_string(view_right) .. ",8"
  form.view_left = nx_int(view_left)
  for i = 1, pic_num do
    local key = string.char(string.byte(form.key_str, i, i))
    local photo = "gui\\special\\xiulian\\" .. nx_string(key) .. ".png"
    form.imagegrid_key:AddItem(i - 1, photo, 0, 1, -1)
    form.imagegrid_key:SetItemName(i - 1, nx_widestr(nx_string(key)))
    form.imagegrid_key:SetItemMark(i - 1, 0)
    form.imagegrid_key:ChangeItemImageToBW(i - 1, true)
  end
  if form.back_image_type == -1 then
    form.groupbox_key.BackImage = gb_back_image
    form.lbl_skill_back.BackImage = ""
  elseif form.back_image_type == 0 then
    form.groupbox_key.BackImage = ""
    form.lbl_skill_back.BackImage = gb_back_image_0
  else
    form.groupbox_key.BackImage = ""
    form.lbl_skill_back.BackImage = gb_back_image_1
  end
end
function key_chaos(handle_type, key)
  local game_client = nx_value("game_client")
  local client_player = game_client:GetPlayer()
  if not nx_is_valid(client_player) then
    return key
  end
  local chaos = client_player:QueryProp("Chaos")
  if nx_number(chaos) == 1 and handle_type == 3 then
    if key == "W" then
      key = "S"
    elseif key == "A" then
      key = "D"
    elseif key == "S" then
      key = "W"
    elseif key == "D" then
      key = "A"
    end
  end
  return key
end
function on_key_up(key_value, handle_type)
  local form = util_get_form("form_stage_main\\form_wuxue\\form_team_faculty_dance", false)
  if not nx_is_valid(form) then
    return
  end
  local key = ""
  if nx_int(key_value) == nx_int(87) or nx_int(key_value) == nx_int(38) then
    key = "W"
  elseif nx_int(key_value) == nx_int(65) or nx_int(key_value) == nx_int(37) then
    key = "A"
  elseif nx_int(key_value) == nx_int(83) or nx_int(key_value) == nx_int(40) then
    key = "S"
  elseif nx_int(key_value) == nx_int(68) or nx_int(key_value) == nx_int(39) then
    key = "D"
  elseif nx_int(key_value) == nx_int(74) then
    key = "J"
  elseif nx_int(key_value) == nx_int(75) then
    key = "K"
  elseif nx_int(key_value) == nx_int(76) then
    key = "L"
  end
  if key == "" then
    return
  end
  key = key_chaos(handle_type, key)
  local key_count = form.imagegrid_key.ClomnNum
  for index = 0, key_count - 1 do
    local dance_flag = form.imagegrid_key:GetItemMark(index)
    if nx_int(dance_flag) == nx_int(0) then
      if nx_ws_equal(nx_widestr(key), nx_widestr(form.imagegrid_key:GetItemName(index))) then
        form.imagegrid_key:SetItemMark(index, 1)
        form.imagegrid_key:ChangeItemImageToBW(index, false)
        do
          local gui = nx_value("gui")
          local animation = gui:Create("Animation")
          animation.AnimationImage = "train_team_flash"
          animation.Loop = false
          animation.Top = 0
          animation.Left = index * 40 + form.view_left + 28
          nx_bind_script(animation, nx_current())
          nx_callback(animation, "on_animation_end", "animation_key_end")
          form:Add(animation)
          animation:Play()
          if nx_int(index) == nx_int(key_count - 1) then
            if handle_type == 0 then
              nx_execute("custom_sender", "custom_team_faculty", SUB_CLIENT_PLAY_SUCCESS)
            elseif handle_type == 1 then
              nx_execute("custom_sender", "custom_send_transQte_result", SUB_CLIENT_PLAY_SUCCESS)
            elseif handle_type == 2 then
              nx_execute("custom_sender", "custom_send_jumpgame_result", SUB_CLIENT_PLAY_SUCCESS)
            elseif handle_type == 3 then
              nx_execute("custom_sender", "custom_send_skill_general_result", SUB_CLIENT_PLAY_SUCCESS)
            end
            util_show_form("form_stage_main\\form_wuxue\\form_team_faculty_dance", false)
          end
        end
        break
      end
      for i = 0, key_count - 1 do
        form.imagegrid_key:SetItemMark(i, 0)
        form.imagegrid_key:ChangeItemImageToBW(i, true)
      end
      if handle_type == 3 then
        local apply_time_val = nx_number(os.time()) - form.skill_time
        if apply_time_val >= 1 then
          form.skill_time = nx_number(os.time())
          nx_execute("custom_sender", "custom_send_skill_general_result", SUB_CLIENT_PLAY_FAILED)
        end
      end
      break
    end
  end
end
function on_time_over(form)
  if not nx_is_valid(form) then
    return
  end
  form:Close()
end
function animation_key_end(self)
  if not nx_is_valid(self) then
    return
  end
  self.Visible = false
  local gui = nx_value("gui")
  if nx_is_valid(self) then
    gui:Delete(self)
  end
end
