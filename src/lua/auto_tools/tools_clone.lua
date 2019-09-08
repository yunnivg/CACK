require("const_define")
require("util_gui")
require("util_move") -- Xac dinh toa do distance3d
require("util_static_data")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("define\\request_type")
require("auto_tools\\tool_libs")
require("define\\object_type_define")

local THIS_FORM = "auto_tools\\tools_clone"
local auto_is_runing_boss1nmq = false -- Boss 1 NMQ
local auto_is_runing_boss2nmq = false -- Boss 2 NMQ
local auto_is_runing_boss3nmq = false -- Boss 3 NMQ
local auto_is_runing_boss4nmq = false -- Boss 4 NMQ
local auto_is_runing_boss5nmq = false -- Boss 5 NMQ
local auto_is_runing_autoclick = false

-----------------
-- Xác định khoảng cách
-- 
function getDistanceWithObj(pos, vobj)
    if not nx_is_valid(vobj) then
        return 0
    end
    local px = string.format("%.3f", vobj.PositionX)
    local py = string.format("%.3f", vobj.PositionY)
    local pz = string.format("%.3f", vobj.PositionZ)

    local pxd = px - pos[1]
    local pyd = py - pos[2]
    local pzd = pz - pos[3]

    return math.sqrt(pxd * pxd + pzd * pzd)
end

function auto_run_autoclick()
    -- Đối tượng sẽ nhấp chọn tiếu theo
    local selectOffset = 0
    -- Khoảng cách lớn nhất sẽ nhấp
    local clickMaxDistance = 8

    while auto_is_runing_autoclick == true do
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end

        -- Nếu dữ liệu ok hết
        if is_vaild_data == true then
            form.mltbox_content:Clear()
            -- Số đối tượng trong phạm vi click
            local currentObj = 0
            local game_scence_objs = game_scence:GetSceneObjList()
            local fight = nx_value("fight")
            for i = 1, table.getn(game_scence_objs) do
                local obj = game_scence_objs[i]
                if nx_is_valid(obj) then
                    local visualObj = game_visual:GetSceneObj(obj.Ident)
                    if nx_is_valid(visualObj) then
                        local pxd = game_player.PositionX - visualObj.PositionX
                        local pzd = game_player.PositionZ - visualObj.PositionZ
                        local distance = math.sqrt(pxd * pxd + pzd * pzd)
                        if distance <= clickMaxDistance and ((obj:QueryProp("Type") == 2 and obj:QueryProp("Name") ~= player_client:QueryProp("Name")) or (obj:QueryProp("Type") == 4 and fight:CanAttackNpc(player_client, obj))) then
                            local objName = nil
                            if obj:QueryProp("Type") == 2 then
                                objName = obj:QueryProp("Name")
                            else
                                objName = util_text(nx_string(obj:QueryProp("ConfigID")))
                            end
                            if selectOffset == currentObj then
                                nx_execute("custom_sender", "custom_select", obj.Ident)
                                nx_pause(0.2)
                                if nx_is_valid(visualObj) and nx_is_valid(obj) then
                                    nx_execute("custom_sender", "custom_select", obj.Ident)
                                end
                                if nx_is_valid(form) then
                                    form.mltbox_content:AddHtmlText(nx_widestr("<font color=\"#12bc00\">") .. objName .. nx_widestr("</font>"), -1)
                                end
                            else
                                if nx_is_valid(form) then
                                    form.mltbox_content:AddHtmlText(objName, -1)
                                end
                            end
                            currentObj = currentObj + 1
                        end
                    end
                end
            end
            selectOffset = selectOffset + 1
            if selectOffset >= currentObj then
                selectOffset = 0
            end
        end
        
        nx_pause(0.3)
    end
end

-----------------------------------
-- Auto đánh boss 1 NMQ Phản Quân
-- 
function auto_run_boss1nmq()
    -- Vị trí giữa dùng để tính xem có văng đi xa quá không
    local centerPos = {670.893, -46.875, 749.375}
    -- Đánh thông thường chỉ đánh skill số 0, 1 và 2: Tu La Hủ Cốt, Âm Hồn Xuất Khiếu và Huyền Độc Hỏa Mộc
    local currentSkillIndex = 1
    -- Tọa độ sau lưng boss khi nó đánh Kính Đào Hải Lãng
    local posBehindBoss = nil
    
    --[[
    Clone004_cz_01  =   U Sơn Cùng Áo
    Clone004_cz_02  =   Lạc Sơn Cực Huyền
    ]]--
    
    resetSkillData()
    
    while auto_is_runing_boss1nmq == true do
        clearLogForm()
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
            -- Xác định thời gian mili giây
            local msg_delay = nx_value("MessageDelay")
            local currentMiniSec = msg_delay:GetServerNowTime()
        
            -- Ghi trạng thái nhân vật
            logToForm(nx_widestr("State: ") .. nx_widestr(game_player.state), true)
            local selObjID = player_client:QueryProp("LastObject")
            local bossObj = game_client:GetSceneObj(nx_string(selObjID))
            local bossVObj = game_visual:GetSceneObj(nx_string(selObjID))
            if nx_is_valid(bossObj) and nx_is_valid(bossVObj) then
                local currentSkill = bossObj:QueryProp("CurSkillID")
                -- Ghi ra boss xài skill nào
                if currentSkill ~= "" and currentSkill ~= nil and currentSkill ~= 0 then
                    logToForm(nx_function("ext_utf8_to_widestr", "Boss đang đánh: ") .. util_text(nx_string(currentSkill)), true)
                end
                
                -- Xử lý nếu boss ra skill U Sơn Cùng Áo
                if currentSkill == "Clone004_cz_01" then
                    -- Xác định vị trí sau lưng boss
                    if posBehindBoss == nil then
                        local xx = bossObj.DestX
                        local zz = bossObj.DestZ
                        local dst = 1.5
                        local radian = bossObj.DestOrient
                        local angle = radian_to_degree(radian)
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
                        posBehindBoss = {xx, bossObj.DestY, zz}
                    end
                else
                    posBehindBoss = nil
                end
                
                -- Tất cả các thao tác trong trạng thái static
                if game_player.state == "static" then
                    if currentSkill == "Clone004_cz_01" and not tools_move_isArrived2D(posBehindBoss[1], posBehindBoss[2], posBehindBoss[3], 0.5) then
                        -- Xử lý khi U Sơn Cùng Áo
                        -- Xác định tọa độ sau lưng boss 1 mét
                        logToForm("Nhảy ra sau lưng boss")
                        jump_to(posBehindBoss)
                        nx_pause(0.5)
                    elseif getDistanceWithObj(centerPos, game_player) > 7 then
                        -- Nếu bị văng quá xa thì chạy vào điểm giữa
                        logToForm("Cách quá xa, vào điểm giữa")
                        jump_to(centerPos)
                        nx_pause(0.2)
                    elseif getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) < 4 then
                        -- Boss không ra chiêu thì cứ thế đánh
                        -- Chỉ tanker mới đánh
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            readyDestroyParry = true
                        end
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local readyChieuNoKhi = false
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            readyChieuNoKhi = true
                        end
                        local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                        -- Kiểm tra
                        if get_buff_info("BuffInParry", bossObj) ~= nil and readyDestroyParry then
                            -- Đối thủ đỡ đòn thì phá def
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                        elseif (buffNC == nil or buffNC < 5) and readyChieuNoKhi then
                            -- Nộ khí
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                        else
                            -- Đối thủ không đỡ đòn thì đánh tự do
                            local gindex = currentSkillIndex
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            end
                            currentSkillIndex = currentSkillIndex + 1
                            if currentSkillIndex > 5 then
                                currentSkillIndex = 1
                            elseif currentSkillIndex > 2 then
                                currentSkillIndex = 5
                            end
                        end
                    end
                elseif game_player.state == "dead" then
                    auto_is_runing_boss1nmq = false
                    nx_function("ext_flash_window")
                end
            end
        end
        
        nx_pause(0.05)
    end
