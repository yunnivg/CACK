require("define\\object_type_define")
require("util_static_data")
require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_shopping"
local CARD_MAIN_TYPE_WEAPON = 1
local CARD_MAIN_TYPE_EQUIP = 2
local CARD_MAIN_TYPE_HORSE = 3
local CARD_MAIN_TYPE_OTHENR = 4
local CARD_MAIN_TYPE_DECORATE = 5
local inmage_path = "gui\\language\\ChineseS\\card\\"

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
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
	on_main_form_close(form)
end

function change_form_size()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
	local gui = nx_value("gui")
	--form.Left = (gui.Width - form.Width) / 2
	--form.Top = (gui.Height - form.Height) / 2
	form.Left = 100
	form.Top = 140
end

function on_btn_usecard_click(btn)
    if not nx_is_valid(btn) then
        return false
    end
    local model = btn.model
    local game_visual = nx_value("game_visual")
    local game_player = game_visual:GetPlayer()
    local role_composite = nx_value("role_composite")
    if not nx_is_valid(role_composite) then
        return
    end
    local model_table = util_split_string(model, ";")
    local count = table.getn(model_table)
    if count == 0 then
        return
    end
    for i = 1, count do
        local base_table = util_split_string(model_table[i], ":")
        if base_table ~= nil then
            local base_count = table.getn(base_table)
            if base_count == 2 then
                local prop_name = base_table[1]
                local prop_value = base_table[2]
                if prop_name == "Hat" and prop_value ~= nil and prop_value ~= "" then
                    link_hat_skin(role_composite, game_player, prop_value)
                elseif prop_name == "Shoes" then
                    role_composite:LinkSkin(game_player, "shoes", prop_value .. ".xmod", false)
                elseif prop_name == "Cloth" then
                    link_cloth_skin(role_composite, game_player, prop_value)
                elseif prop_name == "Pants" then
                    link_pants_skin(role_composite, game_player, prop_value)
                elseif prop_name == "Cloak" then
                    role_composite:LinkSkin(game_player, "cloak", prop_value .. ".xmod", false)
                elseif prop_name == "Waist" then
                    role_composite:LinkSkin(game_player, "waist", prop_value .. ".xmod", false)
                end
            end
        end
    end
end

function create_item_cardrow(card_id, player_sex)
    local collect_card_manager = nx_value("CollectCardManager")
    if not nx_is_valid(collect_card_manager) then
        return nx_null()
    end
    local card_info_table = collect_card_manager:GetCardInfo(card_id)
    local photo = nx_resource_path() .. inmage_path .. nx_string(card_id) .. ".png"
    local gui = nx_value("gui")
    local groupbox = gui:Create("GroupBox")
    if not nx_is_valid(groupbox) then
        return nx_null()
    end
    
    local btn_use = gui:Create("Button")
    local btn_unuse = gui:Create("Button")
    local lbl_name = gui:Create("Label")
    local lbl_pic = gui:Create("Label")
    local lbl_bgpic = gui:Create("Label")
    groupbox:Add(btn_use)
    groupbox:Add(btn_unuse)
    groupbox:Add(lbl_name)
    groupbox:Add(lbl_bgpic)
    groupbox:Add(lbl_pic)
    groupbox.Left = -3
    groupbox.Top = -3
    groupbox.Width = 279
    groupbox.Height = 113
    groupbox.BackColor = "0,255,255,255"
    groupbox.NoFrame = true
    groupbox.BackImage = "gui\\common\\form_back\\bg_donghai1.png"
    groupbox.DrawMode = "Expand"
    groupbox.AutoSize = false
    
    if nx_is_valid(btn_use) then
        btn_use.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_use.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_use.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_use.Width = 100
        btn_use.Height = 30
        btn_use.Left = 75
        btn_use.Top = 29
        btn_use.Name = "sort"
        btn_use.Text = nx_function("ext_utf8_to_widestr", "Dùng")
        btn_use.DrawMode = "Expand"
        btn_use.ForeColor = "255,246,255,181"
        if player_sex == nx_int(0) then
            btn_use.model = card_info_table[11]
        else
            btn_use.model = card_info_table[10]
        end
        nx_bind_script(btn_use, nx_current())
        nx_callback(btn_use, "on_click", "on_btn_usecard_click")
        --nx_set_custom(btn_use, "type", tvt_type)
    end
    if nx_is_valid(btn_unuse) then
        btn_unuse.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_unuse.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_unuse.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_unuse.Width = 100
        btn_unuse.Height = 30
        btn_unuse.Left = 75
        btn_unuse.Top = 64
        btn_unuse.Name = "sort"
        btn_unuse.Text = nx_function("ext_utf8_to_widestr", "Hủy")
        btn_unuse.DrawMode = "Expand"
        btn_unuse.ForeColor = "255,246,255,181"
        btn_use.model_path = ""
        btn_use.item_type = ""
        nx_bind_script(btn_unuse, nx_current())
        nx_callback(btn_unuse, "on_click", "on_btn_unuse_click")
        --nx_set_custom(btn_unuse, "type", tvt_type)
    end
    if nx_is_valid(lbl_name) then
        lbl_name.Left = 75
        lbl_name.Top = 8
        lbl_name.Width = 167
        lbl_name.Height = 16
        lbl_name.ForeColor = "255,216,203,55"
        lbl_name.Font = "font_title"
        lbl_name.Align = "Left"
        lbl_name.Text = util_text("card_item_" .. nx_string(card_id))
    end
    if nx_is_valid(lbl_bgpic) then
        lbl_bgpic.Left = 5
        lbl_bgpic.Top = 8
        lbl_bgpic.Width = 66
        lbl_bgpic.Height = 98
        lbl_bgpic.AutoSize = false
        lbl_bgpic.BackImage = "gui\\common\\imagegrid\\icon_yqd_qd_1.png"
        lbl_bgpic.DrawMode = "FitWindow"
    end
    if nx_is_valid(lbl_pic) then
        lbl_pic.Left = 11
        lbl_pic.Top = 14
        lbl_pic.Width = 55
        lbl_pic.Height = 86
        lbl_pic.AutoSize = false
        lbl_pic.BackImage = photo
        lbl_pic.DrawMode = "FitWindow"
    end
    return groupbox
