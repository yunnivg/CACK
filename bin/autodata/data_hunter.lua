function get_data()
	local map = get_current_map()
	-- Thiên Đăng Trấn
	if map == "born04" then
		return {
			"lifeanimalm07002" -- Heo Rừng Lớn
		}
	end
	-- Thành Đô
	if map == "city05" then
		return {
			"lifeanimalnew001" -- Heo Con
		}
	end
	-- Yến Kinh
	if map == "city01" then
		return {
			"monc022106" -- Rắn Độc Hàm Đàn
		}
	end
	-- Ác Nhân Cốc
	if map == "born02" then
		return {
			"lifeanimalv02001" -- Dê Hoa Điền
		}
	end
	-- Lạc Dương
	if map == "city04" then
		return {
			"monc040200" -- Ác Khuyển
		}
	end
	return false
end

function get_detail_data(map, idtext)
	if map == "born04" then
		-- Heo Rừng Lớn
		if idtext == util_text("lifeanimalm07002") then
			return {
				centerPOS = {757.703, -41.017, 1209.859},
                objectConfigID = "lifeanimalm07002",
                numberGather = 2,
                maxAllowedDistance = 34
			}
		end
	end
	if map == "city05" then
		-- Heo Con
		if idtext == util_text("lifeanimalnew001") then
			return {
				centerPOS = {541.779, 23.043, 826.328},
                objectConfigID = "lifeanimalnew001",
                numberGather = 1,
                maxAllowedDistance = 34
			}
		end
	end
	if map == "city01" then
		-- Yến Kinh
		if idtext == util_text("monc022106") then
			return {
				centerPOS = {1858.294, -22.473, 1417.941},
                objectConfigID = "monc022106",
                numberGather = 2,
                maxAllowedDistance = 30
			}
		end
	end
	if map == "born02" then
		-- Ác Nhân Cốc
		if idtext == util_text("lifeanimalv02001") then
			return {
				centerPOS = {307.668, 25.152, 760.376},
                objectConfigID = "lifeanimalv02001",
                numberGather = 1,
                maxAllowedDistance = 30
			}
		end
	end
    -- Lạc Dương
	if map == "city04" then
		-- Ác Khuyển
		if idtext == util_text("monc040200") then
			return {
				centerPOS = {832.598, -26.423, 902.653},
                objectConfigID = "monc040200",
                numberGather = 2,
                maxAllowedDistance = 30
			}
		end
	end
    return false
end
