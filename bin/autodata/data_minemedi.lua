function get_data()
	local map = get_current_map()
	-- Quân Tử Đường
	if map == "school03" then
		return {
			"kuangshi_1002npc01", -- Đồng khoáng
			"drug_1002npc01", -- Khổ Tình Hoa
			"toxicant_1002npc01" -- Đoạn Trường Hoa
		}
	end
	-- Nga My
	if map == "school06" then
		return {
			"kuangshi_1002npc01" -- Đồng khoáng
		}
	end
	-- Đường Môn
	if map == "school05" then
		return {
			"kuangshi_1002npc01" -- Đồng khoáng
		}
	end
	-- Tô Châu
	if map == "city02" then
		return {
			"kuangshi_1003npc01", -- Diên Khoáng
			"drug_1003npc01", -- Ngải Thảo
			"toxicant_1003npc01" -- Độc Nhất Vị
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
			"kuangshi_1001npc01", -- Thiết Khoáng
			"toxicant_1001npc01" -- Hồng Phấn Bạch Chu
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
	-- Kim Lăng
	if map == "city03" then
		return {
			"drug_1004npc01", -- Bạch Thuật
			"toxicant_1004npc01", -- Mã Thiền Tử
			"kuangshi_1004npc01" -- Ngân Khoáng
		}
	end
	-- Hoang Mạc Bao La
	if map == "scene14" then
		return {
			"jh_sh_gathernpc_1012" -- Tùng Mộc
		}
	end
	-- Cái Bang
	if map == "school02" then
		return {
			"toxicant_1002npc01" -- Đoạn Trường Hoa
		}
	end
	return false
end
function get_data_pos(id)
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
		-- Khổ Tình Hoa
		if id == util_text("drug_1002npc01") then
			return {
				{x = 1123.718, y = 5.854, z = 1193.623},
				{x = 953.082, y = 4.958, z = 1230.600}
			}
		end
		-- Đoạn Trường Hoa
		if id == util_text("toxicant_1002npc01") then
			return {
				{x = 1185.801, y = 46.857, z = 184.128},
				{x = 1011.254, y = 72.033, z = 51.547}
			}
		end
	end
	-- Đường Môn
	if map == "school05" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			return {
				{x = 610.244, y = 20.523, z = 618.751},
				{x = 503.201, y = -12.361, z = 622.314},
				{x = 516.398, y = 44.497, z = 772.539}
			}
		end
	end
	-- Tô Châu
	if map == "city02" then
		-- Diên khoáng
		if id == util_text("kuangshi_1003npc01") then
			return {
				{x = 1734.842, y = 5.576, z = 327.667},
				{x = 1651.532, y = 2.233, z = 477.975},
				{x = 1758.140, y = 2.605, z = 759.232}
			}
		end
		-- Ngải Thảo
		if id == util_text("drug_1003npc01") then
			return {
				{x = 547.365, y = -0.436, z = 875.354},
				{x = 237.859, y = 5.180, z = 878.576}
			}
		end
		-- Độc Nhất Vị
		if id == util_text("toxicant_1003npc01") then
			return {
				{x = 1499.334, y = 1.721, z = 443.073},
				{x = 1880.605, y = 24.153, z = 416.679}
			}
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
		-- Hồng Phấn Bạch Chu
		if id == util_text("toxicant_1001npc01") then
			return {
				{x = 264.100, y = 26.639, z = 543.837},
				{x = 244.386, y = 36.511, z = 654.556}				
			}
		end
	end
	-- Cực Lạc Cốc
	if map == "school04" then
		-- Đồng khoáng
		if id == util_text("kuangshi_1002npc01") then
			return {
				{x = 872.036, y = 14.495, z = 300.579},
				{x = 810.543, y = 19.083, z = 465.835}
			}
		end
	end
	-- Yến Kinh
	if map == "city01" then
		-- Diên khoáng
		if id == util_text("kuangshi_1003npc01") then
			return {
				{x = 1020.328, y = -76.435, z = 196.159},
				{x = 992.636, y = -71.380, z = -309.893}
			}
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
			return {
				{x = 175.621, y = 16.550, z = 321.110},
				{x = 24.396, y = 28.483, z = 164.450},
				{x = -23.104, y = 39.803, z = 67.657}
			}
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
	-- Kim Lăng
	if map == "city03" then
		-- Bạch Thuật
		if id == util_text("drug_1004npc01") then
			return {
				{x = 976.707, y = 9.374, z = 2064.413}
			}
		end
		-- Mã Thiền Tử
		if id == util_text("toxicant_1004npc01") then
			return {
				{x = 1854.105, y = 1.394, z = 1829.869},
				{x = 1612.138, y = 10.529, z = 2121.125}
			}
		end
		-- Ngân Khoáng
		if id == util_text("kuangshi_1004npc01") then
			return {
				{x = 1558.758, y = 9.708, z = 16.431}
			}
		end
	end
	-- Hoang Mạc Bao La
	if map == "scene14" then
		-- Cây Tùng
		if id == util_text("jh_sh_gathernpc_1012") then
			return {
				{x = 884.758, y = 104.640, z = 442.144}
			}
		end
	end
	-- Cái Bang
	if map == "school02" then
		-- Đoạn Trường Hoa
		if id == util_text("toxicant_1002npc01") then
			return {
				{x = 641.928, y = 1.969, z = 670.027},
				{x = 359.103, y = 10.025, z = 668.836}
			}
		end
	end
	return false
end
