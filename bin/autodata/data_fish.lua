function get_data()
	local map = get_current_map()
	-- Yến Kinh
	if map == "city01" then
		return {
			"fishnpc10076", -- Đàn Cá Tầm Trắng
			"fishnpc10098" -- Đàn Cá Bạc Trắng
		}
	end
	-- Thành Đô
	if map == "city05" then
		return {
			"fishnpc10013", -- Đàn Cá Hồi
			"fishnpc10054new" -- Đàn Cá Sộp Tươi
		}
	end
	return false
end
