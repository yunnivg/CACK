require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_crop"
local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"
local auto_is_running = false
local last_table_ident = {}

local DATA_CROP_PATH = "autodata\\data_crop.lua"
local filedatacrop = nil

function auto_run(form)
	local step = 1
	local city = get_current_map()
	local data = get_seed_data(form.combobox_seed.Text)
	local posp = get_dataposp(city, form.combobox_posp.Text)
	local poss = get_dataposs(city, form.combobox_poss.Text)

	last_table_ident = {}

	if data == false or posp == false or poss == false then
		on_btn_control_click(form.btn_control)
		return 0
	end

    -- Mở cái túi đồ
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
    if not nx_is_valid(form_bag) or not form_bag.Visible then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Không thể mở cái túi đồ lên được"))
		on_btn_control_click(form.btn_control)
		return 0
    end
    
    -- Kích hoạt cái túi vật phẩm
    if not form_bag.rbtn_material.Checked then
        form_bag.rbtn_material.Checked = true
    end
    
    -- 1 là diệt cỏ (cho ăn) 2 là diệt sâu
    local setTypeIll = 0
    -- ID con tằm/cây bị sâu bệnh
    local illIdent = nil
    -- Số tằm/cây đang còn lại trên ruộng
    local currentExistsObjs = 0
    -- ID của cái khung tằm sẽ gieo hạt vào đó
    local drillingIdent = nil
    
    -- Các biến dùng trồng cây
    -- Số hạt đã gieo tại một điểm
    local numberSeedSowed = 0
    -- Sau khi trồng xong xxx hạt thì quay về bước này
    local stepBack = 1
    
	while auto_is_running == true do
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
            form.mltbox_content:Clear()
			local logicstate = player_client:QueryProp("LogicState")

			-- Nếu bị chết thì phải bắt đầu lại từ đầu
			if logicstate == 120 then
                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bị chết, trị thương lân cận để bắt đầu lại"), -1)
				step = 1
				last_table_ident = {}
				nx_execute("custom_sender", "custom_relive", 2, 0)
				nx_pause(15)
			end

			-- Trồng cây
			if data.croptype == 0 then
				-- Đến điểm thứ 1
				if step == 1 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang di chuyển đến điểm số 1"), -1)
                    if not is_moving() then
                        if not tools_move_isArrived(posp[1].x, posp[1].y, posp[1].z, 0.5) then
                            tools_move(city, posp[1].x, posp[1].y, posp[1].z, true)
                        else
                            numberSeedSowed = 0
                            stepBack = 2
                            step = 4
                        end
                    end
				-- Đến điểm thứ 2
				elseif step == 2 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang di chuyển đến điểm số 2"), -1)
                    if not is_moving() then
                        if not tools_move_isArrived(posp[2].x, posp[2].y, posp[2].z, 0.5) then
                            tools_move(city, posp[2].x, posp[2].y, posp[2].z, true)
                        else
                            numberSeedSowed = 0
                            stepBack = 3
                            step = 4
                        end
                    end
				-- Thu hoạch, diệt sâu, diệt cỏ
				elseif step == 3 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang quá trình diệt cỏ, diệt sâu, thu hoạch"), -1)
                    
                    -- Số cây hiện còn
					currentExistsObjs = 0
                    -- Reset lại cây bị bệnh về 0
                    illIdent = nil
                    -- Reset cây đã chín và thu hoạch về 0
                    local pickIdent = nil
                    -- Tìm xem có cái gì bị bệnh không, nếu không có cái gì bị bệnh thì tự reset lại bảng chữa bệnh 
                    local haveIllObj = false
                    
					local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        if obj:QueryProp("ConfigID") == data.croppernpc and obj:QueryProp("Owner") == player_client:QueryProp("Name") then
                            currentExistsObjs = currentExistsObjs + 1
							-- 1 thì bị sâu, 256 thì bị cỏ
                            local CropTempState = obj:QueryProp("CropTempState")
							local Resource = obj:QueryProp("Resource")
							local Ident = obj.Ident
							local IdentResource = nx_string(Resource) .. nx_string(Ident)
                            
                            if CropTempState == 1 or CropTempState == 256 then
                                haveIllObj = true
                                
                                -- Chỉ chọn cây đầu tiên bị sâu bệnh
                                if illIdent == nil and not in_array(IdentResource, last_table_ident) then
                                    illIdent = Ident
                                    if CropTempState == 1 then
                                        -- Diệt sâu
                                        setTypeIll = 2
                                    else
                                        -- Diệt cỏ
                                        setTypeIll = 1
                                    end
                                end
                            end
                            
                            -- Xác định cây đầu tiên chín
                            if Resource == data.resource and pickIdent == nil then
                                pickIdent = Ident
                            end
                        end
                    end

                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số cây hiện còn: ") .. nx_widestr(currentExistsObjs), -1)
                    
                    -- Reset lại các cây bị bệnh nếu không còn cây nào bị bệnh nữa
                    if not haveIllObj then
                        last_table_ident = {}
                    end
                    
                    -- Nếu có cây bị sâu bệnh thì đi diệt
                    if illIdent ~= nil then
                        step = 5
                    elseif pickIdent ~= nil then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bắt đầu thu hoạch"), -1)
                        -- Nếu có cây chín thì thu hoạch
                        if not is_moving() then
                            -- Xác định lại xem cây còn không
                            local obj = game_client:GetSceneObj(nx_string(pickIdent))
                            if nx_is_valid(obj) then
                                local visualObj = game_visual:GetSceneObj(nx_string(pickIdent))
                                if nx_is_valid(visualObj) then
                                    if not tools_move_isArrived(obj.PosiX, obj.PosiY, obj.PosiZ, 0.5) then
                                        tools_move(city, obj.PosiX, obj.PosiY, obj.PosiZ, true)
                                    else
                                        -- Trước khi chọn thì kiểm tra nhặt đồ :D
                                        local pickform = nx_value(PICK_FORM)
                                        if not nx_is_valid(pickform) or pickform.Visible ~= true then
                                            nx_execute("custom_sender", "custom_select", nx_string(pickIdent))
                                        end    
                                    end
                                end
                            end
                        end
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ cây chín"), -1)
                    end
                    
                    -- Đến cuối cùng kiểm tra xem có cái form nhặt đồ không nếu có thì nhặt
                    local pickform = nx_value(PICK_FORM)
                    if nx_is_valid(pickform) and pickform.Visible then
                        tool_getPickForm()
                    end    

					-- Nếu hết cây thì hoàn tất vòng
					if currentExistsObjs == 0 then
						step = 1
						last_table_ident = {}
                        -- Dừng lại 1 giây kiểm tra tiếp thử có cái form nhặt đồ không trước khi bắt đầu turn mới
                        nx_pause(1)
                        local pickform = nx_value(PICK_FORM)
                        if nx_is_valid(pickform) and pickform.Visible then
                            tool_getPickForm()
                        end    
					end
                elseif step == 4 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bắt đầu gieo hạt giống"), -1)
                    numberSeedSowed = numberSeedSowed + 1
                    
                    local text = nx_function("ext_utf8_to_widestr", "Gieo hạt ") .. util_text(data.seedid) .. nx_function("ext_utf8_to_widestr", " thứ ") .. nx_widestr(numberSeedSowed)
                    form.mltbox_content:AddHtmlText(text, -1)
                    
                    nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", data.seedid)
                    nx_pause(6.2)
                    
                    if numberSeedSowed >= data.numonepoint then
                        step = stepBack
                    end
                elseif step == 5 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang quá trình diệt cỏ, diệt sâu, thu hoạch"), -1)
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số cây hiện còn: ") .. nx_widestr(currentExistsObjs), -1)
                    if setTypeIll == 1 then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi diệt cỏ cho cây"), -1)
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi diệt sâu phá hoại"), -1)
                    end
                    if not is_moving() then
                        -- Xác định xem cây bị sâu bệnh còn không
                        local obj = game_client:GetSceneObj(nx_string(illIdent))
                        if nx_is_valid(obj) then
                            local visualObj = game_visual:GetSceneObj(nx_string(illIdent))
                            if nx_is_valid(visualObj) then
                                local Resource = obj:QueryProp("Resource")
                                local Ident = obj.Ident
                                local IdentResource = nx_string(Resource) .. nx_string(Ident)
                                if not tools_move_isArrived(obj.PosiX, obj.PosiY, obj.PosiZ, 0.5) then
                                    tools_move(city, obj.PosiX, obj.PosiY, obj.PosiZ, true)
                                else
                                    -- Trước khi chọn thì kiểm tra nhặt đồ :D
                                    local pickform = nx_value(PICK_FORM)
                                    if nx_is_valid(pickform) and pickform.Visible then
                                        tool_getPickForm()
                                    end    
									nx_execute("custom_sender", "custom_select", nx_string(illIdent))
									nx_pause(0.2)
                                    local select_target_ident = player_client:QueryProp("LastObject")
                                    local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                    if nx_is_valid(select_target) and nx_string(nx_string(illIdent)) == nx_string(select_target_ident) then
                                        -- Dùng thuốc
                                        if setTypeIll == 1 then
                                            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", nongyao_data[data.nongyao].grass)
                                        else
                                            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", nongyao_data[data.nongyao].worm)
                                        end
                                        nx_pause(4)
                                        table.insert(last_table_ident, IdentResource)
                                        step = 3
                                    end
                                end
                            else
                                step = 3
                            end
                        else
                            step = 3
                        end
                    end
				end
			-- Nuôi tằm
			else
				-- Đến vị trí bắt đầu nuôi tằm
				if step == 1 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang di chuyển đến vị trí bắt đầu nuôi tằm"), -1)
					
                    if not is_moving() then
                        if not tools_move_isArrived(poss.x, poss.y, poss.z, 0.5) then
                            tools_move(city, poss.x, poss.y, poss.z, true)
                        else
                            step = 2
                        end
                    end
				-- Tìm ra cái khung tằm gần nhất chỗ mình đứng và chưa có người gieo hạt để gieo
				elseif step == 2 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Xác định số tằm đã gieo, tìm nông tằm tiếp theo để gieo"), -1)
                    
                    -- Reset lại cái khung tằm sẽ gieo hạt vào
					drillingIdent = nil
                    -- Khoảng cách cái khung tằm gần nhất chỗ đứng
					local nearestPNCDistance = 0
                    -- Số tằm đã gieo xong
					local numCroped = 0
					local game_scence_objs = game_scence:GetSceneObjList()

					-- Tìm thấy khung tằm gần nhất
					for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        -- CanNpc0001 là cái khung tằm chưa trồng
						if obj:QueryProp("ConfigID") == "CanNpc0001" then
							local distance = tonumber(string.format("%.3f", distance2d(game_player.PositionX, game_player.PositionZ, obj.PosiX, obj.PosiZ)))
							if nearestPNCDistance == 0 or nearestPNCDistance > distance then
								nearestPNCDistance = distance
								drillingIdent = obj.Ident
							end
						elseif obj:QueryProp("ConfigID") == data.croppernpc and obj:QueryProp("Owner") == player_client:QueryProp("Name") then
							-- Số con tằm đã trồng
							numCroped = numCroped + 1
						end
					end

					-- Nếu hết khung tằm hoặc số con tằm đã gieo đã đủ thì chuyển sang bước sau
					if drillingIdent == nil or numCroped >= data.numonepoint then
						step = 3
                    else
                        -- Chuyển sang bước đi gieo tằm
                        step = 4
					end
				-- Diệt sâu và thu hoạch (Ưu tiên diệt sâu, nếu đang thu hoạch có sâu thì bỏ đi diệt trước)
				elseif step == 3 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang quá trình cho ăn, diệt sâu, thu hoạch"), -1)

                    -- Số con tằm hiện còn
					currentExistsObjs = 0
                    -- Reset lại con tằm bị bệnh về 0
                    illIdent = nil
                    -- Reset con tằm đã chín và thu hoạch về 0
                    local pickIdent = nil
                    -- Tìm xem có cái gì bị bệnh không, nếu không có cái gì bị bệnh thì tự reset lại bảng chữa bệnh 
                    local haveIllObj = false
                    
					local game_scence_objs = game_scence:GetSceneObjList()
                    for i = 1, table.getn(game_scence_objs) do
                        local obj = game_scence_objs[i]
                        if obj:QueryProp("ConfigID") == data.croppernpc and obj:QueryProp("Owner") == player_client:QueryProp("Name") then
                            currentExistsObjs = currentExistsObjs + 1
							-- 1 thì bị đói, 256 thì bị sâu phá hoại
                            local CropTempState = obj:QueryProp("CropTempState")
							local Resource = obj:QueryProp("Resource")
							local Ident = obj.Ident
							local IdentResource = nx_string(Resource) .. nx_string(Ident)
                            
                            if CropTempState == 1 or CropTempState == 256 then
                                haveIllObj = true
                                
                                -- Chỉ chọn con tằm đầu tiên bị sâu bệnh
                                if illIdent == nil and not in_array(IdentResource, last_table_ident) then
                                    illIdent = Ident
                                    if CropTempState == 1 then
                                        -- Diệt sâu cho tằm
                                        setTypeIll = 2
                                    else
                                        -- Cho tằm ăn lá dâu
                                        setTypeIll = 1
                                    end
                                end
                            end
                            
                            -- Xác định con tằm đầu tiên nhả tơ
                            if Resource == data.resource and pickIdent == nil then
                                pickIdent = Ident
                            end
                        end
                    end
                    
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số con tằm hiện còn: ") .. nx_widestr(currentExistsObjs), -1)
                    
                    -- Reset lại các con tằm bị bệnh nếu không còn con nào bị bệnh nữa
                    if not haveIllObj then
                        last_table_ident = {}
                    end
                    
                    -- Nếu có con tằm bị sâu bệnh thì đi diệt
                    if illIdent ~= nil then
                        step = 5
                    elseif pickIdent ~= nil then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Bắt đầu thu hoạch"), -1)
                        -- Nếu có con tằm nhả tơ thì nhấp thu hoạch
                        if not is_moving() then
                            -- Xác định lại xem con tằm còn không
                            local obj = game_client:GetSceneObj(nx_string(pickIdent))
                            if nx_is_valid(obj) then
                                local visualObj = game_visual:GetSceneObj(nx_string(pickIdent))
                                if nx_is_valid(visualObj) then
                                    if not tools_move_isArrived(obj.PosiX, obj.PosiY, obj.PosiZ, 0.5) then
                                        tools_move(city, obj.PosiX, obj.PosiY, obj.PosiZ, true)
                                    else
                                        -- Trước khi chọn thì kiểm tra nhặt đồ :D
                                        local pickform = nx_value(PICK_FORM)
                                        if not nx_is_valid(pickform) or pickform.Visible ~= true then
                                            nx_execute("custom_sender", "custom_select", nx_string(pickIdent))
                                        end    
                                    end
                                end
                            end
                        end
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang chờ tằm nhả tơ"), -1)
                    end
                    
                    -- Đến cuối cùng kiểm tra xem có cái form nhặt đồ không nếu có thì nhặt
                    local pickform = nx_value(PICK_FORM)
                    if nx_is_valid(pickform) and pickform.Visible then
                        tool_getPickForm()
                    end    

					-- Nếu hết tằm thì hoàn tất vòng
					if currentExistsObjs == 0 then
						step = 1
						last_table_ident = {}
                        -- Dừng lại 1 giây kiểm tra tiếp thử có cái form nhặt đồ không trước khi bắt đầu turn mới
                        nx_pause(1)
                        local pickform = nx_value(PICK_FORM)
                        if nx_is_valid(pickform) and pickform.Visible then
                            tool_getPickForm()
                        end    
					end
                elseif step == 4 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi thả tằm"), -1)
                    
                    if not is_moving() then
                        -- Xác định cái khung tằm xem còn không
                        -- Xác định xem nó phải là khung tằm rỗng không hay là khung tằm bị gieo rồi
                        local obj = game_client:GetSceneObj(nx_string(drillingIdent))
                        if nx_is_valid(obj) and obj:QueryProp("ConfigID") == "CanNpc0001" then
                            if not tools_move_isArrived(obj.PosiX, obj.PosiY, obj.PosiZ, 0.5) then
                                tools_move(city, obj.PosiX, obj.PosiY, obj.PosiZ, true)
                            else
                                -- Đã đến nơi, nhấp chọn khung tằm
                                form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Nhấp chọn khung tằm"), -1)
                                nx_execute("custom_sender", "custom_select", nx_string(drillingIdent))
                                nx_pause(0.2)
                                -- Nếu đã gửi thông tin lên server rồi mới gieo
                                local select_target_ident = player_client:QueryProp("LastObject")
                                local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                if nx_is_valid(select_target) and nx_string(drillingIdent) == nx_string(select_target_ident) then
                                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Gieo giống tằm"), -1)
                                    nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", data.seedid)
                                    nx_pause(6.2)
                                    -- Quay trở về bước xác định khung tằm tiếp theo
                                    step = 2
                                end
                            end
                        else
                            -- Trả lại bước tìm khung tằm nếu mất cái khung tằm hoặc là có người khác gieo mất
                            step = 2
                        end
                    end
                elseif step == 5 then
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang quá trình cho ăn, diệt sâu, thu hoạch"), -1)
                    form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Số con tằm hiện còn: ") .. nx_widestr(currentExistsObjs), -1)
                    if setTypeIll == 1 then
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi bổ sung lá dâu cho tằm"), -1)
                    else
                        form.mltbox_content:AddHtmlText(nx_function("ext_utf8_to_widestr", "Đang đi diệt côn trùng phá hoại"), -1)
                    end
                    if not is_moving() then
                        -- Xác định xem con tằm bị sâu bệnh còn không
                        local obj = game_client:GetSceneObj(nx_string(illIdent))
                        if nx_is_valid(obj) then
                            local visualObj = game_visual:GetSceneObj(nx_string(illIdent))
                            if nx_is_valid(visualObj) then
                                local Resource = obj:QueryProp("Resource")
                                local Ident = obj.Ident
                                local IdentResource = nx_string(Resource) .. nx_string(Ident)
                                if not tools_move_isArrived(obj.PosiX, obj.PosiY, obj.PosiZ, 0.5) then
                                    tools_move(city, obj.PosiX, obj.PosiY, obj.PosiZ, true)
                                else
                                    -- Trước khi chọn thì kiểm tra nhặt đồ :D
                                    local pickform = nx_value(PICK_FORM)
                                    if nx_is_valid(pickform) and pickform.Visible then
                                        tool_getPickForm()
                                    end    
									nx_execute("custom_sender", "custom_select", nx_string(illIdent))
									nx_pause(0.2)
                                    local select_target_ident = player_client:QueryProp("LastObject")
                                    local select_target = game_client:GetSceneObj(nx_string(select_target_ident))
                                    if nx_is_valid(select_target) and nx_string(nx_string(illIdent)) == nx_string(select_target_ident) then
                                        -- Dùng thuốc
                                        if setTypeIll == 1 then
                                            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "nongyao10004")
                                        else
                                            nx_execute("form_stage_main\\form_bag_func", "use_item_by_configid", "nongyao10005")
                                        end
                                        nx_pause(5)
                                        table.insert(last_table_ident, IdentResource)
                                        step = 3
                                    end
                                end
                            else
                                step = 3
                            end
                        else
                            step = 3
                        end
                    end
				end
			end
		end
		nx_pause(0.25)
	end
