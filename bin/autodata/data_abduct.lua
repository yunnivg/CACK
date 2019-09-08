abductPos = {}
abductSell = {}
waitPosAfterSell = {}
homePointReturn = {}
prestallPos = {}

-- Thành Đô
local keymap = "city05"
abductPos[keymap] = {
    {841.584,  027.441,  551.853},
    {837.650,  027.445,  582.939},
    {764.359,  023.318,  596.338},
    {739.795,  023.045,  696.686},
    {703.166,  023.010,  672.906},
    {671.361,  023.031,  726.202},
    {623.519,  023.057,  751.948},
    {586.013,  023.306,  792.897},
    {560.328,  023.103,  640.293},
    {444.207,  023.069,  608.577},
    {716.668,  023.082,  522.533},
    {757.674,  023.047,  452.068},
    {1189.038, 81.492,   680.250},
    {670.500,  23.775,   1022.957},
    {274.479,  107.993,  308.674},
    {275.281,  122.267,  210.091}
}
abductSell[keymap] = {
    {
        -- Bán ở Tiền Trang
        npc = "FuncNpc00608",
        x = 738.651,
        y = 023.814,
        z = 680.628
    }, {
        -- Bán ở Chủ Khách Sạn (Tôn A Đạt)
        npc = "FuncNpc00615",
        x = 547.249,
        y = 23.316,
        z = 595.249
    }
}

waitPosAfterSell[keymap] = {}
waitPosAfterSell[keymap][1] = {773.700, 23.009, 662.497}
waitPosAfterSell[keymap][2] = {770.869, 23.009, 665.621}
waitPosAfterSell[keymap][3] = {768.468, 23.010, 668.271}
waitPosAfterSell[keymap][4] = {765.836, 23.013, 671.174}
waitPosAfterSell[keymap][5] = {762.732, 23.017, 674.599}
waitPosAfterSell[keymap][6] = {760.837, 23.019, 677.744}
waitPosAfterSell[keymap][7] = {757.629, 23.023, 681.284}
waitPosAfterSell[keymap][8] = {754.656, 23.027, 684.564}
waitPosAfterSell[keymap][9] = {751.863, 23.030, 687.645}
waitPosAfterSell[keymap][10] = {749.140, 23.033, 690.650}
waitPosAfterSell[keymap][11] = {744.219, 23.042, 696.077}
waitPosAfterSell[keymap][12] = {740.310, 23.046, 700.390}
waitPosAfterSell[keymap][13] = {737.485, 23.046, 703.507}
waitPosAfterSell[keymap][14] = {734.834, 23.046, 706.432}
waitPosAfterSell[keymap][15] = {733.290, 23.049, 711.613}
waitPosAfterSell[keymap][16] = {729.313, 23.054, 715.999}
waitPosAfterSell[keymap][17] = {724.012, 23.059, 720.121}
waitPosAfterSell[keymap][18] = {720.280, 23.065, 726.233}
waitPosAfterSell[keymap][19] = {717.062, 23.068, 729.782}
waitPosAfterSell[keymap][20] = {713.176, 23.072, 734.070}
waitPosAfterSell[keymap][21] = {709.347, 23.077, 738.296}
waitPosAfterSell[keymap][22] = {705.758, 23.081, 742.255}
waitPosAfterSell[keymap][23] = {702.615, 23.113, 745.724}
waitPosAfterSell[keymap][24] = {699.436, 23.113, 749.230}
waitPosAfterSell[keymap][25] = {696.318, 23.113, 746.404}
waitPosAfterSell[keymap][26] = {693.300, 23.110, 743.669}
waitPosAfterSell[keymap][27] = {690.644, 23.092, 741.262}
waitPosAfterSell[keymap][28] = {687.912, 23.075, 738.784}
waitPosAfterSell[keymap][29] = {685.287, 23.057, 736.406}
waitPosAfterSell[keymap][30] = {682.297, 23.043, 733.695}
waitPosAfterSell[keymap][31] = {679.936, 23.040, 731.555}
waitPosAfterSell[keymap][32] = {677.007, 23.037, 728.901}
waitPosAfterSell[keymap][33] = {674.699, 23.034, 726.809}
waitPosAfterSell[keymap][34] = {671.883, 23.031, 724.256}

