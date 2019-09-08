require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")
require("form_stage_main\\form_tiguan\\form_tiguan_util")

local THIS_FORM = "auto_tools\\tools_tiguan"
local FORM_TIGUAN_MAIN = "form_stage_main\\form_tiguan\\form_tiguan_one"
local FORM_TIGUAN_CHOICE_BOSS = "form_stage_main\\form_tiguan\\form_tiguan_choice_boss"
local FORM_TIGUAN_DS_TRACE = "form_stage_main\\form_tiguan\\form_tiguan_ds_trace" -- Bảng thời gian khiêu chiến, nút mời hảo hữu
local FORM_TIGUAN_DETAIL = "form_stage_main\\form_tiguan\\form_tiguan_detail" -- Bảng kết quả khiêu chiến
local FORM_SHORTCUT = "form_stage_main\\form_main\\form_main_shortcut"
local FORM_MAIN_SELECT = "form_stage_main\\form_main\\form_main_select"

local DATA_TIGUAN_PATH = "autodata\\data_tiguan.lua"
local WINEXEC_PATH = "autodata\\tools.exe"

local auto_is_running_thth = false
local auto_is_running_theluc = false

local current_form_type = "thth"

-- Các thiết lập cho THTH
-- Cấp khiêu chiến hiện tại
local CURRENT_FIGHT_LEVEL = 1
-- Cấp sẽ khiêu chiến tiếp theo
local NEXT_FIGHT_LEVEL = 2