end

function on_btn_use_click(btn)
    local game_visual = nx_value("game_visual")
    local game_player = game_visual:GetPlayer()
    local role_composite = nx_value("role_composite")
    local model_path = btn.model_path
    local item_type = btn.item_type
    
    if nx_int(item_type) == nx_int(ITEMTYPE_EQUIP_HAT) then
        -- Tóc
        link_hat_skin(role_composite, game_player, model_path)
    elseif nx_int(item_type) == nx_int(ITEMTYPE_EQUIP_CLOTH) then
        -- Áo
        link_cloth_skin(role_composite, game_player, model_path)
    elseif nx_int(item_type) == nx_int(ITEMTYPE_EQUIP_PANTS) then
        -- Quần
        link_pants_skin(role_composite, game_player, model_path)
    elseif nx_int(item_type) == nx_int(ITEMTYPE_EQUIP_SHOES) then
        -- Giày
        role_composite:LinkSkin(game_player, "shoes", model_path .. ".xmod", false)
    end
    
    -- Mạng che mặt (Mặt Nạ)
    --role_composite:LinkSkin(game_player, "Mask", modelF_path .. ".xmod", false)

    -- Áo choàng
    --role_composite:LinkSkin(game_player, "cloak", "ccccc.xmod", false)

    -- Trang sức eo
    --role_composite:LinkSkin(game_player, "waist", ".xmod", false)

    -- Trang sức eo
    --role_composite:LinkSkin(game_player, "waist", ".xmod", false)

    --role_composite:LinkWeapon(game_player, "ShotWeapon", "main_model::H_weaponR_01", modelF_path .. ".xmod")

    --role_composite:LinkSkin(game_player, "waist", ".xmod", false)
end

function on_btn_unuse_click(btn)
end

