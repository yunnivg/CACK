require("util_gui")
require("define\\gamehand_type")
require("const_define")

local tools_btns_data = {
	{
		"8", -- Auto xả bạc, farm hiệp ác
		"gui\\special\\btn_main40rh\\btn_schoolwar_on.png",
		"Auto xả bạc, farm hiệp ác",
		"auto_tools\\tools_spendmoney",
		"",
		1
	},
	{
		"15", -- Auto bày shops online
		"gui\\special\\btn_main40rh\\btn_stall_on.png",
		"Bày shops online",
		"auto_tools\\tools_stallonline",
		"auto_init",
		0
	},
	{
		"2", -- Auto đàn
		"gui\\special\\btn_main40rh\\btn_drama_on.png",
		"Auto đàn buff đội",
		"auto_tools\\tools_qingame",
		"auto_init",
		0
	},
	{
		"19", -- Mở tạp hóa
		"gui\\special\\btn_main40rh\\btn_shop_on.png",
		"Mở tạp hóa",
		"auto_tools\\tools_grocery",
		"auto_init",
		0
	},
	{
		"4", -- Auto vận tiêu
		"gui\\special\\btn_main40rh\\btn_enchou_on.png",
		"Auto vận tiêu",
		"auto_tools\\tools_escort",
		"",
		1
	},
	{
		"5", -- Nút để test các chức năng
		"gui\\special\\btn_main40rh\\btn_role_on.png",
		"DEBUG",
		"auto_tools\\tools_test",
		"auto_init",
		0
	},
	{
		"6", -- Auto trồng trọt
		"gui\\special\\btn_main40rh\\btn_life_on.png",
		"Auto trồng cây nuôi tằm",
		"auto_tools\\tools_crop",
		"",
		1
	},
	{
		"7", -- Auto chặt cây
		"gui\\special\\btn_main40rh\\boss_on.png",
		"Auto chặt cây",
		"auto_tools\\tools_woodcut",
		"",
		1
	},
	{
		"11", -- Auto đào khoáng, hái thuốc
		"gui\\special\\btn_main40rh\\btn_lxc_on.png",
		"Auto Khoáng-Dược-Độc",
		"auto_tools\\tools_minemedi",
		"",
		1
	},
	{
		"16", -- Auto câu cá
		"gui\\mainform\\smallgame\\fishing_fish.png",
		"Auto câu cá",
		"auto_tools\\tools_fish",
		"",
		1
	},
	{
		"10", -- Auto thợ săn
		"gui\\special\\btn_main40rh\\btn_pet_on.png",
		"Auto thợ săn",
		"auto_tools\\tools_hunter",
		"",
		1
	},
	{
		"17", -- Các auto một nút
		"gui\\special\\btn_main40rh\\btn_webexchange_on.png",
		"Các Tools một nút",
		"auto_tools\\tools_lookup",
		"",
		1
	},
	{
		"12", -- Auto nhận kỳ ngộ
		"gui\\special\\btn_main40rh\\btn_adventure_on.png",
		"Auto nhận kỳ ngộ xịn",
		"auto_tools\\tools_captureqt",
		"auto_init",
		0
	},
	{
		"1", -- Auto bắt cóc
		"gui\\special\\btn_main40rh\\btn_xinfa_on.png",
		"Auto bắt cóc",
		"auto_tools\\tools_doabduct",
		"",
		1
	},
	{
		"20", -- Auto dùng vật phẩm
		"gui\\special\\btn_main40rh\\btn_bag_on.png",
		"Auto dùng vật phẩm",
		"auto_tools\\tools_useitems",
		"",
		1
	},
	{
		"18", -- Auto rao
		"gui\\special\\btn_main40rh\\btn_gmcc_out.png",
		"Auto rao",
		"auto_tools\\tools_chat",
		"",
		1
	},
	{
		"21", -- Công cụ điểm dừng chân
		"gui\\special\\btn_main40rh\\home_on.png",
		"Công cụ điểm dừng chân",
		"auto_tools\\tools_homepoint",
		"",
		1
	},
	{
		"9", -- Auto cấm địa
		"gui\\special\\btn_main40rh\\btn_clone_on.png",
		"Auto đánh boss cấm địa",
		"auto_tools\\tools_clone",
		"",
		1
	},
	{
		"13", -- Auto THTH + Thế lực
		"gui\\special\\btn_main40rh\\btn_cdsh_on.png",
		"Auto THTH + Thế lực",
		"auto_tools\\tools_tiguan",
		"",
		1
	},
	{
		"22", -- Công cụ mặc đồ
		"gui\\special\\btn_main40rh\\btn_role_on.png",
		"Công cụ MOD đồ đạc",
		"auto_tools\\tools_shopping",
		"",
		1
	},
	{
		"23", -- Công cụ tân thế giới
		"gui\\special\\btn_main40rh\\home_on.png",
		"Công cụ Tân Thế Giới",
		"auto_tools\\tools_newworld",
		"",
		1
	},
	{
		"24", -- Công cụ Thanh hải
		"gui\\special\\btn_main40rh\\sworn_on.png",
		"Công cụ Thanh Hải",
		"auto_tools\\tools_qinghai",
		"",
		1
	},
	{
		"25", -- Công cụ luyện nhóm
		"gui\\special\\btn_main40rh\\btn_wuxue_on.png",
		"Auto luyện công",
		"auto_tools\\tools_danceteam",
		"",
		1
	},
    {
        "26", -- Auto đi thiên thê
        "gui\\special\\btn_main40rh\\btn_lt_on.png",
        "Auto đi thiên thê",
        "auto_tools\\tools_match",
        "auto_init",
        0
    },
    {
        "27", -- Mở hộp thư
        "gui\\special\\btn_main\\icon_mail.png",
        "Mở hộp thư",
        "auto_tools\\tools_openmail",
        "auto_init",
        0
    },
    {
        "28", -- Auto mua đồ ở chợ
        "gui\\special\\btn_main\\btn_webexchange_out.png",
        "Mua đồ ở shops",
        "auto_tools\\tools_buymarket",
        "",
        1
    },
    {
        "29", -- Auto chiến trường
        "gui\\special\\btn_main40rh\\battle_on.png",
        "Auto chiến trường",
        "auto_tools\\tools_battlefield",
        "auto_init",
        0
    },
    {
        "14", -- Nút để test các chức năng
        "gui\\special\\btn_main40rh\\szg_on.png",
        "Test code.lua",
        "auto_tools\\tools_dofile",
        "auto_init",
        0
    },
	{
		"3", -- Ẩn auto
		"gui\\special\\btn_main40rh\\btn_offline_on.png",
		"Ẩn nút công cụ",
		"auto_tools\\tools_hide",
		"auto_init",
		0
	}
}