function auto_run_theluc()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi form"))
        stop_theluc()
        return 0
    end
    local map = form.map
    local guan_ui_ini = nx_execute("util_functions", "get_ini", CHANGGUAN_UI_INI)
    if not nx_is_valid(guan_ui_ini) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi dữ liệu thế lực"))
        stop_theluc()
        return 0
    end
    local section_count = guan_ui_ini:GetSectionCount()
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_TIGUAN_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file data do đó không thể chạy được"))
        stop_theluc()
        return 0
    end
    local file = assert(loadfile(nx_work_path() .. DATA_TIGUAN_PATH))
    file()
    -- Xác định thế lực
    local tiguan_init_data = {}
    local tiguan_index = -1
    for i = 1, section_count do
        local name = util_text(nx_string(guan_ui_ini:ReadString(i - 1, "Name", "")))
        if name == form.combobox_theluc_theluc.Text then
            local guan_id = nx_number(guan_ui_ini:GetSectionByIndex(i - 1))
            tiguan_init_data = tiguanInitNPC[guan_id]
            tiguan_index = i - 1
            break
        end
    end
    if tiguan_init_data == {} then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Dữ liệu thế lực không tồn tại"))
        stop_theluc()
        return 0
    end
    if tiguan_index < 0 then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thế lực không xác định"))
        stop_theluc()
        return 0
    end
    -- Xác định đối thủ
    --[[
    local tiguan_boss = nx_string("")
    local npc_list = guan_ui_ini:GetItemValueList(tiguan_index, "Npc")
    for i = 1, table.getn(npc_list) do
        local data_tab = util_split_string(nx_string(npc_list[i]), ",")
        if table.getn(data_tab) ~= 3 then
            tools_show_notice(nx_function("ext_utf8_to_widestr", "Dữ liệu BOSS từ file INI không rõ ràng"))
            stop_theluc()
            return 0
        end
        if nx_number(data_tab[3]) == 1 then
            local npc_id = nx_string(data_tab[1])
            local npc_name = util_text(npc_id)
            if npc_name == form.combobox_theluc_boss.Text then
                tiguan_boss = npc_id
                break
            end
        end
    end
    if tiguan_boss == nx_string("") then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Boss của thế lực không xác định"))
        stop_theluc()
        return 0
    end
    ]]--
    -- Xác định kiểu
    local set_auto_type = 0 -- Chủ động đánh
    if form.combobox_theluc_type.Text == nx_function("ext_utf8_to_widestr", "AFK chờ bạn đánh") then
        set_auto_type = 1
    elseif form.combobox_theluc_type.Text == nx_function("ext_utf8_to_widestr", "Vào xong Out ra") then
        set_auto_type = 2
    end
    -- Xác định số lần
    local set_auto_count = nx_int(form.combobox_theluc_count.Text)
    -- 
    local isUseSpecialRide = form.cbtn_theluc_usespride.Checked
    
    local step = 1
    local bossX = 0
    local bossY = 0
    local bossZ = 0
    local bossName = ""
    local bossScene = ""
    
    local auto_count = nx_int(0)
    
    while auto_is_running_theluc == true do
		local is_vaild_data = true
		local game_client
		local game_visual
		local game_player
		local player_client
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
			player_client = game_client:GetPlayer()
			if not nx_is_valid(player_client) then
				is_vaild_data = false
			end
			game_scence = game_client:GetScene()
			if not nx_is_valid(game_scence) then
				is_vaild_data = false
			end
		end
        if is_vaild_data == true then
            -- Đối với người đứng yên
            if set_auto_type == 1 then
                local form_detail = nx_value(FORM_TIGUAN_DETAIL)
                -- Cứ khiêu chiến xong thì ra
                if nx_is_valid(form_detail) and form_detail.Visible == true then
                    nx_pause(1)
                    nx_execute("custom_sender", "custom_tiguan_request_leave")
                    nx_pause(1)
                end
            else
                -- Kiểm tra đang load thì chờ load xong
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                if loading_flag or nx_string(stage_main_flag) ~= nx_string("success") then
                    nx_pause(0.3)
                else
                    -- Kiểm tra số lần đánh
                    if nx_int(auto_count) >= set_auto_count then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đánh xong số lần quy định"))
                        stop_theluc()
                        return 0
                    end
                    
                    if step == 1 then
                        -- Di chuyển lại nói chuyện với con Npc
                        local is_talking = false
                        if not is_talking then
                            -- Nếu đang đứng yên thì di chuyển tới nói chuyện
                            if not is_moving(0.3) then
                                local scene_id = map
                                local npc_id = tiguan_init_data[1]
                                local x, y, z = find_npc_pos(scene_id, npc_id)
                                local path_finding = nx_value("path_finding")
                                local trace_flag = path_finding.AutoTraceFlag
                                if -10000 < nx_number(x) then
                                    if trace_flag == 1 then
                                        find_scene_id = scene_id
                                        find_npc_id = npc_id
                                        find_npc_x = x
                                        find_npc_y = y
                                        find_npc_z = z
                                        find_npc = true
                                        path_finding:TraceTargetByID(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
                                    else
                                        find_scene_id = scene_id
                                        find_npc_id = npc_id
                                        find_npc_x = x
                                        find_npc_y = y
                                        find_npc_z = z
                                        find_npc = true
                                        path_finding:DrawToTarget(scene_id, nx_float(x), nx_float(y), nx_float(z), 1.8, npc_id)
                                    end
                                else
                                    tools_show_notice(nx_function("ext_utf8_to_widestr", "NPC thế lực khiêu chiến không tồn tại"))
                                    stop_theluc()
                                    return 0
                                end
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đi tìm NPC mở khiêu chiến"))
                            end
                            local form_talk = nx_value("form_stage_main\\form_talk_movie")
                            is_talking = form_talk.Visible
                        end
                        if is_talking then
                            -- Đối thoại với NPC để mở cái bảng khiêu chiến lên
                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", tiguan_init_data[2])
                            nx_pause(0.2)
                            nx_execute("form_stage_main\\form_talk_movie", "menu_select", tiguan_init_data[3])
                            nx_pause(2)
                            step = 2
                        end
                    elseif step == 2 then
                        -- Ấn gửi chiến thư
                        local FORM_TIGUAN_READY = "form_stage_main\\form_tiguan\\form_tiguan_ready"
                        local form_check = nx_value(FORM_TIGUAN_READY)
                        if nx_is_valid(form_check) and form_check.Visible == true then
                            -- Kiểm tra lại số người trong đội
                            local TeamMemberCount = player_client:QueryProp("TeamMemberCount")
                            local CountPlayer = 0
                            local CountPlayerCando = 0

                            for i = 1, 6 do
                                local gbox_player = form_check.gbox_player:Find("gbox_player_" .. nx_string(i))
                                if not nx_is_valid(gbox_player) then
                                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi form READY"))
                                    stop_theluc()
                                    return 0
                                end
                                local lbl_photo = gbox_player:Find("lbl_photo_" .. nx_string(i))
                                local lbl_playname = gbox_player:Find("lbl_playname_" .. nx_string(i))
                                local lbl_state = gbox_player:Find("lbl_state_" .. nx_string(i))
                                if not nx_is_valid(lbl_photo) or not nx_is_valid(lbl_playname) or not nx_is_valid(lbl_state) then
                                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi form READY"))
                                    stop_theluc()
                                    return 0
                                end
                                if lbl_playname.Text ~= nx_widestr("") then
                                    CountPlayer = CountPlayer + 1
                                end
                                if lbl_state.Text == util_text("ui_tiguan_can_enter") then
                                    CountPlayerCando = CountPlayerCando + 1
                                end
                            end
                            local isWaiting = false
                            if CountPlayer < TeamMemberCount then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Đang đợi thành viên của tổ đội đến đông đủ"))
                                isWaiting = true
                            elseif CountPlayerCando < TeamMemberCount then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Trong tổ đội có thành viên không thể khiêu chiến, hãy kiểm tra lại"))
                                isWaiting = true
                            end
                            if isWaiting then
                                nx_execute(FORM_TIGUAN_READY, "on_btn_fresh_click", form_check.btn_fresh)
                                nx_pause(3.2)
                            else
                                nx_execute(FORM_TIGUAN_READY, "on_btn_ok_click", form_check.btn_ok)
                                step = 3
                            end
                        else
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Không thể mở khiêu chiến, hãy kiểm tra lại bạn đã tạo đội chưa hoặc thế lực này đã bị đánh bại chưa"))
                            stop_theluc()
                            return 0
                        end
                    elseif step == 3 then
                        -- Gọi tọa kỵ đặc biệt
                        if isUseSpecialRide then
                            callTheSpecialRiding()
                        end
                        -- Nhấp nút bắt đầu khiêu chiến
                        local FORM_TIGUAN_GO = "form_stage_main\\form_tiguan\\form_tiguan_go"
                        local form_check = nx_value(FORM_TIGUAN_GO)
                        if nx_is_valid(form_check) and form_check.Visible == true then
                            nx_execute(FORM_TIGUAN_GO, "on_btn_step_click", form_check.btn_step)
                            nx_pause(1)
                            nx_execute(FORM_TIGUAN_GO, "on_btn_step_click", form_check.btn_step)
                            step = 4
                            -- Dừng 1 chặp để không bị lỗi
                            nx_pause(0.8)
                        else
                            step = 2
                        end
                    elseif step == 4 then
                        -- Đi tìm boss đánh
                        -- Xác định vị trí tọa độ con boss
                        local finish_cdts = nx_value("tiguan_finish_cdts")
                        if not nx_is_valid(finish_cdts) or finish_cdts:GetChildCount() < 1 then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi không xác định"))
                            stop_theluc()
                            return 0
                        end
                        -- Nếu đánh kiểu vào xong out thì chuyển thẳng đến bước out
                        if set_auto_type == 2 then
                            step = 6
                        else
                            local cdt_tab = finish_cdts:GetChildList()
                            local gui = nx_value("gui")
                            if not nx_is_valid(gui) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi không xác định"))
                                stop_theluc()
                                return 0
                            end
                            local boss_place = nx_widestr("")
                            for i = 1, table.getn(cdt_tab) do
                                local child = cdt_tab[i]
                                if nx_number(child.ismust) == 1 then
                                    boss_place = gui.TextManager:GetText("ui_tiguan_place_" .. nx_string(child.cdt_id))
                                end
                            end
                            local front = nx_function("ext_ws_find", boss_place, nx_widestr("href=\""))
                            local back = nx_function("ext_ws_find", boss_place, nx_widestr("\" style="))
                            boss_place = nx_function("ext_ws_substr", boss_place, front + 6, back - 9)
                            boss_place = nx_function("ext_split_string", nx_string(boss_place), ",")
                            local x, y, z = find_npc_pos(boss_place[2], boss_place[3])

                            bossX = x
                            bossY = y
                            bossZ = z
                            bossName = boss_place[3]
                            bossScene = boss_place[2]

                            -- Di chuyển đến tọa độ con boss
                            if not tools_move_isArrived(x, y, z) then
                                if not is_moving() then
                                    tools_move(boss_place[2], x, y, z, true)
                                end
                            else
                                -- Tới chố con boss rồi thì xuống ngựa nếu đang cưỡi ngựa
                                while get_buff_info("buf_riding_01") ~= nil do
                                    nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                                    nx_pause(0.2)
                                end
                                step = 5
                            end
                        end
                    elseif step == 5 then
                        -- Quánh boss sấp mặt
                        -- Kiểm tra lại chỗ đứng
                        if not tools_move_isArrived2D(bossX, bossY, bossZ, 3) then
                            step = 4
                        elseif nx_is_valid(nx_value(FORM_TIGUAN_DETAIL)) and nx_value(FORM_TIGUAN_DETAIL).Visible == true then
                            -- Nếu có kết quả khiêu chiến thì chuyển bước khác
                            step = 6
                        else
                            -- Tìm ra con npc và nhấp chọn nó
                            local npc_obj, npc_vobj = find_npc_by_configid(bossName)
                            if nx_is_valid(npc_obj) and nx_is_valid(npc_vobj) and control_select_npc(npc_obj) then
                                local fight = nx_value("fight")
                                local game_client = nx_value("game_client")
                                local client_self = game_client:GetPlayer()
                                local can_attack = fight:CanAttackNpc(client_self, npc_obj)
                                if can_attack then
                                    local form = nx_value(FORM_SHORTCUT)
                                    local grid = form.grid_shortcut_main
                                    local game_shortcut = nx_value("GameShortcut")
                                    if nx_is_valid(game_shortcut) then
                                        -- Boss đỡ đòn thì xài skill phá def
                                        if get_buff_info("BuffInParry", npc_obj) ~= nil then
                                            game_shortcut:on_main_shortcut_useitem(grid, 0, true)
                                        end
                                        -- Không có buff ôn thần, boss không bị ngã hoặc còn lại 5s thì mới xài
                                        local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                                        if (buffNC == nil or buffNC < 5) and get_buff_info("buff_tg_pobati", npc_obj) == nil then
                                            game_shortcut:on_main_shortcut_useitem(grid, 3, true)
                                        end
                                        game_shortcut:on_main_shortcut_useitem(grid, 1, true)
                                        game_shortcut:on_main_shortcut_useitem(grid, 2, true)
                                    end
                                end
                            end
                        end
                    elseif step == 6 then
                        nx_pause(2)
                        auto_count = auto_count + nx_int(1)
                        nx_execute("custom_sender", "custom_tiguan_request_leave")
                        nx_pause(6)
                        step = 1
                    end
                end
            end
        end
        nx_pause(0.2)
    end
end

function auto_run_thth()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi form"))
        stop_theluc()
        return 0
    end
    local map = form.map

    -- Reset lại thông tin các dữ liệu tạm
    CURRENT_FIGHT_LEVEL = 1
    NEXT_FIGHT_LEVEL = 2
    
    local DO_TIGUAN_LEVEL = 1
    local DO_TIGUAN_GUAN_ID = 1

    -- Thiết lập auto, sau này sẽ căn cứ vào config để build ra
    local cfg = {
        numTiguan = nx_int(form.combobox_thth_socap.Text), -- Số cấp khiêu chiến 1 => 4
        numGuanPerTiguan = { -- Số thể lực sẽ đánh ở mỗi cấp
            [1] = nx_int(form.combobox_thth_cap1.Text),
            [2] = nx_int(form.combobox_thth_cap2.Text),
            [3] = nx_int(form.combobox_thth_cap3.Text),
            [4] = nx_int(form.combobox_thth_cap4.Text)
        },
        doType = 1, -- 1 đánh ngược hoặc 2 đánh xuôi: Build bên dưới
        dissMissLastGuan = form.cbtn_thth_dimisslast.Checked, -- Bỏ thế lực cuối nếu không ra boss đỏ.
        allowWinExec = form.cbtn_thth_useexe.Checked, -- Đặt là TRUE để khởi chạy chức năng điều khiển bàn phím, chuột (bật cái này thì cần phải để nguyên chuột và bàn phím)
        continueArrest = form.cbtn_thth_continue.Checked, -- Tiếp tục đánh nếu boss tiếp theo đỏ mặc dù đã đạt giới hạn số thế lực
        breakOne = form.cbtn_thth_stopone.Checked, -- Đặt là true thì sẽ dừng lại khi đánh xong mỗi thế lực
        pauseOne = { -- Đặt là true thì sẽ dừng lại khi xong boss để tự mở rương
            [1] = form.cbtn_thth_cap1.Checked,
            [2] = form.cbtn_thth_cap2.Checked,
            [3] = form.cbtn_thth_cap3.Checked,
            [4] = form.cbtn_thth_cap4.Checked
        },
        isUseSpecialRide = form.cbtn_thth_usespride.Checked, -- Dùng các loại tọa kỵ đặc biệt
        autoRedBoss = {
            [1] = form.cbtn_thth_cap1_autoboss.Checked,
            [2] = form.cbtn_thth_cap2_autoboss.Checked,
            [3] = form.cbtn_thth_cap3_autoboss.Checked,
            [4] = form.cbtn_thth_cap4_autoboss.Checked
        }
    }
    if form.combobox_thth_kieudanh.Text == nx_function("ext_utf8_to_widestr", "Đánh xuôi") then
        cfg.doType = 2
    end
    
    local dissMissLastGuan = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0
    }
    local stopPlusThisLevel = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false
    }
    local isRightMouseDown = false
    
    local step = 1
    local bossX = 0
    local bossY = 0
    local bossZ = 0
    local bossName = ""
    local bossScene = ""

    while auto_is_running_thth == true do
		local is_vaild_data = true
		local game_client
		local game_visual
		local game_player
		local player_client
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
			player_client = game_client:GetPlayer()
			if not nx_is_valid(player_client) then
				is_vaild_data = false
			end
			game_scence = game_client:GetScene()
			if not nx_is_valid(game_scence) then
				is_vaild_data = false
			end
		end
        if is_vaild_data == true then
            if step == 1 then
                -- Mở cái form THTH lên
                local form_tiguan_one = nx_value(FORM_TIGUAN_MAIN)
                if not nx_is_valid(form_tiguan_one) or form_tiguan_one.Visible == false then
                    util_auto_show_hide_form(FORM_TIGUAN_MAIN)
                    nx_pause(0.5)
                else
                    -- Xác định cấp hiện tại sẽ khiêu chiến
                    -- Cho là 1 đi
                    DO_TIGUAN_LEVEL = 1

                    -- Thế lực sẽ khiêu chiến
                    DO_TIGUAN_GUAN_ID = 1
                    DO_TIGUAN_LEVEL, DO_TIGUAN_GUAN_ID = get_do_tiguan(form_tiguan_one, cfg, dissMissLastGuan, stopPlusThisLevel)

                    -- Trong quá trình lấy nếu tắt cái form đi là thất bại
                    if DO_TIGUAN_LEVEL == false or DO_TIGUAN_GUAN_ID == false then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã xong turn này, thiết lập lại sau đó có thể chạy auto tiếp"))
                        stop_thth()
                        return 0
                    end

                    local array_name = "guan" .. nx_string(DO_TIGUAN_LEVEL) .. "sub" .. nx_string(DO_TIGUAN_GUAN_ID)
                    local record_complete = nx_number(get_tiguan_record(array_name, "value7")) --0: Chưa mở; 1: Đã mở; 2: Đã đánh xong

                    -- Click mở chọn ô
                    if record_complete == 0 then
                        if not nx_is_valid(form_tiguan_one) or form_tiguan_one.Visible == false then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM THTH, kết thúc auto"))
                            stop_thth()
                            return 0
                        end
                        local cbtn = form_tiguan_one["cbtn_arrestboss" .. DO_TIGUAN_GUAN_ID]
                        nx_execute(FORM_TIGUAN_MAIN, "on_cbtn_arrestboss_click", cbtn)
                        nx_pause(4)
                    end

                    local record_guan_id = nx_number(get_tiguan_record(array_name, "value1"))
                    local record_boss_index = nx_number(get_tiguan_record(array_name, "value2"))
                    local record_task_id = nx_number(get_tiguan_record(array_name, "value3"))
                    local record_reset_spent = nx_number(get_tiguan_record(array_name, "value4"))
                    local record_show = nx_number(get_tiguan_record(array_name, "value5"))
                    local record_appraise = nx_number(get_tiguan_record(array_name, "value8"))
                    local record_times = nx_number(get_tiguan_record(array_name, "value10")) -- Thời gian đánh con boss

                    -- Xác định boss hiện tại
                    if not nx_is_valid(form_tiguan_one) or form_tiguan_one.Visible == false then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM THTH, kết thúc auto"))
                        stop_thth()
                        return 0
                    end
                    local ui_ini = form_tiguan_one.guan_ui_ini
                    if not nx_is_valid(ui_ini) then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi UI INI"))
                        stop_thth()
                        return 0
                    end
                    local gui = nx_value("gui")
                    if not nx_is_valid(gui) then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi GUI"))
                        stop_thth()
                        return 0
                    end
                    local guan_name_text = nx_widestr("")
                    local index = ui_ini:FindSectionIndex(nx_string(record_guan_id))
                    if index >= 0 then
                        guan_name_text = nx_execute(FORM_TIGUAN_MAIN, "get_desc_by_id", ui_ini:ReadString(index, "Name", ""))
                    end
                    local boss_id = get_boss_id(nx_string(record_guan_id), nx_number(record_boss_index))
                    local boss_name = gui.TextManager:GetText(boss_id)
                    local arrest_boss_name = get_arrest_boss(DO_TIGUAN_LEVEL, guan_name_text)

                    -- Thế lực khiêu chiến cuối cùng của cấp (thế lực này phải lớn hơn 1) và không phải boss đỏ, cấu hình bỏ nếu không có boss đỏ
                    if arrest_boss_name ~= boss_name and nx_int(DO_TIGUAN_GUAN_ID) >= cfg.numGuanPerTiguan[DO_TIGUAN_LEVEL] and DO_TIGUAN_GUAN_ID > 1 and cfg.dissMissLastGuan == true then
                        dissMissLastGuan[DO_TIGUAN_LEVEL] = 1
                    else
                        -- Chọn boss đỏ nếu như cấp khiêu chiến số 4 và còn free hoặc thiết lập tự động chọn boss đỏ
                        if not nx_is_valid(form_tiguan_one) or form_tiguan_one.Visible == false then
                            tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM THTH, kết thúc auto"))
                            stop_thth()
                            return 0
                        end
                        if arrest_boss_name ~= boss_name and ((form_tiguan_one.free_appoint == 1 and DO_TIGUAN_LEVEL == 4) or (cfg.autoRedBoss[DO_TIGUAN_LEVEL] == true and have_reset_item(DO_TIGUAN_LEVEL))) then
                            local btn = form_tiguan_one["btn_choice" .. DO_TIGUAN_GUAN_ID]
                            nx_execute(FORM_TIGUAN_MAIN, "on_btn_choice_click", btn)
                            nx_pause(0.9)

                            local form = nx_value(FORM_TIGUAN_CHOICE_BOSS)
                            if not nx_is_valid(form) then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi mở form chọn boss"))
                                stop_thth()
                                return 0
                            end

                            -- Bọn boss đỏ
                            for i = 1, form.cur_gbox_count do
                                local gbox = form.groupscrollbox_1:Find("gbox_choice_boss_" .. nx_string(i))
                                if nx_is_valid(gbox) then
                                    local cbtn_select = gbox:Find("cbtn_choice_boss_select_" .. nx_string(i))
                                    local cbtn_label = gbox:Find("lbl_choice_boss_name_" .. nx_string(i))
                                    if nx_is_valid(cbtn_select) and nx_is_valid(cbtn_label) and cbtn_label.Text == arrest_boss_name then
                                        cbtn_select.Checked = true
                                    end
                                end
                            end
                            nx_pause(0.5)

                            -- Mỗi ngày chọn 1 đối thủ
                            if not nx_is_valid(form_tiguan_one) or form_tiguan_one.Visible == false then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM THTH, kết thúc auto"))
                                stop_thth()
                                return 0
                            end
                            if form_tiguan_one.free_appoint == 1 and DO_TIGUAN_LEVEL == 4 then
                                local form = nx_value(FORM_TIGUAN_CHOICE_BOSS)
                                if not nx_is_valid(form) or form.Visible == false then
                                    tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM chọn boss, kết thúc auto"))
                                    stop_thth()
                                    return 0
                                end
                                if form.free_appoint then
                                    form.cbtn_spent_item.Checked = true
                                    nx_pause(0.2)
                                end
                            end

                            local form = nx_value(FORM_TIGUAN_CHOICE_BOSS)
                            if not nx_is_valid(form) or form.Visible == false then
                                tools_show_notice(nx_function("ext_utf8_to_widestr", "Mất FORM chọn boss, kết thúc auto"))
                                stop_thth()
                                return 0
                            end
                            local btn = form.btn_select
                            nx_execute(FORM_TIGUAN_CHOICE_BOSS, "on_btn_select_click", btn)
                        end
                        
                        -- Lên tọa kỵ trước khi vào khiêu chiến
                        if cfg.isUseSpecialRide then
                            callTheSpecialRiding()
                        end

                        -- Bắt đầu khiêu chiến
                        -- Thời gian khiêu chiến hiện tại
                        -- Kết thúc khiêu chiến còn
                        local form_tiguan_one = nx_value(FORM_TIGUAN_MAIN)
                        if nx_is_valid(form_tiguan_one) then
                            local btn = form_tiguan_one.btn_start
                            nx_execute(FORM_TIGUAN_MAIN, "on_btn_start_click", btn)
                            step = 2
                        end
                    end
                end
            elseif step == 2 then
                -- Bỏ click chuột phải
                if isRightMouseDown then
                    unActiveRightMouse(cfg)
                    isRightMouseDown = false
                end
                -- Các thao tác khi đang khiêu chiến
                -- Đợi màn hình load xong, có form tính giờ bật lên
                local stage_main_flag = nx_value("stage_main")
                local loading_flag = nx_value("loading")
                local form = nx_value(FORM_TIGUAN_DS_TRACE)
                if not loading_flag and nx_string(stage_main_flag) == nx_string("success") and nx_is_valid(form) and form.Visible == true then
                    -- Xác định vị trí tọa độ con boss
                    local finish_cdts = nx_value("tiguan_finish_cdts")
                    if not nx_is_valid(finish_cdts) or finish_cdts:GetChildCount() < 1 then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi xác định boss"))
                        stop_thth()
                        return 0
                    end
                    local cdt_tab = finish_cdts:GetChildList()
                    local gui = nx_value("gui")
                    if not nx_is_valid(gui) then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi GUI 2"))
                        stop_thth()
                        return 0
                    end
                    local boss_place = nx_widestr("")
                    for i = 1, table.getn(cdt_tab) do
                      local child = cdt_tab[i]
                      if nx_number(child.ismust) == 1 then
                        boss_place = gui.TextManager:GetText("ui_tiguan_place_" .. nx_string(child.cdt_id))
                      end
                    end
                    local gui = nx_value("gui")
                    if not nx_is_valid(gui) then
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Lỗi GUI 3"))
                        stop_thth()
                        return 0
                    end
                    local front = nx_function("ext_ws_find", boss_place, nx_widestr("href=\""))
                    local back = nx_function("ext_ws_find", boss_place, nx_widestr("\" style="))
                    boss_place = nx_function("ext_ws_substr", boss_place, front + 6, back - 9)
                    boss_place = nx_function("ext_split_string", nx_string(boss_place), ",")
                    local x, y, z = find_npc_pos(boss_place[2], boss_place[3])

                    bossX = x
                    bossY = y
                    bossZ = z
                    bossName = boss_place[3]
                    bossScene = boss_place[2]

                    -- Di chuyển đến tọa độ con boss
                    if not tools_move_isArrived(x, y, z) then
                        if not is_moving() then
                            tools_move(boss_place[2], x, y, z, true)
                        end
                    elseif get_buff_info("buf_riding_01") ~= nil then
                        -- Tới chố con boss rồi thì xuống ngựa nếu đang cưỡi ngựa
                        nx_execute("custom_sender", "custom_remove_buffer", "buf_riding_01")
                        nx_pause(0.2)
                    else
                        step = 3
                    end
                end
            elseif step == 3 then
                -- Kiểm tra lại chỗ đứng
                if not tools_move_isArrived2D(bossX, bossY, bossZ, 3) then
                    step = 2
                elseif not nx_is_valid(nx_value(FORM_TIGUAN_DS_TRACE)) then
                    -- Mất cái form này có nghĩa là khiêu chiến thành công
                    if cfg.pauseOne[DO_TIGUAN_LEVEL] == true then
                        nx_function("ext_flash_window")
                        step = 5
                    else
                        step = 4
                    end
                else
                    -- Target vào con boss, đợi boss bắt đầu đỏ lên thì xuất chiêu
                    local npc_obj, npc_vobj = find_npc_by_configid(bossName)
                    if nx_is_valid(npc_obj) and nx_is_valid(npc_vobj) and control_select_npc(npc_obj) then
                        -- Kích hoạt chuột phải đỡ đòn
                        if not isRightMouseDown then
                            activeRightMouse(cfg)
                            isRightMouseDown = true
                        end
                        local fight = nx_value("fight")
                        local game_client = nx_value("game_client")
                        local client_self = game_client:GetPlayer()
                        local can_attack = fight:CanAttackNpc(client_self, npc_obj)
                        if can_attack then
                            local form = nx_value(FORM_SHORTCUT)
                            local grid = form.grid_shortcut_main
                            local game_shortcut = nx_value("GameShortcut")
                            if nx_is_valid(game_shortcut) then
                            
                                local allowUseSkill = false
                                -- Boss đỡ đòn thì xài skill phá def
                                if get_buff_info("BuffInParry", npc_obj) ~= nil then
                                    allowUseSkill = true
                                    game_shortcut:on_main_shortcut_useitem(grid, 0, true)
                                end
                                if cfg.allowWinExec == false or getAllowUseSkill(bossName, npc_obj) == true then
                                    allowUseSkill = true
                                end
                                if allowUseSkill then
                                    -- Không có buff ôn thần, boss không bị ngã hoặc còn lại 5s thì mới xài
                                    local buffNC = get_buff_info("buf_CS_jl_shuangci07")
                                    if (buffNC == nil or buffNC < 5) and get_buff_info("buff_tg_pobati", npc_obj) == nil then
                                        allowUseSkill = true
                                        game_shortcut:on_main_shortcut_useitem(grid, 3, true)
                                    end
                                    game_shortcut:on_main_shortcut_useitem(grid, 1, true)
                                    game_shortcut:on_main_shortcut_useitem(grid, 2, true)
                                end
                            end
                        end
                    end
                end
            elseif step == 4 then
                if isRightMouseDown then
                    unActiveRightMouse(cfg)
                    isRightMouseDown = false
                end
                nx_pause(3)
                nx_execute("custom_sender", "custom_tiguan_request_leave")
                step = 5
            elseif step == 5 then
                local form_tiguan_one = nx_value(FORM_TIGUAN_MAIN)
                if nx_is_valid(form_tiguan_one) and form_tiguan_one.Visible == true then
                    if cfg.breakOne == true then
                        nx_function("ext_flash_window")
                        tools_show_notice(nx_function("ext_utf8_to_widestr", "Đã đánh xong một thế lực, nhấp chạy để tiếp tục đánh nữa"))
                        stop_thth()
                        return 0
                    else
                        step = 1
                    end
                    nx_pause(5)
                end
            else
                stop_thth()
                return 0
            end
        end
        nx_pause(0.1)
    end