function create_item_cardhat(card_id, head_model, head_icon)
    local gui = nx_value("gui")
    local groupbox = gui:Create("GroupBox")
    if not nx_is_valid(groupbox) then
        return nx_null()
    end
    local btn_use = gui:Create("Button")
    local btn_unuse = gui:Create("Button")
    local lbl_name = gui:Create("Label")
    local lbl_pic = gui:Create("Label")
    local lbl_bgpic = gui:Create("Label")
    groupbox:Add(btn_use)
    groupbox:Add(btn_unuse)
    groupbox:Add(lbl_name)
    groupbox:Add(lbl_bgpic)
    groupbox:Add(lbl_pic)
    groupbox.Left = -3
    groupbox.Top = -3
    groupbox.Width = 279
    groupbox.Height = 113
    groupbox.BackColor = "0,255,255,255"
    groupbox.NoFrame = true
    groupbox.BackImage = "gui\\common\\form_back\\bg_donghai1.png"
    groupbox.DrawMode = "Expand"
    groupbox.AutoSize = false
    
    if nx_is_valid(btn_use) then
        btn_use.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_use.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_use.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_use.Width = 100
        btn_use.Height = 30
        btn_use.Left = 107
        btn_use.Top = 29
        btn_use.Name = "sort"
        btn_use.Text = nx_function("ext_utf8_to_widestr", "Dùng")
        btn_use.DrawMode = "Expand"
        btn_use.ForeColor = "255,246,255,181"
        btn_use.model_path = head_model
        btn_use.item_type = ITEMTYPE_EQUIP_HAT
        nx_bind_script(btn_use, nx_current())
        nx_callback(btn_use, "on_click", "on_btn_use_click")
        --nx_set_custom(btn_use, "type", tvt_type)
    end
    if nx_is_valid(btn_unuse) then
        btn_unuse.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_unuse.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_unuse.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_unuse.Width = 100
        btn_unuse.Height = 30
        btn_unuse.Left = 107
        btn_unuse.Top = 64
        btn_unuse.Name = "sort"
        btn_unuse.Text = nx_function("ext_utf8_to_widestr", "Hủy")
        btn_unuse.DrawMode = "Expand"
        btn_unuse.ForeColor = "255,246,255,181"
        btn_use.model_path = head_model
        btn_use.item_type = ITEMTYPE_EQUIP_HAT
        nx_bind_script(btn_unuse, nx_current())
        nx_callback(btn_unuse, "on_click", "on_btn_unuse_click")
        --nx_set_custom(btn_unuse, "type", tvt_type)
    end
    if nx_is_valid(lbl_name) then
        lbl_name.Left = 107
        lbl_name.Top = 8
        lbl_name.Width = 167
        lbl_name.Height = 16
        lbl_name.ForeColor = "255,216,203,55"
        lbl_name.Font = "font_title"
        lbl_name.Align = "Left"
        lbl_name.Text = util_text("card_item_" .. nx_string(card_id))
    end
    if nx_is_valid(lbl_bgpic) then
        lbl_bgpic.Left = 5
        lbl_bgpic.Top = 8
        lbl_bgpic.Width = 98
        lbl_bgpic.Height = 98
        lbl_bgpic.AutoSize = false
        lbl_bgpic.BackImage = "gui\\common\\imagegrid\\icon_yqd_qd_1.png"
        lbl_bgpic.DrawMode = "FitWindow"
    end
    if nx_is_valid(lbl_pic) then
        lbl_pic.Left = 11
        lbl_pic.Top = 14
        lbl_pic.Width = 86
        lbl_pic.Height = 86
        lbl_pic.AutoSize = false
        lbl_pic.BackImage = head_icon
        lbl_pic.DrawMode = "FitWindow"
    end
    return groupbox
end