end

-----------------------------------
-- Auto đánh boss 2 NMQ Phản Quân
-- 
function auto_run_boss2nmq()
    --Thiết lập kiểu đánh 1 là tanker 2 là ngắt chiêu
    local setAutoMode = 1
    
    -- Vị trí số 1 đánh boss
    local postStand1 = {677.834, -47.117, 758.164}
    -- Vị trí số 2 đánh boss
    local postStand2 = {680.003, -46.919, 747.352}
    -- Vị trí giữa dùng để tính xem có văng đi xa quá không
    local centerPos = {678.451, -47.065, 752.369}
    -- Thời gian boss bắt đầu ra skill Hám Nhạc Kích
    local timeStartSkillHNK = 0
    -- Thiết lập xem có xài skill phá bối thủy chưa
    local isUsedBreakSkill = false
    -- Thiết lập xem mình có phải là người dính buff hay không
    local isMyBuffBreak = false
    -- Đánh thông thường chỉ đánh skill số 0, 1 và 2: Tu La Hủ Cốt, Âm Hồn Xuất Khiếu và Huyền Độc Hỏa Mộc
    local currentSkillIndex = 1
    -- Tọa độ sau lưng boss khi nó đánh Kính Đào Hải Lãng
    local posBehindBoss = nil
    -- Tọa độ nhảy ra khi nó đánh Sơn Hà Đoạn
    local posAvoidSHD = nil
    -- Thời điểm cảnh báo HP thấp lần trước
    local lastWarningHP = 0
    
    --[[
    Clone004_fangwuhen_01a      =Sơn Hà Đoạn
    Clone004_fangwuhen_02a      =Hám Nhạc Kích
    Clone004_fangwuhen_03a      =Lôi Đình Động
    Clone004_fangwuhen_04a      =Bối Thủy Nhất Chiến
    Clone004_fangwuhen_05a      =Kinh Đào Hải Lãng
    ]]--

    resetSkillData()
    
    while auto_is_runing_boss2nmq == true do
        clearLogForm()
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
            -- Xác định thời gian mili giây
            local msg_delay = nx_value("MessageDelay")
            local currentMiniSec = msg_delay:GetServerNowTime()
        
            -- Ghi trạng thái nhân vật
            logToForm(nx_widestr("State: ") .. nx_widestr(game_player.state), true)
            
            -- Cảnh báo nếu HP thấp hơn 40%
            if player_client:QueryProp("HPRatio") < 40 and tools_difftime(lastWarningHP) > 10 then
                nx_function("ext_flash_window")
                lastWarningHP = os.time()
            end
            
            local selObjID = player_client:QueryProp("LastObject")
            local bossObj = game_client:GetSceneObj(nx_string(selObjID))
            local bossVObj = game_visual:GetSceneObj(nx_string(selObjID))
            if nx_is_valid(bossObj) and nx_is_valid(bossVObj) then
                local currentSkill = bossObj:QueryProp("CurSkillID")
                -- Ghi ra boss xài skill nào
                if currentSkill ~= "" and currentSkill ~= nil and currentSkill ~= 0 then
                    logToForm(nx_function("ext_utf8_to_widestr", "Boss đang đánh: ") .. util_text(nx_string(currentSkill)), true)
                end
                
                -- Thời điểm ra skill Hám Nhạc Kích để canh ngắt skill
                if currentSkill == "Clone004_fangwuhen_02a" then
                    if timeStartSkillHNK == 0 then
                        timeStartSkillHNK = currentMiniSec
                    end
                else
                    timeStartSkillHNK = 0
                end
                -- Xử lý nếu boss ra bối thủy
                if currentSkill == "Clone004_fangwuhen_04a" then
                    local form_shortcut_common = nx_value("form_stage_main\\form_main\\form_main_shortcut_buff_common")
                    if nx_is_valid(form_shortcut_common) and form_shortcut_common.Visible == true then
                        isMyBuffBreak = true
                    end
                else
                    isMyBuffBreak = false
                    isUsedBreakSkill = false
                end
                -- Xử lý nếu boss ra skill Kinh Đào Hải Lãng
                if currentSkill == "Clone004_fangwuhen_05a" then
                    -- Xác định vị trí sau lưng boss
                    if posBehindBoss == nil then
                        local xx = bossObj.DestX
                        local zz = bossObj.DestZ
                        local dst = 1.5
                        local radian = bossObj.DestOrient
                        local angle = radian_to_degree(radian)
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
                        posBehindBoss = {xx, bossObj.DestY, zz}
                    end
                else
                    posBehindBoss = nil
                end
                -- Xử lý nếu boss ra Sơn Hà Đoạn
                if currentSkill == "Clone004_fangwuhen_01a" then
                    -- Xác định vị trí nhảy ra xa để tránh
                    if posAvoidSHD == nil then
                        if getDistanceWithObj(postStand1, bossVObj) > getDistanceWithObj(postStand2, bossVObj) then
                            posAvoidSHD = postStand1
                        else
                            posAvoidSHD = postStand2
                        end
                    end
                else
                    posAvoidSHD = nil
                end
                
                -- Tất cả các thao tác trong trạng thái static
                if game_player.state == "static" then
                    if currentSkill == "Clone004_fangwuhen_01a" and not tools_move_isArrived2D(posAvoidSHD[1], posAvoidSHD[2], posAvoidSHD[3], 0.3) then
                        -- Xử lý khi Sơn Hà Đoạn
                        -- 2 người cùng né
                        -- Xác định điểm xa con boss hơn
                        logToForm("Nhảy ra xa tránh boss")
                        jump_to(posAvoidSHD)
                        nx_pause(0.5)
                    elseif currentSkill == "Clone004_fangwuhen_02a" and setAutoMode == 2 then
                        -- Xử lý khi Hám Nhạc Kích
                        -- Đối với người ngắt chiêu Hám Nhạc Kích
                        local diffTime = currentMiniSec - timeStartSkillHNK
                        logToForm(nx_function("ext_utf8_to_widestr", "Lệch: ") .. nx_widestr(diffTime) .. nx_widestr("ms"), true)
                        if diffTime > 680 then
                            -- Đánh skill
                            local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
                            local form_shortcut = nx_value(FORM_SHORTCUT)
                            local grid_shortcut = form_shortcut.grid_shortcut_main
                            local game_shortcut = nx_value("GameShortcut")
                            logToForm("Ngắt Chiêu")
                            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 4, true)
                            nx_pause(0.2)
                            logToForm("Ngắt Chiêu")
                            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 4, true)
                            nx_pause(0.2)
                            logToForm("Ngắt Chiêu")
                            game_shortcut:on_main_shortcut_useitem(grid_shortcut, 4, true)
                            -- Chờ đến khi hết Hám Nhạc Kích
                            while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "Clone004_fangwuhen_02a" do
                                nx_pause(0.01)
                            end
                        end
                    elseif currentSkill == "Clone004_fangwuhen_02a" and setAutoMode == 1 then
                        -- Xử lý khi Hám Nhạc Kích
                        -- Đối với người đánh boss
                        -- Kích hoạt đỡ đòn
                        -- Chờ đến khi hết Hám Nhạc Kích
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "Clone004_fangwuhen_02a" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.4)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                    elseif currentSkill == "Clone004_fangwuhen_05a" and not tools_move_isArrived2D(posBehindBoss[1], posBehindBoss[2], posBehindBoss[3], 0.5) then
                        -- Xử lý khi Kinh Đào Hải Lãng
                        -- Cả 2 người cùng né
                        -- Xác định tọa độ sau lưng boss 1 mét
                        logToForm("Nhảy ra sau lưng boss")
                        jump_to(posBehindBoss)
                        nx_pause(0.5)
                        -- Sau khi nhảy ra sau lưng thì kiểm tra nếu ôn thần được thì ôn thần luôn chỗ này
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            logToForm("Ra Ôn Thần Tứ Giật")
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            nx_pause(0.7)
                        end
                    elseif currentSkill == "Clone004_fangwuhen_04a" and isMyBuffBreak and not isUsedBreakSkill then
                        -- Xử lý khi Bối Thủy Nhất Chiến
                        -- Cả 2 người cùng xử lý
                        logToForm("Đánh skill ngắt bối thủy")
                        nx_pause(0.5)
                        local form_shortcut_common = nx_value("form_stage_main\\form_main\\form_main_shortcut_buff_common")
                        local grid = form_shortcut_common.imagegrid_1
                        logToForm("Lần 1")
                        nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(0))
                        nx_pause(0.4)
                        logToForm("Lần 2")
                        nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(0))
                        nx_pause(0.4)
                        logToForm("Lần 3")
                        nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(0))
                        nx_pause(0.4)
                        logToForm("Lần 4")
                        nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(0))
                        nx_pause(0.4)
                        logToForm("Lần 5")
                        nx_execute("form_stage_main\\form_main\\form_main_shortcut_buff_common", "on_rightclick_grid", grid, nx_int(0))
                        -- Set cờ dùng lên 1 để không đánh nữa
                        isUsedBreakSkill = true
                    elseif currentSkill == "Clone004_fangwuhen_03a" and getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) > 1 then
                        -- Xử lý khi Lôi Đình Động
                        -- Cả 2 người cùng xử lý
                        logToForm("Nhảy lại ôm boss")
                        jump_to({bossObj.DestX, bossObj.DestY, bossObj.DestZ})
                    elseif getDistanceWithObj(centerPos, game_player) > 7 and (currentSkill == "" or  currentSkill == nil) then
                        -- Nếu bị văng quá xa thì chạy vào điểm giữa
                        -- Không nhảy nếu Lôi Đình Động đang xảy ra
                        logToForm("Cách quá xa, vào điểm giữa")
                        jump_to(centerPos)
                        nx_pause(0.2)
                    elseif setAutoMode == 1 then
                        local isNearBoss = (getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) < 4)
                    
                        -- Boss không ra chiêu thì cứ thế đánh
                        -- Chỉ tanker mới đánh
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            readyDestroyParry = true
                        end
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local readyChieuNoKhi = false
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            readyChieuNoKhi = true
                        end
                        local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                        -- Kiểm tra
                        if get_buff_info("BuffInParry", bossObj) ~= nil and readyDestroyParry and isNearBoss then
                            -- Đối thủ đỡ đòn thì phá def
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            nx_pause(0.4)
                        elseif ((buffNC == nil or buffNC < 5) or currentSkill == "Clone004_fangwuhen_01a") and readyChieuNoKhi then
                            -- Nộ khí
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            nx_pause(0.4)
                        elseif isNearBoss then
                            -- Gần boss mới đánh
                            -- Đối thủ không đỡ đòn thì đánh tự do
                            local gindex = currentSkillIndex
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                                nx_pause(0.4)
                            end
                            currentSkillIndex = currentSkillIndex + 1
                            if currentSkillIndex > 5 then
                                currentSkillIndex = 1
                            elseif currentSkillIndex > 2 then
                                currentSkillIndex = 5
                            end
                        end
                    end
                elseif game_player.state == "dead" then
                    reset_all_btns("----")
                    nx_function("ext_flash_window")
                    return false
                end
            end
        end
        
        nx_pause(0.05)
    end
