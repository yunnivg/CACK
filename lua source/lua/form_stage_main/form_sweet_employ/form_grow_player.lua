LuaQ  W   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_sweet_employ\form_grow_player.lua           	B      A@  @    A  @    AÀ  @    A  @ @ A À Á  A A   Ê  $  Â $B   $  B $Â   $ Â $B         $ B $Â  $    Â $B    $    B $Â  $ Â $B  $ B $Â  $ Â $B  $    B         require 	   util_gui    util_functions 6   form_stage_main\form_sweet_employ\sweet_employ_define 6   form_stage_main\form_sweet_employ\sweet_employ_common 3   form_stage_main\form_sweet_employ\form_grow_player    form_common\form_confirm ,   form_stage_main\form_school_war\form_escort 1   form_stage_main\form_sweet_employ\form_buy_charm 7   form_stage_main\form_sweet_employ\form_buy_instruction '   share\SweetEmploy\Grow\Grow_player.ini    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    set_form_pos    load_grow_config    set_player_name    set_charm_level    set_used_charm_value    set_charm_value    get_level_title    set_level_title    set_form_data    add_data_bind    on_charm_level_change    on_used_charm_value_change    on_charm_value_change    on_power_level_change    on_btn_buy_click                   	@@A  ^          Fixed        ð?                         form                "   /        E      \@ E@     \@ E     \@ AÀ  ^          set_form_pos    add_data_bind    set_form_data       ð?       %   %   %   (   (   (   +   +   +   -   -   /         form                2   7        E      \@ A@  ^          nx_destroy       ð?       4   4   4   5   5   7         form                :   A     	   F @ @  À      @ À @         ParentForm    nx_is_valid    Close     	   <   =   =   =   =   =   >   >   A         btn           form               D   K        E   @  \ ÀÀ ÆÀ@ À  A@A	 ÀÁ ÆÀA À  A	      	   nx_value    gui    Left    Width        @     Àr@   Top    Height        F   F   F   H   H   H   H   H   H   I   I   I   I   I   K         form           gui               N   e     3      D    E@     \ Z@      K@ \ À  Í Á   @AA  ËA @Â ÁÂ  ÜA Á Ã  KA ÀC AÃ  \ Å   Ü Ã @  Å   Ü Ã @   ÷        get_ini    nx_is_valid    GetSectionCount               ð?   GetSectionByIndex    ReadInteger 
   use_value 
   cur_value    level_ration 
   nx_number    nx_int     3   S   S   S   T   T   T   T   T   U   X   X   Y   Y   Y   Y   \   \   \   ]   ]   ]   ]   ]   ^   ^   ^   ^   ^   _   _   _   _   _   `   `   `   `   `   `   `   `   a   a   a   a   a   a   a   a   Y   e   
      ini    2      count    2      (for index)    2      (for limit)    2      (for step)    2      i    1      level    1   
   use_value    1   
   cur_value    1      level_ration !   1         INI_GROW_PLAYER    table_used_charm_value    table_cur_charm_value     h   m     	   E   @  \ @ Å    Ü À        get_player_prop    Name 	   lbl_name    Text    nx_widestr     	   j   j   j   l   l   l   l   l   m         form           name               p   {        E   @  \   À   Å  Á  Ü XÀ À  À   Å   Ü     @A ÅÀ   Ü À         get_player_prop    CharmLevel    nx_int    MIN_LEVEL_CHARM    MAX_LEVEL_CHARM    lbl_charm_level    Text    nx_widestr        s   s   s   t   t   t   t   t   t   t   t   u   u   u   u   u   u   u   u   v   y   y   y   y   y   {         form           level               ~       7   E   \@ E@    ÁÀ    \    Á   Å@    Ü A  EA  X ÀÅ@    Ü A  E  À     ÁÀ   E  \ AW@B   E  \ Æ@ AÁ  À FC  À  IFÁC IA FÁC IÁ        load_grow_config    nx_int    get_player_prop    UsedCharmValue    CharmLevel    MIN_LEVEL_CHARM    MAX_LEVEL_CHARM         
   nx_number     util_format_string    ui_sweetemploy_22    lbl_used_charm_value    Text    nx_widestr    pbar_used_charm_value    Value    Maximum     7                                                                                                                                                                              form     6      value    6      level 
   6   
   max_value    6      text -   6         table_used_charm_value        ·    3   E   \@ E@    ÁÀ    \    Á   Å@    Ü A  EA  X ÀÅ@    Ü A  E  À     ÁÀ   E  \ AW@B   E  \ Æ@ AÁ  À FC  À  I        load_grow_config    nx_int    get_player_prop    CharmValue    CharmLevel    MIN_LEVEL_CHARM    MAX_LEVEL_CHARM         
   nx_number     util_format_string    ui_sweetemploy_22    lbl_charm_value    Text    nx_widestr     3   ¡   ¡   ¤   ¤   ¤   ¤   ¤   §   §   §   ¨   ¨   ¨   ¨   ¨   ¨   ¨   ¨   ©   ©   ©   ©   ©   ©   ©   ©   ª   ®   ¯   ¯   ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   ´   ´   ´   ´   ´   µ   µ   µ   µ   µ   ·         form     2      value    2      level 
   2   
   max_value    2      text -   2         table_cur_charm_value     º   Ð    @   E   @  Á    \     Å@  Á  Ü    Å     Ü   E  X ÀÅ     Ü   EA  À     Å     OÁ  E  ÁA\ ABÜ   @ E  A \ @@ Å@    @ E   \    Å Á D   À           nx_int    get_player_prop    PowerLevel    CharmLevel    MIN_LEVEL_CHARM    MAX_LEVEL_CHARM       @      @      ð?   MIN_POWER_LEVEL    MAX_POWER_LEVEL    nx_execute    Get_PowerLevel_Name     @   ½   ½   ½   ½   ½   À   À   À   À   À   Á   Á   Á   Á   Á   Á   Á   Á   Â   Â   Â   Â   Â   Â   Â   Â   Ã   Ç   Ç   Ç   Ç   Ç   Ç   Ç   Ç   Ç   Ç   Ç   È   È   È   È   È   È   È   È   É   É   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ë   Î   Î   Î   Î   Î   Î   Ð         form     ?      power_level    ?      charm_level 
   ?      level &   ?         FORM_ESCORT     Ó   Ù     	   E      \ @@ ÅÀ    Ü À         get_level_title    lbl_level_title    Text    nx_widestr     	   Ö   Ö   Ö   ×   ×   ×   ×   ×   Ù         form           title               Ü   ð        E   \@ E@     \@ E     \@ EÀ     \@ E     \@ E@    \@         load_grow_config    set_player_name    set_charm_level    set_used_charm_value    set_charm_value    set_level_title        ß   ß   â   â   â   å   å   å   è   è   è   ë   ë   ë   î   î   î   ð         form                ó   ÿ     	*   E   @  \   À   @      ÀÀ  AA   Å Ü Â @ÀÀ  AA   Å Ü B @ÀÀ  AA   Å Ü Â @ÀÀ  AA   Å Ü B @     	   nx_value    data_binder    nx_is_valid    AddRolePropertyBind    CharmLevel    int    nx_current    on_charm_level_change    UsedCharmValue    on_used_charm_value_change    CharmValue    on_charm_value_change    PowerLevel    on_power_level_change     *   õ   õ   õ   ö   ö   ö   ö   ö   ÷   ú   ú   ú   ú   ú   ú   ú   ú   û   û   û   û   û   û   û   û   ü   ü   ü   ü   ü   ü   ü   ü   ý   ý   ý   ý   ý   ý   ý   ý   ÿ         form     )      binder    )                    E      \@         set_form_data                      form                	         E      \@         set_used_charm_value                      form                         E      \@         set_charm_value                      form                         E      \@         set_level_title                      form                  '      F @ @  À   @        Ä    @        ParentForm    nx_is_valid    util_show_form           !  !  !  !  !  "  %  %  %  %  '        btn           form             FORM_BUY_INSTRUCTION B                     	   	   	   
   
   
                                 /   "   7   2   A   :   K   D   e   e   e   e   N   m   h   {   p         ~   ·   ·      Ð   Ð   º   Ù   Ó   ð   Ü   ÿ   ó         	          '  '    '        FORM_GROW_PLAYER    A      FORM_CONFIRM    A      FORM_ESCORT    A      FORM_BUY_CHARM    A      FORM_BUY_INSTRUCTION    A      INI_GROW_PLAYER    A      table_used_charm_value    A      table_cur_charm_value    A       