-- Max BTN current = 29

function on_form_main_init(self)
  self.start_timer = false
end
function on_main_form_open(self)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    on_main_form_close(self)
    return
  end

  local main_btn = form_main.clicked_btn
  local btn_count = table.getn(tools_btns_data)
  local groupscrollbox_height = round(btn_count / 3, 0)

  if btn_count <= 0 or not nx_is_valid(main_btn) then
    on_main_form_close(self)
    return
  end

  local itemHeight = 28
  local itemWidth = 200
  local formWidth = itemWidth * 3
  local gui = nx_value("gui")
  self.Width = formWidth
  self.Height = groupscrollbox_height * itemHeight
  
  -- Xác định bên trái của form
  local AbsLeftCenter = main_btn.AbsLeft + math.floor(main_btn.Width / 2)
  local AbsLeft = AbsLeftCenter - (formWidth / 2)
  if AbsLeft < 10 then
    AbsLeft = 10
  end
  -- Nếu bên phải vượt quá màn hình thì canh về bên phải
  if (AbsLeft + formWidth) > form_main.Width then
    AbsLeft = form_main.Width - 10 - formWidth
  end
  self.AbsLeft = AbsLeft
  
  -- Xác định top của form
  local AbsTop = main_btn.AbsTop + main_btn.Height + 9
  -- Nếu top + cao của form quá màn hình thì chuyển lên bên trên
  if (AbsTop + self.Height) > form_main.Height then
    AbsTop = main_btn.AbsTop - self.Height - 9
  end
  self.AbsTop = AbsTop

  self.groupscrollbox_1.Width = itemWidth
  self.groupscrollbox_1.Height = groupscrollbox_height * itemHeight
  self.groupscrollbox_1.Left = 0
  self.groupscrollbox_1.Top = 0
  self.groupscrollbox_1.DrawMode = "Expand"
  self.groupscrollbox_1.BackImage = "gui\\common\\form_back\\bg_menu.png"

  self.groupscrollbox_2.Width = itemWidth
  self.groupscrollbox_2.Height = groupscrollbox_height * itemHeight
  self.groupscrollbox_2.Left = itemWidth
  self.groupscrollbox_2.Top = 0
  self.groupscrollbox_2.DrawMode = "Expand"
  self.groupscrollbox_2.BackImage = "gui\\common\\form_back\\bg_menu.png"

  self.groupscrollbox_3.Width = itemWidth
  self.groupscrollbox_3.Height = groupscrollbox_height * itemHeight
  self.groupscrollbox_3.Left = itemWidth * 2
  self.groupscrollbox_3.Top = 0
  self.groupscrollbox_3.DrawMode = "Expand"
  self.groupscrollbox_3.BackImage = "gui\\common\\form_back\\bg_menu.png"

  self.imagegrid_sel.Visible = false
  self.imagegrid_sel2.Visible = false
  self.imagegrid_sel3.Visible = false

  local arrOffset = {
    [1] = 0,
    [2] = 0,
    [3] = 0
  }
  local offsetJ = 0
  for i = 1, btn_count do
    offsetJ = offsetJ + 1
    local btn_name = tools_btns_data[i][1]
    local btn_pic = tools_btns_data[i][2]
    if btn_name ~= "" and btn_pic ~= "" then
      local btn_tip = tools_btns_data[i][3]
      local text = nx_function("ext_utf8_to_widestr", btn_tip)
      local x = 0
	  if offsetJ % 3 == 0 then
        -- Cột số 3
        local y = arrOffset[3] * itemHeight
        on_create_groupbox(self.groupscrollbox_3, x, y, btn_pic, text, btn_name, 3)
        arrOffset[3] = arrOffset[3] + 1
        offsetJ = 0
      elseif offsetJ % 2 == 0 then
	    -- Cột số 2
	    local y = arrOffset[2] * itemHeight
        on_create_groupbox(self.groupscrollbox_2, x, y, btn_pic, text, btn_name, 2)
        arrOffset[2] = arrOffset[2] + 1
      else
        -- Cột số 1
        local y = arrOffset[1] * itemHeight
		on_create_groupbox(self.groupscrollbox_1, x, y, btn_pic, text, btn_name, 1)
		arrOffset[1] = arrOffset[1] + 1
	  end
    end
  end
  self.start_timer = false
