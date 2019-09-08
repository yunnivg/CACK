require("const_define")
require("define\\sysinfo_define")
require("define\\object_type_define")
require("define\\request_type")
require("share\\server_custom_define")
require("share\\chat_define")
require("util_gui")
require("util_move")
require("util_functions")
require("util_static_data")
require("auto_tools\\tool_libs")
require("form_stage_main\\form_battlefield\\battlefield_define")
require("share\\client_custom_define")

local auto_is_running = false

-- Các hằng
local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"

local RELIVE_TYPE_BATTLEFIELD = 10

local CLIENT_SUBMSG_REQUEST_ENTER = 1
local CLIENT_SUBMSG_REQUEST_LEAVE = 2
local CLIENT_SUBMSG_REQUEST_LOOK = 3
local CLIENT_SUBMSG_QUERY_FORCE_INFO = 4

-- Định nghĩa thông số
local BATTLEFIELD_RULE = 1
local BATTLEFIELD_ID = "6X6_gmp"
local BATTLEFIELD_PLAY_WAY = 10

-- Tọa độ đi tìm đối thủ
-- Xen kẽ lẫn nhau
local MAP_POSITIONS = {
    [1] = {1819.277, -6.534, 1472.857},
    [2] = {1826.752, -7.416, 1527.274},
    [3] = {1819.277, -6.534, 1472.857},
    [4] = {1789.510, -9.231, 1508.909},
    [5] = {1819.277, -6.534, 1472.857},
    [6] = {1788.161, -12.216, 1475.327},
    [7] = {1819.277, -6.534, 1472.857},
    [8] = {1779.739, -9.231, 1443.583},
    [9] = {1819.277, -6.534, 1472.857},
    [10] = {1810.286, -7.416, 1415.427},
    [11] = {1819.277, -6.534, 1472.857},
    [12] = {1843.059, -7.416, 1411.393},
    [13] = {1819.277, -6.534, 1472.857},
    [14] = {1886.074, -3.916, 1461.000},
    [15] = {1819.277, -6.534, 1472.857},
    [16] = {1859.054, -7.416, 1520.097}
}

local TOTAL_BATTLE = 1
local IS_FLASH_ON_END = true

-- Nếu không tự tìm đường được thì bỏ qua đối thủ
-- Sau khi chết sẽ reset lại giá trị này
local dissMissPlayerID = {}

-- Lấy trạng thái của chiến trường
-- Lỗi trả về nil
function getBattlefieldState()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nil
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return nil
    end
    return client_player:QueryProp("BattlefieldState")
end

-- Lấy trạng thái sống hay chết
function getPlayerLogicState()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nil
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return nil
    end
    return client_player:QueryProp("LogicState")
end

-- Xác định đối thủ
function getCompetitor()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nx_null(), nx_null()
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return nx_null(), nx_null()
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return nx_null(), nx_null()
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return nx_null(), nx_null()
    end
    -- Nếu bị chết rồi thì thôi không đánh
    if player_client:QueryProp("HPRatio") <= 0 then
        return nx_null(), nx_null()
    end
    local fight = nx_value("fight")
    if not nx_is_valid(fight) then
        return nx_null(), nx_null()
    end
    -- Khoảng cách ngắn nhất hiện tại
    local nearestCompetitor = 9999
    -- ID của đối thủ
    local currentCopetitorID = nil
        
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                local can_attack = fight:CanAttackPlayer(player_client, obj)
                if obj:QueryProp("Type") == 2 and can_attack and (obj:QueryProp("HPRatio") > 0 or obj:QueryProp("MPRatio") > 0) and (not in_array(obj.Ident, dissMissPlayerID) or getCompetitorDistance(visualObj) <= 4) then
                    -- Chỉ đánh khi đối thủ chưa hết HP hoặc MP
                    -- Tìm đối thủ gần nhất
                    local distance = getCompetitorDistance(visualObj)
                    if distance < nearestCompetitor then
                        currentCopetitorID = obj.Ident
                        nearestCompetitor = distance
                    end
                end
            end
        end
    end
    if currentCopetitorID ~= nil then
        local obj = game_client:GetSceneObj(currentCopetitorID)
        local vobj = game_visual:GetSceneObj(currentCopetitorID)
        if nx_is_valid(obj) and nx_is_valid(vobj) then
            return obj, vobj
        end
    end
    return nx_null(), nx_null()
end