end

-----------------------------------
-- Auto đánh boss 3 NMQ Phản Quân
-- 
function auto_run_boss3nmq()
    --[[
    Clone004_xc_01  =   Thương Sầm Cô Sinh
    Clone004_xc_02  =   Hùng Mang Sạ Khởi
    Clone004_xc_03  =   Phi Thái Tinh Chúc
    Clone004_xc_04  =   Dương Mã Thừa A
    ]]--
    
    resetSkillData()
    
    -- Bỏ qua đỡ đòn skill thương cầm cô sinh
    local dismissSkillTCCS = false
    -- Vị trí đứng cố định. Văng ra khỏi vị trí này thì nhảy vào
    local posStandStatic = {481.100, -77.671, -119.961}
    -- Vị trí tránh Phi Thái Tinh Chúc
    local posAvoidPhiTai1 = {474.965, -77.671, -122.377}
    local posAvoidPhiTai2 = {487.283, -77.671, -122.330}
    -- Đánh thông thường chỉ đánh skill số 0, 1 và 2: Tu La Hủ Cốt, Âm Hồn Xuất Khiếu và Huyền Độc Hỏa Mộc
    local currentSkillIndex = 1
    -- Khoảng cách lớn nhất sẽ nhấp
    local clickMaxDistance = 8
    -- Kiểu tránh Phi Thái Tinh Chúc: 1 là đỡ đòn 2 là nhảy đi chỗ khác
    local typeAvoidPhiTai = 2
    -- Vị trí sẽ tránh Phi Thái Tinh Chúc
    local posAvoidPhiTai = nil
    
    while auto_is_runing_boss3nmq == true do
        clearLogForm()
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
            -- Xác định thời gian mili giây
            local msg_delay = nx_value("MessageDelay")
            local currentMiniSec = msg_delay:GetServerNowTime()
            
            -- Kiểm tra xem có bị mê hay không
            local isStunned = (get_buff_info("buff_wyang_xuanyun") ~= nil)
        
            -- Ghi trạng thái nhân vật
            logToForm(nx_widestr("State: ") .. nx_widestr(game_player.state), true)
            
            -- Ghi log xem có bị choáng hay không
            if isStunned then
                logToForm("Đang bị choáng")
            else
                logToForm("Không bị choáng")
            end
            
            local selObjID = player_client:QueryProp("LastObject")
            local bossObj = game_client:GetSceneObj(nx_string(selObjID))
            local bossVObj = game_visual:GetSceneObj(nx_string(selObjID))
            if nx_is_valid(bossObj) and nx_is_valid(bossVObj) then
                local currentSkill = bossObj:QueryProp("CurSkillID")
                -- Ghi ra boss xài skill nào
                if currentSkill ~= "" and currentSkill ~= nil and currentSkill ~= 0 then
                    logToForm(nx_function("ext_utf8_to_widestr", "Boss đang đánh: ") .. util_text(nx_string(currentSkill)), true)
                end
                
                -- Xử lý khi boss đánh Phi Thái Tinh Chúc
                if currentSkill == "Clone004_xc_03" then
                    -- Xác định vị trí nhảy ra xa để tránh
                    if posAvoidPhiTai == nil then
                        if getDistanceWithObj(posAvoidPhiTai1, bossVObj) > getDistanceWithObj(posAvoidPhiTai2, bossVObj) then
                            posAvoidPhiTai = posAvoidPhiTai1
                        else
                            posAvoidPhiTai = posAvoidPhiTai2
                        end
                    end
                else
                    posAvoidPhiTai = nil
                end
                
                -- Tất cả các thao tác trong trạng thái static
                if game_player.state == "static" then
                    if currentSkill == "Clone004_xc_01" and not dismissSkillTCCS then
                        -- Xử lý khi Thương Cầm Cô Sinh
                        -- Kích hoạt đỡ đòn
                        -- Chờ đến khi hết Thương Cầm Cô Sinh
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "Clone004_xc_01" do
                            if get_buff_info("BuffInParry") == nil and get_buff_info("buff_wyang_xuanyun") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.4)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                    elseif currentSkill == "Clone004_xc_02" then
                        -- Xử lý khi boss ra skill Hùng Mang Sạ Khởi
                        -- Trong khi boss ra Hùng Mang Sạ khởi thì đỡ đòn và cứ kick lẫn nhau
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "Clone004_xc_02" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn, chờ boss đánh skill")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        -- Khi boss hết đánh Hùng Mang Sạ Khởi thì dừng đỡ đòn
                        logToForm("Thôi đỡ đòn")
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                        -- Nhấp chọn boss
                        logToForm("Nhấp boss")
                        nx_execute("custom_sender", "custom_select", nx_string(selObjID))
                        nx_pause(0.2)
                        nx_execute("custom_sender", "custom_select", nx_string(selObjID))
                        nx_pause(0.2)
                        -- Nhấp chọn người chơi
                        -- Tìm 1 người chơi ở gần mình
                        local game_scence_objs = game_scence:GetSceneObjList()
                        for i = 1, table.getn(game_scence_objs) do
                            local obj = game_scence_objs[i]
                            if nx_is_valid(obj) then
                                local visualObj = game_visual:GetSceneObj(obj.Ident)
                                if nx_is_valid(visualObj) then
                                    local pxd = game_player.PositionX - visualObj.PositionX
                                    local pzd = game_player.PositionZ - visualObj.PositionZ
                                    local distance = math.sqrt(pxd * pxd + pzd * pzd)
                                    if distance <= clickMaxDistance and obj:QueryProp("Type") == 2 and obj:QueryProp("Name") ~= player_client:QueryProp("Name") then
                                        logToForm(nx_function("ext_utf8_to_widestr", "Nhấp người chơi: ") .. nx_widestr(obj:QueryProp("Name")), true)
                                        nx_execute("custom_sender", "custom_select", nx_string(obj.Ident))
                                        nx_pause(0.2)
                                        if nx_is_valid(visualObj) and nx_is_valid(obj) then
                                            nx_execute("custom_sender", "custom_select", nx_string(obj.Ident))
                                        end
                                        break
                                    end
                                end
                            end
                        end
                        -- Chọn lại boss
                        logToForm("Nhấp lại boss")
                        nx_execute("custom_sender", "custom_select", nx_string(selObjID))
                        nx_pause(0.2)
                        nx_execute("custom_sender", "custom_select", nx_string(selObjID))
                    elseif currentSkill == "Clone004_xc_03" and typeAvoidPhiTai == 1 then
                        -- Xử lý khi Phi Thái Tinh Chúc
                        -- Kích hoạt đỡ đòn (Kiểu số 1)
                        -- Chờ đến khi hết Phi Thái Tinh Chúc
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "Clone004_xc_03" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.4)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                    elseif getDistanceWithObj(posStandStatic, game_player) > 3 and typeAvoidPhiTai == 1 then
                        -- Nếu bị văng quá xa thì chạy vào điểm giữa
                        -- Khi kiểu tránh Phi Tái là đỡ đòn thì mới có trường hợp văng
                        logToForm("Cách quá xa, vào điểm giữa")
                        jump_to(posStandStatic)
                        nx_pause(0.2)
                    elseif currentSkill == "Clone004_xc_03" and typeAvoidPhiTai == 2 and not tools_move_isArrived2D(posAvoidPhiTai[1], posAvoidPhiTai[2], posAvoidPhiTai[3], 0.3) then
                        -- Xử lý khi Phi Tái Tinh Túc
                        -- Kiểu số 2
                        -- 2 người cùng né
                        -- Xác định điểm xa con boss hơn
                        logToForm("Nhảy ra xa tránh boss")
                        jump_to(posAvoidPhiTai)
                        nx_pause(0.5)
                    elseif not isStunned and getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) < 4 then
                        -- Boss không ra chiêu thì cứ thế đánh
                        -- Khi boss ở gần mình 2 mét mới đánh
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            readyDestroyParry = true
                        end
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local readyChieuNoKhi = false
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            readyChieuNoKhi = true
                        end
                        local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                        -- Kiểm tra
                        if get_buff_info("BuffInParry", bossObj) ~= nil and readyDestroyParry then
                            -- Đối thủ đỡ đòn thì phá def
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            nx_pause(0.4)
                        elseif (buffNC == nil or buffNC < 5) and readyChieuNoKhi then
                            -- Nộ khí
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            nx_pause(0.4)
                        else
                            -- Đối thủ không đỡ đòn thì đánh tự do
                            local gindex = currentSkillIndex
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                                nx_pause(0.4)
                            end
                            currentSkillIndex = currentSkillIndex + 1
                            if currentSkillIndex > 5 then
                                currentSkillIndex = 0
                            elseif currentSkillIndex > 2 then
                                currentSkillIndex = 5
                            end
                        end
                    end
                end
            end
        end
        
        nx_pause(0.05)
    end
