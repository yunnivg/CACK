require("utils")
require("util_gui")
require("util_move")
require("util_functions")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_minemedi2"
local PICK_FORM = "form_stage_main\\form_pick\\form_droppick"
local auto_is_running = false
local direct_run = false
local INTVAL_MESSAGE = 0
local PICK_FORM_TIMEOUT = 15 -- 15 giây không có form thì bỏ
local PICK_FORM_STARTTRACE = 0


function auto_run()
	local step = 1 
	local pos_current = 1
	local pos_numbers = 1
	local num_cut = 0
	local wait_for_pickform = false
	
	direct_run = true
	
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
		local form = nx_value(THIS_FORM)
		if not nx_is_valid(form) then
			is_vaild_data = false
		end
		if is_vaild_data == true then
			local ids = get_data()
			local ads = get_data2()
			if ids == false then 
				control_this_form(form, ids, ads)
				return false
			end
			local logicstate = player_client:QueryProp("LogicState")
			
			-- Nếu bị chết thì phải bắt đầu lại từ đầu
			if logicstate == 120 then
				step = 1
				pos_current = 1
				nx_execute("custom_sender", "custom_relive", 2, 0)
				nx_pause(15)
			end
			
			local selected_text = form.combobox_ids.Text
			local selected_text2 = form.combobox_ads.Text
			local pos = get_data_pos(selected_text, selected_text2)
			local city = get_current_map()
			
			if pos == false then
				control_this_form(form, false, pos2)
				return false
			end
			pos_numbers = table.getn(pos)
			if pos_current > pos_numbers then
				pos_current = 1
			end
			
			-- Đến điểm pos[pos_current]
			if step == 1 then
				if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 1) then
					tools_move(city, pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, direct_run)
					logmessage(nx_function("ext_utf8_to_widestr", "Chạy đến điểm thứ") .. nx_widestr(" ") .. nx_widestr(tostring(pos_current)))
					direct_run = false
				else
					-- Đến điểm có cây gỗ thì chuyển sang bước 2
					step = 2
					num_cut = 0
					wait_for_pickform = false
					logmessage(nx_function("ext_utf8_to_widestr", "Đã tới điểm thứ") .. nx_widestr(" ") .. nx_widestr(tostring(pos_current)), true, true)
				end
			-- Chờ cho cây hoặc khoáng ra rồi hái, đào
			elseif step == 2 or step == 3 then
				if not tools_move_isArrived(pos[pos_current].x, pos[pos_current].y, pos[pos_current].z, 1) and step == 2 then
					direct_run = true
					step = 1
					logmessage(nx_function("ext_utf8_to_widestr", "Đi ngu rồi quay về đi ngài nhỏ"), true, true)
				else
					if wait_for_pickform then
						logmessage(nx_function("ext_utf8_to_widestr", "Chờ loop đồ"), true, true)
						local form_pick = nx_value(PICK_FORM)
						if nx_is_valid(form_pick) and form_pick.Visible then
							nx_pause(2)
							local form_pick1 = nx_value(PICK_FORM)
							if nx_is_valid(form_pick1) and form_pick1.Visible then
								nx_execute(PICK_FORM, "on_btn_pick_click", form_pick1.btn_pick)
								wait_for_pickform = false
							end
						end
						if wait_for_pickform and tools_difftime(PICK_FORM_STARTTRACE) >= PICK_FORM_TIMEOUT then
							wait_for_pickform = false
							logmessage(nx_function("ext_utf8_to_widestr", "Ỉa trong quần là ỉa trong quần"), true, true)
						end
					else
						local game_scence_objs = game_scence:GetSceneObjList()
						local num_objs = table.getn(game_scence_objs)
						local wood_ident = false
						local objPos = {}
						
						for i = 1, num_objs do
							local cfg_text = util_text(nx_string(game_scence_objs[i]:QueryProp("ConfigID")))
							local ident = game_scence_objs[i].Ident
							if cfg_text == selected_text then
								objPos.x = game_scence_objs[i].PosiX
								objPos.y = game_scence_objs[i].PosiY
								objPos.z = game_scence_objs[i].PosiZ
								wood_ident = ident
								step = 3
								break;
							end
						end
						
						-- Có khoáng hoặc cây
						if wood_ident ~= false then
							-- Chạy lại chỗ đó (Thử lại 5 lần)
							direct_run = true
							local okPos = false
							logmessage(nx_function("ext_utf8_to_widestr", "Ding ding hú tạch tạch tạch"), true, true)
							for i = 1, 5 do
								if not tools_move_isArrived(objPos.x, objPos.y, objPos.z, 0.5) then
									tools_move(city, objPos.x, objPos.y, objPos.z, direct_run)
									direct_run = false
									nx_pause(1)
								else
									okPos = true
									break
								end
							end
							
							if okPos then
								logmessage(nx_function("ext_utf8_to_widestr", "Hốt nào"), true, true)
								nx_execute("custom_sender", "custom_select", wood_ident)
								nx_pause(0.2)
								nx_execute("custom_sender", "custom_select", wood_ident)
								nx_pause(0.2)
								nx_execute("custom_sender", "custom_select", wood_ident)
								nx_pause(0.2)
								nx_execute("custom_sender", "custom_select", wood_ident)
								num_cut = num_cut + 1
								wait_for_pickform = true
								PICK_FORM_STARTTRACE = os.time()
							end
						else
							logmessage(nx_function("ext_utf8_to_widestr", "Ding ding ding"))
						end
						
						-- Chặt hết cây
						if wood_ident == false and num_cut ~= 0 then
							pos_current = pos_current + 1
							if pos_current > pos_numbers then
								pos_current = 1
							end
							step = 1
							logmessage(nx_function("ext_utf8_to_widestr", "Teonu hú tạch tạch tạch"), true, true)
						end
					end
				end
			end
		end
		nx_pause(1)
	end
