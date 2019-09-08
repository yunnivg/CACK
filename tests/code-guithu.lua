require("define\\object_type_define")
require("util_static_data")

local form = nx_value("auto_tools\\tools_lookup")
if not nx_is_valid(form) then
    util_auto_show_hide_form("auto_tools\\tools_lookup")--tools_tiguan
end
local gui = nx_value("gui")
local form = nx_value("auto_tools\\tools_lookup")--tools_lookup

if auto_is_running ~= true then
    auto_is_running = true
    tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu"))
else
    auto_is_running = false
end

while auto_is_running == true do
    local is_vaild_data = true
    local game_client
    local game_visual
    local game_player
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
        game_scence = game_client:GetScene()
        if not nx_is_valid(game_scence) then
            is_vaild_data = false
        end
    end
    local form = nx_value("auto_tools\\tools_lookup")--tools_lookup
    if not nx_is_valid(form) then
        is_vaild_data = false
    end
    

    -- Nếu dữ liệu ok hết
    if is_vaild_data == true then
        form.mltbox_content:Clear()
    
        nx_execute("form_stage_main\\form_mail\\form_mail", "open_form", 1)
        local form_send = nx_execute("util_gui", "util_get_form", "form_stage_main\\form_mail\\form_mail_send", true, false)
        form_send.targetname.Text = nx_function("ext_utf8_to_widestr", "BảnTìnhCaĐầuTiên")
        form_send.lettername.Text = nx_function("ext_utf8_to_widestr", "Tặng chơi nè")
        form_send.lettercontent.Text = nx_function("ext_utf8_to_widestr", "Á hí hí")
        if form_send.combobox_targetname.DroppedDown then
            form_send.combobox_targetname.DroppedDown = false
        end
        form_send.rbtn_send.Checked = true
        nx_execute("form_stage_main\\form_mail\\form_mail_send", "on_rbtn_send_click", form_send.rbtn_send)

        local form_bag = nx_value("form_stage_main\\form_bag")
        local form_bagopen = 0
        while not nx_is_valid(form_bag) or form_bag.Visible == false do
            util_auto_show_hide_form("form_stage_main\\form_bag")
            nx_pause(0.1)
            form_bag = nx_value("form_stage_main\\form_bag")
            form_bagopen = form_bagopen + 1
            if form_bagopen > 10 then
                break
            end
        end
        if nx_is_valid(form_bag) then
            if not form_bag.rbtn_task.Checked then
                form_bag.rbtn_task.Checked = true
            end
            local goods_grid = nx_value("GoodsGrid")
            if nx_is_valid(goods_grid) then
                local count = goods_grid:GetItemCount("TaskItemClone_004007")
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số item: ") .. nx_widestr(count), -1)
                if count < 46 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đào, chờ đủ ít nhất 46 item"), -1)
                else
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đã đủ, gửi thư"), -1)
                    local grid, grid_index = goods_grid:GetToolBoxGridAndPos("TaskItemClone_004007")
                    if not nx_is_valid(grid) or grid == nil then
                        return false
                    end
                    nx_execute("form_stage_main\\form_bag_func", "on_addbag_select_changed", grid, grid_index)
                    form_send.postbox:SetSelectItemIndex(0)
                    nx_execute("form_stage_main\\form_mail\\form_mail_send", "on_postbox_select_changed", form_send.postbox)
                    nx_execute("form_stage_main\\form_mail\\form_mail_send", "on_sendletter_click", form_send.sendletter)
                    nx_pause(0.5)
                    local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", false, false)
                    if nx_is_valid(dialog) then
                        nx_execute("form_common\\form_confirm", "ok_btn_click", dialog.ok_btn)
                    end
                end
            end
        end
    end
    
    nx_pause(1)
end

tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc auto"))

if 1 then
    return false
end

game_client = nx_value("game_client")
if not nx_is_valid(game_client) then
    is_vaild_data = false
end
game_scence = game_client:GetScene()
if not nx_is_valid(game_scence) then
    is_vaild_data = false
end
local game_scence_objs = game_scence:GetSceneObjList()
for i = 1, table.getn(game_scence_objs) do
    local obj = game_scence_objs[i]
    console(nx_function("ext_widestr_to_utf8", nx_widestr(obj:QueryProp("ConfigID")) .. nx_widestr(" : ") .. util_text(obj:QueryProp("ConfigID"))))
end

if 1 then
    return false
end

function play_sound(filename)
  local gui = nx_value("gui")
  if not nx_is_valid(gui) then
    return
  end
  if not gui:FindSound("sound_qingame") then
    gui:AddSound("sound_qingame", nx_resource_path() .. filename)
  end
  gui:PlayingSound("sound_qingame")
end

local game_visual = nx_value("game_visual")
if not nx_is_valid(game_visual) then
    return false
end
local game_player = game_visual:GetPlayer()
if not nx_is_valid(game_player) then
    return false
end

local beforeX = string.format("%.3f", game_player.PositionX)
local beforeY = string.format("%.3f", game_player.PositionY)
local beforeZ = string.format("%.3f", game_player.PositionZ)

local text = "    {" .. beforeX .. ", " .. beforeY .. ", " .. beforeZ .. "}"

local file = io.open("D:\\log.txt", "a")
file:write(text)
file:write("\n")
file:close()


if 1 then
    return false
end
--local file = assert(loadfile("D:\\data.lua"))
--file()

local controlAuto = nx_int(1)
while controlAuto == nx_int(1) do
    file = io.open("D:/control.txt", "r")  
    for each in file:lines() do
      controlAuto = nx_int(each)
    end
    file:close()
    
end

tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc auto"))

-- vlxx.tv
--nx_execute("auto_tools\\tool_libs", "console", nx_function("ext_widestr_to_utf8", btn_name))
--nx_execute("auto_tools\\tool_libs", "console", btn_name)
-- yui hatano
-- ameri ichinose
