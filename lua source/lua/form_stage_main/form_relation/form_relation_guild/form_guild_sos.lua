LuaQ  e   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_sos.lua                  A@  @    A  @    AÀ  @    A  @ @ A ¤   À ¤@    ¤  @ ¤À   ¤      À ¤@   ¤ @ ¤À          require    util_functions    custom_sender 	   util_gui    share\client_custom_define       Y@     @Y@   main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_ok_click    on_btn_cancel_click    recv_help_data    get_scene_id_by_name                   	@@EÀ    \ 	@ 	 Á	ÀA        Fixed  	   req_name    nx_widestr        req_uid    remain_time                                              form                   $        	@@EÀ    \ 	@ EÀ    \ 	@FA À  Á   I        Fixed  	   req_name    nx_widestr        req_uid    lbl_remain_time    Text                           !   !   !   !   #   #   #   #   #   $         self                '   2        E   @  \   À      @ ÀÀ @   À   @        	   nx_value    GuildManager    nx_is_valid    EndTimerOfHelpItem    nx_destroy        (   (   (   *   *   *   *   *   ,   ,   /   /   /   1   2         form           GuildManager               5   C        F @ @  À   @        ÁÀ   Å@    Ü Ú   @ Ë AÜ@ Ë@Á Ü@         ParentForm    nx_is_valid 	   nx_value    GuildManager    EndTimerOfHelpItem    Close        6   7   7   7   7   7   8   ;   ;   ;   =   =   =   =   =   ?   ?   B   B   C         btn           form          GuildManager 
              F   T        F @ @  À   @  @     À  Á   Å@    Ü Ú@  @ Á  Þ  Ë@AE Á \  Ä   ÆÂ BÂ E  \ Ü@          ParentForm    nx_is_valid         	   nx_value    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD 	   req_name    req_uid       ð?        G   H   H   H   H   H   I   I   L   L   L   N   N   N   N   N   O   O   R   R   R   R   R   R   R   S   S   S   S   S   R   T         btn           form          game_visual          '   SUB_CUSTOMMSG_GUILD_TRANS_TO_REQHELPER     W   f        F @ @  À   @        ÁÀ   Å@    Ü Ú   @ Ë AÜ@ Ë@Á Ü@         ParentForm    nx_is_valid 	   nx_value    GuildManager    EndTimerOfHelpItem    Close        X   Y   Y   Y   Y   Y   Z   ]   ]   ]   _   _   _   _   _   a   a   d   d   f         btn           form          GuildManager 
              i        	Y   E   @  \   À   @        Æ@A  IÀA I  Â Å  ÁÀ Ü ÀÂ Å  Á E AC \   Ü  ÀÃ Å  Á FÁC  Ü  À Ä Å  A Ü  E ÁD \   E  \  Å BE Ü   Å  Ü ÕÀÀÀÅ Å  F Ü À@Æ Å  F Ü ÀÀF  G@Æ@Ç  A  É Å   Á Ü   @    È A  !   	   nx_value A   form_stage_main\form_relation\form_relation_guild\form_guild_sos    nx_is_valid 	   req_name    nx_widestr       ð?   req_uid        @	   lbl_name    Text 
   lbl_scene 
   util_text    get_scene_id_by_name       @	   lbl_area       @   lbl_pos    (    nx_int       @   ,       @   )    lbl_number       @   lbl_max_number        @      "@        	   lbl_time 	   00:00:00    GuildManager    RegisterTimerOfHelpItem     Y   j   j   j   k   k   k   k   k   l   o   o   o   o   p   p   r   r   r   r   r   s   s   s   s   s   s   s   s   s   t   t   t   t   t   t   t   u   u   u   u   u   u   u   u   u   v   v   v   v   v   v   v   v   v   v   v   v   v   x   x   x   x   x   y   y   y   y   y   z   }   }   ~   ~   ~   ~   ~   ~                                             arg     X      form    X      remain_time E   X      GuildManager P   X                   #   E   @  Á  Á  \   À   @  @      @Á  Á Á A  Á `AÌ ÂEB Â  MB \     ^ _ýAÁ ^         nx_execute    util_functions    get_ini    share\rule\maplist.ini    nx_is_valid    GetSectionItemCount                   ð?
   nx_string    GetSectionItemValue     #                                                                                                            
   	   scene_id     "      ini    "      item_count    "      index    "      scene_name    "      (for index)           (for limit)           (for step)           i          scene_name                                 	   	   	   
   
   
               $      2   '   C   5   T   T   F   f   W      i               '   SUB_CUSTOMMSG_GUILD_TRANS_TO_REQHELPER       $   SUB_CUSTOMMSG_GUILD_REQ_HELPER_INFO           