end
function get_data()
	local map = get_current_map()
	-- KL
	if map == "city03" then
		return {
			"kuangshi_1004npc01", -- Ngân Khoáng
		}
	end
	-- Quân Tử Đường
	if map == "school03" then
		return {
			"kuangshi_1002npc01", -- Đồng khoáng
		}
	end
		-- Nga My
	if map == "school06" then
		return {
			"kuangshi_1002npc01", -- Đồng khoáng
		}
	end
	-- Đường Môn
	if map == "school05" then
		return {
			"kuangshi_1002npc01", -- Đồng khoáng
		}
	end
	-- Tô Châu
	if map == "city02" then
		return {
			"kuangshi_1003npc01" -- Diên Khoáng
		}
	end
	-- Thiên Đăng Trấn
	if map == "born04" then
		return {
			"kuangshi_1001npc01" -- Thiết Khoáng
		}
	end
	-- Thành Đô
	if map == "city05" then
		return {
			"kuangshi_1001npc01" -- Thiết Khoáng
		}
	end
	-- Cực Lạc Cốc
	if map == "school04" then
		return {
			"kuangshi_1002npc01" -- Đồng khoáng
		}
	end
	-- Võ Đang
	if map == "school07" then
		return {
			"kuangshi_1002npc01" -- Đồng khoáng
		}
	end
	-- Yến Kinh
	if map == "city01" then
		return {
			"kuangshi_1003npc01" -- Diên Khoáng
		}
	end
	-- Lạc Dương
	if map == "city04" then
		return {
			"drug_1001npc01" -- Bạc Hà
		}
	end
	-- Yên Vũ Trang
	if map == "born03" then
		return {
			"toxicant_1001npc01", -- Hồng Phấn Bạch Chu
			"drug_1001npc01",	-- Bạc Hà
			"kuangshi_1001npc01", --Thiết Khoáng
		}
	end
	-- Kê Minh Dịch
	if map == "born01" then
		return {
				"drug_1001npc01",	-- Bạc Hà
				"kuangshi_1001npc01", --Thiết Khoáng
				"toxicant_1001npc01",		
		}
	end
	-- Ác Nhân Cốc
	if map == "born02" then
		return {
			"drug_1001npc01",	-- Bạc Hà
			"kuangshi_1001npc01", --Thiết Khoáng
			"toxicant_1001npc01" -- Hồng Phấn Bạch Chu
		}
	end
	return false
end
function get_data2()
	return {
	"B1", -- Lúa mạch
	"B2", -- Lúa
	"B3", -- Rau Thơm
	"B4",
	"B5",
	"B6",
	}
