list_seeds = {
	"croppernpc20051", -- Lúa mạch
	"croppernpc20052", -- Lúa
	"croppernpc10001", -- Măng Đông
	"croppernpc10010", -- Rau Thơm
	"croppernpc10011", -- Tỏi
	"croppernpc10043", -- Trữ Ma
	"croppernpc10044", -- Hỏa Ma
	"croppernpc10045", -- La Bố Ma
	"croppernpc10007", -- Sơn dược
	"croppernpc10033", -- Mã Đề (Mã Thầy)
	"croppernpc10032", -- Tần Bì (Hoa Tiêu)
	"croppernpc10015", -- Hồ Tiêu
	"croppernpc20001", -- Nghị Tàm
	"croppernpc20002", -- Sa Tàm
	"croppernpc20003", -- Chương Tàm Noãn
	"croppernpc30003", -- Cây Thông ...
	"croppernpc30001", -- Hoa hồng
	"yhgcjmh_001", -- Cúc Thập Cẩm
	"yhgcjmh_002", -- Thược Dược
	"yhgcjmh_003", -- Đại Tuyết Tố
	"yhgcjmh_004", -- Đinh Hương
	"yhgcjmh_005" -- Phụng Tiên Hoa
}
nongyao_data = {
	{grass = "nongyao10003", worm = "nongyao10002"}, -- Sâu thông thường
	{grass = "nongyao10007", worm = "nongyao10006"} -- Loại hoa
}
-- nongyao áp dụng cho cây, tằm thì chỉ có một. 1 là sâu thông thường, 2 là loại hoa
-- croptype 0 là cây 1 là tằm
function get_seed_data(seedvalue)
	-- Lúa mạch
	if seedvalue == util_text("croppernpc20051") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1113",
			croppernpc = "croppernpc20051",
			resource = "npc\\cj_040051"
		}
	end
	-- Lúa
	if seedvalue == util_text("croppernpc20052") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1114",
			croppernpc = "croppernpc20052",
			resource = "npc\\cj_040051"
		}
	end
	-- Măng Đông
	if seedvalue == util_text("croppernpc10001") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1001",
			croppernpc = "croppernpc10001",
			resource = "npc\\cj_040012"
		}
	end
	-- Tỏi
	if seedvalue == util_text("croppernpc10011") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1011",
			croppernpc = "croppernpc10011",
			resource = "npc\\cj_041120a"
		}
	end
	-- Rau Thơm
	if seedvalue == util_text("croppernpc10010") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1010",
			croppernpc = "croppernpc10010",
			resource = "npc\\cj_ty0003a"
		}
	end
	-- Trữ ma
	if seedvalue == util_text("croppernpc10043") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1043",
			croppernpc = "croppernpc10043",
			resource = "npc\\cj_040201"
		}
	end
	-- Hỏa ma
	if seedvalue == util_text("croppernpc10044") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1044",
			croppernpc = "croppernpc10044",
			resource = "npc\\cj_040201"
		}
	end
	-- La bố ma
	if seedvalue == util_text("croppernpc10045") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1045",
			croppernpc = "croppernpc10045",
			resource = "npc\\cj_040201"
		}
	end
	-- Sơn dược
	if seedvalue == util_text("croppernpc10007") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1007",
			croppernpc = "croppernpc10007",
			resource = "npc\\cj_040014"
		}
	end
	-- Mã Đề (Mã Thầy)
	if seedvalue == util_text("croppernpc10033") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1033",
			croppernpc = "croppernpc10033",
			resource = "npc\\cj_040018"
		}
	end
	-- Hoa Tiêu
	if seedvalue == util_text("croppernpc10032") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1032",
			croppernpc = "croppernpc10032",
			resource = "npc\\cj_ty0001b"
		}
	end
	-- Hồ Tiêu
	if seedvalue == util_text("croppernpc10015") then
		return {
			nongyao = 1,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed1015",
			croppernpc = "croppernpc10015",
			resource = "npc\\cj_ty0001b"
		}
	end
	-- Nghị Tàm
	if seedvalue == util_text("croppernpc20001") then
		return {
			nongyao = 1,
			croptype = 1,
			numonepoint = 6,
			seedid = "seed63",
			croppernpc = "croppernpc20001",
			resource = "npc\\cj_040204"
		}
	end
	-- Sa Tàm
	if seedvalue == util_text("croppernpc20002") then
		return {
			nongyao = 1,
			croptype = 1,
			numonepoint = 6,
			seedid = "seed64",
			croppernpc = "croppernpc20002",
			resource = "npc\\cj_040204"
		}
	end
	-- Chương Tàm Noãn
	if seedvalue == util_text("croppernpc20003") then
		return {
			nongyao = 1,
			croptype = 1,
			numonepoint = 6,
			seedid = "seed65",
			croppernpc = "croppernpc20003",
			resource = "npc\\cj_040204"
		}
	end
	-- Cây thông blabla các kiểu
	if seedvalue == util_text("croppernpc30003") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "haiwai_Christmastreeseed",
			croppernpc = "croppernpc30003",
			resource = "npc\\npcitem929"
		}
	end
	-- Hoa hồng
	if seedvalue == util_text("croppernpc30001") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "seed2001",
			croppernpc = "croppernpc30001",
			resource = "npc\\itemnpc818"
		}
	end
	-- Cúc thập cẩm
	if seedvalue == util_text("yhgcjmh_001") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "yhgcjmhzz001",
			croppernpc = "yhgcjmh001",
			resource = "npc\\itemnpc455"
		}
	end
	-- Thược Dược
	if seedvalue == util_text("yhgcjmh_002") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "yhgcjmhzz002",
			croppernpc = "yhgcjmh002",
			resource = "npc\\itemnpc456"
		}
	end
	-- Đại Tuyết Tố
	if seedvalue == util_text("yhgcjmh_003") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "yhgcjmhzz003",
			croppernpc = "yhgcjmh003",
			resource = "npc\\itemnpc454"
		}
	end
	-- Đinh Hương
	if seedvalue == util_text("yhgcjmh_004") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "yhgcjmhzz004",
			croppernpc = "yhgcjmh004",
			resource = "npc\\itemnpc453"
		}
	end
	-- Phụng Tiên Hoa
	if seedvalue == util_text("yhgcjmh_005") then
		return {
			nongyao = 2,
			croptype = 0,
			numonepoint = 9,
			seedid = "yhgcjmhzz005",
			croppernpc = "yhgcjmh005",
			resource = "npc\\itemnpc456"
		}
	end
	return false