end

function set_form_thth(form)
    auto_is_running_theluc = false
    current_form_type = "thth"
	
    if not nx_is_valid(form) then
		return 0
	end
	
    form.tabtheluc.Checked = false
    form.tabthth.Checked = true
    
    form.GroupTHTH.Visible = true
    form.GroupTheLuc.Visible = false

    -- Số cấp đánh
    local combobox_thth_socap = form.combobox_thth_socap
    combobox_thth_socap.DropListBox:ClearString()
    if combobox_thth_socap.DroppedDown then
        combobox_thth_socap.DroppedDown = false
    end
    combobox_thth_socap.DropListBox:AddString(nx_widestr("1"))
    combobox_thth_socap.DropListBox:AddString(nx_widestr("2"))
    combobox_thth_socap.DropListBox:AddString(nx_widestr("3"))
    combobox_thth_socap.DropListBox:AddString(nx_widestr("4"))
    combobox_thth_socap.Text = nx_widestr("4")
    -- Kiểu đánh
    local combobox_thth_kieudanh = form.combobox_thth_kieudanh
    combobox_thth_kieudanh.DropListBox:ClearString()
    if combobox_thth_kieudanh.DroppedDown then
        combobox_thth_kieudanh.DroppedDown = false
    end
    combobox_thth_kieudanh.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Đánh ngược"))
    combobox_thth_kieudanh.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Đánh xuôi"))
    combobox_thth_kieudanh.Text = nx_function("ext_utf8_to_widestr", "Đánh ngược")
    
    form.cbtn_thth_useexe.Checked = false
    form.cbtn_thth_dimisslast.Checked = true
    form.cbtn_thth_continue.Checked = true
    form.cbtn_thth_stopone.Checked = false
    
    -- Số thế lực cấp 1
    local combobox_thth_cap1 = form.combobox_thth_cap1
    combobox_thth_cap1.DropListBox:ClearString()
    if combobox_thth_cap1.DroppedDown then
        combobox_thth_cap1.DroppedDown = false
    end
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("1"))
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("2"))
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("3"))
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("4"))
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("5"))
    combobox_thth_cap1.DropListBox:AddString(nx_widestr("6"))
    combobox_thth_cap1.Text = nx_widestr("1")
    -- Số thế lực cấp 2
    local combobox_thth_cap2 = form.combobox_thth_cap2
    combobox_thth_cap2.DropListBox:ClearString()
    if combobox_thth_cap2.DroppedDown then
        combobox_thth_cap2.DroppedDown = false
    end
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("1"))
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("2"))
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("3"))
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("4"))
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("5"))
    combobox_thth_cap2.DropListBox:AddString(nx_widestr("6"))
    combobox_thth_cap2.Text = nx_widestr("1")
    -- Số thế lực cấp 3
    local combobox_thth_cap3 = form.combobox_thth_cap3
    combobox_thth_cap3.DropListBox:ClearString()
    if combobox_thth_cap3.DroppedDown then
        combobox_thth_cap3.DroppedDown = false
    end
    combobox_thth_cap3.DropListBox:AddString(nx_widestr("1"))
    combobox_thth_cap3.DropListBox:AddString(nx_widestr("2"))
    combobox_thth_cap3.DropListBox:AddString(nx_widestr("3"))
    combobox_thth_cap3.DropListBox:AddString(nx_widestr("4"))
    combobox_thth_cap3.Text = nx_widestr("4")
    -- Số thế lực cấp 4
    local combobox_thth_cap4 = form.combobox_thth_cap4
    combobox_thth_cap4.DropListBox:ClearString()
    if combobox_thth_cap4.DroppedDown then
        combobox_thth_cap4.DroppedDown = false
    end
    combobox_thth_cap4.DropListBox:AddString(nx_widestr("1"))
    combobox_thth_cap4.DropListBox:AddString(nx_widestr("2"))
    combobox_thth_cap4.DropListBox:AddString(nx_widestr("3"))
    combobox_thth_cap4.DropListBox:AddString(nx_widestr("4"))
    combobox_thth_cap4.Text = nx_widestr("4")
    
    form.cbtn_thth_cap1.Checked = false
    form.cbtn_thth_cap2.Checked = false
    form.cbtn_thth_cap3.Checked = true
    form.cbtn_thth_cap4.Checked = true
    
    form.cbtn_thth_cap1_autoboss.Checked = false
    form.cbtn_thth_cap2_autoboss.Checked = false
    form.cbtn_thth_cap3_autoboss.Checked = false
    form.cbtn_thth_cap4_autoboss.Checked = false
    
    form.cbtn_thth_usespride.Checked = false
    
    form.map = get_current_map()
    form.btn_control_thth.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