end
function get_data_pos(id, as)

	local map = get_current_map()
	-- Quân Tử Đường
	if map == "school03" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			return {
				{x = 1198.326, y = 8.314, z = 1121.685},
				{x = 1202.574, y = 4.250, z = 962.572},
				{x = 1523.266, y = -0.599, z = 966.391}
			}
		end
	end
	---KL
	if map == "city03" then
		-- ngan
		if id == util_text("kuangshi_1004npc01") then
			return {
				{x = 1782.656006, y = 13.594021, z = 176.419006},
				{x = 1791.207031, y = 22.953415, z = 190.348999},
				{x = 1644.18103, y = 2.800036, z = 113.524002},
				{x = 1631.285034, y = 1.727633, z = 145.253006},
				{x = 1530.36499, y = 9.50058, z = 33.526001},
				{x = 1566.590942, y = 9.944057, z = 11.047},
				{x = 1167.859985, y = 2.662972, z = 115.495003}
			}
		end
	end
	-- Đường Môn
	if map == "school05" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			if as == util_text("B1") then
			return {
				{x = 610.244, y = 20.523, z = 618.751},
				{x = 503.201, y = -12.361, z = 622.314},
				{x = 516.398, y = 44.497, z = 772.539}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 798.004028, y = -1.459381, z = 281.334991},
				{x = 801.594971, y = 29.778292, z = 614.268982},
			}
			end
			
		end
	end
	-- Tô Châu
	if map == "city02" then
		-- Diên khoáng
		if id == util_text("kuangshi_1003npc01") then
			if as == util_text("B1") then
			return {
				{x = 1734.842, y = 5.576, z = 327.667},
				{x = 1651.532, y = 2.233, z = 477.975},
				{x = 1758.140, y = 2.605, z = 759.232}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 1184.630005, y = 18.65867, z = 1235.979004},
				{x = 1243.961, y = 0.361, z = 976.000},
				{x = 1302.343994, y = 6.265267, z = 980.075989}
			}
			end
		end
	end
	-- Thiên Đăng Trấn
	if map == "born04" then
		-- Thiết khoáng
		if id == util_text("kuangshi_1001npc01") then
			return {
				{x = 646.675, y = -43.181, z = 908.064},
				{x = 702.477, y = -36.092, z = 897.055},
				{x = 777.764, y = -31.803, z = 917.164}
			}
		end
	end
	-- Thành Đô
	if map == "city05" then
		-- Thiết khoáng
		if id == util_text("kuangshi_1001npc01") then
			return {
				{x = 484.545, y = 16.364, z = 996.176},
				{x = 735.914, y = 43.820, z = 1180.685}				
			}
		end
	end
	-- Cực Lạc Cốc
	if map == "school04" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			if as == util_text("B1") then
			return {
				{x = 872.036, y = 14.495, z = 300.579},
				{x = 810.543, y = 19.083, z = 465.835}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 924.06897, y = 17.383715, z = 812.770996},
				{x = 640.859985, y = 4.889003, z = 950.070984},
				{x = 298.705994, y = 24.568701, z = 696.187988},
				{x = 470.654999, y = 8.052087, z = 563.072021},
			}
			end
			
		end
	end
	-- Yến Kinh
	if map == "city01" then
		-- Diên khoáng
		if id == util_text("kuangshi_1003npc01") then
			if as == util_text("B1") then
			return {
				{x = 1020.328, y = -76.435, z = 196.159},
				{x = 992.636, y = -71.380, z = -309.893}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 793.432007, y = -120.011932, z = 1382.758057},
				{x = 1076.225952, y = -76.667862, z = 946.987},
			}
			end
		end
	end
	-- Nga My
	if map == "school06" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			return {
				{x = 412.114, y = -7.435, z = 920.399},
				{x = 342.491, y = 15.958, z = 859.062},
				{x = 158.676, y = 0.705, z = 762.064}
			}
		end
	end
	-- Võ Đang
	if map == "school07" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			if as == util_text("B1") then
			return {
				{x = 175.621, y = 16.550, z = 321.110},
				{x = 24.396, y = 28.483, z = 164.450},
				{x = -23.104, y = 39.803, z = 67.657}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 824.859009, y = -4.268806, z = 571.627991},
				{x = 971.021973, y = 4.836304, z = 365.381989},
				{x = 1203.280029, y = -13.958677, z = 421.850006}
			}
			end
			if as == util_text("B3") then
			return {
				{x = 456.444, y = 3.441508, z = 1124.468018},
				{x = 262.868988, y = 32.037598, z = 1113.807983},
			}
			end
		end
	end
	-- Lạc Dương
	if map == "city04" then
		-- Bạc Hà
		if id == util_text("drug_1001npc01") then
			return {
				{x = 662.991, y = -19.687, z = 1150.124},
				{x = 809.397, y = -21.638, z = 1173.984},
				{x = 965.856, y = -13.374, z = 1190.551}
			}
		end
	end
	-- Kê Minh Dịch
	if map == "born01" then
		-- Bạc Hà
		if id == util_text("drug_1001npc01") then
			if as == util_text("B1") then
			return {
				{x = 924.019, y = 4.552, z = 222.297},
				{x = 948.336, y = 9.878, z = 99.335},
				{x = 1076.035, y = 43.566, z = 224.550}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 399.868988, y = 1.511701, z = 318.042999},
				{x = 249.399002, y = 31.528879, z = 399.421997},
				{x = 73.889, y = 130.419464, z = 521.080017}
			}
			end
			if as == util_text("B3") then
			return {
				{x = -65.556999, y = 131.326462, z = 891.281006},
				{x = -125.75099, y = 172.987885, z = 689.567017}
			}
			end
		end
		if	id == util_text("kuangshi_1001npc01") then -- Thiết Khoáng
			if as == util_text("B1") then
			return {
				{x = 115.599998, y = 128.412872, z = 844.781982},
				{x = -72.524002, y = 139.289261, z = 652.057983},
				{x = -120.862999, y = 137.583725, z = 824.299988}
			}
			end
			if as == util_text("B2") then
						return {
				{x = 423.699005, y = 14.354462, z = 469.769012},
				{x = 220.992996, y = 0.904234, z = 185.944},
				{x = 78.413002, y = 131.670853, z = 411.296997}
			}
			end
			if as == util_text("B3") then
						return {
				{x = 423.699005, y = 14.354462, z = 469.769012},
				{x = 220.992996, y = 0.904234, z = 185.944},
				{x = 78.413002, y = 131.670853, z = 411.296997}
			}
			end
		end
		if	id == util_text("toxicant_1001npc01") then -- Hồng Phấn Bạch Chu
			if as == util_text("B1") then
			return {
				{x = 394.471008, y = 1.032688, z = 286.559998},
				{x = 201.389999, y = 70.764748, z = 471.052002},
				{x = 286.191986, y = 45.044643, z = 519.072021},
				{x = 249.233994, y = 105.891205, z = 690.807983}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 1015.429016, y = 18.454231, z = 75.023003},
				{x = 957.867981, y = 4.446818, z = 287.058014},
			}
			end
		end
	end
	-- Yên Vũ Trang
	if map == "born03" then
		-- Hồng Phấn Bạch Chu
		if id == util_text("toxicant_1001npc01") then
			return {
				{x = 243.231, y = 48.496, z = 752.263},
				{x = 365.116, y = 40.909, z = 526.638},
				{x = 376.404, y = 78.971, z = 337.465}
			}
		end
		if	id == util_text("kuangshi_1001npc01") then -- Thiết Khoáng
			if as == util_text("B1") then
			return {
				{x = 644.182983, y = 96.9077, z = 471.53299},
				{x = 1112.982056, y = 81.755165, z = 570.317017},
				{x = 1068.13501, y = 78.925087, z = 342.04599}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 723.914978, y = 127.800827, z = 74.638},
				{x = 503.796997, y = 157.43248, z = 177.524002},
				{x = 398.934998, y = 118.848595, z = 261.717987}
			}
			end
			if as == util_text("B3") then
						return {
				{x = 398.934998, y = 118.848595, z = 261.717987},
				{x = 260.462006, y = 137.312927, z = 123.296997},
				{x = 168.817993, y = 134.392258, z = 99.945999}
			}
			end
		end
		if id == util_text("drug_1001npc01") then
			return {
				{x = 242.266006, y = 163.750763, z = 434.653992},
				{x = 16.865, y = 93.753189, z = 571.153992},
			}
		end
	end
	-- Ác Nhân Cốc
	if map == "born02" then
			-- Bạc Hà
		if id == util_text("drug_1001npc01") then
			if as == util_text("B1") then
			return {
				{x = 412.053986, y = 4.105547, z = 248.953995},
				{x = 243.078995, y = 7.113964, z = 342.459015},
				{x = 110.113998, y = 12.268224, z = 422.766998}
			}
			end
			if as == util_text("B2") then
			return {
				{x = -200.979996, y = 3.090832, z = 524.249023},
				{x = -216.160995, y = -0.2786, z = 678.846008},
				{x = -611.794983, y = 20.348934, z = 716.383972},
			}
			end
			if as == util_text("B3") then
			return {
				{x = -93.866997, y = -3.57508, z = 17.965},
				{x = 25.379999, y = -3.000679, z = 92.82},
				{x = 217.621002, y = 6.521861, z = 52.529999}
			}
			end
		end
		-- Hồng Phấn Bạch Chu
		if id == util_text("toxicant_1001npc01") then
			if as == util_text("B1") then
			return {
				{x = 354.198, y = 10.057, z = 367.405},
				{x = 144.040, y = 5.976, z = 360.593},
				{x = 21.912, y = 4.566, z = 421.569}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 394.817993, y = 10.672659, z = 452.03299},
				{x = 525.562988, y = 3.407488, z = 811.721008},
				{x = 176.322998, y = 29.652817, z = 777.867981}
			}
			end
			
		end
		if	id == util_text("kuangshi_1001npc01") then -- Thiết Khoáng
			if as == util_text("B1") then
			return {
				{x = -151.822006, y = 3.523445, z = 707.809998},
				{x = -73.991997, y = -0.303163, z = 544.189026},
				{x = -74.833, y = -1.324733, z = 421.483002}
			}
			end
			if as == util_text("B2") then
			return {
				{x = 183.785995, y = 8.447066, z = 413.356995},
				{x = 455.347992, y = 1.57416, z = 408.730988},
				{x = 428.279999, y = 21.818157, z = 581.322021},
				{x = 491.294006, y = 16.066301, z = 607.357971}
			}
			end
			
		end
	end
	return false
