LuaQ  j   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_drawings.lua           b      A@  @    A  @    AÀ  @    A  @    A@ @    A @    AÀ @    A  @    A@ @  AÀ   Á@  AÁ  ÁA  AÂ ¤   ¤B  B ¤   ¤Â     Â ¤  ¤B        B ¤  ¤Â Â ¤     ¤B B ¤  ¤Â Â ¤  ¤B         B ¤  ¤Â   Â ¤  ¤B    B ¤      ¤Â Â ¤ 	 ¤B B	 ¤ 	 ¤Â Â	   (      require 	   util_gui    custom_sender    util_functions    tips_func_equip    share\client_custom_define E   form_stage_main\form_relation\form_relation_guild\sub_command_define 6   form_stage_main\form_guildbuilding\sub_command_define 9   form_stage_main\form_guildbuilding\guildbuilding_getinfo B   form_stage_main\form_relation\form_relation_guild\form_guild_util       ð¿              ð?       @      @      @   main_form_init    on_main_form_open    on_main_form_close    on_btn_11_click    on_btn_12_click    on_building_left_down %   on_btn_use_guild_capital_get_capture &   on_btn_use_guild_capital_lost_capture    on_btn_contribute_click    on_btn_use_guild_capital_click    on_btn_faster_click    on_btn_get_capture    on_btn_lost_capture    add_condition_info    final_cost    show_info_change    add_close_condition_info    recv_guild_drawings_data    recv_guild_building_data    update_upgrading    custom_request_darwings !   custom_request_darwings_building +   custom_request_upgrade_darwings_contribute +   custom_request_upgrade_darwings_accelerate            #        	@@	@@        Fixed     check        !   "   #         self                &   B     $   E   @  \ ÀÀ ÆÀ@ À  A	 Á ÆA À  A	ÀA @BB @BÀB @B	@C	ÀC	@D	@D	@Ä	@D	@Ä	@DÀE @B F @B@F FÀ @      	   nx_value    gui    Left    Width        @   Top    Height    groupbox_level5    Visible     groupbox_upgrading    groupbox_contribute    cur_buildid    5_0    cur_buildid_main_type       @   cur_buildid_sub_type            cur_buildid_level    cur_build_state    stopLeftTime    coolLeftTime    upgrade_time    groupbox_right    btn_12    btn_11    custom_request_darwings     $   '   '   '   *   *   *   *   *   +   +   +   +   +   -   -   .   .   /   /   2   3   4   5   6   7   8   9   <   <   =   =   >   >   A   A   B         self     #      gui    #           E   O         E   @  \   À      @ÀÀ @   À  @ @ Á@    @    À   @ @ ÁÀ   @    Á@  EÁ @      	   nx_value Y   form_stage_main\form_guildbuilding\form_guild_build_banghuicangku_contributemoneyconfirm    nx_is_valid    Close    nx_destroy    nx_set_value    nx_null F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    nx_execute 
   tips_game 	   hide_tip    form         F   F   F   G   G   G   G   G   H   H   I   I   I   J   J   J   J   J   L   L   L   M   M   M   M   M   N   N   N   N   N   O         self           child               R   ]       F @ @  ÆÀ  Å@    Ü À     ÀÀ @A	AÀÁ @A        ParentForm    nx_int    cur_build_state    groupbox_right    Visible     btn_12        S   U   U   U   U   U   U   U   U   W   Z   Z   [   \   \   ]         self           form             DRAWINGS_STATUS_CLOSE     `   e        F @ @À À@	À@ Á @A        ParentForm    groupbox_right    Visible     btn_11        a   b   b   c   d   d   e         self           form               h   Ï    ø   E   @  \   ÁÀ    Å    Ü Ú@      Æ@AÆÁÚ@  @ÆÀAÆÁÚ@  @ Æ@AÉ BÅ@ BÜ A D     Å   Á Ü ÃA  Á   AÅÀ    A ÜÚ@   Ä  À Å@ Ü@ ÆDÉÀDÆ EÉÀDÆ@EÉ BÆE FAÆ KÆÁÁ \  É Æ G A  É ÅÀ ÁAÜ@ Æ@AÉÀD  Æ H D É Æ H ÁH É Æ H I É Å@ ÁH Ü A D  À 	Æ@EÉÀDÆ EÉÀDÆDÉ BÅ@	   Ü@ Å	   Ü@ Æ G FAÆ KÁÉÁ
 B D  \    É Å  AÆ ÁIA
 Å
 BHÜ ÁÜ  EE \ 	A  ÅÀ
 D A ÜA EA FË\   EA Á \ @@H EA AÌ\ 	AH EA ÁË\ 	AH FM 	AH FM 	A	 @ A A FÁH  EA  \  ÀAE	ÁDE	ÁDD	B FAÆ KÁÉÁA
 
 FBH Õ\  FE À  IFG ÆAÆ ËÁÉA
 B Ä  Ü    IEA	  \A   A FB EA  \ @A A D	ÁDE	ÁDAE	BEE AÆ FÂ \  	AGE  \ 	AÁ FÁAA AA	ÁD  Á FD A   8   	   nx_value    gui    util_get_form F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    nx_is_valid    btn_11    Visible    btn_12    nx_int    cur_build_state    timer_game    UnRegister    nx_current    on_update_upgrading    nx_find_custom    buildingid    add_close_condition_info    groupbox_level5     groupbox_upgrading    groupbox_contribute    lbl_buildingname    Text    nx_widestr    TextManager    GetText    ui_guild_jiguan_weikaifang    mltbox_building_level 	   HtmlText        on_btn_12_click    ParentForm    cur_buildid    cur_buildid_level 
   cur_level    cur_status    final_cost    show_info_change    GetFormatText    ui_guild_drawings_level    ui_guildbuilding_drawings_ 
   nx_string    util_split_string    _    table    getn        @   cur_buildid_main_type       ð?   cur_buildid_sub_type    stopLeftTime 	   end_time    coolLeftTime 
   cool_time !   custom_request_darwings_building     ø   i   i   i   j   j   j   j   k   k   k   k   k   l   o   o   o   o   o   o   o   o   p   p   t   t   t   t   t   t   t   t   u   u   u   v   v   v   v   v   v   y   y   y   y   y   y   z   z   |   |   ~   ~                                                                                                                                                                                                                                                £   £   £   £   ¥   ¥   ¥   ¥   ¥   ¥   ¥   ¥   ¥   ¥   ¥   ¦   ¦   ¦   ¦   ¦   §   §   §   §   §   ª   ª   ª   «   «   «   ®   ®   ®   °   °   °   °   °   °   °   °   ²   ²   ³   ³   ´   ´   µ   µ   µ   µ   µ   µ   µ   µ   µ   µ   ¶   ¶   ¶   ¶   ¶   ·   ·   ·   ·   ·   ·   ·   ·   ·   ·   ·   ¹   ¹   ¹   º   ¾   ¾   ¾   ¾   ¾   ¾   ¾   ¾   À   À   Â   Â   Ã   Ã   Ä   Ä   Å   Å   Å   Å   Å   Å   Å   Å   Æ   Æ   Æ   Æ   Æ   È   È   È   É   É   Ê   Î   Î   Î   Ï         self     ÷      gui    ÷      form    ÷      game_timer "   (      building_name }         str_lst    ÷      building_name ½   Ñ         DRAWINGS_STATUS_UPGRADING    DRAWINGS_STATUS_CLOSE    MAX_BUILDING_LEVEL     Ò   Ù     	   E      \ Z@      E@    ÁÀ   EA  \   FÁA MÂAB Á    \@         nx_is_valid    nx_execute 
   tips_game    show_text_tip    nx_widestr 
   util_text    ui_use_guild_capital_tips    AbsLeft       T@   AbsTop                Ó   Ó   Ó   Ó   Ó   Ô   ×   ×   ×   ×   ×   ×   ×   ×   Ø   Ø   Ø   Ø   Ø   ×   Ù         btn                Ü   â        E      \ Z@      E@    ÁÀ     \@         nx_is_valid    nx_execute 
   tips_game 	   hide_tip        Ý   Ý   Ý   Ý   Ý   Þ   á   á   á   á   á   â         btn                å   õ    
   E   @  \ @ ÅÀ    Ü Ú@      Å  AAÜ  D        Å ÁA FB AB ÆB @ ÂBE Ü@     	   nx_value    gui    ParentForm    nx_is_valid    nx_int    cur_build_state    show_contribute_form    Max    Value    config    contribute    cur_buildid    TYPE_DRAWING        æ   æ   æ   è   ê   ê   ê   ê   ê   ë   ï   ï   ï   ï   ï   ï   ï   ï   ð   ô   ô   ô   ô   ô   ô   ô   ô   ô   õ         btn           gui          form             DRAWINGS_STATUS_CLOSE     ø          F @ @  À   @        ÆÀ@ A Í AA FÁ Á @        ParentForm    nx_is_valid #   show_contribute_guild_capital_form    Max    Value    config    cur_buildid    TYPE_DRAWING        ù   û   û   û   û   û   ü                                   btn           form                     	5   E   @  \    Á   ÅÀ    Ü Ú@  ÀÅ  A A   Â   Ü  ÅÀ   @ Ü@Æ B Æ@ÂÁÂ CFCAAC ÁÂ ÁCFÁCAAC DA ÄÄ AA  Á Á ÀEÀ  À A     	   nx_value    gui C   form_stage_main\form_guildbuilding\form_guild_build_upgrade_faster    nx_is_valid    nx_execute 	   util_gui    util_get_form    nx_set_value    ParentForm    cur_buildid    Left    Desktop    Width        @   Top    Height 
   ShowModal    Visible    Fixed    nx_wait_event     ×A    form_guild_build_upgrade_faster    ok +   custom_request_upgrade_darwings_accelerate     5                         	  	  	  	  	  	  	  	  
  
  
  
                                                                    btn     4      gui    4      form    4      id    4      result .   4      capital .   4              B    e   F @ @  Á   ÅÀ     A ÜÚ@      Æ A ÀÀAÅ@ A E  \ Ü  À ÅÀ   Ü Ú    Å  A A  ÆÁC D AB B À Ü@Å Á Ü ÅFAEÁ À   @ ÁEÅ F Ü B AB  ÆÆ ËÁÆA  ÅB   Ü   UÜÂ @    FÂÇKÈÁB \  E  \  ÆÂÈ FÉKBÉÅ   Ü C \B FÉÉIÂII Å  A A
  Ü@   )      ParentForm    get_global_arraylist &   form_guildbuild_upgrade_2_get_capture    nx_find_custom    config 	   ConfigID    IsShowAmount       ð?	   ItemType    get_prop_in_ItemQuery 
   nx_string    nx_is_valid    nx_execute 
   tips_game    show_goods_tip    AbsLeft    AbsTop       @@	   nx_value    gui    Desktop    equip_tips_new    string    sub    Name       ð¿   groupbox_contribute    Find 	   lbl_num_ 
   nx_number    nx_widestr    TextManager    GetText 
   ui_Number    :    Text    mltbox_left    AddHtmlText    Height       >@	   hide_tip     e   !  "  "  "  $  $  $  $  $  $  %  (  (  +  -  -  -  -  -  -  -  /  /  /  /  /  1  1  1  1  2  2  2  2  2  1  3  3  3  4  5  6  6  6  6  6  7  7  7  7  7  7  7  7  8  8  8  8  8  8  8  8  8  8  9  9  9  9  9  :  :  :  :  :  :  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  <  <  <  <  <  >  @  @  @  @  @  B  	      self     d      form    d   
   item_data    d      gui '   ^   
   form_main (   ^   
   equip_tip )   ^      i 6   ^      lbl_obj @   ^      Text R   ^           D  G       F @ @  Á  Á  @ @         ParentForm    nx_execute 
   tips_game 	   hide_tip        E  F  F  F  F  F  G        self           form               J     'æ  Å   A  Ü   A   E  Á  \  ÆAÁËÁAÂ Ü  Å  Ü  AB  ËÂ@   Ü ÂÂCFBÃNÃÃÆÂÃÄ  À  EC FÄ \ ÃÄÅC ÆÄ  Ü  @ E D \ @À	 EÄ  \ @EE D \ @EEÄ D \ @EE D \ @EA  Á `DNÅD