function set_form_theluc(form)
    auto_is_running_thth = false
    current_form_type = "theluc"
	
    if not nx_is_valid(form) then
		return 0
	end
	
    form.tabtheluc.Checked = true
    form.tabthth.Checked = false
    
    form.GroupTHTH.Visible = false
    form.GroupTheLuc.Visible = true

    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_TIGUAN_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file data do đó không thể chạy được"))
        form.btn_control_theluc.Text = nx_function("ext_utf8_to_widestr", "Lỗi")
        return 0
    end
    local file = assert(loadfile(nx_work_path() .. DATA_TIGUAN_PATH))
    file()

    local guan_ui_ini = nx_execute("util_functions", "get_ini", CHANGGUAN_UI_INI)
    if not nx_is_valid(guan_ui_ini) then
        return 0
    end
    local section_count = guan_ui_ini:GetSectionCount()
    -- Build thế lục
    local combobox_theluc_theluc = form.combobox_theluc_theluc
    combobox_theluc_theluc.DropListBox:ClearString()
    if combobox_theluc_theluc.DroppedDown then
        combobox_theluc_theluc.DroppedDown = false
    end
    local fname = nx_widestr("")
    local i = section_count
    while i > 0 do
        local guan_id = nx_number(guan_ui_ini:GetSectionByIndex(i - 1))
        local is_open = guan_ui_ini:ReadString(i - 1, "IsOpen", "1")
        if is_open == "1" and tiguanInitNPC[guan_id] ~= nil then
            local name = util_text(nx_string(guan_ui_ini:ReadString(i - 1, "Name", "")))
            if fname == nx_widestr("") then
                fname = name
            end
            combobox_theluc_theluc.DropListBox:AddString(name)
        end
        i = i - 1
    end
    combobox_theluc_theluc.Text = fname
    --on_combobox_theluc_theluc_selected(combobox_theluc_theluc)
    -- Build cách đánh
    local combobox_theluc_type = form.combobox_theluc_type
    combobox_theluc_type.DropListBox:ClearString()
    if combobox_theluc_type.DroppedDown then
        combobox_theluc_type.DroppedDown = false
    end
    combobox_theluc_type.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Chủ động đánh gánh team"))
    combobox_theluc_type.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "AFK chờ bạn đánh"))
    combobox_theluc_type.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Vào xong Out ra"))
    combobox_theluc_type.Text = nx_function("ext_utf8_to_widestr", "Chủ động đánh gánh team")
    -- Build số lần đánh
    local combobox_theluc_count = form.combobox_theluc_count
    combobox_theluc_count.DropListBox:ClearString()
    if combobox_theluc_count.DroppedDown then
        combobox_theluc_count.DroppedDown = false
    end
    combobox_theluc_count.DropListBox:AddString(nx_widestr("6"))
    combobox_theluc_count.DropListBox:AddString(nx_widestr("5"))
    combobox_theluc_count.DropListBox:AddString(nx_widestr("4"))
    combobox_theluc_count.DropListBox:AddString(nx_widestr("3"))
    combobox_theluc_count.DropListBox:AddString(nx_widestr("2"))
    combobox_theluc_count.DropListBox:AddString(nx_widestr("1"))
    combobox_theluc_count.Text = nx_widestr("6")
    --
    
    form.cbtn_theluc_usespride.Checked = false
    
    form.map = get_current_map()
    form.btn_control_theluc.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

