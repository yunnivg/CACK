LuaQ  ]   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_battlefield\form_battlefield_result.lua           g      A@  @   AÀ    Á@  AÁ  ÁA  A  ÁÂ  AC  ÁÃ 
A D Á Å A E Á Æ A F Á "DAÄ ¤     ¤D  D ¤   ¤Ä     Ä ¤  ¤D D ¤  ¤Ä Ä ¤ 	 ¤D D	 ¤ 	 ¤Ä Ä	 ¤ 
 ¤D           D
 ¤   
 ¤Ä        Ä
 ¤          ¤D             D ¤         ¤Ä Ä ¤        ¤D D ¤       3      require 	   util_gui    rec_friend 
   rec_buddy       ð?       @              ð¿   battlefield_result_array       $@9   form_stage_main\form_battlefield\form_battlefield_result        @      @'   ini\ui\battlefield\tvt_battlefield.ini     share\Karma\Groupkarma_pack.ini    share\War\battlefield_rule.ini    weapontype100    weapontype101    weapontype102    weapontype103    weapontype104    weapontype105    weapontype106    weapontype108    weapontype107    weapontype109    weapontype110    255,179,139,114    main_form_init    main_form_open    main_form_close    on_btn_query_click    on_btn_close_click    on_btn_battle_ranging_click    on_btn_help_click    on_pbar_side_get_capture    on_pbar_side_lost_capture    on_pbar_dead_get_capture    on_pbar_dead_lost_capture    on_pbar_wrestle_get_capture    on_pbar_wrestle_lost_capture    update_battlefield_result    refresh_pbar    refresh_friend_combobox    get_combobox_list    refresh_battlefield_grid    on_rbtn_checked_changed #   on_textgrid_battle_info_select_row    refresh_this_battle    get_mapid_section_index    close_form        M   W       	@@EÀ    Á@   \ 	@ E @ \ Z@              Fixed     ini    nx_execute    util_functions    get_ini    nx_is_valid        N   Q   Q   Q   Q   Q   Q   S   S   S   S   S   U   W         form              BATTLEFIELD_INI_PATH     Z        