-- Nhận thưởng, nếu nhận thưởng thành công trả về true nếu không có form nhận thưởng trả về false
function captureAllReward()
    local form = nx_value("form_stage_main\\form_battlefield\\form_battlefield_reward")
    if not nx_is_valid(form) or form.Visible ~= true then
        return false
    end
    nx_pause(0.05)
    local form = nx_value("form_stage_main\\form_battlefield\\form_battlefield_reward")
    if nx_is_valid(form) and form.Visible == true then
        nx_execute("form_stage_main\\form_xmqy_detail", "on_btn_gain_all_click", form.btn_gain)
        nx_pause(0.2)
        local form = nx_value("form_stage_main\\form_battlefield\\form_battlefield_reward")
        if nx_is_valid(form) and form.Visible == true then
            if form.imagegrid_normal:IsEmpty(nx_int(0)) then
                local module = nx_value("form_plate_award_logic")
                if nx_is_valid(module) then
                    module:SubmitRequest(form, form.btn_close, 5, 0)
                    nx_pause(0.2)
                    logToForm("Nhặt thưởng")
                    return true
                end
            end
        end
    end
    return false
end

-- Nhấp vào đối thủ, nếu đã chọn trả về true, nếu chưa thì nhấp vào trả về false
function setTargetCompetitor(obj)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false
    end
    local player_client = game_client:GetPlayer()
    if not nx_is_valid(player_client) then
        return false
    end
    if not nx_is_valid(obj) then
        return false
    end
    local selObjID = player_client:QueryProp("LastObject")
    local selObj = game_client:GetSceneObj(nx_string(selObjID))
    if nx_is_valid(selObj) and selObj.Ident == obj.Ident then
        return true
    else
        nx_execute("custom_sender", "custom_select", obj.Ident)
    end
    return false
end

-- Xác đinh khoảng cách của đối thủ
function getCompetitorDistance(vobj)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return 9999
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return 9999
    end
    if not nx_is_valid(vobj) then
        return 9999
    end
    local objX = vobj.PositionX
    local objZ = vobj.PositionZ
    local pxd = objX - game_player.PositionX
    local pzd = objZ - game_player.PositionZ
    local distance = math.sqrt(pxd * pxd + pzd * pzd)
    return distance
end

-- Di chuyển tới vị trí
-- Nếu trigger di chuyển thì trả về false
-- Nếu không trigger thì trả về true
function tools_move_new(scene, x, y, z, passtest)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return true
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return true
    end
    if passtest ~= nil and passtest == true then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu tìm đường"))
        nx_value("path_finding"):FindPathScene(scene, x, y, z, 0)
        return false
    end
    local beforeX = string.format("%.3f", game_player.PositionX)
    local beforeY = string.format("%.3f", game_player.PositionY)
    local beforeZ = string.format("%.3f", game_player.PositionZ)
    nx_pause(0.4)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return true
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return true
    end    
    local afterX = string.format("%.3f", game_player.PositionX)
    local afterY = string.format("%.3f", game_player.PositionY)
    local afterZ = string.format("%.3f", game_player.PositionZ)

    local pxd = beforeX - afterX
    local pyd = beforeY - afterY
    local pzd = beforeZ - afterZ

    local distance = math.sqrt(pxd * pxd + pyd * pyd + pzd * pzd)
    if distance <= 0.6 then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Bắt đầu tìm đường"))
        nx_value("path_finding"):FindPathScene(scene, x, y, z, 0)
        return false
    end
    return true
end

-- Tự tử
function suicidePlayer()
    if get_buff_info("buf_riding_01") ~= nil then
        nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
        nx_pause(0.2)
    end
    if get_buff_info("buf_CS_jh_tmjt06") == nil then
        local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
        if not nx_is_valid(form) then
            return false
        end
        local grid = form.grid_shortcut_2
        local gindex = 7
        
        grid:SetSelectItemIndex(nx_int(gindex))
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_useitem", grid, gindex, true)
        
        nx_pause(4)
        
        local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
        if not nx_is_valid(form) then
            return false
        end
        local grid = form.grid_shortcut_ng
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_lmouse_click", grid, 0)
        
        nx_pause(3)
        
        local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
        if not nx_is_valid(form) then
            return false
        end
        local grid = form.grid_shortcut_ng
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_lmouse_click", grid, 1)
    end
end

local last_loading_time = 0
local num_repeated = 0