function stop_theluc()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    auto_is_running_theluc = false
    if form.btn_control_theluc.Text ~= nx_widestr("...") then
        form.btn_control_theluc.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    end
end

function stop_thth()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return
    end
    auto_is_running_thth = false
    if form.btn_control_thth.Text ~= nx_widestr("...") then
        form.btn_control_thth.Text = nx_function("ext_utf8_to_widestr", "Chạy")
    end
end

function on_tabthth_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    if current_form_type == "thth" then
        return
    end
    stop_theluc()
    set_form_thth(form)
end

function on_tabtheluc_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
    if current_form_type == "theluc" then
        return
    end
    stop_thth()
    set_form_theluc(form)
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
    set_form_thth(form)
end

function on_main_form_close(form)
	auto_is_running_thth = false
	auto_is_running_theluc = false
	nx_destroy(form)
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

function on_btn_control_theluc_click(btn)
	if btn.Text == nx_widestr("...") then
		return 0
	end
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running_theluc then
		stop_theluc()
	else
		auto_is_running_theluc = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_theluc()
	end
end

function on_btn_control_thth_click(btn)
	if btn.Text == nx_widestr("...") then
		return 0
	end
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running_thth then
		stop_thth()
	else
		auto_is_running_thth = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run_thth()
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

function on_combobox_theluc_theluc_selected(combobox)
    -- Bỏ cái này
    if 1 then
        return false
    end
	local form = combobox.ParentForm
	if not nx_is_valid(form) then
		return
	end
	local form = combobox.ParentForm
	if not nx_is_valid(form) then
		return
	end
    local guan_ui_ini = nx_execute("util_functions", "get_ini", CHANGGUAN_UI_INI)
    if not nx_is_valid(guan_ui_ini) then
        return 0
    end
    local section_count = guan_ui_ini:GetSectionCount()
    -- Build đối thủ
    local combobox_theluc_boss = form.combobox_theluc_boss
    combobox_theluc_boss.DropListBox:ClearString()
    if combobox_theluc_boss.DroppedDown then
        combobox_theluc_boss.DroppedDown = false
    end
    local fname = nx_widestr("")
    local index = -1
    for i = 1, section_count do
        local name = util_text(nx_string(guan_ui_ini:ReadString(i - 1, "Name", "")))
        if name == form.combobox_theluc_theluc.Text then
            index = i - 1
            break
        end
    end
    if index < 0 then
        return 0
    end
    local npc_list = guan_ui_ini:GetItemValueList(index, "Npc")
    for i = 1, table.getn(npc_list) do
        local data_tab = util_split_string(nx_string(npc_list[i]), ",")
        if table.getn(data_tab) ~= 3 then
            return 0
        end
        if nx_number(data_tab[3]) == 1 then
            local npc_id = nx_string(data_tab[1])
            local npc_name = util_text(npc_id)
            if fname == nx_widestr("") then
                fname = npc_name
            end
            combobox_theluc_boss.DropListBox:AddString(npc_name)
        end
    end
    combobox_theluc_boss.Text = fname