homePointReturn[keymap] = {}
homePointReturn[keymap][1] = "HomePointcity05B"
prestallPos[keymap] = {770.489, 23.048, 623.580}

-- Kim Lăng
local keymap = "city03"
abductPos[keymap] = {
    {1776.503, 7.548, 1654.705},
    {2090.379, 24.705, 1575.170},
    {1956.250, 2.524, 572.250},
    {1966.003, 2.524, 527.999},
    {1388.372, 1.583, 1291.024},
    {734.482, 4.480, 1702.730},
    {1322.013, 0.150, 1733.618},
    {1758.601, 0.370, 1740.806}
}
abductSell[keymap] = {
    {
        -- Chủ Tiệm Tạp Hóa
        npc = "FuncNpc02613",
        x = 1405.012,
        y = 2.238,
        z = 1286.153
    }, {
        -- Bán ở Chủ Tiệm Vũ Khí
        npc = "FuncNpc02603",
        x = 1370.642,
        y = 14.050,
        z = 907.148
    }
}
waitPosAfterSell[keymap] = {}
waitPosAfterSell[keymap][1] = {1388.504, 13.363, 911.762}
waitPosAfterSell[keymap][2] = {1388.441, 13.363, 955.517}
waitPosAfterSell[keymap][3] = {1388.466, 13.363, 1022.530}
waitPosAfterSell[keymap][4] = {1388.088, 13.363, 1065.130}
waitPosAfterSell[keymap][5] = {1387.606, 13.363, 1104.028}
waitPosAfterSell[keymap][6] = {1387.549, 13.363, 1135.039}
waitPosAfterSell[keymap][7] = {1387.564, 13.363, 1161.652}
waitPosAfterSell[keymap][8] = {1387.297, 12.805, 1197.537}
waitPosAfterSell[keymap][9] = {1387.803, 8.193, 1222.687}
waitPosAfterSell[keymap][10] = {1388.259, 1.690, 1258.156}

homePointReturn[keymap] = {}
homePointReturn[keymap][1] = "HomePointcity03C"

-- Tô Châu
local keymap = "city02"
abductPos[keymap] = {
    {422.605, 0.565, 744.096},
    {447.228, 0.565, 699.518},
    {473.618, 0.631, 637.608},
    {264.210, 4.946, 637.802},
    {354.795, 3.231, 370.988},
    {487.115, 2.950, 399.395},
    {533.855, 2.966, 371.058},
    {629.667, 0.609, 439.417},
    {761.663, 0.649, 481.648}
}
abductSell[keymap] = {
    {
        -- Đỗ Bách Niên
        npc = "FuncNpc00104",
        x = 537.533,
        y = 4.285,
        z = 355.620
    }, {
        -- Bạch Căng Nhu (Chủ tiệm tơ lụa)
        npc = "FuncNpc00102",
        x = 476.448,
        y = 3.223,
        z = 395.274
    }
}
waitPosAfterSell[keymap] = {}
waitPosAfterSell[keymap][1] = {495.994, 2.966, 395.658}
waitPosAfterSell[keymap][2] = {486.718, 2.966, 425.108}
waitPosAfterSell[keymap][3] = {508.371, 2.966, 431.195}
waitPosAfterSell[keymap][4] = {528.446, 2.966, 438.118}
waitPosAfterSell[keymap][5] = {542.949, 2.966, 441.902}
waitPosAfterSell[keymap][6] = {545.695, 2.966, 431.382}
waitPosAfterSell[keymap][7] = {548.671, 2.966, 419.974}
waitPosAfterSell[keymap][8] = {551.684, 2.966, 408.427}
waitPosAfterSell[keymap][9] = {555.131, 2.966, 395.216}
waitPosAfterSell[keymap][10] = {542.202, 2.966, 377.331}
waitPosAfterSell[keymap][11] = {526.911, 5.453, 388.668}
waitPosAfterSell[keymap][12] = {530.617, 5.300, 399.703}
waitPosAfterSell[keymap][13] = {533.730, 5.300, 408.975}
waitPosAfterSell[keymap][14] = {523.554, 5.300, 412.393}
waitPosAfterSell[keymap][15] = {519.505, 5.300, 400.333}

--homePointReturn[keymap] = "HomePointcity02E"
homePointReturn[keymap] = {}
homePointReturn[keymap][1] = "HomePointcity02F"
prestallPos[keymap] = {531.524, 2.965, 374.911}
