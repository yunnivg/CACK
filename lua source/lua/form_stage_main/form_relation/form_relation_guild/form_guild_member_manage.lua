LuaQ  o   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_member_manage.lua                 A@  @    A  @ $   ΐ  $@    $  @ $ΐ   $  ΐ $@   $ @ $ΐ  $  ΐ         require    custom_sender 	   util_gui    main_form_init    on_main_form_open    open_member_manage    on_recv_position_list    on_main_form_close    on_btn_close_click    on_btn_cancel_click    on_btn_ok_click    is_default_name 	                  	@@	ΐ@        Fixed     checked_no       πΏ                      self                           E   @  \ ΐΐ Ζΐ@ ΐ  A	 Α ΖA ΐ  A	ΐA Ε@  AΑ  ά  ΐ          	   nx_value    gui    Left    Width        @   Top    Height    combobox_post    Text    nx_widestr 
   util_text    ui_xuanzezhiwei       π?                                                                                  self           gui                   (          Α@   Ε    ά Ϊ   Ζΐ@A @   Ι Ε ά@         util_get_form K   form_stage_main\form_relation\form_relation_guild\form_guild_member_manage    nx_is_valid 	   lbl_name    Text    nx_widestr    custom_request_guild_pos_list        !   !   !   !   #   #   #   #   #   $   $   $   $   $   &   &   (         name           arg           form               +   I     K   E   @  \   ΐ   @      I Α@Α @    Α  Ε    ά Ϊ@      Εΐ Ζ Β   ά AΒ BA ΑΒ CACA IΐC @  ΑB FΒ    ΐΒΒ CDΒ Ε C FΓ  ά    B  ΒΒ CDΒ ΖΒ  B   EB \ BEΒ  ΐ Γ FΓ  \B  φ     	   nx_value K   form_stage_main\form_relation\form_relation_guild\form_guild_member_manage    nx_is_valid    Visible    Show    gui    table    getn    groupbox_pos 
   DeleteAll    combobox_post    DropListBox    ClearString    checked_no       πΏ      π?   is_default_name 
   AddString    nx_widestr 
   util_text 
   nx_string    pos_    nx_set_custom     K   ,   ,   ,   .   .   .   .   .   /   1   2   2   3   3   3   4   4   4   4   4   5   8   8   8   8   ;   ;   ;   =   =   =   =   >   ?   ?   ?   ?   @   @   @   @   @   A   A   A   A   A   A   A   A   A   A   A   A   C   C   C   C   C   C   C   F   F   F   F   F   G   G   G   G   G   G   G   ?   I   	      arg     J      form    J      gui    J      num    J      (for index) $   J      (for limit) $   J      (for step) $   J      i %   I   	   pro_name B   I           L   N        E      \@         nx_destroy        M   M   M   N         self                Q   V     	   F @ @  ΐ      @ ΐ @         ParentForm    nx_is_valid    Close     	   R   S   S   S   S   S   T   T   V         btn           form               Y   ^     	   F @ @  ΐ      @ ΐ @         ParentForm    nx_is_valid    Close     	   Z   [   [   [   [   [   \   \   ^         btn           form               a   x     '   F @ @  ΐ   @      ΐ ΐ@ A@A    Α Α LB Υ A @ A       @ EΑ  ΖAΓ ΖΓ ΐ \AKΑΓ \A         ParentForm    nx_is_valid    combobox_post    DropListBox    SelectIndex            pos_ 
   nx_string       π?   nx_find_custom 
   nx_custom    custom_request_change_position    nx_widestr 	   lbl_name    Text    Close     '   b   c   c   c   c   c   d   g   g   g   i   i   j   m   m   m   m   m   n   n   n   n   n   n   o   r   r   r   r   u   u   u   u   u   u   u   w   w   x         btn     &      form    &      select_index 
   &      cur_pro_name    &   	   pos_name    &           {        Z   E      \    Α@     B  ^  ΐE      \    Α     B  ^   E      \    Αΐ     B  ^  @E      \    Α     B  ^  
E      \    Α@    B  ^  ΐE      \    Α    B  ^   E      \    Αΐ    B  ^  @E      \    Α    @ B  ^  B   ^    	      nx_widestr    ui_guild_pos_level1_name    ui_guild_pos_level2_name    ui_guild_pos_level3_name    ui_guild_pos_level4_name    ui_guild_pos_level5_name    ui_guild_pos_level6_name    ui_guild_pos_level7_name    ui_guild_pos_level8_name     Z   |   |   |   |   |   |   |   |   }   }   }   ~   ~   ~   ~   ~   ~   ~   ~                                                                                                                                                                                                                           	   pos_name     Y                                        (       I   +   N   L   V   Q   ^   Y   x   a      {              