end

function on_combobox_theluc_boss_selected(combobox)
    stop_theluc()
end

function on_combobox_theluc_type_selected(combobox)
    stop_theluc()
end

function on_combobox_theluc_count_selected(combobox)
    stop_theluc()
end

function on_combobox_thth_socap_selected(combobox)
    stop_thth()
end

function on_combobox_thth_kieudanh_selected(combobox)
    stop_thth()
end

function on_cbtn_thth_useexe_changed(cbtn)
    if not nx_is_valid(cbtn) then
        return false
    end
    -- Kiểm tra file exe tồn tại
    if not nx_function("ext_is_file_exist", nx_work_path() .. WINEXEC_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file tools.exe do đó chức năng này không kích hoạt được"), 2)
        cbtn.Checked = false
    elseif cbtn.Checked == true then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Chú ý: Khi kích hoạt chức năng này vui lòng không sử dụng chuột phải, không chuyển cửa sổ game hoặc windows"))
    end
    stop_thth()
end

function on_cbtn_thth_dimisslast_changed(cbtn)
    stop_thth()
end

function on_cbtn_thth_continue_changed(cbtn)
    stop_thth()
end

function on_cbtn_thth_stopone_changed(cbtn)
    stop_thth()
end

function on_combobox_thth_cap1_selected(combobox)
    stop_thth()
end

function on_combobox_thth_cap2_selected(combobox)
    stop_thth()
end

function on_combobox_thth_cap3_selected(combobox)
    stop_thth()
end

function on_combobox_thth_cap4_selected(combobox)
    stop_thth()
end

function on_cbtn_thth_cap1_changed(cbtn)
    stop_thth()
end

function on_cbtn_thth_cap2_changed(cbtn)
    stop_thth()
end

function on_cbtn_thth_cap3_changed(cbtn)
    stop_thth()
end

function on_cbtn_thth_cap4_changed(cbtn)
    stop_thth()
end

function on_cbtn_theluc_usespride_changed(cbtn)
    stop_theluc()
end

function on_cbtn_thth_usespride_changed(cbtn)
    stop_thth()
end

function getAllowUseSkill(bossName, obj)
	return true
end

function get_tiguan_record(array_name, child_name)
	return nx_execute(FORM_TIGUAN_MAIN, "get_tiguan_record", array_name, child_name)
end

function get_boss_id(guan_id, boss_index)
	return nx_execute(FORM_TIGUAN_MAIN, "get_boss_id", guan_id, boss_index)
end

function get_arrest_boss(level, guanname)
	local form = nx_value(FORM_TIGUAN_MAIN)
	if not nx_is_valid(form) then
	end

	for i = 1, 7 do
		local guan_id = nx_execute(FORM_TIGUAN_MAIN, "get_arrest_data", level, i, 1)
		local boss_id = nx_execute(FORM_TIGUAN_MAIN, "get_arrest_data", level, i, 2)
		local guan_name = nx_widestr("")

		local gui = nx_value("gui")
		if not nx_is_valid(gui) then
			return 0
		end
		local ui_ini = form.guan_ui_ini
		if not nx_is_valid(ui_ini) then
			return 0
		end
		local index = ui_ini:FindSectionIndex(guan_id)
		if index >= 0 then
			guan_name = nx_execute(FORM_TIGUAN_MAIN, "get_desc_by_id", ui_ini:ReadString(index, "Name", ""))
		end
		if guanname == guan_name then
			return gui.TextManager:GetText(boss_id)
		end
	end
	return nx_widestr("")
end

function get_do_tiguan(form, cfg, dissMissLastGuan, stopPlusThisLevel)
    local tiguanLimit = {
        [1] = 6,
        [2] = 6,
        [3] = 4,
        [4] = 4
    }
    
    -- Chiều xuôi
    
    -- Kiểm tra cái form
    if not nx_is_valid(form) then
        return false, false
    end
    -- Click chọn cấp khiêu chiến hiện tại
    local btn_name = "rbtn_level_" .. tostring(CURRENT_FIGHT_LEVEL)
    local btn = form[btn_name]
    if not btn.Checked then
        btn.Checked = true
        nx_execute(FORM_TIGUAN_MAIN, "on_rbtn_level_checked_changed", btn)
        nx_pause(0.7)
    end
    -- Quét các đối thủ theo hướng tiến
    -- Kiểu đánh tiến thì cứ đánh theo thứ tự
    local pass_this_level = false
    local guan_do = 0

    for j = 1, tiguanLimit[CURRENT_FIGHT_LEVEL] do
        guan_do = j
        local array_name = "guan" .. nx_string(CURRENT_FIGHT_LEVEL) .. "sub" .. nx_string(j)
        local record_complete = nx_number(get_tiguan_record(array_name, "value7")) --0: Chưa mở; 1: Đã mở; 2: Đã đánh xong
        
        if CURRENT_FIGHT_LEVEL < NEXT_FIGHT_LEVEL then
            -- Kiểm tra chiều xuôi
            -- Đánh xong thế lực thứ j và j đã đạt mốc hoặc là đã đánh ít nhất một đối thủ và kiểu đánh ngược
            if record_complete == 2 and (nx_int(j) >= nx_int(cfg.numGuanPerTiguan[CURRENT_FIGHT_LEVEL] - nx_int(dissMissLastGuan[CURRENT_FIGHT_LEVEL])) or cfg.doType == 1) then
                pass_this_level = true
                break
            elseif record_complete < 2 then
                break
            end
        else
            -- Kiểm tra chiều ngược
            -- Đánh xong thế lực thứ j và j đã đạt mốc
            if record_complete == 2 and nx_int(j) >= nx_int(cfg.numGuanPerTiguan[CURRENT_FIGHT_LEVEL] - nx_int(dissMissLastGuan[CURRENT_FIGHT_LEVEL])) then
                -- Dừng đánh nếu có lệnh stop hoặc loại thế lực cuối, nếu không thử mở ra thế lực tiếp theo
                if dissMissLastGuan[CURRENT_FIGHT_LEVEL] > 0 or stopPlusThisLevel[CURRENT_FIGHT_LEVEL] or j >= tiguanLimit[CURRENT_FIGHT_LEVEL] or cfg.continueArrest == false then
                    pass_this_level = true
                    break
                end
            elseif record_complete < 2 then
                break
            end
        end
    end
    
    -- Nếu có đối thủ khiêu chiến thì kết thúc
    if not pass_this_level then
        return CURRENT_FIGHT_LEVEL, guan_do
    end
    
    -- Gọi lại hàm để xác định thế lực đánh
    if CURRENT_FIGHT_LEVEL < NEXT_FIGHT_LEVEL then
        -- Gọi xuôi
        CURRENT_FIGHT_LEVEL = NEXT_FIGHT_LEVEL
        -- Nếu chỉ đánh 1 cấp thì kết thúc
        if nx_int(CURRENT_FIGHT_LEVEL) > cfg.numTiguan then
            return false, false
        end
        -- Đạt tới cấp tối đa thì quay ngược lại
        NEXT_FIGHT_LEVEL = NEXT_FIGHT_LEVEL + 1
        if nx_int(NEXT_FIGHT_LEVEL) > cfg.numTiguan then
            NEXT_FIGHT_LEVEL = CURRENT_FIGHT_LEVEL - 1
        end
        return get_do_tiguan(form, cfg, dissMissLastGuan, stopPlusThisLevel)
    elseif cfg.doType == 1 then
        -- Gọi ngược nếu đánh ngược
        CURRENT_FIGHT_LEVEL = NEXT_FIGHT_LEVEL
        -- Hết đếm ngược
        if CURRENT_FIGHT_LEVEL < 1 then
            return false, false
        end
        NEXT_FIGHT_LEVEL = NEXT_FIGHT_LEVEL - 1
        return get_do_tiguan(form, cfg, dissMissLastGuan, stopPlusThisLevel)
    end
	return false, false
end

function activeRightMouse(cfg)
	if cfg.allowWinExec == false then
		return
	end
	nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " MOUSEDOWN")