-- Thời điểm bắt đầu vào chiến trường, quá 20s mới bắt đầu kiểm tra map
local timeStartJoin = 0
-- Chờ nhặt phần thưởng: Thời gian bắt đầu rời chiến trường
local waitForReward = 0
-- Lần cuối báo danh vào chiến trường
local lastRequestJoin = 0
-- Đang tự tử thì chỉ chờ chết thôi
-- Reset lại nếu đã chết
local is_suicidal = false
-- Số lần trigger di chuyển
-- Reset lại nếu chết hoặc di chuyển tới đối thủ và đánh SML
local direct_run_count = 0
-- Điểm hiện tại
local current_position = 1
-- Di chuyển ngay
local direct_run = true
-- Đối thủ cuối
local lastCompetitorID = ""
-- Số trận hiện tại
local current_battle = 1
-- Tọa độ 2D lần trước của đối thủ
local lastCompetitorPos = {-9999, -9999}

-- Reset lại tọa độ đứng trước đó của đối thủ
function resetLastCompetitorPos()
    lastCompetitorPos = {-9999, -9999}
end

-- Kiểm tra đối thủ di chuyển quá 5 mét so với vị trí cũ
function isCompetitorMoved(vobj)
    if not nx_is_valid(vobj) then
        return false
    end
    local currentX = string.format("%.3f", vobj.PositionX)
    local currentZ = string.format("%.3f", vobj.PositionZ)

    local pxd = currentX - lastCompetitorPos[1]
    local pzd = currentZ - lastCompetitorPos[2]

    local distance = math.sqrt(pxd * pxd + pzd * pzd)
    if distance > 5 then
        return true
    end
    return false
end

