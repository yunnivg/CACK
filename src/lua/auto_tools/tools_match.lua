require("const_define")
require("define\\sysinfo_define")
require("define\\request_type")
require("share\\server_custom_define")
require("share\\chat_define")
require("util_gui")
require("util_move")
require("util_functions")
require("util_static_data")
require("auto_tools\\tool_libs")

local FORM_MAIN_REQUEST = "form_stage_main\\form_main\\form_main_request"

-- Kiểm tra hiển thị thanh phím tắt nội công
function checkShortcutInnerForce()
    local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
    if not nx_is_valid(form) then
        return true
    end
    local grid = form.grid_shortcut_ng
    if not nx_is_valid(grid) then
        return true
    end
    if grid.Visible == false then
        return false
    end
    return true
end

-- Nếu không phải đang xài nội thấp thì set rồi trả về true
-- Còn lại thì trả về false
function setLowInnerForce()
    local form = nx_value("form_stage_main\\form_main\\form_main_shortcut")
    if not nx_is_valid(form) then
        return false
    end
    local grid = form.grid_shortcut_ng
    if not nx_is_valid(grid) then
        return false
    end
    if grid:GetItemCoverImage(0) == "" then
        nx_execute("form_stage_main\\form_main\\form_main_shortcut", "on_main_shortcut_lmouse_click", grid, 0)
        return true
    end
    return false
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
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                local can_attack = fight:CanAttackPlayer(player_client, obj)
                if obj:QueryProp("Type") == 2 and can_attack and obj:QueryProp("HPRatio") > 0 then
                    -- Chỉ đánh khi đối thủ chưa hết HP
                    return obj, visualObj
                end
            end
        end
    end
    return nx_null(), nx_null()
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

-- Đi theo đối thủ nếu khoảng cách quá 2.5 mét
function callTradeCompetitor(vobj)
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false
    end
    local game_player = game_visual:GetPlayer()
    if not nx_is_valid(game_player) then
        return false
    end
    if not nx_is_valid(vobj) then
        return false
    end
    local objX = vobj.PositionX
    local objZ = vobj.PositionZ
    local pxd = objX - game_player.PositionX
    local pzd = objZ - game_player.PositionZ
    local distance = math.sqrt(pxd * pxd + pzd * pzd)
    if distance > 3 then
        if not is_moving() then
            nx_execute("form_stage_main\\form_main\\form_main_select", "on_select_photo_box_click")
        end
        return false
    end
    return true
end

-- Nếu trả về true thì đánh false thì afk
function getPkModeProcess(obj)
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
    if player_client:QueryProp("RevengeIntegral") < obj:QueryProp("RevengeIntegral") then
        return true
    end
    return false
end

function get_player()
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return nx_null()
    end
    local client_player = game_client:GetPlayer()
    if not nx_is_valid(client_player) then
        return nx_null()
    end
    return client_player
end

function selectSkillBook()
    local form = nx_value("form_stage_main\\form_match\\form_taolu_confirm")
    if not nx_is_valid(form) or form.Visible ~= true then
        return false
    end
    nx_pause(0.05)
    local form = nx_value("form_stage_main\\form_match\\form_taolu_confirm")
    if nx_is_valid(form) and form.Visible == true then
        nx_execute("form_stage_main\\form_match\\form_taolu_confirm", "on_btn_submit_click", form.btn_submit)
        nx_pause(0.05)
    end
end

function closeResult1()
    local form = nx_value("form_stage_main\\form_match\\form_revenge_sub_end")
    if not nx_is_valid(form) or form.Visible ~= true then
        return false
    end
    nx_pause(0.05)
    local form = nx_value("form_stage_main\\form_match\\form_revenge_sub_end")
    if nx_is_valid(form) and form.Visible == true then
        nx_execute("form_stage_main\\form_match\\form_revenge_sub_end", "on_btn_close_click", form.btn_close)
        nx_pause(0.05)
    end
end

