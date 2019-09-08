function get_data()
	local map = nx_value("form_stage_main\\form_map\\form_map_scene").current_map
	-- Thành Đô
	if map == "city05" then
		return {
			"tre_1001npc01" -- Cây bạch dương
		}
	end
	-- Võ Đang
	if map == "school07" then
		return {
			"tre_1002npc01" -- Cây bách
		}
	end
	-- Tô Châu
	if map == "city02" then
		return {
			"tre_1003npc01" -- Cây quế
		}
	end
	-- Thiên Đăng Trấn
	if map == "born04" then
		return {
			"tre_1001npc01" -- Cây bạch dương
		}
	end
	-- Cực Lạc Cốc
	if map == "school04" then
		return {
			"tre_1002npc01" -- Cây bách
		}
	end
	-- Quân Tử Đường
	if map == "school03" then
		return {
			"tre_1002npc01" -- Cây bách
		}
	end
	-- Yến Kinh
	if map == "city01" then
		return {
			"tre_1003npc01" -- Cây quế
		}
	end
	-- Bồng Lai Đảo (Đảo Thanh Hải 1)
	if map == "scene16" then
		return {
			"Gather_pld_009" -- Thanh Trúc
		}
	end
	-- Vô Cực Đảo (Đảo Thanh Hải 4)
	if map == "scene19" then
		return {
			"itemnpc_wjd_05" -- Cây Bạch Dương
		}
	end
	-- Hiệp Khách Đảo
	if map == "scene17" then
		return {
			"Gather_xiakedao_guoshu" -- Cây ăn quả
		}
	end
	-- NMQ thủ quân
	if map == "clone004_qb" then
		return {
			"GatherClone004005", -- Khoáng Thạch
			"GatherClone004006" -- Nguyên Liệu Gỗ
		}
	end
	return false
end
function get_data_pos(id)
	local map = nx_value("form_stage_main\\form_map\\form_map_scene").current_map
	-- Thành Đô
	if map == "city05" then
		-- Cây bạch dương
		if id == util_text("tre_1001npc01") then
			return {
				{x = 298.629, y = 27.537, z = 566.470},
				{x = 326.722, y = 26.599, z = 690.368}
			}
		end
	end
	-- Thiên Đăng Trấn
	if map == "born04" then
		-- Cây bạch dương
		if id == util_text("tre_1001npc01") then
			return {
				{x = 364.985, y = -25.689, z = 731.351},
				{x = 469.892, y = -30.372, z = 871.290}
			}
		end
	end
	-- Võ Đang
	if map == "school07" then
		-- Cây bách
		if id == util_text("tre_1002npc01") then
			return {
				{x = 28.791, y = 19.567, z = 636.403},
				{x = 176.155, y = 5.559, z = 786.989}
			}
		end
	end
	-- Tô Châu
	if map == "city02" then
		-- Cây quế
		if id == util_text("tre_1003npc01") then
			return {
				{x = 863.152, y = 12.820, z = 602.466},
				{x = 1188.534, y = 16.868, z = 295.824},
				{x = 1623.181, y = 4.846, z = 221.000}
			}
		end
	end
	-- Cực Lạc Cốc
	if map == "school04" then
		-- Cây bách
		if id == util_text("tre_1002npc01") then
			return {
				{x = 607.074, y = 38.874, z = 88.496},
				{x = 420.281, y = 21.442, z = 209.950}
			}
		end
	end
	-- Quân Tử Đường
	if map == "school03" then
		-- Cây bách
		if id == util_text("tre_1002npc01") then
			return {
				{x = 1064.103, y = 7.165, z = 1245.232},
				{x = 1297.691, y = 59.549, z = 1192.319},
			}
		end
	end
	-- Yến Kinh
	if map == "city01" then
		-- Cây quế
		if id == util_text("tre_1003npc01") then
			return {
				{x = 1088.813, y = -105.969, z = 1305.310},
				{x = 1261.250, y = -94.630, z = 1037.750},
				{x = 1498.703, y = -78.008, z = 890.929}
			}
		end
	end
    if map == "scene16" then
        -- Thanh Trúc
        if id == util_text("Gather_pld_009") then
            return {
                {x = -101.501, y = 317.880, z = -431.493}
            }
        end
    end
    if map == "scene19" then
        -- Thanh Bạch Dương
        if id == util_text("itemnpc_wjd_05") then
            return {
                {x = 120.345, y = 121.084, z = -1.347}
            }
        end
    end
    if map == "clone004_qb" then
        -- Khoáng Thạch
        if id == util_text("GatherClone004005") then
            return {
                {x = 54.038, y = -9.328, z = 720.559}
            }
        end
        -- Nguyên Liệu Gỗ
        if id == util_text("GatherClone004006") then
            return {
                {x = 78.124, y = -3.659, z = 639.703}
            }
        end
    end
    if map == "scene17" then
        -- Cây Ăn Quả
        if id == util_text("Gather_xiakedao_guoshu") then
            return {
                {x = 363.068, y = 138.792, z = -765.974}
            }
        end
    end
	return false
end