end

-----------------------------------
-- Auto đánh boss 4 NMQ Phản Quân
-- 
function auto_run_boss4nmq()
    --[[
    clone004_qbdz_05  =   Vạn Thương Quyết
    clone004_qbdz_07  =   Mã Đạp Liên Doanh
    clone004_qbdz_08  =   Nhất Thương Định Càn Khôn
    clone004_qbdz_11  =   Vạn Lí Phong Trần
    
    hw_normal_fb          Phi Tiêu Thường
    ]]--
    
    resetSkillData()

    -- Đánh thông thường chỉ đánh skill số 0, 1 và 2: Tu La Hủ Cốt, Âm Hồn Xuất Khiếu và Huyền Độc Hỏa Mộc
    local currentSkillIndex = 1
    -- Ghi lại lần cuối cùng dùng skill
    local lastUseSkill = 0
    -- Tọa độ 1 và 2 tránh chiêu Vạn Thương Quyết
    local posAvoidVTQ_1 = {74.825, -4.951, 322.624}
    local posAvoidVTQ_2 = {74.876, -4.850, 311.592}
    -- Tọa độ bay đến tránh vạn thương quyết
    local posAvoidVTQ = nil
    -- Thời gian boss bắt đầu ra skill Mã Đạp Liên Doanh
    local timeStartSkillMDLD = 0
    -- Sau khi boss ra Mã Đạp Liên Doanh thì set cờ lên cho phép nộ
    local allowedNoChieu = false
    -- Sau khi set cờ lên cho phép nộ thì sẽ đánh 1 skill nào đó bất kỳ rồi mới nộ
    local nextSkillIsNoChieu = false
    
    while auto_is_runing_boss4nmq == true do
        clearLogForm()
        
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
            -- Xác định thời gian mili giây
            local msg_delay = nx_value("MessageDelay")
            local currentMiniSec = msg_delay:GetServerNowTime()
        
            -- Ghi trạng thái nhân vật
            logToForm(nx_widestr("State: ") .. nx_widestr(game_player.state), true)
            
            local selObjID = player_client:QueryProp("LastObject")
            local bossObj = game_client:GetSceneObj(nx_string(selObjID))
            local bossVObj = game_visual:GetSceneObj(nx_string(selObjID))
            if nx_is_valid(bossObj) and nx_is_valid(bossVObj) then
                if allowedNoChieu then
                    logToForm("Chuẩn bị xài Ôn Thần cho lần sau: Có")
                else
                    logToForm("Chuẩn bị xài Ôn Thần cho lần sau: Không")
                end
                
                if nextSkillIsNoChieu then
                    logToForm("Bây giờ là nộ chiêu (Nếu có đủ nộ)")
                end
            
                -- Ghi ra thời gian boss hồi máu
                local timeRestoreHP = get_buff_info("buff_Clone004_qbdz_ng01", bossObj)
                if timeRestoreHP == nil then
                    logToForm("Chưa có thông tin hồi máu")
                else
                    logToForm(nx_function("ext_utf8_to_widestr", "Hồi máu sau: ") .. nx_widestr(timeRestoreHP) .. nx_widestr("s"), true)
                end
            
                local currentSkill = bossObj:QueryProp("CurSkillID")
                -- Ghi ra boss xài skill nào
                if currentSkill ~= "" and currentSkill ~= nil and currentSkill ~= 0 then
                    logToForm(nx_function("ext_utf8_to_widestr", "Boss đang đánh: ") .. util_text(nx_string(currentSkill)), true)
                end
                
                -- Xử lý khi boss đánh Vạn Thương Quyết
                if currentSkill == "clone004_qbdz_05" then
                    -- Xác định vị trí nhảy ra xa để tránh
                    if posAvoidVTQ == nil then
                        if getDistanceWithObj(posAvoidVTQ_1, bossVObj) > getDistanceWithObj(posAvoidVTQ_2, bossVObj) then
                            posAvoidVTQ = posAvoidVTQ_1
                        else
                            posAvoidVTQ = posAvoidVTQ_2
                        end
                    end
                else
                    posAvoidVTQ = nil
                end
                -- Xử lý khi boss ra Mã Đạp Liên Doanh
                if currentSkill == "clone004_qbdz_07" then
                    if timeStartSkillMDLD == 0 then
                        timeStartSkillMDLD = msg_delay:GetServerNowTime()
                    else
                        -- Ghi lệch thời gian
                        local diffTime = msg_delay:GetServerNowTime() - timeStartSkillMDLD
                        logToForm(nx_function("ext_utf8_to_widestr", "Thời gian cast chiêu: ") .. nx_widestr(diffTime) .. nx_widestr("ms"), true)
                    end
                elseif timeStartSkillMDLD ~= 0 then
                    timeStartSkillMDLD = 0
                    allowedNoChieu = true
                end
                
                -- Tất cả các thao tác trong trạng thái static
                if game_player.state == "static" then
                    if currentSkill == "clone004_qbdz_05" and not tools_move_isArrived2D(posAvoidVTQ[1], posAvoidVTQ[2], posAvoidVTQ[3], 0.3) then
                        -- Xử lý khi Vạn Thương Quyết nếu chưa tránh được
                        logToForm("Nhảy ra xa tránh Vạn Thương Quyết")
                        jump_to(posAvoidVTQ)
                        nx_pause(0.1)
                    elseif currentSkill == "clone004_qbdz_07" and (msg_delay:GetServerNowTime() - timeStartSkillMDLD) > 1600 then
                        -- Nếu boss ra Mã Đạp Liên Doanh
                        -- Nếu boss ra được 2s rồi thì đỡ đòn
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "clone004_qbdz_07" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.05)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.1)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.2)
                    elseif currentSkill == "clone004_qbdz_11" and (msg_delay:GetServerNowTime() - lastUseSkill) < 2500 then
                        logToForm("Đỡ đòn Vạn Lý Phong Trần")
                        -- Xử lý khi ra Vạn Lý Phong Trần và thời gian ra chiêu lần cuối không quá 2.5s
                        -- Đỡ đòn
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "clone004_qbdz_11" and (msg_delay:GetServerNowTime() - lastUseSkill) < 3000 do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.05)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.1)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                    elseif currentSkill == "clone004_qbdz_11" and (msg_delay:GetServerNowTime() - lastUseSkill) >= 2500 then
                        logToForm("Đánh phá def duy trì dame vạn lý")
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        -- Nếu boss ra Vạn Lý và thời gian ra chiêu đã quá 2.5s thì phá def
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            lastUseSkill = msg_delay:GetServerNowTime()
                        end
                    elseif getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) < 4 then
                        -- BOSS Ở GẦN
                        -- Boss không ra chiêu thì cứ thế đánh
                        -- Khi boss ở gần mình 2 mét mới đánh
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            readyDestroyParry = true
                        end
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local readyChieuNoKhi = false
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            readyChieuNoKhi = true
                        end
    
                        -- Kiểm tra
                        if readyChieuNoKhi and nextSkillIsNoChieu then
                            nextSkillIsNoChieu = false
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            lastUseSkill = msg_delay:GetServerNowTime()
                            nx_pause(0.2)
                        elseif get_buff_info("BuffInParry", bossObj) ~= nil and readyDestroyParry then
                            -- Đối thủ đỡ đòn thì phá def
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            lastUseSkill = msg_delay:GetServerNowTime()
                            nx_pause(0.2)
                        else
                            -- Đối thủ không đỡ đòn thì đánh tự do
                            local gindex = currentSkillIndex
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                                lastUseSkill = msg_delay:GetServerNowTime()
                                nx_pause(0.2)
                                if allowedNoChieu then
                                    allowedNoChieu = false
                                    nextSkillIsNoChieu = true
                                end
                            end
                            if currentSkillIndex == 1 then
                                currentSkillIndex = 2
                            elseif currentSkillIndex == 2 then
                                currentSkillIndex = 5
                            else
                                currentSkillIndex = 1
                            end
                        end
                    else
                        -- Sau khi đã nhảy ra xa tránh được Vạn Thương Quyết mà boss vẫn còn đánh
                        -- Thì cứ thế phi tiêu thường vào boss đến khi hết Vạn Thương Quyết
                        logToForm("Ném phi tiêu trong khi cách xa boss")
                        while bossObj:QueryProp("CurSkillID") == "clone004_qbdz_05" or getDistanceWithObj({game_player.PositionX, game_player.PositionY, game_player.PositionZ}, bossVObj) >= 4 do
                            -- Trong khi boss đang đánh Vạn Thương Quyết hoặc chưa chạy lại gần thì cứ thế ném phi tiêu
                            local gui = nx_value("gui")
                            if not gui.CoolManager:IsCooling(nx_int(2605), nx_int(0)) then
                                local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                                local form = nx_value(FORM_SHORTCUT_PATH)
                                local grid = form.grid_shortcut_main
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, nx_int(4), true)
                                lastUseSkill = msg_delay:GetServerNowTime()
                            end
                            nx_pause(0.05)
                        end
                        -- Sau khi boss hết đánh Vạn Thương Quyết và chạy lại gần thì
                        -- Chờ hồi đến khi đánh được chiêu Huyền Độc
                        logToForm("Đánh skill Huyền Độc Hỏa Mộc")
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        while 1 do
                            local cool_type, cool_team = getSkillData(grid, 2)
                            if cool_type > -1 and not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(2) ~= "" then
                                break
                            end
                            nx_pause(0.01)
                        end
                        -- Đánh chiêu huyền độc
                        nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, nx_int(2), true)
                        lastUseSkill = msg_delay:GetServerNowTime()
                        nx_pause(0.25)
                        while game_player.state == "locked" do
                            nx_pause(0)
                        end
                        -- Kiểm tra xem đủ nộ chưa
                        if grid:GetItemCoverImage(3) ~= "" then
                            logToForm("Đánh Ôn Thần Tứ Dật")  
                            while 1 do
                                local cool_type, cool_team = getSkillData(grid, 3)
                                if cool_type > -1 and not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(3) ~= "" then
                                    break
                                end
                                nx_pause(0.01)
                            end
                            -- Đánh chiêu Ôn Thần Tứ Giật
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, nx_int(3), true)
                            lastUseSkill = msg_delay:GetServerNowTime()
                        else
                            logToForm("Chưa đủ nộ")   
                        end
                    end
                elseif game_player.state == "no_collide_jump" then
                    -- Trong lúc nhảy có thể ném phi tiêu được
                    local gui = nx_value("gui")
                    if not gui.CoolManager:IsCooling(nx_int(2605), nx_int(0)) then
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, nx_int(4), true)
                        lastUseSkill = msg_delay:GetServerNowTime()
                    end
                end
            end
        end
        
        nx_pause(0.01)
    end