end

function unActiveRightMouse(cfg)
	if cfg.allowWinExec == false then
		return
	end
	nx_function("ext_win_exec", nx_work_path() .. WINEXEC_PATH .. " MOUSEUP")
end

-- Tìm xung quanh con boss
function find_npc_by_configid(configid)
    local game_client = nx_value("game_client")
    if not nx_is_valid(game_client) then
        return false, false
    end
    local game_scence = game_client:GetScene()
    if not nx_is_valid(game_scence) then
        return false, false
    end
    local game_visual = nx_value("game_visual")
    if not nx_is_valid(game_visual) then
        return false, false
    end
    local game_scence_objs = game_scence:GetSceneObjList()
    for i = 1, table.getn(game_scence_objs) do
        local obj = game_scence_objs[i]
        if nx_is_valid(obj) then
            local visualObj = game_visual:GetSceneObj(obj.Ident)
            if nx_is_valid(visualObj) then
                if obj:FindProp("Type") and obj:QueryProp("Type") == 4 and obj:FindProp("ConfigID") and obj:QueryProp("ConfigID") == configid then
                    return obj, visualObj
                end
            end
        end
    end
    return false, false
end

-- Nhấp chọn NPC
-- Trả về true nếu đã chọn
-- Trả về false và tự chọn NPC
function control_select_npc(npc)
    if not nx_is_valid(npc) then
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
    local select_target_ident = player_client:QueryProp("LastObject")
    local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
    if nx_is_valid(select_target) and nx_string(npc.Ident) == nx_string(select_target_ident) then
        return true
    end
    nx_execute("custom_sender", "custom_select", npc.Ident)
    return false
end

-- Có item chọn boss không
function have_reset_item(level)
    local dataItems = {
        [1] = "tiguan_reset_item_01",
        [2] = "tiguan_reset_item_01",
        [3] = "tiguan_reset_item_02",
        [4] = "tiguan_reset_item_03"
    }
    local GoodsGrid = nx_value("GoodsGrid")
    if not nx_is_valid(GoodsGrid) then
        return false
    end
    if GoodsGrid:GetItemCount(dataItems[level]) > 0 then
        return true
    end
    return false
end