m   E   @  \ ÀÀ ÆÀ@ À  A	 Á ÆA À  A	   ÁÀ  Ë BÜ A @ A  @   ÁÂ A  @   A KÃÁ \  FÁC FÄA À  IFD ÁÄA IAEÅÂ A A Å AB A Å A A ÅÂ A A ÅB A A Å A A ÅÂ A A Å A A ÅB A A IÉAI ÁIJ ÊÁJ ÊK ËK ÁÅL ËL ÁÅAL ËAL ÁÅL ÁÉL ÁM ÁÉ  5   	   nx_value    gui    Left    Width        @   Top    Height    game_client 
   GetPlayer    nx_is_valid       ð?	   FindProp    Name    nx_widestr 
   QueryProp    combobox_friend 
   InputEdit    Text    textgrid_battle_info 	   ClearRow 	   ColCount       "@   SetColWidth               W@      :@      E@      @      6@      @      @      @      @       @      X@
   RowHeight       7@   rbtn_two_side    Checked    lbl_kill_mizong    Visible     lbl_desc_kill_mizong 
   pbar_side    Maximum      p§@   Value 
   pbar_dead    pbar_wrestle    ani_connect 	   PlayMode    lbl_connect     m   \   \   \   ]   ]   ]   ]   ]   ^   ^   ^   ^   ^   `   `   `   b   b   c   c   c   c   c   d   d   g   g   g   g   g   h   h   k   k   k   k   k   l   l   l   l   l   l   n   p   p   q   r   r   r   r   s   s   s   s   t   t   t   t   u   u   u   u   v   v   v   v   w   w   w   w   x   x   x   x   y   y   y   y   z   z   z   z   |   ~   ~                                                                              form     l      gui    l      client    l      client_role    l      player_name %   l      grid ,   l                      E      \@         nx_destroy                          form                   ¦       F @ @  À   @      À À@ AÅ@  AÁ   À Ü@Æ Â ÉÂÆ Â É ÃÆ@Ã ÉÂ        ParentForm    nx_is_valid    combobox_friend 
   InputEdit    Text    nx_execute    custom_sender    custom_battlefield    ani_connect    Visible 	   PlayMode        @   lbl_connect                                                              £   £   ¤   ¤   ¥   ¥   ¦         btn           form          player_name 
            CLIENT_SUBMSG_REQUEST_LOOK     ©   ¬        F @ @À @         Parent    Close        ª   «   «   ¬         btn           form               ¯   ¶        E   @  \@ E  @  \ À  À      @  Á@  A @  @        util_auto_show_hide_form )   form_stage_main\form_rank\form_rank_main 	   nx_value    nx_is_valid    nx_execute    set_select_node_state    rank_7_BatType1        °   °   °   ²   ²   ²   ³   ³   ³   ³   ³   ´   ´   ´   ´   ´   ´   ¶         btn        
   rang_form               ¹   »        E   @  Á  Á  \@         nx_execute .   form_stage_main\form_helper\form_theme_helper    util_open_theme /   jhqb,jianghuzd02,wodezhanchang03,zhanchangjl04        º   º   º   º   º   »         btn                ¾   Ç        E   @  \ À À@ @À @A FÁA  @    ÆÀ Ë@ÂÜ    ËÂ ÜÀ EÁ  ÁA   @ Á ÃC \A      	   nx_value    gui    TextManager    Format_SetIDName    tips_battle_MaxScore    Format_AddParam    nx_int    Value    nx_widestr    Format_GetText    GetCursorPosition    nx_execute 
   tips_game    show_text_tip            ParentForm        ¿   ¿   ¿   À   À   À   À   Á   Á   Á   Á   Á   Á   Ã   Ã   Ã   Ã   Ã   Ä   Ä   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Ç         pbr           gui          text          x          y               Ê   Ì        E   @  Á  Á@ \@         nx_execute 
   tips_game 	   hide_tip    ParentForm        Ë   Ë   Ë   Ë   Ë   Ì         pbr                Ï   Ø        E   @  \ À À@ @À @A FÁA  @    ÆÀ Ë@ÂÜ    ËÂ ÜÀ EÁ  ÁA   @ Á ÃC \A      	   nx_value    gui    TextManager    Format_SetIDName    tips_battle_MaxScore    Format_AddParam    nx_int    Value    nx_widestr    Format_GetText    GetCursorPosition    nx_execute 
   tips_game    show_text_tip            ParentForm        Ð   Ð   Ð   Ñ   Ñ   Ñ   Ñ   Ò   Ò   Ò   Ò   Ò   Ò   Ô   Ô   Ô   Ô   Ô   Õ   Õ   ×   ×   ×   ×   ×   ×   ×   ×   ×   Ø         pbr           gui          text          x          y               Û   Ý        E   @  Á  Á@ \@         nx_execute 
   tips_game 	   hide_tip    ParentForm        Ü   Ü   Ü   Ü   Ü   Ý         pbr                à   é        E   @  \ À À@ @À @A FÁA  @    ÆÀ Ë@ÂÜ    ËÂ ÜÀ EÁ  ÁA   @ Á ÃC \A      	   nx_value    gui    TextManager    Format_SetIDName    tips_battle_MaxScore    Format_AddParam    nx_int    Value    nx_widestr    Format_GetText    GetCursorPosition    nx_execute 
   tips_game    show_text_tip            ParentForm        á   á   á   â   â   â   â   ã   ã   ã   ã   ã   ã   å   å   å   å   å   æ   æ   è   è   è   è   è   è   è   è   è   é         pbr           gui          text          x          y               ì   î        E   @  Á  Á@ \@         nx_execute 
   tips_game 	   hide_tip    ParentForm        í   í   í   í   í   î         pbr                ñ   L   E  E      Â  \@  À   @        À@À     A@ Á@ Þ  Å ÁA Ü  FB  Ì  FAB  Ì Â E  À \  	AAÃ E  ÆÁA  \  	AÃ E  ÆB  \  	AÁÃ E  ÆAB  \  	AÄ E  ÆAD  \  	AÄ E  ÆÁD  \  	AÅ E  ÆAE  \  	AÅ E  ÆÁE  \  	AÆ 	ÆÁ @ A ÆÁA B FBB A  AA  FGKÁÇÁ \AFGKAÈÆÈ ÆÁÈÆÁÂ\AFÉ GAI IE	  \A E Á	 \ A  À A      Á Ä Â  Á Å
  Ü ÂËBÊ@ ÜBýÊ ËÁJÜA Å AKÜ B D MÂÁÂ  Â'CË   À&D 
 ÌÃÁ UË @ Ä Â C Ì AD 
 ÌÄAÆÄ  C  Ì A Ä ÌBÆÄ  C  Ì A  ÌDBÆÄ  C  Ì AD  ÌDDÆÄ  C  Ì A  ÌÄDÆÄ  C  Ì AÄ  ÌDEÆÄ  C  Ì A  ÌÄEÆÄ  C  Ì AD  ÌAÆÄ  C  Ì A  ÌÄNÆÄ  C  Ì A  ÌDOÆÄ  C  Ì A  ÌÄOÆÄ  C  Ì A 
 ÌDPÆÄ  C  Ì A  ÌÄPÆÄ  C  Ì A  ÌDQÆÄ  C  Ì A  ÌÄQÆÄ  C  Ì A  ÌDRÆÄ  C  Ì A  ÌKÆÄ  C  Ì AÄ  ÌDKÆÄ  C  × FÊ BBÓ 	ÂS§BÓ 	BA¨BÔ 	ÂS§ D   B  S      util_get_form    nx_is_valid    table    getn        @           nx_int       ð?       @      @   lbl_score_all    Text    nx_widestr    lbl_score_side    lbl_score_dead    lbl_score_wrestle    lbl_count_kill       @   lbl_count_win       @   lbl_count_join       @   lbl_count_succeed_wrestle       @   rbtn_two_side    Checked    refresh_pbar 	   nx_value    gui    TextManager    Format_SetIDName    ui_battle_result    Format_AddParam    combobox_friend 
   InputEdit    lbl_result    Format_GetText    refresh_friend_combobox    common_array 
   nx_string    RemoveArray    textgrid_battle_info 	   ClearRow       1@      2@	   AddArray      À@	   AddChild    battle_name    battle_time 
   nx_double    battle_type    battle_is_win    battle_sort    battle_score    battle_live_point    battle_kill_count    battle_dead_count       "@   battle_queue_kill       $@   battle_max_equip       &@   battle_max_skill       (@   battle_boss_count       *@   battle_duration       ,@   battle_karma_id       .@   battle_karma_val       0@   battle_money    battle_help_kill    refresh_battlefield_grid    ani_connect    Visible  	   PlayMode    lbl_connect    util_show_form     E  ó   ó   ó   ó   ô   ô   ô   ô   ô   õ   ø   ø   ø   ø   ú   ú   û   û   þ   þ   þ   þ   þ   þ   þ   þ   þ   þ   þ                                                                                                            	  	  	  	  	  	  	                                                                                                          !  "  "  $  $  $  $  &  &  &  &  &  '  '  (  (  )  ,  ,  ,  ,  ,  .  .  .  .  .  .  0  0  0  0  0  0  0  0  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  3  3  3  3  3  3  3  3  4  4  4  4  4  4  4  4  5  5  5  5  5  5  5  5  6  6  6  6  6  6  6  6  7  7  7  7  7  7  7  7  8  8  8  8  8  8  8  8  9  9  9  9  9  9  9  9  :  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  ;  <  <  <  <  <  <  <  <  =  =  =  =  =  =  =  =  >  >  >  >  >  >  >  >  ?  ?  ?  ?  ?  ?  ?  ?  @  @  @  @  @  @  @  @  A  A  A  A  A  A  A  A  &  D  D  D  D  G  G  H  H  I  I  K  K  K  K  L        arg     D     form    D     param_count    D  
   score_all    D     gui a   D     common_array v   D     (for index)          (for limit)          (for step)          i          array_name          grid    D     battle_index    D     (for index)    6     (for limit)    6     (for step)    6     i    5  
   msg_index    5     array_name    5        FORM_BATTLEFIELD_RESULT    BATTLEFIELD_RESULT_INFO_COUNT    BATTLEFIELD_RESULT_ARRAY_INFO    BATTLEFIELD_RESULT_TYPE_SIDE     O     e   E  A  Á    \ Á  À A      ÁB A    ÁÁ Â @ B Á `KÃÂÀ  @ DAD \ ÀÄ Å ÆCÄ  Ü ÀÀÅÃ EÜ Ä FD EÄ  \ À  À _BøEÂ  \ À  ÁA EÂ  \ Â À @  À EÂ \ Â À @  ÀEÂ  \ Â À @  À FE IÂFE I FBF IÂFBF IÂ FF IÂFF I        nx_execute    util_functions    get_ini    nx_is_valid    FindSectionIndex    houselevels              p§@   GetSectionItemCount       ð?      ð¿   ReadString    r        util_split_string    ,    table    getn       @   nx_int        @    .A
   pbar_side    Maximum    Value 
   pbar_dead    pbar_wrestle     e   P  P  P  P  P  R  R  R  R  R  S  V  V  V  W  W  X  [  \  \  \  ^  ^  ^  ^  _  _  _  _  _  _  _  `  `  `  `  b  b  b  b  b  b  c  c  c  d  d  d  f  f  f  f  f  g  ^  l  l  l  l  l  m  p  p  p  p  p  p  p  p  q  t  t  t  t  t  t  t  t  u  x  x  x  x  x  x  x  x  y  |  |  }  }                          form     d      client_level     d      side_bf_level     d      dead_bf_level     d      wrestle_bf_level     d      level_rule_ini    d   
   sec_index    d   	   pbar_max    d      r_count    d      (for index)    7      (for limit)    7      (for step)    7      i    6   	   r_string     6      str_lst $   6      power_level -   6   
   level_max 0   6         BATTLEFIELD_RULE_INI_PATH       ©   J   E      \ Z@      E@    \ ÀÀ  Å     Ü Ú@      Ë AAA ÜÚ@      Å ÁAA Ü  B 	ÂB ÁB	ACB ÁBCA B ÁBÁCAA   ÀÁA EA  Á  À \ZA   FB FÁÂKÁÃÀ \AÁ FB  Ä  A Á FB  Ä A         nx_is_valid 	   nx_value    game_client 
   GetPlayer 	   FindProp    Name    nx_widestr 
   QueryProp    combobox_friend    OnlySelect    DropListBox    SelectIndex            ClearString 
   AddString    PartnerNamePrivate    nx_ws_equal        get_combobox_list     J                                                                                                          ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  £  £  £  £  £  §  §  §  §  §  ¨  ¨  ¨  ¨  ¨  ©        form     I      client 	   I      client_role    I      player_name    I      parent_name 2   ?         FRIEND_REC 
   BUDDY_REC     ¬  Ë   5   Å      Ü Ú@      Å     Ü Ú@      Ë@À @ ÜÚ@      ËÀ @ ÜÀÀ    Á  MÁ  B KÁ À  D  \  EÂ Á   @ \  Â Ä  @À B BB  BÁù  
      nx_is_valid    FindRecord    GetRecordRows               ð?   nx_widestr    QueryRecord    nx_int    DropListBox 
   AddString     5   ­  ­  ­  ­  ­  ®  ±  ±  ±  ±  ±  ²  µ  µ  µ  µ  µ  ¶  º  º  º  ¼  ¼  ½  Á  Á  Á  Á  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ç  Ç  Ç  Ç  Ç  È  È  È  È  Á  Ë  
   	   combobox     4      player     4      table_name     4      rows    4      (for index)    4      (for limit)    4      (for step)    4      i    3      friend_name #   3      friend_offline_state *   3         FRIEND_REC_NAME    FRIEND_REC_ONLINE    OFFLINE_STATE_ONLINE     Î  4   	     À    @      @@ Å     Ü Ú@      Å  Á  Ü   @ A        A  KAA \A KA \A AÁ   ÁÁ `A9D  À  UBÂ   À6Â @ AÃ  @ À4ËC AC ÜC ÁÃ  CC Á  CC ÁC  CC Á  CC ÁÃ  CC Á  CC ÁC  CE ÅÃ   Ü C  Â À Á  E  CF\ Z  @E CFÀ   \ @CFG AD    KÃG ÀÄ FHKDÈÀ \\C  KÂÅ  Ü  \ @ÃH	 ÉÊÊËÃJ @Ä À ÜC@ ÃG  AÄ Ä ÆHËDÈ	A Ü  C  @ÃG  AÄ Ä ÆHËDÈ	AE Ü  C  ÃG  A Ä ËÂE \  Ü   C   W@ @ÃG  AD Ä ÆHËDÈ	AÅ Ü  C  ÃG  A Ä ËÂE \  Ü   C  W@ @ÃG  AÄ Ä ÆHËDÈ	AE Ü  C  ÃG  A Ä ËÂE \  Ü   C  Ã Á Â À ÁD   C     ÚC    ÁÃ D    Ä KÄG ÀE EÅ  ÁÅ  AÆ  \ \D  _Æ  8      nx_is_valid    ParentForm 	   nx_value    common_array    gui 	   ClearRow    ClearSelect       ð?
   nx_string 
   FindArray 
   FindChild    battle_type 
   InsertRow       ð¿   SetGridForeColor        @      @      @      @      @      @       @   SetRowTitle    nx_widestr    battle_name    ini    get_mapid_section_index            ReadString    name        SetGridText    TextManager    GetText    battle_is_win    Create    Label 
   BackImage *   gui\language\ChineseS\battlefield\win.png 	   DrawMode 
   FitWindow    Align    Center    SetGridControl    ui_battle_wrestle_succeed    ui_battle_killenemy    battle_kill_count    ui_battle_help    battle_help_kill    ui_battle_dead    battle_dead_count    nx_function    ext_decode_date    battle_time      È@   .     	  Ï  Ï  Ï  Ï  Ï  Ð  Ó  Ô  Ô  Ô  Ô  Ô  Õ  Ø  Ø  Ø  Ù  Ù  Ù  Ù  Ù  Ú  Ý  Ý  Ý  ß  ß  à  à  â  â  â  â  ã  ã  ã  ã  ã  å  å  å  å  å  æ  æ  æ  æ  æ  æ  è  è  é  é  é  ë  ë  ë  ë  ë  ì  ì  ì  ì  ì  í  í  í  í  í  î  î  î  î  î  ï  ï  ï  ï  ï  ð  ð  ð  ð  ð  ñ  ñ  ñ  ñ  ñ  ó  ó  ó  ó  ó  ó  õ  õ  õ  õ  õ  õ  ø  ø  ø  ø  ø  ù  ù  ù  ù  ù  û  û  ü  ü  ü  ü  ü  ü  ü                                                      	  	  	  	  	                                                                                                                                                                              "  "  "  "  "  "  "  "  "  $  $  %  (  (  )  ,  ,  -  0  0  0  0  0  0  0  0  0  0  0  0  â  4        grid          battle_type          form         common_array         gui         (for index)          (for limit)          (for step)          i !        array_name &        battleType 1        row 6        battleName e     
   sec_index o   x      is_win         lbl          year ò        month ò        day ò           BATTLEFIELD_RESULT_INFO_COUNT    BATTLEFIELD_RESULT_ARRAY_INFO    GRID_TEXT_COLOR     BATTLEFIELD_RESULT_TYPE_WRESTLE    BATTLEFIELD_RESULT_TYPE_DEAD     7  w   v   F @ @  À   @      À À@      À  A @ ÆÀÁ   @ Â ÂÀÂ Â Ã @ÃÃ @ÃÀÃ @Ã Ä @Ã@Ä @ÃÄ @ÃÀÄ Â Å Â@Å ÂÅ Â ÀÅ À@      À  A @ ÆÀÁ  @ Â @ÃÀÂ @Ã Ã ÂÃ ÂÀÃ Â Ä Â@Ä @ÃÄ @ÃÀÄ Â Å Â@Å ÂÅ ÂÀ Æ À@   À  À  A @ ÆÀÁ  @ Â ÂÀÂ Â Ã ÂÃ ÂÀÃ Â Ä Â@Ä ÂÄ ÂÀÄ @Ã Å @Ã@Å @ÃÅ @Ã        ParentForm    nx_is_valid    rbtn_two_side    Checked    refresh_this_battle            refresh_battlefield_grid    textgrid_battle_info    lbl_kill_mizong    Visible     lbl_desc_kill_mizong    lbl_karma_id    lbl_desc_karma_id    lbl_karma_val    lbl_desc_karma_val    lbl_max_hit    lbl_desc_max_hit    lbl_wrestle_succeed    lbl_wrestle_help    lbl_desc_wrestle_succeed    lbl_desc_wrestle_help    rbtn_dead_mode    rbtn_wrestle_mode     v   8  :  :  :  :  :  ;  ?  ?  ?  ?  @  @  @  @  A  A  A  A  C  C  D  D  E  E  F  F  G  G  H  H  I  I  J  J  L  L  M  M  N  N  O  O  O  R  R  R  R  S  S  S  S  T  T  T  T  V  V  W  W  X  X  Y  Y  Z  Z  [  [  \  \  ]  ]  _  _  `  `  a  a  b  b  b  e  e  e  e  f  f  f  f  g  g  g  g  i  i  j  j  k  k  l  l  m  m  n  n  o  o  p  p  r  r  s  s  t  t  u  u  w        rbtn     u      form    u         BATTLEFIELD_RESULT_TYPE_SIDE    BATTLEFIELD_RESULT_TYPE_DEAD     BATTLEFIELD_RESULT_TYPE_WRESTLE     z          @ Å@  @  Ü  Á  @ A        ParentForm 
   nx_string    GetRowTitle    refresh_this_battle        {  }  }  }  }  }                  grid     
      row     
      form    
      str_battle_index    
             Ì   û      Á@   Å    Ü Ú@      Å     Ü Ú@      Å   Á  Ü A E Á \ 	AB E Á \ 	AAB E Á \ 	AB E Á \ 	AÁB E Á \ 	AC E Á \ 	AAC E Á \ 	AC E Á \ 	AÁC E Á \ 	AD E Á \ 	AAD E Á \ 	A  @ AKDÀ \Z   *FA  ËÁDE  \ B Ü   IFB  ËÁDE  \  Ü   IFAB  ËÁDE  \ Â Ü   IFB  ËÁDE  \  Ü   IFD  ËÁDE  \ B Ü   IFAD  ËÁDE  \  Ü   IKÁDÅ   Ü Â \ Á WÀÁÀÆÇËAÇ@ÜAÆÇËÇAÂ ÜAÆÇËÈÜ ÆÁB ÉËÁDE  \ B Ü À@ÀÈÀC FÇKÉÄ ÈÆ\	BÂD À  ÁB	  E	 ÂI\ ÂIÅ Ã Ü 	 A
  @  E \ ÇID
 Õ  E  \ ÇI
 ÕCC 	ÃÃD À  ÁÃ
   ÀFC ÇI E  \ DIFÃC  ËÃDE  \ D Ü   I  .   	   nx_value    common_array    nx_is_valid    gui    lbl_desc_this_score    Text    nx_widestr        lbl_desc_this_money    lbl_desc_kill_mizong    lbl_desc_max_hit    lbl_desc_fre_skill    lbl_desc_fre_weapon    lbl_desc_duration    lbl_desc_karma_id    lbl_desc_karma_val    lbl_desc_wrestle_succeed    lbl_desc_wrestle_help 
   FindArray 
   FindChild 
   nx_string    battle_score    battle_money    battle_boss_count    battle_queue_kill    battle_kill_count    battle_help_kill    battle_max_skill    TextManager    Format_SetIDName    Format_AddParam    255,221,209,197    Format_GetText    battle_max_equip      ÀX@     À[@   GetText    battle_duration    nx_int       N@        
   ui_minute    ui_seconds    battle_karma_id    group_karma_    battle_karma_val     û                                                                                                                                                                                                                       ¡  ¡  ¡  ¡  ¡  ¡  ¡  ¡  ¡  ¡  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  £  £  £  £  £  £  £  £  £  £  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¦  ¦  ¦  ¦  ¦  ¦  §  ©  ©  ª  ª  ª  ª  «  «  «  «  ¬  ¬  ¬  ¬  ¯  ¯  ±  ±  ±  ±  ±  ±  ²  ²  ²  ²  ³  ³  ³  ³  ³  ³  ³  ³  ¶  ¶  ¶  ¶  ¶  ¶  ·  ·  ·  ¸  º  º  º  ¼  ¼  ¼  ¼  ¼  ½  ½  ½  ½  ½  ½  ½  ½  ½  À  À  Á  Á  Á  Á  Á  Á  Á  Á  Á  Ä  Ä  Æ  Æ  Æ  Æ  Æ  Æ  Ç  Ç  È  È  È  È  È  È  È  È  È  È  É  É  É  É  É  É  É  É  É  É  Ì        form     ú      battle_index     ú      common_array    ú      gui    ú      array_name L   ú   	   taolu_id    ú   
   str_taolu    ú      weaponType ª   ú      all_second ¼   ú      time_minute ¿   ú      time_second À   ú   	   str_time Ã   ú   	   karma_id ä   ú         BATTLEFIELD_RESULT_ARRAY_INFO    weapon_type_table     Ï  ä        Å      Ü Ú@      Ë@@ Ü   @   ÁÀKÂ@ À  AC \A   AÃ C @    û    	      nx_is_valid    GetSectionCount       ð?   ReadString    map_id        ReadInteger    rule       ð¿        Ð  Ð  Ð  Ð  Ð  Ñ  Õ  Õ  ×  ×  ×  ×  Ø  Û  Û  Û  Û  Û  Ü  Ü  Ü  Ü  Ü  Þ  Þ  Þ  Þ  ß  ×  ã  ã  ä        ini           map_id        
   rule_type           section_count          (for index)          (for limit)          (for step)          i       
   sec_index          id          rule               ç  ì          A@    Ä     B   EÀ     \ Z   @ K A \@         nx_execute 	   util_gui    util_get_form    nx_is_valid    Close        è  è  è  è  è  è  è  é  é  é  é  é  ê  ê  ì        form             FORM_BATTLEFIELD_RESULT g   	   	   	                        !   $   '   (   )   .   2   5   8   ;   =   >   ?   @   A   B   C   D   E   F   H   H   J   W   W   M      Z         ¦   ¦      ¬   ©   ¶   ¯   »   ¹   Ç   ¾   Ì   Ê   Ø   Ï   Ý   Û   é   à   î   ì   L  L  L  L  L  ñ       O  ©  ©  ©    Ë  Ë  Ë  Ë  ¬  4  4  4  4  4  4  Î  w  w  w  w  7    z  Ì  Ì  Ì    ä  Ï  ì  ì  ç  ì        FRIEND_REC    f   
   BUDDY_REC    f      FRIEND_REC_NAME    f      FRIEND_REC_ONLINE    f      OFFLINE_STATE_ONLINE    f      OFFLINE_STATE_NONE 	   f      BATTLEFIELD_RESULT_ARRAY_INFO 
   f      BATTLEFIELD_RESULT_INFO_COUNT    f      FORM_BATTLEFIELD_RESULT    f      BATTLEFIELD_RESULT_TYPE_SIDE    f      BATTLEFIELD_RESULT_TYPE_DEAD    f       BATTLEFIELD_RESULT_TYPE_WRESTLE    f      CLIENT_SUBMSG_REQUEST_LOOK    f      BATTLEFIELD_INI_PATH    f      KARMA_GROUP_INI_PATH    f      BATTLEFIELD_RULE_INI_PATH    f      weapon_type_table     f      GRID_TEXT_COLOR !   f       