end
-- Lấy danh sách các điểm trồng cây và nuôi tằm mà MAP hỗ trợ
function get_listpos(map)
	-- Thiên đăng trấn
	if map == "born04" then
		return {6, 2}
	end
	-- Thành Đô
	if map == "city05" then
		return {2, 1}
	end
	return false
end
-- Lấy tọa độ trồng cây
function get_dataposp(map, posvalue)
	local datapos = false
	-- Thiên đăng trấn
	if map == "born04" then
		datapos = {
			{{x = 619.695, y = -39.684, z = 655.062}, {x = 619.759, y = -39.685, z = 646.301}},
			{{x = 607.614, y = -39.684, z = 676.535}, {x = 606.975, y = -39.684, z = 685.874}},
			{{x = 606.868, y = -39.684, z = 695.763}, {x = 606.310, y = -39.684, z = 705.447}},
			{{x = 587.868, y = -41.695, z = 704.704}, {x = 579.036, y = -41.695, z = 703.944}},
			{{x = 578.648, y = -41.695, z = 694.115}, {x = 588.051, y = -41.695, z = 694.579}},
			{{x = 588.118, y = -41.695, z = 686.328}, {x = 579.831, y = -41.695, z = 686.566}}
		}
	end
	-- Thành Đô
	if map == "city05" then
		datapos = {
			{{x = 520.905, y = 16.042, z = 787.033}, {x = 515.046, y = 17.126, z = 791.580}},
			{{x = 506.155, y = 18.906, z = 805.393}, {x = 503.945, y = 18.649 , z = 812.305}}
		}
	end
	if datapos == false then
		return false
	end
	local id = 0
	for i = 1, 20 do
		if posvalue == (nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" ") .. nx_widestr(tostring(i))) then
			id = i
			break
		end
	end
	if id == 0 or id > table.getn(datapos) then
		return false
	end
	return datapos[id]
end
-- Lấy tọa độ nuôi tằm
function get_dataposs(map, posvalue)
	local datapos = false
	-- Thiên đăng trấn
	if map == "born04" then
		datapos = {
			{x = 613.563, y = -39.684, z = 672.094},
			{x = 635.587, y = -39.604, z = 676.768}
		}
	end
	-- Thành Đô - Thằng này chưa làm đâu
	if map == "city05" then
		datapos = {
			{x = 613.563, y = -39.684, z = 672.094},
			{x = 635.587, y = -39.604, z = 676.768}
		}
	end
	if datapos == false then
		return false
	end
	local id = 0
	for i = 1, 20 do
		if posvalue == (nx_function("ext_utf8_to_widestr", "Vị trí số") .. nx_widestr(" ") .. nx_widestr(tostring(i))) then
			id = i
			break
		end
	end
	if id == 0 or id > table.getn(datapos) then
		return false
	end
	return datapos[id]
end