end

-----------------------------------
-- Auto đánh boss 5 NMQ Phản Quân
-- 
function auto_run_boss5nmq()
    -- Đánh thông thường chỉ đánh skill số 0, 1 và 2: Tu La Hủ Cốt, Âm Hồn Xuất Khiếu và Huyền Độc Hỏa Mộc
    local currentSkillIndex = 1
    -- Def Hổ Nã Bắc Nhạc hay không
    local defSkillHNBN = true
    -- Thời gian boss bắt đầu ra chiêu trận địa nhất kích
    local timeStartSkillTDNK = 0
    
    --[[
    clone004_bndz_03=Kết Trận- Thuẫn Trận
    clone004_bndz_06=Trận Địa Nhất Kích
    clone004_bndz_07=Hám Nhạc Sơn Hà
    clone004_bndz_11=Hổ Nã Bắc Nhạc
    ]]--
    
    resetSkillData()

    while auto_is_runing_boss5nmq == true do
        clearLogForm()
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
            -- Xác định thời gian mili giây
            local msg_delay = nx_value("MessageDelay")
            local currentMiniSec = msg_delay:GetServerNowTime()
        
            -- Ghi trạng thái nhân vật
            logToForm(nx_widestr("State: ") .. nx_widestr(game_player.state), true)
            local selObjID = player_client:QueryProp("LastObject")
            local bossObj = game_client:GetSceneObj(nx_string(selObjID))
            local bossVObj = game_visual:GetSceneObj(nx_string(selObjID))
            if nx_is_valid(bossObj) and nx_is_valid(bossVObj) then
                local currentSkill = bossObj:QueryProp("CurSkillID")
                if currentSkill == "clone004_bndz_04" or currentSkill == "clone004_bndz_05" then
                    currentSkill = "clone004_bndz_03"
                end
                
                -- Buff Phản Dame
                local isRevengeDamage = get_buff_info("buf_clone004_bndz_03", bossObj)
                if isRevengeDamage == nil then
                    logToForm("Không phản sát thương")
                else
                    logToForm(nx_function("ext_utf8_to_widestr", "Phản dame còn: ") .. nx_widestr(isRevengeDamage) .. nx_widestr("s"), true)
                end
                
                -- Ghi ra boss xài skill nào
                if currentSkill ~= "" and currentSkill ~= nil and currentSkill ~= 0 then
                    logToForm(nx_function("ext_utf8_to_widestr", "Boss đang đánh: ") .. util_text(nx_string(currentSkill)), true)
                end
                
                -- Xử lý khi boss ra Trận Địa Nhất Kích
                if currentSkill == "clone004_bndz_06" then
                    if timeStartSkillTDNK == 0 then
                        timeStartSkillTDNK = msg_delay:GetServerNowTime()
                    else
                        -- Ghi lệch thời gian
                        local diffTime = msg_delay:GetServerNowTime() - timeStartSkillTDNK
                        logToForm(nx_function("ext_utf8_to_widestr", "Thời gian cast chiêu: ") .. nx_widestr(diffTime) .. nx_widestr("ms"), true)
                    end
                else
                    timeStartSkillTDNK = 0
                end
                
                -- Tất cả các thao tác trong trạng thái static
                if game_player.state == "static" then
                    if currentSkill == "clone004_bndz_07" then
                        -- Xử lý khi Hám Nhạc Sơn Hà
                        -- Đối với người đánh boss
                        -- Kích hoạt đỡ đòn
                        -- Chờ đến khi hết Hám Nhạc Sơn Hà
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "clone004_bndz_07" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.4)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(3)
                    elseif currentSkill == "clone004_bndz_06" then
                        -- Boss ra chiêu Trận Địa Nhất Kích
                        logToForm("Chờ đúng thời điểm")
                        if (msg_delay:GetServerNowTime() - timeStartSkillTDNK) > 1600 then
                            logToForm("Đúng thời điểm, nhảy lên")
                            local role = nx_value("role")
                            game_visual:SwitchPlayerState(role, 1, 5)
                            nx_pause(0.7)
                            game_visual:SwitchPlayerState(role, 1, 6)
                            nx_pause(0.7)
                            game_visual:SwitchPlayerState(role, 1, 7)
                            nx_pause(0.4)
                            -- Sau khi nhảy lên nếu sẵn sàn ra Ôn Thần Thì ra Ôn Thần
                            local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                            local form = nx_value(FORM_SHORTCUT_PATH)
                            local grid = form.grid_shortcut_main
                            local gui = nx_value("gui")
                            local gindex1 = 3
                            local cool_type, cool_team = getSkillData(grid, gindex1)
                            if cool_type > -1 and not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                                nx_pause(0.3)
                            end
                        end
                    elseif currentSkill == "clone004_bndz_11" and defSkillHNBN then
                        -- Xử lý khi Hổ Nã Bắc Nhạc
                        -- Đối với người đánh boss
                        -- Kích hoạt đỡ đòn
                        -- Chờ đến khi hết Hổ Nã Bắc Nhạc
                        while nx_is_valid(bossObj) and bossObj:QueryProp("CurSkillID") == "clone004_bndz_11" do
                            if get_buff_info("BuffInParry") == nil then
                                logToForm("Đỡ đòn")
                                nx_execute("custom_sender", "custom_active_parry", nx_int(1), nx_int(0))
                            end
                            nx_pause(0.1)
                        end
                        logToForm("Thôi đỡ đòn")
                        nx_pause(0.4)
                        nx_execute("custom_sender", "custom_active_parry", nx_int(0), nx_int(0))
                        nx_pause(0.1)
                    else
                        -- Boss không ra chiêu thì cứ thế đánh
                        -- Chỉ tanker mới đánh
                        local FORM_SHORTCUT_PATH = "form_stage_main\\form_main\\form_main_shortcut"
                        local form = nx_value(FORM_SHORTCUT_PATH)
                        local grid = form.grid_shortcut_main
                        local gui = nx_value("gui")
                        
                        -- Kiểm ra chiêu phá def sẵn sàng
                        local gindex = 0
                        local readyDestroyParry = false
                        local cool_type, cool_team = getSkillData(grid, gindex)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                            readyDestroyParry = true
                        end
                        -- Kiểm tra chiêu nộ sẵn sàng
                        local gindex1 = 3
                        local readyChieuNoKhi = false
                        local cool_type, cool_team = getSkillData(grid, gindex1)
                        if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex1) ~= "" then
                            readyChieuNoKhi = true
                        end
                        local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                        -- Kiểm tra
                        if get_buff_info("BuffInParry", bossObj) ~= nil and readyDestroyParry and isRevengeDamage == nil and currentSkill ~= "clone004_bndz_03" then
                            -- Đối thủ đỡ đòn thì phá def
                            -- Không phá def nếu nó đang phản dame hoặc đang ra chiêu kết trận
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                            nx_pause(0.4)
                        elseif (buffNC == nil or buffNC < 5) and readyChieuNoKhi then
                            -- Nộ khí
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            nx_pause(0.4)
                        elseif readyChieuNoKhi and isRevengeDamage ~= nil then
                            -- Nộ khí trong khi boss đang phản dame để lấy thời gian đánh các chiêu khác
                            nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex1, true)
                            nx_pause(0.4)
                        elseif isRevengeDamage == nil and currentSkill ~= "clone004_bndz_03" then
                            -- Đối thủ không đỡ đòn thì đánh tự do
                            -- Không đánh nếu boss đang ra chiêu kết trận
                            local gindex = currentSkillIndex
                            local cool_type, cool_team = getSkillData(grid, gindex)
                            if cool_type > -1 and  not gui.CoolManager:IsCooling(nx_int(cool_type), nx_int(cool_team)) and grid:GetItemCoverImage(gindex) ~= "" then
                                nx_execute(FORM_SHORTCUT_PATH, "on_main_shortcut_useitem", grid, gindex, true)
                                nx_pause(0.4)
                            end
                            currentSkillIndex = currentSkillIndex + 1
                            if currentSkillIndex > 5 then
                                currentSkillIndex = 1
                            elseif currentSkillIndex > 2 then
                                currentSkillIndex = 5
                            end
                        end
                    end
                elseif game_player.state == "dead" then
                    reset_all_btns("----")
                    nx_function("ext_flash_window")
                    return false
                end
            end
        end
        
        nx_pause(0.05)
    end
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
end

