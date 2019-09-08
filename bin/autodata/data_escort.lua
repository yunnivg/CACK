function get_escort_data(city)
	-- Thành Đô
	if city == "city05" then
		return {
			npcpos = {
				x = 722.129,
				y = 23.046,
				z = 519.694
			},
			npc = {
				name = "EscortAcceptNpc001",
				id = 252
			},
			escortpos = {
				x = 722.129,
				y = 23.046,
				z = 519.694
			}
		}
	end
	-- Lạc Dương
	if city == "city04" then
		return {
			npcpos = {
				x = 915.173,
				y = -24.855,
				z = 801.451
			},
			npc = {
				name = "EscortAcceptNpc003",
				id = 232
			},
			escortpos = {
				x = 925.267,
				y = -24.852,
				z = 798.049
			}
		}
	end
	-- Yến Kinh
	if city == "city01" then
		return {
			npcpos = {
				x = 591.118,
				y = -105.567,
				z = 226.041
			},
			npc = {
				name = "EscortAcceptNpc004",
				id = 206
			},
			escortpos = {
				x = 591.382,
				y = -106.12,
				z = 218.543
			}
		}
	end
	-- Kim Lăng
	if city == "city03" then
		return {
			npcpos = {
				x = 1428.08,
				y = 8.409,
				z = 712.372
			},
			npc = {
				name = "EscortAcceptNpc005",
				id = 242
			},
			escortpos = {
				x = 1427.985,
				y = 8.409,
				z = 722.392
			}
		}
	end
	-- Tô Châu
	if city == "city02" then
		return {
			npcpos = {
				x = 428.180,
				y = 1.142,
				z = 628.191
			},
			npc = {
				name = "EscortAcceptNpc002",
				id = 219
			},
			escortpos = {
				x = 428.180,
				y = 1.142,
				z = 628.191
			}
		}
	end
	return false
end
