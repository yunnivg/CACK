LuaQ  ^   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_world_war\form_world_war_result_tips.lua                 A@  @   J  Ŕ  @AŔA@BI@ ŔB C@CŔC@DI ¤    ¤@  Ŕ ¤    ¤Ŕ  @ ¤                  require 	   util_gui :   form_stage_main\form_world_war\form_world_war_result_tips       y@        (   gui\language\ChineseS\worldwar\lbjs.png       đ?+   gui\language\ChineseS\worldwar\dmyyjsl.png        @+   gui\language\ChineseS\worldwar\xmfgjsl.png      y@)   gui\language\ChineseS\worldwar\lxcpj.png )   gui\language\ChineseS\worldwar\lxcsl.png -   gui\language\ChineseS\worldwar\lxcxssysl.png       @,   gui\language\ChineseS\worldwar\lxcblgsl.png       @,   gui\language\ChineseS\worldwar\lxcxdmsl.png    main_form_init    on_main_form_open    close_self    on_main_form_close 
   open_form           "        	@@        Fixed            "         form                $   1         E   @  \ ŔŔ ĆŔ@ Ŕ  A	 Á ĆA Ŕ  AŔA	 Â @B   @   Ĺ  ËŔBA A Ĺ Ü Â @  B ÁB Ü@     	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height       Y@   Desktop    ToFront    GAME_TIMER 	   Register      Ă@      đż   nx_current    close_self         &   &   &   (   (   (   (   (   )   )   )   )   )   )   +   +   +   +   -   -   -   /   /   /   /   /   /   /   /   /   /   1         form           gui          timer               3   7        Ĺ      Ü Ú   @ Ë@@ Ü@         nx_is_valid    Close        4   4   4   4   4   5   5   7         form           param1           param2                9   C        E   @  \   Ŕ      @ŔŔ   AA   @  Ŕ         Ŕ   @      	   nx_value    GAME_TIMER    nx_is_valid    UnRegister    nx_current    close_self    nx_destroy        ;   ;   ;   <   <   <   <   <   =   =   =   =   =   =   @   @   @   @   @   A   A   A   C         form           timer               E   w    V   E      \ @  Ŕ       Ŕ @   Ŕ  Á  A D   Â   Ĺ@    Ü Ú@      ŔAË BÜ@ Ĺ@ ĆÂ   Ü ŔÂ    Ć C   AA  EA   \ ZA      KC\ A  Ŕ A      Á ËÄAB Ü  Ä ĆÄ    ÂD    ÂDEB Â\ 	BÂDFÂEÂDÂEMOĆ	BÂDFFÂDFMOĆ	B     	   nx_value    nx_is_valid    Close    nx_execute 	   util_gui    util_get_form    Visible    Show    table    getn               đ?   game_client 	   GetScene 
   nx_number 
   QueryProp 	   SourceID     lbl_result 
   BackImage 
   nx_string    Left    Width        @   Top    Height     V   F   F   F   G   G   G   G   G   H   H   I   L   L   L   L   L   L   L   N   N   N   N   N   O   R   S   S   U   U   U   U   U   U   V   Y   [   [   [   ]   ]   ]   ]   ]   ^   a   a   c   c   c   c   c   d   g   g   g   g   g   i   i   k   k   l   o   o   o   p   s   s   s   s   s   u   u   u   u   u   u   u   v   v   v   v   v   v   v   w         arg     U      form    U      form    U      result #   U      game_client &   U      scene .   U   	   scene_id 9   U      info ;   U      
   FORM_NAME    RESULT_PIC    	   	   	                                             "      1   $   7   3   C   9   w   w   w   E   w      
   FORM_NAME          RESULT_PIC           