function on_main_form_close(form)
	auto_is_runing_boss1nmq = false
	auto_is_runing_boss2nmq = false
	auto_is_runing_boss3nmq = false
	auto_is_runing_boss4nmq = false
	auto_is_runing_boss5nmq = false
	auto_is_runing_autoclick = false
	nx_destroy(form)
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

function on_btn_boss1nmq_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_boss1nmq then
		reset_all_btns("----")
	else
        reset_all_btns("boss1nmq")
		auto_is_runing_boss1nmq = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_boss1nmq()
	end
end

function on_btn_boss2nmq_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_boss2nmq then
		reset_all_btns("----")
	else
        reset_all_btns("boss2nmq")
		auto_is_runing_boss2nmq = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_boss2nmq()
	end
end

function on_btn_boss3nmq_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_boss3nmq then
		reset_all_btns("----")
	else
        reset_all_btns("boss3nmq")
		auto_is_runing_boss3nmq = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_boss3nmq()
	end
end

function on_btn_boss4nmq_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_boss4nmq then
		reset_all_btns("----")
	else
        reset_all_btns("boss4nmq")
		auto_is_runing_boss4nmq = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_boss4nmq()
	end
end

function on_btn_boss5nmq_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_boss5nmq then
		reset_all_btns("----")
	else
        reset_all_btns("boss5nmq")
		auto_is_runing_boss5nmq = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_boss5nmq()
	end