function create_item_row(itemName, player_sex)
    local gui = nx_value("gui")
    local groupbox = gui:Create("GroupBox")
    if not nx_is_valid(groupbox) then
        return nx_null()
    end
    local btn_use = gui:Create("Button")
    local btn_unuse = gui:Create("Button")
    local lbl_name = gui:Create("Label")
    local lbl_pic = gui:Create("Label")
    local lbl_bgpic = gui:Create("Label")
    groupbox:Add(btn_use)
    groupbox:Add(btn_unuse)
    groupbox:Add(lbl_name)
    groupbox:Add(lbl_bgpic)
    groupbox:Add(lbl_pic)
    groupbox.Left = -3
    groupbox.Top = -3
    groupbox.Width = 279
    groupbox.Height = 113
    groupbox.BackColor = "0,255,255,255"
    groupbox.NoFrame = true
    groupbox.BackImage = "gui\\common\\form_back\\bg_donghai1.png"
    groupbox.DrawMode = "Expand"
    groupbox.AutoSize = false
  
    local role_composite = nx_value("role_composite")
    local item_query = nx_value("ItemQuery")
    -- ID cái thông tin về Art của Item
    local row = item_query:GetItemPropByConfigID(itemName, "ArtPack")
    -- Loại ITEM
    local item_type = item_query:GetItemPropByConfigID(itemName, "ItemType")
    -- Tên Item
    local item_name = item_query:GetItemPropByConfigID(itemName, "QName")
    -- Giới hạn giới tính: 0 là nam 1 là nữ 2 là thông dụng
    local item_sex = item_query:GetItemPropByConfigID(itemName, "NeedSex")
    
    -- Model và ảnh cho nữ
    local modelF_path = item_static_query(nx_int(row), "FemaleModel", STATIC_DATA_ITEM_ART)
    local modelF_photo = item_static_query(nx_int(row), "FemalePhoto", STATIC_DATA_ITEM_ART)

    -- Model và ảnh cho nam
    local modelM_path = item_static_query(nx_int(row), "MaleModel", STATIC_DATA_ITEM_ART)
    local modelM_photo = item_static_query(nx_int(row), "Photo", STATIC_DATA_ITEM_ART)

    local model_photo = ""
    local model_path = ""
    if player_sex == nx_int(1) then
        model_photo = modelF_photo
        model_path = modelF_path
        if model_photo == "" and modelM_photo ~= "" then
            model_photo = modelM_photo
        end
    else    
        model_photo = modelM_photo
        model_path = modelM_path
        if model_photo == "" and modelF_photo ~= "" then
            model_photo = modelF_photo
        end
    end
  
    if nx_is_valid(btn_use) then
        btn_use.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_use.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_use.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_use.Width = 100
        btn_use.Height = 30
        btn_use.Left = 107
        btn_use.Top = 29
        btn_use.Name = "sort"
        btn_use.Text = nx_function("ext_utf8_to_widestr", "Dùng")
        btn_use.DrawMode = "Expand"
        btn_use.ForeColor = "255,246,255,181"
        btn_use.model_path = model_path
        btn_use.item_type = item_type
        nx_bind_script(btn_use, nx_current())
        nx_callback(btn_use, "on_click", "on_btn_use_click")
        --nx_set_custom(btn_use, "type", tvt_type)
    end
    if nx_is_valid(btn_unuse) then
        btn_unuse.NormalImage = "gui\\common\\button\\btn_normal_out.png"
        btn_unuse.FocusImage = "gui\\common\\button\\btn_normal_on.png"
        btn_unuse.CheckedImage = "gui\\common\\button\\btn_normal_down.png"
        btn_unuse.Width = 100
        btn_unuse.Height = 30
        btn_unuse.Left = 107
        btn_unuse.Top = 64
        btn_unuse.Name = "sort"
        btn_unuse.Text = nx_function("ext_utf8_to_widestr", "Hủy")
        btn_unuse.DrawMode = "Expand"
        btn_unuse.ForeColor = "255,246,255,181"
        btn_use.model_path = model_path
        btn_use.item_type = item_type
        nx_bind_script(btn_unuse, nx_current())
        nx_callback(btn_unuse, "on_click", "on_btn_unuse_click")
        --nx_set_custom(btn_unuse, "type", tvt_type)
    end
    if nx_is_valid(lbl_name) then
        lbl_name.Left = 107
        lbl_name.Top = 8
        lbl_name.Width = 167
        lbl_name.Height = 16
        lbl_name.ForeColor = "255,216,203,55"
        lbl_name.Font = "font_title"
        lbl_name.Align = "Left"
        lbl_name.Text = util_text(item_name)
    end
    if nx_is_valid(lbl_bgpic) then
        lbl_bgpic.Left = 5
        lbl_bgpic.Top = 8
        lbl_bgpic.Width = 98
        lbl_bgpic.Height = 98
        lbl_bgpic.AutoSize = false
        lbl_bgpic.BackImage = "gui\\common\\imagegrid\\icon_yqd_qd_1.png"
        lbl_bgpic.DrawMode = "FitWindow"
    end
    if nx_is_valid(lbl_pic) then
        lbl_pic.Left = 11
        lbl_pic.Top = 14
        lbl_pic.Width = 86
        lbl_pic.Height = 86
        lbl_pic.AutoSize = false
        lbl_pic.BackImage = model_photo
        lbl_pic.DrawMode = "FitWindow"
    end
    return groupbox
end

function refresh_item_view(load_type)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    local player_sex = nx_int(player_client:QueryProp("Sex"))
        
    local group = form.groupscrollbox_1
    group:DeleteAll()

    local ini = nx_execute("util_functions", "get_ini", "share\\item\\equipment.ini")
    local itemsCount = ini:GetSectionCount()

    for i = 0, itemsCount - 1 do
        --local itemID = ini:GetSectionByIndex(i)
        local itemName = ini:ReadString(i, "QName", "")
        local itemType = ini:ReadInteger(i, "ItemType", -1)
        local itemSex = nx_int(ini:ReadInteger(i, "NeedSex", -1))
        if (itemSex == player_sex or itemSex == nx_int(2)) and itemType == load_type then
            local groupbox = create_item_row(itemName, player_sex)
            if nx_is_valid(groupbox) then
                group:Add(groupbox)
            end
        end
    end
    
    group:ResetChildrenYPos()
