LuaQ  e   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_guildbuilding\form_guildbuilding_door_horse.lua           &      A@  @    A  @    Aΐ  @    A  @    A@ @  Aΐ   δ   Η@ δ@     Η δ  Ηΐ δΐ  Η  δ         Η@ δ@ Η δ Ηΐ δΐ Η          require    goods_grid    share\view_define    define\tip_define    tips_func_equip    util_functions      ΐ@     @b@   MOUNT_6_009_b    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_take_card_click    on_btn_cancel_click     on_form_shop_goods_mousein_grid !   on_form_shop_goods_mouseout_grid                   	@@	ΐ@	@A	@A        Fixed     npc_id        max_number            remain_number                             form                   )    .   E   @  \   ΐ       ΐ  Α  A    Δ   ΐ  ΒΕ   EΑ  \ ά  ΐΛ@Γ FC Α ΐ ά@ΖC Λ ΔAΑ  ά@ @D Εΐ E ά Α AA  EΑ E \ Υ@ΐ      	   nx_value 
   GoodsGrid    nx_is_valid 
   nx_create 
   ArrayList    nx_current 	   ConfigID    Count       π?
   item_type    get_prop_in_ItemQuery 
   nx_string 	   ItemType    GridAddItem    form_goods            SetBindIndex    lbl_num_info    Text    nx_widestr    remain_number    /    max_number     .                                                  !   "   "   "   "   "   "   "   $   $   $   $   $   %   %   %   %   %   (   (   (   (   (   (   (   (   (   (   (   (   )         form     -   
   GoodsGrid    -   
   item_data    !      	   ConfigID     +   -        E      \@         nx_destroy        ,   ,   ,   -         form                0   6     
   F @ F ΐ @  ΐ      @ ΐ @         Parent    nx_is_valid    Close     
   1   1   3   3   3   3   3   4   4   6         btn     	      form    	           9   H       F @ F ΐ @  ΐ   @        Αΐ   Ε@    ά Ϊ@  @ Α  ή  Λ@AE   \  Δ  ΖΑΑ ά@Λ Β ά@   	      Parent    nx_is_valid 	   nx_value    game_visual            CustomSend    nx_int    npc_id    Close        :   :   <   <   <   <   <   =   @   @   @   A   A   A   A   A   B   B   E   E   E   E   E   E   E   E   E   G   G   H         btn           form          game_visual             CLIENT_CUSTOMMSG_GUILDBUILDING    CLIENT_SUBMSG_GET_HORSE_CARD     J   P     
   F @ F ΐ @  ΐ      @ ΐ @         Parent    nx_is_valid    Close     
   K   K   M   M   M   M   M   N   N   P         btn     	      form    	           S   d     #    @          @  Α   Εΐ    ά Ϊ   ΐΛ A@   ά ΑΙ ΑΙ  AA  ΐΒB  KC \ B ΑB C A        IsEmpty 	   nx_value 
   GoodsGrid    nx_is_valid    GetItemData    Amount    Count 
   MaxAmount    nx_execute 
   tips_game    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop       @@   ParentForm     #   T   T   T   T   T   U   X   X   X   Y   Y   Y   Y   Y   Z   Z   Z   Z   \   \   ]   ]   _   _   _   `   a   a   b   b   b   b   b   _   d         self     "      index     "   
   GoodsGrid 	   "      viewobj    "           g   i           Α@    FΑ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm        h   h   h   h   h   i         self           index            &   	   	   	   
   
   
                                             )   )      -   +   6   0   H   H   H   9   P   J   d   S   i   g   i         CLIENT_CUSTOMMSG_GUILDBUILDING    %      CLIENT_SUBMSG_GET_HORSE_CARD    %   	   ConfigID    %       