end
function check_form_show(form)
  if not nx_is_valid(form) then
    return
  end
  local left = form.AbsLeft
  local top = form.AbsTop
  local right = left + form.Width
  local bottom = top + form.Height - 5
  local gui = nx_value("gui")
  local cursor_x, cursor_y = gui:GetCursorPosition()
  if cursor_x > left - 2 and cursor_x < right - 2 and cursor_y > top - 5 and bottom > cursor_y then
    return
  else
    close_form()
  end
end
function on_groupscrollbox_1_get_capture(self)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_tools_func_timer", form_main)
end
function on_groupscrollbox_2_get_capture(self)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_tools_func_timer", form_main)
end
function on_groupscrollbox_3_get_capture(self)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  if not nx_is_valid(form_main) then
    return
  end
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_tools_func_timer", form_main)
end
function on_main_form_close(self)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "check_form_show", self)
  end
  nx_destroy(self)
end
function on_imagegrid_sel_lost_capture(grid)
  local form = grid.ParentForm
  local left = form.AbsLeft
  local top = form.AbsTop
  local right = left + form.Width
  local bottom = top + form.Height - 5
  local gui = nx_value("gui")
  local cursor_x, cursor_y = gui:GetCursorPosition()
  if cursor_x > left - 2 and cursor_x < right - 2 and cursor_y > top - 5 and bottom > cursor_y then
    return
  else
    close_form()
  end
end
function on_imagegrid_sel2_lost_capture(grid)
  local form = grid.ParentForm
  local left = form.AbsLeft
  local top = form.AbsTop
  local right = left + form.Width
  local bottom = top + form.Height - 5
  local gui = nx_value("gui")
  local cursor_x, cursor_y = gui:GetCursorPosition()
  if cursor_x > left - 2 and cursor_x < right - 2 and cursor_y > top - 5 and bottom > cursor_y then
    return
  else
    close_form()
  end
