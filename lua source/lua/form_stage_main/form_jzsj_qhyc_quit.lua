LuaQ  H   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_jzsj_qhyc_quit.lua                 A@  @    A  @ $   Ŕ  $@    $  @ $Ŕ   $  Ŕ $@   $ @   
      require 	   util_gui    util_functions    main_form_init    on_main_form_open    on_main_form_close    on_btn_tips_click 	   ShowForm 	   HideForm    Giveup                   	@@A  ^          Fixed        đ?                         self                           E   @  \ ŔŔ  A@AA	 Ŕ        	   nx_value    gui    Top    Desktop    Height        @      i@      đ?                                              self     
      gui    
                      E      \@ A@  ^          nx_destroy       đ?                               self                !   #        E   \@         Giveup        "   "   #         btn                &   *      
      A@    ÁŔ   B   K A \@         nx_execute 	   util_gui    util_get_form $   form_stage_main\form_jzsj_qhyc_quit    Show     
   '   '   '   '   '   '   '   )   )   *         form    	           -   3            A@    ÁŔ    B   E     \ Z   @ K@A \@         nx_execute 	   util_gui    util_get_form $   form_stage_main\form_jzsj_qhyc_quit    nx_is_valid    Close        .   .   .   .   .   .   .   0   0   0   0   0   1   1   3         form               6   U      3      A@   K@ \ Ŕ  Ŕ   @        Á@  AÁ  Â   Ĺ    Ü AÂBÁ E Á Á   EB  \ \A  KC\A EÁ  Ŕ B \ WÄ     ÁÁ  EB  \ A       	   nx_value    game_client 
   GetPlayer    nx_is_valid    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    gui    TextManager    GetText    ui_jzsj_qhyc_giveup    show_common_text    nx_widestr 
   ShowModal    nx_wait_event     ×A   confirm_return    ok    custom_sender    custom_send_jzsj_qhyc    nx_int             3   9   9   9   :   :   <   <   <   <   <   =   A   A   A   A   A   A   A   B   B   B   E   E   E   E   F   F   F   F   F   F   F   F   I   I   L   L   L   L   L   N   N   O   S   S   S   S   S   S   S   U         game_client    2      client_player    2      dialog    2      gui    2      text    2      res (   2                   	   	   	                     #   !   *   &   3   -   U   6   U           