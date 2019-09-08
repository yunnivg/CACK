

function normalize_angle(angle)
  local value = math.fmod(angle, math.pi * 2)
  if value < 0 then
    value = value + math.pi * 2
  end
  return value
end

function radian_to_degree(radian)
  return math.floor(normalize_angle(radian) * 3600 / (math.pi * 2)) * 0.1
end

game_client = nx_value("game_client")
if not nx_is_valid(game_client) then
    return false
end
game_visual = nx_value("game_visual")
if not nx_is_valid(game_visual) then
    return false
end
game_player = game_visual:GetPlayer()
if not nx_is_valid(game_player) then
    return false
end
player_client = game_client:GetPlayer()
if not nx_is_valid(player_client) then
    return false
end
game_scence = game_client:GetScene()
if not nx_is_valid(game_scence) then
    return false
end

local scene = nx_value("game_scene")
local game_control = nx_execute("create_scene", "create_game_control", scene)
local camera_normal = game_control:GetCameraController(0)

camera_normal.CurYawAngle = 0

local WINEXEC_PATH = "D:\\Games\\auto-cack-vn\\New\\test.exe"

nx_function("ext_win_exec", WINEXEC_PATH .. " MOUSEDOWN")

if 1 then
    return false
end

local bossID = "BossClone004107"

local controlAuto = nx_int(1)
local step = 1
local MaxDistance = 5

local startPos = {
    x = 677.445,
    y = -47.119,
    z = 759.187
}
local direct_run = true -- Di chuyển ngay
local city = nx_value("form_stage_main\\form_map\\form_map_scene").current_map
local mustBehindBosss = false

while controlAuto == nx_int(1) do
    file = io.open("D:/control.txt", "r")  
    for each in file:lines() do
      controlAuto = nx_int(each)
    end
    file:close()
    
    if step == 1 then
        -- Di chuyển đến chỗ vị trí đánh boss
        if not tools_move_isArrived2D(startPos.x, startPos.y, startPos.z) then
            tools_move(city, startPos.x, startPos.y, startPos.z, direct_run)
            direct_run = false
        else
            step = 2
        end
    elseif step == 2 then
        -- Kiểm tra lại chỗ đứng nếu quá 5 mét thì trở lại bước 1
        local playerX = string.format("%.3f", game_player.PositionX)
        local playerZ = string.format("%.3f", game_player.PositionZ)
        
        local pxd = playerX - startPos.x
        local pzd = playerZ - startPos.z
        
        local distance = math.sqrt(pxd * pxd + pzd * pzd)
        
        if distance > MaxDistance then
            step = 1
        else
            -- Tìm ra con boss
            local game_scence_objs = game_scence:GetSceneObjList()
            local bossOBJ = nil
            for i = 1, table.getn(game_scence_objs) do
                local npc_id = game_scence_objs[i]:QueryProp("ConfigID")
                if npc_id == bossID then
                    bossOBJ = game_scence_objs[i]
                    break
                end
            end
            if not nx_is_valid(bossOBJ) then
                tools_show_notice(nx_widestr("Khong co bosss"))
                return false
            end

            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
            local form_shortcut = nx_value(FORM_SHORTCUT)
            local grid_shortcut = form_shortcut.grid_shortcut_main
            local game_shortcut = nx_value("GameShortcut")

            -- Duyệt action của con boss để xem nó có xuất chiêu không
            if mustBehindBosss == false then
                if bossOBJ:QueryProp("CurSkillID") == "Clone004_cz_01" then
                    tools_show_notice(nx_widestr("Move TO BEHIND"))
                    mustBehindBosss = true -- Đánh dấu có skill và di chuyển
                    direct_run = true -- Đánh dấu phải di chuyển ngay lập tức
                end
            end
            
            if mustBehindBosss == true then
                local radian = bossOBJ.DestOrient
                local angle = radian_to_degree(radian)

                local zz = bossOBJ.DestZ
                local xx = bossOBJ.DestX

                -- Trước mặt
                --[[
                if angle <= 90 then
                    zz = zz + math.abs(math.sin(math.pi / 2 - radian))
                    xx = xx + math.abs(math.cos(math.pi / 2 - radian))
                elseif angle > 90 and angle <= 180 then
                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian))
                    xx = xx + math.abs(math.cos(math.pi * 3 / 2 - radian))
                elseif angle > 180 and angle <= 270 then
                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian))
                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian))
                elseif angle > 270 then
                    zz = zz + math.abs(math.sin(math.pi * 3 / 2 - radian))
                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian))
                end
                ]]--

                local dst = 1.5

                -- Sau lưng
                if angle <= 90 then
                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                elseif angle > 90 and angle <= 180 then
                    zz = zz + math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                    xx = xx - math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                elseif angle > 180 and angle <= 270 then
                    zz = zz + math.abs(math.sin(math.pi / 2 - radian) * dst)
                    xx = xx + math.abs(math.cos(math.pi / 2 - radian) * dst)
                elseif angle > 270 then
                    zz = zz - math.abs(math.sin(math.pi * 3 / 2 - radian) * dst)
                    xx = xx + math.abs(math.cos(math.pi * 3 / 2 - radian) * dst)
                end

                while not tools_move_isArrived2D(xx, -10000, zz, 0.4) do
                    tools_move(city, xx, -10000, zz, direct_run)
                    direct_run = false
                    nx_pause(0.4)
                end
                -- Sau khi di chuyển thì đánh dấu
                mustBehindBosss = false
                -- Ôn thần ngay sau khi ra sau lưng
                game_shortcut:on_main_shortcut_useitem(grid_shortcut, 3, true)
                nx_pause(0.2)
            end
            
            -- Kiểm tra để ra ôn thần
            local buffNC = get_buff_info("buf_CS_jl_shuangci07")
            if buffNC == nil or buffNC < 5 then
                game_shortcut:on_main_shortcut_useitem(grid_shortcut, 3, true)
            end
            
            -- Chỗ này bắt đầu cứ xuất chiêu quất boss
            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 0, true)
            nx_pause(0.2)
            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 1, true)
            nx_pause(0.2)
            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 2, true)
            nx_pause(0.12)
        end
    end
        
    nx_pause(0.08)
end

tools_show_notice(nx_widestr("End auto"))