function closeResult2()
    local form = nx_value("form_stage_main\\form_match\\form_revenge_all_end")
    if not nx_is_valid(form) or form.Visible ~= true then
        return false
    end
    nx_pause(0.05)
    local form = nx_value("form_stage_main\\form_match\\form_revenge_all_end")
    if nx_is_valid(form) and form.Visible == true then
        nx_execute("form_stage_main\\form_match\\form_revenge_all_end", "on_btn_close_click", form.btn_close)
        nx_pause(0.05)
    end
end

function captureAllReward()
    local form = nx_value("form_stage_main\\form_match\\form_match_Weekreward")
    if not nx_is_valid(form) or form.Visible ~= true then
        return false
    end
    nx_pause(0.05)
    local form = nx_value("form_stage_main\\form_match\\form_match_Weekreward")
    if nx_is_valid(form) and form.Visible == true then
        nx_execute("form_stage_main\\form_xmqy_detail", "on_btn_gain_all_click", form.btn_gain)
        nx_pause(0.2)
        local form = nx_value("form_stage_main\\form_match\\form_match_Weekreward")
        if nx_is_valid(form) and form.Visible == true then
            if form.imagegrid_normal:IsEmpty(nx_int(0)) then
                local module = nx_value("form_plate_award_logic")
                if nx_is_valid(module) then
                    module:SubmitRequest(form, form.btn_close, 5, 0)
                    nx_pause(0.2)
                    return true
                end
            end
        end
    end
    return false
end

local auto_is_running = false