end
function on_imagegrid_sel3_lost_capture(grid)
  local form = grid.ParentForm
  local left = form.AbsLeft
  local top = form.AbsTop
  local right = left + form.Width
  local bottom = top + form.Height - 5
  local gui = nx_value("gui")
  local cursor_x, cursor_y = gui:GetCursorPosition()
  if cursor_x > left - 2 and cursor_x < right - 2 and cursor_y > top - 5 and bottom > cursor_y then
    return
  else
    close_form()
  end
end
function on_imagegrid_sel_get_capture(grid)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "check_form_show", form_main)
  end
  on_groupscrollbox_1_get_capture(grid)
end
function on_imagegrid_sel2_get_capture(grid)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "check_form_show", form_main)
  end
  on_groupscrollbox_2_get_capture(grid)
end
function on_imagegrid_sel3_get_capture(grid)
  local form_main = nx_value("form_stage_main\\form_main\\form_main")
  nx_execute("form_stage_main\\form_main\\form_main", "on_del_hide_func_timer", form_main)
  local timer = nx_value(GAME_TIMER)
  if nx_is_valid(timer) then
    timer:UnRegister(nx_current(), "check_form_show", form_main)
  end
  on_groupscrollbox_3_get_capture(grid)
end
function on_imagegrid_sel_select_changed(grid, index)
  local selnumber = tonumber(grid.sel_name)
  local btnsnum = table.getn(tools_btns_data)
  for i = 1, btnsnum do
    local data = tools_btns_data[i]
	local datanumber = tonumber(data[1])
	if datanumber == selnumber then
	  local form_path = data[4]
	  local form_func = data[5]
	  if form_path == "" then
		return
	  end
	  if data[6] ~= 0 then
		util_auto_show_hide_form(form_path)
	  elseif form_func ~= "" then
		nx_execute(form_path, form_func)
	  end
	  break
	end
  end
end
function on_imagegrid_sel2_select_changed(grid, index)
  local selnumber = tonumber(grid.sel_name)
  local btnsnum = table.getn(tools_btns_data)
  for i = 1, btnsnum do
    local data = tools_btns_data[i]
    local datanumber = tonumber(data[1])
    if datanumber == selnumber then
      local form_path = data[4]
      local form_func = data[5]
      if form_path == "" then
        return
      end
      if data[6] ~= 0 then
        util_auto_show_hide_form(form_path)
      elseif form_func ~= "" then
        nx_execute(form_path, form_func)
      end
      break
    end
  end
end
function on_imagegrid_sel3_select_changed(grid, index)
  local selnumber = tonumber(grid.sel_name)
  local btnsnum = table.getn(tools_btns_data)
  for i = 1, btnsnum do
    local data = tools_btns_data[i]
    local datanumber = tonumber(data[1])
    if datanumber == selnumber then
      local form_path = data[4]
      local form_func = data[5]
      if form_path == "" then
        return
      end
      if data[6] ~= 0 then
        util_auto_show_hide_form(form_path)
      elseif form_func ~= "" then
        nx_execute(form_path, form_func)
      end
      break
    end
  end
end
function on_create_groupbox(form, x, y, image, text, name, sel_index)
  if not nx_is_valid(form) then
    return
  end
  local gui = nx_value("gui")
  local groupbox = gui:Create("GroupBox")
  if not nx_is_valid(groupbox) then
    return
  end
  local lbl_img = gui:Create("Label")
  local lbl_text = gui:Create("Label")
  if not nx_is_valid(lbl_img) or not nx_is_valid(lbl_text) then
    gui:Delete(groupbox)
    return
  end
  local itemHeight = 28
  local itemWidth = 200
  form:Add(groupbox)
  groupbox.Width = itemWidth
  groupbox.Height = itemHeight
  groupbox.Left = x
  groupbox.Top = y
  groupbox.Name = name
  groupbox.NoFrame = true
  groupbox.BackColor = "0,255,255,255"
  nx_bind_script(groupbox, nx_current())
  if sel_index == 1 then
	nx_callback(groupbox, "on_get_capture", "on_groupbox_get_capture")
  elseif sel_index == 3 then
    nx_callback(groupbox, "on_get_capture", "on_groupbox3_get_capture")
  else
	nx_callback(groupbox, "on_get_capture", "on_groupbox2_get_capture")
  end
  groupbox:Add(lbl_img)
  lbl_img.Width = 26
  lbl_img.Height = 26
  lbl_img.Left = 4
  lbl_img.Top = 1
  lbl_img.BackImage = image
  lbl_img.DrawMode = FitWindow
  lbl_img.BlendColor = "255,255,255,255"
  groupbox:Add(lbl_text)
  lbl_text.Width = itemWidth - 36
  lbl_text.Height = 26
  lbl_text.Left = 36
  lbl_text.Top = 1
  lbl_text.Text = text
  lbl_text.ForeColor = "255,255,255,255"
  lbl_text.Font = "font_main"