end
function control_this_form(form, ids, ads)
	local map = get_current_map()
	form.lbl_2.Text = util_text(map)
	if ids == false then
		auto_is_running = false
		form.btn_control.Text = nx_widestr("...")
		form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Không hỗ trợ")
		return false
	end
	local combobox_ids = form.combobox_ids
	combobox_ids.DropListBox:ClearString()
	if combobox_ids.DroppedDown then
		combobox_ids.DroppedDown = false
	end
	for i = 1, table.getn(ids) do
		combobox_ids.DropListBox:AddString(util_text(ids[i]))
	end
	combobox_ids.Text = util_text(ids[1])
	
	local combobox_ads = form.combobox_ads
	combobox_ads.DropListBox:ClearString()
	if combobox_ads.DroppedDown then
		combobox_ads.DroppedDown = false
	end
	for i = 1, table.getn(ads) do
		combobox_ads.DropListBox:AddString(util_text(ads[i]))
	end
	combobox_ads.Text = util_text(ads[1])
	form.lbl_4.Text = nx_function("ext_utf8_to_widestr", "Able")
	form.btn_control.Text = nx_function("ext_utf8_to_widestr", "Cởi Quần")
end
function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end
function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
	local ids = get_data()
	local ads = get_data2()
	control_this_form(form, ids, ads)
	
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
	if btn.Text == nx_widestr("...") then
		return 0
	end
	if auto_is_running then
		auto_is_running = false
		btn.Text = nx_function("ext_utf8_to_widestr", "Chạy")
	else
		auto_is_running = true
		btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
		auto_run()
	end
end
function change_form_size()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	local gui = nx_value("gui")
	form.Left = (gui.Width - form.Width) / 2
	--form.Top = (gui.Height - form.Height) / 2
	form.Top = 100
end
function on_combobox_ids_selected(combobox)
end
function on_combobox_ads_selected(combobox)
end
function get_current_map()
	return nx_value("form_stage_main\\form_map\\form_map_scene").current_map
end
function logmessage(text, resetCounter, resetAfterCall)
	if resetCounter ~= nil then
		INTVAL_MESSAGE = 0
	end
	INTVAL_MESSAGE = INTVAL_MESSAGE + 1
	if INTVAL_MESSAGE == 1 then
		tools_show_notice(text)
	end
	if INTVAL_MESSAGE >= 6 then
		INTVAL_MESSAGE = 0
	end
	if resetAfterCall ~= nil then
		INTVAL_MESSAGE = 0
	end
end