function auto_init()
    local last_loading_time = 0
    local num_repeated = 0
    -- Đã bắt đầu phân phối, đã bắt đầu thì tắt cái form 
    local startedRequestJoin = false
    -- Thời điểm bắt đầu vào thiên thê, quá 20s mới bắt đầu kiểm tra map
    local timeStartJoin = 0
    -- Chờ nhặt phần thưởng
    local waitForReward = false

    if not checkShortcutInnerForce() then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Vui lòng hiện thanh phím tắt nội công, xếp nội công thấp vào ô số 1, nội công cao vào ô số 2"), 2)
        auto_is_running = false
        return false
    end
	
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
                selectSkillBook()
                closeResult1()
                closeResult2()
                local checkCapture = captureAllReward()
                if checkCapture then
                    waitForReward = false
                end
                if tools_difftime(timeStartJoin) > 20 then
                    if get_current_map() == "fight08" then
                        logToForm("MAP thiên thê")
                    
                        -- MAP thiên thê:
                        -- Reset lại thời điểm vào
                        timeStartJoin = 0
                        -- Reset lại thông tin bắt đầu phân phối
                        startedRequestJoin = false
                        -- Thiết lập chờ nhặt phần thưởng
                        waitForReward = true
                        -- Xác định đối thủ
                        local competitor, vcompetitor = getCompetitor()
                        if nx_is_valid(competitor) then
                            -- true thì đánh, false thì afk
                            if getPkModeProcess(competitor) then
                                logToForm("Đối thủ có điểm thiên thê cao hơn. Đánh!")
                                if setTargetCompetitor(competitor) then
                                    local checkDistance = callTradeCompetitor(vcompetitor)
                                    if checkDistance then
                                        killCompetitor(competitor)
                                    end
                                end
                            else
                                -- AFK và chuyển nội
                                logToForm("Đối thủ có điểm thiên thê thấp hơn. Đứng AFK")
                                setLowInnerForce()
                            end
                        else
                            logToForm("Đang chờ đối thủ")
                        end
                    else
                        logToForm("Không phải MAP thiên thê. Vui lòng không tắt các cửa sổ báo danh thiên thê tự động hiện ra.")
                        
                        -- MAP thường thì
                        resetSkillData()
                        -- Nếu đã bắt đầu mời thì tắt cái form đi
                        if startedRequestJoin then
                            local form = nx_value("form_stage_main\\form_general_info\\form_general_info_main")
                            if nx_is_valid(form) and form.Visible == true then
                                nx_execute("form_stage_main\\form_general_info\\form_general_info_main", "on_btn_close_click", form.btn_close)
                                nx_pause(0.1)
                            end
                        end
                        -- Có lời mời
                        local num_request = nx_execute(FORM_MAIN_REQUEST, "get_num_request")
                        local isAccepttedRequest = false
                        if num_request > 0 then
                            for i = 1, num_request do
                                local request_type = nx_execute(FORM_MAIN_REQUEST, "get_request_type", i)
                                local request_player = nx_execute(FORM_MAIN_REQUEST, "get_request_player", i)
                                if request_type == REQUESTTYPE_EGWAR then
                                    -- Chấp nhận lời mời vào thiên thê
                                    local egwar = nx_value("EgWarModule")
                                    if nx_is_valid(egwar) then
                                        isAccepttedRequest = true
                                        nx_execute("custom_sender", "custom_egwar_trans", 1, egwar.CrossServerID, egwar.WarName, egwar.RuleIndex, egwar.WarSceneID, egwar.SubRound, egwar.StartTime)
                                        break
                                    end
                                end
                            end
                        end
                        if isAccepttedRequest == true then
                            logToForm("Chấp nhận vào thiên thê")
                            nx_execute(FORM_MAIN_REQUEST, "clear_request")
                            timeStartJoin = os.time()
                            nx_pause(1)
                        else
                            -- Không có lời mời thì bắt đầu phân phối
                            local form = nx_value("form_stage_main\\form_match\\form_match")
                            if nx_is_valid(form) and form.Visible == true then
                                logToForm("Đang báo danh!")
                                if form.matchType == 13 then
                                    -- Lấy số lần tham gia
                                    local jointimes = util_split_wstring(form.lbl_jointimes.Text, nx_widestr("/"))
                                    if nx_int(jointimes[1]) < nx_int(jointimes[2]) and form.btn_room.Enabled == true then
                                        if nx_widestr("@ui_revenge_join_room") == nx_widestr(form.btn_room.Text) then
                                            -- Vào phòng nếu chưa vào
                                            nx_execute("form_stage_main\\form_match\\form_match", "on_btn_room_click", form.btn_room)
                                            nx_pause(0.2)
                                        elseif form.btn_match.Enabled == true and form.btn_match.Text == nx_widestr("@ui_revenge_join") then
                                            -- Bắt đầu phân phối 
                                            nx_execute("form_stage_main\\form_match\\form_match", "on_btn_match_click", form.btn_match)
                                            nx_pause(0.2)
                                            startedRequestJoin = true
                                        end
                                    else
                                        auto_is_running = false
                                        logToForm("Đã đi hết số lần. Auto tự kết thúc")
                                    end
                                else
                                    logToForm("Đang chọn thiên thê đơn")
                                    -- Chọn thiên thê lôi đài
                                    local tree = form.tree_job
                                    local node_list = tree:GetAllNodeList()
                                    for i = 1, table.getn(node_list) do
                                        local node = node_list[i]
                                        if nx_find_custom(node, "search_name") and node.search_name == "revenge_match" then
                                            tree.SelectNode = node
                                        end
                                    end
                                    nx_pause(0.3)
                                end
                            elseif startedRequestJoin == false and not waitForReward then
                                -- Mở form lên
                                logToForm("Mở cửa sổ báo danh thiên thê")
                                local funcbtns = nx_value("form_main_func_btns")
                                if nx_is_valid(funcbtns) then
                                    local form_path = funcbtns:GetBtnFormByName("btn_palyer_general_info")
                                    if form_path ~= "" then
                                        nx_execute(form_path, "open_form")
                                        nx_pause(1)
                                    end
                                end
                            else
                                logToForm("Đã báo danh, đang chờ trận thiên thê.")
                            end
                        end
                    end
                else
                    logToForm("Đang chờ thiên thê sẵn sàng")
                end
            else
                logToForm("Đang chờ hệ thống load xong và sẵn sàng")
            end
            nx_pause(0.2)
        end
	else
		auto_is_running = false
		logToForm("Kết thúc auto!")
	end
end