end
function on_groupbox_get_capture(groupbox)
  if not nx_is_valid(groupbox) then
    return
  end
  nx_execute("tips_game", "hide_tip")
  local form = groupbox.ParentForm
  local helper_form = nx_value("helper_form")
  if not helper_form and form.start_timer ~= true then
    local timer = nx_value(GAME_TIMER)
    if nx_is_valid(timer) then
      timer:Register(1000, -1, nx_current(), "check_form_show", form, -1, -1)
      form.start_timer = true
    end
  end
  imggrid = form.imagegrid_sel
  imggrid:Clear()
  imggrid:SetSelectItemIndex(-1)
  imggrid.Width = groupbox.Width - 3
  imggrid.Height = groupbox.Height - 1
  imggrid.AbsLeft = groupbox.AbsLeft + 1
  imggrid.AbsTop = groupbox.AbsTop + 1
  imggrid.Visible = true
  imggrid.sel_name = groupbox.Name
  imggrid.GridPos = "0,0;"
  imggrid.GridWidth = groupbox.Width
  imggrid.GridHeight = groupbox.Height
  imggrid:AddItem(0, "", nx_widestr(""), 1, 1)
end
function on_groupbox2_get_capture(groupbox)
  if not nx_is_valid(groupbox) then
    return
  end
  nx_execute("tips_game", "hide_tip")
  local form = groupbox.ParentForm
  local helper_form = nx_value("helper_form")
  if not helper_form and form.start_timer ~= true then
    local timer = nx_value(GAME_TIMER)
    if nx_is_valid(timer) then
      timer:Register(1000, -1, nx_current(), "check_form_show", form, -1, -1)
      form.start_timer = true
    end
  end
  imggrid = form.imagegrid_sel2
  imggrid:Clear()
  imggrid:SetSelectItemIndex(-1)
  imggrid.Width = groupbox.Width - 3
  imggrid.Height = groupbox.Height - 1
  imggrid.AbsLeft = groupbox.AbsLeft + 1
  imggrid.AbsTop = groupbox.AbsTop + 1
  imggrid.Visible = true
  imggrid.sel_name = groupbox.Name
  imggrid.GridPos = "0,0;"
  imggrid.GridWidth = groupbox.Width
  imggrid.GridHeight = groupbox.Height
  imggrid:AddItem(0, "", nx_widestr(""), 1, 1)
end
function on_groupbox3_get_capture(groupbox)
  if not nx_is_valid(groupbox) then
    return
  end
  nx_execute("tips_game", "hide_tip")
  local form = groupbox.ParentForm
  local helper_form = nx_value("helper_form")
  if not helper_form and form.start_timer ~= true then
    local timer = nx_value(GAME_TIMER)
    if nx_is_valid(timer) then
      timer:Register(1000, -1, nx_current(), "check_form_show", form, -1, -1)
      form.start_timer = true
    end
  end
  imggrid = form.imagegrid_sel3
  imggrid:Clear()
  imggrid:SetSelectItemIndex(-1)
  imggrid.Width = groupbox.Width - 3
  imggrid.Height = groupbox.Height - 1
  imggrid.AbsLeft = groupbox.AbsLeft + 1
  imggrid.AbsTop = groupbox.AbsTop + 1
  imggrid.Visible = true
  imggrid.sel_name = groupbox.Name
  imggrid.GridPos = "0,0;"
  imggrid.GridWidth = groupbox.Width
  imggrid.GridHeight = groupbox.Height
  imggrid:AddItem(0, "", nx_widestr(""), 1, 1)
end
function close_form()
  local form = nx_value("auto_tools\\form_func_btns_tools")
  if nx_is_valid(form) then
    form.Visible = false
    form:Close()
  end
end
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