end

function on_btn_autoclick_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    
	if auto_is_runing_autoclick then
		reset_all_btns("----")
	else
        reset_all_btns("autoclick")
		auto_is_runing_autoclick = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_autoclick()
	end
end

function reset_all_btns(skip)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
    if skip ~= "boss1nmq" then
        auto_is_runing_boss1nmq = false
        form.btn_boss1nmq.Text = nx_function("ext_utf8_to_widestr", "Boss 1 NMQ")
    end
    if skip ~= "boss2nmq" then
        auto_is_runing_boss2nmq = false
        form.btn_boss2nmq.Text = nx_function("ext_utf8_to_widestr", "Boss 2 NMQ")
    end
    if skip ~= "boss3nmq" then
        auto_is_runing_boss3nmq = false
        form.btn_boss3nmq.Text = nx_function("ext_utf8_to_widestr", "Boss 3 NMQ")
    end
    if skip ~= "boss4nmq" then
        auto_is_runing_boss4nmq = false
        form.btn_boss4nmq.Text = nx_function("ext_utf8_to_widestr", "Boss 4 NMQ")
    end
    if skip ~= "boss5nmq" then
        auto_is_runing_boss5nmq = false
        form.btn_boss5nmq.Text = nx_function("ext_utf8_to_widestr", "Boss 5 NMQ")
    end
    if skip ~= "autoclick" then
        auto_is_runing_autoclick = false
        form.btn_autoclick.Text = nx_function("ext_utf8_to_widestr", "Auto Click")
    end
end

function change_form_size()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	local gui = nx_value("gui")
	--form.Left = (gui.Width - form.Width) / 2
	--form.Top = (gui.Height - form.Height) / 2
	form.Left = 100
	form.Top = 140
end