---------------------------------------
-- Khởi chạy auto
-- 
function run_this_auto()
    -- Reset lại tất cả các biến về mặc định
    local last_loading_time = 0
    local num_repeated = 0
    local timeStartJoin = 0
    local waitForReward = 0
    local lastRequestJoin = 0
    local is_suicidal = false
    local direct_run_count = 0
    local current_position = 1
    local direct_run = true
    local lastCompetitorID = ""
    local current_battle = 1
    local lastCompetitorPos = {-9999, -9999}

    -- Click 1 cai thi chay, click cai nua thi dung
	if not auto_is_running then
		auto_is_running = true
		
		while auto_is_running == true do
            clearLogForm()
            
            -- Nếu đang load thì dừng 15s chờ load
            local stage_main_flag = nx_value("stage_main")
            local loading_flag = nx_value("loading")
            if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                last_loading_time = os.time()
            end
            if tools_difftime(last_loading_time) > 6 then
                if tools_difftime(timeStartJoin) > 20 then
                    if get_current_map() == "battle_gmp" then
                        -- MAP chiến trường cổ mộ
                        logToForm("Trong map chiến trường")
                        logToForm(nx_function("ext_utf8_to_widestr", "Số trận đang đánh: ") .. nx_widestr(current_battle), true)
                        
                        -- Reset lại thời điểm vào
                        timeStartJoin = 0
                        -- Thiết lập lại lần cuối báo danh
                        lastRequestJoin = 0
        
                        -- Nếu chết thì trị thương lân cận
                        local isPlayerDie = false
                        -- Logic: 1 chiến đấu, 0 thu vũ khí, 2 giương vũ khí, 120 chết hẳn, 121 là chết còn mana
                        local logicPlayer = getPlayerLogicState()
                        if logicPlayer == 120 then
                            logToForm("Chết ngắt! Trị thương lân cận.")
                            nx_execute("custom_sender", "custom_relive", RELIVE_TYPE_BATTLEFIELD)
                            -- Dừng 10s chờ map load
                            nx_pause(10)
                            dissMissPlayerID = {}
                            direct_run_count = 0
                            is_suicidal = false
                            isPlayerDie = true
                        end
                        
                        -- Nếu kết thúc thì rời chiến trường
                        local isBattlefieldEnd = false
                        if get_buff_info("buff_battlefield_lock") ~= nil then
                            logToForm("Chiến trường bắt đầu kết thúc")
                            nx_pause(3)
                            -- Dừng 3 giây kiểm tra lại buff
                            if get_buff_info("buff_battlefield_lock") ~= nil then
                                logToForm("Rời chiến trường")
                                isBattlefieldEnd = true
                            end
                        end
                        if isBattlefieldEnd then
                            -- Tăng số trận chiến lên
                            current_battle = current_battle + 1
                            
                            -- Đánh dấu thời gian rời chiến trường
                            waitForReward = os.time()
                            
                            -- Bắt rầu rời chiến trường
                            nx_execute("custom_sender", "custom_battlefield", CLIENT_SUBMSG_REQUEST_LEAVE)
                            
                            -- Dừng 3s để mất cái buff đi
                            nx_pause(3)
                        elseif not isPlayerDie and logicPlayer ~= 121 then
                            -- Trong trận chiến
                            -- Không chết, không ngáp ngư
                            
                            -- Xác định đối thủ rồi chạy đến
                            local competitor, vcompetitor = getCompetitor()
                            if nx_is_valid(competitor) and nx_is_valid(vcompetitor) then
                                logToForm(nx_function("ext_utf8_to_widestr", "Đối thủ: ") .. nx_widestr(competitor:QueryProp("Name")), true)
                                -- Đổi đối thủ thì phải chủ động chạy
                                if lastCompetitorID ~= competitor.Ident then
                                    lastCompetitorID = competitor.Ident
                                    direct_run = true
                                end
                                -- Có đối thủ thì không tự tử nữa
                                is_suicidal = false
                                -- Target vào đối thủ
                                if setTargetCompetitor(competitor) then
                                    local checkDistance = getCompetitorDistance(vcompetitor)
                                    if checkDistance <= 4 then
                                        logToForm("Đang đánh đối thủ")
                                        -- Đến gần đối thủ 4 mét thì đánh
                                        direct_run_count = 0
                                        direct_run = true
                                        killCompetitor(competitor)
                                    elseif nx_is_valid(competitor) and nx_is_valid(vcompetitor) then
                                        -- Kiểm tra vị trí của đối thủ so với trước đó
                                        -- Nếu đối thủ di chuyển quá 5 mét thì đổi hướng
                                        if isCompetitorMoved() then
                                            logToForm("Đối thủ đang di chuyển, chạy lại")
                                            -- Di chuyển ngay lập tức
                                            -- Khi ép di chuyển thì tất nhiên bộ đếm lượt di chuyển sẽ không bị tăng lên.
                                            direct_run = true
                                            -- Đặt lại vị trí của đối thủ
                                            lastCompetitorPos[1] = vcompetitor.PositionX
                                            lastCompetitorPos[2] = vcompetitor.PositionZ
                                        end
                                        if nx_is_valid(competitor) and nx_is_valid(vcompetitor) then
                                            logToForm("Đang lại gần đối thủ")
                                            local checkrun = tools_move_new(get_current_map(), vcompetitor.PositionX, vcompetitor.PositionY, vcompetitor.PositionZ, direct_run)
                                            direct_run = false
                                            if checkrun == false then
                                                direct_run_count = direct_run_count + 1
                                            end
                                            if direct_run_count >= 20 and nx_is_valid(competitor) then
                                                -- Nếu không tìm đường được thì bỏ đối thủ này
                                                table.insert(dissMissPlayerID, competitor.Ident)
                                            end
                                        end
                                    end
                                end
                            else
                                -- Nếu trước đó có đối thủ và mất đối thủ
                                -- Hoặc bỏ qua đối thủ thì thiết lập lại số di chuyển
                                if lastCompetitorID ~= "" then
                                    direct_run_count = 0
                                    direct_run = true
                                    is_suicidal = false
                                end
                                -- Reset lại đối thủ
                                lastCompetitorID = ""
                                
                                -- Nếu không xác định được đối thủ thì di chuyển lần lượt các điểm
                                local pos = MAP_POSITIONS[current_position]
                                if not tools_move_isArrived2D(pos[1], pos[2], pos[3]) then
                                    -- Đang tự tử thì không di chuyển nữa để tránh việc nó lên ngựa
                                    if is_suicidal == false then
                                        logToForm("Đang đi tìm đối thủ")
                                        logToForm(nx_function("ext_utf8_to_widestr", "Tọa độ đến: ") .. nx_widestr(nx_int(pos[1])) .. nx_widestr(", ") .. nx_widestr(nx_int(pos[3])), true)
                                        local checkrun = tools_move_new(get_current_map(), pos[1], pos[2], pos[3], direct_run)
                                        direct_run = false
                                        if checkrun == false then
                                            direct_run_count = direct_run_count + 1
                                        end
                                    else
                                        -- Tự tử
                                        logToForm("Không tìm đường được, tự tử")
                                        suicidePlayer()
                                    end
                                    if direct_run_count >= 20 then
                                        is_suicidal = true
                                    end
                                else
                                    -- Đến điểm rồi thì reset các thông tin
                                    direct_run_count = 0
                                    current_position = current_position + 1
                                    if current_position > table.getn(MAP_POSITIONS) then
                                        current_position = 1
                                    end
                                    direct_run = true
                                end
                            end
                        end
                    else
                        logToForm("Không trong chiến trường")
                    
                        -- MAP thường thì
                        resetSkillData()
                        lastCompetitorID = ""
                        direct_run = true
                        direct_run_count = 0
                        is_suicidal = false
                        
                        -- Kiểm tra xem nhận thưởng không
                        local checkReward = captureAllReward()
                        if checkReward then
                            -- Nếu có nhận thưởng rồi thì set thời gian chờ nhận thưởng về 0
                            waitForReward = 0
                        end
                        
                        -- Chấp nhận vào chiến trường
                        local startedAcceptBatt = false
                        local num_request = nx_execute(FORM_MAIN_REQUEST, "get_num_request")
                        if num_request > 0 then
                            for i = 1, num_request do
                                local request_type = nx_execute(FORM_MAIN_REQUEST, "get_request_type", i)
                                local request_player = nx_execute(FORM_MAIN_REQUEST, "get_request_player", i)
                                if request_type == REQUESTTYPE_BATTLEFIELD_SWITCH then
                                    local game_visual = nx_value("game_visual")
                                    if nx_is_valid(game_visual) then
                                        startedAcceptBatt = true
                                        lastRequestJoin = 0
                                        timeStartJoin = os.time()
                                        game_visual:CustomSend(nx_int(CLIENT_CUSTOMMSG_REQUEST_ANSWER), nx_int(request_type), request_player, nx_int(1))
                                        nx_execute(FORM_MAIN_REQUEST, "clear_request")
                                        logToForm("Chấp nhận lời mời vào chiến trường")
                                        break
                                    end
                                end
                            end
                        end
                        
                        -- Kiểm tra xem cái form kết quả có hiện lên không
                        -- Nếu đã nhận thưởng hoặc thời gian chờ nhận thưởng vượt quá 60s
                        -- Nếu chưa chấp nhận vào chiến trường thì
                        -- Báo danh chiến trường
                        if not startedAcceptBatt and tools_difftime(lastRequestJoin) > 10  and tools_difftime(waitForReward) > 60 then
                            local battlefield_state = getBattlefieldState()
                            if battlefield_state ~= nil and not (battlefield_state > 0 and 4 ~= battlefield_state) then
                                if current_battle > TOTAL_BATTLE then
                                    -- Đánh đủ số lần set
                                    if IS_FLASH_ON_END then
                                        -- Flash game
                                        nx_function("ext_flash_window")
                                    end
                                    logToForm("Đã đánh xong. Auto kết thúc")
                                    auto_is_running = false
                                else
                                    nx_execute("custom_sender", "custom_battlefield", CLIENT_SUBMSG_REQUEST_ENTER, ENTER_MODE_SINGLE, BATTLEFIELD_ID, BATTLEFIELD_RULE, BATTLEFIELD_PLAY_WAY, SIDE_NORMAL, "", "")
                                    lastRequestJoin = os.time()
                                end
                            end
                        else
                            logToForm("Đang chờ nhận thưởng hoặc đang chờ hệ thống sằn sàng để báo danh")
                        end
                    end
                else
                    logToForm("Đang chờ chiến trường sẵn sàng")
                end
            else
                logToForm("Đang chờ hệ thống sẵn sàng")
            end
            
            nx_pause(0.1)
        end
	else
		auto_is_running = false
	end
end

-------------------------
-- Hỏi thiết lập bao nhiêu trận đánh trước khi chạy
-- 
function auto_init()
    if auto_is_running then
        -- Nếu đang chạy click cái nữa thì dừng
        auto_is_running = false
        logToForm("Auto chiến trường đã dừng")
        return
    end
    local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_inputbox", true, false)
    dialog.info_label.Text = nx_function("ext_utf8_to_widestr", "Nhập số trận đánh")
    dialog.name_edit.Text = nx_widestr("1")
    dialog:ShowModal()
    local res, text = nx_wait_event(100000000, dialog, "input_box_return")
    if res == "ok" then
        TOTAL_BATTLE = nx_number(text)
        run_this_auto()
    end
end
