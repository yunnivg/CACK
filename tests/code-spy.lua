require("define\\object_type_define")
require("util_static_data")

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
    local player_client
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
        player_client = game_client:GetPlayer()
        if not nx_is_valid(player_client) then
            is_vaild_data = false
        end
    end

    -- Nếu dữ liệu ok hết
    if is_vaild_data == true then
        --
        --
    end
    
    nx_pause(0.2)
end

tools_show_notice(nx_function("ext_utf8_to_widestr", "Kết thúc auto"))

-- yui hatano
-- ameri ichinose