end

function build_combobox(form)
	local combobox_seed = form.combobox_seed
	combobox_seed.DropListBox:ClearString()
	if combobox_seed.DroppedDown then
		combobox_seed.DroppedDown = false
	end
	for i = 1, table.getn(list_seeds) do
		combobox_seed.DropListBox:AddString(util_text(list_seeds[i]))
	end
	combobox_seed.Text = util_text(list_seeds[1])

	local map = get_current_map()
	local listpos = get_listpos(map)

	local combobox_posp = form.combobox_posp
	combobox_posp.DropListBox:ClearString()
	if combobox_posp.DroppedDown then
		combobox_posp.DroppedDown = false
	end
	local combobox_poss = form.combobox_poss
	combobox_poss.DropListBox:ClearString()
	if combobox_poss.DroppedDown then
		combobox_poss.DroppedDown = false
	end

	if listpos ~= false then
		combobox_posp.Text = nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" 1")
		combobox_poss.Text = nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" 1")

		for i = 1, listpos[1] do
			combobox_posp.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" ") .. nx_widestr(tostring(i)))
		end
		for i = 1, listpos[2] do
			combobox_poss.DropListBox:AddString(nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" ") .. nx_widestr(tostring(i)))
		end
	else
		combobox_posp.Text = "--"
		combobox_poss.Text = "--"
	end
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
    -- Kiểm tra file data
    if not nx_function("ext_is_file_exist", nx_work_path() .. DATA_CROP_PATH) then
        tools_show_notice(nx_function("ext_utf8_to_widestr", "Thiếu file dữ liệu, công cụ này không thể hoạt động được"))
        on_main_form_close(form)
        return 0
    end
    filedatacrop = assert(loadfile(nx_work_path() .. DATA_CROP_PATH))
    filedatacrop()
	build_combobox(form)
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Chạy")
end

function on_main_form_close(form)
	auto_is_running = false
	nx_destroy(form)
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

function on_btn_control_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running then
		auto_is_running = false
		btn.Text = nx_function("ext_utf8_to_widestr", "Chạy")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run(form)
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

function on_combobox_seed_selected(combobox)
end

function on_combobox_posp_selected(combobox)
end

function on_combobox_poss_selected(combobox)
end