MÆ
FE@EE E \ @E_ýÏF  ÏÆ @ E D \  À
 FDÁKÁÁÄ \  E  \ DE DÁA	E \   À  Å   Ü  @ E  \ A	Ä Á E @ Å   Ü  @ 	 E  \ A	È @E DÁA	Å \   Á  U  W  @ ÆDÁËÁ	AÅ Ü  Å  Ü UÄ	 ÆDÁËÁ	A	 Ü  Å   Ü  @ E  	\  ÁE	  	ÆIÉÊÆIÅB
J
ÉÆJÅDÉÆJÅBÉÆJÉÆJÅBÉÆJÉÄKÆJÉDLÆLÅDÉÆLÉÆLÅBÉÆLÉDLÅ EÁÅL
 ÆÅB Ü   FEÁKÅÌ
Á   \   FEM À	 Å Æ Ü  @ 
 IEÅ  ÁE   \  À  Å  
Ü  A  @(E DÁA	 \   Á  U  W  @ ÆDÁËÁ	AE Ü  Å  Ü UÄ	 À  Å  Ü Á	 À   ÄÅÄ
FÎÅÄ
ÍÅÆÅÆÄ
À@E FÁA  \    Á  ÁÆ  @     GO Á  À ÇOPG ÅÇ  
Ü ÇE  \ Z  EÇ Ç  ÀÇ\ 	G¡		Ç		GLFÇOKÐÁ È @
 Õ\ À    À IIÇIIGLÇOPH EÈ 
\ HÁÇ È @ Õ	ÇIÇ @  HÉ NÆMÅLÉÂFI	 EÉ 	 \ @	É NÆLÉÂFI	 @	ÕG	ÆÉB			ÆÉB		Iù @ 	GL£IGL£GL£à@ D Á `FÅOKÐ
ÁE Æ EÆ  Õ\ À
     IR£ÅOP EÆ Æ \ Æ ÅÆ  Å   Ü Ú    R£ÆÅOËÐAF Æ ÅÆ  UÜ @     ÉR£_DôE  ] ^    I   	   nx_value    gui F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    GuildbuildingManager    nx_widestr    TextManager    GetText    ui_shenghuo0005         <BR>    GetGuildDrawingsLevelInfo       @     Lí@      @      @       @   GetGuildDrawingsItemsInfo    table    getn       @   nx_int               ð?
   nx_string    CapitalType0    CapitalType1        @   19308    -    ui_offline_form_jinbi     :     nx_execute    util_functions    trans_capital_string       "@   19307    ui_silvermoney    :    pbar_1    Maximum       Y@   Value    btn_capital    config    num    Max    contribute       ø?   Enabled    btn_use_guild_capital    GetFormatText    ui_gc_money    lbl_pbar_text    Text    /    19309    19306 
   ItemQuery        nx_is_valid    GetItemPropByConfigID    Photo    groupbox_contribute    Find    btn_    NormalImage    nx_resource_path    btn_clone_ 	   lbl_num_    Visible    i      æ  L  L  L  N  N  N  Q  Q  Q  T  T  T  T  T  T  T  T  T  T  T  T  T  W  W  W  W  Z  Z  ]  ]  `  c  f  f  f  f  g  g  g  g  i  k  k  k  k  m  m  m  m  m  m  m  m  o  p  p  p  p  q  r  r  r  r  s  t  t  t  t  u  v  v  v  v  w  y  y  z  z  z  z  {  {  {  {  |  }  }  }  }  ~  z                                                                                                                                                                                            ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¥  ¥  ¨  ¨  ¨  ¨  ¨  ©  ©  ©  ª  ª  ª  «  «  ¬  ¬  ¬  ­  ­  ®  ®  ±  ±  ±  ²  ²  ³  ³  ³  ´  ´  ¶  ¶  ¶  ¶  ¶  ¶  ¶  ·  ·  ·  ·  ·  ·  ·  ¹  ¹  ¹  ¹  ¹  ¹  ¹  ¹  ¹  ¹  ¹  ¹  »  »  »  »  »  ½  ½  ½  ½  ½  ½  ½  ½  ½  ½  À  À  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Ä  Ä  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Å  Å  Å  Å  Å  É  É  É  É  É  É  É  Ë  Ë  Ë  Ë  Í  Í  Í  Î  Î  Î  Ï  Ï  Ð  Ð  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ô  Ô  Ô  Õ  Ö  Ö  Ö  Ö  Ö  ×  ×  ×  ×  ×  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ü  Ü  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Ý  Ý  Ý  Þ  ß  à  á  ä  ä  ä  ä  ä  ä  ä  ä  æ  æ  æ  æ  æ  ç  è  é  ê  î  î  î  î  î  î  î  î  ï  ï  ï  ï  ï  ð  ñ  ó  ó  ó  ó  ô  ô  ô  ô  ô  ô  ô  ô  ô  ô  ô  õ  õ  õ  õ  õ  õ  õ  ö  ö  ö  ö  ÷  ÷  ÷  ÷  ó  ú  ú  ú  ú  û  ü  ý  Ë                                      	  	  	  	  	  	  	  	  	  	  	  
  
  
  
  
                                            8      buildingid     å     level     å     now_goods_list     å     gui    å     form    å     guildbuilding_manager 	   å  
   condition    å     upgrade_info    å     upgrade_time    å  
   cool_time    å     remove_type    å     gold     å  
   item_list $   å     size (   å     count )   å     goods_size -   å     index 6   \      (for index) O   [      (for limit) O   [      (for step) O   [      i P   Z   	   head_str p         ui_gold v      
   gold_text          silver    å  	   head_str      
   ui_silver µ     
   cur_money é        max_silver ð        silver_text     	   head_str   ¯     (for index) 1  ¯     (for limit) 1  ¯     (for step) 1  ¯     i 2  ®     config 5  ®     num 8  ®     contribute :  ®     str_config B  ®     item_query E  ®  
   PhotoPath F  ®     btn_obj X  ®  
   btn_clone p  ®     lbl_obj   ®     Text   ®     (for index)   §     (for limit)   §     (for step)   §     j   ¦     (for index) ²  á     (for limit) ²  á     (for step) ²  á     k ³  à     btn_obj »  à  
   btn_clone Ì  à     lbl_obj Ú  à        REMOVE_FROM_PLAYER_NONE    REMOVE_FROM_PLAYER_GOODS    REMOVE_FROM_PLAYER_CAPITALTYPE       K    [   E   @  \   ÁÀ  Á  AÁ  Á  À   ÁBÁ A @ ÆÂAÌÀËÂ FA Ü C B@ OÃB@ À  CÄÂC	ÎÄÂÍÁ	ÆÄE C
@ 	Å ÅÀ E DÀ 	 LÁ
 @D@ Á D  LÁùó  ÁÁ  ÆE  FÂEKÆÁB  \   ÉÆF  @ ÉÆÁF  @  ÉÆG  AB  ÉÆG ËÁÇÜA       	   nx_value    GuildbuildingManager       @              ð?   GetGuildDrawingsLevelInfo    cur_buildid       "@   GetGuildDrawingsItemsInfo    table    getn       @       @   string    find    _    sub    kuangshi_1    tre_1    gui    lbl_all_money    Text    nx_widestr    TextManager    GetFormatText    ui_gc_money    lbl_all_or    lbl_all_tr    lbl_nextlevel        mltbox_new_info    Clear     [                 !  !  !  !  #  #  #  #  $  $  &  &  &  &  '  '  '  '  (  )  )  *  *  *  *  ,  ,  ,  -  -  -  /  /  /  /  /  1  1  2  2  2  2  2  2  5  5  6  6  8  8  9  *  !  @  @  @  A  A  A  A  A  A  A  A  A  D  D  D  D  D  G  G  G  G  G  I  I  I  I  I  J  J  J  K        form     Z      guildbuilding_manager    Z   	   MaxLevel    Z      final_money    Z      kuangshi_1_num    Z   
   tre_1_num    Z      (for index) 
   <      (for limit) 
   <      (for step) 
   <      i    ;      upgrade_info    ;   
   item_list    ;      size    ;      count    ;      (for index)    ;      (for limit)    ;      (for step)    ;      i     :      config #   :      num &   :      x +   :      y +   :      type 3   :      gui ?   Z           N       E   @  \ @ ÆÀ@ A LAAA ÁAA B ÁAA AB ÁAA  ÆÁÂ ËÃAB  ÆÂC  UÜ  ÆD  @  ÉÆD  FÂÂ KÃÁ C @  EC \ \    ÉÅ   @ÜA ÂE À Á B BF E ÂÂ C E  \   \  	BÂF E ÂÂ GC E  \ C\  	BB @ EB   \ @ÀG E ÂÂ GC E \ C\  	BB @ EB Â \  @  A  KBHÀ  \ Â Å ÆÂÈ Ü À  BÁÁB	  @  Õ FÃÂ KÇÀ\  FB KÃÅÅ   Ü  \C EC \ C Ä    KCHÀ \ @Â E FÃÈ\ @  BÁAC	  À  U ÆÃÂ ËÇ@Ü    CB ÃE @  A C  Å	   @ Ü   ÆB ËÃÅE  \  ÜC ÅC  Ü D D    ÀÅ 	 @ À Ü  DB ÄE À Á D  Â	 @ À  FB KÂÅÅ   Ü  \B FÂF  ÆÂÂ ËÇAC  À  UÜ  IEB \ B Ä    EÂ	  À \  FBB KÂÅÅ   Ü  \B FG  ÆÂÂ ËÇAC  À UÜ  I    (   	   nx_value    gui    cur_buildid_main_type    cur_buildid_sub_type    cur_buildid_level       ð?   mltbox_build_desc    Clear    mltbox_info    mltbox_new_info    nx_widestr    TextManager    GetFormatText    ui_guildbuilding_drawings_ 
   nx_string    cur_buildid    lbl_buildingname    Text    mltbox_building_level 	   HtmlText    ui_guild_drawings_levelup    nx_int    get_building_content    AddHtmlText       ð¿   lbl_building_name    ui_guild_drawings_02    lbl_curlevel    GetText    ui_guild_drawings_level_    lbl_nextlevel            GuildbuildingManager    GetZhenFaInfo    table    getn        @   ui_guildbuilding_zhenfa_    get_building_zengyi    get_building_level_info_desc       O  O  O  P  Q  R  S  T  T  T  U  U  U  V  V  V  X  X  X  X  X  X  X  X  X  X  Y  Y  Y  Y  Y  [  [  [  [  [  [  [  [  [  [  [  [  [  [  ]  ]  ]  ]  ^  ^  ^  ^  ^  ^  ^  `  `  `  `  `  `  `  `  `  `  `  b  b  b  b  b  b  b  b  b  b  b  b  c  c  c  c  c  c  c  c  d  d  d  d  d  d  d  d  d  d  d  d  g  g  g  g  g  g  g  g  j  j  j  m  m  m  m  n  o  o  o  o  o  o  p  r  r  r  r  r  s  s  s  s  s  s  t  t  t  t  t  t  t  v  v  v  v  v  v  v  v  w  w  w  w  w  y  z  z  z  z  z  z  {  }  }  }  }  }  ~  ~  ~  ~  ~  ~  ~                                                                                                                                                                                                                      form          gui      
   main_type      	   sub_type         level         next_level         building_name         bulid_desc 1        gb_manager n   Ø      infos r   Ø      id s   Ø      str    Ø      zhenfa_wstr    Ø      str ¦   Ø      zengyi »   Ø      zengyi Ñ   Ø      bulid_desc Þ           MAX_BUILDING_LEVEL       Ì     ]      A@   E     \ ÀÀ @AÀÀ ÀA Â Â Â ÀÁ Â ÀA Â ÀA Â Ã Â  Ä@Ä Â@Ä ÀA@Ä ÀA@Ä  ÄÄ Å  A Ü ÀÀ Á Á  ÀÆ AF EÂ \ BÅ   Ü Ú  @ ÄÇÆÆ ËAÆAÂ Â À UÜ @   @ÉÄÉÈÉÁÁÉÁAÉÁAÉÃÆ BFB ÅÂ  Ü ÂE  \ Z   	ÄE B \ 	Bò  "   	   nx_value    gui F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    pbar_1    Maximum       Y@   Value            btn_capital    config    CapitalType1    num    Max    contribute       ø?   Enabled     btn_use_guild_capital    lbl_pbar_text    Text    nx_widestr    0/0       @      ð?   groupbox_contribute    Find    btn_ 
   nx_string    nx_is_valid    NormalImage    icon\prop\prop845.png    btn_clone_     	   lbl_num_     ]                   ¢  ¢  £  £  ¤  ¤  ¥  ¥  ¦  ¦  §  §  ¨  ¨  «  «  ¬  ¬  ­  ­  ®  ®  °  °  °  °  °  ³  ³  ³  ³  ´  ´  ´  ´  ´  ´  ´  ´  µ  µ  µ  µ  µ  ¶  ·  º  º  º  º  º  º  º  º  »  »  »  »  »  ¼  ½  ¾  ¿  À  Á  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Æ  Ç  Ç  Ç  Ç  ³  Ì  	      gui    \      form    \      (for index) &   \      (for limit) &   \      (for step) &   \      i '   [      btn_obj /   [   
   btn_clone >   [      lbl_obj Q   [           Ï  #   ¬   E   @  Â   \  À   @      À  Á   Ë@Á A Ü  @ A      Á A A Å ÆÁÂ   Ü Ð ÅA  Ü WÀ     ÁBÀ   Á   A àÁÆB  KCÁÁC  @ Õ\CÁÄ E \ DÅ   Ü Ú   Å    Ü Ú  ÀÆC IÃÆC ÃLÂC ILÂÆC IÃÆC ÃLÂÆC IÃÆC ÃLÂÅ IÃÅ ÃLÂËCÁAD  À UÜ  @   @Ä E  \  ÉD FÄ ED   \ @À FÄFKÇÁD \  IÄ E \  IÄ E \  IÄ E \  IÄ E \  IÉI @ E DÉ \ @ 	 @D ßà  '      util_get_form F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    nx_is_valid 	   nx_value    gui    Find    groupbox_buildings       @      ð?   nx_int    table    getn            pic_building_ 
   nx_string    btn_    buildingid 
   cur_level    cur_status 	   end_time 
   cool_time    pic_    Image $   gui\guild\guildpaper\guildbuilding_    .png 	   HintText    nx_widestr    TextManager    GetText    ui_guild_jiguan_weikaifang    NormalImage    gui\guild\guildpaper\    _3.png    FocusImage 
   PushImage    DisableImage 2   gui\guild\guildpaper\guildbuilding_weikaifang.png    cur_buildid    on_building_left_down     ¬   Ð  Ð  Ð  Ð  Ñ  Ñ  Ñ  Ñ  Ñ  Ò  Õ  Õ  Õ  Ø  Ø  Ø  Ú  Ú  Ú  Ú  Ú  Û  ß  à  ã  ã  ã  ã  ã  ã  ã  ã  ã  ã  ã  ã  ä  è  è  è  è  è  ê  ê  ê  ê  ë  ì  î  î  î  î  î  î  î  ï  ï  ï  ï  ï  ï  ï  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ó  ó  ô  ô  õ  ÷  ø  ù  ú  ü  ü  ý  ý  þ                        
  
  
  
  
  
  
                                                                                                                                        ê  #        arg     «      form    «      gui    «      building_control    «      arg_group_num    «   
   arg_index    «      count *   «      (for index) -   «      (for limit) -   «      (for step) -   «      i .   ª      id /   ª      level 0   ª      pic_building 7   ª      btn_building >   ª   
   pic_level g   ª         DRAWINGS_STATUS_CLOSE     &  l      E   @  \   ÁÀ    Å    Ü Ú@      Å@ ÆÁ   Ü ÀÁ     FAB  E ÁA \  ÆÁB Å   Ü ÀCÃÁCÃDAÄ ÆÁÄ ËÅAB  ÆE UÜ  ÆÁE @  ÉÆAF FÂÄ KÅÁÂ  D   \    ÉÅ   ÜA    Ä  À	CÃDÃÁCAÄ  ÁA  ËGFEÂBÜ ÈBH H	ÉHFÂGIMÂGONÉ	B  AÂ	  KJÁ	 C
 E
 \ Ã
 À D
 AD
 \B    Á  AB à ÍÂA ßÁþÅA EFÂB ÜA ÆDÉÃÆÁCÉÃÆCÉAÄ  .   	   nx_value    gui    util_get_form F   form_stage_main\form_relation\form_relation_guild\form_guild_drawings    nx_is_valid    table    getn        @
   nx_string       ð?   nx_int    cur_buildid_level    groupbox_contribute    Visible     groupbox_upgrading    groupbox_level5    nx_widestr    TextManager    GetFormatText    ui_guildbuilding_drawings_    cur_buildid    lbl_buildingname    Text    mltbox_building_level 	   HtmlText    ui_guild_drawings_level    final_cost    GuildbuildingManager    GetGuildDrawingsLevelInfo    upgrade_time       @     Lí@   pbar_upgrading    Maximum       Y@   Value    stopLeftTime    timer_game 	   Register       ð¿   nx_current    update_upgrading       @   add_condition_info        '  '  '  (  (  (  (  )  )  )  )  )  *  -  -  -  -  /  /  1  4  4  4  5  5  5  8  8  8  8  8  8  8  8  :  :  ;  ;  <  <  =  =  =  =  =  =  =  =  =  =  >  >  >  >  >  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  A  A  A  C  F  F  F  F  F  H  H  I  I  J  J  M  M  M  P  P  P  P  S  S  S  U  U  V  V  V  V  V  V  V  V  X  X  X  Y  Y  Y  Y  Y  Y  Y  Y  Y  Y  [  _  a  a  a  a  b  b  b  a  f  f  f  f  f  i  i  j  j  k  k  l        arg           gui          form          argSize          buildingid          upgrade_status          building_name 2   F      guildbuilding_manager T   s      upgrade_info X   s      game_timer h   s      now_goods_list t         (for index) w   |      (for limit) w   |      (for step) w   |      i x   {         MAX_BUILDING_LEVEL    DRAWINGS_STATUS_UPGRADING     o  }    )   F @ @@ M  @ O NÀ À  À   ÅÀ  A AAÜ   ÁÀ  Ë BEA \  À  Ü@ÅÀ C Ü@ À A @@@ @	C Å  A FA@  Ü  À        upgrade_time    stopLeftTime       Y@   nx_int    pbar_upgrading    Maximum 	   nx_value    timer_game    UnRegister    nx_current    update_upgrading !   custom_request_darwings_building    cur_buildid    Value    lbl_left_time    Text    nx_widestr    transform_time     )   p  p  p  p  p  p  r  r  r  r  r  r  r  r  r  s  s  s  t  t  t  t  t  t  w  w  w  w  y  y  z  z  z  {  {  {  {  {  {  {  }        form     (      value    (      game_timer                            A@   E     \ Z@  @ AÀ  ^  K A Å@  Ü A EÁ  \@       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD    SUB_CUSTOMMSG_REQUEST_DRAWINGS                                                    game_visual                        E   @  \   À   @  @ À     Á A E  EA Á \  À   @    	   	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD (   SUB_CUSTOMMSG_REQUEST_DARWINGS_BUILDING 
   nx_string                                                          buildingid           game_visual                        Å   A  Ü   @ A  @ Á   ÁA Å  ÅA Â Ü  @   E  \ B À  A    
   	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD '   SUB_CUSTOMMSG_REQUEST_UPGRADE_DARWINGS 
   nx_string 	   nx_int64                                                                      buildingid           resid           resnum           game_visual                  §    
      Á@   Å    Ü Ú@  @ ÁÀ  Þ  Ë AEA  \ A ÅÁ  Å    Ü B @  Ü@    
   	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD 2   SUB_CUSTOMMSG_REQUEST_ACCELERATE_UPGRADE_DARWINGS 
   nx_string 	   nx_int64        ¡  ¡  ¡  ¢  ¢  ¢  ¢  ¢  £  £  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  §        buildingid        	   moneynum           game_visual           b                     	   	   	   
   
   
                                                                              #       B   &   O   E   ]   ]   R   e   `   Ï   Ï   Ï   Ï   h   Ù   Ò   â   Ü   õ   õ   å     ø       B     G  D          J  K        N  Ì    #  #  Ï  l  l  l  &  }  o              §     §  
      DRAWINGS_STATUS_MAX    a      DRAWINGS_STATUS_INIT    a      DRAWINGS_STATUS_CONTRIBUTE    a      DRAWINGS_STATUS_UPGRADING    a      DRAWINGS_STATUS_CLOSE     a      REMOVE_FROM_PLAYER_ALL !   a      REMOVE_FROM_PLAYER_NONE "   a      REMOVE_FROM_PLAYER_CAPITALTYPE #   a      REMOVE_FROM_PLAYER_GOODS $   a      MAX_BUILDING_LEVEL %   a       