end

function on_btn_view_hat_click(btn)
    refresh_item_view(ITEMTYPE_EQUIP_HAT)
end

function on_btn_view_hatpvc_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    local player_sex = nx_int(player_client:QueryProp("Sex"))
    local group = form.groupscrollbox_1
    group:DeleteAll()
    local collect_card_manager = nx_value("CollectCardManager")
    local card_id_table = collect_card_manager:OnChooseCard(nx_int(CARD_MAIN_TYPE_EQUIP), nx_int(0), nx_int(0), nx_int(0), nx_int(0), nx_int(0))
    local card_num = table.getn(card_id_table)
    local card_offset = 0
    while 1 do
        card_offset = card_offset + 1
        local i = ((card_offset - 1) * 3) + 1
        if card_id_table[i] == nil then
            break
        end
        local card_id = card_id_table[i]
        local card_head_skill = collect_card_manager:GetCardHeadIcon(card_id)
        local female_head_prop = card_head_skill[1]
        local female_head_model = card_head_skill[2]
        local female_head_icon = card_head_skill[3]
        local male_head_prop = card_head_skill[4]
        local male_head_model = card_head_skill[5]
        local male_head_icon = card_head_skill[6]
        
        local head_prop = ""
        local head_model = ""
        local head_icon = ""
        if player_sex == nx_int(0) then
            head_prop = male_head_prop
            head_model = male_head_model
            head_icon = male_head_icon
        else
            head_prop = female_head_prop
            head_model = female_head_model
            head_icon = female_head_icon
        end
        
        if (head_prop == "Hat" or head_prop == "hat") and head_model ~= nil and head_model ~= "" then
            local groupbox = create_item_cardhat(card_id, head_model, head_icon)
            if nx_is_valid(groupbox) then
                group:Add(groupbox)
            end
        end
    end

    group:ResetChildrenYPos()
end

function on_btn_view_cloth_click(btn)
    refresh_item_view(ITEMTYPE_EQUIP_CLOTH)
end

function on_btn_view_clothpvc_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return false
	end
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    local player_sex = nx_int(player_client:QueryProp("Sex"))
    local group = form.groupscrollbox_1
    group:DeleteAll()
    local collect_card_manager = nx_value("CollectCardManager")
    local card_id_table = collect_card_manager:OnChooseCard(nx_int(CARD_MAIN_TYPE_EQUIP), nx_int(0), nx_int(0), nx_int(0), nx_int(0), nx_int(0))
    local card_num = table.getn(card_id_table)
    local card_offset = 0
    while 1 do
        card_offset = card_offset + 1
        local i = ((card_offset - 1) * 3) + 1
        if card_id_table[i] == nil then
            break
        end
        local card_id = card_id_table[i]
        local groupbox = create_item_cardrow(card_id, player_sex)
        if nx_is_valid(groupbox) then
            group:Add(groupbox)
        end
    end

    group:ResetChildrenYPos()
end

function on_btn_view_pants_click(btn)
    refresh_item_view(ITEMTYPE_EQUIP_PANTS)
end

function on_btn_view_shoes_click(btn)
    refresh_item_view(ITEMTYPE_EQUIP_SHOES)
end

function on_btn_view_zzz_click(btn)
end

function on_btn_clear_hat_click(btn)
    unlinkPlayerSkin("hat")
end

function on_btn_clear_cloth_click(btn)
    unlinkPlayerSkin("cloth")
end

function on_btn_clear_pants_click(btn)
    unlinkPlayerSkin("pants")
end

function on_btn_clear_shoes_click(btn)
    unlinkPlayerSkin("shoes")
end

function unlinkPlayerSkin(part)
    local role_composite = nx_value("role_composite")
	if not nx_is_valid(role_composite) then
		return false
	end
    local game_visual = nx_value("game_visual")
	if not nx_is_valid(game_visual) then
		return false
	end
    local game_player = game_visual:GetPlayer()
	if not nx_is_valid(game_player) then
		return false
	end
    role_composite:UnLinkSkin(game_player, part)
end